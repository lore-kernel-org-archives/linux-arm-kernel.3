Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFDFC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 00:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mW3Dbq8Bsp5QbxzfjoJVSoWtw/ohwPSgtJwN/cJG6ac=; b=Gb64fuCysdB96u2s5iMkC8k2Mm
	aDrS7dBcu9vk06B12ML1NyVF6xodSgdgjB2Y7dd/kihFIhd3Ypq5x9tu9HP3YzBH2rc1ODLgGaEAe
	YQGFlI34DYCWKmy0T4Y128WKSPFPnRRhHw58dAQaHmfF0bTJroxJeECwfp5YizRsQNqCo2HBCUWlu
	9GZmadUtn1nXYzfFDGf8sNKq8Gxnw5Yr48HcUB0R8xV77ZBJxXq8V2q80bavjL9m1/nm65RQZQqYg
	/8+AwzF57WrUCaZs+0omMnRESldxc9hviu7MNJlhYE7LwFs6qO2ue4U5EtdlBodUw1JDEqQKu5LIl
	uUE1c4DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQIS-0000000HPiM-1jjx;
	Sat, 25 Jul 2026 00:31:20 +0000
Received: from mail-westus3azon11010068.outbound.protection.outlook.com ([52.101.201.68] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQIO-0000000HPho-0w6z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 00:31:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AedeKmZAhpoJARZPeHJbXMYclWCs5HeJOTnbsb9Y4rogE7TnA7MZAzOD7sEcKcnRJv9dsr0b2KSHEU2A4TFz+UDlb7mlHaKbv4ozqed9vigPrv4yAumkywBm62/97L99lhAz/kxTygF0s1u4mbJ+Eg6lAu6rI1LdWv22i3/4GTM4i8zdLUKTluFJMPJoeITI256JJ/JMxhS6hJwfdE9qzDCdcnjlSpjCCKqfXI8+cKsvgGtGB9I1sYLUBmEDEQzbvctP41UbxcQV/1zdVI+bjnaqJVWvij1kQ1P6DjyUGlluTUnVeibj2p7sHdgPbSOuyipFfrsNAs67hW20vv+7Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mW3Dbq8Bsp5QbxzfjoJVSoWtw/ohwPSgtJwN/cJG6ac=;
 b=HxiyIiAhWSJS/B+cNJcC8oNsBE1K5ZoCKHaOVIjtFddgtAzGdPIbwP6eRdvrlcMhDU7H1AQ6Q4u6lYLGe3il2Z8shK0imODNs6yn5Xl1SR8SZrqYJMwapjaQyVrrFfAfOTel8d9z/giMtgpfz0qDPmykssYQz3V81NT1f0bF5bl3tlWQpilGC/kl42ZHQWA9XxQcGmxlnKrOng5NSa8UjRXHJByUfhygdkK17rYHiLUgIET3RmZ3/YIu4cHa03MFEW7BSFzGQSyT125r5+SxBpWeXQVMhrjbLCZ9Q+bpWwh+9bqkufKDOnHO+1Nq3m3W4xfHGveXK+6ydd10648srQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mW3Dbq8Bsp5QbxzfjoJVSoWtw/ohwPSgtJwN/cJG6ac=;
 b=NJPwajbavZBcU+x3p8lOm7rVNNNiz16Xok5rYAXZ3WnS0Swoy/4eSldr0mIJ3kHzDu1Uk0ErDOYbFrmPX0s6J4SiMfLskTyaOFsRMhFLKhJnQPVNi0sETvdvL6l9ZEOAdH0YTjeTxU/xoZNvDTFDoH2pKYspo4g5ML/uQ9ev1IPBnDTka1BZcx0GdkNeTCffuE/8sCuodk3PaQUExKCevCTeUCXfmVcnjQKC2zrq+BA9PAbFonZgBRWgqZs9pE/WqBno4H4d/HAryL9QjKLaeWn4fWFifO6v8zH50PCr6jkcvJoOxAYcUbBGkTpYFlsJvvlS2E0bIoCNXcH1OjPmBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SAVPR12MB999146.namprd12.prod.outlook.com (2603:10b6:806:4e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Sat, 25 Jul
 2026 00:31:09 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0245.010; Sat, 25 Jul 2026
 00:31:09 +0000
Date: Fri, 24 Jul 2026 21:31:08 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH 6/7] iommu/arm-smmu-v3: Use the generic iommu page table
Message-ID: <amQDzIhulp2Xn7pu@nvidia.com>
References: <0-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
 <6-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
 <amO9X2vBl3_jIttb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amO9X2vBl3_jIttb@google.com>
X-ClientProxiedBy: BY3PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::28) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SAVPR12MB999146:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c0bc34-3899-4775-a4ed-08dee9e405c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|10067099003|5023799004|11063799006|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: m39xODAYbFMN35RX1jBMLL4+cgQ8RQA7eACp4Gg9Dkdc7UinTsE4idEx2/I+emK2xCu5iZXAflcRxITdxVKz/R7i89qh6xgXk3f4aVVwvK8kMqXWY41Vs4uRsBdImkEDRz/ipiHCPbYltGGmfe5SEjwRLj6EBqo+dAQqXIq2wE8nNVKPN2V1jgIYHbkd3fIygNeI8AW9BG5Qm3thmK86s1O6UUNBM4atuoysurZFdHA3Do/fh2PSlyk5CeDjurxhaeTAfH4ukAxhLgSKr+6gpAGlsvF6+l5wNFSpTm/WPbg9+Sx1gABX3fiDxFrD4NbcJa3KzdS0WGnaCkpHyGCe+RKwfwGLYLewB+EatRsneXBSPO+3Qd8ZRRATlXJ7ZXIpMhdU2n++iTRqCLAEu9JcDmQBq5KhniXHlLmGJOT0YBt5ZMSayTYtfmAdw2SsI8rovDOf/1Q0wuFAffJopWyM5cg6KxcmV11S+CJpgPXkSFqU8MilrmBDYVJH5XiaOmLko4ChOgfFCE11hTf8AM5y2RlCfxFmaSv4qNSQFI/4a58Q120RE3o9Y9H431AyUehqrAEMfK+H8k9LBsLZTih/27GXAXelTLk+sag/lrvupsG7SCRGqwBqkzvM8lqR+5c3ZwH8tVzaiWTGB5D9DbN84YYeSi64xBau7sLTu0sU4bI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(10067099003)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1P3Kc9bRDrP0qBVPGFa+RluC6k6sQG0RlcMfzVwF2RanrHxbEIkeizRBcYk5?=
 =?us-ascii?Q?yLcFvZQSsGPAhLviRRpYjbQotpTTvzxxuBet/pBr9WBsKZS88imTE3TVA/cg?=
 =?us-ascii?Q?88dk5cq8igHH5/D/qfwiFI949v0GK115g05GYWwYx4s07QLEN646ynRBNAJx?=
 =?us-ascii?Q?ftdt0N6Q7TA/B9jIdcIGZ2Vc8VGErKuzpPCCJDyekvXO440hs0bUaOwYCT+R?=
 =?us-ascii?Q?6AbTmnPvoZaZmuigAor7yxeRBr9EW2xHFu72ktlxsdIxyq8bez3OKJLsEwVi?=
 =?us-ascii?Q?j9hunqyuhc+/iXQvNLFows9hK5xRlSlXDAGVDEso8CrTaU3Y3dL4MMadzYsD?=
 =?us-ascii?Q?FcmCUtzv0+fwdQc5bWfEVYWcWMT5ayYt07M5BQgKWog2OeeyLO5249P6tpi7?=
 =?us-ascii?Q?z2HDkucRntRtvO8PXvN8xVCawHHKQFnNuG2AsN2T3s14zqEh/SdTe7ZZ4Q92?=
 =?us-ascii?Q?PvSvt9CIh2+GOk5F6x3Uw6Af1d8Wz591n3WcCtKJEyUYwj8uRNuXR2wlBSBM?=
 =?us-ascii?Q?2tuX9Bm73ga740gXXR9luHalzB44iSihmw7cKNYqb6BF4Wm0LCzNemFe4DYC?=
 =?us-ascii?Q?eMaHtGfOS4iIL8KIR8to2wnqT54xQDtW8AOlV225V99W/erVO/OxyN9qgi98?=
 =?us-ascii?Q?BuSi1cPhJ9cBhvX17rRXY8Q2Y4JvGlwkCbZjR2UIPKnsXAYgbeYAEvXwvOir?=
 =?us-ascii?Q?4iU33DSAM+sqPwRlc+3lTXZfIBQuw44f+8S4UnffJ0emhSgaKcdxHAiC5m+N?=
 =?us-ascii?Q?UYrYvU7vkmyjug1kZk6KDdUtkW1bgOjrbl8xthm4yWJxtR9yvqnx6vezaYxn?=
 =?us-ascii?Q?VOPMAjYMS9KSSkhcY34NSdxSwWGP3Is4WNtBGpzMDrVbHaX+1vWvMJpV+aHU?=
 =?us-ascii?Q?6ubg0zHuK7oxRlTvrRgyWu9HlxY/+kpuFN0LnT3BdeU6TGHI0vSzqGHIQchC?=
 =?us-ascii?Q?qkQstN6zAYFYqvbGAeVEluIvpEbNswd8r8wjcNWX+zp7TtK1qjkslol/6aeG?=
 =?us-ascii?Q?BEMImR1d369T7d9tTJmTmQxn0BI8SKCB31pT2R260Ub10hXMQIL8Uv/ECpgX?=
 =?us-ascii?Q?8oAE90ndikTMuNF9qJ5vZE0u4ANfhV73dbminQHRimcfaRa3wZIkPiuv0NCF?=
 =?us-ascii?Q?SsHIa0s+dSBAOf1srDRSTpAv3Kjqmjva0tRebflYQQvVRPt5ZBCMGQJ4HfXn?=
 =?us-ascii?Q?OL3ijbBd8VB7gOZRZYct45Cb/5nJ/MAAzZA5a+MFqQUxkA28yJMFfhUV83cT?=
 =?us-ascii?Q?Z8JePcByeRitrW3db2n9fX3SpnuOeFJMbyy2TrEbpXO73Ocsq8LecdCEI4A+?=
 =?us-ascii?Q?D9kpgCucHHsnOa0E5HCkX2bhZlUIa2IIJZRgrzFA4roVc4lNIxjaj7ORQ8Xz?=
 =?us-ascii?Q?ss5KWq+4Ju0/6LXIGgC8Y29nc3xvuQAWp2GF5kGhO6i9vog/D9hO2udsk26t?=
 =?us-ascii?Q?8BuuYdBVl3sYA5EpaH6KhjTpD8dK4vg1gKXJ80AxdrEDDjv976a9EQNc/MGg?=
 =?us-ascii?Q?p3TaJOtIT8iA/GrNwv7Mejjt2NM2a5pxPus8BX5ACIdXPjbxsiNDM7GjjYMv?=
 =?us-ascii?Q?G08aAk7jezfLxSZbBNXpwRAdTAsUSPvoZBYtMcu4VwuSsQGaQQIko1ovw3bP?=
 =?us-ascii?Q?QqS4SPzMWtp+OJ1Dsz0xDLQ/ZI9iJ1zIqiW6Q3GxFY5GypxOupKWe713sRCk?=
 =?us-ascii?Q?6V7lEvdVtSvsczCFBSsnGKZMmDHkhGwe/y7Lsbg6I5G0FZMW+/cFsW19zhMv?=
 =?us-ascii?Q?Fakq5RvkSw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c0bc34-3899-4775-a4ed-08dee9e405c6
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 00:31:09.3533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOFMzWtpj4oanCASLXxuYt6n/rJN/PiBNxMr4NtOf897r5Lvddf303ZpVRbBsTEp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_173116_282754_5DA3EC6C 
X-CRM114-Status: UNSURE (   6.80  )
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

On Fri, Jul 24, 2026 at 07:30:39PM +0000, Mostafa Saleh wrote:

> > @@ -2831,7 +2785,6 @@ static bool arm_smmu_capable(struct device *dev, enum iommu_cap cap)
> >  	case IOMMU_CAP_ENFORCE_CACHE_COHERENCY:
> >  		return arm_smmu_master_canwbs(master);
> >  	case IOMMU_CAP_NOEXEC:
> > -	case IOMMU_CAP_DEFERRED_FLUSH:
> 
> Why this is removed? That would drop support for FQ domains.

The core code always supports FQ when the driver uses iommupt, so this
is redundant.

Jason

