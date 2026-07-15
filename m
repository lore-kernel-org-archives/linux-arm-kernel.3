Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE98C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 21:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFbrdS1ZnHWLy4eHMzggHVidMa+q5j7UyKEvqy0jdjw=; b=QyzMUFCU+FpQfBgSeUs6X/eidW
	8YoC1tA6ZUMiLdkrojR02vhPD+syOSikSNj3oV8ghHCKJMuPoEHzhkR06Hk/atBKm/8vY6ffPXc5q
	A5BlSQ+tHLuKsGzrmUubXAmecp6NtXKg7B5K5ZCXW472WDlvP1Z2X9klwj9ESWCEPi5qfvI7gF0+d
	dbw53KwA1GU1rQ9RyiubDO/THxIfBHBci2VbDvzmqx6ytndfLDFp1fFW+8/5wTmAzo2D6jcbCkiaO
	QEhmDPM/96bw/od8sk68VY2c41pFPchiR75GrotkADJZaIa2UWvjwAxPQ5amCVksNViETMgsN+oiT
	qcT9NJJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7AI-0000000Fx0c-1MlD;
	Wed, 15 Jul 2026 21:29:14 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7AF-0000000FwyZ-3KSa;
	Wed, 15 Jul 2026 21:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784150952; x=1815686952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wDb0ezA9eFyOvG4pCNK3eJil6YKm7mNmDWs3yGdmdkc=;
  b=P/bmfmbAifufMHIQnjxeh8Ch7k8bZ6OvIRj4hGUEThhLfenQY60JbSW5
   PBtsPCx3MST9bIkR8dkWyjZX2rSE1cjZ2cC3ZWwTZUr3Pij1nT5WcVc3m
   ndxTjo61hUGnEFoxtLgafXCAoD26e+sdVaYpDi9l/ZgrSs7MMmL+nmtFz
   +AwCrkO2W6P+mGKLRPwKcUzF8lGqQK1mKxNNvkpwYkJTKaRMinOwIj24j
   Vr4M8uAuXBovXCX2cRHMnJbQvb4SMXxmQMd3sBapv5JNTS4RjE6moyHqU
   vcDGhzg2HFbFLV/9eJ6GtDD95ZejGEHRaII70b+fuvkBmnBrab00YzAHP
   g==;
X-CSE-ConnectionGUID: 4siugcv3T/O6N9D/wHYE4w==
X-CSE-MsgGUID: VhUgjKlFRum/V+S0TGgLgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84897316"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="84897316"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 14:29:11 -0700
X-CSE-ConnectionGUID: j2zqk8J3TmyP7lamzXyFAg==
X-CSE-MsgGUID: sHu8xZFPQjSTg5dDdA8UPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="260616267"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 14:29:11 -0700
Date: Wed, 15 Jul 2026 14:29:11 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [PATCH 6.12.y 6/6] bpf: Prefer dirty packs for eBPF allocations
Message-ID: <20260715-cbpf-jit-spray-hardening-6-12-y-v1-6-d8585a9aed80@linux.intel.com>
X-Mailer: b4 0.16-dev
References: <20260715-cbpf-jit-spray-hardening-6-12-y-v1-0-d8585a9aed80@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-cbpf-jit-spray-hardening-6-12-y-v1-0-d8585a9aed80@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_142911_878963_2DF64251 
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
index 665f8423b760..d9131b235f79 100644
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



