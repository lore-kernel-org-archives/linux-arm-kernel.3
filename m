Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C057AD172C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 03:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbSqHvuirINX50K7u84hNXXx5WcxRNum9K/lSS1IRUE=; b=SuUWM4fp7Tqcaao3tgW8dYT1lQ
	WlpdA8h6nekVw6LMXsFi4UKuGqAyCqTnB85HGjruQlAbiS8LgmZOscoG4COxk1z1c3Anw7X+pzmi2
	z3iBZXS/PMPrAanfDNmkCqj6zmQKcuF3V0NzlCCdpd0ezmmN4P9JF/KrSQmXx0Ah8oQBoXdBLhQsI
	LHhdsEiQVrk6Uov5cm02FeaPeMb6MnGbG+6wfbsQapakAPiatvi6Mns2fcidW8LUzs9O2TB4MF0Ya
	XP2FpdHRKENKJlB20lwVsm8UaKXpAg8wOFZ0eyQVmLCp3ksWM+d1nhtsFBjjtfzmrzoiBpiqO0ayp
	8AbH1nCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmklu-00000004OLB-0dq5;
	Mon, 02 Feb 2026 03:38:42 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmkls-00000004OKo-0nG8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 03:38:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlSY3dv9u8iB70Lkx+ZeG8xBOhXIBkCjmaNwvoVtBV/+FGAJAYYVDEg2FrKZDAgcoh/3tTP6yCpJzzBq3zHRzacprl+UKDKCRbGvpwK+lvZp6LAqnuBNRl353x/SrYw2Xul9MHHABw9IyQKaqanXWPdkJNYJ0BpRYKmW7VdU+JfuSG9loze7YjjPOqK3KNcib89ug2CjkCPH52T+Q7MIAM33+qmZ7vQcYpZoW0uklt37WmtwY6cCZsiaeH+BmIrrMHeMEhQOfCzcfg/YnKdNT1fgmFRMQfCZbWu2lOYWPzmnj0MNIFWkm2nPgLHPgTKCAFcUTvoSnP0lFrGNmKYVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbSqHvuirINX50K7u84hNXXx5WcxRNum9K/lSS1IRUE=;
 b=qgp6n/yIjXINGWaAePU4OLNN3zcbYjoBRt/9cqB5ET/6VokZc8WFqEuTQxUU+jySrmDPv4u/8f1gpkr0FJIXHLn/lo0utySJ8jsud3lY050myLk6c3Dd6cvR/Njghbj/1wgC8qrdrnhy2Vw2QJSBDGrlSypteiVC7+QBtavpH3hPLAHGIepn37C5KMX65PIpbGxC1eAO47NtYSmwsQ2I35b9hpxTn8CWGngK0rXVjugRQ9H5PvC/gasNCjfcOEeUnt5unlxeCWyi3Uuz977//jr+p0xGMd5bM9WVon6lV5OM5unOcr6K8Dhv5gXcVYMRB4qJhxBmJjy1i5A61jqpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbSqHvuirINX50K7u84hNXXx5WcxRNum9K/lSS1IRUE=;
 b=JT056avuEDRGgWDFDzgtOyI9JqZ0mdC4pE+QpgsqT2OASJc6lav14kD1GkVMURp5KbDonQybcpCdxmwRFkND4EHF0iTF1j2I4S2Rbayf0q7fskZeK9HBpiHC8LNqcdQi43RJsuHVSL52aZ1pu/eu5tkVLDbo6+0DNXztgC1ifVrvWZ+vECjn0QW9NRoyLV2YemzRhC8U8sKE0xvPpYA9d7jRSFwZQAxKNHfJ9hbK7XIwlEi1Vwnu027iofgLB+/alZlZ+ZudV+ZurF27CruG4+LJjZiUs9k8sws90MT425Yf+A5lUrJlwP7OKCtNWLnoJL5HCauLIY8zz/XuAg6SjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7763.eurprd04.prod.outlook.com (2603:10a6:20b:246::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 03:38:34 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Mon, 2 Feb 2026
 03:38:34 +0000
Date: Mon, 2 Feb 2026 11:40:11 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: ziniu.wang_1@nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, frank.li@nxp.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: imx93-9x9-qsb: change usdhc tuning
 step for eMMC and SD
Message-ID: <aYAcm+y5wkXtXq5/@shlinux89>
References: <20260129080439.2910727-1-ziniu.wang_1@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129080439.2910727-1-ziniu.wang_1@nxp.com>
X-ClientProxiedBy: MA0PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 336dafbe-848d-4577-b599-08de620c8b06
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GFNS8wBjnwPaFbGsp9YCBYyqg45SIodAQXuqlaOFcr9U2Ejh3DY5JS+8tVQI?=
 =?us-ascii?Q?nODrmzXUwjEGTfOizU3vnP3nAiDiV8i636rNjiPyKIVeGO/waz7Xo/ADKXZ1?=
 =?us-ascii?Q?sybXFmnsXl3IzY3yJ4jfy756W51aG06qDt+iJ/bP3NSA4rOlRuUtCIm+5PND?=
 =?us-ascii?Q?xrh3XPSoF+XClDHiiXgoHjH9XHsXXuYc55g5tCUaHfScZjlhYEm+DcPLczn0?=
 =?us-ascii?Q?H5s/aNPcN6hUU4PXFY5rhx9iFLdcQYsXopDxUqmNsJB9Enu41ESuUAhetbZh?=
 =?us-ascii?Q?XJx4Dlahv03lqUOeheUi/91uwcFal4OW8ixxaAc2m8XzZooi9Bqt2o2Yei7r?=
 =?us-ascii?Q?x0tU/wduHukt+vjtrD8jgLS86FCZReUnaT1Ts7pnufOYZf3Z/TGSK8eAVouy?=
 =?us-ascii?Q?yzMK6t6KoZd3SXkOrb/N/pGzKrTI5TLEjkZZ+rGXNjKPS1fxsQV4HGuRkbX9?=
 =?us-ascii?Q?bRjk7pIhEe/RVB7NS1GHF0hAlKxacpZ103PXg2+3UNiKT+wT1/TnvFNAHgmS?=
 =?us-ascii?Q?MVIj5dItnnVF925uv6xupvv7bs1dZeAdPcO90JbJETtXGeY6NGXINu9Yl0No?=
 =?us-ascii?Q?dcNEuZ26jeTvOPkwqblmee5dUN5yD9xhnoU8m1iYSwqruV7jy4WyIRK+RFhL?=
 =?us-ascii?Q?hg32TlE0QJoYa+XFfUXYYmOtFoCtS0RzPa5qTCsSknm25kh0IhtCVORqatNg?=
 =?us-ascii?Q?pOr8gfLt/mp8IVQXorwa3NeHKjNyGitY4qdptpaMAgkldWlyb3HX2xtKBYYW?=
 =?us-ascii?Q?mAx8ISUZ/RjzuByZPYBUEUKpkB8uyhrwcIPyMnFVJDqpuo3V8t0p+eSPNpBF?=
 =?us-ascii?Q?6nt4Qsu+zBwSFc4r7tQg16R9dliItC0VSvPJc9i4uWvLpb9nsiVb+ciz7G47?=
 =?us-ascii?Q?O5B5oXgMsbPKPuafyTYgjJto42UEIv2uIswydJCIFVAeaLWDmfIyodfYQgcH?=
 =?us-ascii?Q?qG1n5rsISNZ9TUjJFEjAlknlPL3I8HDIi/OKf5lJJiVuCVl30bppo8qqBqdQ?=
 =?us-ascii?Q?YuiPtqo3Ww6FZ+lFFDNFtnqUbObNCENpEqMRLcIBdEpt7s7757voXhqi8UQS?=
 =?us-ascii?Q?g3MOTxcroXeiJ+AcFX92uLMFn1gPpyAXMZLbZeN9bujbsqof8bFOv6WlCebQ?=
 =?us-ascii?Q?U3tTsAW9UCXgWdajhSaL9Izw06yFGcx03PGMBxmGv2+6OGclgjicnviRAqi2?=
 =?us-ascii?Q?BBnFFRd8c7UK026MoVcC9eEWgYrwXHoEXGVD3QjVViMuIdw3qTpOcrnZExh/?=
 =?us-ascii?Q?SZFnGzkLcNf2FWeqVTuJBe7BXNRmpnoBcBq5MAXpqopfaocJhBoH2Ull3Wnl?=
 =?us-ascii?Q?ncodo+/3Mm5cJMgQd+NUIudbIePdy6A+f40aCOozVPYulx9PbpKCd+RGJj5V?=
 =?us-ascii?Q?ZdDKxi2TeiQqYo+w3wENbRc4BMEsrxKvYDdCsuOeUwn4HTeO3nC095McydwK?=
 =?us-ascii?Q?VxQuoa464fDBXCdrM875PTGfzofBesFALSbtP+0vzEypEYbXCTZzzs0TKFbt?=
 =?us-ascii?Q?x5DNeAmLT9gMnPAnX2N+/ccbAoh9CJZOBRTKALa8NJCxnZdhMd7ZGsGfYFk2?=
 =?us-ascii?Q?w7mPam9PWIxXrITzHraf2xG79iv69ryejiael/+oHI1+E5llZwjlm8yyBOZx?=
 =?us-ascii?Q?cteGN8vCfKmlryrjn/MemLQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WtYpHEPOe/bOdxShTLYIsgQBDvEJExhkYS58WbuNOtwsu9+skuDYbWheXP8H?=
 =?us-ascii?Q?VaHxs1rqj4jmZXV/qD8qc895KOcpNg94YiMLqo5KVNhMydrqSR6KMuBBbOmV?=
 =?us-ascii?Q?xX0kV0a83wRizFDsM6Eep57nVHPiFUmqCvZIL5ryGigTmUO7vfcVZtyqqRYf?=
 =?us-ascii?Q?/fNFXUJ2oTmXe12jRCym+wZUR+he8RqyyBDhf491804GYWSek41oi4XARqHo?=
 =?us-ascii?Q?hRTwJIeahbQuE6OkQ66wTIU380ALExceHXo4KJ5KndsZGzDB64iiC6f+TgNc?=
 =?us-ascii?Q?I7AuKfkpEMzf/a89wrvRBwbaU58TDcSB24IKxUsl/gLy6/0DNj2y47IDKcIs?=
 =?us-ascii?Q?Vk74UJpq6mDqxpsLZm1SD3A5WbRdtNcs1DXTeq+sUohGXKhflH2UQHnyVkBj?=
 =?us-ascii?Q?50U2pgD12n7LrgJMHei2h9Sluadumopk9YE59GUNyJKuN4NL3LrTPcUQIomt?=
 =?us-ascii?Q?ZdTJTzj05OFy4LUWV5xkVOgs/g8fPRJ95/zGuIeKZxJb8lUNodfFor2690DW?=
 =?us-ascii?Q?jb4/7/kIVOyz/v4t3cEQKq2yTIqmXT+wGcEETp5bzxEXnJYYuzZzXknYGaZL?=
 =?us-ascii?Q?QMsCVhHA2kpmeSZzQElMfHhd1bs2AYpVd3A5S49hb4Zb94fq8n16SnHn/0Aw?=
 =?us-ascii?Q?J1ugcelvwTPWFiNCop6FPWhBD1N67Fa+4DUHRfQceneArzrOr2wpudbI5l5J?=
 =?us-ascii?Q?3Y8ARPDczwDNn/72LmbHKNQF6wSRD3ZcGE9k/Cn+Ei+S7BGm3LGbmIYD159S?=
 =?us-ascii?Q?c0N6UDzmYIPKu4/Kb4aKsIOPNO3DGlT2i1FLzHRtMyipK5u0uNQH8EMESynH?=
 =?us-ascii?Q?K4cjHSf1rw+pi7ImEOKJQyiZXQ/9T9fJKSCOzolqGFjePOhP8EZG8GQeozzr?=
 =?us-ascii?Q?ZnWuU36Ey+cVejQOKmlKsjRHnqwbfQpZ3lf6QzzRzGGzdvtQ2GteT1R/NABS?=
 =?us-ascii?Q?O7FbNAOUoTwydIkDPQtihaG2XYg6kVresa/N6mGLFVC59o72RQwQvkjRWhuZ?=
 =?us-ascii?Q?pt7ZwhcWQOQRCASdce+OKE4gO5psbTAjd84T/MyD2gq5LLiSngMI6eu1Luoq?=
 =?us-ascii?Q?MxQhzOA6qCk/O5DMbKXTzVf7+TVq0epsNEkHO22UqAaFa0PYMX5rhurN6q+T?=
 =?us-ascii?Q?KfQ/XHxijA3vkfmH6wIZ6VVqzfZs1B9xBNjbCIufT5dyXzISd/kYXyLl6IMu?=
 =?us-ascii?Q?/ILxz+P5C62WXgkPgEJr593FQ4LVR5CENkLlK57gw0TSsgsFx5UFCIXtT60/?=
 =?us-ascii?Q?FT3XfJitwpASpR9vtCkWuSv8fnkTrKrgGBrGo4YAJUxcJTXfHwC1ids26rf0?=
 =?us-ascii?Q?Upo/PdCiGI/VRVy/jYkDn1Ku+RQYEqMcqFveyfmsFCNQ4LUIP8fEaKm+pBn3?=
 =?us-ascii?Q?43TLYw3wTWMQdBKwN3bCTFSvFVUdj5WqtsR4QkLNws82NP//Du0s99l2/VPt?=
 =?us-ascii?Q?bLxTDxCIaH7Mdw/Yt10qqSsqn7n622gJAEe1KcdW/abNZjv8abaCwaLzETN8?=
 =?us-ascii?Q?2EwtMdFDDGogVHBQhfogMTNL5Ua48xhFTcLO5gy7OeAhQf8CxjngM/aQUKUH?=
 =?us-ascii?Q?9MKS5p6hzCxybYvG2N7mPQ7Q5VzR+xxBwgUJ2hGETOTiAWLnqyUcOZBEPfwY?=
 =?us-ascii?Q?FEjr0/AhvSiwwf6VBOeZpiNe6C0YgShEsng+Gdbapj7D2bChQQp4MOiDnolf?=
 =?us-ascii?Q?1Sfl4hoLvSkvuW8a4ORM8l71tCKT/AAKX3sQjCJOAuavii9jMX8n9osp4oHB?=
 =?us-ascii?Q?viMu/cv9uw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336dafbe-848d-4577-b599-08de620c8b06
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 03:38:34.7095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+BJPLDc+qT/WEbVv9Jw9EENNiYWFXw6KGD/28rw9Y9VsCyTvQr2zZ0fwI1wK+AM31nAODkSdB+Pz3h6p5k4yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7763
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_193840_231612_3E646188 
X-CRM114-Status: GOOD (  14.14  )
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

On Thu, Jan 29, 2026 at 04:04:37PM +0800, ziniu.wang_1@nxp.com wrote:
>From: Luke Wang <ziniu.wang_1@nxp.com>
>
>During system resume, the following errors occurred:
>
>  [  430.638625] mmc1: error -84 writing Cache Enable bit
>  [  430.643618] mmc1: error -84 doing runtime resume
>
>For eMMC and SD, there are two tuning pass windows and the gap between
>those two windows may only have one cell. If tuning step > 1, the gap may
>just be skipped and host assumes those two windows as a continuous
>windows. This will cause a wrong delay cell near the gap to be selected.
>
>Set the tuning step to 1 to avoid selecting the wrong delay cell.
>
>For SDIO, the gap is sufficiently large, so the default tuning step does
>not cause this issue.

Adding a fix tag? one more question, I see all three patches are all
changing to 1, could this change be in imx91_93_common.dtsi?

Regards
Peng

>
>Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
>---
> arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
>index 0852067eab2c..197c8f8b7f66 100644
>--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
>+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
>@@ -507,6 +507,7 @@ &usdhc1 {
> 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> 	bus-width = <8>;
> 	non-removable;
>+	fsl,tuning-step = <1>;
> 	status = "okay";
> };
> 
>@@ -519,6 +520,7 @@ &usdhc2 {
> 	vmmc-supply = <&reg_usdhc2_vmmc>;
> 	bus-width = <4>;
> 	no-mmc;
>+	fsl,tuning-step = <1>;
> 	status = "okay";
> };
> 
>-- 
>2.34.1
>

