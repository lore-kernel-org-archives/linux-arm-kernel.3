Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B4AE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 05:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTxJojJAl45XFcfTSPH+V2twFdLVZNNNbWJuLt1eZvg=; b=p7RzWsaAHMayBjJrz1nHs75+11
	EKvVH5m6vf/d53TfjdzPi8nA4HzOPBpdlMF1MbJE6A0QZWzLfqISz5/1xNimZY2oMpjr55Fmq8Au8
	SWrrD1CIYA9NvwDm3X84TXhjHdBBHHDYCDjAuN6kPxDTwvq2UjB4Q1RcPvtzv5XUExn6JT7hYzYff
	3Cd6exkO9xugbk/PyhBvE1SCtvdSQTW44KNVlihxTtP5AFOS/oLMFsrcgnoV0jFdcXXrrxvQJHatB
	yeAaiRvFZc4xzR/Mpq9kBECt8dmlO8mA2lDLw8l7II2xGpt859GYhdNGDaREN065wBjiov5DxVGII
	gNFiXkuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNQEx-0000000CJHL-3JoL;
	Tue, 17 Dec 2024 05:35:27 +0000
Received: from mail-bn7nam10on20610.outbound.protection.outlook.com ([2a01:111:f403:2009::610] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNPvV-0000000CDmj-0PYB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 05:15:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPrMavFIfQN8i5I8vcKtybh2R+fAnJxNa0KhCJSmrPCvdrwNmYAWAfwteKtXzUgxePAiCg1xCGiu+gEuQyAfF/9oGNQLQm3m3vAlPu0ucHE32gdXcdSGEPFaMUtKvwx3CpUPCRbAOS8V6CliXFI1N0gI8bUD232t3OfpcS8QrCJhDbO0QpI5iWVnJdnit3jKvNhTTE/ZMUEalTvHfN3o8L5hE0UiO8guUwYsX+0LBSOiw5E1sGAVdyth63XOiXjSMAa9cFJgav0A8c95ll5qN4w49M7hS5BANjOunKOxXiOo+P7ynSYNVdjlKRcul4s/dKY3etbbJPvmFHK6eem0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTxJojJAl45XFcfTSPH+V2twFdLVZNNNbWJuLt1eZvg=;
 b=bHZFY0jIDU9ZdB/eofi0wAXUfecaBpboC0GJEy0MB3kE13J37fdDyupGuJNQPI2I3B0Ec7wSac9qg6xt9ogC9djTfX3pVsKAlMnyEnLji9/wIiaHdqysLl6bdxXXvfnF2EtRHgbgZFQo1IewvLeSgz7rtV92ud4pIdkkCQBt8ws/yn/nvFm3q9Rz/eQU909Ykid/qm4uT6rFL4ol+w2r9keokWXZR5UIgcK8C6b58HVYGDxv2+AiVinK7I41KvoCJZ+5bVLNZf7iJSjpa4kWxTgEC8T8oSSJ0FK+VTLQpfCDLI34BH1Zwb6ff/D//EH+VAufm3QklHd3o4C+rFOkhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTxJojJAl45XFcfTSPH+V2twFdLVZNNNbWJuLt1eZvg=;
 b=s1dA9Za97yk5pxpcwmTvHkQ0e2d0aoCfNSIMis/9sPByRxgv0bKVy+5VBgkYqgbu/4q0eLKkljwYsEzyCRVGFjsnRapm9BiQHtpZGfynokNBFjOfoLw6lTBdezetACM6hqWC+VcVNbFSstPcq4XCG8l0ZdEGVt/J7BRWfDjyQhkx6GUcbqAvTnAoY/xJtL3yyfMaz8VAObD9AxG2CRzc/D2y0U8Sz3fod171V2jbq9Z14chIzSjG85FAL6qGx/hANlzTxudLd1drjCWjNWO6o/JyrA9wGgggXwrsLprdB3kPeq0aQFU5UqtoxJFYmkJnO0ACnXhXQB2WiJnYqOUi7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.22; Tue, 17 Dec 2024 05:15:15 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 05:15:15 +0000
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
Subject: [PATCH v4 19/25] proc/task_mmu: Ignore ZONE_DEVICE pages
Date: Tue, 17 Dec 2024 16:13:02 +1100
Message-ID: <f3ebda542373feb70ed3e5d83b276a2e8347609f.1734407924.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
References: <cover.18cbcff3638c6aacc051c44533ebc6c002bf2bd9.1734407924.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0142.ausprd01.prod.outlook.com
 (2603:10c6:10:1b9::18) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DM6PR12MB4388:EE_
X-MS-Office365-Filtering-Correlation-Id: 12fdd233-f6c7-4f38-20bb-08dd1e59ca52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OqV9kVxMvhq9lCGH1RtueYlDFFQByJlhJhvY73LYNtbuqh5seQqpBKAQ2x4A?=
 =?us-ascii?Q?PCdayDZDv8cI0YJJO5Yle2wWceRZxllBfBXgpVR55YlHR12ljEY1fhII6Fqu?=
 =?us-ascii?Q?V7Z03OLDxzlCayTNney5q/wohz66Mk5qZPf8BcmhlTnJLhK/h0moIa8blNfe?=
 =?us-ascii?Q?OVM6akug/539r2OCQHQECo73FZoeMymqHpeA/glfldCb4ZIODmZLFy41/ZB5?=
 =?us-ascii?Q?pnX+U9Ny0NFVrAGl06vG4z8+i2gVBq7EztGpPkNNQtwfNTRr+9S+w6gz6kVL?=
 =?us-ascii?Q?2j9uehGuVNWcHDTQMyy2w5hDotpEvPla6p23CWyJi7gBQF8I2Z/Mmzy50tCb?=
 =?us-ascii?Q?eRU9DjXo/pfc6rqxn2UK6t5DfwBX+nr5K6/e9aY8poxpgUJIGPH2ygUuh+VB?=
 =?us-ascii?Q?Kc6FZmFpkjuClEPpo+L0zuOidWakYAlCmfVltxCtQOtz9SSOv2vLvY85jEFf?=
 =?us-ascii?Q?z+mNvl3njmYA2anOiIC7wgbTrMrt5CWqoyn7Uhtk4to2fHkn8xe5hKbC4ihf?=
 =?us-ascii?Q?GPjkFydTklR/SUhkvCvXajNCV3JDV/2q+YEHNDbG6TE1/gvQAvdWOE+bQ2y9?=
 =?us-ascii?Q?kBiH7lobvJbkrVKfi4A6glBKNp9t0fPZWA7GDnOE0qBLU4ccjCGyq8VdVH+d?=
 =?us-ascii?Q?vDczIIgqv4K4iuz+m2mRTcgx059q1TJey6Xvr0Qk12BFgpY7Kpiwh1rujJrL?=
 =?us-ascii?Q?hb6cTFqClrRN+8qaEWqCG+87jXaLkdC4oIAKXedF7PPSwKPj6UDR0q8ovohv?=
 =?us-ascii?Q?AlAHaAzapz1Y1lh4ICcYwbvm0M2a4s7IYNiHOJQm/+q7He3aFx/gQqhKTrhY?=
 =?us-ascii?Q?I1b/kxSA/mmcAjjLJCFF5v8rJtXJrJb0d8vn/XeVAHgpiqGSX7JA9EYaiHww?=
 =?us-ascii?Q?StIH+ZOJItJ6ybtO11lFlnJtBNpa/UzWvVXt8Lf7H2h1brtxudTwaL8VHbcF?=
 =?us-ascii?Q?2Zxc9RuHtYalTTKzej6PShSDjzjcDfLCu8mUs2vUCKho8E4cx4QDIBpVM4Pc?=
 =?us-ascii?Q?mtq4CRs/YjEnLCcJoPwRhIytN/UU4O+tNqaE4he89YXfiUUQzCzYd78fHvct?=
 =?us-ascii?Q?aqB1ItVlF31YW1WonX+4GxxizPlQ2LR+TpmiO6OuAvSaEqj05WZiepljfdrN?=
 =?us-ascii?Q?x4DcRfleB4yKMFqMcXxD6Hz4Gg7mINqBf2XGC25axE0NZzaXJmkCsrR635b5?=
 =?us-ascii?Q?LbpqEu7MBlvENbYq2FdwJuqy7GNtCscEvVBkGqQujZwDWkwRJa+T8rZTeqxx?=
 =?us-ascii?Q?WtS1gPQxm3YqZwrlQi/fb6ZSnzYWQOQU0jC3UOQD/g9QbHLgBBSkzEHflu2/?=
 =?us-ascii?Q?cEpwaQGPeOMRz11LXN0rMlGdtlhwXTixdPeyXtXnpHicUuKqaAspzo6Qgmmp?=
 =?us-ascii?Q?PODdmKahSwYi+kTWZvHcdIxUiSC0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h/xBq7B+MynEmKAw6bq21jZivBdax6qs+PwMUfm0erlKqSCOUVStKH7Wbr0a?=
 =?us-ascii?Q?7tEN4oOO9/UvYDHpy+6zwZu0I4DlT4e73kLEvu+XBx+rHBMKy5EHW5GHPu3a?=
 =?us-ascii?Q?R0WavdbjurTxcO1fXKV/LIbEqEqQP/6ktyLL8Eo4J+pOMVSYn4ycVjRhUdOV?=
 =?us-ascii?Q?wzdH3F14sdVjFxJLpNZAYEHZNMU3mwxX5BKyildeLPEwYCqbafik96/K3WGE?=
 =?us-ascii?Q?dZJs9dlfSn/O55CBSdsSswvOWoGLVhYrAcUY7GFQdk+mPQnZBHKCwOdjjqPR?=
 =?us-ascii?Q?BBNSB9aCBVjLpaHMWMeUmsBJzjw+7W8VhQOY1IyVopVrwt1vr+lC28PrUPip?=
 =?us-ascii?Q?8kGYhvcZ3OQ632vcVQch6DQYJZOu8cwM+dHzKzjdWYUhyRJmWPO4sGiXBEU0?=
 =?us-ascii?Q?w5V3GbsMzm5kbxlF9Y1Y1hHmXYPHBUKJsn0qHCHZPf8E7a1elRzVRFFkraoQ?=
 =?us-ascii?Q?WgT787R6GQ3B1QKNDpoZ8jpgKjtQsmPDHEtVW0QkhSBSt1xDWH/0ozwW51ha?=
 =?us-ascii?Q?ktK/AnnzNZHWSz/ot2KzeqWcs6qzeze/J1mtwrTZtdZf5btIHsbK4iTl0n0l?=
 =?us-ascii?Q?W9JO5EG2Zs7d7EWSvXfUPtzqPMDZKtC411akrASHWZV569KRW/+MTOC3XqMx?=
 =?us-ascii?Q?Z32lexJT43b443KWOD53l8isgYJ0sboEKLhw4RaHHkTAtvpYpTDa1kFdm4TA?=
 =?us-ascii?Q?C+Gr7tvY0lnkRSwIEIcy3uuToODgblYZpTcZ/BPDcIiqBYQQ43S8XmGVO+Qh?=
 =?us-ascii?Q?zTXt2d5psqdTX5PnVW0+cQsyDIDf/NN+iNDyGKs3RBsD5XzLxF/oGxuAab+r?=
 =?us-ascii?Q?hiYItftXuQm6nWstPHUTtzM9ObGyFbC7REjSpibZ5hT6UaaqH5Q0VdwOVn6Z?=
 =?us-ascii?Q?wWv3S2IeVrK6tMGriadvzQryCb6OGHZ8nRe3+ki3+vKOC+qyEE0iW1C1/FaB?=
 =?us-ascii?Q?4G8/Vi6K41RZ78q4xF+ZX77QlZt8f8uVzqb8wiR9YLtm5Ahob4YKhTqV9G3O?=
 =?us-ascii?Q?BGgoFOIyDWeln35GKQ67OcGTiHQ8CyQOsrjIacmg3D3fosaho0dUw5H0ZS6B?=
 =?us-ascii?Q?NE9n0aEaR1A/jBz+l+S3KeYRxBRERqlJbddoLhKgi1af5fvJpzFLX2noVC3s?=
 =?us-ascii?Q?5a8izAoViq8WgaewNrslvZnfz0UFGQQkUzDptncFBPtP2XkzzHkgg4QI+Q/n?=
 =?us-ascii?Q?S20zhdIpq1xP7ndKWinlSEW+rB/GXtMKDNwnEcjLdelM8AYYtgHC5dr3aPYt?=
 =?us-ascii?Q?c6H2VWmcvfMwRsKYY0U9rwlZFEi25XW1LLP3vKbedK7byUeZEuRdTbE+gH3C?=
 =?us-ascii?Q?XOAU5aP+uAuGy1vPxJKUbE0HNy5xD4TEQ7SLkZM2tPQ26GI78RsHWe31fDcy?=
 =?us-ascii?Q?YiiX7+RsL2cDeiT7iIuF5rIOBR4i1OiuTKG+CqThe+c0j0lNOO81CB3eXClt?=
 =?us-ascii?Q?EfyOmYsOJeDJjynBK8FXyNHmE4KoWzIW0RYpSWAyNM8ObDBwODLWv2XJZHaU?=
 =?us-ascii?Q?fIe6bRmo6qUqXSRSc2Y23Tl5Ig9DGBZZxsAokY3acW7LYDJTSFHbQcASSnUL?=
 =?us-ascii?Q?f2QhEdoNCKM6XSUXr+okl0f6Fsu5KVSDDFAwtkAi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12fdd233-f6c7-4f38-20bb-08dd1e59ca52
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 05:15:15.4512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QasNTGvgK8+/JTDoHj5QlSysVJ7DcfjVqJNoGbupQ8gT5CTdQL0uDOQY3AoDujY971O/h9czBOOoqNpEzIkVhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4388
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_211521_129883_474AFBE1 
X-CRM114-Status: GOOD (  10.68  )
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

The procfs mmu files such as smaps currently ignore device dax and fs
dax pages because these pages are considered special. To maintain
existing behaviour once these pages are treated as normal pages and
returned from vm_normal_page() add tests to explicitly skip them.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 fs/proc/task_mmu.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 38a5a3e..c9b227a 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -801,6 +801,8 @@ static void smaps_pte_entry(pte_t *pte, unsigned long addr,
 
 	if (pte_present(ptent)) {
 		page = vm_normal_page(vma, addr, ptent);
+		if (page && (is_device_dax_page(page) || is_fsdax_page(page)))
+			page = NULL;
 		young = pte_young(ptent);
 		dirty = pte_dirty(ptent);
 		present = true;
@@ -849,6 +851,8 @@ static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
 
 	if (pmd_present(*pmd)) {
 		page = vm_normal_page_pmd(vma, addr, *pmd);
+		if (page && (is_device_dax_page(page) || is_fsdax_page(page)))
+			page = NULL;
 		present = true;
 	} else if (unlikely(thp_migration_supported() && is_swap_pmd(*pmd))) {
 		swp_entry_t entry = pmd_to_swp_entry(*pmd);
@@ -1378,7 +1382,7 @@ static inline bool pte_is_pinned(struct vm_area_struct *vma, unsigned long addr,
 	if (likely(!test_bit(MMF_HAS_PINNED, &vma->vm_mm->flags)))
 		return false;
 	folio = vm_normal_folio(vma, addr, pte);
-	if (!folio)
+	if (!folio || folio_is_device_dax(folio) || folio_is_fsdax(folio))
 		return false;
 	return folio_maybe_dma_pinned(folio);
 }
@@ -1703,6 +1707,8 @@ static pagemap_entry_t pte_to_pagemap_entry(struct pagemapread *pm,
 			frame = pte_pfn(pte);
 		flags |= PM_PRESENT;
 		page = vm_normal_page(vma, addr, pte);
+		if (page && (is_device_dax_page(page) || is_fsdax_page(page)))
+			page = NULL;
 		if (pte_soft_dirty(pte))
 			flags |= PM_SOFT_DIRTY;
 		if (pte_uffd_wp(pte))
@@ -2089,7 +2095,9 @@ static unsigned long pagemap_page_category(struct pagemap_scan_private *p,
 
 		if (p->masks_of_interest & PAGE_IS_FILE) {
 			page = vm_normal_page(vma, addr, pte);
-			if (page && !PageAnon(page))
+			if (page && !PageAnon(page) &&
+			    !is_device_dax_page(page) &&
+			    !is_fsdax_page(page))
 				categories |= PAGE_IS_FILE;
 		}
 
@@ -2151,7 +2159,9 @@ static unsigned long pagemap_thp_category(struct pagemap_scan_private *p,
 
 		if (p->masks_of_interest & PAGE_IS_FILE) {
 			page = vm_normal_page_pmd(vma, addr, pmd);
-			if (page && !PageAnon(page))
+			if (page && !PageAnon(page) &&
+			    !is_device_dax_page(page) &&
+			    !is_fsdax_page(page))
 				categories |= PAGE_IS_FILE;
 		}
 
@@ -2914,7 +2924,7 @@ static struct page *can_gather_numa_stats_pmd(pmd_t pmd,
 		return NULL;
 
 	page = vm_normal_page_pmd(vma, addr, pmd);
-	if (!page)
+	if (!page || is_device_dax_page(page) || is_fsdax_page(page))
 		return NULL;
 
 	if (PageReserved(page))
-- 
git-series 0.9.1

