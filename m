Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C27DC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 18:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdVIX0zuzidY9H1vrjKNGGYWY28UrL6UlVO2ZMDVqQQ=; b=wbwgT3yEOCCnw+HCHyiDU9A6UW
	Of9LlZsm+8gowHe/lPi3FqBLghwzzH8S3idvfgZEGZfzzTwN2W2Seh+ZtDPT6W79GTaBkZu3C2/qF
	s4MVDKlc1XqVzwbV3OMC4zh4K/KisRt9Tv+DE8Q5LQNCVOA/Y5MQtCfy3xVbNnBVM9fMsmF7MqLEy
	pjS2DT4jwLffbowZE2u7wpZzxFh95bl5JqKfNUVLm+sbEw+49v5SUe9s7IejY/cJfA1hBLDuh7VQf
	ArqWlYIYDJF899nBDGWSW9krFbSXHyRQ+xkW6B+3N5EohxMLCJi23xGtJKbQ3xBy75PTFJReufrhh
	eUYvfBSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYV4B-0000000FpjQ-35L0;
	Thu, 16 Jan 2025 18:58:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYV2w-0000000Fpdx-0ZQt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 18:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737053808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sdVIX0zuzidY9H1vrjKNGGYWY28UrL6UlVO2ZMDVqQQ=;
	b=Yzh+EKSAfkvt0P9XxusaLfArsxEhSLTmOsSTEEFtdMz0qM/VYX/KpPjVjkwHwf2OY/Y19e
	i/Q2O/piawh0I6l1bdSSPUKvI5l1bAlPvjOhUkusx6Qe4pHsaCa35fJxjJUtXdAt1picdB
	DJfFdoYTYb2Q+rxuPlZx7CisMHZKKlM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614-vX-eF7RRPEG27HNJHsWxcA-1; Thu,
 16 Jan 2025 13:55:24 -0500
X-MC-Unique: vX-eF7RRPEG27HNJHsWxcA-1
X-Mimecast-MFC-AGG-ID: vX-eF7RRPEG27HNJHsWxcA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A03281955D4F;
	Thu, 16 Jan 2025 18:55:22 +0000 (UTC)
Received: from thinkpad-p1.localdomain.com (unknown [10.22.64.94])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7A22C1955F1B;
	Thu, 16 Jan 2025 18:55:20 +0000 (UTC)
From: Radu Rendec <rrendec@redhat.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Borislav Petkov <bp@alien8.de>
Subject: [RFC PATCH 1/1] arm64: cacheinfo: Avoid out-of-bounds write when DT info is incorrect
Date: Thu, 16 Jan 2025 13:54:58 -0500
Message-ID: <20250116185458.3272683-2-rrendec@redhat.com>
In-Reply-To: <20250116185458.3272683-1-rrendec@redhat.com>
References: <20250116185458.3272683-1-rrendec@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pCB78IUU45eMTu7Y7-93sMYFSKLLFyx0Owx2Et1zoCg_1737053723
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_105650_248969_2ABFED98 
X-CRM114-Status: GOOD (  19.99  )
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

The (percpu) cacheinfo array is allocated based on the number of cache
leaves that is determined by fetch_cache_info(). For arm64 systems and
when the device tree provides cache information, the number of cache
levels/leaves comes from the device tree but then the cacheinfo data
structures are populated by analyzing the relevant CPU registers. If
the information in the device tree is incorrect and provides a smaller
number of leaves than the actual one, populate_cache_leaves() happily
writes past the allocated struct cacheinfo array.

An example is the Renesas R-Car S4 Spider board, where the cache
information is described in arch/arm64/boot/dts/renesas/r8a779f0.dtsi.
The CPU nodes contain no explicit info (other than `next-level-cache`),
so of_count_cache_leaves() defaults to 2. The next cache level has an
explicit `cache-level` property equal to 3 and `cache-unified`, so at
the first iteration in init_of_cache_level(), the level is bumped to 3
(from 1) and the leaves count is incremented to 3. So, it ends up with
a total of 3 levels and 3 leaves. However, in reality there are 4 leaves
because L2 does exist even if it's not described in the device tree. So,
the code in populate_cache_leaves() attempts to populate the info for
all 4 leaves and writes past the struct cacheinfo array.

This is easily observed on boot if KASAN is enabled:
8<----------------------------------------------------------------------
BUG: KASAN: slab-out-of-bounds in populate_cache_leaves+0x314/0x388
Write of size 4 at addr ffff0004402e16c4 by task swapper/0/1

CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc6+ #14
Hardware name: Renesas Spider CPU and Breakout boards based on r8a779f0 (DT)
Call trace:
 show_stack+0x34/0x98 (C)
 dump_stack_lvl+0x7c/0xa0
 print_address_description.constprop.0+0x90/0x320
 print_report+0x108/0x1f0
 kasan_report+0xb4/0x100
 __asan_report_store4_noabort+0x20/0x30
 populate_cache_leaves+0x314/0x388
 detect_cache_attributes+0x2f0/0x440
 update_siblings_masks+0x30/0x5b0
 store_cpu_topology+0x154/0x1d8
 smp_prepare_cpus+0x34/0x180
 kernel_init_freeable+0x338/0x480
 kernel_init+0x28/0x170
 ret_from_fork+0x10/0x20

Allocated by task 1:
 kasan_save_stack+0x2c/0x58
 kasan_save_track+0x20/0x40
 kasan_save_alloc_info+0x40/0x60
 __kasan_kmalloc+0xd4/0xd8
 __kmalloc_noprof+0x190/0x4b0
 allocate_cache_info+0x90/0x188
 fetch_cache_info+0x320/0x408
 init_cpu_topology+0x318/0x398
 smp_prepare_cpus+0x28/0x180
 kernel_init_freeable+0x338/0x480
 kernel_init+0x28/0x170
 ret_from_fork+0x10/0x20
8<----------------------------------------------------------------------

The loop that detects/populates cache information already has a bounds
check on the array size but does not account for cache levels with
separate data/instructions cache. Fix this by incrementing the index
for any populated leaf (instead of any populated level).

Fixes: 5d425c186537 ("arm64: kernel: add support for cpu cache information")

Signed-off-by: Radu Rendec <rrendec@redhat.com>
---
 arch/arm64/kernel/cacheinfo.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/cacheinfo.c b/arch/arm64/kernel/cacheinfo.c
index d9c9218fa1fdd..c9a75b13972f7 100644
--- a/arch/arm64/kernel/cacheinfo.c
+++ b/arch/arm64/kernel/cacheinfo.c
@@ -101,16 +101,16 @@ int populate_cache_leaves(unsigned int cpu)
 	unsigned int level, idx;
 	enum cache_type type;
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
-	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
+	struct cacheinfo *infos = this_cpu_ci->info_list;
 
 	for (idx = 0, level = 1; level <= this_cpu_ci->num_levels &&
-	     idx < this_cpu_ci->num_leaves; idx++, level++) {
+	     idx < this_cpu_ci->num_leaves; level++) {
 		type = get_cache_type(level);
 		if (type == CACHE_TYPE_SEPARATE) {
-			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
-			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
+			ci_leaf_init(&infos[idx++], CACHE_TYPE_DATA, level);
+			ci_leaf_init(&infos[idx++], CACHE_TYPE_INST, level);
 		} else {
-			ci_leaf_init(this_leaf++, type, level);
+			ci_leaf_init(&infos[idx++], type, level);
 		}
 	}
 	return 0;
-- 
2.47.1


