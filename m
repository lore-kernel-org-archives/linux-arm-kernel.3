Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE34FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 16:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SrozTgcD50K+M6c1dO3d+pliLU8xCC4+J1KLocUcoU=; b=nFjTaoETD0UOrtcNAQYmL0XmpM
	tzENMRmOExKpeBhizxPLpqHbnje9auMAxJzRFyEbeaCf4cs+ssNMx5VuVVmWxuJ15dJHrX/MOjiZG
	DUr7SeOe9FzSXQhZentw/LIREWcKuxnjvggeqZIP1SZaD2GQjEDqUMxICPsDKWzqnefkD9/JWF/aE
	XUxVlbqpWGUKDMo2Zb/eq1GEN0XFdGeAdgkIwCLBQ9s7IQXQ1txhDU1BWthgkAQKksaGyi06Ov20D
	0/AsFJXMC3KIzdz9i21rXE8mfBZgZiUuhb/LKR2oMwPm5cyREI3frq+OtoTL2agwPFI1cYsKIr4cL
	VF3jsVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBS0-0000000GYUY-1FZJ;
	Wed, 12 Aug 2026 16:05:08 +0000
Received: from mail-eastus2azon11011003.outbound.protection.outlook.com ([52.101.57.3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBRx-0000000GYU9-3Urr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 16:05:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NaPQFqYTG+aezdrJed4CkxVz0U1BXGldBBEKx6WiCfRuSbx/TpPyZn3Z9KugULJ3ysnCifhc0M8f2VQBQjzTA+Vc8s0udO6wRmW+7mxOQ6OlI2aYvfIocqqKF8WaNGt9qM28G5X+/0hzExy67sO5Qh4al+IdfakmbDi248pE+RcMSrDph6wL3gs2wVDkO6DdaqJjls0E0dPEAB6iEm5yvNCaA6wuJMMDJncwp3dxEuqgGGCkONIG3tFRltE2tnNyharMrtYialbnNNTLboKjPiHeFcbqEd1fv1hBU3SQSFs5R8cRf8zrIpalvLF3bH5wkCkgqeR1IVLBIQAHWSGTVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SrozTgcD50K+M6c1dO3d+pliLU8xCC4+J1KLocUcoU=;
 b=jWL5Tz742rd5xMXo7CZUssM4ThqOJ7GqIYLPX1hGf7CEiRqAh5oj6woWh5oNtiEwI1Xx8T6LySmfxGiONx826f4GLTs5KiSNP2RaFtauF+ybFGlGMQAy70KSyBmXZVPGLk7P8QIjb1FNe8P8J7RAHG2L8fukuWhoRL30GzDiV12ccfQttw5uLNG7G9LSZRbBacRcaLufujtg/aIsj88QtMViUbr8DfkX9KpMYUpiBil5z52UjverOobBoD1PObOOBfdbL9/kR7m40KrMlCTLnKS6ZCOcTDPTsutynlUtiGTX8Gb2/n0i5TiKNJqIBh3q5g3XIYqGXTiytVCiKwp7yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SrozTgcD50K+M6c1dO3d+pliLU8xCC4+J1KLocUcoU=;
 b=TJMKkoCkBx/k/6SGBPY4cYYrtL5lEDmtfugXc2Qf2DZMIxll9pcC/CxfhOXLrVkJbWAvH2vW+e1H7cGBjsrrcKYwrAwV7ZjlqT2nOFwMhBNxYs2DapUtyO5b5QqHdV7wMKR5LZMMhakgfXGlKmhWmKZYQvXPbxqKlV5g+2kGEoo6x0o4egRIpQ8Ur+FM2qEoK5NNCmORsKrHsd1hP1zIRRAKpkn1F3dNFeYJTz7YxtBAwxNUakgShwGyCwrpdCQf/TI3jAnUFIii8RMJxc/5aDNyKRdLizMcCOwkMaAhIDjW0ygy7w0FYzu+6bwn5zR/IDl29Jxr9lKEozPjSWIg4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA0PR12MB7463.namprd12.prod.outlook.com (2603:10b6:806:24b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 16:04:57 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 16:04:57 +0000
Date: Wed, 12 Aug 2026 13:04:55 -0300
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
Subject: Re: [PATCH 4/7] iommu/arm-smmu-v3: Remove io-pgtable-arm from sva.c
Message-ID: <20260812160455.GA746351@nvidia.com>
References: <0-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
 <4-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
 <amO8UPHuxrvoiXq7@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amO8UPHuxrvoiXq7@google.com>
X-ClientProxiedBy: YT3PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::21) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA0PR12MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f742257-3d00-437c-a5c0-08def88b745d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Pkb5wGCGYiqsll5eOcMNBBVZpuu4SGB6d2iWGbkNIjadA0rrwH90/j7Itul7yB0GnR/FXLcsdk8hiEgm3uDmlXI9hc3u4Z48ZotHGd7qkpuolKXDIXp57B1L03AY14MhhDnDjwGXi9PrvIXjDUCTolUjjoyJb1Dh2iPRzWAwrVQsXsw8JKvWLAM6ruiwgJ6EKC1b7lGqITUA38+ldcLmdZEafDYYzIOd3wZ6jn4Akn+mKEWd5ZaXmLShDEdn8+x6Ci/NKri4O8ne4cahVN+jqujR73a6HBeJ2J4NpZZ4yfbGxhpf/44BqI+Pxm+v+oW0Z+I2aKgyDpJNcU+VcgtMH+6zvwRB4owZMBfeNrx5adnkw+FPhsr8mHwsyX+nlOZdOowHPzTa9Kruqc/K3KCk++9sOh1w46/zlznGHhC8faD9XQ9tes4XH24JMxGQZzOKnhhBrf4O7m6sxWp1NiCIsBHkFp6hkwnxv6CzFmN0SSnRcNONkvcZlQ65epadJAAaptkYYKb0xUD1XrHHX4mLF5ATLul5r+5k8nI0G0YyenZkNcjBFdkwg2Fnv3YHIL17aDaGzJmtuD4ogIjSmJ8ylVTAB2REGpDpIMIC4gIYk4ee1k35skkcmGkLojNCTW4lv0t4Xjwv+U7wVFeB1/KeZIsogR9iUmEo2C8xUZYuZDA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NQ7izpE7EQeyKgPpbXT9rwt8yo5Oqa1BXb1JYz71Y8t1dlIRovpusKF2SHmu?=
 =?us-ascii?Q?yL4Wg6NNROKxQH1FYbYo7p1CJjG2XwUXFYdNbCuZfL7f/eRcQD8503OVa31F?=
 =?us-ascii?Q?u/rMAdpSzkCv2PvXiDU87pnllcABZ9jsoVO2scAKga8L8H3FH166Izw9A4hZ?=
 =?us-ascii?Q?GwXyPKgBmaK+T0f8wf5yBmvD+uQFN74IubEyiJsA+IJa8KqRrUFeidpdW5F4?=
 =?us-ascii?Q?fbO+plQcRUpBWdyQ1vnuL95MNxg09e+nX1TJW/SIK4oAbZRQ4LUQs74hGkk4?=
 =?us-ascii?Q?Eb/UnGsZC6SdXu/WoiIpzvL8bX7k4aN0D52RHxByBR+xhQKarSpTZsrVMipU?=
 =?us-ascii?Q?LLOT4n3iR7yxr1ax3DJD0JufdiOApPCVbwhl48pTmMVnVRZusFbPV3FcQVTH?=
 =?us-ascii?Q?DtS10k7O58x45TGfa7FD6sr7J94TxjcghH8ZNY9j1GZ7ruxKyEET08kIVsog?=
 =?us-ascii?Q?KbcNstmsDttDANh+j2Aul7yzR2fZ30FxnnZysEqB8ZPubUnYN/npwKTgw29b?=
 =?us-ascii?Q?lfi08ug063DwkRyWFhmLHL8S9I8lJvnKjBr4mFmAIu1AGNjbYLMnVm9IZsBV?=
 =?us-ascii?Q?t6ihxLiqUr69aftz/THnUv2eroSFyuzMmWEYgi+qscmCFvUAwbuI25H50eUm?=
 =?us-ascii?Q?4HsR3ySOS9wJwwXTQHlEpf8npiYbqBf67xkeWyK+Bxxpgx4qX8S0K1q9oabb?=
 =?us-ascii?Q?Enukj/rCcBuwhpZVD8ljFZcKrt/48eZySaFDz31sYZXnCiAx1r2UAALvdhz4?=
 =?us-ascii?Q?kk+pQ5ai0/BWWhlIoyz1EniY+7XHWMBKVD0lcN1H1G6hQm+aiE3HzoUF5mdy?=
 =?us-ascii?Q?P+bCbCTwk6lVhbM7bGDlpIOfloyS+PrIrApPkISeGOBYWaaJWYR/IQ5RFxt3?=
 =?us-ascii?Q?a/6CkDQ4L7vXCpnkh0vznUv7QvsB4Skl2A+yXRrucwR4UVnAy9tuuQzFrO6O?=
 =?us-ascii?Q?W/Ez2Hf/C3sAUBYMvoPOR+6nwR8A/rtF/19fYzOkZ7dpi+5GAomIe2IhOQ6X?=
 =?us-ascii?Q?hxZUFpOlAGszKI3NS538pwId3S3SGzO+yTW413zO5ag4/J91vQ6Bo1q23bjt?=
 =?us-ascii?Q?j5N2KOL/cXqC760fR2zQA8y2uIw656lXeYWT7Gz781GDxHaXOEbzbh87uzaF?=
 =?us-ascii?Q?SPqLJxN4QiCUFTmTXwOwBrPNIl5QB7MtKMSC5Zkds2sLCN16riDVe6l2k+yl?=
 =?us-ascii?Q?WpN9XCEbm2LNGcMCZkj+w40BOqnXcKM/UPlfAICoXzlhLgHIrmN3kLrayUyg?=
 =?us-ascii?Q?UdW1Iks8BcFKtM8Ci2/qR4hsFyd2/UV3GYDje338gX7M3oQctDYGxMOlDjGv?=
 =?us-ascii?Q?l7FdTHErOBus4AWISZ0pRXYaUYfC1kDq0oa5B/v3EXf/1TLUfn+57x3iJ4Bm?=
 =?us-ascii?Q?1BWqpQ1dr08MSkO2WMSp3PjCYbXaXJ/nIUYfccD1P+uxFeI696EPuVGTCQkn?=
 =?us-ascii?Q?l4CwB62rlTGtEKVZ3n1QPi5j/gIf+1djKMyierg53RLiIG3riC3N7bPuc3xd?=
 =?us-ascii?Q?VtmZo5UaIf3VpofAscCR5NQ3jqjYwRRHsA+lDpSfdCvVY5ygnY+yTVUAYnMZ?=
 =?us-ascii?Q?9kGLwH/HWr0Oci1R5MH68FI6OJUjpHuqiK/TpL5AXCBejxIV0CZgv4nZdx9i?=
 =?us-ascii?Q?u06WkOWXixS1PFjtGMPwv8KsrCGMb84E5NUmUFC7KddwdkcWwmRay+XIt2T0?=
 =?us-ascii?Q?5jOq6+YYF7txy8BYQohYajx4JHLdzLCPCkr6nZk61h+tI3HI7xpzRSiLcvL7?=
 =?us-ascii?Q?BW9eBu06tg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f742257-3d00-437c-a5c0-08def88b745d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 16:04:57.2067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4S1RF64quSy4FkCx6DGubwOrMOb4BYFYmgmQC1M4J2aJy2x+3rVBatEAX6IyQPN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7463
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_090505_900561_6B49E5A6 
X-CRM114-Status: GOOD (  12.94  )
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

On Fri, Jul 24, 2026 at 07:26:08PM +0000, Mostafa Saleh wrote:
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > index 95186cf84e9abb..99ca96db0d0401 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > @@ -203,6 +203,13 @@ struct arm_vsmmu;
> >  #define Q_MAX_SZ_SHIFT			(PAGE_SHIFT + MAX_PAGE_ORDER)
> >  #endif
> >  
> > +/* Constants used for CD TCR and STE VTCR fields */
> > +#define ARM_SMMU_TCR_TG0_4K	0
> > +#define ARM_SMMU_TCR_TG0_64K	1
> > +#define ARM_SMMU_TCR_TG0_16K	2
> > +#define ARM_SMMU_TCR_RGN_WBWA	1
> > +#define ARM_SMMU_TCR_SH_IS	3
> 
> Can the driver use the ones in generic_pt/armv.h instead of
> re-defining them?

No, it cannot include that file from here.

However there are ARM architecture header we can use instead:

+#include <asm/sysreg.h>
[..]
        if (PAGE_SIZE == SZ_64K)
-               return ARM_LPAE_TCR_TG0_64K;
+               return TCR_EL1_TG0_64K;
        if (PAGE_SIZE == SZ_16K)
-               return ARM_LPAE_TCR_TG0_16K;
-       return ARM_LPAE_TCR_TG0_4K;
+               return TCR_EL1_TG0_16K;
+       return TCR_EL1_TG0_4K;

And so on

Jason

