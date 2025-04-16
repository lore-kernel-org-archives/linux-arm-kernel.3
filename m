Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517A5C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 15:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6Z8TFkFg1kG4Egc0y1RldD7m7pN16CW+8yq9DQwyYI=; b=Lb6l2ITz8B1sjHxMhM0BRLkpNp
	3RhOJh2KwS9a/HSwxGYuy+wBqGdfQohCJd68hnBpjMOqq8RRBDP6NN4w8ATu1ljvmjiQYx6bkCmGl
	MlCvSCwLhR284MUryiRW2NB0SO8YqhZGusF/CBJVIz+UTHJoLacdoVScQVthPB3JJoddmLEwBpfo9
	+Ciwlj7FsQoHJJu8VH+8EP3+YC/mv3gdmhnOHBwljMJj3XwRbe7uny7/Uko5ZrwkPgzpx5tzL4KvV
	dVRyeQKEhDTePmws8tWsqic8KMJsS+drL2tOZ5sffMZEPGODkD/LSK5TUUKMKBA9azUTKEsoSU7tb
	1SXd5VHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54jD-0000000A5Os-2hjX;
	Wed, 16 Apr 2025 15:31:07 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u53zt-00000009wVR-2xPm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 14:44:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dn/hDTvFwE+aakgTEuwm0m4Db83Gq2tgTGPySNQqfysr3saQlWIbaTHCDUjjunRcHN/naiqnwHidC88/fqH25IFO0OKag2S+OK4PHPLtdc7T5KGnlxHrhVuGV9s7prTI2+DkSW3P+lap5fGX+ecT0FUtzzCHz24QRbw22dMssXbKQXwd53FDeB0CnPBW2CUCXQyzgF2JYSXb4kMu5XAYzr1sNcr8jnHSVUJH+yoFHyp1UtYtikahNpuaLO22qn8BKzV/skEvbvSKk0CZ2LghkAXQLJRwf/kU4JDzgrMKhITAkPFLQTgnrQP/HybZhBP9iZ+9c9v1mcodQiXz4u8wtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6Z8TFkFg1kG4Egc0y1RldD7m7pN16CW+8yq9DQwyYI=;
 b=fMGU0f6HRlnJXlaMQQ+VebH3E+yGaDDAMhte2/PFaQZLgsfezu5EAZzFFwZotPmtevoBOujkswqTqfBDV5B98dBgEmw+OiY9sb0OzKVZEUCr5bP+4lSz1X7i94tg7h6ZME/bpemPFskk59dGCBfa2yFdukImU/N3JIXB7FnSErc+joSsOlcz/B5oZrkc5owrFFobMmhA5keRCkh9M/+rYKCJfQI6y/+1QoIvNDo7nFWYyJlyi8trfQ+K9L3ByResONzqJhwWLRfimCVgyYHbNHgJ9t+TQhzVciSV8QMmcSHYWqUwvy+yEx3RTrIiit/UlUNqNAZW0WlZxMKyzESnTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6Z8TFkFg1kG4Egc0y1RldD7m7pN16CW+8yq9DQwyYI=;
 b=jJUDI2K82pi5SoZlPWV3Wmlvc0NiCQPBc/Ubff5RHiPstMIXflwBLOXVsDHwOuJVrHkyL+TlD5fGdnYmKNxvc53oFpYDEXmDH+Y6MvPMPMKmTP9wgpS1mGEjch2vDSYte5qmAHWW1PEGkX+tGiDhxMnn3e14YiHN1tWfm8jcU6QdSxlKA/bAo61Gz7V/y9VyFUgcQThOVTU3gEwiP9QPcUyPKh1wv7BHewm+K9qUytOjk54c5gZJwD5Batgmw3QT3s8n9ZsMXfC6XjzzeooviEJyTxFr0NnvpdR+vwoc/e8+e0ZREznJ8PtkusVGV6DlgqAdrGDs8/K9GqTfEp8EVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10647.eurprd04.prod.outlook.com (2603:10a6:10:589::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 14:44:15 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 14:44:15 +0000
Date: Wed, 16 Apr 2025 10:44:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 08/10] arm64: dts: imx8mm-beacon: Enable RTC interrupt
 and wakeup-source
Message-ID: <Z//COBJlr9ahqNZD@lizhi-Precision-Tower-5810>
References: <20250416010141.1785841-1-aford173@gmail.com>
 <20250416010141.1785841-8-aford173@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416010141.1785841-8-aford173@gmail.com>
X-ClientProxiedBy: PH8PR20CA0019.namprd20.prod.outlook.com
 (2603:10b6:510:23c::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10647:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e5f6208-d82c-4021-eda0-08dd7cf528df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ycuCAlRDCxvger2FSIvQuI00FO1lmztdqDu3bthxy7/0jDe/nB+hS2nbWoLg?=
 =?us-ascii?Q?DHT83fRfYCnHKrpvPr/oLLElj3Wokhyc/JBJOSg20kYrgw+ltYuC4jK1z96v?=
 =?us-ascii?Q?7JtaTqehNujkVuD7tQWuiP9wG4CuFckAJVgops4aWErKexjEf20Kovrv/gDQ?=
 =?us-ascii?Q?PUga6eMVSDSv+Ae025VVFk5v2TQ14p5d/PJ9jaUATIDXw6pNYevvQBnOS5Rg?=
 =?us-ascii?Q?KM/XxeW9YUSJ25zKH9BJqYPlRRJ3VGA0Ena0vTAZGTOOBvzFklg4R5ZJP4UV?=
 =?us-ascii?Q?OeIjgSJFqS9SMr5nmr/Ffq+UtNyH9o+EE04yteuRniHkUjDd6kbYFwdiR+MT?=
 =?us-ascii?Q?mFLtE4PEHEdqw12vvcsRQDcsfR1eDJVf0aR8/IvwHIEe7aqvZslbDhIjWR+d?=
 =?us-ascii?Q?/Z9E8zW691F6CiVUnDVwLdFr+8aM+ltaLtVoedCT7EpSgiBqE3jWGJxywHAs?=
 =?us-ascii?Q?vj8TFSzbzgbx1TEfeIRDbPMDZYrISADz/cbKouONNuSbV5eLHUsOKKKBUlcj?=
 =?us-ascii?Q?yHrIBdzHi2hVtpAx/pVXQlydDtLlQFTMXJNIPXrkIIc9EI1Le6FUYeV+hL6j?=
 =?us-ascii?Q?stvBPRkpt/wjn16eDk4q/ToUcnJMj62SIJ8xH74cEgzmOAkLXhfUAVSn4k1d?=
 =?us-ascii?Q?A+N3duwjq7DDvN3CpdM+IjlZw6myBkIxIARcuMSaUNxDfDqIXtJW1Exv+d/8?=
 =?us-ascii?Q?NpJtjzx2quzdlNh5Z7v9gSqTttp2+64dpa6AfKl32ISbVSFeYN8wXFmn9soG?=
 =?us-ascii?Q?Fv8DfgskirkaLtmSQfWhsEsqOPpkSW/zy6ibzIq3i+Fwfk3Kvs/lOWYBrm4c?=
 =?us-ascii?Q?1odFDNoRhXMJuUtOmWZzqI5tPimxeMoSVbZOZeO29/paL/uUQNg2duOd7K/r?=
 =?us-ascii?Q?o3z6m/VO+m/h3MvUDM6jSd0BV4ovzjk0MYVMv/qfzYEcY1doxCtAEjaCjN2P?=
 =?us-ascii?Q?5VqoFnkH738mf5AvY5H7E/AkaYGeZwIpF6EUJUw4870VgrUGZTwbp7a1cJsU?=
 =?us-ascii?Q?CuHK29toBmeuS+eSZhsf+DxVQBp83MjH4fpgpl5Rlawwve/zQOay2KniFJ0G?=
 =?us-ascii?Q?Et5asNtmLO3ayvGsjY543bN8Rue+L2nuddsLTqwpmCae5efRQ/xB/f0UaRjd?=
 =?us-ascii?Q?QYbkv/tejZuCjT3NeGJYuPo58kqgy0r5pEr+Jw+swPDVoE8lx//ZjrCV0HyD?=
 =?us-ascii?Q?bj/m5/g9M/Fhqw89FYxW2VCGgBXBU0pBlJs46/fU2mUR5pqHNCkxCUuGU+sM?=
 =?us-ascii?Q?sTB5bCv7wxirDivduyDnwkDLNfps7F2dt+njV8rsMEZWKybtvx0Yx5Du+57l?=
 =?us-ascii?Q?17yC7baazi/A+ZI1UwbJ2Jaxaa8/09kDSvVBo/PXtSraz5g/knBFpVWyhJ9M?=
 =?us-ascii?Q?VQxxIOgH6/mhqBBdXKYBeAaRLead8AiFeMDIo8oKwo4CFNfp76QWQcUdvIBg?=
 =?us-ascii?Q?Thgo5zwrtATaZcP5aY0N9B4cxqTMijTz7rEi79c3T/WfD8YvVhbovA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Us2iOXI6hI/mX5jwTtmGsWLPAsu2wJ1pbw/g/40tznz7bdvXrZ/PydRIs5tk?=
 =?us-ascii?Q?d1bUjIToVtIPSo5hp/miytz9FnA885C7Kbyqdx2S1k9iMp/tb3rz52qnWhom?=
 =?us-ascii?Q?1Jv51pzQKPUG5utdtfFf6UhU3/esyA7de1/+v4MCnH+Symn7Qn7b2GmI2eno?=
 =?us-ascii?Q?pbmJBzJ6KqUIxGKbyAptgI79jOinWiw2c6ipfkPJYhzgkSZVHkSwC4fFpnto?=
 =?us-ascii?Q?kjCCwqSaRCP4BfWSZlbH1jLIeiTZYCrsjug/IUBLILoT3A+65/7UczI1gBoZ?=
 =?us-ascii?Q?RvnB0fcfhgmqOIPssDU8sqZE3yBgZhFI7DFyASU5pLOSwfkX89eyq7cyKN68?=
 =?us-ascii?Q?NgFjPLq8ojQHjvJ8XqngvVw1z98M2p14Sz/wCfPJZ8jvYcfV4QaY3fL8zWRn?=
 =?us-ascii?Q?4WQeFTQDcydcKVVFj1297Q5PP9aYKRXQiDqq0wiEc445XybBCggv9Ctz+Q6G?=
 =?us-ascii?Q?HMsP1Zs+lUL9Hx7unyCiY4uXT+96SXFBWo+SrHvUU0HcH//C1MOdyHLYyEwR?=
 =?us-ascii?Q?fVKLAlodyaGk7b+IA6n4VB94Tvug4HouUp4Ffur19ils3LPk/wyzW3NXJkO6?=
 =?us-ascii?Q?fZ4HqAD9boISvBT6mxpFZC4lSk97VJXdr7tvTAwS69mFC4b+YLAo9ATHyne6?=
 =?us-ascii?Q?dwWiaBmJH/LW9ivBMVZnVYabfvtNnqzcmX6xavptItjNIa4qu4lxLRXvZMYe?=
 =?us-ascii?Q?jEW31aosBATvRhMnhCR+AGAnnnM1NGZVrooRpHbMyiBLmv/NPYTey17xtn77?=
 =?us-ascii?Q?ff3FHND7sZxs3DzRKppPYEVBVf00a2FFA6Sx/8I8pCUpHTeKfLO/S1GrR+Tl?=
 =?us-ascii?Q?nh7cDuo5P4bVO2J0Kbnqd/SlbvpZ4g3OC6Wr9qT8EUj+eNvoHljVSN1dYc/6?=
 =?us-ascii?Q?Dxqw6WIFrHY0/IcXmI5I0CKgrd2MEQWOZGrCc0jpZuV2AXaNR/EwFP6fRB4e?=
 =?us-ascii?Q?YE/X1aDvGdScbSqx7wwxb3no9FmFCqyXfsM2ysG2CAaYvHRGVuA+RQKXQCaQ?=
 =?us-ascii?Q?is6Gdxz7F4u1IxJBJUMRnCms3VcIrydI82sYimu8vjrF89aexhVOYaqPxJ+7?=
 =?us-ascii?Q?TVa5/27MTJF6o8jws0+alskQ3SUSnHyYFNvftBOncVJb2USQfnlFHKkI2WpL?=
 =?us-ascii?Q?d6GAN+oXWiG6U/xu2edGeYjYUh2IZ/lIznR0DmwTIzh0NQDQ885BQyXXfHy6?=
 =?us-ascii?Q?LPfolRxqUtAsFJvaVbJrvytcDr22HnjNqWS+qOtKqQtsTM1+9c6VFc5NkZPv?=
 =?us-ascii?Q?zUBB4j736hQiAuqqjsyPV6LVNaRHE/oRD3CA2z/NVH56dshtzTt31vGRrlPB?=
 =?us-ascii?Q?PBxOaKibHUDtP0flwJxb2UF/CKSrxMnT8hOCwnUfKpS6GDeYZqiwFWzy42kj?=
 =?us-ascii?Q?cK16GIzRtEkc0cr0mJeO/QJFub11Wlwg81pUag0CFI9vdVWfBGuiAEqifZL3?=
 =?us-ascii?Q?1u0liDIbVx2kS5dLMqgKOrsnhKLUlKaXfA1cp9mtpCp6bLe70DOpVahGPGfx?=
 =?us-ascii?Q?QUnWQEWKZkOpt3VoauUhjIV1GS1WI0RPqJBFEeo/QMnyhjevR2ZNYK+4VeFl?=
 =?us-ascii?Q?+3OtiwqrDqEdC+BwJK0skqhCQsxSsDZFyK/9+d3e?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e5f6208-d82c-4021-eda0-08dd7cf528df
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:44:15.2791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9fgY+zcnFQyYfa0ZEfmf+w8HbjCmctltjCVl2zeRT3XCptKjMgRCY7iKajgvnT/82gsUz3knlCWBvE4YmXIvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10647
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_074417_745957_B691C8D3 
X-CRM114-Status: GOOD (  15.74  )
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

On Tue, Apr 15, 2025 at 08:01:34PM -0500, Adam Ford wrote:
> Enable the interrupts and wakeup-source to allow the external RTC to be
> used as an alarm.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> V2:  Update commit message. Re-order node
>
>  arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> index ed7a1be4a1a6..c7a8f2a6fe90 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> @@ -236,7 +236,12 @@ eeprom@50 {
>  	rtc: rtc@51 {
>  		compatible = "nxp,pcf85263";
>  		reg = <0x51>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_rtc>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
>  		quartz-load-femtofarads = <12500>;
> +		wakeup-source;
>  	};
>  };
>
> @@ -354,6 +359,12 @@ MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x141
>  		>;
>  	};
>
> +	pinctrl_rtc: rtcgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x146
> +		>;
> +	};
> +
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <
>  			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
> --
> 2.48.1
>

