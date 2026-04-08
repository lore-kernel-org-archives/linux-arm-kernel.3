Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB3EFD5F87
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0A6E1HoM+eWYezrUsX8ZMUbo89h+oNPxle4hlb/s5Yg=; b=rKAF7ZrrYn2V8nU2hse/Uc3E+u
	pQAdzmsDfKbpCteCAbuPerEcyXWRuejk83icWRdewp4JvVNBE1hqfL1PJma6SZewQLmEAi6svB/Q1
	wvWP579/CALLafOZpkXExbuB7fOgScB3xBxY8qMmKqDgPew02V1aDLf5sSGi5ahmGaJKicJ19YgCO
	gZlxqir3M7vaIWGW5ATMOQgWNNJ7Cjy1qVMf73dLR5i8wAcjBnJAO9YmnZ9bWjT6Dc2QkMS1V6dyE
	B4w33TC7p1d7s0zSMoh4i/KDMh0IGh7kMn+S+hTE93zCkmTBh4XpeJKyee0dANsKj9PtkWjYAjMbz
	dzsCz9pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANwQ-00000008Unw-2YCq;
	Wed, 08 Apr 2026 08:07:14 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANwN-00000008Unc-47dG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 08:07:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGiQfwT955dSoxRmrORP+zym4js6LRzynwl73gHLXGFB7N5uJ3VOzcWRzCqLdDqYvHIDXuIIFHg3UE6bh2wUZT/wz6dyvK32Yg6DmHuaaTVYNaNFq0UYjpW9MiETmVUAN1t8szaXm7np98V5xaq32YLfHxMxQdfO/sVo3OtIvimtizd+A3N9PcImz4DGyJftkTDd/yhM07mpgQMHOcAeB6gq9I14HnSKzxHfeNz0j+ddgQbVpqp3QbEHW2wDtbzRdgqNEhWb4Bqo/KVCSpkRZoRyT5yg34h0kyVnMSlp0dlyDHm9yav+zNATKKPCBJmzeZRDYgWKavtFVsqNxyhi1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0A6E1HoM+eWYezrUsX8ZMUbo89h+oNPxle4hlb/s5Yg=;
 b=b4S+UxUEUyXoXWaQ5yMbeM4xwCpnjfd3pmaSCGUiaPRbI+4lCwrca/KndLaZ7umyE/2oKPgVJ6UhqMvNS21KM+QkqIG9IlcCB9oxqwuxeOxxmhoCJe2lCjg5MKxI4vcbmE+lClZR1UFBxMXhiRH4d1g8tWoSww/lM9Y7RMlVpCPpNJf6+H0n15Uut9Zgj/qHgm4V4GQ4p/PJnr8jnLCvhvEWOWMxEJsNq8Ib1lhxJHvTCdbOuG2bmjMFmgKBU//aeCFaoQpeWGXrufKaXqFPvvckL+eNETxuyOB9/DoNWZU5XQ8KUyEjn83WLKK/LOPPUEbQVM0lxVTlhsWQIkRAeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0A6E1HoM+eWYezrUsX8ZMUbo89h+oNPxle4hlb/s5Yg=;
 b=gfRFhpL5Z6hcQt6+BE5fng7p1IbxVH7BzMCimuaAVzudsOf3DgDpmlYvAjdislEQqGWltUPmGGahAC6SDOI1wBgqTZVb5tEdfUQgm5wWT9QXNG81jOuj9gKwp1s4QmgHZL8ZMiSP7XD4MiennzGgtiLDirh01tpab0RCgIjejset6OPirnafLjlW3NPGdfZbg/yIhJ2NmWwo3/HMw9JN0A2II6gkKw8Y3sr66Q0CCHLv6aH7CtWrlx0fdHKAxhLHWxvbLnTomVRU3o4NN9JidW+qwUskSPOHvpJQOlVzIpTXsRavF9i9AtENqXQRUE0bYxpV6QK3IibqVx1s3vNXog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7819.eurprd04.prod.outlook.com (2603:10a6:10:1e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 08:07:05 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%3]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 08:07:05 +0000
Message-ID: <f5cd5da8-566d-4dff-b712-3d48927f97eb@nxp.com>
Date: Wed, 8 Apr 2026 16:08:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx93-9x9-qsb: Add tianma,tm050rdh03 panel
To: Frank Li <Frank.li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260407-tianma-tm050rdh03-imx93-9x9-qsb-v1-1-24d514a62fdc@nxp.com>
 <adTUkWvqVUhLiw_J@lizhi-Precision-Tower-5810>
 <a31e926e-9e7e-4ba4-aafd-0f76f53fa176@nxp.com>
 <adYKtjPvIgoK2oou@lizhi-Precision-Tower-5810>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <adYKtjPvIgoK2oou@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a732cb9-d8a5-40f7-5b74-08de9545d291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: NLhrfbLtSLKin6GxoLyNVnt9MCnCPoh3QZhq/xznq/zKVBgMxXr9hps3e5WLB9gGOYPEitr6TcvmEli9yMU5meC172t/hTbek0CXutryOIf+xOYN5LkL6nmcYYMus6G6IpCMJHWk9Z5envr869cvPh1PRuFrE0B9le9IAHYvmrvGvs/33d762jmFi2/sSlMjevfhaXjvPWnBiCNeDZYBle3E0C52qI7wVWbNZbs69NSVEWKykwGnuDwzyp8gbfXzgmivVp91yqk5u0YZoDDQdgrM6IQVcQwK5bQkgUHCaJe+EiB5CNDr2stlLL6XZvHzRuEdZ7qLUiiI4aGbN6cWv3PNpwOi7GtPosx4ifE4ddp+wZsSowUFbBZkKV5GrrcuJb84vmBlZk0kMHntLXNOgKOmhWoXFFL1i43DuUotdH8nJiaSS4cNm17YabYEOvKI99KqVqqngu9vfbktykp31KV8YFkyh31cX42B27XiG/AsUbiwDiRgo3tDNxImjj4gcvOSFS55NmDSGQ3TxSS/jUcsPs3NXLN4iZQLG7LUeE9RCjIvLbGSyVXsqJ5M4jwDmFau8J5qVRSWWyoum715ZuNFqmbTfird1ImxeOEp74w90LwaBVBg56r5iR2N2Pi7ppmoRON5VXwDq+7pfH0nYq7d/SF3itSmqZIaSj2iP2bIbzc8n2VH1vVZWvAvnjspvtG6am79fzm57iKvAQnxuswYqYOLn7PhVhjYgImKQeDl10POn5Y6MlQ+J6MWll15
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGQ5WHFyZTR5N1BJdTNuN0JZVld2MVI5cWh2UGM3OTVkMWFpU29MR2tpbnVv?=
 =?utf-8?B?YUYyQ2g5ajY2TDdydFIwaFA1dUlKMENMYlp5T3drV3ZUQXd5QllLYmlNaEZY?=
 =?utf-8?B?VWROaEI1WldGUHl4bExZS3grTC9leFp1N1Z3M2NhNUdTZjF5Y2hwM1E2V1Rl?=
 =?utf-8?B?bHVnZTVRaXhpOE1ZS2IwTmI4b0VrMElVNVdnQnUzUzFTblNveHBnWXE2WDNL?=
 =?utf-8?B?YUMwRkxPbjl3aFErNk5ZK1d4cU9WdUs5Y1k5TFRmMStJS0FhVG1HRktKN2xR?=
 =?utf-8?B?WHRGaytYODVXa3RoUExYd1RidWlNZ0Qwa3hEcGZlS0JwTGtLREszWE9xZTht?=
 =?utf-8?B?bXY1VkIzaUttenorNTNKVm9YK1hwL3VUVGl5OUhSQ0I0dlJUWVlTbE5pOWZU?=
 =?utf-8?B?N1NkZzl3dVg4ZWtKU2oveS9vbm9rUFFQL1d6WGFhSU5odFZudGdJVFFDZ3JK?=
 =?utf-8?B?ZHRqMWdYQjJCNnphZ1cwRTl4alBNTy95NTRKMVZ3OHJHNmZHZVpLc2hkVjlX?=
 =?utf-8?B?cWtVcUV3R3VkVTA1RWRRbWRKa1dlNE5qalFsb1dFN211cmRVVlFWOThHcUtI?=
 =?utf-8?B?YVBGVWlUS3dqemJoUi9RaWVKajVsaE9yZnJJSFpuUHBnK0o5VUFwVy9yRm0x?=
 =?utf-8?B?ZG9UdnV4aXEvUjdCbUZQc0pWMnNWNExwR2V3N0J3Z0tLN1R5cCtFem8wV2NL?=
 =?utf-8?B?ekdMRWc4elF6bDZYbzY2S2MzYUthcmIyNEhJZkI1dWRJcjVjYnR6RmhNVXZO?=
 =?utf-8?B?Ynk5NFNTcjBJL0kwTVVtVm1oeFFJNklNL3JtU0ZHRUR0a1pMcUpWZDhQaGp4?=
 =?utf-8?B?bitZMS9ZTnQvaGZtcnVPZHRMeFoxaTdHUFgvRndyOGxrYTBnTU1GN0JKekZn?=
 =?utf-8?B?aVc0K3gyUzJhSzVkMmsrNnJXMmt0T1hORWdHeUc5NDNUZkZLbHVYMlRtaHVW?=
 =?utf-8?B?cnlhcXZYUXlNYnJ2SmdHSjk5OE9UdVozN2J2OHV5YUhwWkZPN3NRMzZvWi9n?=
 =?utf-8?B?eVNkak9LeWRIKzV0WHViMXBVaThNUzdOaXduWm9xZjR3Nkx1eUh4SkpnZHlx?=
 =?utf-8?B?Yk9tR0RZUmdBNVRHUXQwTkxiYzB5RlZDVXNVRzV0SHIxVkZ4NGdKSUNmQ3FW?=
 =?utf-8?B?cTZleDJLN01ZejFBTDVSUFZNRk16SVovRTgwb09QRGE0dzZ5a0Fqdld0dGF0?=
 =?utf-8?B?QUVtUU4yR1VrcVZmZjEwQzJzTHErNWJsVldBcUM0QXdBYkRuejNSZld0b3Fm?=
 =?utf-8?B?emhlOHRmVE5ua21xYUw1Mi9OdGZuK3dNUEwyclBWZVRLN1JmL1pTSTRWazA1?=
 =?utf-8?B?MVk2SmQvMEVXS0w0VUJXY3BObWU1Z2lzZjFOWjROM0FFZkZTSVhFUkhnaE81?=
 =?utf-8?B?TDJ3WEwyU3V6TSswMXN4UElWT0NSbHBQN1pVTHlteHhNWTVMcmY0aFNiL1N2?=
 =?utf-8?B?dDU3VnBFamhEcXBnajFKSjJrcmZXRys4VEpnYUlwYmtETDg3dHAyTnd2WUd1?=
 =?utf-8?B?VEZTSEw4bHlrZm1kcnFpbXIyYTJHWCs0dkV0Mm9nbTNoT3pvOUFkSG1FVnZ0?=
 =?utf-8?B?UGdnY2hJQ1o0SnJiUWlJT05wT1pQTEc4L1VuelNhRUMwQzhtME5kWU52SHln?=
 =?utf-8?B?anV4MDFoTHJKRk1aUEhOd2kwY09xN0M3ZXAzWlBXd2xTaUtFa1AwMlFIR21r?=
 =?utf-8?B?QWtFT0hnTms0V2JDT3NFQ3MwbXMwbGpGSGxpckZCcWt2akpvR3NGRFZmdmFF?=
 =?utf-8?B?RnpvNFc1azZjdUd5SHFVbmQ1Q01VSUJ2MndoRUc3aXFhejBIMWZPN0VwT3ZW?=
 =?utf-8?B?K1pSV1RNbGVONklUWE9Pc3lNVjNoUE5aYVVOcTg0azNjWGZjZ2xCUzlSdUhE?=
 =?utf-8?B?MitlRVE4WTRCTHN0Q1lBbnpkK0phV0R0TWJNdG8zdnVrdG1qc3Y2aDRXTnNp?=
 =?utf-8?B?ZkpUOFV1S2tIZXJwRmVLeWRiZVZCTWJVRHlSTzBPR0lGMGhzZndXb3g3dy9M?=
 =?utf-8?B?b2FqbmQrMGFwcm1uc0ZmU25VSzM2Z3ZyZldQYWhXajM2OFlmQjFYSEh2eXMv?=
 =?utf-8?B?SHZTOTlPY1BvK3IzY2VkbmZ4ZHM0N1NuTDRMZWk1Ni9vZ09Na1d0UE1MUWNs?=
 =?utf-8?B?cW5xcm9JTno2SzFTajJ0ZnN0aDV0TE10MG83WitiMUxneGVBSGM1VDVJWW9E?=
 =?utf-8?B?M2lYL0xQZ0RsZ0pxSFJuWnErMWdJQ0gyZzh3ZTg1ZG5BdUZuYXp3VStReXNW?=
 =?utf-8?B?K2ZWL2xsdFJybVBKaUNrOGl4RlJPbWo4Rks2ZzNrNWs3NEJIY0ZwZDd3N1lR?=
 =?utf-8?B?aU5xY0RYSG1QcHE2OS80ZzkyQUJhN0QyMXB4L0xtUmN1b3lTVFNDQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a732cb9-d8a5-40f7-5b74-08de9545d291
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 08:07:05.4513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +44vQ4LzBK5fGVBeJKZxcby3bfVckRa+CjjecgHNTRSh6bi6h9gCV7R6yRv8Ei+09IsxSmaqLo0SBC7FVflZPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7819
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_010712_043610_51BAD613 
X-CRM114-Status: GOOD (  20.83  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Apr 08, 2026 at 03:58:59AM -0400, Frank Li wrote:
> On Wed, Apr 08, 2026 at 02:02:54PM +0800, Liu Ying wrote:
>> Hi Frank,
>>
>> On Tue, Apr 07, 2026 at 05:55:29AM -0400, Frank Li wrote:
>>> On Tue, Apr 07, 2026 at 05:15:31PM +0800, Liu Ying wrote:
>>>> Support tianma,tm050rdh03 DPI panel on i.MX93 9x9 QSB.
>>>>
>>>> The panel connects with the QSB board through an adapter board[1]
>>>> designed by NXP.
>>>>
>>>> Link: https://www.nxp.com/design/design-center/development-boards-and-designs/parallel-lcd-display:TM050RDH03-41 [1]
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
>>>>  .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi       | 110 +++++++++++++++++++++
>>>>  .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso       | 106 +-------------------
>>>
>>> Can you add some description about raname in commit message?
>>
>> I'll add some description about the file copy in commit message.
>>
>>> Use -C option to create patch.
>>
>> Will do.
>>
>>>
>>> ...
>>>> diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso
>>>> new file mode 100644
>>>> index 000000000000..c233797ec28c
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso
>>>> @@ -0,0 +1,14 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>>> +/*
>>>> + * Copyright 2026 NXP
>>>> + */
>>>> +
>>>> +#include <dt-bindings/gpio/gpio.h>
>>>> +#include "imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi"
>>>> +
>>>> +&{/} {
>>>> +	panel {
>>>> +		compatible = "tianma,tm050rdh03";
>>>> +		enable-gpios = <&pcal6524 8 GPIO_ACTIVE_HIGH>;
>>>> +	};
>>>> +};
>>>
>>> Is it possible to appply this overlay file and kd50g21-40nt-a1 overlay file
>>>
>>> to imx93-9x9-qsb.dtb, so needn't create dtsi.
>>
>> I'm sorry, I don't get your question here.
>> Anyway, the DT overlays are needed, because the 40-pin EXP/PRI interface on
>> the i.MX93 9x9 QSB board can not only connect to a DPI panel adapter board
>> but also to an audio hat[2], and maybe more.  The newly introduced .dtsi
>> file just aims to avoid duplicated code.
> 
> My means apply two overlay files to dtb
> 
> imx93-9x9-qsb-tianma-tm050rdh03-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo imx93-9x9-qsb-tianma-tm050rdh03.dtbo
> 
> In imx93-9x9-qsb-tianma-tm050rdh03.dtbo, only include
> &{/} {
> 	panel {
> 		compatible = "tianma,tm050rdh03";
> 		enable-gpios = <&pcal6524 8 GPIO_ACTIVE_HIGH>;
> 	};
> };

If an user wants to use imx93-9x9-qsb.dtb and the DT overlay blob
imx93-9x9-qsb-tianma-tm050rdh03.dtbo to enable the tianma,tm050rdh03
DPI panel, then it won't work unless the user also apply
imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtbo, right?

> 
> Frank
>>
>> [2] https://www.nxp.com/design/design-center/development-boards-and-designs/mx93aud-hat-audio-board:MX93AUD-HAT
>>
>>>
>>> Frank
>>>>
>>>> ---
>>>> base-commit: 816f193dd0d95246f208590924dd962b192def78
>>>> change-id: 20260407-tianma-tm050rdh03-imx93-9x9-qsb-6e4bbbde3d08
>>>>
>>>> Best regards,
>>>> --
>>>> Liu Ying <victor.liu@nxp.com>
>>>>
>>
>> --
>> Regards,
>> Liu Ying

-- 
Regards,
Liu Ying

