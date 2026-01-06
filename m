Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F49CEFCE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9Qd0+RsmH+HfMtVlFYK0s3pDDSnL2o5U6ZHRPSJMqg=; b=RgdWcpoii3hhgHuJxQu2dv3J16
	FeqPVsSZ4b8nGKu4SipX1Cse3sAzTkAePdQ8dzIlufCT348/VwyHl1bK99u09xsDSJNaoL/4jKbep
	4PyjFZmyt/e45nJhvo2ZT/pcT8zhujHf5TfIMl4uIFqgG896ik5eBBAzh66qrROac1bN4yyDBCgWD
	c1NNRjHZIZMQQeVscMyCT9EDnkYAjwFtzSeFdKjgH1wIpKufNrfpg+21j4c3GKcZ+E+YgldfzQWo8
	umJxTcb0brnxHBlybjPIqRmk/71IB8bAEZQskMHQpPka1v6r8c9hoJd5BSGoHEsLmVY5MgCKo3T3I
	TiaC+NKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAzn-0000000Da4l-2vs0;
	Tue, 06 Jan 2026 17:37:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAzk-0000000Da38-3EvE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:37:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1C301595;
	Tue,  6 Jan 2026 09:37:15 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 209E63F5A1;
	Tue,  6 Jan 2026 09:37:20 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	tabba@google.com,
	will@kernel.org
Subject: [PATCH 1/3] KVM: arm64: Fix comment in fpsimd_lazy_switch_to_host()
Date: Tue,  6 Jan 2026 17:37:05 +0000
Message-Id: <20260106173707.3292074-2-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260106173707.3292074-1-mark.rutland@arm.com>
References: <20260106173707.3292074-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_093724_845583_8EECEF28 
X-CRM114-Status: GOOD (  11.42  )
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

The comment in fpsimd_lazy_switch_to_host() erroneously says guest traps
for FPSIMD/SVE/SME are disabled by fpsimd_lazy_switch_to_guest(). In
reality, the traps are disabled by __activate_cptr_traps(), and
fpsimd_lazy_switch_to_guest() only manipulates the SVE vector length.

This was mistake; I accidentally copy+pasted the wrong function name in
commit:

  59419f10045b ("KVM: arm64: Eagerly switch ZCR_EL{1,2}")

Fix the comment.

Fixes: 59419f10045b ("KVM: arm64: Eagerly switch ZCR_EL{1,2}")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index c5d5e5b86eaf0..8dce3da85da35 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -495,7 +495,7 @@ static inline void fpsimd_lazy_switch_to_host(struct kvm_vcpu *vcpu)
 	/*
 	 * When the guest owns the FP regs, we know that guest+hyp traps for
 	 * any FPSIMD/SVE/SME features exposed to the guest have been disabled
-	 * by either fpsimd_lazy_switch_to_guest() or kvm_hyp_handle_fpsimd()
+	 * by either __activate_cptr_traps() or kvm_hyp_handle_fpsimd()
 	 * prior to __guest_entry(). As __guest_entry() guarantees a context
 	 * synchronization event, we don't need an ISB here to avoid taking
 	 * traps for anything that was exposed to the guest.
-- 
2.30.2


