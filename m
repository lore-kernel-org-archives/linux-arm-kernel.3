Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C3EC44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 01:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uyu6UWSikG2Cbt5OXdKC4BoFkWW7kbNKN8/sWUzYl+0=; b=0wYq4StekuSox578p3IgnvPN+Q
	diitPUWIuZ52c4W99re03RTfQG/Bj06DxpTqpLgXGL3Gy1LtJHiuD8m63uqTWfMnlAz0uVUOmwJfQ
	R2lQs4mGO0YmUfM7JzSL1jojVm/bhq5pGtwScGAh6xnJeuEAQG+rreMODS7rCVBXidcDzKm4SlhB9
	H+tuYfs3QcT/V1USISTjcVMVQY8zEwYGNSj++aVfMlaYPrSV6p43AsI8lAxmFsZPG8Kkx5nnK+khT
	GgFbrUaBlUh9qxQdp8mkemJNsJhqPb4XmApghMSGUXWSSeGgJRowvKlE8qXU6EZY58SDPYPqMZnL/
	gyayb9vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjRgG-0000000Ad76-0Fin;
	Tue, 14 Jul 2026 01:11:28 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjRgD-0000000Ad6g-3mMY;
	Tue, 14 Jul 2026 01:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783991486; x=1815527486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DCbMgnamWUlHK3HfeBnVqU97YJbvkxfbDCJ2xswtGHo=;
  b=LG+eyytyGFyojusOopXjaZYV5+U5D8rHqSOy0QSXwP9YRSVl/hG9Kfzp
   DmFrtbrbctwtIoWkxsG5j4qmHfjZcUnw7l6HvMKhLKt1gl0u8vINxOpNa
   NxHVfaBJiWVHbYkViNY6edU7aG0Yx+m6rsfNkco3KiKbiZ1XgPRWe3cnk
   uZAFgzd3im7m0LTCB/6rgqu8rQjrq4lcVw60DLYlhRmvRK9Qw3wUVVuwt
   x7EkrlPYokMnLpUAl7mW4xxPGRv+qcrRMbs/rPxutFp4N7D92l7sM1UUZ
   hoWuEE1VyNblxXcWYqBxnUeRSmvd4OUsymoXfdsdEFq80tMvRrLa+//6G
   A==;
X-CSE-ConnectionGUID: nDul4PNvQAOT5YxvuCIpWw==
X-CSE-MsgGUID: 8gRe+4NaQg6wJZgmAnGoFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84702131"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84702131"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 18:11:23 -0700
X-CSE-ConnectionGUID: X0NUj8UzT+uuLyJCHusJHg==
X-CSE-MsgGUID: LMEMMUp0SqmapMABq2oo4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252318584"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 18:11:21 -0700
Date: Mon, 13 Jul 2026 18:11:21 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH 6.18.y 0/6] cBPF JIT spray hardening
Message-ID: <20260713-cbpf-jit-spray-hardening-6-18-y-v1-0-755f60c55705@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIAFWMVWoC/yWNsQ7CIBRFf6V5s68BTAq6GRdHBzfjQOlr+zogg
 WokTf9dqsMdzs3NPQskikwJjtUCkd6c+OkLyF0FbrR+IOSuMCihGqHlHl0bepx4xhSizTja2JF
 nP2CD0mBGK5Qx+uB0CZSXEKnnz89wh+vpdr5sbVNLU2d4/Afp1U7k5s0D6/oFVLm6h5QAAAA=
X-Change-ID: 20260713-cbpf-jit-spray-hardening-6-18-y-a028879c779c
X-Mailer: b4 0.16-dev
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_181125_987051_912C8367 
X-CRM114-Status: UNSURE (   8.19  )
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

Patches 1 & 2 had minor header conflicts. Patch 3 had a few conflicts in
bpf_int_jit_compile(), majorly loongarch bpf_int_jit_compile() doesn't use
pack allocator, dropped was_classic hunk.

x86 builds and boots fine in a VM. I don't have build infra for other
arches, relying on the bots for the builds.

---
Pawan Gupta (6):
      bpf: Support for hardening against JIT spraying
      x86/bugs: Enable IBPB flush on BPF JIT allocation
      bpf: Restrict JIT predictor flush to cBPF
      bpf: Skip redundant IBPB in pack allocator
      bpf: Prefer packs that won't trigger an IBPB flush on allocation
      bpf: Prefer dirty packs for eBPF allocations

 arch/arm64/net/bpf_jit_comp.c        |  4 +--
 arch/loongarch/net/bpf_jit.c         |  2 +-
 arch/powerpc/net/bpf_jit_comp.c      |  4 +--
 arch/riscv/net/bpf_jit_comp64.c      |  2 +-
 arch/riscv/net/bpf_jit_core.c        |  3 +-
 arch/x86/include/asm/nospec-branch.h |  4 +++
 arch/x86/kernel/cpu/bugs.c           | 50 +++++++++++++++++++++++---
 arch/x86/net/bpf_jit_comp.c          |  5 +--
 include/linux/filter.h               | 15 ++++++--
 kernel/bpf/core.c                    | 68 ++++++++++++++++++++++++++++++++----
 kernel/bpf/dispatcher.c              |  2 +-
 11 files changed, 136 insertions(+), 23 deletions(-)
---
base-commit: e46dc0adfe39724bcf52cea47b8f9c9aed86a394
change-id: 20260713-cbpf-jit-spray-hardening-6-18-y-a028879c779c

Best regards,
--  
Pawan



