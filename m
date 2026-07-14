Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CB3C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 01:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOak68Ozxs8RlvL+ie9BT5kVCwthM7WBFNj1E5kFguw=; b=ov3taK0/f2qy0eAC9qBOZ6VLsR
	mXcra5jlQpXLM76amiEMOuotJis6fhDNvJNnAyXCZDmBM9etWl0rsXEZNhMTSLL5pTr6q7Yy9Gp6U
	MJoow7qIyGvcJ+M7v8NEVSia9EMuw7XuHf/pa9uycOHLjJWvGzwNZ6C7abNExev4gQEDpMeP4c8pT
	i1nuYBvTVdQm34wVqMqhZTTmvSbgSyQ5Hhcisd/dC31byO/P7OmI61mcPf7JYfkyP00ODyuKHozRj
	OVbJCn+slnKmOxVsvfa6AXWzoUvzNG0yo/PNjs35Gl9Vvaw5Nz3vYWxhAhr3LGpCq/mHOo4axsg3k
	q24/X3YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjRhi-0000000AdwP-1NUg;
	Tue, 14 Jul 2026 01:12:58 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjRhf-0000000Adug-3DHU;
	Tue, 14 Jul 2026 01:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783991576; x=1815527576;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+RTLxExJBFEh/unuxwhi0vcb1IHbn6oEjuCS/eEhK3w=;
  b=asa4fXl6MkyQyRS4EzD+X0tajRcwskMyVL+7reaX9X3h5YCBYCzgSyH4
   krfOQcAtrNM9sAFnEZBUdnGymc8aHVjSCG31DNIm05E6moXqlbA5vT+p5
   wco9rvKPBc1p+DLJLDu1KQzsFzjyAIlaHp3l88I+xyJu/IPntpnwOexmy
   x2J5a2s2Xg2IJ96Tzwv+KEmbRUxaIegzkywf+tUYyTxU4/BSANHPRYF66
   rQN83vpLhPcWYAdWEKYGBdCKfcdunCuHGCtSl7HefbWrLvTWkQxi0Q18f
   QdTInEeCf1uHVEYSYUJsbOYlDSHJWXLLAEE4dyjI1QOIPv1jqRvauyP1K
   A==;
X-CSE-ConnectionGUID: mGiYsQGuS4aOyBeh3l2cNg==
X-CSE-MsgGUID: 1YWoQ1GBQnOyv+1aXhqsLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94961836"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94961836"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 18:12:55 -0700
X-CSE-ConnectionGUID: g03EV14ERB63gf8iSRo98g==
X-CSE-MsgGUID: mF7R0phSSyy+jniBTMACKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="249344059"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 18:12:54 -0700
Date: Mon, 13 Jul 2026 18:12:53 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [PATCH 6.18.y 6/6] bpf: Prefer dirty packs for eBPF allocations
Message-ID: <20260713-cbpf-jit-spray-hardening-6-18-y-v1-6-755f60c55705@linux.intel.com>
X-Mailer: b4 0.16-dev
References: <20260713-cbpf-jit-spray-hardening-6-18-y-v1-0-755f60c55705@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-cbpf-jit-spray-hardening-6-18-y-v1-0-755f60c55705@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_181255_847015_09277906 
X-CRM114-Status: GOOD (  11.91  )
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

commit b72e29e0f7ee329d89f86db8700c8ea99b4a370a upstream.

The pack allocator only flushes predictors when reusing a dirty pack for
cBPF, eBPF allocations never trigger a flush. Currently, eBPF picks the
first free pack, which could be a clean pack. As an optimization, leaving
a clean pack for cBPF can avoid flushes.

Prefer dirty packs for eBPF and keep clean packs free for cBPF. This
mirrors the existing cBPF preference for clean packs: each program kind
prefers the pack that avoids an extra flush, and falls back to the other
kind only when no preferred pack has room. eBPF reuse of a dirty pack is
harmless since eBPF being privileged does not flush.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Acked-by: Daniel Borkmann <daniel@iogearbox.net>
Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
---
 kernel/bpf/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index e0ffdd985eb5..b102704f89bc 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -970,10 +970,10 @@ void *bpf_prog_pack_alloc(u32 size, bpf_jit_fill_hole_t bpf_fill_ill_insns, bool
 			goto found_free_area;
 		/*
 		 * cBPF reuse of a dirty pack triggers a flush, so prefer a
-		 * clean pack for cBPF. eBPF never flushes, so pick the first
-		 * free pack, dirty or clean.
+		 * clean pack for cBPF. eBPF never flushes, so steer it to a
+		 * dirty pack and keep clean packs free for cBPF.
 		 */
-		if (!was_classic || !pack->arch_flush_needed)
+		if (was_classic ^ pack->arch_flush_needed)
 			goto found_free_area;
 		if (!fallback_pack) {
 			fallback_pack = pack;

-- 
2.43.0



