Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB05FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NdyOmgJzatYv2ssRjQxecJAiwOSxt4qP/WMKA70BIOk=; b=JGjfbv/9keo6gnWHfbyKeXO2Zj
	7si8ox9ko2bq7H1QPIRjmBkAF0JC25UfKWjIxzmQJe2KqajY3W9RGLEDl/GbUyFwaPguv0heyngUJ
	tznd+3TWc1orLGHxaN7yCFEoUVQcIyLzFe7W/pVYEJsHhAP5oN8XBoKWNGdp5l7zXCRrGDIKFS527
	8WB+eK2zselA6kAg5SZ/t4DwMb4APHMOK1WGbiyc9BR7rWDIIVJHvc9tA+esXXZB1dJ4cat7PUy9w
	guz34qGwPpgTQKIyjfRSbX7fKquxSMphP7Sen9wLdLa7MXRaRzowJ/nmuhoTjnMaVGIcW6Bh8I+nf
	9qPz4dbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyqm-000000034VL-3n5w;
	Wed, 29 Apr 2026 06:56:48 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyqk-000000034Uz-2pD2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 06:56:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5cRy0+l96Z7uy4ILJf2s/VCcRtSJqVaBBLlgsTVff8JthAW3Dh/hIap2oKLRZJmjHXM3+dahriHQegazt/oQvanDbI6YTx5h8pf0wvptYULLYCYAlBZRuJPNOyVNgO/GExtyTwj24YscbCnbD767eR7Lrrkv1QN2GTapZpw3AGvwLaus21oTk4d0j0ldC50NE8Plu9h9rmMN0VGf3P+T3qrgm3syt0927clQDz4EOBeDsBAGD+O1jONYkFN03xk6y9+CMcxDnMKZG3JGGdjkxq0G3kkQewCgRtr3TvdQcj+3gzbmC186GLpcHN7MJIEBfSgNCcUdZfwrUg66t+sRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdyOmgJzatYv2ssRjQxecJAiwOSxt4qP/WMKA70BIOk=;
 b=TR8twUQPTEBtkXbPIY6R6IaOEFh2xA4YuJOMH2s0LQj87E+g9mGpUw0x40rXco70QMtZZn8XPGYxElUrze+QLw7saWU0gQNZ6xtxICr429CNq74TNbaxNA0XycNRHjY+i047K7c2Htfs0En5mhrxr1J0zwU7i3rTbClB1x1kgOEFGRh5Pr+hQmOpFpMYQYPAnMSifh9oSWMdenz9T5tpODkALIBXUNA2SasZOovzrGMD2kDbcknDmcqggOm/ZTqM6hf/W3dw8DhbXktDnJpAafbHsIpHOQdT7sau9q7xSt1stYlj5CLT9mfyFTHXOv2JrDdHlLC8sAkEyE86Ke9fWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdyOmgJzatYv2ssRjQxecJAiwOSxt4qP/WMKA70BIOk=;
 b=aMDaH/BoVM9g0AYKqVUs6wXuMzOeGPTFFhUB8yfj8vjRy7m3dBWGpOPxLChd8a5ClumcJ4+5AgmdmUsN9tirYij6ZOiv/abIvLjO8w/qysJa1K/v1ehIsYeiKKeQ4pJr2JV1wMpuE54Uw/IO0By8MPN4oyrJvFoufd9sNkb+0ETBRrBxtydMOQt/nOgDM7om3ONVKZ2fc8rz8qAsQejMFtGDaaypXL9MJ49WriHwnP/tNgBab0LwCiSdXmv56jOM8pxjHmpIx6CRBp9+ONN3GL5WDow/ffNElZUTw8w9j7cQy3+oqxfua6DdaoJzI+zd81hJ+hwBcEn4ML0EhEgETw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GV2PR04MB11977.eurprd04.prod.outlook.com (2603:10a6:150:2f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 06:56:38 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 06:56:38 +0000
Message-ID: <4139a8fe-4e82-4700-b372-960915fd1b34@oss.nxp.com>
Date: Wed, 29 Apr 2026 09:59:51 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] remoteproc: add Cortex-A Core remoteproc support
 on i.MX platforms
To: Jiafei Pan <Jiafei.Pan@nxp.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, peng.fan@nxp.com, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Zhiqiang.Hou@nxp.com, mingkai.hu@nxp.com,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0434.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::7) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GV2PR04MB11977:EE_
X-MS-Office365-Filtering-Correlation-Id: a06aa44b-677c-4c01-5ecc-08dea5bc75c1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|18002099003|22082099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info: /J98WdqszLbYA9eQ8oyaotA50cj865LTcBODpbGopnNvmA457HigrjYBIbCnmDWeRMzmg8QsL4jfZDPpZBPZF3U8bLqTMv2zMkq7ApjMJlXIeIordsjqwVsOBCJL81HKFA6GRi4ke/OrxwxbZzWcCbqKLwutl/HLNYR9atFnhMgLKZwNDq+7Fklyag0pwqsfg4vVt2VI1pGdaXCeDBJmeT8aXlbg7qNYuG7iiDFLw7nUZzVvpWU4h1TN+gQzzgBnjE3p7NxOdAA9SykxHQU+p+eS1nU05p2639jXM0sq3xLU0WM5q+PGdSGXwSl1+OA+DECw22F85teypixiDy2lIk2Pc+phIUtl8qMpKYr+cqhnfONAmm755e0S0u0tVRPyAqk4zBQkAzQa2jkpGYE98htD63P4YD/whVi+ZrSSnoJPn64G171Yaq2TkZlrslCiYwAsxj+2Wc94ZRIXRvxlyh4rQBkBwGSKf4x2zVpsohmQD/US9g+J8R1b/nEE6Xe27BQr4Tt5nlkiYX6fD4tAQUzc2aGBLFPRNK8PVIv/5d9cV+xZY6BzAsIHdznNkD2+Yqo3Yb0FTk8j/CxM+NtSllZXlu5B6xE/vThFBWkvDPnxJWAxuvqw2OYdhTSpQ76Rhgn2ZvLm9wopn4CrgynIlwX4sVCCAhQqKD3BL3i5Owubfx/Xn9JjousrQCc4RpLTGz0pmNSZj11AXY7aX+YAcy7MC3Ja4/QU0KQGnF9++tNxIo4Qf+NucSu71oyMX7OhoPdAPspgoouNb7XwDMmo6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(18002099003)(22082099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3BoSGEyNGN5VUtlY0pmV0lXVmJzbWd6MEtMcjRFTVlHd1ZRRXZydlJtTWRL?=
 =?utf-8?B?RG0yY0pFN3dKaVkvU24rQjIzQzUySlUvTFJ3dGkxZmhPR3g4THc2UTlmWS9U?=
 =?utf-8?B?SDQyOXJUZlVnNldnMW8vOXhxUkdLNDZpTVk1Y0hRSHR1aFVqMzVvQVhrWmti?=
 =?utf-8?B?NmpHSHJsYUdBeDNZSW5PdHgybmU4Mi9CRWU5RG9XdjlldkY4WmdWbXRpeEVl?=
 =?utf-8?B?aXphWFgydGRnZWlrV3UweE5HaW9Dem53Q2N2Sm56WlJtaVhBOXpFUHdMUmky?=
 =?utf-8?B?YmlhK2RTTnFrV1FDaTcvRURZaHowaGdJM01sMGhsSzJFR0JlQ2duN1RvK1hS?=
 =?utf-8?B?U25RNWNLK240bXRVVDVPNXVqWVBXL3B4ejNqMnJGNHIzdkNxOXFkUTluQTdm?=
 =?utf-8?B?UXFwNUE3Wnh5dFNEdjhoYWxFM2UwWGJBU0dkNmtrY2JodSthTFVWNTRtclBY?=
 =?utf-8?B?QS9zWS81eHZJTnh1eVZZUTVQVXByRkI2K0M5RDZSK3pXUCt0Z0V0dHREWjhs?=
 =?utf-8?B?cGVQZnVyVU9IQ0g4OFlqSmo2WWRqRE1nRm04MzVYYm1IWi9mV21RbEdNS2k4?=
 =?utf-8?B?ZDhpby9QZ1p0OXh1V21RbTZlMExCbjJXbEEwaitsN25uNGhnaDViVXVKVW90?=
 =?utf-8?B?STB5dmkxWkRZc01jMnVHdTlpVEwxajd4djZMcWVHbUxxbGRXdUM5OFBhOFpj?=
 =?utf-8?B?UG9DcHhmN2pVWGVjNWxQd3lnYkNsU0NnV3hZKzRSU1NhM0hRSTAxaHcvU2lp?=
 =?utf-8?B?cHd3SVV2dlI0QTA1M2lSZlU3ek93K2VKK255a21BUzhURnRZTVlRQlNNV254?=
 =?utf-8?B?ZHRTU0NhVXdGVHN3cS8yeFBkdzNPRTl5cTZUNmdZSUpZS09jNDQxaWtBUFo5?=
 =?utf-8?B?N3FPS0s4TzFQMnFiNWQ5VXA3TGk1dDRCclpJWjJ5SlJycUFMS3VyUTlDOW1l?=
 =?utf-8?B?WndIZ1M5RTBxVkpwSGVoMkJCOEdxNjVtekRUYzUreE9rRzhiMVc0R3hHNEpK?=
 =?utf-8?B?V2R4d3prRDJQZEpKbkNabDZXZ2RMN0NPL3B1MkhBLzJGOE1SQlZxRTV3MkdS?=
 =?utf-8?B?TmI0YklueDY3RUJIZHRGM1N5V0pwYkI2WXg0Z0p3djN6TVh1bFVmdkZUa21Y?=
 =?utf-8?B?ZjNtclplOGNWWEhNdmJGdVNrQWs5S1U3eXoxc0xhZ3pzQzVYa0MxQjE5Mzc3?=
 =?utf-8?B?R3hoSkJEaVVZbUNaQkIzR21VTHdSckM3VkNZN3d0ZU50czRZYUJTVG5pMGFI?=
 =?utf-8?B?SXBYeldqSHc1Y2lRQlgvN1ZiWWJsSDBXRnJkL1RRNjlZUmxjc2dWMUMvU1BG?=
 =?utf-8?B?QkZDS0lnUFhyUXlpWTFnWXNua0pnemRFb3pvelduaVlrdzNQeTBOeU9tVjNB?=
 =?utf-8?B?QVZDa0JNTlRVWXNaUE1YQXZqWWRhaFF5ZVFCZFh4c2ZQS25iTXMvL2M5WTJR?=
 =?utf-8?B?OGdGbC91bnZUUWQyZ2RCMDNoTHl5M1duTENsZkFnZm4zOVp2elAwSHkzZW5u?=
 =?utf-8?B?dGtRRkY0Zi9tNzBFNVlQbHpNbGd1QTJpWndDWnZuMzZwR3ZFelpiTFNSRWFq?=
 =?utf-8?B?K1lySXBoVzQ5Wjl1dlRIcjZ2ZjZLRkd5UVVSdE5wVEppQkx4LzN1Ym5pQkth?=
 =?utf-8?B?QjJhcitkTVZUdGR6QWVGazBlUzl5bnF1Q1BZdFdybER5SitoVG4rcWFaTmZB?=
 =?utf-8?B?cjVGZTlZTTI1M3hiYXRoS1NMeVVMbzhBVTNIYjBhOW13NHhUSTJGcEJoOW1p?=
 =?utf-8?B?NGZDQkVRV0t5bTRjZUtwZGhEQy9tTFNEbW0wNDRaQmlpSHRuSHZJbXhCS2Jo?=
 =?utf-8?B?bmJvcm1ST1ZqRDc0SWd0YW9Kd3VXL1p4Q3VWajVJdnNvOUZPMmtyMXF5NmVQ?=
 =?utf-8?B?UGVOVkVrR2lLaG5RNzloWWhiRTZLZ3dwSS9WUEhxVDhmdytHek82L2xIQ0JU?=
 =?utf-8?B?am1lMVNFWitZUTdac0x6aFNpRWNMZG9uYXRkUzZFOWdUYU5rWGdYUndtdXhq?=
 =?utf-8?B?L0tVWEJDMXZaaTE0OWpFdk1oNVpuZENRN0tmUzJnLzM4SnpWb3hlZy9jVytL?=
 =?utf-8?B?QkZVaXl0NkpIL0N5TENoQndrUm9KUVZUZDhpb200Y1RBeUhVaHhIekp6cHM3?=
 =?utf-8?B?TXBQTmJDOFc1SEtETlUvTW5GY0tjelV1NnUrbFpvajNGMlJoWXB4dHdpdDNi?=
 =?utf-8?B?ZVQ5NWlSLzJmMkU5LzdkdFNTaEdFTUxKK3lyeW85djI0WUY2WFBnbmh4ZHow?=
 =?utf-8?B?QmtZNW4vOXVqSy9pKzFvM0IrdW9SVjFGcVdkeWxFVTBmMWtybk92NU5pY3hH?=
 =?utf-8?B?MjdOT212MGJLajZET0huT28rbzF4YVFlMDc0b0ppL1A4Vm5BcFladz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a06aa44b-677c-4c01-5ecc-08dea5bc75c1
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:56:38.3682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Q7p54kGBjUjcorMJxIre8x5IagIpI+vks6/YxO5H2JZGhMXwujWaRvqK4Iy/WSXizT2RYMJN9HuIsAMos5/hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11977
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_235646_721172_E3ECBECF 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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

On 4/29/26 06:10, Jiafei Pan wrote:
> This patch series is to add remoteproc support on Cortex-A Core of i.MX platforms:
> 1. Adding dts binding for Cortex-A Core remoteproc
> 2. Enable Cortex-A Core remoteproc support in remoteproc driver
> 3. Adding dts example on imx93 platforms.
> 4. Updating remoteproc driver to use prcoessor name as device node in sys filesystem
> 
> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>

Thanks Jiafei for the series! As Mathieu pointed out let's do internal review first.

@all, please ignore this series.

Daniel.

