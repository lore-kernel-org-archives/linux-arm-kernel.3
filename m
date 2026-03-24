Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE79F532C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 00:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/KTRl1JIVHYqE+oqLLDDD8kWLDWL33PTRmZoWjH3Sg=; b=e05u3OI4CKIdo/w6sQs4fb0XoQ
	Xn20wnND5VRSZwtFDO8Lds/vQFMipUQTt42vrQndbrMVkK42eotb2wqZ0msKOPSu4g0fJeuEGsnmu
	Xt+zn2HMwzyp3XfIU0ZIQX6WEBeROg3nqbmPsDiVjhOOL9uiauH3XO75yrM+SC0Ku/377EXkm2bpF
	rnvV+VrN5u50nDE02gvk///+0UXm1DgHQrcwxI4Ey/vfHcEXM+2URpSBHqMOEoAMBsvvP2bJNKV6b
	zdMalE2WtLXbcR+5fwSdVtvYj7OcvxGYeRxW3rrsr00FT5Sch0zOgkCk81IYElCHPvdV/4/6p8hQp
	aPimGZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pF6-00000000CXe-0tY7;
	Tue, 24 Mar 2026 00:03:32 +0000
Received: from mail-westus3azon11011061.outbound.protection.outlook.com ([40.107.208.61] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pF3-00000000CXA-1CgG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 00:03:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNbK5A6RAGNk3LsBFFc2W/rEEXZ0G32p2GTup0LkJtJTBmALAv8BCZAObt4OifKbqJTUz+cFFXx6NZ1n4PUtWhe7kfOFJBGnSClKAdnJqw+AbBBhkVb8V1BOtRUm32kWdt41plnDUx8tMGixtww01BQ+1PhsjwrPo0xS9UqFyJ3G+ag/26f/MUGARMoFIUdpz+xS6bISd+DxFmEcsRaxKQneZAvEuz/LukVl6WBj+vewkhhVx8+59yCugZl7EJY3abUONTl1sxSB+bzxVV64gXkmeMOc9dbmSftxz0sKvwktD5d4WTNf2P8PC3S4l/vQLMZJqFHtmlLIRzwN79PpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/KTRl1JIVHYqE+oqLLDDD8kWLDWL33PTRmZoWjH3Sg=;
 b=IXLGioMzj3JNiZ7/Dgk6syZ6Tz5CnuF2PffqMEY/u8cUikWdHD2WAXV7j3w1NQ7qsmjzsu6Cy+72QAdtBqCyKMmShHkH3il0S+toU6Otj29BLRe8c86m8SMooGa5OE7BO2V9rpDHoIa/pFR8mWqEBltyMwzbxhKKq2ZSyUaUAO5dCC83yBmMlbugE+s2JTkqzhz1ElhWGZnjpILeLM/CsSi1L8m6G6WMgl7B4pEmBtiPy74p6yXs+eRQDNoYcg5lW5cMWEwWY0GJB991WEFgsXvJ+t1MsdCZXeJ6eJrPJrxCIr1sVLt6h3fqV9wZL0YD+5gk6sGBvcWrsDZef4b94A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/KTRl1JIVHYqE+oqLLDDD8kWLDWL33PTRmZoWjH3Sg=;
 b=pMZbV4jb2kgkucgogK9dNsPU/6LucrwwtOlJk31GeJfL1xxKT2jrB3lfDrNuG1HgkobYFsnkTrQbG+IZ8Y5mQJPfvhUCGz7jKI6yLIH7fFUO7vkrSyhn9MX7xitLSHFHX1HFarOgHhxJtO6QoUTxbE61d9nhp2Gl5wypt2T1ujrQPngApBGmCv+HlEYkZPhMNV8Hejz7kOivp2REK0dmk9pIJlaCNhNWay/+ISygGe+ewiP0Q0ObOHxSTUditCZgMMdFYip+wEsaTMMJOVioZP2+bAvQaxzjvUPKpO2NucuN1YxM70Qw+xTz3Wka+qzvDDXYqSuj4aUPP0xqFyv7/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MW6PR12MB8998.namprd12.prod.outlook.com (2603:10b6:303:249::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 00:03:22 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 00:03:22 +0000
Date: Mon, 23 Mar 2026 21:03:21 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	"will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"lenb@kernel.org" <lenb@kernel.org>,
	"praan@google.com" <praan@google.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"xueshuai@linux.alibaba.com" <xueshuai@linux.alibaba.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>
Subject: Re: [PATCH v2 0/7] iommu/arm-smmu-v3: Quarantine device upon ATC
 invalidation timeout
Message-ID: <20260324000321.GX7340@nvidia.com>
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <BN9PR11MB52762F94146776026CA203248C4EA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <absFXmFcpG8O7uNB@Asurada-Nvidia>
 <BN9PR11MB52764771C48B39C09F129F218C4FA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <abtpCXAnqLRnbG1z@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abtpCXAnqLRnbG1z@Asurada-Nvidia>
X-ClientProxiedBy: BL1P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::15) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MW6PR12MB8998:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a3516be-0daf-4c33-33d0-08de8938c36e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: QRPjVcq4gUV6KIFSua/4sa2IJO1cTNwDpI/iNAK+tG45oKgKGRe0qy3n5iSQ4X+MDphGwuYnVXGv8ntilcA9nLUiBYyHaf0u2Oq0db0q6mB6ugUF+om1vr4+liQmGozDf7vwlCrvc0MwL3Q1N52QIKDlz53vAHZuo7iG9MNsbxB97RRszHiMYQvxfonVSJ2+Rwxch6wMjU6hNlvgX6Ao0KeesyVDMTWrldvuH/6Ff/nnYr6IX+6pyXm8N+Wu4hftozdfsqydqjRElZXAReMIAE5Evx5aE7gWpqUnqpTAN3DTVR3NaykiPt2Pr1Ylon5Jgj+uT/hIy03veWjsJi0EHoTuUU61gQ6C6tmwArXCPbfVAgofQwfDM3Tr8Oijf7v/uFDJZB0/+MOeHDkhzBE9VrZ0v6jzFIEYZWlZmVuxO+ptYukY/03sVzJCDLzAUeW7YrO79JEZf9ndOLTQeOPDx/+HuTjZ57DY/7KfFbIGNMmNvcdhvX/kFeE7GNSQgCG60V3pe8xotP9PKOZ1NsuohxZOft5LwIXjpULr56CyzsWZRn7upW90MxRKeXANbH+4m1MdERQ5Fq9sN0TK5BYEQtBA5Z0f1kbHrAG2C0efXC/d2zTu9hQ58N/37yBA5iCgOYdbyuhNOpn6e+gLo4jZTC3dFry4NoTEp21ZgOgtDNSnOXjoQ4CzZAgGWjjvSH8pUcPHL0/b5G8eRHCN+k0VUOrTdzVUqNaBseteGddl4kY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t6iDwGcciomIFNlN9nQIYV60X/a29OpwioEsTYdHMtGtD0QUxD6OOqUYBQCQ?=
 =?us-ascii?Q?1Mu36ri4GmQTQkO4NM/7L/xPvn16cu9yUwh6sPA6+2QKoMljLo5DzytdPNI6?=
 =?us-ascii?Q?xTbTFR59bbQqQQEIOCRFTZHJNiIfI2ewg6wUPm3cu/zR+LbHLWC0kX7n7iHP?=
 =?us-ascii?Q?fl6NOkKSNTy4D9oFG8QE1Z8kGVd1HW7RbjZ3K2Gblm881fi5h83506BKoKZf?=
 =?us-ascii?Q?ncU7F7sCR70cUSqoPxeL8lRbWYPtKPTFLLANxbcrpbNgAfA4HTWzGnDDAlfZ?=
 =?us-ascii?Q?Cobyo2SH2h3E5m0/jOWRkBIQW2b55iBVAggv12J7hUoRBlbTUXIH4XiKjrgO?=
 =?us-ascii?Q?jT1YpkWovvhe1CDQFZHej5nuDS2iuaYve96nWt2Yj2U1woqLoh/nxcGNvN6Y?=
 =?us-ascii?Q?bLlnseDARi+B7rjCtMNx2AEF20gBynKk4zaSoglpVTVRG/ob9akreiZo8JI1?=
 =?us-ascii?Q?6gNZMpQfoFXOdiaAyUfoz3ejb8LYV0tNgm8sbU/vxUUOPoHNn16IS1QiwkL/?=
 =?us-ascii?Q?BZfvw3GibAC/cCVQfT306B8mm6mxJMN1XkP76HAfGwnsqEwGz8Vl7nZY5DNF?=
 =?us-ascii?Q?MOTSv7bywhsf4prNiUBT4kM6mAODy7t6XyOXqZk7tpwUIP/AZJ3NbSre38M8?=
 =?us-ascii?Q?v/0wyngUIq/qmxEeOd559/n9KSTjyCUYpT+aSbeGYMbHKJwQ+hsvM4/l6BCN?=
 =?us-ascii?Q?oq99XQASC29O1ZHUDTsbLwuAnzXlo7kdAa3SuC1VaKJsBEx1D3F1+XvReLl2?=
 =?us-ascii?Q?v8XMDKecpe+jXpp1sMUYOtkwLNYWq/5O0ykNXObC8GQqwVbJra74hrGzdpit?=
 =?us-ascii?Q?DheapxIfQwB1Sn5G7q1Aa2DeQIpyJ0DX4vobYIyOgeAHPO7pzlvfQ6Bs2mdM?=
 =?us-ascii?Q?N4+AGYJ3hFIeysBgmqUBk7Pz9F20m+KG9V3F8eKN+YFibnJ+CSWA+fIc0Kvt?=
 =?us-ascii?Q?ycVqvp9kaZFdBAHVsQ13V9rFGd3U7qJuhMvi3wm2Mj1VblYctNpRtwQGaTyX?=
 =?us-ascii?Q?6qLfH1IN62Np7BgtkBI0+kz2m42B+Mp0krLkK21+4iiFQwaIHQfIxT8dwu5e?=
 =?us-ascii?Q?/AbiHwhjhKFA8avGTizXht4L9ZukHLAzY4FClAIB3C5qVPnF5lJPLg7MFQD+?=
 =?us-ascii?Q?a0YIx8OAvUzROTeSij2UwU5nP7fETrJgyuQ+nKvKR3NE+C/yU3mJFnQp0lE8?=
 =?us-ascii?Q?JFKD19LZoqpA8u32cx/QWiispblatrxv/lonu8Mtb6s+HIq8WAu5Ovl16PuN?=
 =?us-ascii?Q?WvCF8YuvCt2eQifUNJMd+e/BTBlrSSa4ur5brMfC6ZjUjPf550QafVu7v7Hc?=
 =?us-ascii?Q?Ju/C7IVXtvq197TUh59VThFaF51pyXbR3iHOoOBHx2a/TYrLJcOGSaEllsnp?=
 =?us-ascii?Q?Mnv4gQR+YZbs4dpRIZkvMTJ/TexoQTesvMtlT10YQqhQdxTQekwfWnXqygP3?=
 =?us-ascii?Q?t6hJ3+bM6Zj9DrHYb2dQZyvjpwQsqUP3JZ4gQVy3RIV39vdpx1yCT93iWdah?=
 =?us-ascii?Q?YiBpzQWaVbQDXRoWPmsdMMEUN3Gfpg+NO85RvJRkk7+UavEamO9ZPKinf6Kn?=
 =?us-ascii?Q?0qQYnJwKGstQHYTkliDFXMLd4gDE4jmimiJPSvSihsXS2+C1JN2kKYZoIs0q?=
 =?us-ascii?Q?NjydzYpBGp7MvAuqLUHkbd35X9LmQRZ+GkSYE/2N9k8qWze7szkhn3AdUaU1?=
 =?us-ascii?Q?QvWuN9BmuJ0O8aAR9j8U3e07+CJYB1DnaqrSXGF41uR4rIA/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3516be-0daf-4c33-33d0-08de8938c36e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 00:03:22.5910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMZOkCpir7JuVrVid1INP41bCdLijbSaBgNL4S8OAyX80T81V1FBRbij7APhHqE5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8998
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_170329_329560_4AD62250 
X-CRM114-Status: GOOD (  15.39  )
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

On Wed, Mar 18, 2026 at 08:10:01PM -0700, Nicolin Chen wrote:
> On Thu, Mar 19, 2026 at 02:29:38AM +0000, Tian, Kevin wrote:
> > > > > This series addresses a critical vulnerability and stability issue where an
> > > > > unresponsive PCIe device failing to process ATC (Address Translation
> > > Cache)
> > > > > invalidation requests leads to silent data corruption and continuous
> > > SMMU
> > > > > CMDQ error spam.
> > > > >
> > > >
> > > > None of the patches in this series contains a Fixed tag and cc stable.
> > > 
> > > Hmm, I guess AI overly polished the cover letter so it sounds too
> > > strong?
> > > 
> > > This is essentially a vulnerability (potential memory corruption).
> > > And none of these patches actually fixes any regression. The PATCH
> > > 7 even requires the arm_smmu_invs series which has not been merged
> > > yet :-/
> > > 
> > 
> > Fixes tag and backporting are not just for regression. People certainly
> > want to see reported vulnerabilities fixed in stable kernels...
> 
> Well, maybe I'll just leave additional line telling people that this
> can't be a bug "fix" because it's written on another unmerged series?

I think this is more of a feature (RAS support for SMMUv3) than a
specific fix.

Jason

