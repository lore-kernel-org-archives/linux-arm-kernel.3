Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4DCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 22:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57eiUjUaFCdvUIA37WRQDRfWH/rwYy7WUQvwbU3B5RE=; b=V9LRjOFojY0wCVTjRRiAaVlT2B
	36uhKuu32aGDSpT+hn5TqfJ/j56AsTrwkUPwLcjWj8hTDwsa+JwDrSlJMsgkDxdWPfbzB/5TEwhSd
	r+EoSRxg95bB/HJVy8JFSL5fz2OmMrOnuqr+gOXA6Vuj0Ca+PEHhmv85Lg1eI4Wti0Mogf7PGuy4p
	spcIbU/FSdzaWiw+eqck8wocDqVW4xpROL79hfy03Th+AvZ1v/faSSDTcXmet8rg9VDlr1XYCtUi5
	P5eZnwbHge79Fycruce/RKP6nQNbAUh/jbLmhtSXnaL91GnOtWNb5S0QXeTexNl717K4bmrqjAe2r
	ISxzmfNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxAJ-00000003m45-22Vq;
	Thu, 09 Jul 2026 22:24:19 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxAH-00000003m3L-2D6Q;
	Thu, 09 Jul 2026 22:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783635857; x=1815171857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vmkP0yQw4l/AwIxIqFDbAQio17LtOdykU5QuvODGdUQ=;
  b=R5Gkn3rvQLpUG8+c8sW8CANZPSKqLcubDoV+UH1ZcRhyYtGPeMFs1wyr
   C9/DGiaeTL6YW8u9xO1svld5Pq7qfWVRNcETqfBR452kzT5YvnKfwaBEm
   ZPJTCi1UwTw3iyOYKOjxpamYMy2yyymiVbAbcuUm/J6GbH4d6ZCe7t/0C
   R16eYQPPJUFwXHTwQZiKY47sWC4ZTk8a7YFucFS6OtJ/E/jDAp45ChL3u
   3XWBBPll/T5u7d/IXwjpwvmY5jDgXdQGSug6XYE9JQheZXmx4vtqGvguL
   jHAs8ORUbxFMgzh87q7mq1pXJY0gdLa6UeGJcwDMwSghkCRpMQ3IZM5zp
   Q==;
X-CSE-ConnectionGUID: khHIV1jqRseWbDRNliYBpA==
X-CSE-MsgGUID: 5+Kl1DqrSK+c4iIscMcQ7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101886003"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101886003"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 15:24:17 -0700
X-CSE-ConnectionGUID: 1JRy3pUPTIukZZL50LIqNA==
X-CSE-MsgGUID: TrxwbYv9SZa+fOOrPTfkBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254226918"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 15:24:17 -0700
Date: Thu, 9 Jul 2026 15:23:56 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [PATCH 7.1.y 4/6] bpf: Skip redundant IBPB in pack allocator
Message-ID: <20260709-cbpf-jit-spray-hardening-7-1-y-v1-4-5ac5a2d6797f@linux.intel.com>
X-Mailer: b4 0.16-dev
References: <20260709-cbpf-jit-spray-hardening-7-1-y-v1-0-5ac5a2d6797f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-cbpf-jit-spray-hardening-7-1-y-v1-0-5ac5a2d6797f@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_152417_575239_63BA1856 
X-CRM114-Status: GOOD (  15.12  )
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

commit a23c1c5396a91680703360d1ee28a44657c503c4 upstream.

bpf_prog_pack_alloc() issues IBPB on all CPUs on every cBPF allocation,
even when reusing chunks from an existing pack where no new memory was
touched since the last IBPB.

Since IBPB on all CPUs is heavy, Dave Hansen suggested to track allocation
since last IBPB, and only issue IBPB at reuse for the chunks that have not
seen an IBPB since they were last freed.

Track per-pack whether an IBPB is needed via arch_flush_needed. Set it when
allocating a chunk, reset on IBPB flush. On reuse, conditionally issue the
flush. Since IBPB invalidates all BTB entries, clear the flag on all packs
after flushing.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Acked-by: Daniel Borkmann <daniel@iogearbox.net>
Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
---
 kernel/bpf/core.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 1b7e74e63bd4..1bf4b8dffe91 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -876,6 +876,7 @@ int bpf_jit_add_poke_descriptor(struct bpf_prog *prog,
 struct bpf_prog_pack {
 	struct list_head list;
 	void *ptr;
+	bool arch_flush_needed;
 	unsigned long bitmap[];
 };
 
@@ -928,6 +929,8 @@ static struct bpf_prog_pack *alloc_new_pack(bpf_jit_fill_hole_t bpf_fill_ill_ins
 	bpf_fill_ill_insns(pack->ptr, BPF_PROG_PACK_SIZE);
 	bitmap_zero(pack->bitmap, BPF_PROG_PACK_SIZE / BPF_PROG_CHUNK_SIZE);
 
+	if (static_branch_unlikely(&bpf_pred_flush_enabled))
+		pack->arch_flush_needed = true;
 	set_vm_flush_reset_perms(pack->ptr);
 	err = set_memory_rox((unsigned long)pack->ptr,
 			     BPF_PROG_PACK_SIZE / PAGE_SIZE);
@@ -990,8 +993,15 @@ void *bpf_prog_pack_alloc(u32 size, bpf_jit_fill_hole_t bpf_fill_ill_insns, bool
 
 found_free_area:
 	/* Flush only for cBPF as it may contain a crafted gadget */
-	if (static_branch_unlikely(&bpf_pred_flush_enabled) && was_classic)
+	if (static_branch_unlikely(&bpf_pred_flush_enabled) &&
+	    pack->arch_flush_needed &&
+	    was_classic) {
+		struct bpf_prog_pack *p;
+
 		static_call_cond(bpf_arch_pred_flush)();
+		list_for_each_entry(p, &pack_list, list)
+			p->arch_flush_needed = false;
+	}
 	bitmap_set(pack->bitmap, pos, nbits);
 	ptr = (void *)(pack->ptr) + (pos << BPF_PROG_CHUNK_SHIFT);
 
@@ -1029,6 +1039,9 @@ void bpf_prog_pack_free(void *ptr, u32 size)
 		  "bpf_prog_pack bug: missing bpf_arch_text_invalidate?\n");
 
 	bitmap_clear(pack->bitmap, pos, nbits);
+
+	if (static_branch_unlikely(&bpf_pred_flush_enabled))
+		pack->arch_flush_needed = true;
 	if (bitmap_find_next_zero_area(pack->bitmap, BPF_PROG_CHUNK_COUNT, 0,
 				       BPF_PROG_CHUNK_COUNT, 0) == 0) {
 		list_del(&pack->list);

-- 
2.43.0



