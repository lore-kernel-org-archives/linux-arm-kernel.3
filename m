Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9983DC02199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 17:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0tGaR17zCYehWILaJaYgqBJKc3qyJ/bjhxwyeAXjD14=; b=jovHaRi+UST8w0aXXoVNcoFL5M
	gLx6oO2gfE0FVLTd1ybwxfnPDZ4Ehzpuy8ItCbfSTYyj3ZD8Y5VXBEqQQZwiAKKJERwFP1cRqWDg6
	vFhBAnNmso3kBFJJsNziD3Z8Wa4lRAv8x1UGXJbA2SF9FhMZeRzy9ebKsujpOJYDblvcp0FP9DP91
	tmjoiJ1YGpFK14O+a4tWPE2OVvwePv28A916tV/VZNp2j1NB4iZXd5qpJwWVw/8di8un5oBwBm4ft
	FpYPce7b6DCZN5sJnuUrW30TYzI1U6jMzOuR2n89hiuqYdNwB/GaBSWk9qRUX91uF6GCYcvs4zx2I
	duqWggZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5x2-000000071nB-0kA8;
	Thu, 06 Feb 2025 17:46:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5ve-000000071iE-0eBM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 17:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738863880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0tGaR17zCYehWILaJaYgqBJKc3qyJ/bjhxwyeAXjD14=;
	b=Uw97fMlPVDRiVmXRSKfGLfX2DrjAJTu4/Zzvmp8QyawfW8U4Sn1uclDdZNNnM1ExNw6xBN
	CPkGu+OAa/S8At0T5lVPTxgkN/+8HfRFdnGe9yIrPEBDg1LPdEIN1EifwgsGQg/TcAGeDR
	9gglwjACdicwhEgHNdTj9ecFHgQ8FZE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-336-gutPIKKcMLmbzEpZaGhPwQ-1; Thu,
 06 Feb 2025 12:44:35 -0500
X-MC-Unique: gutPIKKcMLmbzEpZaGhPwQ-1
X-Mimecast-MFC-AGG-ID: gutPIKKcMLmbzEpZaGhPwQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C76071800877;
	Thu,  6 Feb 2025 17:44:32 +0000 (UTC)
Received: from thinkpad-p1.kanata.rendec.net (unknown [10.22.66.164])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E26AA1955F1B;
	Thu,  6 Feb 2025 17:44:30 +0000 (UTC)
From: Radu Rendec <rrendec@redhat.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Borislav Petkov <bp@alien8.de>
Subject: [PATCH v2] arm64: cacheinfo: Avoid out-of-bounds write to cacheinfo array
Date: Thu,  6 Feb 2025 12:44:20 -0500
Message-ID: <20250206174420.2178724-1-rrendec@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fX6IMcQn6U2HZr908W_fMcaIw8e6h75yW045cFPBl8I_1738863874
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_094442_261954_32E03476 
X-CRM114-Status: GOOD (  19.74  )
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
index d9c9218fa1fd..309942b06c5b 100644
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
+			if (idx + 1 >= this_cpu_ci->num_leaves)
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
2.48.1


