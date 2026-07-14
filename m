Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F91C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 18:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eanP+BcGSKoSZ9Zq9+AjtXyE2g1OQWVtY+mBFuNF0yE=; b=2eg4kkK31+2iZ+JxByTsEH31dE
	DXO2QdFmDMtWV1QSuQz+se555scvG1bRxX70c3QqjBATGSgFgpGl75Yw1CqOYdHw0ey9soVJsUsuy
	lILkF8mf3ohNxmkQajnGYwdcjx1IcG3FJNHnKlXWTHO2vOrBxBNUGOmoGUwr2zc8MvCtDHwlyWqpn
	9jT4l+z6PYpS4LPnfh4QOVw+JOfLlpSEkbY2oM5XslrwrcYwtjHdp1IuHiHaHsXBAq9x7T6ISC5dg
	xMpZ7sUuSD8QB2k0+7r7MISDFTJlV0zcRZ38OxXy4of8dg9nBRKTyI8d5z/TbHbxN9l7C1tu9IE2v
	AhZp5Xww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiKs-0000000CwuW-2ykV;
	Tue, 14 Jul 2026 18:58:30 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiKp-0000000Cwt2-1Cgx;
	Tue, 14 Jul 2026 18:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784055508; x=1815591508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DzLA4w38CFwdzu/Uzj79RDIxzZT2AwfMc39nX/r/t9k=;
  b=WeyPOlhU0U0KEpvrP2IZJm6g9dHcRCwKTCTCCy8dRPSfeNXdopCqVbha
   4AglvXvOeAXkgiRC6qnyh3cW4GY5MIY4gycIGsgKmaRsT/SZhuvWYD0Vd
   bUJXNYL6gzoHBeGn0G7/AA5zaqDULicqppQez3LHFqRLTR/im1Qk+sY0V
   +w7ukdt76HUobwa/8m3bYCqZbTIvmGs4rCq8x8yZpu8j1FjDph9Zcprgs
   Hm4DQoHoiD2wl7hoydVdfQ31ebLoW8QweienKO3QqKvfYCFgcXbnlyey+
   AacZLN9h86rkpXxoZuEvHckVwGjdHVlIsbBC50eY6LiJpwD2QkYQ9SubB
   w==;
X-CSE-ConnectionGUID: CM5nIlsgQb27wKiUBEFqXg==
X-CSE-MsgGUID: jZaP+C/EQZOwqruvI1XT1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88586660"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="88586660"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 11:58:25 -0700
X-CSE-ConnectionGUID: zJdJZMFdTvexCooRz9Lb5w==
X-CSE-MsgGUID: eYih6CtRRc+2gVaty5xw2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="255442489"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 11:58:25 -0700
Date: Tue, 14 Jul 2026 11:58:24 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH 6.16.y 0/6] cBPF JIT spray hardening
Message-ID: <20260714-cbpf-jit-spray-hardening-6-16-y-v1-0-2fc3e16263ac@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIAGOGVmoC/yWNvQ6CMBRGX4Xc2UvaBurPRlwcHdyMQykXuAy1a
 dHYEN7douP58uWcBSIFpginYoFAb478dBnkrgA7GjcQcpcZlFBa7GWFtvU9Tjxj9MEkHE3oyLE
 bUKPUmLC2taiqY39QwkK2+EA9f36FO1yb2/myrbqUukzw+B/iq53IzlsH1vULVVaQGZQAAAA=
X-Change-ID: 20260714-cbpf-jit-spray-hardening-6-16-y-5c50449f820c
X-Mailer: b4 0.16-dev
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_115827_413574_2F00FF45 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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

Hi,

These backports harden BPF JIT against spectre-v2 class of attacks. Without
a predictor flush, execution of new BPF program may use stale prediction
left behind by the freed one.

To avoid this, issue an IBPB flush on all CPUs on JIT program allocation.
The flush is conditional to spectre-v2 mitigation applied.

Patch 1-2: Adds the predictor flush hook and enables it on x86 via IBPB.

	  bpf: Support for hardening against JIT spraying
	  x86/bugs: Enable IBPB flush on BPF JIT allocation

Patch 3-6: Narrow the flush to only unprivileged JIT allocations
	   to avoid redundant flushes. Also adds pack-selection changes
	   that minimizes flushes.

	  bpf: Restrict JIT predictor flush to cBPF
	  bpf: Skip redundant IBPB in pack allocator
	  bpf: Prefer packs that won't trigger an IBPB flush on allocation
	  bpf: Prefer dirty packs for eBPF allocations

This one is mostly similar to 6.18:

  https://lore.kernel.org/all/20260713-cbpf-jit-spray-hardening-6-18-y-v1-0-755f60c55705@linux.intel.com/

---
Pawan Gupta (6):
      bpf: Support for hardening against JIT spraying
      x86/bugs: Enable IBPB flush on BPF JIT allocation
      bpf: Restrict JIT predictor flush to cBPF
      bpf: Skip redundant IBPB in pack allocator
      bpf: Prefer packs that won't trigger an IBPB flush on allocation
      bpf: Prefer dirty packs for eBPF allocations

 arch/arm64/net/bpf_jit_comp.c        |  4 +--
 arch/powerpc/net/bpf_jit_comp.c      |  4 +--
 arch/riscv/net/bpf_jit_comp64.c      |  2 +-
 arch/riscv/net/bpf_jit_core.c        |  3 +-
 arch/x86/include/asm/nospec-branch.h |  4 +++
 arch/x86/kernel/cpu/bugs.c           | 50 +++++++++++++++++++++++---
 arch/x86/net/bpf_jit_comp.c          |  5 +--
 include/linux/filter.h               | 15 ++++++--
 kernel/bpf/core.c                    | 68 ++++++++++++++++++++++++++++++++----
 kernel/bpf/dispatcher.c              |  2 +-
 10 files changed, 135 insertions(+), 22 deletions(-)
---
base-commit: d997d33eb340e2add100eac1222e107cc1396e76
change-id: 20260714-cbpf-jit-spray-hardening-6-16-y-5c50449f820c

Best regards,
--  
Pawan



