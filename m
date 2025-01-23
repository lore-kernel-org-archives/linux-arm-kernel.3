Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B669C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 18:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PVyuLEE3dAAoVcq+yTIoaeUsgJELIviXx5aQ5heZ0CU=; b=SgEGQP1QGxr+8JY2s7tatx72PH
	Iy0REPj35rALBj9YVyI2WFzrn3/W8JG8Xxi9zNJ35q6v2speoltqLfMTutwMzUtBWULSvoWtBpX23
	oNckLWxFEzTLKuNQS9bMmYFCUTsgDo3gW61M9sh3HyYm9Wwjn8BLPlcyKMwBjLsq1HYDQlf34WUJ8
	T8f6iGKJ77T1Is8muPJjGMw20QInv+lDt4t+y7zOREdEIYLywEcnB5u22Dzm3ELnuPMitEaeU6+V3
	5m9IR+0SC/YuMqGARqBzJnNlTh9RfH9Iq0cyEBQcZ9zyV+P3lqDeIdAu6oW7H2qG28sCg0ayTRXZd
	GTdXt0Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb1iU-0000000D0ri-1zL0;
	Thu, 23 Jan 2025 18:14:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb1h0-0000000D0md-05IB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 18:12:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737655955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PVyuLEE3dAAoVcq+yTIoaeUsgJELIviXx5aQ5heZ0CU=;
	b=Q0ClfGCEvkDgVkaXccad7oF2uRAvIpt2stkqQ5G8softAYJUmdlnUIaGkZlyeeJvu/s3nR
	24ysLSFUSLSpaD++Bcl5Txj/ZMO5VHaUD/Jb/mbtcb3HLrw7316QAPLKuN2UFvMODY9M/b
	zor7iHIinBDSLyagHOhQ0AAiE/1ckQ4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-90-PklM3NXRNFmEc7eVHGFc4A-1; Thu,
 23 Jan 2025 13:12:32 -0500
X-MC-Unique: PklM3NXRNFmEc7eVHGFc4A-1
X-Mimecast-MFC-AGG-ID: PklM3NXRNFmEc7eVHGFc4A
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 62F881955DC6;
	Thu, 23 Jan 2025 18:12:30 +0000 (UTC)
Received: from thinkpad-p1.localdomain.com (unknown [10.22.90.108])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9E96930001BE;
	Thu, 23 Jan 2025 18:12:28 +0000 (UTC)
From: Radu Rendec <rrendec@redhat.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Borislav Petkov <bp@alien8.de>
Subject: [PATCH] arm64: cacheinfo: Avoid out-of-bounds write to cacheinfo array
Date: Thu, 23 Jan 2025 13:11:59 -0500
Message-ID: <20250123181159.1849346-1-rrendec@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bKFAr0czMj3yOUMoBpgc4dFKB91PQ1UgPIrIuYWWQRs_1737655951
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_101238_133973_71D9F0B3 
X-CRM114-Status: GOOD (  20.08  )
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
leaves that is determined by fetch_cache_info(). When the device tree or
the ACPI tables provide information about the cache, that information is
used to determine the number of leaves. However, for arm64 systems, the
cacheinfo array is filled later in populate_cache_leaves() based on the
information from the CLIDR_EL1 register. If this information happens to
be inconsistent with the device tree or ACPI tables, and if the number
of cache leaves exposed by CLIDR_EL1 is larger than the pre-determined
number, populate_cache_leaves() happily writes past the allocated struct
cacheinfo array.

An example is the Renesas R-Car S4 Spider board, where the cache
information is described in arch/arm64/boot/dts/renesas/r8a779f0.dtsi.
The CPU nodes contain no explicit info (other than `next-level-cache`),
so of_count_cache_leaves() defaults to 2. The next cache level has an
explicit `cache-level` property equal to 3 and `cache-unified`, so at
the first iteration in init_of_cache_level(), the level is bumped to 3
(from 1) and the leaves count is incremented to 3. So, it ends up with
a total of 3 levels and 3 leaves. Essentially, the device tree describes
a split L1 cache, no L2 cache and a unified L3 cache, and that's
consistent with the technical reference manual. However, according to
CLIDR_EL1, the unified cache is at L2, and there is no L3. So, the code
in populate_cache_leaves() populates the 3 leaves for L1 and L2, but it
also examines L3 (for which it finds CACHE_TYPE_NOCACHE) and attempts to
populate a 4th leaf, which hasn't been allocated.

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
 arch/arm64/kernel/cacheinfo.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/cacheinfo.c b/arch/arm64/kernel/cacheinfo.c
index d9c9218fa1fdd..77ffda7284754 100644
--- a/arch/arm64/kernel/cacheinfo.c
+++ b/arch/arm64/kernel/cacheinfo.c
@@ -101,16 +101,18 @@ int populate_cache_leaves(unsigned int cpu)
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
+			if (idx + 2 > this_cpu_ci->num_leaves)
+				break;
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


