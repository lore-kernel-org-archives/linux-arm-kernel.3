Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C8AC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 17:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HB2y68d9zTsjxxhvRDjyQV1Y8kParH1RZQjPMnJh/w=; b=C4GGRs7OZvbsuZNQeoOno39YHv
	DUpQICFv/8x76Ds7AN8ll7HcOMuZM6nkznvdnlXAywYiFZSU7b12mx1crCI3g2Uib4+F8hTCC79Ci
	w0bGSESf6qg1S3SW5CuG6rhbx6pMhZjcRjMxt3DOyyyAGvyPVUURsisX3Ljaw9deObBBqMRNgjiFL
	rzbBTyc4cLVdXD/XAtNy5XunKVEE0peE8OR8I408PeSnOvGBhvY9M18qbuGKDD059gmc3MYPsCXyV
	t+V3lYZBQ3vDIb9ZnKacTDwg7sqnbOsc4vgk92kJD4D/B5Ye6Hw0VGPpfSshifW4NJx5YHP7ZKRcY
	wU314fqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkm1f-00000002oyN-3hkF;
	Fri, 17 Jul 2026 17:07:03 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkm1e-00000002oxI-1wfO;
	Fri, 17 Jul 2026 17:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784308022; x=1815844022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Vi4XcTkAZJbkjqmtACMfa0Zc5DhaJox1a7m2QlS3jo=;
  b=TZ8EQfEYMAr1z6EjN9Y38NAW+FRjirfffGl7yVGAQcA7wZknS8Rj8avN
   YnuEgRROc8xkaI3gp3xNogQXYgg0YINQlCFDgKYmS4tvpwru8j/cxi8eZ
   C3ECmWT5tK7a4DR/rufo3D3TXHtRILA594bpcjXifiw+EMfCaikeUoJkL
   BBrq+F0FUEeG+TLHe6CHuXjwkgYqGb3TB3Z7iyCzbCEyTm3PMIr4T87Hl
   UWHq9YuyUhiJHoQyHr/Mjr55QcnVP47hp+9ms1+44VutSLZeh/pc7q52u
   zF2Nxrm9yFBHBXicd6i9z6X3PJcHnvFKHHm304VV4IbnW68/5W/SC9sBv
   w==;
X-CSE-ConnectionGUID: 8s4g3AdkTk6ckED+qg69hw==
X-CSE-MsgGUID: slUlPkE/QXCMj2ueW1Qd/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="110533863"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="110533863"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 10:07:02 -0700
X-CSE-ConnectionGUID: QsBHxzL7TnG5yB9vKgLUgg==
X-CSE-MsgGUID: xE1DH7+0Qj6GVrNzYrHArQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="286903978"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 10:07:02 -0700
Date: Fri, 17 Jul 2026 10:07:01 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [PATCH 6.6.y 6/6] bpf: Prefer dirty packs for eBPF allocations
Message-ID: <20260717-cbpf-jit-spray-hardening-6-6-y-v1-6-e04f1b2893de@linux.intel.com>
X-Mailer: b4 0.16-dev
References: <20260717-cbpf-jit-spray-hardening-6-6-y-v1-0-e04f1b2893de@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-cbpf-jit-spray-hardening-6-6-y-v1-0-e04f1b2893de@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_100702_513470_838BC138 
X-CRM114-Status: GOOD (  11.27  )
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
index 7dc59570cd25..4669a57265ad 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -950,10 +950,10 @@ void *bpf_prog_pack_alloc(u32 size, bpf_jit_fill_hole_t bpf_fill_ill_insns, bool
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



