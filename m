Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F232C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 15:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L7jTzp4SxXCA62VuC8L3J5EV6+jaR8SdSCT9N//bbZ8=; b=y9E5jv26IxgEEbPbNwgVAieBp5
	sOSRc4KkEE5rXB6nMJPUanZz3CZMx974H31ZihKGu85SrwcxRPQ/wrh08W5guGewAN6kASElY6ejG
	YAPhY8ySyMTi56Q+jgbkLy2SZ7nFVXwHLvc3cFU4fnl+um+UOecCpLcKT7Nuo7FYvEAHJW83kLsvK
	gigi88vIrs15TLHuNX3XWQ9B1TTMOUtVdSjXl8b0vYx9X8UG6LKSqOXaMKN3U3+Z0aa8GSY5ZhNoo
	aTHSLHgaOqaVoSCVSXQIWSwzjs8yR+lI8lKNO0SdBjrJPtVWvFN6iMdNktYV6+MVkCRNfldYOXLUJ
	uBU6exkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJj5-00000000HaV-0Yuu;
	Sat, 15 Feb 2025 15:05:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJgC-00000000H1I-057k
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 15:02:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5458A5C53A5;
	Sat, 15 Feb 2025 15:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746EBC4CEDF;
	Sat, 15 Feb 2025 15:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739631722;
	bh=ztYsTcmEp65UD5hR3GQ0KqCG/eVGKXg7wIbh2cUt5FA=;
	h=From:To:Cc:Subject:Date:From;
	b=RkPXFrhECFqLjv3nIdr5MupxnYwBX++dQ6yGvj2bQXoodVHrwUrl9W7bNubgKelEx
	 yzp6sMf4rdPthZMOc3+flf5sa6Wwu2eqYfT0dL7G27hr/4n0BhribMUb49rcIURuis
	 8ddaql3Ykqdc3V4vjmlUIJqzNXC4Iwm+DG9JZf3VU4lTqf4C7mF0UdbUUaUCezXI+u
	 kjvGZLvigbcinpjGJlTDCbUmayDYE9jD+T2ZT6aTHid4e+TQEHcK21nlszJGJIsM9E
	 EoaU+a8mPnOX7RtWfIax9XAfRM0OrDHrT8pWaniwyqB/FQ3mSiuCUkj0CGj9DGILLO
	 TDU+5Dvfn98KQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjJg8-004Nz6-3b;
	Sat, 15 Feb 2025 15:02:00 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 00/14] KVM: arm64: Recursive NV support
Date: Sat, 15 Feb 2025 15:01:20 +0000
Message-Id: <20250215150134.3765791-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_070204_176296_B5F768DE 
X-CRM114-Status: GOOD (  15.45  )
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

This is probably the most interesting bit of the whole NV adventure.
So far, everything else has been a walk in the park, but this one is
where the real fun takes place.

With FEAT_NV2, most of the NV support revolves around tricking a guest
into accessing memory while it tries to access system registers. The
hypervisor's job is to handle the context switch of the actual
registers with the state in memory as needed.

This memory (which we call the VNCR page) lives at an EL2 VA, and is
therefore accessed out of context by the EL1 guest hypervisor.

So far, so good. But what does it mean to virtualise VNCR itself?

It means that when L1 has a prepared a VNCR page for L2, we must map
it in the L0 EL2, and allow L2 to magically access it. Isn't that fun?
To some extent. But there's more!

Having that L0 mapping on behalf of L1 comes with strings attached. It
means that we must be prepared for this page to become inaccessible,
which can happen for a variety of reasons:

- paged out from the host (MMU notifiers)

- unmapped from L1 EL2 stage-1

- permission changes in L1 EL2 stage-1

And in case you're wondering, yes, all of these have TLB invalidation
in common. That's because performing this mapping is akin to
allocating a "SW managed" TLB for L1's VNCR page.

This is what the bulk of this series is about: TLB management for VNCR
pages, and making sure we have the correct page at the right time.

From an implementation perspective, it isn't that complicated, as it
plugs into the existing NV artillery (TLBI, AT, MMU notifiers). Of
course, nothing is optimised, because we're not at this stage yet. I
have plans to make this better (i.e. fewer TLBIs, which implies fewer
traps when nesting), but that's future work.

But this is functional enough that I can run an L4 guest on my QC
box. Slowly.

Patches on top of -rc2. The full integration is, as always, in my
kvm-arm64/nv-next branch.

Marc Zyngier (14):
  arm64: sysreg: Add layout for VNCR_EL2
  KVM: arm64: nv: Allocate VNCR page when required
  KVM: arm64: nv: Extract translation helper from the AT code
  KVM: arm64: nv: Snapshot S1 ASID tagging information during walk
  KVM: arm64: nv: Move TLBI range decoding to a helper
  KVM: arm64: nv: Don't adjust PSTATE.M when L2 is nesting
  KVM: arm64: nv: Add pseudo-TLB backing VNCR_EL2
  KVM: arm64: nv: Add userspace and guest handling of VNCR_EL2
  KVM: arm64: nv: Handle VNCR_EL2-triggered faults
  KVM: arm64: nv: Handle mapping of VNCR_EL2 at EL2
  KVM: arm64: nv: Handle VNCR_EL2 invalidation from MMU notifiers
  KVM: arm64: nv: Program host's VNCR_EL2 to the fixmap address
  KVM: arm64: nv: Add S1 TLB invalidation primitive for VNCR_EL2
  KVM: arm64: nv: Plumb TLBI S1E2 into system instruction dispatch

 arch/arm64/include/asm/esr.h        |   2 +
 arch/arm64/include/asm/fixmap.h     |   6 +
 arch/arm64/include/asm/kvm_host.h   |  13 +
 arch/arm64/include/asm/kvm_nested.h | 100 +++++
 arch/arm64/include/asm/sysreg.h     |   1 -
 arch/arm64/kvm/arm.c                |   6 +
 arch/arm64/kvm/at.c                 | 123 +++---
 arch/arm64/kvm/handle_exit.c        |   1 +
 arch/arm64/kvm/hyp/vhe/switch.c     |  47 ++-
 arch/arm64/kvm/nested.c             | 608 +++++++++++++++++++++++++++-
 arch/arm64/kvm/reset.c              |   2 +
 arch/arm64/kvm/sys_regs.c           | 135 +++---
 arch/arm64/tools/sysreg             |   6 +
 13 files changed, 921 insertions(+), 129 deletions(-)

-- 
2.39.2


