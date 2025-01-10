Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A47EE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 06:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHF9yIYFSBkDrWWm5Q2w+o+FZwVZ6F3GbxhCIiJOiz4=; b=foIYpJND8rlCBuQ3SsxSbjkq19
	LHTbTcHz5VH26Vlb1pve4hYkSjve52Q/8qFs/r8zFXQhdfCgeFO3YVWlq37sbbttWPrA8rqS3FcLC
	owy7oUPDVVPob2k4UYQhRafVb76ukswdvIupNWFCsKj2EwaavKmDIC087vlKAYTCrd/M+f8sdV8VT
	toOxBuHl4+Hl5XUxowfn/F4KIPFLj2UovjmXgODYh5Lp3Lr2CiEcNsM3mlyyc8hIcf++8mk4AooQF
	TCNGb22vKBI3iC4+7uV5QvyHnPYwZqa9k/qin0v3qqsg8CvKYwXlfeHLeGV5o2/IQDbSevAaP+vf1
	t7YsciGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW8PZ-0000000EEsg-2sUa;
	Fri, 10 Jan 2025 06:22:25 +0000
Received: from mail-dm6nam11on2061f.outbound.protection.outlook.com ([2a01:111:f403:2415::61f] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW86G-0000000E8xX-3bGc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 06:02:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PgTiNY4A4r8/QYaaTU537MTOz61mXhVza+OZzKGaBwmz2KzYQiOwLhdfgaYyYeLSTVSSRWX/JNcpmCD00+oM+Azkecp5UXJ8VQoCHNT6dZuXmpr+718v76JdACukmflLCoRWfQcqY+SPvO/sE3VdhgH/ypxkDS8ocmSjeQR2YqtsUaojohrjFGWd0ujP7Spb/JUwgmv7BeK+mnsqmJck23fDaiU9VzniVMrv6cuJ9Q+En9yGH5q+42Y0xGg9wo8d47TJFaFU+gl9D3sPzUYi74WNZwlIP1gKCBXcJgmimY2VDMXat411AffrcsA6TTnqYg6kz7Zy/0GNWyx6FYy4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHF9yIYFSBkDrWWm5Q2w+o+FZwVZ6F3GbxhCIiJOiz4=;
 b=EEBO+7eJ7IfYr5/NReg1i8fv6fN1JxDvcZkU3jQsGYXC859I8VtcC0CoGX+otmOjx0uzZ6AVI1e9s9Mg5lUxyrKt1D+igzIUm0s4BCvGMOxM7RcCOBmTao1vg22ziEdo4+FEVp9cnp61vTI8iEfJugDa0iFjepu5mPKN5BlfYcHsoEkLNYwI6KlDsCNu/y2wp7VlCEpdiukOLe4qX2rGlVhOqOJydTscdZJG0skvlDSHcYgLXlfMIBt+utOg6LKGbXvfZ+DH6t8vBij2SI17HtPsr8Np11CFejSl8OyxHN5dcObqo9KZJYkrKVhwiSRcuO9xjia5weG4j6S7kGUYOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHF9yIYFSBkDrWWm5Q2w+o+FZwVZ6F3GbxhCIiJOiz4=;
 b=e2BPexFfr2jHS751+WiMeuPHWRSUso2/Bre8nXGv1uTBnstnBGk3sUDeK1d9oWM34mhUEeKS10AEBMX5LA5bK4k0b82cAthWRriWM02SsiNDuzOjwk3sP+z094a06OBUcYlyulDVe+38TGxgcoThiIcl6z5W5oQrvZCKhwt3JWqxog6zHXtW9aambqGOlPqa2NAeqCHPdYNG0Ch4gr9/Kbc7YwNZKZDhe3oVQSZv0vulnERyc1TeMGW7PGtmYXLCtAynU50DRwkM1hlL/BxqbayFXqLSsJGf+Sej0UhmoPLQ3ZOc4cVsKTzjfq5I9AAMaZAktm6YuEZYSWVP6jo9dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BY5PR12MB4132.namprd12.prod.outlook.com (2603:10b6:a03:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 06:02:25 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:02:25 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: alison.schofield@intel.com,
	Alistair Popple <apopple@nvidia.com>,
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
	david@fromorbit.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev
Subject: [PATCH v6 13/26] mm/memory: Add vmf_insert_page_mkwrite()
Date: Fri, 10 Jan 2025 17:00:41 +1100
Message-ID: <e75232267bb9b5411b67df267e16aa27597eba33.1736488799.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0021.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:202::7) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BY5PR12MB4132:EE_
X-MS-Office365-Filtering-Correlation-Id: ac49c2d0-d595-420d-7e8c-08dd313c5b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0te9+hLgdyBwA6pTyT2iowxccsDjHTVRSkxEopDiv0PtqRAMkSMmvdX0iIji?=
 =?us-ascii?Q?yg8I0wAHmp6igTwErACFA5JmS7UqfZfX+0UqsOTqmRcOWDIvAEc5nmKIAeUs?=
 =?us-ascii?Q?ofzC/akWR+yb2BncQTxwqQ6SIZai7dsikxWv7VHYAQDX9cNwRC4G2wmfII0S?=
 =?us-ascii?Q?CZPEiNoxuGoSGzv4MCHTZQND+xQQSQ6wyHMewhUDevSiEjisjNuBwazSEpB+?=
 =?us-ascii?Q?UzvZG5ULZZtv0D+P3M2TuFWNuIzgJNaE9mHLDeGz1Bf98WuTQ8So/R0yJMvV?=
 =?us-ascii?Q?GDfdNBuIfNo8GK6orYz7miLyM/3HpfJf2b+EUDQMRinfldATO7VlUtexkPiF?=
 =?us-ascii?Q?Wnw0guQGRq96yJA/VCCk/D6YGGmsXAnJNciqnZLIQVjeOcSz4Fm39UxJ16V/?=
 =?us-ascii?Q?ENKVrUFlHuHPpO1afmKXiJ3MuxEQTl/ZS7PDaXoofc3ETBEvwG+DD7yd2kXg?=
 =?us-ascii?Q?WnTF4ko7bOwzFd2e1toOJ75p5mAxOs2Eq/t0vQ8JwXzMfaTAY22u1fZUze6L?=
 =?us-ascii?Q?n0pgz9UGz1byCZM/BingFhn3lPNkyuk/az5qPN2beTF+vvWO5s1/o8yHouW2?=
 =?us-ascii?Q?FgXbg+tTSTGjx52rM5r+n41Bv1CZfUzbttbx77M6pYz6pCxIR5AM/V5lNybq?=
 =?us-ascii?Q?OoQ5T9+VLG25tPRgp/y6zOuDDQ2JxsFgQEOS/TkUynhheinveHD9rw6c+Riu?=
 =?us-ascii?Q?mQY0IzIxJKUt2itGLvSF1gviEsFGAumqx+d2/QJNiYp/Re0kymZBDZGOtYkt?=
 =?us-ascii?Q?xu8yWFJJPeXI2BFYxRJggIkEEozDEDyl31r5QR8NFhDznohcCP2W/ZiV7K31?=
 =?us-ascii?Q?7c9gA0VhEXYm3hrmitwVQijYuRFisCQHJrMCV2JfsPA5gGFRAe1LHEg6FfdF?=
 =?us-ascii?Q?Z2cPXI8/P8nS2p9RmuOh9EoRjk1//wWIKpQJsypJkZe+xh3j8zHxDFYQ+ymr?=
 =?us-ascii?Q?TXtK35z/PqmP7RQ5OgUkhvxlt5hhpA6vhNe1/+u3Axu98oYWkTICY0hWKiRW?=
 =?us-ascii?Q?l/eBBdi94kD9x+sKeoYWvQ6i+MdfqLxf5FYyqFc+dczrJGf8D6xTCswysijW?=
 =?us-ascii?Q?HyI6Arfcu7Agdf1FmlJcEQZppZ71ix/Wib3fRzvOTtsdE2UoJZXEDe9Pnje8?=
 =?us-ascii?Q?qRql5NW/1xkXFnWMb0Z/h7mGD5oD3w4pCK9PltkwjGgAMAqGjKsn+fgT9siz?=
 =?us-ascii?Q?cmq8N/8MSJrEmI0yAnT2edVsvRKruXJfsniXnipPo9Rd5C071MSHy6kdknSm?=
 =?us-ascii?Q?rN8fbhxZHQWJI9Mh4XbCdZBA1CpfBZcpRiZI1oPZ9J0xlGkM0VSIIvhYl9Ru?=
 =?us-ascii?Q?RxItcQbHNpwFHhBp077TU9Lkc6ziEPyhQbO3t2e7975USjU2ND2GaUKvKIlV?=
 =?us-ascii?Q?qUR04P/6MRW6eU8ELDZdWQ8vmeUt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QMfm7iNyFYvsOZWsAror1s1O6Rg8RuYIxLl89R79xEIRvn5VgAEPWaD3bgCp?=
 =?us-ascii?Q?Wo+TqCuacZ9IRkMuqatnFrMI7ZYa3RCofofyE+kyqi4STsrKQmJvtF6hdULQ?=
 =?us-ascii?Q?/+5ds4E8K8xRKfKBKdXEtwBXcLhLGjgzIiFs5yMcuiH0lg9l2jI3TIRWWHhP?=
 =?us-ascii?Q?o6KEIyTysFQmuU2s4GszM77CEbTNZiK5jjeE+pBGraZf42o0sk4nC80RGO5L?=
 =?us-ascii?Q?6HheLgcMJ9s+xLCa5P70Noq4eAfNCyJqy2cWFx+zkdMUxd18itt5vNG1Z3rX?=
 =?us-ascii?Q?ffa/m6j2TRFyjeLj3KPtcXjQZK673dFwCt3NJrjYuz1UNVfY5qPytiiXJJpz?=
 =?us-ascii?Q?SP57i16ybTR5yjNAvPfsI6zCEANRMB2OWUe/AUxRDs/Yb2NlwrvOtLfYRXWi?=
 =?us-ascii?Q?HWbJPK1FaqtweuYAxHBknrLR9RbVnbO2VVkfucv890CX0Pq8OWwlnLYwhPz0?=
 =?us-ascii?Q?Y9j6BeVosITGTyz8wPI7kL8T7YWTMOMNFB8bC7Ra0iMEtTRAv8ar8s5FwyJp?=
 =?us-ascii?Q?FRW5OzwMRArK8uI/V0Uqs3meh0B5Qj/RPDwV8hG8ATEEbIgBQS+oxh0ZShgh?=
 =?us-ascii?Q?jZwNl9BacZurWIjis0OpFuJe5XPLvrW/yXfszOYNJNd9uzuSGV/SFlmRhUnf?=
 =?us-ascii?Q?T/3oAPHeBe5pkmI79FzcpBMYBYfQnmfryWCjOraBphFpUTpLx4b52ZRJTtef?=
 =?us-ascii?Q?34WtmtbKTQ+G3Fzi+snKjLbPxjZtS6IuIPgmDFoIiX3/geaJDjzwFVSBmuly?=
 =?us-ascii?Q?xNfw9o8fRID/wQFcAHBtewLz5AxUmcXjNGt6Zh3VVmP/Zmo1tj7n9spOIN9W?=
 =?us-ascii?Q?GY+5fbndhEdx9eZP0BCDWRxHmxjhC4poYKuylrW+ePoydoKNIg5SKIXuxPb4?=
 =?us-ascii?Q?kbb06caTIHVSEJH75TWVinJ/0FTg2IVWgy/p4XeMyQr4lZzLofBTwqCwfjdZ?=
 =?us-ascii?Q?X/vymfF91XxxDb2CQuaTGG2KzbgeKvrCDYOHZtso5P9RdfqVexjAdOEeDsmK?=
 =?us-ascii?Q?ADQo8rWqZYZm4EteJJYBYjzLdkLy5QIsCrgVrT11Uil094qucEOC6WcQEO+H?=
 =?us-ascii?Q?jhyVUURDTcHLfktKZeCbv1qhYpDVgXQI/bpct+q9DLXca5+cAYYHiTzdzm6y?=
 =?us-ascii?Q?qhQPaILNJsibXdcL+2xc1ojPfwubRkRWROo39giw1dmpmQ2RbEIEHq4ufAks?=
 =?us-ascii?Q?Zwlg5Q+isrrQKLcvQau9DmovkqpG2DvIdOWCRnrXQE0wvxYiCRcyXQUhxFML?=
 =?us-ascii?Q?Df+miwdA8+waDYWTh6JiUJpl/TWU54Kl2hq06VWBBpj+brl9spf20FPY7YhT?=
 =?us-ascii?Q?wvCNsjELaaAk0Cmm9NKn6DcPqYP4TWrRerWqgosUFoUFx9wKmJkjRAw+EZw/?=
 =?us-ascii?Q?+Dc/r80nQwThom4TbiaDXPNzvUacFbSfh81WQcAg0aEFsPobvzr+upF6qcbP?=
 =?us-ascii?Q?9gF+yznxaA2VKP0JQ0lNXgsf3QYyTJ1yRILh7LYNc3wo5QtofWZVPJNwhP+w?=
 =?us-ascii?Q?kFRJ/gipbk13mnDcrjemgOMWyjfzujfX7RDjSNAjZXMBCir63leH4ym1n0Hi?=
 =?us-ascii?Q?y1WwIHl2fmzhMhufCBXyMGEGykwg2caGhS2B9Nw4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac49c2d0-d595-420d-7e8c-08dd313c5b0a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:02:25.4570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3uQKPEKD+WyHnU5uJGaPFxPIRsJG3rEya2gJhqV7ZCn+My3OT42JAyceFujF8LmlIffUZgIOyXFHN95etSgBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_220228_892216_739F8F11 
X-CRM114-Status: GOOD (  14.81  )
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

Currently to map a DAX page the DAX driver calls vmf_insert_pfn. This
creates a special devmap PTE entry for the pfn but does not take a
reference on the underlying struct page for the mapping. This is
because DAX page refcounts are treated specially, as indicated by the
presence of a devmap entry.

To allow DAX page refcounts to be managed the same as normal page
refcounts introduce vmf_insert_page_mkwrite(). This will take a
reference on the underlying page much the same as vmf_insert_page,
except it also permits upgrading an existing mapping to be writable if
requested/possible.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Updates from v2:

 - Rename function to make not DAX specific

 - Split the insert_page_into_pte_locked() change into a separate
   patch.

Updates from v1:

 - Re-arrange code in insert_page_into_pte_locked() based on comments
   from Jan Kara.

 - Call mkdrity/mkyoung for the mkwrite case, also suggested by Jan.
---
 include/linux/mm.h |  2 ++
 mm/memory.c        | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index e790298..f267b06 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3620,6 +3620,8 @@ int vm_map_pages(struct vm_area_struct *vma, struct page **pages,
 				unsigned long num);
 int vm_map_pages_zero(struct vm_area_struct *vma, struct page **pages,
 				unsigned long num);
+vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
+			bool write);
 vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
 			unsigned long pfn);
 vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
diff --git a/mm/memory.c b/mm/memory.c
index 8531acb..c60b819 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2624,6 +2624,42 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
 	return VM_FAULT_NOPAGE;
 }
 
+vm_fault_t vmf_insert_page_mkwrite(struct vm_fault *vmf, struct page *page,
+			bool write)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	pgprot_t pgprot = vma->vm_page_prot;
+	unsigned long pfn = page_to_pfn(page);
+	unsigned long addr = vmf->address;
+	int err;
+
+	if (addr < vma->vm_start || addr >= vma->vm_end)
+		return VM_FAULT_SIGBUS;
+
+	track_pfn_insert(vma, &pgprot, pfn_to_pfn_t(pfn));
+
+	if (!pfn_modify_allowed(pfn, pgprot))
+		return VM_FAULT_SIGBUS;
+
+	/*
+	 * We refcount the page normally so make sure pfn_valid is true.
+	 */
+	if (!pfn_valid(pfn))
+		return VM_FAULT_SIGBUS;
+
+	if (WARN_ON(is_zero_pfn(pfn) && write))
+		return VM_FAULT_SIGBUS;
+
+	err = insert_page(vma, addr, page, pgprot, write);
+	if (err == -ENOMEM)
+		return VM_FAULT_OOM;
+	if (err < 0 && err != -EBUSY)
+		return VM_FAULT_SIGBUS;
+
+	return VM_FAULT_NOPAGE;
+}
+EXPORT_SYMBOL_GPL(vmf_insert_page_mkwrite);
+
 vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
 		pfn_t pfn)
 {
-- 
git-series 0.9.1

