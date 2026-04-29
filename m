Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD27FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QsXiCI17YVzjc1iKcYp+3g9bZjMZwrSDSK7F4B5xZX4=; b=oJphPWv2CoBDSgcvV2hkSwrB3A
	CWP5jzlzzyFZm2F8pMDHMIWSh76rw1nSD20ZDk44W0q0eE3x0SpbFtsKCvn/ouKn7W23zGnOKE4/S
	etMDphXrCkKVJDYmj+WR4BHxmuQhE1vol8zqT8aJHJ/pk3G3AriVb/4AKRKKmHugEw/GAyEfTMoU1
	mTZwTXiqgt9n5OKtL1I1JxolwocfgXWaWRNvkFUU/X5a+yMpCTa82IMqyEnKHNuCvx4LsFKnvtgWT
	VaSAmEnbrmZz7Yc+QjTzFOe65rWP3CHwm5nhtAZwEe2Ss/fJNMjyXxDpfrfw4FcRVnbcIy20FupBo
	eDht1QoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI18D-00000003KIf-3gg9;
	Wed, 29 Apr 2026 09:22:57 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI18B-00000003KI3-1ZrD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:22:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkIDgYuReAnsIY7u6X0VTzjCUsvLkxUVbEjdPuBkWnflBCK+t7NrqSVtJSGRbUQndFtHkGAcLc7EolmVp12wmEa/2aYRDs/gAdi2G3AagMBy1pIz3BhuzitA78eDK9tyfAXUPbEDZZG/mKkSI/3sgJ6sKZlR3M0Y84zteKRXTMn8f3JgAOm1e55NZqZLvKR/huKekUuJ3QwCSdSHW0dgNldTQJEHQ7xOfTXaoEv21GZKwraRzFGbiD9l9W1N9Glm+fEy8pGo6aF8ZjV2kqRIFTLBVxLNQZCdfuga8ZYQfO1GVNSdad32JL+Q6qjmkFQjb0iZFrO8ZtjOi9TCqL/2Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsXiCI17YVzjc1iKcYp+3g9bZjMZwrSDSK7F4B5xZX4=;
 b=g95ksCWVUD06T3q9f4wmJdi1pbg2r0JRVVEE2ChyPR8omnewSkf+J4xU6rKcNVgtApPNXXEcZxjbxMUGT+oK5ibBsWJCdTKbkH7e3qcTB0skKALSv6a7B2IhYyEWzNmMoadAs60MbzAbaxd8/1vT4oVU/URJcjLDlBExjnV55sl0zd033cs2z4ziBGKXu7DVcG7V2KfivjOZomcpl6y7e09y2P7hLTjs1s3FZ0bXvaSZ+7xelBuemdOu2WC4bFrXoHyGuBRNYpRkkQ25vP4EH7RqXNdw3c6KxJxjNx1MbgKmsyBSMp+TdZPwXCH+qClH54+KZBO3jdyH57UCXNCPZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsXiCI17YVzjc1iKcYp+3g9bZjMZwrSDSK7F4B5xZX4=;
 b=EsCtcScIeuDiGQNi0UZgIHAzjK3iprjfN4MUiauUAYkStffAljIP+IE+OJlQYGdwd7bAd3IB/676kLMfb/wd7y5tRszzKPuU30E94TXBqrKgjsleFKCMfYEA2+Q8RfRhDhgzvKPEfHvk+oLJ3OzSwbjkOQX2AKoh1wFLK04tNca1fZIEpVzg702d7+oAe/+HcqMA78T52rJRzXZx+6P8+Gp1y3eWy32vcR+B9PqFRCbn0aWe6AaR2m8MSUI7pQtsP4kT1CC2irkT6Pj1HWcq6gtwbR4j797ScjKBnAQIESLIpHIbAeRBbu8sjfhWF5vLMWLhhU7wHOPckzvMQAUC2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by VI0PR04MB11604.eurprd04.prod.outlook.com (2603:10a6:800:300::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 09:22:48 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 09:22:48 +0000
Message-ID: <d0dc01c7-dba1-4f25-88ea-a0840559cf38@oss.nxp.com>
Date: Wed, 29 Apr 2026 12:26:01 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add i.MX95 19x19 FRDM PRO
 board dts
To: Joseph Guo <qijian.guo@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 xinyu.chen@nxp.com, qijian.guo@oss.nxp.com, justin.jiang@nxp.com
References: <20260428-imx95_frdm_pro-v2-0-434240b652f4@nxp.com>
 <20260428-imx95_frdm_pro-v2-2-434240b652f4@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260428-imx95_frdm_pro-v2-2-434240b652f4@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::15) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|VI0PR04MB11604:EE_
X-MS-Office365-Filtering-Correlation-Id: 057cb34f-d5c3-43f2-752c-08dea5d0e0eb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0y260WJ5z5gg2Lm1Prl8cBqbebHqIWyg7oPp8l4iVN29DDWLqNAnYzFlCiULXIy++wPGTtKT2i6Gxhu/10naPhJGJw+O7KrejT1jcGuQt41z2DtwVyDIGQ9YqQ21n8dYBf913eEQk2uJsdjfaO1NSiS4sZZRReJW2TVAuUBcFT3CQRq0Y/PqVqaRUpedQP4/foduLnihfFBC48TU7ghpIorRMliV+IHNtSVhjZOPr8XiO32qjHPnAvv+e5tACAkJV/S2hNs/cSkcky0VXPCkdAvR+b6VrRvRZfMjgDsag4CWp+0EVy/ai/sddfSdgyEzoVX4+qVYAuB1dX4MO+Z5Eeb52YJ9GFHWn91bcGNmYFJSl9y8/mcd7YEVtTi40i4NVCUaAEhsycdSwp5Zcxf3ODjv3dxtaaaGn0Dejl7uqq6eKvMSZloeyptHVjvfyFkvzbIyaNZxx/J7RHzipnNpaeM9O3Vbf4U6EvoHck+1esmnVoELqVxsg25FgufwswXYNvyaTXqLGhnm3B/gohDiiU9ImIrCTGO/EPk/p07coU4QhU4JUyZh8wsgvx4o3cbFLazrzZjXY1ItaouJexeaWRzOfueKtxNN8n9DOzY1TTXBNFJEFsdDXZ/DcizY6KgjXJWJ5ZeyvfXlrgQMv6oa0yceIbhw1PQ++VKxV5B73lW1nhFxIw7kMhuddCnoldJpo+RP61WIvFhk07vzT0hDczlHV0pSLlyz4xKS6OzyH/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVdwMHF2czRRSGRseGNOV3hYaXdhSzI2RzVENGZLQ0tkdk1kYTcyM3YzWEJC?=
 =?utf-8?B?cTVHR1JRaGtJM2t3azMrVCtCMmU1a25lRzA4WUdEblpmMklobHY3V1VEVGkv?=
 =?utf-8?B?OURQU3ZQbVpnM2hkcGNZT3o1U2lkT0I3MWJmWUNTMGZ0MzVVMGJaY2tEcTdx?=
 =?utf-8?B?ZmR3dks1Q2JScjFUTTM3SmFJTXFPanRYYmgrT3lmRjZ4TVNzMEV6SjRLTmxP?=
 =?utf-8?B?NmRORjRDWHZWcFVoZk5jU0hwNjlxQzdqNjhCVnVCRUhEU3FBYjJ3SGJEYkQ1?=
 =?utf-8?B?WkFzY3RPU1ZjU29iT1luQWYzbXI4bkE3K1J0UDFjTTZTSEhhVHRxVERwQlVm?=
 =?utf-8?B?U0hidkVIdmNQM1REMjBiQzBneU84TXZOemZCMk5UL1FWVmRKb05HZ0JFSmxx?=
 =?utf-8?B?QmNQU3JFcE92VDZqTzdEK0Q3UXBmSi9xdWV0S0orQ0xweFpTOVdDNEdtMlRx?=
 =?utf-8?B?NjdDejhKTVZBUnJCSHhZT3l3Ylk4MnR1V1kzSTZuU1ZQRXk1NExNZ3NTSGVF?=
 =?utf-8?B?N3JBVDR1dWhVQjJDbzhYR1B5VXIxQ296VVE0eitGRzRDSlRJWGVod21sMWIv?=
 =?utf-8?B?d3o0TkM3TzF2Y0JDTDAwamh1NWZZNXU4WTJscmhJbCswdHFLdUpBS0M0QjBJ?=
 =?utf-8?B?VFp6eDAvR09JQTRXNHkzT0s2blpnaXJXTzdPTFVKN2pNLzFPcHhPMGVENHBh?=
 =?utf-8?B?M1ExbG5hVUVDa2syR0Q3TkNHT0tWMUNjcTVuUHBxbnRmMldWK05RYUFCRm11?=
 =?utf-8?B?algweE9qT01kTGNWMFdWNFNlNkhRZ0UwWWpxS1FiejJjNFZQU1FmM1EyV2E2?=
 =?utf-8?B?ejQ2M1hkL0d5SE94TitOOGJhOHFEdytRNjJ4TDFhNXhRcWp1bW1adzd1WVE2?=
 =?utf-8?B?cUtVditGUThsdy8yZWRqS1BGc2l1WS9OcWZMays4QnlnT0dLNDJqYjRScjJG?=
 =?utf-8?B?eUR2MVdnRk1PVzY5QTBPSzVPNHE1RVhDTWtZRlM4eENQcnBRa0FiNjRTK1Yx?=
 =?utf-8?B?YjdUcmpmeWV4N0c5V0VXN256QnRrN2U3WGkrUGtncmxndHlJditwWXV5UTlx?=
 =?utf-8?B?eU8wTmFXWHJkdjJ6Uk9lcWl1VWVDK2VBNVVPd1N3QnR1YXBXTzZaZkxIS0xv?=
 =?utf-8?B?TlN2WVkvZXp6ejQ5WHJ5clQ4Q1hQNFFmVmVENDBCQ3lWS2ZOT09hY1dUZUti?=
 =?utf-8?B?KzVTZ2cwellZbUE1UUhHYnBzVG5xeU1qdGRPUU9KT3A3OEFkVnFQS3VhdnNW?=
 =?utf-8?B?WXFYZzRsbU1PamVQd3NsOCtQQlEzWHRuTUIyall3WHAwYWtTR2hNL0R3aHdW?=
 =?utf-8?B?dk1NdzJReVN4ZHRxbWFoWFphSXZCd09XUCtLdUdKQ0hiREFORllteGhoVm5j?=
 =?utf-8?B?OWVuaU5LdktvUHF3REc3TWZVZTd3T2pnM0FHQXI3VzVGQXRjbWdhWmQwN1Vx?=
 =?utf-8?B?ZWoxNm9jUUhYR0VJT2UyTi9PbEUxN1o4Qzc4bkd6YlJzbVpod0I3S1RmUFM0?=
 =?utf-8?B?U3Q5L2M3Y04yM0hEU2RJWTFHVUlzVXk4dFQyWTBPTFRJeHd3L3RmcDdoUm5N?=
 =?utf-8?B?eEVYMC8zdWZkT1RvT2tUT3RmSXYvK3orZUQ0ZDZBU3BVekFyQVhJVXpPMmVW?=
 =?utf-8?B?WmNsL3BmS3JhZkJUWEhuQ1lWbWJkcFRpZTd6SFFoMWZMd2c1aWxwK1pWZUpy?=
 =?utf-8?B?TTFhOVBRak5yZklEYzVWL3c1TXZPb1NBRnBNbFFDMEhFR1czWk5zcTN3U21O?=
 =?utf-8?B?eUhQMit4TVlBV0poWkpKdWRqbnljQkFtNXg4WVFPQjVaWVVZOGc1UWZsRllh?=
 =?utf-8?B?K1Nza2puRUdZcjVBSWgrWkgyLzhXS2thU2JVQURGdFJzampNbjI3UE03NnYy?=
 =?utf-8?B?cm53UnVUajMrZFpWVUdyL3ZlYTFMeXdCL2ZnMTdxZzJUOGFYeDF2emFKK1py?=
 =?utf-8?B?U0taVEdSbjNORXowS2lLdmFkQy9lR2VPYWc2elM4TDZ1Q0hadVVLM1R4Z1pB?=
 =?utf-8?B?ckJaWXErNVpyQWE1aDc5aE1BaWI2aGhVcVVtUXBxMnE1OGY1YnQrT3BvSHFq?=
 =?utf-8?B?Ti9OZm5YYWM3R2owSVNHZ3oxNnExVkp6L3lPL0tZeHNBdzU1bk1SQjVYajBk?=
 =?utf-8?B?eHZNaTV2cVdaKzlkRGhUYzlzYUFwRzZrejBJS0RpNVdmWHc2Y1NuQm9Zcy9n?=
 =?utf-8?B?RDBBY1Y4Ym96VWtJMkdCNjlpMk5DYWFhNm9jNFRSbWVlbXRHWVBOSmxGSDdF?=
 =?utf-8?B?c043ZXoraGNVTmlIaHpDYXEzYU5YNW0wQTUrVXZibHE2MUNoMkEzRkwwSDht?=
 =?utf-8?B?QWhqQVZzTllJeG5LcTcyRDByOHp5ZFhqOWVoMUIzMFM3aFYzMkZOUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057cb34f-d5c3-43f2-752c-08dea5d0e0eb
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:22:48.1575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4z6NFYH31cEQyZluFMVekb1bxVNXezkQC/SjdfupFXhUncBQExGl+Ix9bAxZf63P/xSsNTaGmJs0xhhepfzUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11604
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_022255_419844_359C4273 
X-CRM114-Status: UNSURE (   6.39  )
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

[snip]

> +
> +&flexcan1 {
> +	phys = <&flexcan1_phy>;
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	pinctrl-names = "default";
> +	status = "disabled";
> +};

Why add this if it is disabled?

