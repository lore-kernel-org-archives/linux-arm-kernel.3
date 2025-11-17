Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36567CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 19:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pc2gODHOkDCmzRlqjNChMCK6ROV75bm4nGrj9TqD1Tk=; b=RDjvmkrcFApUxtPSqSXqUaEMUs
	Mxx4zLxVQgk7iMSQaVub/zvcbS2POJoe/bRvmyNmPFzedl/xNiKwiPqRQQAVsM1q/e9shKmPxF9to
	chVjOanDIi3HlBSQquIbSsWu5IcbDkNkfLlympx+/fH3zzXmCIbD24RyGlM7VTgYYiz+6hZfaRolZ
	Fu6swoviq1+oRTVDGeihGGhNU3CB6HjMVK1dnfZe+MphFZeB8RJN7sQKCTR0nWMI0A4r6Gvf2/rr/
	Ywx/KV0S/pRIEFreoNPB//cnfzC9r77M6yCH0R6u4Uud/yBs9i/fgvA2UA9SJdE2CUjpBvrTFA0VG
	/fOtjmvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4sv-0000000Gktq-2BKt;
	Mon, 17 Nov 2025 19:27:33 +0000
Received: from mail-westus3azon11011044.outbound.protection.outlook.com ([40.107.208.44] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4ss-0000000GktG-0arM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 19:27:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8BDpNYWjTXKDy8wKFuDDMrXh/cOZ5lGKcwzRExAc9DJFsUvbz3qMyRA4SKrP1vlRUYlQDmYVwbBlONQOPv5aBZJROFdV0XZP8FWYxCZn9UdBxGhhDVR1RIlbT5irjMN74knY3EwH/yFP8egSKNj5EJ0JhalBJ47foPI7uzC5YDd2Ujv8KUZAF7VYxBnfs37cLjXyed3oPJMNJ6wK5LK5pA+GMwrb7egvRoAoI3QZOduLH6m0TRsVyh84Wx0pE6R24Qb1TkrN5vMMcmqd2nx3K6Ma03kLz7I2wrjHlcm0K9rmBX6gMffM828WuaUxAB0Runia3OzMFeQ41n2keELmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pc2gODHOkDCmzRlqjNChMCK6ROV75bm4nGrj9TqD1Tk=;
 b=D5dgPg435YR3gNcHzkA588UPpyaMNqwIk6Hq/K4uMIKY1WULTDTwG8wuqsP3RpcrOqfwpNkhEKtn6JjElTOOkUr3Ff0mOTcCWeV1247cDI2S7O8+WT3eRhrws02G9coHG+SSbP2Y8nC7WiymKUshdx84GQNeZqEwaX2PKS/fVfIkGJr/yBepasH41NxyTFABdAdDDmNUb1k5ESXkqFrY0FVwvpEKy+UF9KDkmZD644GNkEma1FM3eZ1EZ1+Ms2KFjHdOnka0q1+ay2sqxbdXbjWEsJDsGM76iWuLgU6DZSYS9ETIoVII2AcConcoW2qq7oUi2OoGXShpzpUbAybubg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pc2gODHOkDCmzRlqjNChMCK6ROV75bm4nGrj9TqD1Tk=;
 b=W+YUQTDf0Mm1cnYgoWyg9nW9Y/hv1xWOjPpP+JWFrXWqkao5f1OoDkbaptwOcAsAin90QW6sYpQcrf4hrCiM4azSgnQ5lbbjkhmjqtNNzpPcnYfKc8VCp+KfvoIo8hw/l1/cM/2xeoGPaXHiVtLL/WTIt3YZ+J32OlH9Wr3T0gXDEX6mkmWuNA5o4A2p0KJ4fU45gUiOx+kd9xjhIS3yD32dUOQ04N+AIjpMt4MXL2YBi1SfFYf/Eew8l4oMQB954ufMUJcSBd3W+4lbBhWAzoQFq2EvDI8Uhq/IBHP9yKrUJsdA9bgxK+ZGPAcEMxnHhcTdPIDhCbP/5fMuwhWUxw==
Received: from MN2PR05CA0066.namprd05.prod.outlook.com (2603:10b6:208:236::35)
 by DM4PR12MB5985.namprd12.prod.outlook.com (2603:10b6:8:68::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 19:27:18 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:236:cafe::85) by MN2PR05CA0066.outlook.office365.com
 (2603:10b6:208:236::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Mon,
 17 Nov 2025 19:27:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 19:27:18 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 11:26:58 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 17 Nov 2025 11:26:57 -0800
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 11:26:56 -0800
Date: Mon, 17 Nov 2025 11:26:55 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: "joro@8bytes.org" <joro@8bytes.org>, "afael@kernel.org"
	<afael@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"alex@shazbot.org" <alex@shazbot.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "lenb@kernel.org" <lenb@kernel.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>, "Jaroszynski, Piotr"
	<pjaroszynski@nvidia.com>, "Sethi, Vikram" <vsethi@nvidia.com>,
	"helgaas@kernel.org" <helgaas@kernel.org>, "etzhao1900@gmail.com"
	<etzhao1900@gmail.com>
Subject: Re: [PATCH v5 5/5] pci: Suspend iommu function prior to resetting a
 device
Message-ID: <aRt2/0rcdjcGk1Z1@Asurada-Nvidia>
References: <cover.1762835355.git.nicolinc@nvidia.com>
 <a166b07a254d3becfcb0f86e4911af556acbe2a9.1762835355.git.nicolinc@nvidia.com>
 <BN9PR11MB52762516D6259BBD8C3740518CCAA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aRduRi8zBHdUe4KO@Asurada-Nvidia>
 <BN9PR11MB52761B6B1751BF64AEAA3F948CC9A@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52761B6B1751BF64AEAA3F948CC9A@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|DM4PR12MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: 4740cea3-8bac-4327-f97c-08de260f526d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zlKmCZlFMjyPES8pVu6Jpx6je4Xc0qQAPE9OnBe3bpQ2isCNGdVVB1V/pFT8?=
 =?us-ascii?Q?lLQHvchk+eZfcc9WETDAsgtv9FEvp2FV/3zBHF1zn0zaTXMW/NLrax4PdfMq?=
 =?us-ascii?Q?vSuWazjNi0MZhkHT1DQycgxrn64IG56rsO/xOUY+luP09auDq0bqd1YQViTi?=
 =?us-ascii?Q?QvXo2SMqwbNK6YxHlSsfFOUHNIURPSyzOl5NXKzsrKMEn4dKn0bSu7Xge3hX?=
 =?us-ascii?Q?kJ2d7fOTwcEg8i9blLdTw9Vka+5nvWkYUOLT/GP6rAAGqcbJdUNrWYICNVwp?=
 =?us-ascii?Q?5wwP3uqxYpyJaaAkW5DxvnzXMBupaFqw0TNcdk5LdpFyqeO1RgXypH6Ag1ug?=
 =?us-ascii?Q?lm86SZ4Gs+Z9w+89YKOsUZNFUTiIcECiUy68PSzzS5YuZ+ED2dEqqvseQ+tZ?=
 =?us-ascii?Q?a0gxP1puZKcjz2pRbFNyj8caQRYmySS5M+hzM1uAFX/yFzHmdT+hSn/FTccC?=
 =?us-ascii?Q?mPiE3X8VfmDKmPiy8CAsVMP+eDRqJckCkjZ5G/+vb9cRzl3kgD7rR9VgaZUF?=
 =?us-ascii?Q?1rSmIknxnug/fMg/NBD6UNU1A+w/9kg9BdiqD4zG/cOkdTuko0OCYZpo1HqP?=
 =?us-ascii?Q?QtAFZDZmRrXCX+YuHQlttXm27fTYcgCgcfJfYNRNn8gcwRm6dM+wOwhXxdzC?=
 =?us-ascii?Q?Xwz1kGS+Xr4vwACPxTwkY67laQ0aN0DkC3XCsG3Fb2ko787JX6M3v1TQgQnK?=
 =?us-ascii?Q?6Enmt/E7dkfd8ddwdex4g4CGv3A54Kz46uva1VHo/r3y7s4K7bwiqTZMbACe?=
 =?us-ascii?Q?0x8hBNHv+BjImgOtww6kIqFKHBG2Vi9vEckbAHVaZD+cEadVqxbbTDtpWAVa?=
 =?us-ascii?Q?36JAC1AbQ7meJH5juNe6285HN4UQLYlO3oxpXd23I2aNc9MceWvqJY44dJay?=
 =?us-ascii?Q?zW1X+EY2BSG+5ov3815ol38VA6sr0vioXxNKIscWiXFLao+EX3oS/0Yc874h?=
 =?us-ascii?Q?27ZOyJHCmK8YQZtqyU63Sj26hOWb6GoOK8428tXIptJSBLGBidWPPTKcCQNy?=
 =?us-ascii?Q?0JP/6g92uSuSF67p80SO/hV2ldDXhQBDXJ2Rgz2sLAhsPnFuOzlfO2M1zJXB?=
 =?us-ascii?Q?8Bav2feVvYq78RF7w/SBynnPfx+n1rPv3sRxZR3vMOLxVzy51schgpgIQyAg?=
 =?us-ascii?Q?uIJZA9rv3PoFtSSXsRu8+/0gqS0S7mAkNW4RcBMVU99LTgw2BumIg5Ql09o0?=
 =?us-ascii?Q?uvN8xky5zL04YDZ2Jt/9pUB+Pb9C8hFB/08I6sTdGtoZcB7VAwcgBwyG6/PD?=
 =?us-ascii?Q?Z/xRRIK74U7gb5cRCthT9FrRHKQa3q7StmGZ+nklXI/N5hTvOgk96DByOCzs?=
 =?us-ascii?Q?qlyBRheNCoD2vppsAne6PJya/f4sQ9RXLTTx+JH6jGEi7mnwtyMzD8BnrrIU?=
 =?us-ascii?Q?3isogBXY28rPIPJgp8YM0SspV+Zza3ivWZqPuj5zpoCmDRypbG4sQypTho8Q?=
 =?us-ascii?Q?bujHRouDKRNIAVRwM+bAoCA1EhwCClAP/s3UIlXGSuE3wfb/rtg4DcMeEu8A?=
 =?us-ascii?Q?sBmmqDjM0jS3ZT6N1ti9s9bbMuP3wduNceZzxKqe/Jlqgg/7kPoxUlUKu91i?=
 =?us-ascii?Q?kMOfLGCu12NsdKMWhis=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 19:27:18.0713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4740cea3-8bac-4327-f97c-08de260f526d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5985
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_112730_186091_6E05658D 
X-CRM114-Status: GOOD (  23.60  )
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

On Mon, Nov 17, 2025 at 04:52:05AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Saturday, November 15, 2025 2:01 AM
> > 
> > On Fri, Nov 14, 2025 at 09:45:31AM +0000, Tian, Kevin wrote:
> > > > From: Nicolin Chen <nicolinc@nvidia.com>
> > > > Sent: Tuesday, November 11, 2025 1:13 PM
> > > >
> > > > +/*
> > > > + * Per PCIe r6.3, sec 10.3.1 IMPLEMENTATION NOTE, software disables
> > ATS
> > > > before
> > > > + * initiating a reset. Notify the iommu driver that enabled ATS.
> > > > + */
> > > > +int pci_reset_iommu_prepare(struct pci_dev *dev)
> > > > +{
> > > > +	if (pci_ats_supported(dev))
> > > > +		return iommu_dev_reset_prepare(&dev->dev);
> > > > +	return 0;
> > > > +}
> > >
> > > the comment says "driver that enabled ATS", but the code checks
> > > whether ATS is supported.
> > >
> > > which one is desired?
> > 
> > The comments says "the iommu driver that enabled ATS". It doesn't
> > conflict with what the PCI core checks here?
> 
> actually this is sent to all IOMMU drivers. there is no check on whether
> a specific driver has enabled ATS in this path.

But the comment doesn't say "check"..

How about "Notify the iommu driver that enables/disables ATS"?

The point is that pci_enable_ats() is called in iommu drivers.

> > > > +	/* Have to call it after waiting for pending DMA transaction */
> > > > +	ret = pci_reset_iommu_prepare(dev);
> > > > +	if (ret) {
> > > > +		pci_err(dev, "failed to stop IOMMU\n");
> > >
> > > the error message could be more informative.
> > 
> > OK. Perhaps print the ret value.
> > 
> 
> and mention that it's for PCI reset.

OK.

Thanks
Nicolin

