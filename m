Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCCEFD3762
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 15:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJaZR1DIaZ0pE9xer+cDQxCvogo6fYC4get1TP6vLE8=; b=UV6S50G4iNoljFILL9mqmqLCIg
	J7qfGGEDTA2sERn7AqQKz5kIf1z1nIbnXukfgIen4h9vNxHimv6wnApC4l5f44wqnIJTJSB3TLxp3
	lzQ+SXKixZmL6ZCstFy1FDHNzdWGvEQoqOjkUeerDkoizt09NxF3YRroLRdtmRMLcgI0e+nQfzhX0
	AR7tmdma5U6EpuyhCTjgtEniqS0/FfSp2T2CQwHUQIXXyFfk91uSxh1PkaxfOqhsD/d3JJ+UleFdu
	67O6QbW6aXgR41zc9QjcvfQnbXrlmScKMrvAmJ93quJn9njorGyfWDTAscxaqZyVhntglVpCAqeil
	OK5c0cJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGbt-00000004GFG-3ITE;
	Wed, 25 Feb 2026 15:15:33 +0000
Received: from mail-northeuropeazon11012047.outbound.protection.outlook.com ([52.101.66.47] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGbq-00000004GEk-3YVp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 15:15:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYOk1DmDDVuwRyPdXJ0wI+L1JxxKFQLJ6Jw9zVTOQWhLBAMuXZupq2pNL87LztWXG+IPp716Z3iNbDbOOjvBlQUv9+rzh4qxWhbY5vkyok9wmK6tYvS8bHeyMKs5cTGbGWWx3YgmjL3iL712rAhi7k3x+CYy/uF4l2rxvHNmF27o37jKhTjWMupwus4+sXAuMVYrY+DH6ylJ6vwGwWXfWRbll444s97yp0IifDbwf/cYstcs1OA5D13UYy4fgqZtUvg6ldlnKS5VCfQvoW7BP+Howq+WqU/TLQ2DHaGF9yI5IvAs1/ogo3kuhdDqXKAWDcQiFQtmGiuMhovpUi+8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJaZR1DIaZ0pE9xer+cDQxCvogo6fYC4get1TP6vLE8=;
 b=nGfYO2x1mpjUkWej8rXllPYTzMKA39HhS3v+szrVzzh3tiTwuwRRRA4v3nFg3HBbrrBsWVwEJa4g+5pSGlveJKGUteYfSxZYqGNr5aRbWXP9KbhxYPvlPr1PgJwVUxS0kACRI7nFttX+vjBNQZDuD+kHlk35wjgFqfUW18n1koXSlL1ZNeluLdjmvkpuyQb4MR4NlI7hHnWy6Gh4pvojezJPRXWvP+JObB32IxYBsCq11doVukuRgy/qdV8bEFzCE2uYv1SP6IL1ycc8TwWGvFyS2igThW0XlTmsMKeIryhMvG265tsKFLmVu+1EPL/5/yEuiJHaf9cDeaGiuPFuBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJaZR1DIaZ0pE9xer+cDQxCvogo6fYC4get1TP6vLE8=;
 b=eVwEA2Ab2GeApC3G1+cp56KSmoG5vooBdCNOOxEfQx/iUqMQXs9c1IPIDnzhMdh89YzIOJNgP8UWllAAZqNlDE+nxvvegwmVYY8420g63MlR03hRqz//QUqW7WHjLG7BaIuqZnJq7NTzEgeBvMWaQqoDNGpcUAtsyxzAqQFmxSaPb3QU0Y3AT2PfDS3FWwLBuIXLFsAnOJ1cT8GNTpTy80R/u6kPVtfcLPASl3ilhBESDXfgYyiuOt92HnLTjllTHKCrYE/ccB09BPH4BIndNT26TrdT58ood4gDHMrnggL/KXxhk6urahrQ3McDgqO7zAOeuBcju+bc8lOZTdV2vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8223.eurprd04.prod.outlook.com (2603:10a6:102:1c9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 15:15:26 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 15:15:26 +0000
Date: Wed, 25 Feb 2026 10:15:14 -0500
From: Frank Li <Frank.li@nxp.com>
To: Wig Cheng <onlywig@gmail.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, shawnguo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	zaq14760@gmail.com
Subject: Re: [PATCH v4 1/1] arm64: dts: freescale: add pixpaper display
 overlay for i.MX93 FRDM
Message-ID: <aZ8SAvjCvTyLNi8P@lizhi-Precision-Tower-5810>
References: <20260129022910.3942028-1-onlywig@gmail.com>
 <20260129022910.3942028-2-onlywig@gmail.com>
 <aXsdyzZEUaVzC34W@shlinux89>
 <CAPStFe7ASmYxJdDorJ0KAerfTH51ioZ=89F8fRcs6fBVqqhdUw@mail.gmail.com>
 <aZ4HrSNp32lbnVT-@lizhi-Precision-Tower-5810>
 <CAPStFe6sFCo2-+9ataPBy9pvEUo_uZ5G7XNA_8jH+sF6=FNOpw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPStFe6sFCo2-+9ataPBy9pvEUo_uZ5G7XNA_8jH+sF6=FNOpw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8223:EE_
X-MS-Office365-Filtering-Correlation-Id: e9faecdb-09b2-4529-0d57-08de7480b3f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: h2MMoqhU3pz0fVZW6QsPFV136T+GCS94IZxd5HDkqSKfO4deF/PtCsYusx9RnfvVxLaCMwoEN9ptiRagc55pMLTLvHwb3IIgDcVjyIAUHx++QGgNqWLn0ls9XRhITpWfYcv9c9MzGowSJQkD9fmuiR2hDg85ju5WK/v3Q/Wh3UNj9gAD2ujBu5Dwg/B/ploaKw5oj0Xj2EF3UFOB9qYBpSf5Qzye3uhMIOyq/qg7HFSiVKoQJGHdCgikLOoTbdlh8AQic6PvTU2b4sb/w3nJUt5y+hBsURUm4xuORhYNeq2HKsHGzrt2wrcRz1+pwiZ1MEnM887SoyR4mtGhJTpJVfgGQVzpDsojkD42l4TdokxFMb04vOuwqPhJVRLqh+cJPt0cKSJ/3AKC0kzrRdmKGmXDwXe/LFtoVdYrMYvFKajheAVPD6vXTD0fXk/jJ2K0ZfpctYRJ9b5Zrkg7X6Q7R3ClU1Cn7iaGl2/ko6FztY1aEJ85zHiOTyZzs2JZRUs/nUcvsaFd/ksg6vJGc1czqiUZpNZW8ab/in5ZbBY1cBkXZDuJfAbCuDeogPHDjdIeEDvs33YtQtRI5hCpSXbWbupuUJrTE5EyMxzOBgRRFlEOUz/EW27Fi8Xk/zcfSaAGTsXY3JNtwNVEgJP/OYIokA+1eAt0YSwgm5UT4oaPThttVJEHQEWxyRTDUtpDCN9plW7zX2qgj3icje9M23gUQOQPKeToGXTQ6mGj3e+N3KYWVgcDpj+hkmEbIiG0Sy/1Cd/38zv1LqCFQl7JH/ZY6wXgHn9i3j1pVrUTfSa9VcY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?exKkeN9egX1A/aOpCpK6WSEV/I6r3yRcgRQVvYOHxcrG+Dr9J0oOOo9KPrc6?=
 =?us-ascii?Q?/9+3cl/0gUcMkP8GXhnPGNFXeEu/T/SHS9eSIRkDQP1nQbKvk87YqOfvpTBL?=
 =?us-ascii?Q?n/wxw3t3vUHQa0A/7uAM15Mm1wZf6jVFGyzjBK4OVuLHiS3fCkqdmknqvvpj?=
 =?us-ascii?Q?dBNBrguPmct7R2JzQe22sP10t3DobVf7YXBM4imZ001AaXS7ekKWUbkRmL7P?=
 =?us-ascii?Q?QGC2XH9bMZDaEQV0Zla2HNrxfAFOoeicfP2VUpQp03uIOcSj/n9uSd72iUBV?=
 =?us-ascii?Q?2vQN4lAkGEKMh+vXlXhlgzCUXS28l8Q6DqINMIbsxUiNYu3dRssh+W4ZksdB?=
 =?us-ascii?Q?3WX9F9f/RtXNxWDc5e2hDt8k+4C29lL8JrIr9d2wfW8OjbEgeekVD2yBRXwr?=
 =?us-ascii?Q?3Hh2Uy4zXoeOrsc8jLFrKZpoyttpGJOuuKRxXYF96x+IOyACV3WunXTQRwuJ?=
 =?us-ascii?Q?v0hExBW/X19rMSNx53sgiYGO61B/Wo11Gff+m1+zN5lo8fzrYEsgiq/T5+hV?=
 =?us-ascii?Q?3UGdBrDUJHAl1Br4iBD1rdwMxwVvJOSpOnCja43/eWOwEXQVMRvSZpXhGSD5?=
 =?us-ascii?Q?Xyi1zSkBxVMv9D2MZ2aoSOdsLkZKfz/Ntjd/x0mvtpO9hUpq8dlZ9SNozcsv?=
 =?us-ascii?Q?yz6LRx8rcT/B195fmLGMX2812j6ro1V6I9XbOlV7WhSJ2+Rg/LZVcm8iWufb?=
 =?us-ascii?Q?td4JkUacHc2ITLHHjrKq5KeN8c26/MnRkElN+n+qJJe57J9+0e85iYgHJfkv?=
 =?us-ascii?Q?1VSdlbHAeUXmfuGOEpkisAw31/tiEOdyfOeCrzRUOdwtJnBHmDGvtt67QZS4?=
 =?us-ascii?Q?oP1azong9j3rcWIYS9cilmCbtco+sKc1RH1VF/BXq8glZyabQQVv4yLS/kpE?=
 =?us-ascii?Q?5dzu9XfN8sPXc7EaFcSEJF46DB0MUBvELnb4rBAvPWRFF3AVv4AieEtOc2EN?=
 =?us-ascii?Q?jl92IEc5etLxoBpFg+6+wK3Jig1AZwYAUjiUQZy3eHeRw25y8c2EfaLolOCQ?=
 =?us-ascii?Q?SinQf/hYrLF2+9kRgBxJoMUChvYbQggK56cfMSBfAulmUsYiJOT2WP0FMeio?=
 =?us-ascii?Q?fiJ4FIM8KsoMMagWrMyaO7Clsvspo3jeX1GDwGFEiAK5gUnhmX2I0V4bYBqG?=
 =?us-ascii?Q?K00gtSscqilmsJsf+J08cQOngi8rLKpQdhZbZtFEf4PMtojXeAQtR34FhvbC?=
 =?us-ascii?Q?4gXh8u3AFoo6v0vhxW0wNUVr6s3kBRpnVYNtcpUen8TAmaQUaEflbFXvZ5gP?=
 =?us-ascii?Q?CsK8SaBGrPryMdFq+TFcPA6bsH8LMSVA0Xprlos5ryxD6cOkfyc4ke386uQT?=
 =?us-ascii?Q?H1F2yuOuUKrNLA5Vk9BhWiEb02Wi86Rezcj6FfKAYj1xPtbOJ/PlaK0q2Nbc?=
 =?us-ascii?Q?YcH1sDfxlVbq5boOEzOVz1rfVNCNDCofJWbBm41nZeydKyvLq4PCwp1dnrLE?=
 =?us-ascii?Q?rKmbZYkZGP0i6SQS2ZLuKy1AdsOy9uHdSKn26+xygwPCFuA8PMuyZEUk3cc0?=
 =?us-ascii?Q?0JTKI5wmPwxHdAtIE9Bazx7EG8yRwW6wxsJVosVZaZGkioxDQAtWg2WFy7y0?=
 =?us-ascii?Q?AMmvajKtNoKY1WG16rWL1/1xqhkht7d/l+MGm+8R691WCCswDloNi3rtz+eV?=
 =?us-ascii?Q?qWEsNXUP+mfbenHYgIdDhCIf+vw0hFGkO1gI2JUSylDq8Xqyhm7ZzUmyjht7?=
 =?us-ascii?Q?ZtDs55Jj1jQOCUN79MsGpVv3xkMkJDreUf1PBnnoYCevgWeIzsgjCo0Ld/oX?=
 =?us-ascii?Q?p4xuupl4Tw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9faecdb-09b2-4529-0d57-08de7480b3f1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 15:15:25.9981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TPe1pDCptKOxXodEtLr0tw8RwH03TYCCu3du3jbBHmhUkCsLVm7c5pZX28NL7VZgIpNocRllbwpULshytUJXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_071530_892020_9335B34A 
X-CRM114-Status: GOOD (  11.85  )
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

On Wed, Feb 25, 2026 at 10:11:02PM +0800, Wig Cheng wrote:
> >
> > arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: display@0 (mayqueen,pixpaper): spi-max-frequency: 5000000 is greater than the maximum of 1000000
> >         from schema $id: http://devicetree.org/schemas/display/mayqueen,pixpaper.yaml
> >
> > Does 1000000 work for spi-max-frequency? or need update binding doc?
> >
>
> Both 1MHz and 5MHz work on i.MX93. I chose 5MHz for better refresh
> performance, which is within the LPSPI3 controller's capabilities.
> The 1MHz limit in the binding is a conservative generic value I think.

Okay, let change to 1Mhz first. we will update it after updated binding
doc.

Frank
>
> Thanks,
> Wig

