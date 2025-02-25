Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881E7C18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crLoqiiF/9UUXAPwMK3+epJ8tOtusmUpUxeQoMMsbz0=; b=BoTxZ1bClz4pQBpwD8Q2O4DlPL
	rldhSZj/2ayoYwdT7pJh8d/I7p9WGqddcxEl9y5KrSd1j+mDYB3JaeFWI5SdkZX7yDNtjey7A3B44
	gcqLdp+wjwS5zludqj4oZIr9RcSASghm9OhdIhJ4+GW6imrRh48pjEBq1lkTB1VIv8CaCdJdeGcMu
	xtepy9IFVXOo0cwI9mPJ6W8ul8FQgHKrNmbU4nGCCv6mtAx156AKfBzRPDB/D+ZjS0OQW3TU8+nra
	2jP2e0inOp+En0v9gBe3WB31osAL05M7iTqYTBAQix1tEQ/h7JWU5+2Crp51XO0NywtmiuBbg1mqP
	L0rAuI4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2OJ-00000001Wiy-1nAZ;
	Tue, 25 Feb 2025 21:22:59 +0000
Received: from mail-bn8nam11on20610.outbound.protection.outlook.com ([2a01:111:f403:2414::610] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0ml-00000001C5l-0lfO;
	Tue, 25 Feb 2025 19:40:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmlKqywb9sldxul0++LKWRZi/va2fGrdacXrlQ73MBxASeo/caR9f235RyQY48IZdUOqpC462mSUk5wfVRbvAL+9gk8cD7VfozPD9aXW89HkIdZ0UlvUF8YgJz4No2Eu+jf+yromPFazXQVCB0ehvUaeKCqYVg3IHXegb7pXI6eR6VFpxxnRm4nhskyof7O4dF8lWFttAFEaHn17nv2Jt4ii0W+YQbsj3PjOmwd5DZ7niQXkF7ymc9FfCaNofwovLPFtqjXe5NrK/kbW1lAMIBmbzd45tzPWNMTjS8HIlzAs/T97syCNuOu1S7FhwBs7diw0mZw54y6lXoZ7ALrCfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crLoqiiF/9UUXAPwMK3+epJ8tOtusmUpUxeQoMMsbz0=;
 b=V0TikMwP+BS86ONYjmCJ0BQNKHQiPCelApqdAVvthgKiBEcg0rqbYPS3AIojIeYaMCeU7Fwgw52r1vyWgG0uZoSIWHrMzi3hdFnmKDxUZqkc5E/Pz59VoHUXFHDjPpxS9ip5Q7Hyn2HzDmHEAx3fZ6nrqjj/7sJclPNfzUHb5u90xhCRGCZeHH3BoLUOocLsfjfEAF3Y6E7EdNDMnnX2THVSn0qbdoj+xTmJ8aZ7DACxDZjQQbMA0dUtIxlACMRdDR7E7zNCKdp9riMXavFN7aII1acEH8Fnd/rz6jvQDfAiN5+8vknnw5RXgPNNxazIeZVOH1zka9JNXxmc16dUPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crLoqiiF/9UUXAPwMK3+epJ8tOtusmUpUxeQoMMsbz0=;
 b=IwcfaDABKeLOtCz0jmiFlt80CU5mqIvWcQB5ZwOzMt++u4kEV+EHOO9cRUQM4JAH+NITtbj5VPhYBEUtoV9LvnHTTYSzHN2hhYwuvcnD8KD5s6PJv2xEu5Vn4yQJulaLceVvDSR50D44FIOwOW6MAwTA7LIMiWbmt822LnBXVr1SVHY77P4GjsbV6ScPfdXr3rrYJg36dDU6/RTMBMTtgqZe0CAJqyMFDjXIerxzqdQWgDW/6GoNGYjxnj9pFilRknRdjQx7XanU00sLvZcvUOYG6PhdROIsFQJxRu1mhg/cUDMcPRsyOyGT4K6zOeoyldvpyeSVfI3oinNJWm7a4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by BL3PR12MB6617.namprd12.prod.outlook.com (2603:10b6:208:38c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 19:39:54 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 19:39:54 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>,
	asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 03/23] iommu/pages: Remove __iommu_alloc_pages()/__iommu_free_pages()
Date: Tue, 25 Feb 2025 15:39:20 -0400
Message-ID: <3-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
In-Reply-To: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQZPR01CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::18) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|BL3PR12MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: a970993e-74c5-4a03-b113-08dd55d42926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xKJ/JjWQSpsq1YYyc++tJTBEN+S6pqUFGrGRjkAVG0k65G1D+gDvXybYfu89?=
 =?us-ascii?Q?3+YNqdkOnrHql8pmKrN9vcb4q7tHCx96ex1Ye0qETPs0xUKbg0Ixdy5sszBE?=
 =?us-ascii?Q?EPX4EFSco6sJTK3Xde8NdSBGUnAnFnn0NY2rXvlKsw7SuM3rgTXS0RhFn5Uj?=
 =?us-ascii?Q?b4Xe77lARnQCCicNW0MAwKzH28RaeOKxhQS3CmFHDADid1X8eSF99XvU/0Mx?=
 =?us-ascii?Q?BzOR7TBJAgcT+TTTjdPL6ZfcWTZ1JGo+ju35zj+2pdkLBKITgufonjVAeLbh?=
 =?us-ascii?Q?mx28g3v1tHsPRtEAhwHmFcXgitelIQ/+9LuAeu3m9jeG5Q8fcrT4MQxFNGs2?=
 =?us-ascii?Q?ZWKx+rFG8Yb/HMDbdcCczvKcqXQpTJ3hM3IvPYdIWYUzT50Ex91RnUz6vZoX?=
 =?us-ascii?Q?FmQQ1gUq4GzldBSJ9H06wwASeCNmEJts7bzbQAucxyVZBXKYv3LPs7QPi8nc?=
 =?us-ascii?Q?nDZ6BC+CiVzp6XtuofGoKyFbJXIRLOMjbmje09m1uUfnH99IL/7EkKV/EYLO?=
 =?us-ascii?Q?p37uSrHDq6+IT2VHJQyybqNBp3pSJd8HTI6Ck3Qgg/Y15gs1VVJ6O0SuoRtA?=
 =?us-ascii?Q?5y61ENUKEZ2HHv8jJ2mYY5psjbsTaTBqIo/A+O4XzsBDH6fPO0RUTE5kUBPo?=
 =?us-ascii?Q?PbjvjhTyTvlp4NIfoGdHYc663tCTXR0OPUEV+07nIgNTOu7z4W7CzhFzhAtm?=
 =?us-ascii?Q?+5vbhfK+yXU+5+JPJGp7kFXJjClV0oJ/ysFcwLUq+Mc6G6+ekYX/upACXffT?=
 =?us-ascii?Q?UwXnCqjp6QBtVxsxlQ5eZfNcBYxfXehKHR60pAX9hdrmXw6fIpfQRkbjg2Yl?=
 =?us-ascii?Q?2yh4aGGEda/p92+H9OWaBfV/Fr6YnAM/2W2Hoe3RrFfeLtf3YqyuUNQhdrvV?=
 =?us-ascii?Q?hxkXa7RgJaWBrOnYvK/rnzZNuLB/1jYeLDLrsWkWZYsP/z6pvEWv7SoBPGtx?=
 =?us-ascii?Q?YwjGUt0TgI/PJHORfhtF36FN0/aWAZzXtlYk4zQaRi2VoOug09zZfyAZv5tm?=
 =?us-ascii?Q?dVLLxF/IDaLeQiDRA+gdL1W2h4opWtMx0eAqIuN05poamrc3htOv5Q/n9sDH?=
 =?us-ascii?Q?JIv/BV/kGDyeUWkXI93Qs/ae1nB+k0SV/1/tgwcEWCLw/q9ktjgzHGESnpe3?=
 =?us-ascii?Q?LYRi/akG5Z/CftAKpczZoP1Xko+YkwZRx3E5ySGoR5QVSmlCDzLo8D63NzCH?=
 =?us-ascii?Q?p60XCaONCxohlZ/0Vk7EVvEOXPbaVS3Cx3Zmi7hvnMjayZ1Y4JPED/mz6nZ0?=
 =?us-ascii?Q?eyMrKPedFDptI26GhgXCOqM9zWWuWLgQNBbVpssJKCQaMry5TtOqeeGFkcl/?=
 =?us-ascii?Q?PycueLyyVY0Xn4bzogfvyrDHZrplTbSMVxo8OL7VSrM6Ik5PElTXCw57ZLpP?=
 =?us-ascii?Q?33Cjop/CbNv/eRYA1TLYerCDMokWGfC6qXnBix9RaiQCU88V4/vXyWoDKShl?=
 =?us-ascii?Q?MazKrtTFWCM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s03MJwErbbUntYqSHqHLluc4GcBdiTAPxEV5VWqlCLPKU2bgy3du+5sSBwco?=
 =?us-ascii?Q?NesHbx/zPZSqaVLPOXURmcEc0+mZxubsOyjqxRRSoQDylhWsVi+xCP2ubqs7?=
 =?us-ascii?Q?Fkrd9ZEkwAnT7WCQE3l97OZvmHNN0f5lje0PHsAJ2fjjY/qcFWj3iZEgA1Uv?=
 =?us-ascii?Q?YCyDNrMejGi1TeWg9R8AxnDHPiDCV+iHIWQbRuWrnMsUN2LRqIOcx3FetsJf?=
 =?us-ascii?Q?0td1n1gSfDmaar/75w4AM+sA9Q9VPXgOzQ5pMt9duQDsJceQ+D8QrJ69gDvc?=
 =?us-ascii?Q?kqXj2jVdwNZUZRzOCTs3Z1gRGvGdGioUGMnKOFzXAQ/TrX1JSjyeXOl9yI2w?=
 =?us-ascii?Q?Sx/Q0MGgOhvJOcuVxF9BbvEbZurnAo0yShAtB+yrJYK9QzXK3v2fRu0mavOR?=
 =?us-ascii?Q?KHA39sDJnQGB8NqhTRL+odnk7T7qOPGUk3P95F4c+mhUPWvqkkplOoA5dXig?=
 =?us-ascii?Q?cQ6UUp2Yj2brV1jmlSCfvXrg4DU6l7CLE+dq3QlKt9xj+7kfdYA0+Qx4Vp4J?=
 =?us-ascii?Q?HKEj4qg2gjJ+S5b/Twn8m+96NTuoYwTMSiRpvlrPH4u4wqOCyrxxjYFs+b+E?=
 =?us-ascii?Q?TCjvdlUeiv96PNa4UKIMMarmxKSuUwFwXtR65OWGrmR+dPGl4IIdEeJYsI8s?=
 =?us-ascii?Q?HNPqesXgw4wekAHzCpwj7brXkdHh//Dm6LZCaEknk5Lc+Dclm1syWXR52WGP?=
 =?us-ascii?Q?M1iDxu6IpnOEF4bRt6htuPwP40QhLvUlv4xufBV1JDG0dzo2NChh1xfOiWzI?=
 =?us-ascii?Q?+Pq+HBIW18v3O65oB5rI2bfkchGWwnQ1MvSmyBfhBiFC6x3GWnzfN3op1KJ2?=
 =?us-ascii?Q?6HcSnzEfSKU51o6N3EPtItTq1/e7p7jcyYYRNOT0D6zwyPANv0NjTJHXXm1f?=
 =?us-ascii?Q?TKd4ntJi305HzEt6jNHLqpxkUHgCQFxZLHpRtofa058qAHBMbiK6lWxKu0E3?=
 =?us-ascii?Q?V//N2+g6hh35gVv6WGcHlxAqYE4b2+qlUn1/Px/bwdctATbU9B/c4TtaNGap?=
 =?us-ascii?Q?Sc01wEBEzStnYn6HvWN0Dq9lNu0ZYU8aqD6iPjh0yEl9zffjC4TsvHjn0v5k?=
 =?us-ascii?Q?MyN/Y1Lx7pzfVIyyDksExX+qBF9EBb+TehX4maAsa51l+wjsV+TWSbt/RokM?=
 =?us-ascii?Q?7N7G3XegJcIVyLds751Qrs2H6OV8NqoWydUFyljsfy7Gbpm/m6K9MpqIJ+va?=
 =?us-ascii?Q?U63EGUA0OO8l58N7qQbFkqIYGd7bn6jQmBR98sNObtPdMX2M2O2kABTtfwfL?=
 =?us-ascii?Q?bHnc6MJl+i9BvLIk+WpFYqAqSAhiMiIVJyMaZcGKD0YEd2gJyK/zwwiFYFQB?=
 =?us-ascii?Q?WNi5czNhdADjpxClZuBYWDOY5aUeolgzc5aBHadHk6lmhOtI6kNdCpxwAqgY?=
 =?us-ascii?Q?I3IhBp8DBWmXNPn4PghXTNVj7CbzhmtXrt/P7nmAb7PqMDe0h725nOHuSK8T?=
 =?us-ascii?Q?/PFYIBFQVwsURa0q99HAjNa7hDMpd8vwDQMZ/Wcizur83WYhLYtDK1OO688d?=
 =?us-ascii?Q?PKEVgnK7oG5awZhU3mhdSuhRZzFxpHyfZkMJMUv25I8MlgjkzefBiknmO8G2?=
 =?us-ascii?Q?YJLpEoaXVdcP5vzO1MvirNSp1p8h/aQdH4gmS74k?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a970993e-74c5-4a03-b113-08dd55d42926
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 19:39:47.0308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bfcjriwc13xlbJVjbBTNBqjL1JCgxVtCyuBNHjhQurHgMygBA6Xo8DcyFkNGmSvQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6617
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_114007_248039_EFBAD19A 
X-CRM114-Status: GOOD (  13.04  )
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

These were only used by tegra-smmu and leaked the struct page out of the
API. Delete them since tega-smmu has been converted to the other APIs.

In the process flatten the call tree so we have fewer one line functions
calling other one line functions.. iommu_alloc_pages_node() is the real
allocator and everything else can just call it directly.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu-pages.h | 49 ++++++-------------------------------
 1 file changed, 7 insertions(+), 42 deletions(-)

diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
index 82ebf00330811c..0ca2437989a0e1 100644
--- a/drivers/iommu/iommu-pages.h
+++ b/drivers/iommu/iommu-pages.h
@@ -46,40 +46,6 @@ static inline void __iommu_free_account(struct page *page, int order)
 	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, -pgcnt);
 }
 
-/**
- * __iommu_alloc_pages - allocate a zeroed page of a given order.
- * @gfp: buddy allocator flags
- * @order: page order
- *
- * returns the head struct page of the allocated page.
- */
-static inline struct page *__iommu_alloc_pages(gfp_t gfp, int order)
-{
-	struct page *page;
-
-	page = alloc_pages(gfp | __GFP_ZERO, order);
-	if (unlikely(!page))
-		return NULL;
-
-	__iommu_alloc_account(page, order);
-
-	return page;
-}
-
-/**
- * __iommu_free_pages - free page of a given order
- * @page: head struct page of the page
- * @order: page order
- */
-static inline void __iommu_free_pages(struct page *page, int order)
-{
-	if (!page)
-		return;
-
-	__iommu_free_account(page, order);
-	__free_pages(page, order);
-}
-
 /**
  * iommu_alloc_pages_node - allocate a zeroed page of a given order from
  * specific NUMA node.
@@ -110,12 +76,7 @@ static inline void *iommu_alloc_pages_node(int nid, gfp_t gfp, int order)
  */
 static inline void *iommu_alloc_pages(gfp_t gfp, int order)
 {
-	struct page *page = __iommu_alloc_pages(gfp, order);
-
-	if (unlikely(!page))
-		return NULL;
-
-	return page_address(page);
+	return iommu_alloc_pages_node(numa_node_id(), gfp, order);
 }
 
 /**
@@ -138,7 +99,7 @@ static inline void *iommu_alloc_page_node(int nid, gfp_t gfp)
  */
 static inline void *iommu_alloc_page(gfp_t gfp)
 {
-	return iommu_alloc_pages(gfp, 0);
+	return iommu_alloc_pages_node(numa_node_id(), gfp, 0);
 }
 
 /**
@@ -148,10 +109,14 @@ static inline void *iommu_alloc_page(gfp_t gfp)
  */
 static inline void iommu_free_pages(void *virt, int order)
 {
+	struct page *page;
+
 	if (!virt)
 		return;
 
-	__iommu_free_pages(virt_to_page(virt), order);
+	page = virt_to_page(virt);
+	__iommu_free_account(page, order);
+	__free_pages(page, order);
 }
 
 /**
-- 
2.43.0


