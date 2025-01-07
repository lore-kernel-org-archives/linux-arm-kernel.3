Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E82E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 03:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4H9hB2g8rzafAqa/zeAsIl2dT4+WYKiRfFC4nbvu/P4=; b=pi79EB9mUKCwYzye1UGKotCNqe
	a9YLVAIZm9aDZgkcNKU6mKoSIjH1SKVfpgJutOaiPaQ6FjxsQi87RPu5xN85KNeZVmBbZ3ffw3ZTv
	5bQVo431In9BXG6LXQy1+wNURyX1XJGYgHAlzGC7RfA2V75T+Wsl2cHBfxrEPNbJXksX2mPXVLwjf
	+ALSEkNvnhhYIrVLaVwq89rjVayeC3YnvBEUo9pUTWISvMuHGcXWuq34WVDCuoervANWkPJmIvgdM
	VUq/ddrJfAhCBOJD4/KObps/pYRt8P1Mxpj7mZh+cEoxiqDSdLPLCz42hIXtWdumzp+XDeXFwo8PY
	Z+uiNogQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV0fe-00000003Opr-2yQQ;
	Tue, 07 Jan 2025 03:54:22 +0000
Received: from mail-co1nam11on2061a.outbound.protection.outlook.com ([2a01:111:f403:2416::61a] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV0VM-00000003Kcb-23y8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 03:43:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8AxxZypybfHCCUGjDjB8MjMNO9RCnMsZk1JiJXJUgu5lFRmYkPcOTvJ92UWTSkVLh3MQOxevhFA6JL4d+JMQElGrhM0Qy7QV+FOEiLJlMBBno1DWPVnL3WFPaEnK+seF+IluQFJ9IFXBMgWDN55qnFJJM6AUR1N1NFG0Z0z6MIzS6vY75c5lkOcWrguPad1fSsGNzQnkQ4uqLQKw04yHKokI/+KodsxLsiBxxCDgrbt7I9gapABrFGeEv8+8WArC2CwrDEBQ7lFbotp2/AyOxJlaWvWfZw0n/cVjRKZ2m81hjz+rVo971fss+iQlNEIJv2JaJ4ZQDLphH8cUolhRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4H9hB2g8rzafAqa/zeAsIl2dT4+WYKiRfFC4nbvu/P4=;
 b=o+qjNUTJz0KyVxa44HqnDuZqDarLQZGGaITAkc33ykiZCIpSOemKm9MV4zVmHYoX3BH9WduW3//vD8REuQuO+nZBlWmv9ohj1tAys2JHg+4TbSoAbrZKNG3f9KGshEi0dMp2QyH1zpZ40Qbc7AYByaRSVLYs4I69J+1jMbQ3PZorbSSEFVQ8XY4zLY1zBSO7rGyqSy02mD7UpRn3/SGtsqEXEk1ts4rla3ZaN9miWAV/tLk7VfWJHJnlO6utPBymCNq22yUNshlbzQlBwz4hP6AdoEiMUTi/WjimIF6PJ2NqsE3cqM6tdFIfSFKHeXp1z7V7Fu7YR5NdPSXrohPZBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4H9hB2g8rzafAqa/zeAsIl2dT4+WYKiRfFC4nbvu/P4=;
 b=GpQ/dAydlZ7Bsryp7lISom0x7gHkqLcTk46yIgi0oGX7SX73nk4yDFG9/lANrutUR/m2Z5+BeL74lZHKHDs4PEhr8oR35LIgCoh8bmn0y60CKrgB/jntVZqyMAvFLsj39UKLk6pO8wlsBT9qz84Vq6QxuoyB/Khkuc9PfP+tdQ3qbfImG9dOoOsX7+/VlMS7EnTPnIv6bMjzXYVMTb4HcEE5aUXHMGtoAHvR+LMwVKyobCtns8aINFXGfEuLjn9Q3EftyA2EC3J23VsWfo6FUN+bBbvLTLaDlbHgkg1cZ4phJBpCzDZh7pckcwAv2iR4vQqH1SPTyxgtyJSYic2Rjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY5PR12MB6129.namprd12.prod.outlook.com (2603:10b6:930:27::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.15; Tue, 7 Jan 2025 03:43:35 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%6]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 03:43:35 +0000
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
Subject: [PATCH v5 08/25] fs/dax: Remove PAGE_MAPPING_DAX_SHARED mapping flag
Date: Tue,  7 Jan 2025 14:42:24 +1100
Message-ID: <792742e7339dcc088fcbfb0daa9b5ab82534f557.1736221254.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
References: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0095.ausprd01.prod.outlook.com
 (2603:10c6:10:207::20) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY5PR12MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e47718-51f1-4b81-6796-08dd2ecd76b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WKItfRxEt/toDpqO/+Qjjea9ZBFya9zkqOl5TMbY3qKCkALgjV7VlLE35NKU?=
 =?us-ascii?Q?3LOC+I8gwU7XMgFfgwNcAbX44Izk2Iop34gWJc4DKvFO8oRcV6o0gUKcOHvZ?=
 =?us-ascii?Q?FCeoln9X13V3gjytEADL+ntGH2hfEu8elNkQa6D/u9/b62/XZZ7ufoiuOsz6?=
 =?us-ascii?Q?4QIGmNNLqkgMPazMbUYF0rrnKYUROJ+wAKKp6FzAJ6NFgvdpkZaiQHEwv6OO?=
 =?us-ascii?Q?WLpqr+DP5Ppw6S3fZ1rp0W+o7TgkVCwUi8tyq2SkvHKNi2g9u/81m+RQ1zp7?=
 =?us-ascii?Q?Z76PkzR1eDicb6i4nUFSgKiXPKo1XhTxkfYCPL+dDqHPW3lnHzDNGnthHxoR?=
 =?us-ascii?Q?6P6dCpGnfoHIbMzVxA+gviaxrPHP2Kz8mY5UHJgYZSpb7j6mxrCXoJAfYwAc?=
 =?us-ascii?Q?CmnS4/BAdJJemz6H/bkDG8rN6CMOb6Mw6CY4Dp2tJ/9um5X03aBfsTPEmlJj?=
 =?us-ascii?Q?36yzqoKtkzwEj+ywSn+10uGhyAwXzRPqIOKzGFLV215jaUETzIt89u7/lQWp?=
 =?us-ascii?Q?f2SMR64S3bPShBKOkiEc545oUguvd5rkaiyLVZHLmTePBAYsI5tGH75F91i/?=
 =?us-ascii?Q?u+RhvrTgxPKcYiNjBrWjdlc72gLvwJySIdZD3+/n+KKugqPm09Ze0o7duoRZ?=
 =?us-ascii?Q?4waIXbU8XV6tACEW2zTABmFLlWOqsQujCP0ehSVW5VmVD2CFjbMFv40+rpeD?=
 =?us-ascii?Q?uHkCRIUhA0Qp8kRBiyZHxrEJmqkL1/5b5CjOP2IgHOFmhNb621vOWACwwPYK?=
 =?us-ascii?Q?3bQQlKyYxpu+02rGTrkDp9ILkTqfjxxVleSyPxp1VYXHqggHctPptInQx1og?=
 =?us-ascii?Q?Z8KoVfpnkppEZLJYnCC2mMfIIQI+oNVtEeIMbOsJh8am6IYwR5IGgHxvUT5t?=
 =?us-ascii?Q?JwwpVHcGkoeI0eJHgEU+DefWeRTKIjyEKbWkmTsgvigMpFrPH5iE9EPH1ccl?=
 =?us-ascii?Q?ZEArbgTjVHYSzlu0LwFSeSYkjSqmcqPjTLaYyc0XAZ527y29kn+hzUyqg98B?=
 =?us-ascii?Q?OXgs9RaQm0SFA9rDL+QQFuXz5Z17PePGAoDWfvTTPw5kOzMZmYHW5AgkBwax?=
 =?us-ascii?Q?SQBNzexXT05E6LswvInpThlN5SWEj4CmRC8PJML6of761C95KZ7Dz0Rqy2PJ?=
 =?us-ascii?Q?BdqAHkk4vMoFF0TpW00Q3GEZSmuiZBv5FQHMR5olU6qq1E73pxgyrQaPvs0r?=
 =?us-ascii?Q?5ZFmx3hrm2BKP5xmDop/UkX1GlJ0L2taqIPkMwHrIxVyLGxi2droD/Qa7fF4?=
 =?us-ascii?Q?CErDakdPy0WGtgslyogx0ViqBRsZq6zvVnOpX1u00Do8s89vhC6Q6K15XGOI?=
 =?us-ascii?Q?TggRcz4ovubD2Eyi1nWyK8J00t/RYE72O2udPw2z9qUDd415LMfuWllQWqlM?=
 =?us-ascii?Q?wBXdTTx4/kzYCEOKHcSpoNffawhG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wS5eVbgCVOdwzm5acXMaTunX4r9yohCpZIDEg3Gtzo49ZzcAnXv1dCgvXgcv?=
 =?us-ascii?Q?KdvlqcVx7RmhZwsQAd2GIvGi5l2qYKngNqdsu2vve3a7j5eB3qe5LyLwSimk?=
 =?us-ascii?Q?hzUCa0v0fPHm95gfH12G3f9kchV8i0dmmgkCbZwCildDoEecQPAt3TEk2u6v?=
 =?us-ascii?Q?ZkXqO4Ff3FBe63+NTR67oomLf8RldJdnqcPsKT/0TDKtbD9OJ1qpeDLvuive?=
 =?us-ascii?Q?P7cMsniKtBGD5xf6ddZ2nvwWZ5vRYA4c2fn9ONFrMQ/LylzHe+zC3kvmAjG/?=
 =?us-ascii?Q?GlVOhyFr746tCDX2q/hUOoQDp9t5Tk7Hi/MovxCRgsxwnBALqNzAcptVyrIJ?=
 =?us-ascii?Q?SWIRnbYimcM+yN9wyVSl1cuXKx9T1bsude7vqAnDqNMIJlp9k6tFouQN78IQ?=
 =?us-ascii?Q?REXSlY3M2I5qugnlqiGIhNYhq13yJvhSRYL0QOpHSBmUsgUKwHFEMzENFlUH?=
 =?us-ascii?Q?i2O6htgzY+K7l7QEiCYBJbGrIHOLlIDPNEHT3O1xIM3TdRYM1dBr20cgpMpO?=
 =?us-ascii?Q?GMjudRK5X63/7ZOXtvM7fgvJx+GykcPl8E6KqCTTy6lJ02dDnVBGm61XsBeo?=
 =?us-ascii?Q?7yTinb9Vzy0p2NNIZbTzqWqnbvNWX3waSM8dUE9cJNVGC0KKl0w3xMgejM5o?=
 =?us-ascii?Q?sTfX6A1iTfMdODN2ZRJPa/dMy/0XNW/1u+e+wO7OLj1i3RPD+mClkXG1YMZX?=
 =?us-ascii?Q?IbVGN/UJ0oerL/7Cdjgowhz7LEh+NQekLmqmeTHRZevqhAZcKsw7B1ihdA7/?=
 =?us-ascii?Q?yS4XKMguf+3buzJ2nXfUVCsZYUYMt3a/rE3p1AN4JJLdwDqx9363mO9mnHsY?=
 =?us-ascii?Q?cb3qi80aRUwDzndtdRJJnYjB9BPpr+nbP6w0W/dgkuh5uNai9u3+Bxk7U59P?=
 =?us-ascii?Q?9ZSgSeAd5qlXHAQ7lmtY97dTz2WzvUz1W/pYLxo2Qbz6T7iFRuRKEsBPuFZy?=
 =?us-ascii?Q?rPGeAviwVNwp2eqCUWZC+uQbqjZc06VU2jOUVtoo8ftTxcop3NMYGCxOlD2Y?=
 =?us-ascii?Q?GpUVZQdPO1HNtK/xrawqLDqJJq7s8M9hhucigFVWgxMXfYamdS7dHnmaXJ4g?=
 =?us-ascii?Q?yiZG8V6z0mqm9KzTrgHJSctSZbntWom5yDbSYdEpCprypO3bwOWdTNREuvcy?=
 =?us-ascii?Q?k1NgI7AI6BiLJVRoTTH4Z9eO0wGGPoKQ1VekXc6qxdn+U7qQfB3mEcjZb9bC?=
 =?us-ascii?Q?QE9Adv/dr23p79uaVYPVb10P8bUZf187sBZKnWHlXyZO7XcbKVOXtX1yMO19?=
 =?us-ascii?Q?6iSaBVh9tiK6blsuxVgwqdWt+PEgGWN7QGzRSn01vL4ezn6s48PvO757efle?=
 =?us-ascii?Q?2+gAJAoOKTQwh88uAB1d1ArAbml2ogLnPKT42W+NfTyO/riQ4TorfHozRVpw?=
 =?us-ascii?Q?f/KMgLBjrjcLVK+HlL3XVM3CY99ldm1TjFqUzBtlS6VEtevm2koUhNh9VBPv?=
 =?us-ascii?Q?ak6LLiVGZJrROBrMw7fH+kC9qYkPBeDl3FSlMgKO3r8/l6rtzW4TDOqsgjwo?=
 =?us-ascii?Q?EkSMgFRlnnJkWWhdMxBpi+VCgjqhwAapAHSWStC8IniQ2+zd6enHgGRoay6C?=
 =?us-ascii?Q?5zFlHxZ1xHahQX5/CaJ3dLYT6UPhMXPDsNSiSqoI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e47718-51f1-4b81-6796-08dd2ecd76b1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 03:43:35.4322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HumOWgPUHYMO5EKsNxc5uSwrUicz7ObR2t9cST9BtkDd3oT/CIVMzWJKIkkHjRwxxnh4A73HyxdCas/N5SIp/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_194344_550993_237729D5 
X-CRM114-Status: GOOD (  23.33  )
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

PAGE_MAPPING_DAX_SHARED is the same as PAGE_MAPPING_ANON. This isn't
currently a problem because FS DAX pages are treated
specially. However a future change will make FS DAX pages more like
normal pages, so folio_test_anon() must not return true for a FS DAX
page.

We could explicitly test for a FS DAX page in folio_test_anon(),
etc. however the PAGE_MAPPING_DAX_SHARED flag isn't actually
needed. Instead we can use the page->mapping field to implicitly track
the first mapping of a page. If page->mapping is non-NULL it implies
the page is associated with a single mapping at page->index. If the
page is associated with a second mapping clear page->mapping and set
page->share to 1.

This is possible because a shared mapping implies the file-system
implements dax_holder_operations which makes the ->mapping and
->index, which is a union with ->share, unused.

The page is considered shared when page->mapping == NULL and
page->share > 0 or page->mapping != NULL, implying it is present in at
least one address space. This also makes it easier for a future change
to detect when a page is first mapped into an address space which
requires special handling.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 fs/dax.c                   | 45 +++++++++++++++++++++++++--------------
 include/linux/page-flags.h |  6 +-----
 2 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 4e49cc4..3346658 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -351,38 +351,41 @@ static unsigned long dax_end_pfn(void *entry)
 	for (pfn = dax_to_pfn(entry); \
 			pfn < dax_end_pfn(entry); pfn++)
 
+/*
+ * A DAX page is considered shared if it has no mapping set and ->share (which
+ * shares the ->index field) is non-zero. Note this may return false even if the
+ * page if shared between multiple files but has not yet actually been mapped
+ * into multiple address spaces.
+ */
 static inline bool dax_page_is_shared(struct page *page)
 {
-	return page->mapping == PAGE_MAPPING_DAX_SHARED;
+	return !page->mapping && page->share;
 }
 
 /*
- * Set the page->mapping with PAGE_MAPPING_DAX_SHARED flag, increase the
- * refcount.
+ * Increase the page share refcount, warning if the page is not marked as shared.
  */
 static inline void dax_page_share_get(struct page *page)
 {
-	if (page->mapping != PAGE_MAPPING_DAX_SHARED) {
-		/*
-		 * Reset the index if the page was already mapped
-		 * regularly before.
-		 */
-		if (page->mapping)
-			page->share = 1;
-		page->mapping = PAGE_MAPPING_DAX_SHARED;
-	}
+	WARN_ON_ONCE(!page->share);
+	WARN_ON_ONCE(page->mapping);
 	page->share++;
 }
 
 static inline unsigned long dax_page_share_put(struct page *page)
 {
+	WARN_ON_ONCE(!page->share);
 	return --page->share;
 }
 
 /*
- * When it is called in dax_insert_entry(), the shared flag will indicate that
- * whether this entry is shared by multiple files.  If so, set the page->mapping
- * PAGE_MAPPING_DAX_SHARED, and use page->share as refcount.
+ * When it is called in dax_insert_entry(), the shared flag will indicate
+ * whether this entry is shared by multiple files. If the page has not
+ * previously been associated with any mappings the ->mapping and ->index
+ * fields will be set. If it has already been associated with a mapping
+ * the mapping will be cleared and the share count set. It's then up the
+ * file-system to track which mappings contain which pages, ie. by implementing
+ * dax_holder_operations.
  */
 static void dax_associate_entry(void *entry, struct address_space *mapping,
 		struct vm_area_struct *vma, unsigned long address, bool shared)
@@ -397,7 +400,17 @@ static void dax_associate_entry(void *entry, struct address_space *mapping,
 	for_each_mapped_pfn(entry, pfn) {
 		struct page *page = pfn_to_page(pfn);
 
-		if (shared) {
+		if (shared && page->mapping && page->share) {
+			if (page->mapping) {
+				page->mapping = NULL;
+
+				/*
+				 * Page has already been mapped into one address
+				 * space so set the share count.
+				 */
+				page->share = 1;
+			}
+
 			dax_page_share_get(page);
 		} else {
 			WARN_ON_ONCE(page->mapping);
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 691506b..598334e 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -668,12 +668,6 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
 #define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
 #define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
 
-/*
- * Different with flags above, this flag is used only for fsdax mode.  It
- * indicates that this page->mapping is now under reflink case.
- */
-#define PAGE_MAPPING_DAX_SHARED	((void *)0x1)
-
 static __always_inline bool folio_mapping_flags(const struct folio *folio)
 {
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) != 0;
-- 
git-series 0.9.1

