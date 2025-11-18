Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B44CF2562
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 22:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxJodSH09/Upb+3rIsxAdk8HAkxfeeL5o7c1uXqzIUU=; b=rkJbi4aOfmeVIpciyElr5q3j+S
	gQGG7Yj/7nDeJh0FZ8bA82MgqP1jhC204N8CIyhMVp25w0FFSYvw3rA+RifRiOzsr9E+QrMUbDLGI
	WwbRMdSEqGiPkl1unDEMcqI6Z41OdXS17ZzpsKRYgI1d4ouR0lFZS+AUR/UtcE24ylqplJp9JrnAo
	XM5N42FHESjTf4fdw1Z1Prq1lShjMNuoU5u9NQ58wwqerAxIvbB9mOPELR9VNX+ncCCTNRCDCiZtG
	rb1CNYoZj1FRxucudECC6zkFvtBzTcmlWd/OFxaum08OEnG0wXNOoesbX/KtW4zzvWyDmw+gSmNvu
	ETy9D0Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUHX-00000001Bg1-15pv;
	Tue, 18 Nov 2025 22:34:39 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUHU-00000001BfE-2sr8;
	Tue, 18 Nov 2025 22:34:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNHvQ0E+atEKPCdxnaLuViDmDuFWAAZQ6GtLzmBJSd/4baLCSPj7FsK1iF8TrCz7VmYiZxxeStlp0R7Zb4ZckbvgF++MrAs7m+few2rlAQLWfrW9Yt9u+4ppkCm8ozMDtpEG3oxovnqrD4F8Nhn13raVEYamE+zuXiCEpmU51RSp2UC2mlhSetE3r4/P4A+c3L/N+Ml2xPCa2ZEp/Fv336ydptDaQiyUU7pBuKBrVHuZP7nI9xwrNysn+IwejMK+z0YgbsDgwskDc+nwaR/U1axMZLi/oDXpgXh4H6IJftBhp6fdnXrFa3A6Pu2n5XeGTu2cbiIYBBaec1UrlPVKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxJodSH09/Upb+3rIsxAdk8HAkxfeeL5o7c1uXqzIUU=;
 b=MdeWzMxk/oY/nyvkVjbw3O73WJvUcTeT3MM2VWcI5cwxWR+x6aJq3+2hhZnUSYGv1zjo1qts0gshPfxQMHJbwaMR5Pu/tfZ1szVLDMwHB9/CJ6KZAxSxOkkxH5W+uMtNpl54NLW35P3bU+Ua8JbS/eb/uNZrvsBh0S3rXtT/IBiAE1vBasvApNlmNTN15w8O8PyILQGvJvjC//l1SSsWcRWKh2/mvnPPl2SB8ZPl3ReHisB07EcqSP9p7JeuYlfx2diBrClbZPH9irHww0U+NXAvDI3z4htfvay6p5BnglLuAsTh4LmKdllk2x2GdDxL346GQBvhQlSwmogdJqS/Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxJodSH09/Upb+3rIsxAdk8HAkxfeeL5o7c1uXqzIUU=;
 b=Ro1syXh9WRXEgp1CC38bXuSE7aXK+VIfMsaKnPglEycgKOvg6I/MfMMQeMxHLMUvpltZWY9msQEd37IH/5Tlp6jd7s6dwk4aOeVrPLkMm82rVyADG/HBXda15Bf1L7dVQLW4hYSgR/5xdPXm7IP9SD10sfI/wlA3euAXS4uhTzSspTcfSA38KP8eROAVAT380UEaUlWeWIL2VitChJMLMY8WOxqdME0LYRgynBighOGpKNzkmW2DCkCLjxw//yIS74tx2cmyVgyWEzBMiL2XoIEwPz29iRw2ZN5201kMe4B+43u8VJFTtMcks+s+BVkTRLp1C9IU+ZfdEOmnZ+ZWXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB9PR04MB9332.eurprd04.prod.outlook.com (2603:10a6:10:36c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 22:34:30 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 22:34:30 +0000
Date: Tue, 18 Nov 2025 17:34:18 -0500
From: Frank Li <Frank.li@nxp.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hans Zhang <hans.zhang@cixtech.com>, linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@pengutronix.de,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 1/4] PCI: dwc: Advertise L1 PM Substates only if
 driver requests it
Message-ID: <aRz0ak6onKzZs2lY@lizhi-Precision-Tower-5810>
References: <20251118214312.2598220-1-helgaas@kernel.org>
 <20251118214312.2598220-2-helgaas@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118214312.2598220-2-helgaas@kernel.org>
X-ClientProxiedBy: BYAPR11CA0098.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::39) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB9PR04MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c56e94-3846-4a93-2a6f-08de26f2a35b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YMROvTyc/+F1rBbS/WaUdQvdQeJ95otcxKfdpbrD9M7CYwAkmxkMAW/O6UT7?=
 =?us-ascii?Q?OGK/kqZOHMACf4Yb7ObehYlGlSdH+IbGiu1XFETuBKzUIeByjBpuowcxp6Po?=
 =?us-ascii?Q?5lGciUZQeZF6e//3rZx4jRuwPBl9HQ8dLm5RFe4OVKwMwudXsbUYJlt8LW0s?=
 =?us-ascii?Q?Aots4B+Hxl8N3Svsr+IEiUWKbjmF3Az6sucbQ3l6x+kcGfp2//by46fnou+D?=
 =?us-ascii?Q?b4EWykQQZz+P0BquGxeHNbmCHGKlTnbYIzXUvT6YTBc0ewd8jkOHTxhwvHWd?=
 =?us-ascii?Q?NplaIduJoawnDMiOwcz1rLgmedS3wDnUiDZvL4TCDlXanvIAo312ypUG//LB?=
 =?us-ascii?Q?oR/Le40f0odSdym3bkL8Zuk8UKfYrkgmsMC7RrcFUFA0lzKDuHCdw78wqdB8?=
 =?us-ascii?Q?8Bt2zuEHM+IiYE5EZC4O9jmS8RMLA88HMXxlS+Ij+vy9DPweKKQTZJyLWbFu?=
 =?us-ascii?Q?aOQRFgqb8TvkbW8MtBRF/P6xce3GF4v6VBddeRaLCUOs77HMJ6ZEsUulZzMB?=
 =?us-ascii?Q?iDLmGH2kV0hlc/iB+JZhXwCcd6NtiJSFn8SzXsg0oVEqvSjUNUgjj910Vrho?=
 =?us-ascii?Q?CXXww+2TUjjaaNIf9insBB8ARZmHZwiMnoR2Eeopvk3vEKdimE/ArLNt37Bx?=
 =?us-ascii?Q?mtE2Cr4jVttGbEeKTLu1wFfFtfHV2nlZnQnVVxUFKbNABoVrEhwtFLeUA5Am?=
 =?us-ascii?Q?Cbn17bOm9JigklqbnPbGUNTHxambhor0f6gtgYOQQX+ramlh/K7RrRpptoXl?=
 =?us-ascii?Q?AzuEaUM9O2VYwphP2Qoiv9vfrWJMiFDDyLlsHzhy99ESh+Lx0d9ZpjhdNXvb?=
 =?us-ascii?Q?YfPwpAtzuK4xOgtgi7wkUQ/Yg7jreL5qWF40+JsWxGG24mhbobfH0Ky1JLBE?=
 =?us-ascii?Q?hqfGlf/HDes0L0gkRvwjIk4R5xnNcERmTAR7JCOnA/CWgUfqcS1t9jz+JIy/?=
 =?us-ascii?Q?ZoHEprj5gHW6wrazjagZygiPiIziCgA3m0CWK74dnBdwPbR0svexOZi/H5cn?=
 =?us-ascii?Q?fMNKCcEBcKRIbbWyJsc3kOMFx24rLtaJsyBAQLDs2F34ySpxBFGffaRPNBAb?=
 =?us-ascii?Q?uxg0GSR5xYyZn/0MpwvRe7vu0u9XPup2OMTmb/d30xo+1cL82tmrWnwChVHz?=
 =?us-ascii?Q?Cq593lJIbkaO4Cx/R9pn8yMqAcKLqOQ33cCyK2ODx2T0eKtydtAzBnoE+i/Y?=
 =?us-ascii?Q?cu8TLlAlQI6J+0pQOtms7L+QFt11AvEOnDi5BIhqHCsc9xyITc5cbvtPmOXn?=
 =?us-ascii?Q?6fAltg72VXwXulzGn/BOQzeVUDXUiyRj0HC9J68XItlvjJ4ifDeMK9BW2c88?=
 =?us-ascii?Q?QziO771PyFzuEk0DbF/cErKgDxjNvjry2WDheqLXybrXmQ2svYBCoq9PA+KQ?=
 =?us-ascii?Q?IJQVC5KDCrdTPOkL0zcpLdR/VqtuxFa01ZuGCE6eTtvSY78SqxNXf8eM/LwB?=
 =?us-ascii?Q?SPAQhDkQYhmRMeW+L7ATBDn/xPALqVGK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RNE29PwFOBxpQqG+WZfxE/iaaTS6sF/iic0CW7cFerkzIngQCFedFuEAxBxv?=
 =?us-ascii?Q?o0OefUqcbowPlbtT0KNnSAqBwU/lm2cTpy6nPVEXfO3rOaBqMZ92vzlE/Kf7?=
 =?us-ascii?Q?dLufqh5A4itGIhjkYct39udOfiXO9w4RhyMznyRUVg3DiDv/les7/RyPBKz5?=
 =?us-ascii?Q?6V1qYj7bz/H/ntngo8GYUiA5qldegRtC1rywHomzScv3J/d6M3CjNxOKUbu8?=
 =?us-ascii?Q?Zlggrns531YeZrxcGZtWEnX8P274wLrbe/XauQfiGh1IQhlVxmG+fZt0Qoki?=
 =?us-ascii?Q?4sfbfH+h1KjUSvdJJ+MxZucAP4xistSTkIdOGxx7iiPJlAWsE5Od1scFpFsI?=
 =?us-ascii?Q?ZC4w08cjeny+llJBQppuU/gH5T9eIG/VaKejqYisMY/0e5T1YPo+swBjxM1U?=
 =?us-ascii?Q?kbWOfrX7BDn2Fq5wfC/jVzh2zi56QgVsgP1x+6cbM8Ue/lmk6EALZAqB1jDR?=
 =?us-ascii?Q?GdjO6DPracDd+iBdz8otacVTzjhBoBi8upMZj1wKw8XEUuCo1f/UHZTkTETJ?=
 =?us-ascii?Q?Vw2Ja7hfP7GeMaSVnXRXVJnQta9BV6uIr6IhBRMT72TCt+oQlfsDiY95jeT7?=
 =?us-ascii?Q?4vDxa/QYDuEyWyBsDxokmezh/4egC5MPBnKa0QfrvFU7qdFowlsO+Qo5m+ZU?=
 =?us-ascii?Q?h5IlbKyC12W9IsIwTUhHGkWWB6GrfdAx3OM3ln9BlzBlzJWQP68k2AnbhtvG?=
 =?us-ascii?Q?CwnsvGBV5cSSQNHzremjlDu49GHbl5moneIPjiutZ6Tjw2dqGLLMlJs4NCz2?=
 =?us-ascii?Q?JCD2Tw/uHbrurFcEnpmMVhhBAbbCmgh6UI0Lslws7Ld45JlPpS1IcxezASVg?=
 =?us-ascii?Q?S8n6BIXLB0/Si3zhJkYgzIfqQjpMCip2/nrG57VuGGntZtCAOwyIc/bbGDHr?=
 =?us-ascii?Q?B6pMDXFcchgrRKbpU2w9j/2wfX91F+WgTA2Gu4zBTv4F8u0xS+xCxY1pctZd?=
 =?us-ascii?Q?xYDbTMmNk3q8Jd6izCFV2MEcj4HUOTg9VnQq8R/Vg6z5pVq58+/ZMavkxKEp?=
 =?us-ascii?Q?Bafjt+16cvuyHvFtUTimymbrohiO+B2nTF1Dmh+f0HGiJetWVMt0ZykQtfu2?=
 =?us-ascii?Q?Md9BfGXcO+N73v1Bq14fRk3QhG8zw8W1CA2WaJQh8x4Mnh852SY5Phe/5vrs?=
 =?us-ascii?Q?EiLPZPPhemZMJRmMGpRWFBO22+HkzM/hMCQo27Tmapoicrli9XTSq8/NH8WQ?=
 =?us-ascii?Q?MfYK4vgBf/zA1Jm1WNAAMH4nuNT/jWkRS3BNPReq2MlvZgeZqCziqBoTF5b+?=
 =?us-ascii?Q?nWR9QukwiuChTGu7bCcl31++pc15HiX5s2vlPMvBccoyrRTJu6+tmey+rgYf?=
 =?us-ascii?Q?6BR2NiVhv/4N8JsbokDKq8sgQviRCilX9MKGZUvo/iyJd3+34p9pvupnzM7y?=
 =?us-ascii?Q?MxUgE6kC9r5EmmmL8RrTp3A6X7JT3kPUUp1MPW6+MKsbqGymnL8DNX4cuzX0?=
 =?us-ascii?Q?ggcEv1bBDp6/Yqj4jIv9ZjwifDxSnEMLGasqvHk7Q2qmX846Gcja1b0G8w0+?=
 =?us-ascii?Q?WcnSJ5wB33d/Y7nASI2DlsrdDKrdFBeg8uOVNd2vjPuT3OGMfPv4BmM9SaGV?=
 =?us-ascii?Q?7TZZ8q72e2/COJ5ofnvmOEvWGoE7XgOslG4HlsC7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c56e94-3846-4a93-2a6f-08de26f2a35b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 22:34:30.0009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyHoK/BBzCDDdOb1xdkB48oOI/1gh3Y++JgE2B4Vs0iIhwQsJV9DDyQuXV79t5srz5v5MpsW81IRx6vVWnAn/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9332
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_143436_923776_B843BCE0 
X-CRM114-Status: GOOD (  29.14  )
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

On Tue, Nov 18, 2025 at 03:42:15PM -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> L1 PM Substates require the CLKREQ# signal and may also require
> device-specific support.  If CLKREQ# is not supported or driver support is
> lacking, enabling L1.1 or L1.2 may cause errors when accessing devices,
> e.g.,
>
>   nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0x10
>
> If the kernel is built with CONFIG_PCIEASPM_POWER_SUPERSAVE=y or users
> enable L1.x via sysfs, users may trip over these errors even if L1
> Substates haven't been enabled by firmware or the driver.
>
> To prevent such errors, disable advertising the L1 PM Substates unless the
> driver sets "dw_pcie.l1ss_support" to indicate that it knows CLKREQ# is
> present and any device-specific configuration has been done.
>
> Set "dw_pcie.l1ss_support" in tegra194 (if DT includes the
> "supports-clkreq' property) and qcom (for cfg_2_7_0, cfg_1_9_0, cfg_1_34_0,
> and cfg_sc8280xp controllers) so they can continue to use L1 Substates.
>
> Based on Niklas's patch:
> https://patch.msgid.link/20251017163252.598812-2-cassel@kernel.org
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  .../pci/controller/dwc/pcie-designware-ep.c   |  2 ++
>  .../pci/controller/dwc/pcie-designware-host.c |  2 ++
>  drivers/pci/controller/dwc/pcie-designware.c  | 24 +++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h  |  2 ++
>  drivers/pci/controller/dwc/pcie-qcom.c        |  2 ++
>  drivers/pci/controller/dwc/pcie-tegra194.c    |  3 +++
>  6 files changed, 35 insertions(+)
>
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 7f2112c2fb21..ad6c0fd67a65 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -966,6 +966,8 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>  	if (ep->ops->init)
>  		ep->ops->init(ep);
>
> +	dw_pcie_hide_unsupported_l1ss(pci);
> +

And, I don't think EP need clean L1SS CAP flags. If EP don't support L1SS,
it should be force pull down #clkreq.

EP don't know if #clkreq connected in host boards, assume EP with same
software, which can run at two difference host system, one host system
connect #clkreq, the other system have not connect #clkreq.

otherwords, support-clkreq property should be only for RC side. not EP
side. EP side l1ss support should depend on specific epf function and
controller's capablity.

Frank

>  	ptm_cap_base = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
>
>  	/*
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 20c9333bcb1c..7abeb771e32d 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1060,6 +1060,8 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
>  		PCI_COMMAND_MASTER | PCI_COMMAND_SERR;
>  	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
>
> +	dw_pcie_hide_unsupported_l1ss(pci);
> +
>  	dw_pcie_config_presets(pp);
>  	/*
>  	 * If the platform provides its own child bus config accesses, it means
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index c644216995f6..6e6a0dac5b53 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -1081,6 +1081,30 @@ void dw_pcie_edma_remove(struct dw_pcie *pci)
>  	dw_edma_remove(&pci->edma);
>  }
>
> +void dw_pcie_hide_unsupported_l1ss(struct dw_pcie *pci)
> +{
> +	u16 l1ss;
> +	u32 l1ss_cap;
> +
> +	if (pci->l1ss_support)
> +		return;
> +
> +	l1ss = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
> +	if (!l1ss)
> +		return;
> +
> +	/*
> +	 * Unless the driver claims "l1ss_support", don't advertise L1 PM
> +	 * Substates because they require CLKREQ# and possibly other
> +	 * device-specific configuration.
> +	 */
> +	l1ss_cap = dw_pcie_readl_dbi(pci, l1ss + PCI_L1SS_CAP);
> +	l1ss_cap &= ~(PCI_L1SS_CAP_PCIPM_L1_1 | PCI_L1SS_CAP_ASPM_L1_1 |
> +		      PCI_L1SS_CAP_PCIPM_L1_2 | PCI_L1SS_CAP_ASPM_L1_2 |
> +		      PCI_L1SS_CAP_L1_PM_SS);
> +	dw_pcie_writel_dbi(pci, l1ss + PCI_L1SS_CAP, l1ss_cap);
> +}
> +
>  void dw_pcie_setup(struct dw_pcie *pci)
>  {
>  	u32 val;
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index e995f692a1ec..a68eea47d451 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -516,6 +516,7 @@ struct dw_pcie {
>  	int			max_link_speed;
>  	u8			n_fts[2];
>  	struct dw_edma_chip	edma;
> +	bool			l1ss_support;	/* L1 PM Substates support */
>  	struct clk_bulk_data	app_clks[DW_PCIE_NUM_APP_CLKS];
>  	struct clk_bulk_data	core_clks[DW_PCIE_NUM_CORE_CLKS];
>  	struct reset_control_bulk_data	app_rsts[DW_PCIE_NUM_APP_RSTS];
> @@ -573,6 +574,7 @@ int dw_pcie_prog_ep_inbound_atu(struct dw_pcie *pci, u8 func_no, int index,
>  				int type, u64 parent_bus_addr,
>  				u8 bar, size_t size);
>  void dw_pcie_disable_atu(struct dw_pcie *pci, u32 dir, int index);
> +void dw_pcie_hide_unsupported_l1ss(struct dw_pcie *pci);
>  void dw_pcie_setup(struct dw_pcie *pci);
>  void dw_pcie_iatu_detect(struct dw_pcie *pci);
>  int dw_pcie_edma_detect(struct dw_pcie *pci);
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 805edbbfe7eb..61c2f4e2f74d 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1067,6 +1067,8 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
>  	val &= ~REQ_NOT_ENTR_L1;
>  	writel(val, pcie->parf + PARF_PM_CTRL);
>
> +	pci->l1ss_support = true;
> +
>  	val = readl(pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);
>  	val |= EN;
>  	writel(val, pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 10e74458e667..3934757baa30 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -703,6 +703,9 @@ static void init_host_aspm(struct tegra_pcie_dw *pcie)
>  	val |= (pcie->aspm_pwr_on_t << 19);
>  	dw_pcie_writel_dbi(pci, pcie->cfg_link_cap_l1sub, val);
>
> +	if (pcie->supports_clkreq)
> +		pci->l1ss_support = true;
> +
>  	/* Program L0s and L1 entrance latencies */
>  	val = dw_pcie_readl_dbi(pci, PCIE_PORT_AFR);
>  	val &= ~PORT_AFR_L0S_ENTRANCE_LAT_MASK;
> --
> 2.43.0
>

