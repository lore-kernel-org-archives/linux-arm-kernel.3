Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BA0C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzZVFbgbmv1vCUvZWeyfyaG2u155mvnyt4yNEuC5u+g=; b=48dj/NDMCuoQAVULRAwgwlDhtQ
	854/p8Jk5ysmDF/VvMmMyAPY/VQvTSEWrl+KUxuYQChABep6k96gX9nk9Mk7S26TUiCzl4ubDohwH
	ryJeYHe25qyVZ3PWbSHn5ChZ1qLFBmROFvEJ8TJf7QrOBAJpLg8t6hvwvoyHbu4t1gocpXFPyZFOo
	LY1HTrD6MuCo4bvEFkAj1uRGNgsOL/VZsiM8sg/8Xq5Ddz7tj38DSQgwZKOn44Zw1/fww1wBKUgki
	Hf17hf21A4pv8VNUW4s+iktwAK+FeJ55ch2ph2D+2X/f0vlHM39UUirkSPxfue67afz2p6JoNt62Z
	R2sf+x3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiMM-0000000Cy2R-2ljJ;
	Tue, 14 Jul 2026 19:00:02 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiMJ-0000000Cxym-0IG3;
	Tue, 14 Jul 2026 19:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784055599; x=1815591599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ikwe3QzBMYqyLtMu8y0CioWHL4Q5Qo0Uc8ghNJ9gyv8=;
  b=kSdGiQ0SuOEGw9rjn5nsROKGKrDDk3UVJI4LJ6uzhMh+1ex8YFkNOqTw
   al/KuLSWgCH8CUnpCBE2ptP6szKkWdTTKwUp6SaopTGpyzysUHRGnLrw2
   tmkObX1KOkIAcs3Sze3f4h+X5zkBRq9RqnI+eI5F0e3ZWUzY+9h54TzTa
   QxZnYcriqUjnAx53W0R73OQPU+mzzwxkc2Qw8mAsTts18nygm4QvYLO6y
   gksx2I0PevkJOOQYOkNknKiDLBzlpmpNFVDKraogMXQMzawhHoltyv5Hj
   9KjMld9I/W4+qwFItcxIdVes8gwjuk+8AR3S8RrAPAseG0q5HEBQaebgu
   w==;
X-CSE-ConnectionGUID: ZRVzMc76S3CEaKQdckSF/g==
X-CSE-MsgGUID: +ngTPw45S/GXCUiWbmVkgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102241387"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="102241387"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 11:59:57 -0700
X-CSE-ConnectionGUID: 95cGieXzRFy9UhU+YBoKFQ==
X-CSE-MsgGUID: kfliOx19SOG+1mAaLyHOnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="279225339"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 11:59:57 -0700
Date: Tue, 14 Jul 2026 11:59:57 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [PATCH 6.16.y 6/6] bpf: Prefer dirty packs for eBPF allocations
Message-ID: <20260714-cbpf-jit-spray-hardening-6-16-y-v1-6-2fc3e16263ac@linux.intel.com>
X-Mailer: b4 0.16-dev
References: <20260714-cbpf-jit-spray-hardening-6-16-y-v1-0-2fc3e16263ac@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-cbpf-jit-spray-hardening-6-16-y-v1-0-2fc3e16263ac@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_115959_120453_91C98B92 
X-CRM114-Status: GOOD (  11.85  )
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
index 81ba423d0f8e..0bed7fe9821e 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -998,10 +998,10 @@ void *bpf_prog_pack_alloc(u32 size, bpf_jit_fill_hole_t bpf_fill_ill_insns, bool
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



