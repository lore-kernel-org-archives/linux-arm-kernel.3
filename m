Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B25D7495C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 06:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzecqinKIGMvOs9fsCuNiHV3v0TYa7Dj0rnyxkN/uNQ=; b=ZReAMvNGCuEAJ+z7GlCPH9l5Ji
	kTN9iZyydGFWzx6crkOIBXXlcyZoq6Q7B6/QvFKmcFxdmPKpO2xmM/wHZxCo/mo/AScRi+NH8j+3k
	Z4K2KzMr+ZGA3birhwnzlPBba5A3ib32OIGwlfCrykoNWR9WdHYjE91R2ArOaniM0U/J1LWnyPEQ9
	70I4G8bl+myNHvq/7LcJ2I+Za057Zpd5wKSR0nBjfSD1e6WCy4AK3QEwXo9x9woCIKAQqsDVjclO/
	BEgScA5hme6xheQ7y9h2BQgsy1c/Pu03G8VNidkYXBRQCOtCmOmRNlLIASzADxGN7OJd18EWbRIMB
	vV77zPtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWU5c-00000009iLm-2ivn;
	Fri, 19 Dec 2025 06:35:48 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWU5a-00000009iLJ-3eVF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 06:35:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mD9cWYodxM+YiX5ITHf15MenZh9yZ65b+7g3Rcuvd/cXbHoMYki8wQWtVd5ETC8YxeaENexRpxPXhvjaRjfs0ri5Z37AMqXOnNZRzuWFbqtMejLyogHodxDN4aZvBbUvqlc//DTZro05+qYlUUksV67a7+TKxb6iU43MhY85hk1OCqIcBURQfFbp0AQppJmQKZNspu5MHwxkhwVGroNBFBgneYYDbnqMkeUwqZZQrmk4tfQLjjHnAWmPR+lZiePZshDKDux+0E4LXig6BtmpD72+34Rpvclyxcxp9gGqsLc+pYjQwvu+rkLTCZJpsPNFI0ReU+P36lAQN7n2529gmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzecqinKIGMvOs9fsCuNiHV3v0TYa7Dj0rnyxkN/uNQ=;
 b=Nq78Jsrgcw5pg8rmqnJf3eZWdjbWoCLdeEx3kILKnHxfIv6NSmb7vpTGkl428GpZeUYFyxK+AjLEPYAJ0RUkogDbkuNaoOxN/4Mwc8drBN01ixwjPRqYB1WUkMauje3znUl6dnv7KfuevVroiJJIgWU2Xrkf5RkZKDn+VM34ajR4LHH3Dw5jjidmkpqIjjWkoIFOk+D/njjfTnvryKKvVk8KQxG8MygyoJ4NJd0sMlUxL7kKaHj4i9iBdWOO7oecfmAN0EXSmuNCEINHgw4p/GZPxD5TdbOE1LoSBnkwZifNs4IrVS+DPZ9tbWqUCJF59HoNoWdI+wOQmhNK8F3rnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzecqinKIGMvOs9fsCuNiHV3v0TYa7Dj0rnyxkN/uNQ=;
 b=issiJqG95s10Ifs0lNNwObq/DSSaC+VVDDIpALKLap9eCEmsM/Gv4aZtXwRHBKcUq5VAWv7zSI/ejzcHiofWkdwZMD9R6BYhy/g40ZONkRPhRIF8w/HBRHpiNJKWMFsGlw9vLVajw3gSWhsX7XA+crOUIJgzhjUeTkQq6LaabgbUBTjeMS0NW0XMKk6VBm3UNmQ5sz9RkVKwzy2OqnFK8dRl8Q+JOmHwKWMN1V5MutioVuv6gW5kjzVC6H0kaj6Gao/aj1AQjZMTLFJumi1CM+oWoVufup/fTqeomOblmrkMMDk6Dsy75lzWDRt0kYHVF6e4N1WoT9KAfe0nR0Tofg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10077.eurprd04.prod.outlook.com (2603:10a6:150:1a5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 06:35:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 06:35:37 +0000
Date: Fri, 19 Dec 2025 14:36:48 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v23 0/7] firmware: imx: driver for NXP secure-enclave
Message-ID: <aUTybpjIEoFFOC3o@shlinux89>
References: <20251219-imx-se-if-v23-0-5c6773d00318@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-imx-se-if-v23-0-5c6773d00318@nxp.com>
X-ClientProxiedBy: SI1PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10077:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b918c1-f179-4884-610a-08de3ec8d23c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|19092799006|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iL2z89vID4242XAug0qW3JgRpOwqtmK/j2uQJchMIBnOHhh42xr/wPMdeYn7?=
 =?us-ascii?Q?EVt0Vsm1ky2SjbeGT2deT0FT1dsb1GnVhK1onucr6cLn+0Oe5ZaM4dfgkd+W?=
 =?us-ascii?Q?1FWVAEkO3wK3Vc18cKzQ8QmtoGuRE15Uo23B/IQVGLAFqLSbxXAbSjJvjUEH?=
 =?us-ascii?Q?dXJyIPjJNZTefahgTQUVEnQdru1mpJBH+eC5s+UoBXj8N8VhpmOLTDAvCVRI?=
 =?us-ascii?Q?IcV2x/4zYxGZ6RKCd1cwok2eoC87KXwq7HdjDHxEASMOLTk3GuDYfj6bIhv8?=
 =?us-ascii?Q?65ggwZYvSRjIp2bfHV5pfiuOFJcorPcW49y7pMshrCzuNWqZWHgyDAq3IVAw?=
 =?us-ascii?Q?CIGx23jz6RZSQn0MCTQvxD6TNypG3zuXwh53Xvh3RGYud7UDSzwNp/tQ18Hh?=
 =?us-ascii?Q?5J4JNCU3xQWctG9AXbaGuccSI5CkKsvbITriRq1+dduDviI6J7wvwgLS+hKi?=
 =?us-ascii?Q?OMyZVkZ5J5EU3Kw26EbZoTqdh9+n1xZlKBvQP4ZwXNZrinrG+5DLAaBYW913?=
 =?us-ascii?Q?przSe1a8wVqU99gj0G+jFvf2vf24NG9ly+och4MV2MDesCYI7ULJFsuX53Ye?=
 =?us-ascii?Q?wfVGoAA1WuCOns7f9zWtK8DWy5Xn1BOuer2+gpOfA4zhLWrteAt0L/75pAsJ?=
 =?us-ascii?Q?/4BfS5NCqj1v5JRTORDyBRde9ea7tipaOy+jR4vI0RAbfkCIi5vDz3tckIGQ?=
 =?us-ascii?Q?88qdocZDCcilRnp7QdrcdkDPPnkJfiIDAaA5ZSh/su3WkKVJhChb7rQju6th?=
 =?us-ascii?Q?PG8nm7Phfg0uPL0cfWvI6xacjdmgkD81RMCnY4vV14v6WgIvk+byPCFGIKvc?=
 =?us-ascii?Q?2iJ/gscl7Cbmj6JflJ3tPjen6iOmCEz5sGh6IWYILXxWSZbnXo3eRrCWQDSp?=
 =?us-ascii?Q?6rFQh6b6BA07pSCW+fPEMvHIGCpauMkgVG/tug48VLQNbfigfhVszfOdBWRi?=
 =?us-ascii?Q?QDX7p/31R3aB6yBmkAhjUE4HCpf6EuIZYKEC7qZF2rCQjvWnGKPJFAXv+JXS?=
 =?us-ascii?Q?60GhmmZY3lobpM6NfJgXlVPCsMtAUkvYRWe5Gweg12KBNA8Vfuq/WsxaG5tz?=
 =?us-ascii?Q?/9lavzAdNsVmKs1B4ms2H2yssA/XMwWtxrvXV96nNZtXay8QPVTpjqupuxsp?=
 =?us-ascii?Q?oC0XDIr6WGDEvP4nAoE2TUvXx7aZkkAPt3NKJ37pnb4ptCVpmMPxHF6tSDMc?=
 =?us-ascii?Q?RFUnke6sw1VOYefxN0zbJ3PUlM41hoWaKbOi/0KbPDtt4Kv6/BZ/UF4/3Jxx?=
 =?us-ascii?Q?aZ+xUpIbrcnExTQorOPc5KkX2tfxQJFMLy5gg/51pOTYiKm1i6lRjfGY3N+x?=
 =?us-ascii?Q?WTEEKOOfuZiqFU2vYd1gMTF/wlw9ppr2RzDPoddv1GvM2tdl2dB7lsa8Gzln?=
 =?us-ascii?Q?BRrOmgC88l6ZPcg2jE5OAE5ZcyNgMfx22Rzslcy4xcN6AdLG03DGwqUJvPc6?=
 =?us-ascii?Q?ImfpYvz85QidQI6NkWngx+NkIJO2Mr/rKSlrRZA3W+hAZ/r+/9i9gtRM849A?=
 =?us-ascii?Q?9x7+fOPTFkNaI7pnog459A/LwC8ADNKhvfRT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ie4E+rhWrAurqUBvdhMV83FIiX21xrbo3yGUqajOvAQkZtnKlin6eV7jqGt1?=
 =?us-ascii?Q?h6an+G75/a3cS++OKH294t6wwfiwI8MghqJ/ffyy0sFwZWDmYjoB++cYYemR?=
 =?us-ascii?Q?HiAprY3+s9peOaHV88XIPw3TJkuQ9IJYHqLRRtCD6msz1VVGek1mG/KDOSEQ?=
 =?us-ascii?Q?EoEQJ1UD03mjmxh71bXjvtms+DMlMRAjwSJ30/qyes3cpO5qOKOujoPPYPX2?=
 =?us-ascii?Q?3z6N1npxKOmf61iSpS7+mvRED4IA+vP1v1qupUnMiWhi3klIC2V2du8KR3L5?=
 =?us-ascii?Q?I+9DFnKfEKpB0OY1eYRSUD2+F2wkKxvsW8edVWn3RnttapuI4tVN4YGn9IIo?=
 =?us-ascii?Q?Ftfg84GNbEec4fQskCJp2sl00Ujz9MsFDrVdfXuBE8PbtoVaercOIN4HClrX?=
 =?us-ascii?Q?0INTRxBqnZsT2lhPRg++KYVgHKr/pkPEFaW1cf2CIhStUnin/MGBE1Oduw2R?=
 =?us-ascii?Q?l6/FTESbjOgjvaqMX19zuCM+IicJUpvHvVs7Ag9KOUqcwRQo7NQ1mDEKiqfO?=
 =?us-ascii?Q?FNiBWj9vgYcWQA1WEBO7TVPWOK0NG+lDbwvEdeB1F5T9zrl1jSiQbkTgIw2r?=
 =?us-ascii?Q?5XvF6atrR1H7LmHZXsMPYCp1RE5pEJHKOnRCvPFA6cnB/4O9iebQNLqIJnVz?=
 =?us-ascii?Q?TQRAgI5xX9B3I0kBMGADqoEBjZ0QfEpV6VkN98oE1UeMO5T78+KghVKSiJJA?=
 =?us-ascii?Q?iPNq3Arr6ekNeDCZ3EfkSRKclYW2KD936JHzWOSTDK3EQQZVE29C3Haac5MK?=
 =?us-ascii?Q?m49iSxTLU3Iwl7dim1YXhfzEsYFawe7hPS5PBMquRaBqRT8HoRMRSPSXG9lu?=
 =?us-ascii?Q?NGFR5KnB8R51Tpiu9ZLahHBvJKZEqMIFbDEKIEQDchuW7ls//dgqgnsrH8UV?=
 =?us-ascii?Q?NKt8QTHx2Y7/4B5jOHFRUiLbq5MMbRcgvZnKHOoimgdNVHSti1pFqe4M8VY1?=
 =?us-ascii?Q?MedRsqjzWUliESukat7QkFY1p/mCV2bdlghEwoaPQU0itcdHvIBWWQ7eWeVO?=
 =?us-ascii?Q?CYeUi3+uvFQFjM/+kfFdWbhItNMqpSHym3hJ4KR3CZnI3Mac3C+uNfjRJwtD?=
 =?us-ascii?Q?z5g15d2hfYZNIuUKMglAhsBbo3r1RyRbvuCSSP7SVBO5sCyktjS55putP6wp?=
 =?us-ascii?Q?f8MO148DsR6FgNCKZ9F5IMI5s3SQ8UKbXYDv+RsZu6h4iu5EvdJ62ZKXS4qz?=
 =?us-ascii?Q?nmDSue/cYXh+wTzoMRRgrMt9MQFJ5HVmRBiEDEPiZzlkgTOPJz6v4xN9zTX0?=
 =?us-ascii?Q?i0funhHpeOGUoDPQYoSGJ1uh0VeOpLIi1niFm52LELbKdi/HXRDMjdSbX3Wz?=
 =?us-ascii?Q?cutqFyHIvJka3rfp624ppGStiBfg4PrcBJd4sWCmd/A+5cbocRuXSiyTSfT+?=
 =?us-ascii?Q?J4r9rdqrvg84/at71A7VE1ghVdC4Sn6biM1CoQ7lGoU6kp5ZUY+bRvKBsPzD?=
 =?us-ascii?Q?Yygs48fBP198IGXCZEitXgcmBp5kJTHVDkpSTHLCHCAR3ageC73NpCNQWzqX?=
 =?us-ascii?Q?ZEXNESK4clQEfZcqtd60YD71/2rjc1n1AfoWkga2iSZ6TeIECCMMItvZMStO?=
 =?us-ascii?Q?3ccTuOYuXHKqaTqgTAus0yM0pj7KnFYzZgQDpMmD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b918c1-f179-4884-610a-08de3ec8d23c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 06:35:37.7204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMYSE62jUA+q6Pz7LK+szfC0/VOBD+tVS2Z5l9Ax9gDu/zi/pAefyZGerAIfphZiOY8ifdDEI/JLMrRMqjAinQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_223546_943482_B1B57204 
X-CRM114-Status: UNSURE (   5.57  )
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

>Pankaj Gupta (7):
>      Documentation/firmware: add imx/se to other_interfaces
>      dt-bindings: arm: fsl: add imx-se-fw binding doc
>      firmware: imx: add driver for NXP EdgeLock Enclave
>      firmware: imx: device context dedicated to priv
>      firmware: drivers: imx: adds miscdev
>      arm64: dts: imx8ulp: add secure enclave node
>      arm64: dts: imx8ulp-evk: add reserved memory property
>

Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX8ULP-EVK

Regards
Peng.

