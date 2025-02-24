Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22FCC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 17:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKIL4qi5BCZdDe6jrP31vqOAmPg8S/8avmGJEyHWlyo=; b=ikAAEVAk1ovaxW1ucTglzSBOo/
	7eO9o491i6NKMFEpstWDfg7qKPIeaC0Dr6EWEdvAkwTMvnOV6sYdaEizbdQ+MVDjC2Kmxcmw73uHg
	vTWMOhs/bgMs0n1B+NyETw5RkyA4S6/SVr/DHHRmUe7R7CWZkxuqNduPLWtjJrgmWo0/YBW2/48R2
	3Jfq939F9IRuD1getpGeBpAfJXM7jyw5TAnrmkBVo7EEIgjQV1hIUBy/9u0CgOCCvjqxAwI4eXQzT
	4YJJqdHweLMUEml2o3c8u7WC5sE5iLriZGemroIaFwHzPc3Uy7kzO6sueJbLBFRfxNDYUE0Ocprhk
	QfKJo7cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmccF-0000000EhNq-0SS9;
	Mon, 24 Feb 2025 17:51:39 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcZs-0000000Eh2K-1I1O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 17:49:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AW77bTty9LmfANg9xV3/9BkweMrBCpqtbaZKx15gEUQvnwlgbRvbH41nUe7G+rRL/9iIxX+xBndWdXUmDNcKWzM5gpFVNCJTEkRlhOWq45z8fjHa5m2LLQX7rAXA+tGKHEfE7jWwV+ZfGWipQBNje89HQfAD4OvCDYTEPWMfeHkCXbnFYEzwiB/9A81sN3huz1HwJe+/719ZIcmINLlwYQkY8Z+AKGV7RBqfr/j6pLntywSN3vCu7rX0urKxpvL4X2EKJAEx960e6B2LWcE45lsAT0a7sZGCAR3aDqdx6K2jhf8hGN6h/N5E2rjmfRyAJ/oP11CZ2CkOrWifLbHPoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38ZY167aasBCXPlQCaAz2qrg6mNc4xgK6PyZS99CUzU=;
 b=eNk2L2rBkrf2378k5yyLcPZ8Qy/7y5tvcnHbP+VESxdI1pkN6mNfHpFYqNAQyBR2LM4aBKlDxaXXTJqeJrWPDINXshgSDkrCKHbNuxfc9/yWAGFgt+qkIrUyvoW4D0tW0s7PczkFmFCJitWoeuhZaXNOCOl1jpi2QM4KJQEUjON3mVB0yGUeEicgnIG3aguWBEWKktiRdUgUR/pCyoWwqhRAmM/rCDkzz5hQN5UpqEHfz807hYlKuBT0YkoO/RkrV1u22meuOiCLhYBVKVdhMj7zELseXBq1Ew3JO1zOYbArJwLQgQfoW78rr0Fg+3IlnSKLHw/Gd7Sp5OiFuM/stQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38ZY167aasBCXPlQCaAz2qrg6mNc4xgK6PyZS99CUzU=;
 b=dox+2G31Q5wLPx2VTbfIdd3PzCDDJpQG5Q8TLc/GQ3L8q6Y+D5tYBuy8/qYOn18f8zxPZ3arBMJ3JICiFLyWML2dnM+cjqgy/W+R8Yi+Cy0A1y5JU+gHaVbNsoYdP/ysQsxeZjdrDRhbxTI0EzQrc4hK0XIobND095LIniGCX4ayyIoFVCSKF00ED9ixcIlmShBJay2wSjkT+GOwxK21DVX+p5TLve0Ng59w8oC39vpcm799kVhxeGV3vtIkqUyZdSkSQJYV9jA0qtI4REv8MFQV+1RdbbzUwca+EtAs5LcEu0F8zh93OrtX28ybC96luEIZsqMFAsM/zPsyg2DIvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7855.eurprd04.prod.outlook.com (2603:10a6:102:ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 17:49:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 17:49:09 +0000
Date: Mon, 24 Feb 2025 12:49:01 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 1/5] arm64: dts: imx8-ss-hsio: Wire up DMA IRQ for PCIe
Message-ID: <Z7yxDRO+ICPCu0I2@lizhi-Precision-Tower-5810>
References: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
 <20250107140110.982215-2-alexander.stein@ew.tq-group.com>
 <Z31KrdxPULx8K5ao@lizhi-Precision-Tower-5810>
 <4427798.ejJDZkT8p0@steina-w>
 <Z36o31uhQuI5lcH7@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z36o31uhQuI5lcH7@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: BYAPR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: 053c80b6-f897-480b-fa96-08dd54fb8a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?VXpbt+ehNAu+0roa8KrLUTlzXJurw6bOl+b95RS4LFvJtgIJqut9/43iDn?=
 =?iso-8859-1?Q?acJnemBCg9E0uoSPG3FCYv9jiiVcgn76pGazpJHg8AiTriSSmA8T4zHo3r?=
 =?iso-8859-1?Q?qLeQGnVV0/bVYzJG/KEsC1d+dvvHiVqn6NDH6A8lOZSnyNb4UmuP1Hb067?=
 =?iso-8859-1?Q?7qx7LBIySCCxhkMJU0+pLXlv+2o2l0+cj2FpYdRr49Jyph4D/mjedryL18?=
 =?iso-8859-1?Q?Tx8sMMz5p13Pvj1XC7Fd8Uqj36k3uSmC9Gwh1wZ4jn3Uz7L3kcHfcAOCT3?=
 =?iso-8859-1?Q?VKJP72XMIP1gUaZk2IJkZWujPPh9xlJhFxgOvohp558Qf8FHC2BGF9Xham?=
 =?iso-8859-1?Q?ivg3pQ29TcBobBvt5OsRsBAL1L4P4vG1PMKRnAi6Gyq66yYyfeNjgc997i?=
 =?iso-8859-1?Q?5V2ap0AXAXXeWkls1btRQBVtbXaGg/EiXpJGcuwipqfOuozBSelHV5EIsk?=
 =?iso-8859-1?Q?clf1R9KFWkIHyXhXLPXpcR7ra2Hsy+bCBZNt8ychCFt/8xzQU6RIA/WP/2?=
 =?iso-8859-1?Q?sXmUa8gXAsBQ9e1b45+WtOeitC7kbOQabJBtV23ANYf8Li0X3xIOmLKnj8?=
 =?iso-8859-1?Q?dWVxWvb6ik7v7AV/qPk2DDXjSFUcnPGY1U0MBXgmWYnAyBBMHf/TNjj0vY?=
 =?iso-8859-1?Q?XupAh1OxU8ez44lNSDFmDwPOJIu4OGF2zmWu2sO0DkOdOZUTa9PyLE2cp9?=
 =?iso-8859-1?Q?2Bqt79O6DDFBOfK3ofZWQfbIJAxEFAAvODH/TzHmNhtIGANQOJxZYTUIr/?=
 =?iso-8859-1?Q?CPv1iPIeJ6n0qjncxNxIcHYmNGadgsuPB3PoRldyts5LCfTaLefvcRHRQP?=
 =?iso-8859-1?Q?ZxHEac49Q818X7QrPIX3SENFr1ZMeGAMCRiYdgiM5wYuzWpAzbYCM/n9mC?=
 =?iso-8859-1?Q?1XlGRIL3rA/qmm8RfgYIPiHAznlfyJgqfvacUK+pzppmSN4AM6zlWSst2M?=
 =?iso-8859-1?Q?Yz2efopG/hlC4E6u633hfVwGrUf7nxyiFSshr1rrQVueMxbgX8LwXxmkag?=
 =?iso-8859-1?Q?3Xc/ruazCkKSa6oMjrpcRiH7kZPQIxIvGh2//SHsJB2hxtjTs8dHiAjWjU?=
 =?iso-8859-1?Q?VttuEgstKH5yglbKAbEhVuh4Uck1BdFd7UJHkL6kIm7r2wZqXWgZao+ykY?=
 =?iso-8859-1?Q?KmxOiKPrtwZptsYzaXTCNIxGKWO8kcMt+JtrMexgYOscukJBv7K+mi8UPB?=
 =?iso-8859-1?Q?qcuZ/XQiB+YkikfhBhwvOPIirwGPnQflRO9/sMcE0KC+KKgqNwddXokgIu?=
 =?iso-8859-1?Q?zEhe6tSGEDK6o+JlvtyrMhoUoKi/KeJzFI37i7Q9PsvOPBjoAHSUOkE6lj?=
 =?iso-8859-1?Q?KbvZdf7oanaIz2S/JCINoE8JkUBif3GnTXnqlTdNwhN2LtEYpxzX7yEQXt?=
 =?iso-8859-1?Q?QjqJPAm/uqdPB2sAaApNwLqzOFuKvoRfhIII1fnes8/4qF/GLVscE+oBOQ?=
 =?iso-8859-1?Q?a71ha9lVLs936ak+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9a12fxiDpmpI5W308fv90NwdTHRDdZYp345SVlZ313eiH7vkHEb4rGLEjw?=
 =?iso-8859-1?Q?0o09Tx8SMH2VkbhNpT+vTCpyYdBrWbQweJs9JMenHu/ju+A210Vx5x04Kr?=
 =?iso-8859-1?Q?oNOUavD6EUSQE8VZEV5LBlPqxKKDyg1hpqbysGxRdRXeJjo6IaRrJLt2Yx?=
 =?iso-8859-1?Q?QzWQ2YQ0FoGZOd0ll0qrpXP6zy3xwJJxQnhW+qvMZBGORJhJxmlnCaJGJy?=
 =?iso-8859-1?Q?d2EauTQXoTEFXjFOyPWRO0OOXFO2x7wgFBnAEvkU9RGFzaex1iAq4HHfp6?=
 =?iso-8859-1?Q?Yce9wbGBTLHtRE+CxX+XbryP+MnRLUnR4v+9sv/wZCw7oWJj4TPd2M3G42?=
 =?iso-8859-1?Q?DHFRVvrhuKou4r735ipGfE0wDUNP6oL0dUdnCeaCzbjrLjuBcTVxGVVrb7?=
 =?iso-8859-1?Q?+ojZH+ESehY36IIxOSLu1U9FTsBOgRSlUsqOl2Bp8rsORVf803sGYBaegb?=
 =?iso-8859-1?Q?CaYMDBdlBoJpyUPWGpPBDqwE65nUtrSvaAr+n7u4heItjQI+1byoUMglS+?=
 =?iso-8859-1?Q?OiVUNbg1mIZP2C33AFgWV7BknOYkaR6g3Gvi1CQcoazrimMNyMcvjXcPgS?=
 =?iso-8859-1?Q?Af4/nrERB6D5Xwc4DLvNXOieGttqJIWrf0V7a+cvckIybycWh3QTDrcS6C?=
 =?iso-8859-1?Q?27QRsUbhOROyTRH/Mg6C+elF34ffiviRNXix3j4m/qC4RPpU45SaHINsWD?=
 =?iso-8859-1?Q?gKmhxew0aVwuZaA72qUrThz6j5NYdrZrYwR5A+zgN+QVN2KKPLY7qYkoLc?=
 =?iso-8859-1?Q?GVgzyJi+9qYfow09WZgRu9XWvnVoEtXQP6su3OF2SishakPDha/cs3FSFh?=
 =?iso-8859-1?Q?BKQrPpdgwiXeFtVRpa9NebZ/DvaebUuIyILDYvBiNm7FLvPeiG7lF6WuzB?=
 =?iso-8859-1?Q?mVpEkSzCnQPaFkSJg59onmz2Xjj5P5iG8bh2tJ+2cssIjm2IEFfKBE4KcJ?=
 =?iso-8859-1?Q?U3/cdGXFrKC+Ucnzjf6ioHoU5eXkQxuJFM2U+iI2RoRtWhZ41lX5HccltH?=
 =?iso-8859-1?Q?7HUdJHQXko1sS1FmWHj2OigQKODNg1uvRF9wi3XQ+18H8r54ihydOSXE6S?=
 =?iso-8859-1?Q?UN7mUkGQdSsI8sKNVga9AGE0wZoaiD6K6J+EDWE94n7hPaNIVRrVu83hcb?=
 =?iso-8859-1?Q?z5av8gtigsgu0eFnYhZyzg2gjVvnLtLFByRkFbMBHLgavWixGKUuJ0X2nz?=
 =?iso-8859-1?Q?yZDRmGkLZO3qUnn7XqL4EP2DvenzPBLNuRJNYJZmxtMaYJAKitUJlmnSUZ?=
 =?iso-8859-1?Q?fsGKdXrnaZ5QSdLu7bQExGsKchkTQhwDJ2kqQZD+TNDFAh/7zJ9M+LKsC/?=
 =?iso-8859-1?Q?nYVD1CYny9Nqho0YFoAzEKWER5mRPrql6s5E1c9ZNfr+r6YzjmkS7egshi?=
 =?iso-8859-1?Q?y03YTm+uq/v3EslmcKjkMU1tcZz01QUuB8dOjL0cPy6PfTpkvCANia6pmV?=
 =?iso-8859-1?Q?opeVVPnvjiLEDXcabPxezcOaMm6csJszcyurVsXHlT5hFc1FfOhNWwaw/p?=
 =?iso-8859-1?Q?XlC7dEzbU9HuydOztmj9PxvYLu1rQnbQZJ2yX6DTcQTQIKk/r3g3SH/gn4?=
 =?iso-8859-1?Q?99F9FVMDhjGuMbJkmCLpXnV5l+LeDYOzC5nU3sFVvDpypwcW6SLO6mr/L/?=
 =?iso-8859-1?Q?bBx3No7CLu/7Mlxtm/MY8IxvYAWrBHZ6Li?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 053c80b6-f897-480b-fa96-08dd54fb8a46
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 17:49:09.3377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZ8yJ7jJ9AYXLskYBV9zzTT2+9zFUODtE6PepMwMJtMRzKIFSYbrP69p7tsGE1kLmp4uETIylL2OcB5px513Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7855
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_094912_349570_00023DB9 
X-CRM114-Status: GOOD (  23.94  )
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

On Wed, Jan 08, 2025 at 11:33:35AM -0500, Frank Li wrote:
> On Wed, Jan 08, 2025 at 10:58:18AM +0100, Alexander Stein wrote:
> > Hi Frank,
> >
> > Am Dienstag, 7. Januar 2025, 16:39:25 CET schrieb Frank Li:
> > > On Tue, Jan 07, 2025 at 03:01:06PM +0100, Alexander Stein wrote:
> > > > IRQ mapping is already present. Add the missing DMA interrupt.
> > >
> > > PCI host side have not use bridge's DMA yet although hardware support it.
> >
> > So this is a driver limitation, right? So IMHO the device description is
> > independent from that and still correct, right?
>
> Yes, but dma register space may missed also. I suggest add later after
> EP side support merged, which can verify informaiton is correct.
>
> Anyway, I don't block this change.


Did you run DTB_CHECK? I found new warning was added

/home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] is too long
        from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
/home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too long
        from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
/home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] is too long
        from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
/home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too long
        from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
/home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: pcie@5f010000: interrupts: [[0, 102, 4], [0, 104, 4]] is too long
        from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
/home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: pcie@5f010000: interrupt-names: ['msi', 'dma'] is too long

...

Frank

>
> Frank
>
> >
> > Best regards,
> > Alexander
> >
> > > >
> > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi | 5 +++--
> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
> > > > index 70a8aa1a67911..4bdfc15487cbc 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
> > > > @@ -57,8 +57,9 @@ pcieb: pcie@5f010000 {
> > > >  		ranges = <0x81000000 0 0x00000000 0x8ff80000 0 0x00010000>,
> > > >  			 <0x82000000 0 0x80000000 0x80000000 0 0x0ff00000>;
> > > >  		#interrupt-cells = <1>;
> > > > -		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> > > > -		interrupt-names = "msi";
> > > > +		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> > > > +			     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> > > > +		interrupt-names = "msi", "dma";
> > > >  		#address-cells = <3>;
> > > >  		#size-cells = <2>;
> > > >  		clocks = <&pcieb_lpcg IMX_LPCG_CLK_6>,
> > > > --
> > > > 2.34.1
> > > >
> > >
> >
> >
> > --
> > TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht München, HRB 105018
> > Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> > http://www.tq-group.com/
> >
> >

