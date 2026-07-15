Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA40AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 21:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GTlIlgSZPByv4eAEE2x71p1IKay+EOZkljJXLymjOJM=; b=nPzT4WQkZpJ6k784T6+HxQY0oP
	KNmKbeO98vbx+iTaCafRIXb8P7HEilSUR2eOWeYpFGAlDCdpJWSUzmuC4u3cLV4xgP4k/bFZuCiDu
	mMAILjsN8B+ZhWw23R2O7ZRd/npWlugJBrgz2V/MDM/7us3Jxlu7NodzMbi3emFOKOfy7iZKLflrW
	QlZ59Cm86FRdHclS8aGV88xs9+5uJP5SY/7O7OKuDleTZ+Bz0qP9Jt7mxCOqiLY5MJrZCpeO9vfUz
	FITGdY1FjdYhtBDzpM1X9amstVJQNSgbZoGdlYcmrTqMNSOC8A/dt4ae46Vwq5AKfK1F+bQU79lv8
	EIyySaIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk78q-0000000FwEI-3GKI;
	Wed, 15 Jul 2026 21:27:44 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk78o-0000000FwDq-2Lqa;
	Wed, 15 Jul 2026 21:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784150862; x=1815686862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zcl/hJP8vOoXfaWvVzA1OXL0SRddDjKbhCcj2uRFlLk=;
  b=f+3p8oseEw5wdVo/QUWjEllLEaG5eLZaZaqeao+DLoF5L546Rphu+nIF
   NLnwKaH/aqvEcrvxZmfdd4JtaJS9Y/8FwBLj9xDNS6M7Cqhii7akdQKCw
   nn/V57ehoSWSRB8B1/dtM6R1aOq/6Sdf0GlPDQb8VWai2N/KLcMPGIiQg
   H+1AqhHk/eZ3C9CclsilWRvBMf6tobDNra3i+R4inQps5lKo7nSVhzKD6
   fMcoaOypsWOHAvvUh0oXm2LdLf5tcz8566tvx2nZuKMt5ulTHNfxQ0RKW
   72A3iSLanAzl0d/oXpX/5H0ZpuPVBB0NuFeG3maSv5kulbtWyIypkh7Cq
   Q==;
X-CSE-ConnectionGUID: TcJHK9HORPOcyGCmWkYR7A==
X-CSE-MsgGUID: aTzA1LnhQSy/FHk2JZGBjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88481980"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="88481980"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 14:27:39 -0700
X-CSE-ConnectionGUID: r4pyfzu7Q7+IwAqhuwZT7A==
X-CSE-MsgGUID: c+t89wMuTT2M218KSPaJIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="286384073"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 14:27:40 -0700
Date: Wed, 15 Jul 2026 14:27:39 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH 6.12.y 0/6] cBPF JIT spray hardening
Message-ID: <20260715-cbpf-jit-spray-hardening-6-12-y-v1-0-d8585a9aed80@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIAPf6V2oC/yWNsQ6CMBRFf4W82UdoIwXciIujg5txKOUBj6E2L
 Robwr9bdDw3N+esEMgzBThlK3h6c+CnTSAOGZhJ25GQ+8QgC6mKShzRdG7AmRcMzuuIk/Y9WbY
 jKhQSI6qmFKYuha6aGpLFeRr48yvc4drezpd9VbmQeYTH/xBe3Uxm2TuwbV9vroONlAAAAA==
X-Change-ID: 20260714-cbpf-jit-spray-hardening-6-12-y-6951c851a798
X-Mailer: b4 0.16-dev
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_142742_669707_877368C0 
X-CRM114-Status: UNSURE (   7.58  )
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

Conflicts resolved in patch 2 and 3.

---
Pawan Gupta (6):
      bpf: Support for hardening against JIT spraying
      x86/bugs: Enable IBPB flush on BPF JIT allocation
      bpf: Restrict JIT predictor flush to cBPF
      bpf: Skip redundant IBPB in pack allocator
      bpf: Prefer packs that won't trigger an IBPB flush on allocation
      bpf: Prefer dirty packs for eBPF allocations

 arch/arm64/net/bpf_jit_comp.c        |  4 +--
 arch/powerpc/net/bpf_jit_comp.c      |  2 +-
 arch/riscv/net/bpf_jit_comp64.c      |  2 +-
 arch/riscv/net/bpf_jit_core.c        |  3 +-
 arch/x86/include/asm/nospec-branch.h |  4 +++
 arch/x86/kernel/cpu/bugs.c           | 50 +++++++++++++++++++++++---
 arch/x86/net/bpf_jit_comp.c          |  5 +--
 include/linux/filter.h               | 15 ++++++--
 kernel/bpf/core.c                    | 68 ++++++++++++++++++++++++++++++++----
 kernel/bpf/dispatcher.c              |  2 +-
 10 files changed, 134 insertions(+), 21 deletions(-)
---
base-commit: 296aabce459470a4c1b68ffd0c0c0920e563aaad
change-id: 20260714-cbpf-jit-spray-hardening-6-12-y-6951c851a798

Best regards,
--  
Pawan


