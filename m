Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDBDC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 14:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Txs9DV0oGu7TMtbUDZqDz+8dQ7HwLvd721pG0OMdow=; b=0BJEu8MUG6MtXCYqvbBpLn437T
	fVwqAvAgUyHpDNTBbNns5tGxcNYZT+YjzyF/p+ir2GlXqqfs+einEJ1/dyIt75/VDxH3k4l8YMim9
	mAqC6WinaTQVkBwxNQGO+idh3bpbWRvbeZuxtRuZU6XrUVzrEhITS4eMarbhyV5T6k6KbJ6xZWapk
	jSXePnw82Cmb1cE2ZDbi6i5qy/DCqEjhc5LcOr4EFix0FoAVfViRNC1U2eTh+36SJOaEb3nVXpUpI
	64tUQl2UIoupWkiq9V4eIn8oszgVjSckifhbikADX+Wu7B78PIgXpw4x42z5uPfmCUDKu+oP1gyqQ
	Dajtp2dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnzyU-00000001F8R-1vps;
	Sun, 26 Jul 2026 14:37:06 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnzyK-00000001F5w-3JEs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 14:36:58 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785076611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Txs9DV0oGu7TMtbUDZqDz+8dQ7HwLvd721pG0OMdow=;
	b=mm+iU81yoKpcrY+JyzumBbqktAVlUrC0xGPhsIujUHCotEjaLhECnX2q47HzOLpKAB7b6m
	3JDDDbj0T5vt+mCuC5PFv79SihSfVARRhmDQItVmBPkQK0TXC7rhkbgOUrk29eKCSbz2ra
	Cfj8amWxpTbSOTWUx+CwAylRNjupnck=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tabba@google.com
Subject: [PATCH 1/2] KVM: arm64: Flush external_mdscr_el1 to the pKVM hyp vCPU
Date: Sun, 26 Jul 2026 15:36:42 +0100
Message-Id: <20260726143643.303456-2-fuad.tabba@linux.dev>
In-Reply-To: <20260726143643.303456-1-fuad.tabba@linux.dev>
References: <20260726143643.303456-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_073656_966197_3588E3C5 
X-CRM114-Status: GOOD (  10.54  )
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

flush_debug_state() propagates the guest's debug_owner and the
owner-selected debug register state to the hyp vCPU, but not
external_mdscr_el1. While the host owns the debug registers, the world
switch loads MDSCR_EL1 from external_mdscr_el1 (ctxt_mdscr_el1()),
where the host's KDE/MDE/SS bits live. A non-protected guest under
KVM_GUESTDBG_USE_HW or single-step therefore runs with MDSCR_EL1.MDE/SS
clear in hardware, and its watchpoints, breakpoints and single-step
never fire.

Propagate external_mdscr_el1 to the hyp vCPU alongside the host-owned
debug state.

Fixes: 4ad3a0b87f2ec ("KVM: arm64: Don't hijack guest context MDSCR_EL1")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index d3c69de698f48..104026ee70e80 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -108,10 +108,16 @@ static void flush_debug_state(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	hyp_vcpu->vcpu.arch.debug_owner = host_vcpu->arch.debug_owner;
 
-	if (kvm_guest_owns_debug_regs(&hyp_vcpu->vcpu))
+	if (kvm_guest_owns_debug_regs(&hyp_vcpu->vcpu)) {
 		hyp_vcpu->vcpu.arch.vcpu_debug_state = host_vcpu->arch.vcpu_debug_state;
-	else if (kvm_host_owns_debug_regs(&hyp_vcpu->vcpu))
+	} else if (kvm_host_owns_debug_regs(&hyp_vcpu->vcpu)) {
 		hyp_vcpu->vcpu.arch.external_debug_state = host_vcpu->arch.external_debug_state;
+		/*
+		 * The world switch loads MDSCR_EL1 from external_mdscr_el1
+		 * (ctxt_mdscr_el1()).
+		 */
+		hyp_vcpu->vcpu.arch.external_mdscr_el1 = host_vcpu->arch.external_mdscr_el1;
+	}
 }
 
 static void sync_debug_state(struct pkvm_hyp_vcpu *hyp_vcpu)
-- 
2.39.5


