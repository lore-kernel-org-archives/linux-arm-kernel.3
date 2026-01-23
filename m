Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C90D778AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 20:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/JAfP4y9TeGOSCos9BYOjG2KI3iK8RB5Q67lLmFyOg=; b=U6LGbw8dytoXCFmCQRQ/edxM46
	BP3biq/VjhoadgSwXmT0FLz0p7lvlz5TVEKDY76vQqMzfz8xmqrtTZFCyJZuhZiQnpvxtsgn7WGgO
	iAcokaJrqFq38qB0N1vWVNNinhowf/01lLh/qBro5p6cVzh65Sztu8eC1C14Wvme9ILfOp2/GqwyU
	QYyAosmTQfoI4nDKAJJbY37h+U7mOKemrY4PkTyIKzw46Hv2PvZBP+ZXvGWVuk1ZTRv86ycpqOy9E
	yqtlQ0TDrAPKNTd/pHN1h5w7VIbORYM44pmMnxtsuFWrLeYC9Yd9agzE5CWPalUff7zB+IoAnKhaf
	g4gsiZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNNY-00000009ShQ-3HYX;
	Fri, 23 Jan 2026 20:03:37 +0000
Received: from mail-eastus2azon11010045.outbound.protection.outlook.com ([52.101.56.45] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNNW-00000009Sh3-2woJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 20:03:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJWijVUQaW21MJTLbsW+jC4j7S6M+hGgy+DPgSlVRW1vN1Mm8+DxyJJvSfjtctQZPcbKs5B5jl5MS6nhURN1L/HLxWtaBcZWVq9W4fjp59K9JFxUPDJa733QrO9z02dKgXNQZv/aP6OO85IF0r6IJYGgfjX5pzh/EcrSEudh3enQtZ+8UseeQ/ZEvcMlHAEht22+lEvpSxXgEiowchU8S77q2vN1FqDEZHz9OXst/r58zmJq/bAk/R+ctA720s+QO08ck2pis6m3ROvjcOmWYXnwCN5E7YpBmfJxmgPaxAwgHdh5u/SxjNb/AlYleSigAgCDK3Qq9rUVtOnThfTGaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/JAfP4y9TeGOSCos9BYOjG2KI3iK8RB5Q67lLmFyOg=;
 b=P5vI3fdZ5pgClkjdcoCETjoRgWt4nuxAtqIXPTKFBTtrd+EFwmq5BKTMceTaGsfOKImRbw1e+5P/+e783Eq1QtDq/cWJD6J2AeFOQZgmyXuKKRD4DJg5lzvhPql9a/pzsYbDgMFBMgiWbHtV9/gdrg4NKTrmbc3D60CleiSd3Ib0MgpHitMUq5h4Pg/eZgLvA7SISN4AtQ/vLgM2UIn/phVbBPuQCnJ8pAdfmSceuSt4WQxSoMUtm6I1v8a2JgqEoPtbBDmSLEh/t75m7BkvdNJfLorVuOi/ORtlv97dd2R/Xxd0NWksKrlqbb/vvZj7jr/ecPRa60Z1pDJNNwNtDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/JAfP4y9TeGOSCos9BYOjG2KI3iK8RB5Q67lLmFyOg=;
 b=OKNkbFXO5BMQQSwU4Zzeg3vhW/f3RNq9e3vTmxctV8JWAY2JgvbGJfBBjAS6R7XlbRjirbdzfBsnfTSZ0PUGRT+f/Ka9epDfOPJv55vUWyK4BOGPcAhIkS5pEfeufxYPXsDfUlULy+LQkge+ZIN8MZ+cP7UBk9qzw9BT+OFLn5ZwvVsX+p3I9dJJz0hoFkHfLNBZPSC6F9x/uYWxiJnN4ja4LPygXvMl/pbO3BxwmibBZMiUjglMHYqzHLGx+C8EWe41NKGvOf0aqutXwlmBk2bboipWCs180RHC76Kzb0ZAsKQ6hGS3XUDNRxKtvYBbvkelKLIiwakFRqh73CvqnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM4PR12MB8522.namprd12.prod.outlook.com (2603:10b6:8:18f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 20:03:28 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 20:03:28 +0000
Date: Fri, 23 Jan 2026 16:03:27 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Will Deacon <will@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, balbirs@nvidia.com,
	miko.lenczewski@arm.com, peterz@infradead.org, kevin.tian@intel.com,
	praan@google.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 6/7] iommu/arm-smmu-v3: Add arm_smmu_invs based
 arm_smmu_domain_inv_range()
Message-ID: <20260123200327.GF1134360@nvidia.com>
References: <cover.1766174731.git.nicolinc@nvidia.com>
 <06999367d001283744fd98eb7c1823afd516ce84.1766174731.git.nicolinc@nvidia.com>
 <aXOqVcX9YEC-Ikdt@willie-the-truck>
 <aXOrnMLLzZL9BtRT@willie-the-truck>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXOrnMLLzZL9BtRT@willie-the-truck>
X-ClientProxiedBy: BL1PR13CA0223.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::18) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d335d0f-bf6e-4c65-a0e1-08de5aba794e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|3613699012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CIc+zJ6ibYJOj1tZIoDBiluJYHfse/Xa6Ka3mP5EbksYhpdVVGUMiOrcPY/y?=
 =?us-ascii?Q?JbO9MNYCUizBgtCHO47IBwBKb3OEJ4Txv8pSd9vITPD5BJaFrK1iiXXfOZGo?=
 =?us-ascii?Q?xMlEFcMiXV0UymZV/q0iKZKGxQz1yejK7doBUPLmOz73D32d0BnT/P25+dFq?=
 =?us-ascii?Q?lkpQm0wHzixQoI4Kd+Wj5ykEZySBrK3V+0aN3jvosdB/irhVCxtH9LOAmqL7?=
 =?us-ascii?Q?cUkHNOkzHpIj/CK9Q01RSLyeeMvXOK2HYu9rs15t7cYaCcggf289P0zd0jEy?=
 =?us-ascii?Q?lgkgo3/v2Ic6c3oe9zebu9BXuCbGsMCGKFA1uvmQjsVlOBelLMtsivecZer1?=
 =?us-ascii?Q?nUit6+OjyN9/159D7Vyht/pBsxwd/ssDLOt0dlr3NA8eI1gzpRu129gtjYg1?=
 =?us-ascii?Q?X2orgyWyxLeJyf29+MhFdG8GvUgASLNgrKBMJzXRcSCPqhwt9eipEaZ/F19b?=
 =?us-ascii?Q?9xZCeCUruT19lms/46Dgq1BgGWBz49EPuQiAK5uHwtIxb75fwWilLGYARVDA?=
 =?us-ascii?Q?MVr/QoTwHJh6tMKLvJtmcwGGUj2S4AI7Ed0BxWWWmWrbzqjGNaMfh0e4nKQ7?=
 =?us-ascii?Q?fMlJlE4NUHwuiSK+7BKyM6IqRCt9nKkTmUb5C94G7QV5FAYSCNNGS38pSR9s?=
 =?us-ascii?Q?ulN5gBv6n4aiDeP4K9Ukg0SQFnN4QtBS4DifctTaFdr0Sn8dWTT9Y0cQDgpG?=
 =?us-ascii?Q?lmXj4YoxYSFJuWwBKC/bvoOGZfVkzViqLFVoDMMlqSwQ7wS0d2K/dYoy2U+2?=
 =?us-ascii?Q?CrbyILop04x+sPKW0I4mnSFy0tAPqsHdoDEX5oVN0t+l+gh22YrsQqxXAsTB?=
 =?us-ascii?Q?t7d5icZl5+9nhDTk3HQCe1zVXgGDKLl34XvfP1VZx1eVYAtBy6HIfT3wx8bu?=
 =?us-ascii?Q?3WpqY/XT/oHxH3UuTMlGUsuBBcB2UMW3pVtuPOVMlnD8BRcr7e8i4tPKTNux?=
 =?us-ascii?Q?6jf1pyIubbJ4teCWgLBTRcltVYk+TeVPInffnTX3A18rD9e/oIe9dhZJ//dQ?=
 =?us-ascii?Q?ifFp5jgc2nHUciE7b1iVX4QkpNuVXkS1Ia5Z5dEoVcxgpfcDfhqKfF3ivBVe?=
 =?us-ascii?Q?0T1ztloL5XdjWN5+6+bFHuSHrw1Z/yHiYPJwGuRCgZvNySdJkrw7Ss6fNi1U?=
 =?us-ascii?Q?WRp2ShUszTuSghNJjoRvsYSX8NMULjc2CnADopN9WZ55Fc/RE6GBZFPDyCI5?=
 =?us-ascii?Q?2cdCztLo3j/EkvcQc7KkZagvZjNMGEn7TL0tqYrSat+NYod8SlhbAdkMMgrt?=
 =?us-ascii?Q?Upx28Uz4Af7uL4mkoygcKWmiUmpUt70v8bVK8gqkjIA5J9Ds4eIdazdfqKE6?=
 =?us-ascii?Q?BNjcv15JpTftiJtk7m5FjZD6e6k5M6eVSTRUEziXKWJ0jyAPh+1oVujvKu1K?=
 =?us-ascii?Q?Vtmr8n9PVAXVdjBoHEcaLPxYTLEeTde8D+LulDCJuU4FeU3GH0+AH1wzch9d?=
 =?us-ascii?Q?aJcAVsvL2groWxlCZcmlcisQvHvbdcnahYvnz2hvOdW82GDtjpzC/wXza5l+?=
 =?us-ascii?Q?ZNErbqrvHBXUboKkbxDqnEAv497gDr5bAc29RwXS3Rf0hTzQnpehp//L/XDC?=
 =?us-ascii?Q?N4kCf8rYqP0MqtLoSuyfxoC4IfNg3arNddScQLj94p3zn2OfTUM82H3cfTz6?=
 =?us-ascii?Q?SA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o2SdYswtaQBN1VJ/CyCBl/KUbDWFTAQF67gqqHwefu/0XeP5H0WyQOBMVw/e?=
 =?us-ascii?Q?K94e2HaOtZeNA56ZjZqLYiwFe9wlw2/zqTzZyuHTFo/geYykyvcz+8oMipEC?=
 =?us-ascii?Q?f5jhlQP6fQVSckNXGsnwWqUe6Sd6W2AmaDlUoyQss+bPqUFtrfDjg59ORtcb?=
 =?us-ascii?Q?90g039tUWGwVu+fy3PNg9PUE2G/VBPwCCU+1qdY1h2BB0wbhVUiGoRqn2sTc?=
 =?us-ascii?Q?ErnHWZ4bIyAnMTwIW+fIS5vRtgvwSrtjjP47Qj8aKu2eDch9yKMwMlOYj1EA?=
 =?us-ascii?Q?o8GJmVLWQz0FnEBgPs367MnRB2T1vTlSKjk7VkzYmA51ADAihLgZWRZcK6nm?=
 =?us-ascii?Q?iOHO93qxqTcp7c6fhilWSQM8cSb/kBRvp2uOsYL7NwAuy5PIkNksFFwhu3q2?=
 =?us-ascii?Q?BTmXz1GX2xSXXlduIzGsv7C9iFYVnBMp3B53275LeW6JG59PqtIipITHFoNt?=
 =?us-ascii?Q?HFJ/YMupZaMz/2XBNwqWI9iZkE7QY6nvWIJ2v112j9jc9RJPXFc7XSv1jGR8?=
 =?us-ascii?Q?2V2vBwDWXFz0PlnZA2h+m349F4nn+h3C5vJ0xj7Id0xuSaSJ4ReZm+HyIrSa?=
 =?us-ascii?Q?7Y+RzZogbI0Q0D2O8rfvE9tqr2bdGHrdsS071qq1etj+kaV4nKFOKTQscUhT?=
 =?us-ascii?Q?0+XWlvWdngqjA6JWn7zmiAd1AnLHaucGfDc7vPahf12lXUU1yGpILmEahZXj?=
 =?us-ascii?Q?59SP5qz9k+OqXxvz3LvO1AiTZzrRBzZuK9LEU/9GG8pKNQugXx6FDMp8qoeQ?=
 =?us-ascii?Q?vDS4sgAYR00gg5wT2jF0zgPDecdFyUJ7s4FeUFav0ZS5z7cCvPkEBZ4KtZJa?=
 =?us-ascii?Q?ojfu/hNc3BwQjPi7GwGCY/3nOTavd+4uQd3sXeBI7ZupxdqcfAVPuayZ42OY?=
 =?us-ascii?Q?oCddlo32RhqDQi1HbkAmYCIJSm9JbYBHpWbMsey5Z+2rDJ47T6oBlwfdqQWN?=
 =?us-ascii?Q?OH3LXH7inQzLwI0Rad37gm03VIlSM6E7Q88ES/++jbhMYTF7mUdUX5wPY51P?=
 =?us-ascii?Q?OdK8nYZti2bH12E9CWa2jNCNsrthNAnboSFJjHED3mzPAe31fPokf9npDec4?=
 =?us-ascii?Q?25KIw0Q7Llo6VeZhb9ubF3Cqj+5O5MVeC7fBWNxzwOrEmf50wFoFvWxfpwMF?=
 =?us-ascii?Q?m7zn/wRGS9hEpg+S4ZxWGAb7xrdmsdxyOyw8wQq4FV9QLD1Hkc+1/9Ji8H0a?=
 =?us-ascii?Q?BeKUbYiIlqH5Xrf7sJfH43BytCSdUDG24dAzothkPcufzv3gVr6ds1h/i51S?=
 =?us-ascii?Q?vR0s3qC0kitLPdwZuR1nb99hWWyvVaRGQWv1ySEAEzIDlpTvlpJrgmxI0gI7?=
 =?us-ascii?Q?3msEFnkYccUpoHWP0mpFrsQGwNpFSaJSYJUMVaPgrS1p3chY2r9J2nl/Ujw4?=
 =?us-ascii?Q?LXjpyRq3P/ilzW7LA8QSb7wfdCHOG4CLPLyd328Czx2m3fr0l3WPHV+dbVAV?=
 =?us-ascii?Q?2gBx2kvFUTSI+xJLV6fcS8EgnlKlz4b1tVDxXbuL6J4wOz3HnB5HKRChPmkA?=
 =?us-ascii?Q?ODF5F0RBMVg1UACXBSPeKBfbZg3AZTikZCnzCk/hT7Cf/eUFkyXpxmFcYYbL?=
 =?us-ascii?Q?aOdHiaeLc1kHChryM4CRrxNq7ZMjtiDUe2fdVPhOf78j0TqVRFYD4nQoLACo?=
 =?us-ascii?Q?t0gpxFQXwncEB2GoaKepRdz9ubkTn9AsKSAT9tovlfNVN3oIFKF+YAz/XNpv?=
 =?us-ascii?Q?XL6fSx76D03inqlVh0qbX3gQ9F0V4XvlOUNxsC7d+3cMmwxAlRY6Ezjvj4dU?=
 =?us-ascii?Q?e7llpDsvgA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d335d0f-bf6e-4c65-a0e1-08de5aba794e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 20:03:28.0152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdho1nBxl9+hEBBxc4QkgnAAAfjBRo+93Oew45VomjjRCgpttLRJdFaImbdORSEe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8522
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_120334_747637_DDFC68DF 
X-CRM114-Status: GOOD (  19.35  )
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

On Fri, Jan 23, 2026 at 05:10:52PM +0000, Will Deacon wrote:
> On Fri, Jan 23, 2026 at 05:05:31PM +0000, Will Deacon wrote:
> > On Fri, Dec 19, 2025 at 12:11:28PM -0800, Nicolin Chen wrote:
> > > +	/*
> > > +	 * We are committed to updating the STE. Ensure the invalidation array
> > > +	 * is visible to concurrent map/unmap threads, and acquire any racing
> > > +	 * IOPTE updates.
> > > +	 *
> > > +	 *  [CPU0]                        | [CPU1]
> > > +	 *                                |
> > > +	 *  change IOPTEs and TLB flush:  |
> > > +	 *  arm_smmu_domain_inv_range() { | arm_smmu_install_old_domain_invs {
> > > +	 *    ...                         |   rcu_assign_pointer(new_invs);
> > > +	 *    smp_mb(); // ensure IOPTEs  |   smp_mb(); // ensure new_invs
> > > +	 *    ...                         |   kfree_rcu(old_invs, rcu);
> > > +	 *    // load invalidation array  | }
> > > +	 *    invs = rcu_dereference();   | arm_smmu_install_ste_for_dev {
> > > +	 *                                |   STE = TTB0 // read new IOPTEs
> > > +	 */
> > > +	smp_mb();
> > 
> > I don't think we need to duplicate this comment three times, you can just
> > refer to the first function (e.g. "See ordering comment in
> > arm_smmu_domain_inv_range()").
> > 
> > However, isn't the comment above misleading for this case?
> > arm_smmu_install_old_domain_invs() has the sequencing the other way
> > around on CPU 1: we should update the STE first.
> 
> I also think we probably want a dma_mb() instead of an smp_mb() for all
> of these examples? It won't make any practical difference but I think it
> helps readability given that one of the readers is the PTW.

The only actual dma_wmb() is inside arm_smmu_install_ste_for_dev()
after updating the STE. Adding that line explicitly would help as that
is the only point where we must have the writes actually visible to
the DMA HW.

The ones written here as smp_mb() are not required to be DMA ones and
could all be NOP's on UP..

Jason

