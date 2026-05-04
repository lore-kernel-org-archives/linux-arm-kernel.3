Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2A9CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 07:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fwetLc1jZcAJdxL2IfCRi48MLO7Kpbn/HXFxRl0BMo=; b=lT4jDw6IQ2iUeUxvjAiiNXl5Ye
	GhaKogkPQeo1jvD8/IO1xAQQ6jqsin8tgGIkJ7mH93sf9PPewbfdzdwWywe3hO8+2aOja4JRvB+/K
	cpgIUT7gAjFfTtD+jHJf9uwz1YDbSd5qRp3aHnAvlSQ5WAYyCOhWTg/G7jLYsfY70xpUVM1YW5jmz
	edqemJQjx2En0Eeo1rsKWxCmzH/WoGjDPxoZzyZWbYH09+Y82P7NpH6wBk5CycDKhImD6T30tWwmg
	XfIiTAVbS8lQqdnrWw4Z0kRXt6TWlcImWKSndtYmj5d0OKkDHG0E4JXSgW5f5VST6sXOP94Gn0zHH
	M0Nv7J3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnle-0000000Cbzm-45Su;
	Mon, 04 May 2026 07:31:03 +0000
Received: from mail-westeuropeazon11011005.outbound.protection.outlook.com ([52.101.70.5] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnlc-0000000Cbyz-2xqm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 07:31:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZTSbbTLBeCP77nzVmWP+r9i5HiwPeIoAYHonrdRUNp+hR1PBDOTobjUoMKPUTwfkNTfdSmK1ywlgElsW6KSoN/IaiU/hcC59buuZk3GpUXKzNMJE8808QCrmq0MxyntdO0ssRJazOjidHYnkSa0LBZkMO7mp8s9rIdHLsf4MhaMgO4Gsoyw/xMh6v7vvEMSgBJDis1HiNnNxpC0HDDw6T/ogeGeTiTnNKnNeCptpGveJZHY1CdZpXEjsvpFLhOlp0xeHBc/STS/C1wjaPbO83kMpEwcKnyl7v8Ieqde1HDkdB9jXV/ciUNZpCbGwBGbXkbarcdoObSY0u97zCizJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fwetLc1jZcAJdxL2IfCRi48MLO7Kpbn/HXFxRl0BMo=;
 b=Elir37yKTkrklQqEP+YF5zWRFt2kKEwaOg3QdkBCoc0ddWdxuqKROYGrwfkSF8TbVIQg9aIO+VRtqfDWbNs2rStjqyNHy7e8ua/a1njdBCLmEjlPH1Bp3twpZXelSnUu9yVfAgW8VV9y+MZN7yvPYJnqzX1jrlTLtSxzzmsyb9F3H+HzASwragVw8y9GTxUYnM9RvNt62mL1EUc+c4dpV4KHB6eJt48lptxBZ4+F2XHsG4XLDPBuxRO8A8Y0GovGezpxCYwZReIQ9HIx56Hgq1pYJ/p68+pzo2M7db3TArz8381IPrq/7Ob5BPFia8YoCthk+vxPXVyU2kQj4gu+Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fwetLc1jZcAJdxL2IfCRi48MLO7Kpbn/HXFxRl0BMo=;
 b=QdYQ6DgSVQO+LAr+Digua1pLMzmWmcIlgbpAB4eRSmCBieaFza63n1CLFlRHpLzVbDkLwovDTolF31y42pmDNMga2gwbWf4mHCqg0UPu0UA7Bjjhend9aiza5593Y1NIovuWz4u/z4NfI2HClQmmFtXEvGZbR9DGqfZCmcwI3GLYcYIrX2ElRTpBHundSwfcY+shJFA7dCUhY4EDJSaIrs1uNztaWu8oxi5+t2aIEKoNZlR2mWSkGkKTCKFQteSlvJA9qlNrqXoZ/FWATTIrq2NZ5wVZ1zI4mf4dBNG8uKgVIhdrLSyue+QZnhfmxPLYHUqGMmXfUByEnFvGu/JMfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB8349.eurprd04.prod.outlook.com (2603:10a6:102:1bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Mon, 4 May
 2026 07:30:51 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 07:30:51 +0000
Message-ID: <c7a135ea-eca3-48a8-800a-c7f97a993c25@oss.nxp.com>
Date: Mon, 4 May 2026 10:30:42 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 0/8] can: flexcan: Add NXP S32N79 SoC support
To: Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>
References: <20260421102603.4122332-1-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20260421102603.4122332-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::15) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c57732c-13f9-4e06-c02a-08dea9af1198
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 55DaXsiJfSokiNtJKkLFit8lXz4E1qe7hp3u72t0Qvm4q9o65ebwIhFayo905eECHuVevNKxrKtxez6cz5hywz4nGHgLCGOOkDexbx6YSr62iAKCYtn4VETrb/eeoiJt66smGCxBNdmD8Hl1tJnOL/bkKw/6+KNSvZVTX9GhG4vATt4y7D8nfwdjrBo/Bhy466hSezK/IKsPb1zSnN6yb5L3+KMcXjdBRaki9wSqyf5CF6C9eByOXHU0L0sYEk84oOlB4nZnNAYzr3gp2K33GkyCBEEjhQrdY+ECTrF165IJPVhJjmu/kQZTGfx12No9Bf2jFiLMnd/sSBMklfFkIdk05zTnsNBnLaTtwlAbXRVxUyo8D6f0P//9wlusGTTtty6AevYnL28yMjVxEmV5ABAhK7qvpQQQ1KWat3WL/9DOdjUsWSYowFrYqnRj0F2S9GvH6bg9/UCKBAwJUpOfJCPVQpg9mbn/hRAb8SwqqB/nmcFPgyh0yQ3ddR4x2hTwjQWKmlSGos8JuC0lHYxhAfACUd5eWBI3fbGHAmX70K+UR4DlEiWvi0GCC2iSWbGQqQDtp/5lC2mni9PsjWr7YGV+jVuYo9FzHD8IRwn/dMuLewh2pTslIhmVSQAQlUCJ8GtbI0adEt6FJKyqaQILht0NC5IgckzFbg9uaQzFWzxZZQy9QwMx7YxPRIB2FHv0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEU0Qis1Z0srd3hGcWZheUFNdzVCQzlDdkNGeGpKSDlibmthVHFWeVl1SjRh?=
 =?utf-8?B?UURKVlpha0FGLzBYY2hSQ25xRFpIeXU5T0dYTTNyUnpmdUNUSWNUUTJxZUpI?=
 =?utf-8?B?Z3k2bE9mS2tScnJaaWJPRGhpZ1NzMTlTeDBXNkpZeUxMemV1SzBrNHV1b2gv?=
 =?utf-8?B?SlQvZlZjaFc3cTVCTmFiVXY0b3pTanBSNTFLMWs4d1Btc2ZFWStKRGV3T3dH?=
 =?utf-8?B?UGZqRGlnZjRCcXpyR20vMkNDdmUvWElONzlBTG1UdTNsK3ZkejBrZXJ2bG95?=
 =?utf-8?B?MXlLVzM4TzlHckRtTk9FMCtMRWpId20rYzZBOXRUdnhzZUdLQVZacWpSa2dI?=
 =?utf-8?B?NWF3b0xHcDBkL2pWUktRbVRKOXJZMVpPL1o2Q3JiSGdQV1Rhc2lRb0xQVTBs?=
 =?utf-8?B?WmE4cThERGNQeEs4eXJYaDZVQW9yNWM0WFRQb0hQekJ3Njg5bjJnTHRCaHRY?=
 =?utf-8?B?UXk3TnJqNHlORTU0NS9CNHhWWjBkYXJENmlNbGdFTnFaaDBkbElwcnVFVTdh?=
 =?utf-8?B?Sk5sYlFkckNDQzlkSkRSRklvNXhxQk96L3BNc0tLUWNkMS9HZU4xTEcvZG5C?=
 =?utf-8?B?bGI0TVNJQmhSUUluWDJXNFNJSUVpMmNZcytETjZwcFptY09lQnNXdGhnb2sz?=
 =?utf-8?B?MUczcFR3T2JIQWg4YkVxZkhMZVVvYUkxVVJiKzl5Q2RRN2Q3SHhjQlcwMUJR?=
 =?utf-8?B?VWdNSmxuaXVOdmRERklWNnlLUzBpUzVsRGhyZ09qSzZndWxBcnJwQWRNamZ0?=
 =?utf-8?B?UnhENkhuVTNUYUFOU2E5ZlRDaG1kcDBCRThyb1VhS1lYaGZFL0Zzc05OOHJQ?=
 =?utf-8?B?Wi9MY09rWTY5Y1pxeStlNUFGbm5TNHJURFp5U0tSRGVRVS9WT3pPQVdVYmZQ?=
 =?utf-8?B?cFlzTklQNFRPK3g5Ty9QOHUzRTFhNW5RbUYvaDhDRkpwL1dhc05wT3BoWjQ5?=
 =?utf-8?B?dDVjOHQrajg0cGxocUtXaUpEc2FaTFZ5R2xtd0V4SlNPTVp5WDVRZTFXaFk2?=
 =?utf-8?B?blNCcmNuSk9VMDh4ZUpOZnc0OWFlOGczM2JrZ2NTaVNYVU9qQVNGOFNrbVZa?=
 =?utf-8?B?QVBVcUhYZGw4YTdERGpkcDg2RnNvZld1SHNUSlpFOE96ZnA0eVpqTTg5QVd5?=
 =?utf-8?B?aEVmN0x5R1hhL0hTTzUxWXM2eE9ka2pMMDFrVHZMakszNzZ5czFEVS9LUlBp?=
 =?utf-8?B?bDhlSUswVGFBK2xIU2tEUzZzbW94cWxmSFRmdGRDU1pjZHNtSUxZWFF4MzFy?=
 =?utf-8?B?MTB6VldLMzJ4MzlnUDZReHo3ZmFYODJZY2pua2RnMzNZeENjQjIzOC9LUFB3?=
 =?utf-8?B?WHNhTkI0TzJpTS9BdjNjeVlpS3NrS3QxRTB3NDZ2azZpQ3oxeWlGaGJsZWRI?=
 =?utf-8?B?TnZ4UmYzUk5ZWEpsT0dGWkZNVmdoRmVuYlBWTHY3SVhrOFVuV0JCYmZvbE1Y?=
 =?utf-8?B?YmlFM3RUeXNMTDNyNjdFWHZRNEdIeVhoL1ZYdWZ4UUZ5cWZxcTBxRHZmSWxv?=
 =?utf-8?B?WGpZVnpWS3AvTmZ2cTRILys4Qi9TMk55KzdXL0J1MUdvL2FaQjhCcDdLamZY?=
 =?utf-8?B?bFJraGpENkc5bWR0RWI2b3lNaEZTK3pnQ29uTVBxL0o3M05NMm5oU3FrSmZT?=
 =?utf-8?B?b2pXS0lSTDk2MGRCRlVMNDMyRzUreEUxc1NMSmZNWFJUQThnWnhUSHFaUUR0?=
 =?utf-8?B?VUczZDVhc1pNNlNKNFlsdTlzMXlQK09HTUtKb0I4eERqSjN3ZWtoUHlERUF5?=
 =?utf-8?B?QVhXQm5XMDkwTFBpN2ZRNHZpWnhGaVljMXRCMjNwN3dMZlBqbGs2RXl3cmpP?=
 =?utf-8?B?VFZwNGtLT0UwVVZSSk1kRUtmOW53ZzJRcWdXMEdwenNycUtPZEVuNVRjaGlO?=
 =?utf-8?B?RXJsc0ErTkRVNG8xUHJkc3pjZytKc25iMGdVYWZXZk9mN1FiNmNtVFdzQ0JC?=
 =?utf-8?B?Tk1EVTRScFZZQm9rMFlwRWpTbzk4bHk2eWlzMlFweUlNcCt0MTBQeWhQakhR?=
 =?utf-8?B?akxhT2lDTUFpN3hKYnRzY0MxQkdrQzBISmZHdEVoUCs3cjdNRjZQVG15cjE3?=
 =?utf-8?B?WWxxYTZ6cTRpYllFTTljS254c3RzbUJ1Z1NxVS9zOEl4OG1aZzlFZnZUODJo?=
 =?utf-8?B?U01NWXp6Z2YrdmhURXYwMjl3bXlaQmRNUnpMaEdBOTZPNkJGOXExUlhHQkQ0?=
 =?utf-8?B?K2x6TXQxaVhZZzE3MkNFenZwVFhSbjlEQzlCak5nVFFmK3laVFMrQ0dNZTNY?=
 =?utf-8?B?cElFMDNXZ3oxcGIvbUJBQWdWWU1xZFJNL29xODUxT1gxemZSMllDSXJsM1VX?=
 =?utf-8?B?clpwaUkrN0Fpb0dJTVhuVG1PcUw2STdRRWJUVjlHdkFNSkNSY0hDVTlVMXNM?=
 =?utf-8?Q?dOeXEHxxeaPX7vHM=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c57732c-13f9-4e06-c02a-08dea9af1198
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 07:30:51.5425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7zPDLMeBp9tFw6n7YJNg6Jzw3iyO3EdYO+8SfTT0YbDNyFpU8pC/IYf4crU557336Uqle3jk1GF4bFlZPfValijmGK9qOzQHZ1pbjK0vMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8349
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_003101_039098_25BC8F5D 
X-CRM114-Status: GOOD (  20.50  )
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

On 4/21/2026 1:25 PM, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 

Hello Marc,

Following up on v4. All comments from v3 have been addressed. Let me
know if there's anything else you'd like changed.

Best Regards,
Ciprian

> This patch series adds FlexCAN support for the NXP S32N79 SoC.
> 
> The S32N79 is an automotive-grade processor from NXP with multiple
> FlexCAN instances. The FlexCAN IP integration on S32N79 differs from
> other SoCs in the interrupt routing - it uses two separate interrupt
> lines:
>    - one interrupt for mailboxes 0-127
>    - one interrupt for bus error detection and device state changes
> 
> The CAN controllers are connected through an irqsteer interrupt
> controller in the RCU (Resource Control Unit) domain.
> 
> This series:
>    1. Splits flexcan_irq() into dedicated handlers for multi-IRQ platforms
>    2. Adds dt-bindings documentation for S32N79 FlexCAN
>    3. Introduces FLEXCAN_QUIRK_IRQ_BERR to handle the two-interrupt
>       configuration
>    4. Adds S32N79 device data and compatible string to the driver
>    5. Adds FlexCAN device tree nodes for S32N79 SoC
>    6. Enables FlexCAN devices on the S32N79-RDB board
> 
> Tested on S32N79-RDB board with CAN and CAN FD communication.
> 
> This is a resend of v4 with no changes.
> 
> v4 -> v3
> - flexcan_chip_interrupts_enable(): disable/enable all IRQ lines
>    (not just dev->irq) during IMASK register writes
> - Split rx/tx masks per mailbox IRQ line (struct flexcan_mb_irq) so
>    each handler on S32G2 only processes its own MB range
> - Added received Acked-by tag on DT bindings patch
> 
> v3 -> v2
> - Split flexcan_irq() into dedicated handlers (flexcan_irq_mb,
>    flexcan_irq_boff, flexcan_irq_berr) to fix duplicate event
>    processing when multiple IRQ lines run concurrently (new patch).
> - Added flexcan_irq_esr() handler composing state + berr for S32N79
> - Ordered quirks used by s32n devtype data by value.
> 
> v2 -> v1
> - Renamed FLEXCAN_QUIRK_NR_IRQ_2 to FLEXCAN_QUIRK_IRQ_BERR to better
> describe the actual hardware feature
> - Appended new quirk at the end
> - Switched from platform_get_irq to platform_get_irq_byname usage
> - Updated interrupt description in dt-bindings
> 
> Ciprian Marian Costea (8):
>    can: flexcan: use dedicated IRQ handlers for multi-IRQ platforms
>    can: flexcan: disable all IRQ lines in
>      flexcan_chip_interrupts_enable()
>    can: flexcan: split rx/tx masks per mailbox IRQ line
>    dt-bindings: can: fsl,flexcan: add NXP S32N79 SoC support
>    can: flexcan: add FLEXCAN_QUIRK_IRQ_BERR quirk
>    can: flexcan: add NXP S32N79 SoC support
>    arm64: dts: s32n79: add FlexCAN nodes
>    arm64: dts: s32n79: enable FlexCAN devices
> 
>   .../bindings/net/can/fsl,flexcan.yaml         |  30 ++-
>   arch/arm64/boot/dts/freescale/s32n79-rdb.dts  |  12 +
>   arch/arm64/boot/dts/freescale/s32n79.dtsi     |  50 ++++
>   drivers/net/can/flexcan/flexcan-core.c        | 249 +++++++++++++++---
>   drivers/net/can/flexcan/flexcan.h             |  12 +-
>   5 files changed, 316 insertions(+), 37 deletions(-)
> 


