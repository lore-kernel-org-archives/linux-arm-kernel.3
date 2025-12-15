Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1A1D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 11:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JL9UB6z81OZXKfU7HdmNcqYBkLgo10HifxJvvGjcdQg=; b=NB8+tSTWuewhFz97K4m+XFARVa
	WV2UeVCKsYnh6Qo6KCh8YshdSX3dIW/Cl3X9eEO+v3tdqHL/VBtWyQi9wQ4T3vhKsCNV8rfJlA+D7
	UiI/IUFUjpxeV4AcLiw5+QKStf6rjikFQ9tof1EBUuwaaNhMF7h6X1j35ag9b39d9VL5ytk6bON27
	eb9qs/fxWLU5midMS0I1ciI3H28qWmY84a7PR20hgy2UxhkVGXi9yd9xZeCXDDL3u+2M/gwgA9ckv
	DV1Q/r35fsasXMpCUEaBZrKZ2Y/s5ZRTT7G7Ib6MyXRKWpJpkewP66AnHv1UsBHiibP5vmvxS0OM/
	F81/QacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV70B-00000003XyB-0YPI;
	Mon, 15 Dec 2025 11:44:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV708-00000003Xwh-2XOm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 11:44:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43C1B497;
	Mon, 15 Dec 2025 03:44:17 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 930783F73B;
	Mon, 15 Dec 2025 03:44:22 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	qperret@google.com,
	will@kernel.org,
	tabba@google.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH v2 0/4] KVM: arm64: pKVM fixes
Date: Mon, 15 Dec 2025 11:44:05 +0000
Message-ID: <20251215114409.212512-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_034428_942633_CA49EFBC 
X-CRM114-Status: GOOD (  12.28  )
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

v1 can be found at [1].

Similar to [2], when trying to run an unprotected VM on FVP with S1PIE enabled
and kvm-arm.mode=protected, writes to PIRE0_EL1 made by the guest in
__cpu_setup() are trapped by KVM and the BUG_ON(!r->access) is hit. That's
because HFGWTR_EL2.nPIRE0_EL1 is an inverse polarity trap and the FGT values for
the unprotected pKVM VCPU weren't being propagated from kvm_arch_vcpu_load().

Couldn't figure out how to run a protected pKVM VM, so that's untested.

New in this iteration is #2 ("KVM: arm64: Print register encoding if there's no
accessor") because I realized that the first thing I did when I hit the
BUG_ON(!r->access) (for this series and for the fix at [2]) was to print the
encoding for the register.  Thought that it might be more useful in the future
to do this by default.

Patch #4 ("KVM: arm64: Remove unused parameter in synchronize_vcpu_pstate()") is
also new - found it by code inspection while debugging something unrelated.

Changelog
=========

v1->v2:
* Rebased on top of v6.19-rc1.
* Added tags to patch #1 ("KVM: arm64: Copy FGT traps to unprotected pKVM
  VCPU on VCPU load") - thanks!
* Removed local variables 'hyp_kvm_vcpu' and 'host_vcpu' in patch #1.
* Patch #2 and #4 are new.
* Patch #3 ("KVM: arm64: Remove extra argument for
  __pvkm_host_{share,unshare}_hyp()") now properly fixes
  __pkvm_host_unshare_hyp().

[1] https://lore.kernel.org/kvmarm/20251210132102.137631-1-alexandru.elisei@arm.com/
[2] https://lore.kernel.org/all/20251112102853.47759-1-alexandru.elisei@arm.com/

Alexandru Elisei (4):
  KVM: arm64: Copy FGT traps to unprotected pKVM VCPU on VCPU load
  KVM: arm64: Print register encoding if there's no accessor
  KVM: arm64: Remove extra argument for __pvkm_host_{share,unshare}_hyp()
  KVM: arm64: Remove unused parameter in synchronize_vcpu_pstate()

 arch/arm64/kvm/hyp/include/hyp/switch.h | 2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      | 3 +++
 arch/arm64/kvm/hyp/nvhe/pkvm.c          | 1 -
 arch/arm64/kvm/hyp/nvhe/switch.c        | 2 +-
 arch/arm64/kvm/hyp/vhe/switch.c         | 2 +-
 arch/arm64/kvm/mmu.c                    | 4 ++--
 arch/arm64/kvm/sys_regs.c               | 8 +++++++-
 7 files changed, 15 insertions(+), 7 deletions(-)


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.52.0


