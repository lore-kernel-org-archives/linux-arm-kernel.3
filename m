Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561DFE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 05:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fr+IvtDG4tlBRjnd4t0ov6kscjwRm8udTIzF1grJaok=; b=cCUiarSlgz8KRcEomq5cDF1V/d
	8blBcqbwkRe3RJwdBMowMmib750PwlwdtTql4ti7BlM299c/xw7/NwhLfLQrnuRF1D6NNqkOF+GeI
	lJ/Rn8Q8Tbl3S3xeCviOoNzvatXOS+HRO1tSjBbI1ZARrkRj0+JqENpr7q+sC0rTNO0zEfqKNvjrf
	XxJA+RnfIAiK9l6znxptT8308iI2RhgRW6q4QNB4c0xrR09ntGjIwtDNLx4PIzADx5ZEfKlCUNVO3
	+Vbn1nYqTgvY7LCeUx7iGUUenc6/YuJspUkrihsyxEMJu4Ik35bDGLRqYfFpk7/eq12kl9ZctSsxk
	dIoAoyyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNPz7-0000000CFAD-0x1S;
	Tue, 17 Dec 2024 05:19:05 +0000
Received: from mail-dm6nam11on20626.outbound.protection.outlook.com ([2a01:111:f403:2415::626] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNPu4-0000000CD4H-10Qk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 05:13:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQEc8LQ5pP3TFj8N1k6l4+qBmM1QDPwhz7S+GP0vHhMSJ8TLX/3ftRu2NLrMWci7jiMbT0dNYrnAG+F9Y+CRsv2ubzH/f51ZsH+59/XxjGtxslXohMfm2cTt7GN0u6GalxOmV8if/i6yec0yr4mMWEg1kh2ERlP7rMJmY0UBkLrglc7tA5fnwSPauf4zH83Q0q2/5Hoj/2C/zeqlEECVAF5ujRJhe19HdAgPJzFHvlIuIB9KEPKmfT+IOw8VCLWejhS30OKPVq7DdCsW+YGAAJ1mqHryj8mrIUZx3uQjxUwYUXvXXXpcQ7lpe7rma6ZXpJAqq1aQMo2oV2kjNvqq8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fr+IvtDG4tlBRjnd4t0ov6kscjwRm8udTIzF1grJaok=;
 b=HQD5Xcq5M6ArMKL+Np+Sdj/SjEYjdsOJHWKsGmLm9VIZfhNDRs3X6OQqKugVv18qPR2sNpQGIeGhGs2B445YRl9KcDnPGDLI84sCPA994Si/kt5BjbKfOmdVVIr3NTY1iyCkZprd7beyjxfM1KwTjg3BwYmT1wctGNPUsyEcaesLb3pAVycjZMkFZCMc6tshhNizEZd2N+LPZLjfsnO0a3kkm66+J8AjQYhwP3ftesFtVGbWuzfCA41fSQ8P9lrJkrEyqPCtY/kLmolfOUYJNbX3GMiLhbxEpzaOSQGS6hz0NxQPQkIoOPXlQ7waFvaUIi6jDAcRyqCjbTLicIewPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr+IvtDG4tlBRjnd4t0ov6kscjwRm8udTIzF1grJaok=;
 b=Uzwh4mY1bQJRKpWPpF8fusvvpTHIF9SZd+H+Iwz+UvZj5s5BYGG286Ov98Odu5nAr2MqlftgNAVdZcFu1GaFBeoLe/nd/dMwMQcIByQygPYKLNNvxHMx4BID/TOxlnG53RXVX6meXkhe3v9Brz2N91XLXPKQd4QTFf5ehxG5BRR8megyw3Myx44MXZf+Mhzd08197bCDOT/w2FP0ucmm8+FH7kxQ8jbpFhU5PmukZrxPN5MGGHJAE9erF7xC0doNs3PCQ8uRO77b4IDcY0HzNMTAMmz63BZjQp5ugbUEs1Cc7INmttao/ina7eR7twzOaJEBAIjAvOeAvnaqRc4glg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH3PR12MB8936.namprd12.prod.outlook.com (2603:10b6:610:179::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 05:13:48 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 05:13:48 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
	lina@asahilina.net,
	zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	logang@deltatee.com,
	bhelgaas@google.com,
	jack@suse.cz,
	jgg@ziepe.ca,
	catalin.marinas@arm.com,
	will@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	ira.weiny@intel.com,
	willy@infradead.org,
	djwong@kernel.org,
	tytso@mit.edu,
	linmiaohe@huawei.com,
	david@redhat.com,
	peterx@redhat.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com,
	hch@lst.de,
	david@fromorbit.com
Subject: [PATCH v4 04/25] fs/dax: Refactor wait for dax idle page
Date: Tue, 17 Dec 2024 16:12:47 +1100
Message-ID: <62a85767a21fb76b548801a002a85c7831e8e25c.1734407924.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0047.ausprd01.prod.outlook.com
 (2603:10c6:10:1fc::9) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH3PR12MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: 08b0dd21-bf0a-4f3e-d3de-08dd1e59966f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xRHfboL8jp9t8g+DH5rgij/57/HpF2BjN4AJccRpudabCufimCQebEoCwhu8?=
 =?us-ascii?Q?azTjcY2OafxWzFXde5aKDFF5sVDWIYqtm1Yr3No3Vhc8C9zQtBb0ZsIr8oLx?=
 =?us-ascii?Q?FkZHfNGz2f7dIxHZu+rclyf65mdtWejGR0Wvckr753fIiPWmx6RxA4QbP8qA?=
 =?us-ascii?Q?ebVIGSB+RG2It7gsNR9Ik69l4oNkkgX+uDGk2zLFnAyTKKGrZKc5GhY5l/CV?=
 =?us-ascii?Q?FrW6jmQsLEI8bXoIOFnSrCbFZyy0+W+Tm4EYu7LOGcAPw64nRkuPfAWxzjcI?=
 =?us-ascii?Q?15GaiLvE331dZFqKRESe/b9jAT24jvRoLHinsSSKQGLKq2AWLbYGzFNgbnHN?=
 =?us-ascii?Q?xCrYTovUj7vNSebAMFX+k9//sh6ivh66w6Z2OElp3YkbfxUfzcpAdRq03zLi?=
 =?us-ascii?Q?PdvMi2UqsCEVZbFCFxxdRVWLNjQizxLiQiVFJF4V7StjBj+TBtyzI/zhKFiJ?=
 =?us-ascii?Q?rApqJGb5upPfhw/DDJFmir//8Hit5H+T1ChVPmbUaWYYsf3CUtRoXAUT/uuJ?=
 =?us-ascii?Q?yndP1/xK9OYTLMYgUuvwuKEEhJzst/+8QE/101jtmNUm7fIJcsWOkH1cOo+y?=
 =?us-ascii?Q?He4EwDc9MiYxumcyNjDbLSx0A8zXTU4wypy++Rua1af7zxuZTgCJG+6zqWQn?=
 =?us-ascii?Q?zYRp15bJxPYqQrKeb8Y22oyREgXBcPi49+BTnvcQmkSEh5mLsSXIN15DFEwb?=
 =?us-ascii?Q?i1AxUE+2udSTreDHoyIyQdIwib2GSYyWX/Nc/TUYCADOftqErhR3QogHOgZf?=
 =?us-ascii?Q?gwx+zRp/QMRnHk/KApY6XzZ20nNpyh+hs6hATXuztQ6AwCy938D2DY/fkgYj?=
 =?us-ascii?Q?fGnQUlf1ebrFpuLeXelFK3ZqJ0Mz60hWNbEoYa31fsD5EfOQ950FY2TMXrh0?=
 =?us-ascii?Q?Wz8XIR05wWTIynR7HsoK6D4kE75Xu7BRq/eUYy8Qz3zYEXsYLKV+7D79aPe4?=
 =?us-ascii?Q?CALIYfludDkMp7RJX5TnOzCaNNDr0+YE769xI2Toyg/rcO+BKMJ9MG1cdewz?=
 =?us-ascii?Q?oxjPKkHGbBI4ZbguQx59w669/I5/7zQB38oxWWdHAak/FHpYJJfrGRELz7vR?=
 =?us-ascii?Q?E65Io/Of2FKNDS/CM0YDNs7qLFuuqtQ/2s5un9FHNEDu8Gx0tGxmXgTtoS6E?=
 =?us-ascii?Q?XT6TbRSZffvCf4mlcqVRekuy0/IZnEqmrRTqrXkFwM73JrORPBcKZFcE3uZO?=
 =?us-ascii?Q?evLYYNmaDyRzed1unrxXnkhWzJpbfEX/GL0LQ9sPJhzbvJQwsguouiKM9yOB?=
 =?us-ascii?Q?e0T0DtnxmyqbXt3aOBr3a7AJzIfZbRlTKsCZDuMZfLavz8EQ6LOXQhdGyxiU?=
 =?us-ascii?Q?ZLqd2py2A7V4ucF58AfvIPlQGU/g0qPIXvJnGYTGzByJu2klFjhX371l0DvT?=
 =?us-ascii?Q?UcLR5DfaXSXqp5U0qEXJu+V2ruyG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QLiRVcc470yxys26mmzm3/aAnIYti6nktJ0FJ9tQqr1iRyBdo7tLXn5wSH8z?=
 =?us-ascii?Q?dSfHhWhidjL1zSvm4TrH4w3qXKLjnM+qNNN3xd6mLJyQsgAh66PAMJKCLSzC?=
 =?us-ascii?Q?JtDo1CmvCUbmYeEKCnMSMfQrH0Ara0OLqODEErRVTACy0EGbdBWYJR8Ey9cV?=
 =?us-ascii?Q?CcvGoyqmvqcUBIzk+xYfg+RAONoXUW74TmlLJqYf+yM2QSB3m3DGJIgDAXaJ?=
 =?us-ascii?Q?UuNluIEptU+5ZmcHxWqQ3jZhA067laUyElEuCxnSQHW+0CBPgh9JLuDfjPqj?=
 =?us-ascii?Q?1EcGlUwpA/QsvFmrG+d958AKO5smMaEtXn6S9/0wd/5M/wEivE56aVfdMoGN?=
 =?us-ascii?Q?EsnNZFp4B059a2QmYQXxCHmY3qjvZloeqN2F8S0f6z1SZaC70C2BAENSYOqI?=
 =?us-ascii?Q?1dUGQdsbCKhhBPK4TI4+MWGzFjyxw4jPTQ0+3aRBsalN8pHLxOKFgdkI9TeO?=
 =?us-ascii?Q?JUIi1Eb2Y6ac/1SoEwR25+AKFhsoZiiQIuAAO53wdz2jocLDXQAnDYDavNIG?=
 =?us-ascii?Q?oURWu/a9UOfFiDnQ3xVAXN5Sr8zj6aR2Kj8wevkyuMpIik8czrFYUXg1g0NT?=
 =?us-ascii?Q?GAXZRnw9+NkWyKc1sqL0+5R8Lg19PF2Qfje/dIjERjmuyz5/ti3Ry55cbsXo?=
 =?us-ascii?Q?t1dfOnZ2Sp0EzchS04stFk8Ws0cCRdUpwCO1y5OiHOgzCVR+eWm606jJnCxo?=
 =?us-ascii?Q?jOYbHpWq6tJB0S9rwtlTHMir4Ef0LBRF6r5QpYXwU5wUkOI1JXSTcX6EZfv7?=
 =?us-ascii?Q?degeI7knSQEtME61wTT8TLnlSKSPcXCgw4NWwgrJIg3uOGvNTuwzThE7blTQ?=
 =?us-ascii?Q?CyzhhptzYvJjzc8xc1NmuP+62NZTKLSIv4QJLFLAGFwjkMMq87dGShGQWhGm?=
 =?us-ascii?Q?DSz3p84VirCu+PnXyJp6ZpTMcAMkDntw/ss6xsIUB2rxgGbzYPaiAMeBr3FU?=
 =?us-ascii?Q?HaqsDltffAiZ8NuVy+aNGrw8raKLUOvLfqSengGExNwlMl8uYmgUVyKBpkUg?=
 =?us-ascii?Q?GGsXLxzs9PzfIVhhpnU/ZkBbTWit1UO48Pz8Nyu6OyRnH9x9OskqMS/OE34P?=
 =?us-ascii?Q?EGXD831b1srq6/LYqLybUBpK8HsQ7v1U3ed55qzFfNx0DVWWc7gJ2A0nqBKg?=
 =?us-ascii?Q?WfBxDtyfjcw4lNWoY36FAWIgcGJidzANMQFNqihsgb4EG7vRjj61YhObZS/+?=
 =?us-ascii?Q?ujQW5LaGapA/weTv+V/fbHWtDXbkm8MfAGc/gHyAwO867pxZ4/cuXNInoWhU?=
 =?us-ascii?Q?ZWckno61ogjnN/xUV3x3/HglUGbSJJoD8VoCChBheG3179ROaBeXrvSa5vZw?=
 =?us-ascii?Q?VMFwkn1lk4AqHq8zI6RjMRI+PfAAe+zDaMeX8Hmz2EI2MaC6xd/iX657i3CD?=
 =?us-ascii?Q?Uxyts3eFReFOaYirCWngkDqNbDQV1u5EFb0+Zagodhp1rlCoyTVDpftsjN2X?=
 =?us-ascii?Q?plh49utDuHNc0icO1AbkHH4HKQIl42q7jtrCVw5QsBpRVfvXxDbe8ntotA//?=
 =?us-ascii?Q?LT0rzqKWfkDzWf0OOCn3MK8uifexxLztri2o0RscbSkrW+RAt9UHhqoXWprD?=
 =?us-ascii?Q?5vd/Cv7IitcQCQ5dG2fRn87eSz0XIFhcjZ/WUM2C?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b0dd21-bf0a-4f3e-d3de-08dd1e59966f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 05:13:48.4210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Vmb+tfF020UXtxVXbesMdKgZjh8JDjKLYoEDW/WanNGhyMPy2SjZXrNglWqLNOjHYRzZQvq/9AFsTGnFFSaaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8936
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_211352_271356_2903FDEC 
X-CRM114-Status: GOOD (  11.80  )
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

A FS DAX page is considered idle when its refcount drops to one. This
is currently open-coded in all file systems supporting FS DAX. Move
the idle detection to a common function to make future changes easier.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: Theodore Ts'o <tytso@mit.edu>
---
 fs/ext4/inode.c     | 5 +----
 fs/fuse/dax.c       | 4 +---
 fs/xfs/xfs_inode.c  | 4 +---
 include/linux/dax.h | 8 ++++++++
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 7c54ae5..cc1acb1 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3922,10 +3922,7 @@ int ext4_break_layouts(struct inode *inode)
 		if (!page)
 			return 0;
 
-		error = ___wait_var_event(&page->_refcount,
-				atomic_read(&page->_refcount) == 1,
-				TASK_INTERRUPTIBLE, 0, 0,
-				ext4_wait_dax_page(inode));
+		error = dax_wait_page_idle(page, ext4_wait_dax_page, inode);
 	} while (error == 0);
 
 	return error;
diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index c5d1fea..d156c55 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -676,9 +676,7 @@ static int __fuse_dax_break_layouts(struct inode *inode, bool *retry,
 		return 0;
 
 	*retry = true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
-			0, 0, fuse_wait_dax_page(inode));
+	return dax_wait_page_idle(page, fuse_wait_dax_page, inode);
 }
 
 /* dmap_end == 0 leads to unmapping of whole file */
diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
index c8ad260..42ea203 100644
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@ -3000,9 +3000,7 @@ xfs_break_dax_layouts(
 		return 0;
 
 	*retry = true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
-			0, 0, xfs_wait_dax_page(inode));
+	return dax_wait_page_idle(page, xfs_wait_dax_page, inode);
 }
 
 int
diff --git a/include/linux/dax.h b/include/linux/dax.h
index df41a00..9b1ce98 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -207,6 +207,14 @@ int dax_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
 int dax_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
 		const struct iomap_ops *ops);
 
+static inline int dax_wait_page_idle(struct page *page,
+				void (cb)(struct inode *),
+				struct inode *inode)
+{
+	return ___wait_var_event(page, page_ref_count(page) == 1,
+				TASK_INTERRUPTIBLE, 0, 0, cb(inode));
+}
+
 #if IS_ENABLED(CONFIG_DAX)
 int dax_read_lock(void);
 void dax_read_unlock(int id);
-- 
git-series 0.9.1

