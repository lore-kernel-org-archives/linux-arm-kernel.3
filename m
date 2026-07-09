Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD914C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 22:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pKPqh8rNQNGDPe0dJo7Bzjfau+DIOrukjSQBqeVYUF8=; b=YAsB8PxYRlt7h9Xa7jLIXHNRVu
	7QT82JP2BWDQwV7bBz1Ll5iq6+GjdPke8Un3rimPcP83POW10N9uXdCzsvH+ilUYL5l+Kd8AzzCCy
	tGZP9a+gS8gVC5KKA74QWtm0V6ThNfiKg5ntnL6co4pOBqfivVjE6O92TkGrauVMdNjAB2poYUxVi
	ehnYGjL02CExzexnCPntHd0iLZu0nTtYUp9SVqnqA8IlmgaxhSZeyRfrzvqLNAy7qSpBGWvTKPPa8
	bJU5orQti5MTngT+90ygM3i/ZbabuxjY5TwQIRuTcrpvRAYcMbc6qNFqZK1gWkhygXu2y03UyzRAu
	EX4UpFng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whx90-00000003lTH-1Rgh;
	Thu, 09 Jul 2026 22:22:58 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whx8y-00000003lSr-0GHn;
	Thu, 09 Jul 2026 22:22:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783635776; x=1815171776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x97uFTIjXkGA6Az31J4eQq5SV3sdoZkgFYZLe5sZj3o=;
  b=RGKl2dGdyr3REkNeEOIXabHBTZWt5cYg8vG+L/xfyE01v8sGtPGa6eEI
   qlw0ofUyZvPPQUd/TMw/0Izs2NAzPdzr14AAfjxVoYeJBz9lfTth+o3Ih
   fqh65RGPlJh/YP/DngxfvNGpd7b7qHlea7z/g2+UcwCtZ1gZh3qzvws/Z
   YrRVsnJeEG4uT97+6qbYAjqaxrqL5eIdSYacsWnytZE0n8K31kwu45KH1
   7wrFf8WnfzLh3XWeEUmWO54S7MXG4U6VSDT5i4Z+CElb57AEbe6CW2sfW
   PxBiN1uwohhwsFLI9Wr4niUwTl2igPaNonuY1iPtIX4jNNoS4/jO/cVJ+
   w==;
X-CSE-ConnectionGUID: +Wy/kwfFT4yE8ZZ9zQATtg==
X-CSE-MsgGUID: v9k98qFrQrOZnyeqq2B14Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109881431"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="109881431"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 15:22:55 -0700
X-CSE-ConnectionGUID: wvvVwSEEQaq78hYluA9Epg==
X-CSE-MsgGUID: iOtP4/thR++qD9bVJxDDWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="256638305"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 15:22:55 -0700
Date: Thu, 9 Jul 2026 15:22:54 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH 7.1.y 0/6] cBPF JIT spray hardening
Message-ID: <20260709-cbpf-jit-spray-hardening-7-1-y-v1-0-5ac5a2d6797f@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIADQeUGoC/yWNsQ6CMBRFf4W82Udaaqy4ERdHBzfj0JZXeAyVt
 GgkhH+36HjuTc5ZIFFkSnAqFoj05sTPkEHuCnC9CR0ht5mhEtVBaFGjs6PHgSdMYzQz9ia2FDh
 0qFHijFYpu1de1pqOkCVjJM+fX+AO1+Z2vmyrLmU5w+P/p5cdyE1bBdb1CwOyz3GSAAAA
X-Change-ID: 20260709-cbpf-jit-spray-hardening-7-1-y-b33b43f197e8
X-Mailer: b4 0.16-dev
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_152256_113778_BB936F47 
X-CRM114-Status: UNSURE (   7.75  )
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

Note: Patches were only build tested on x86 (they applied smoothly without
any conflict).

Thanks,
Pawan

---
Pawan Gupta (6):
      bpf: Support for hardening against JIT spraying
      x86/bugs: Enable IBPB flush on BPF JIT allocation
      bpf: Restrict JIT predictor flush to cBPF
      bpf: Skip redundant IBPB in pack allocator
      bpf: Prefer packs that won't trigger an IBPB flush on allocation
      bpf: Prefer dirty packs for eBPF allocations

 arch/arm64/net/bpf_jit_comp.c        |  4 +--
 arch/loongarch/net/bpf_jit.c         |  5 +--
 arch/powerpc/net/bpf_jit_comp.c      |  4 +--
 arch/riscv/net/bpf_jit_comp64.c      |  2 +-
 arch/riscv/net/bpf_jit_core.c        |  3 +-
 arch/x86/include/asm/nospec-branch.h |  4 +++
 arch/x86/kernel/cpu/bugs.c           | 50 +++++++++++++++++++++++---
 arch/x86/net/bpf_jit_comp.c          |  5 +--
 include/linux/filter.h               | 15 ++++++--
 kernel/bpf/core.c                    | 68 ++++++++++++++++++++++++++++++++----
 kernel/bpf/dispatcher.c              |  2 +-
 11 files changed, 138 insertions(+), 24 deletions(-)
---
base-commit: 199c9959d3a9b53f346c221757fc7ac507fbac50
change-id: 20260709-cbpf-jit-spray-hardening-7-1-y-b33b43f197e8

Best regards,
--  
Thanks,
Pawan



