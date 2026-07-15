Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4B2C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 21:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=725hK6u0dsRyMRCDfL7W1t9xxTnUXFJxwn4t6a/xIRU=; b=cF5U4nSaXRFtAPInzM30Tvc/EH
	qohHhYNcXXDxWBDKVsP/i7SUu4OtbE9w6QrC2TeGK8L4TBJEPJ5SOSG0LyxeoZDPoQvYBpcPW2sQO
	rQ6OhH9mYDrbsvXt2TmE790XCt3MKnu8XrKq+/t0qxjl8tbQid4cbk3aOxaFm75ijWuVIsTRCZ88h
	WVg/l4yo+bL6nOR3RiODhkzvlOs6eXqx+eu5mhwNf1h4hWFE21+Khg0vIhKJotnOLdsgnWN78Scgw
	q/gdzV7jLSvDIlhYjtCdu6/jsIUGPvm3ReUF+iBJQeMjZT1VN/UlWdYYsvIR9mxWmaY6kYY+Zxa+6
	Ln8T28zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7A3-0000000FwpY-02bX;
	Wed, 15 Jul 2026 21:28:59 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7A0-0000000FwnT-2kNx;
	Wed, 15 Jul 2026 21:28:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784150937; x=1815686937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xfve0O2XdmBs3zfqDvaZ3WsitpPOEi1td0V/G7TnVHU=;
  b=Wq7ZjrfjvzHPVOrMZ9hOx/u/QYfPzgqP8zpZaFkqkT/7tQdtd9kVckn4
   ZPhV3PWsmm6smuVxSd42TjoKfVD28GIiMGx4Uh6rOcpFe4E+WlU5tMfV+
   obvCo32BaGIJoFL97YTlEmibSSNc8fkQGnMrdjPT9sauZFcrGCnRFZhM+
   ilGGKo+Xza9loAVKQR1n1K4P7/6OstK2irXebVg+w5wxrO236fqzoDMIm
   OPPxH2bZj6ut6wbilPBe+roFM7ZaoBIQE4E741tiE9enSDljDv3W9h5nv
   KrEXFVDOLiDhMin+p191R3r455blEY+BmJMJItTyeuQVw+po6WJZ9aVvz
   g==;
X-CSE-ConnectionGUID: 2plX0o88QHeP7ybSa8wXFg==
X-CSE-MsgGUID: ekqAJx0MQES93yEMBu8YfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="107603330"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="107603330"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 14:28:56 -0700
X-CSE-ConnectionGUID: I1gdgHEFQqeQeoo+weloZg==
X-CSE-MsgGUID: Y2MXgFiIQDqx6BadYbhGow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="258270721"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 14:28:56 -0700
Date: Wed, 15 Jul 2026 14:28:55 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [PATCH 6.12.y 5/6] bpf: Prefer packs that won't trigger an IBPB
 flush on allocation
Message-ID: <20260715-cbpf-jit-spray-hardening-6-12-y-v1-5-d8585a9aed80@linux.intel.com>
X-Mailer: b4 0.16-dev
References: <20260715-cbpf-jit-spray-hardening-6-12-y-v1-0-d8585a9aed80@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-cbpf-jit-spray-hardening-6-12-y-v1-0-d8585a9aed80@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_142856_742001_4DBFBC9E 
X-CRM114-Status: GOOD (  16.92  )
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

commit a9b1f19a6a673ba06820898d0f1ad02883ea1639 upstream.

Currently BPF pack allocator picks the chunks from the first available
pack. While this is okay, it naturally leads to more frequent flushes
when there are multiple packs in the system that weren't used since the
last flush.

As an optimization prefer allocating the new programs from packs that
are unused since last flush. When all packs are dirty, allocation forces
a flush and marks all packs clean.

Below are some future optimizations ideas:

  1. Currently, the "dirty" tracking is only done at the pack-level.
     Flush frequency can further be reduced with chunk-level tracking.
     This requires a new bitmap per-pack to track the dirty state.
  2. IBPB flush is done on all CPUs, even if only a single CPU ran the
     BPF program. On a system with hundreds of CPUs this could be a
     major bottleneck forcing hundreds of IPIs to deliver the flush.
     The solution is to track the CPUs where a BPF program ran, and
     issue IBPB only on those CPUs.
  3. Avoid IBPB when flush is already done at other sources (e.g.
     context switch).

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Acked-by: Daniel Borkmann <daniel@iogearbox.net>
Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
---
 kernel/bpf/core.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 357af07b9ba4..665f8423b760 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -958,8 +958,8 @@ static struct bpf_prog_pack *alloc_new_pack(bpf_jit_fill_hole_t bpf_fill_ill_ins
 void *bpf_prog_pack_alloc(u32 size, bpf_jit_fill_hole_t bpf_fill_ill_insns, bool was_classic)
 {
 	unsigned int nbits = BPF_PROG_SIZE_TO_NBITS(size);
-	struct bpf_prog_pack *pack;
-	unsigned long pos;
+	struct bpf_prog_pack *pack, *fallback_pack = NULL;
+	unsigned long pos, fallback_pos = 0;
 	void *ptr = NULL;
 
 	mutex_lock(&pack_mutex);
@@ -991,8 +991,29 @@ void *bpf_prog_pack_alloc(u32 size, bpf_jit_fill_hole_t bpf_fill_ill_insns, bool
 	list_for_each_entry(pack, &pack_list, list) {
 		pos = bitmap_find_next_zero_area(pack->bitmap, BPF_PROG_CHUNK_COUNT, 0,
 						 nbits, 0);
-		if (pos < BPF_PROG_CHUNK_COUNT)
+		if (pos >= BPF_PROG_CHUNK_COUNT)
+			continue;
+		/* Flush not enabled, use any pack */
+		if (!static_branch_unlikely(&bpf_pred_flush_enabled))
 			goto found_free_area;
+		/*
+		 * cBPF reuse of a dirty pack triggers a flush, so prefer a
+		 * clean pack for cBPF. eBPF never flushes, so pick the first
+		 * free pack, dirty or clean.
+		 */
+		if (!was_classic || !pack->arch_flush_needed)
+			goto found_free_area;
+		if (!fallback_pack) {
+			fallback_pack = pack;
+			fallback_pos = pos;
+		}
+	}
+
+	/* No preferred pack found */
+	if (fallback_pack) {
+		pack = fallback_pack;
+		pos = fallback_pos;
+		goto found_free_area;
 	}
 
 	pack = alloc_new_pack(bpf_fill_ill_insns);

-- 
2.43.0



