Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D34D5CCA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8BbHaQqEaGJI9Z+JtmRuvby/1QRfWpn6PUIdv4L+s6I=; b=lsbf9lM9rS8dru4l3yTh/Mfsst
	RQb8hGFZRUBFM3U/CLlA/+DRE5cA6SvFExuUfUpvEeSQC4b0sOWU9Hwpww/y6kTSYBq4gy2yLlmif
	acOVwFjaBgufj0FT1+0SB4YYT1i/oDsne3ArYtmH1WbhSNdy+np9YlZRSMiRvvqNhpyIrbjEhp1wM
	CUFDLfyYF5RUjBjaYYK6j09aDplrPVpCP2Lk/luicAIZy0WC5RxJv4syxdb/xrdnFwOSEfhyPI3FZ
	SMfvcD2ZYu1WeudkhHhAV5Vnj8o747lC4Eohrga1WkQ1I94zNyGRXe/T2r4ARjgwT0DPSx12ba6SQ
	WDO58TQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSKv-000000052TX-3Yaw;
	Tue, 16 Dec 2025 10:31:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSKt-000000052SS-0KLC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 10:31:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25208FEC;
	Tue, 16 Dec 2025 02:31:10 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEFD23F694;
	Tue, 16 Dec 2025 02:31:15 -0800 (PST)
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
Subject: [PATCH v3 0/4] KVM: arm64: pKVM fixes
Date: Tue, 16 Dec 2025 10:30:49 +0000
Message-ID: <20251216103053.47224-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_023119_150234_093752ED 
X-CRM114-Status: UNSURE (   8.59  )
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

v2 can be found at [1].

Similar to [2], when trying to run an unprotected VM on FVP with S1PIE enabled
and kvm-arm.mode=protected, writes to PIRE0_EL1 made by the guest in
__cpu_setup() are trapped by KVM and the BUG_ON(!r->access) is hit. That's
because HFGWTR_EL2.nPIRE0_EL1 is an inverse polarity trap and the FGT values for
the unprotected pKVM VCPU weren't being propagated from kvm_arch_vcpu_load().

Couldn't figure out how to run a protected pKVM VM, so that's untested.

Changelog v2->v3:
* Gathered Reviewed-by tags, thanks!
* In patch #2, KVM now calls bad_trap() instead of KVM_BUG(). Also changed patch
  subject to match.

[1] https://lore.kernel.org/kvmarm/20251215114409.212512-1-alexandru.elisei@arm.com/
[2] https://lore.kernel.org/all/20251112102853.47759-1-alexandru.elisei@arm.com/

Alexandru Elisei (4):
  KVM: arm64: Copy FGT traps to unprotected pKVM VCPU on VCPU load
  KVM: arm64: Inject UNDEF for a register trap without accessor
  KVM: arm64: Remove extra argument for __pvkm_host_{share,unshare}_hyp()
  KVM: arm64: Remove unused parameter in synchronize_vcpu_pstate()

 arch/arm64/kvm/hyp/include/hyp/switch.h | 2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      | 3 +++
 arch/arm64/kvm/hyp/nvhe/pkvm.c          | 1 -
 arch/arm64/kvm/hyp/nvhe/switch.c        | 2 +-
 arch/arm64/kvm/hyp/vhe/switch.c         | 2 +-
 arch/arm64/kvm/mmu.c                    | 4 ++--
 arch/arm64/kvm/sys_regs.c               | 5 ++++-
 7 files changed, 12 insertions(+), 7 deletions(-)


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.52.0


