Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDABC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 16:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CB6sJzB6Q8GJk38e9tC5ZhC02L4dBQL3G8RyYCigd1Y=; b=FB+AGmWQvBusxG/51Ck6fPsIPq
	YyHSFag4oynxRcaplWkPiLrGLN9YsTcG8qYVa6rlWHTpN0NKH00DeK3jZ//YDjI1hKXtfzN/8wqCP
	8jRaIQRI9aRZaCMbejROM+YJqWiijtR8AYqGv5iXz0pV23cbOADKveE4smbksteTYxjZE0vDeCe6l
	9UjvHmAdHlkz1qdT5ezE/GRmGGwyg7hvszyjV5SitfLME+j+78cu1KxTcim3jvw6Bz9UXsOptg60p
	Y+xfXqRPo91UxY74vKyxU/C2WYw5tW9QBYcb0/lD15CVSJSXVAQno+8hELOIuMSkoPFxmtJpfhzf9
	PJBnJiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdX15-00000009784-3oVf;
	Thu, 30 Jan 2025 16:03:43 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdWzm-000000096wl-45VB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 16:02:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lz1kUilZ/R8IhdpT3Rhtau0tsrs2tvgtIFLXUIu0feRJIskHvazj1LyTi1+nHBDqtKvJPX0OF3SokZ56U3nHWuqp80DdfdQtXSm7TFLmFeMR6Cm7r+2zxJdYyww88nitUtJpNatfQ+MYROl4IDmVAmlWDAs4O7xYEI5UkSA1B+iCtC6SJ+3crQhodD7Nbg+G3qtpAXG4CSaCsVUN+7FF3IJj6BeyWZ7PEXVMAdc7xofEkrpo6n9SJvfCxdhbwKrg5J9joCA1PPN58nBz6aELN7HCjWXM2F/VnodY0DKEF/EWImogatennM4GHqCITBmhdqyUFUGe+f+8cmJfKu7fNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CB6sJzB6Q8GJk38e9tC5ZhC02L4dBQL3G8RyYCigd1Y=;
 b=Nxl+KwFrqMoqIEdsqyunxW6MNCTRn8eTMHwIdsavr3AsLljIUZuk9B5C39XfUmv6TkmmzxQ04vkBPYr9TjN/n00Fz2IcHMs/pngPaBQ4eYLS6kZIEl7L+SbGOxVjBCDuPrnueaxyt7Rhi+h9/RFRj9ylZX7YZi3mdYjCFkA/Tw7aZjjP2nyxL+wQO3GaVNjtrJZWz7skl2HNidzJ3RJHHHpUIREUacapb7Y9DTaUlHJ3ZH1cBzLZe2x3WKMJg4iv93fwfis/Kx5+djrt28XntKsHvqA+rsFaHbCmdQmSXVwVFQh9LnXiLCxIfHXGlLiZSybIDt5hiP9Fi1RFWDZwnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CB6sJzB6Q8GJk38e9tC5ZhC02L4dBQL3G8RyYCigd1Y=;
 b=UsDFf0uQzVe6/YfVQEtiVDztTm6sEKXjtJK7mJ8xYA86iqDEJ97v1EW/2t337OhV6AbmZZ6M7cu2pE2JALGxOyZumw+q7laiSIJ7FT3zQzytx+7lRVx6uy5tsGUOyWEfojKeESfZWv1aYHmGKWvqMhrC820gntpr7tzBHgFH0EgjPV3zI91K6/3f0YR71W+ZnGUSHYzr4xaYJTFmOs2FdjMI68DL6w/P3br9C7JwP0coPNXVBByvVQNpDUzrnbEZXRFiHSEXbWqPGq32q7h9G49crcaEaPuu59wwpGl0ZC2INRCmRggKIAR0fK+g1XuR7CIEFC6oX+TuBMwW7+T+Ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8373.eurprd04.prod.outlook.com (2603:10a6:102:1bc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 16:02:16 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 16:02:16 +0000
Date: Thu, 30 Jan 2025 11:02:06 -0500
From: Frank Li <Frank.li@nxp.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v9 2/7] PCI: dwc: Rename cpu_addr to parent_bus_addr for
 ATU configuration
Message-ID: <Z5uifr5+JE0xSi2l@lizhi-Precision-Tower-5810>
References: <20250128-pci_fixup_addr-v9-2-3c4bb506f665@nxp.com>
 <20250129232350.GA527937@bhelgaas>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129232350.GA527937@bhelgaas>
X-ClientProxiedBy: SJ0PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::9) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b23fbb-14f9-4afb-460f-08dd41477799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7n/s9qaUgp1dRQUimWasTn6Lv/OqBXbynbtuT+/URdCFrVhOXJrv2ey5IgUP?=
 =?us-ascii?Q?DnghDLiQW9Erwn3dIX0oRlXmsoky+Lp4GZtBxJWd7BqcGpf2tsl29QIJVHVs?=
 =?us-ascii?Q?h2e7aTRC4Fh6N+2q5zt4KfZevjQj/0xs3HOeNB6btZk2zvZE44gQxx7FmAgN?=
 =?us-ascii?Q?HKtgiqvLD6/1wi4UjIhIKDYQ59CPnNMU+MHmlvd421QiUuTYq7X2Yvz9VO5b?=
 =?us-ascii?Q?Ej0JHXukZRWMJZos9MaaF6qStd7UEGwsyXcOuuCVH6KWRW1AMut2KuB5Say4?=
 =?us-ascii?Q?HsGce43D3yi5CbCvolcxbW7Ek3X4Uy+ujC/51hbjf6Cckra0XCJxo3oCD5Sx?=
 =?us-ascii?Q?qzf2/hBQhcx7+wzYSkRMY8bNvqJ9kO4Qp+dlRFxuzNJdMp9tSBqzzkY4GLcK?=
 =?us-ascii?Q?4j9ot7aYrvsTycawjBNYZGEzKqM9pKOD8y42p7tf+2lsEVLGlpvFdUcB4gGN?=
 =?us-ascii?Q?XsZGmVFWPIp4JG7c2qWPhxK8tcHEaRiAH5HxTAlHcPdoMicoDuTm9soiCDuI?=
 =?us-ascii?Q?ezSB2ieRZE2QrQ5rkFw8Nm4ldXTXfD0kKEn0GWnW2wW/8iD3824VYMC2BCsb?=
 =?us-ascii?Q?NY1TNEevO2yuUwcQnJCT4Lw6YbNjqzlxGpnyKh1UpGx15t9s1Fa7aEANbKGF?=
 =?us-ascii?Q?p/+jA7T7iagz7Vd0AoB5RZtCDgQwEJD4+tJtBu5eJekPh9RXxKhlBpgXXtll?=
 =?us-ascii?Q?QmfL4JRAkiwdH9VfzE14INF+fspbVh2bpY5EEdHBjQjcpaL5VHFnnLteDqAy?=
 =?us-ascii?Q?HEZ7vUexdT4ieBSVq4OoGhyfJVENtJE/qyT9Fldbd0cQ2It9JePlu4Y7EqHW?=
 =?us-ascii?Q?7zIX9fA/CIkPuzkM2J6FNCOibEFrR6SKNmkNmaIYbLG0oENKq5DTjPc1RzQp?=
 =?us-ascii?Q?BJOARcovohGpQktdugqKDPS/eREXCpiONxP8uPtUYaJT1Ns6X6Ut5XQMHwqn?=
 =?us-ascii?Q?K9s1X6+12YEYDbM61Xk/HykhE/VBBxhX2N0Jta6Std+o69qeNWXGhapVFpOM?=
 =?us-ascii?Q?JigxjWBdV0yxCKSA5dN/Rjr2wVq6Am+85uBvX79mc9Bwpnl1jT5kRuzUpK4U?=
 =?us-ascii?Q?9q8RvQeUq9pJwuy82Q4WUaD5y/mcFxJyXMKKTJ9sAy+InxOZgTM3PYC7156/?=
 =?us-ascii?Q?0wr0CptpDlsu/6wOFYqB/5Nid+hKdXWMxx1gEWdjYmPMNDUeCkaUq3kp5ry9?=
 =?us-ascii?Q?z5whLlAqYmO+IYscpcSE0C0WhbBg+DpiXtgze/7wh89otaE7FBJwAgyh4ylE?=
 =?us-ascii?Q?vBFUv/eLomUz07Ra/DXu4YTpuqldIFeLAqKSmbbpIifrQSDO7FlTcnHUDcGK?=
 =?us-ascii?Q?ZDrwhwcIT0TpI8wvfIVYqB8oyeX3Ii9hOyI3tD7pXIY+RNtXC2uFoihT/9el?=
 =?us-ascii?Q?CMBFYoyiTqqiwWqBUM63AZb4SoB8bygTuNQzOJdf6ffB6w0YycseAHn8BFB7?=
 =?us-ascii?Q?yVBChMPU75ml0fjXGy8FIgn8r11AHnRT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lnAMQ7sNBN47I4m/45t8OpP6QcL/xEg2oEG7dx4P0gzkyLL7D8B/AQdwdKhI?=
 =?us-ascii?Q?+w0gPfwaTGZ231il/L95i2my/y8SLmc7T2IDDmFaKZldvakuja2LpmxlfhyY?=
 =?us-ascii?Q?pFdxPmYqit3XJ3JmXyCaPeguqEEIQriF6fGN2m3T08THQzIHCvIe8D0WmEQx?=
 =?us-ascii?Q?/je9Ax6IXSpyr9eOgGs2UzhqSRpbImlCOZw60z3x8F8hcNMECdHt7B83310i?=
 =?us-ascii?Q?Q0AiF40dYypNSUHzsmHkfsuHs5n1lsKeRMniI3DZ9QhY0zpgtVcAbWAm9nmh?=
 =?us-ascii?Q?qUSIxv0ut62ci08azdJT+OTl7nvO9fgeVndpOUUOz3AtA0upxXBpwvCurXhC?=
 =?us-ascii?Q?el6mwsxaXjM4K045l5BmQuhmUs0C+5C9ujeZoy+pxWJgzfezmSEbZuFiQGV8?=
 =?us-ascii?Q?pPNHe9nZ4ivPyr16r3sFgF3FfjpU18cW3Sth0gcbNB94uVxvcIKUeFVXOPhc?=
 =?us-ascii?Q?bk7/G3MnQQ+PdJN2RP9hHuCUFbpZdbvIxxaR0+tEveh+S77G5/r/VHcE+ma6?=
 =?us-ascii?Q?akhKLlICD57ZEv+WlD9auJhXDagqJBuQ/llOgY+ldEyJE3SqSv0vPoFb3yOl?=
 =?us-ascii?Q?IQLcKnVPhXGUDaonAAGSMY8ini/7G6V7Y6ii7ySo1iFozlMvEzwK2CCRAoiN?=
 =?us-ascii?Q?1/9BMjWyKS13Azt1kPUmyEhejCqD1O5cp1mwA4NcZW8VkqGW6l1FzvQbawUn?=
 =?us-ascii?Q?OSEuMvgGUqEHylPSadRdCti2HyuBH1ZDIofWirx7F4vUQ15i0QkzW5qgUmFc?=
 =?us-ascii?Q?hBPvAL9XvLx5ngPYwUeXpaeT05VTdGHGz3EYlekPfutz4ZFuc6nmg1xyYPRZ?=
 =?us-ascii?Q?cqfj8chAND50v991MJ7SlWDeOroXUbnTP6/PMnGcGdR/iBpRKYwc7imCVqqs?=
 =?us-ascii?Q?CrTG2qWf91qBRxYRxozEv9fE0pzobqW+cmqK43jFm7zKC9Ppp4AH5fO8GFQH?=
 =?us-ascii?Q?uXcqyjJfSQi1XbGIOkfvJCtjz1fjmmOnEzg9fPKhrPXTIzo4/Dlm4L6VA08w?=
 =?us-ascii?Q?WsnD7sSj9RRzXXMnimMFI3nSv+IGXI4Z7QObVcXAxBiWx0lTIE3rLG2+17i6?=
 =?us-ascii?Q?/gMiR3hNcQxwTQg1/WFRr+evdhBOYowzlZMz/ORD7FYe5dnOXPBRImg4VUM3?=
 =?us-ascii?Q?rTu3y09JUwoT+cF0w4fqdLsLUlxjf8r2c4LiLpOQ9GeoOtrp2H68uCj86lDJ?=
 =?us-ascii?Q?EtlU2g0UlEfKfUzOSgeXl9sW0hCC5/yt9hRCvM47STg2+Hmq1lr+K1oIMXZm?=
 =?us-ascii?Q?JmblxnYMwrcNUlXZSI5nUqMGLJUoqZtAjQ9xxQv42TDVcuzJkUlZORRIzfCZ?=
 =?us-ascii?Q?odukn2xfOPQd4I39hiYjFxIBK7wQkMUQnFzGcadx53kQqj+WpTM7kJ+B7LU+?=
 =?us-ascii?Q?lXJyZduD/eQfGZrofh9EDWuj/VbM2Os0l6yq9XmY1WhC8t3p/WltBfSnw9Ts?=
 =?us-ascii?Q?WRdjkEj2xKaf07CtO2YQmalBqN9cF9qGB8vE1mYwDAnhWxpHR3WyN3gUw/Lj?=
 =?us-ascii?Q?/u8bwJHLTsLjzGANvwALckPOVX+Ok72yosrmCiPadf7GgO8d2gDbXTfMTMoQ?=
 =?us-ascii?Q?ZtuZ1O/i4xlM97RxUUzLCJ4+PaIItdEwCuny7892?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b23fbb-14f9-4afb-460f-08dd41477799
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 16:02:16.3582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CupvFe8qnJ5yY4zzZscj9f/GS0g+TbYMkKmunNJOoEGbXOlV6sM5YwRTUGaaBljA8rQxROrX1TamyrNemRIvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8373
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_080223_036270_FCDA5C16 
X-CRM114-Status: GOOD (  16.65  )
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

On Wed, Jan 29, 2025 at 05:23:50PM -0600, Bjorn Helgaas wrote:
> On Tue, Jan 28, 2025 at 05:07:35PM -0500, Frank Li wrote:
> > Rename `cpu_addr` to `parent_bus_addr` in the DesignWare ATU configuration.
> > The ATU translates parent bus addresses to PCI addresses, which are often
> > the same as CPU addresses but can differ in systems where the bus fabric
> > translates addresses before passing them to the PCIe controller. This
> > renaming clarifies the purpose and avoids confusion.
>
> Based on dw_pcie_ep_inbound_atu() below, I guess the ATU can also
> translate PCI addresses from incoming DMA to parent bus addresses?

Yes, but root complex don't use it. Only EP use it. because most PCI root
complex system doesn't transfer incoming address, which generally use iommu
to do that. Linux already allow a simple map by use dt's dma-ranges and dma
API already handle it.

previous 'cpu_addr' is actually 'dma_bus_addr'.

>
> It's worth noting here that this patch only renames the member, and
> IIUC, parent_bus_addr still incorrectly contains CPU physical
> addresses.

Anyway, call 'cpu_addr' for dw_pcie_ep_inbound_atu is wrong. Only one place
call dw_pcie_ep_inbound_atu(), that's dw_pcie_ep_set_bar(), which use
epf_bar->phys_addr, I think name 'phys_addr' is okay because most case it
is refer to dma address space.

Frank
>
> > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > @@ -128,7 +128,7 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
> >  }
> >
> >  static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
> > -				  dma_addr_t cpu_addr, enum pci_barno bar,
> > +				  dma_addr_t parent_bus_addr, enum pci_barno bar,
> >  				  size_t size)

