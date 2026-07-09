Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557CFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 22:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQzu8TqPo/8WKDkjNpGW8PmCmUjGaPVPmoP4PnbHCE4=; b=aTuMXiAcTsuEO1ouTDJb//xdM1
	mHPA/BTnvtnUDGkNjYdViq3GQzbN1giS8IoHGnJIwcThYx6zyF5zEi+e7clwnecOVUFbiKrEA3lkB
	i9jwPuPpG8F0No7FLd99oDrS0X09xBFL2ue3ZbzknyFv9DhsB27unaHE2+jdbr5ZNHyrgPirXL6VJ
	5BWFr+9PMu/1HuegweOVm4XQrG7mYmZqTTrw6WDR+Bc4tX7U8+vBASzT3b274nWKXEjNSjSVfj5nY
	PqroGMpRP3RrtVoYN9Bpw2ipXMeCT7T9lmiWiWS1w6PGeKgZomLLDdSI/gK3GtQDlSXkD5NScxqVP
	w8tZqX5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxAo-00000003mLt-2EIr;
	Thu, 09 Jul 2026 22:24:50 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whxAm-00000003mKe-01UN;
	Thu, 09 Jul 2026 22:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783635888; x=1815171888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j+SGpxnxcXP2jP/D2FzTuZpBaLImj0yoHLCpJzVrAQQ=;
  b=OFXpWgY+ZzWYKKz2eWNPkVCCUkPuYURBezgEIjnQfA1DMB7cdEiq8pna
   541Otjlk18BHGmQqPzoWda9xqug01z4qahNOV/A3Nu6a3iGTxJGhgAZ33
   ENkdHbV8qiHZlJg3AuHgFuk6PZWwAnehIhJerScxOr8EHY3cWXI/O+edw
   L4BSk9/mi/Ek+BS/5YAv8MRxa1kTubMzWDsQyvvY3fV38cqNpcb9EHGqw
   LuWK3r8pchJD/G4R9+uDSkKn5czHJf3Z9IJqTTMLwKfzMuJqZbDvSsvQ0
   aleKkFoMZY2kg7Nnsw13KIQ8i40eXOi1djEffzJasTj09jlWBYgPb6DE0
   A==;
X-CSE-ConnectionGUID: aT8ZmmQuREuztBx176CaSg==
X-CSE-MsgGUID: eAz4rKFNRXutAKx2ptJC6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84213779"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84213779"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 15:24:47 -0700
X-CSE-ConnectionGUID: ibAssKHeRbmUZQiMyyryAg==
X-CSE-MsgGUID: ffWZe+IPSh2xsAc9y1Tnaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="248335750"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 15:24:47 -0700
Date: Thu, 9 Jul 2026 15:24:47 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [PATCH 7.1.y 6/6] bpf: Prefer dirty packs for eBPF allocations
Message-ID: <20260709-cbpf-jit-spray-hardening-7-1-y-v1-6-5ac5a2d6797f@linux.intel.com>
X-Mailer: b4 0.16-dev
References: <20260709-cbpf-jit-spray-hardening-7-1-y-v1-0-5ac5a2d6797f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-cbpf-jit-spray-hardening-7-1-y-v1-0-5ac5a2d6797f@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_152448_054881_CE5FB064 
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
index bba4acd61d41..de61e1894452 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -988,10 +988,10 @@ void *bpf_prog_pack_alloc(u32 size, bpf_jit_fill_hole_t bpf_fill_ill_insns, bool
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



