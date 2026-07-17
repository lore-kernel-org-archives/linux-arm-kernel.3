Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186F0C44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 17:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=43Rqns9o7zuxB8Q2tRjk8vnUv6HyspLxI1P0dak7QN8=; b=bgNEIHEAyYYlpgRYJDPVLtPPTQ
	S3JFqidmngfz4t8pJG5Ol++BQ5P1wBSPwgvhsl1uHPsaQ+QYdEwS65VKGRFRSYhXKtpk1U6V4STTv
	u2Io62267nL75Uw+V3/GQiys72IsR+jtwtvLArVUe11Fwu2kYXXoT1DuJhoGD0yIxdO44yqsU3BsE
	dawjSvyvhy8ceT46zl/ERr0Oaizq14ENM3ldGX3X0J3q+ik/nmF+vxVizCQSsbARqSjEKeR7+5CA3
	SW65+Xr8h2Jyx7pT/HaFfeaAjXEPDDWnQZFrCtbn3vR5ZwopQbZKZAciTtrpZzv+11c9n7I9Mvzey
	jm0KtUsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkm0F-00000002o9o-2y2k;
	Fri, 17 Jul 2026 17:05:35 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkm0D-00000002o8v-0PCy;
	Fri, 17 Jul 2026 17:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784307934; x=1815843934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kO8aFzuGHwtDypuu15ShB7rQhwfq0S6rbdCVU3OLqX4=;
  b=jzOMK7b0RKuvANlc+Sa3dflYgJq2EzuHVHTPWE4WcZx3RCaUwI1mQdrR
   YVY4iuflJ7mwK9askuPd9/ccoWI5JBKs/KbvSm8PUA1jUOhJrjk930JJN
   cSnr74/e+hvG83Xbzbu2Y2QjiCX/E2w+nkFgY4L6CXktETdg8I4KfF+83
   urHJNBsDVg7vN4oYmbmEaCjUh1ICqi4N9Nr6fCe/xrB2Pv5oPH3uI0VMf
   QQzI0/cbTiwc0vjzWtb2zBG5IcR10MXHqQSfWBUKIOItVoVSxlpLCllFD
   bxD+Y5S70jgeH0arr+4XYkWjLfDX5GpxUqDTrvtDetzL+S1wPZLZdAnMT
   g==;
X-CSE-ConnectionGUID: qCuJ2L4QSNiLJopqBeBZwQ==
X-CSE-MsgGUID: MX3rge3OTkWgW7ojrcN6WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="88660697"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="88660697"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 10:05:31 -0700
X-CSE-ConnectionGUID: eUr5wEqQRASVPpk+SZIHHw==
X-CSE-MsgGUID: KJ60gS9dSwGhwnT/tiyPxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="295027652"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 10:05:31 -0700
Date: Fri, 17 Jul 2026 10:05:30 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH 6.6.y 0/6] cBPF JIT spray hardening
Message-ID: <20260717-cbpf-jit-spray-hardening-6-6-y-v1-0-e04f1b2893de@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIANleWmoC/yWNMQvCMBCF/0q52SttlAu4iYujg5s4pMmlvQ4xJ
 FUspf/dVHnT9x68b4HMSTjDsVog8VuyPEOBdleBHUzoGcUVBtUoanRLaLvocZQJc0xmxsEkx0F
 Cj1Qyo7FErP1B7bWDchITe/n8BHe4nm7ny9ZSTfUMj/+eX93IdtossK5fuD+rQZIAAAA=
X-Change-ID: 20260716-cbpf-jit-spray-hardening-6-6-y-ac66e7f4237d
X-Mailer: b4 0.16-dev
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_100533_180362_FB5F2C9A 
X-CRM114-Status: UNSURE (   6.58  )
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

---
Pawan Gupta (6):
      bpf: Support for hardening against JIT spraying
      x86/bugs: Enable IBPB flush on BPF JIT allocation
      bpf: Restrict JIT predictor flush to cBPF
      bpf: Skip redundant IBPB in pack allocator
      bpf: Prefer packs that won't trigger an IBPB flush on allocation
      bpf: Prefer dirty packs for eBPF allocations

 arch/riscv/net/bpf_jit_core.c        |  3 +-
 arch/x86/include/asm/nospec-branch.h |  4 +++
 arch/x86/kernel/cpu/bugs.c           | 50 +++++++++++++++++++++++---
 arch/x86/net/bpf_jit_comp.c          |  3 +-
 include/linux/filter.h               | 15 ++++++--
 kernel/bpf/core.c                    | 68 ++++++++++++++++++++++++++++++++----
 kernel/bpf/dispatcher.c              |  2 +-
 7 files changed, 129 insertions(+), 16 deletions(-)
---
base-commit: da47cbc254661aa66d61ef061485a7080305c4be
change-id: 20260716-cbpf-jit-spray-hardening-6-6-y-ac66e7f4237d

Best regards,
--  
Pawan



