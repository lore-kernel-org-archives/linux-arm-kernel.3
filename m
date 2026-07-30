Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCD8C5516B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9+ykDGTeX7ssPXU6PioVfASuLM5szFW8JhODOwghig=; b=ZkTyJFtzzYsP+IRvVmy2uelG9S
	7Prs23DSe9+Yc/bsdsyRFlHXVZI6gQfhXfOqlySo3UYyMpVLjwlURQ575zOJh3AHzPi/qzow0yhtY
	N9moeSbG6PJKyUa8eNoS4fmVxvXyZKlnUAGTQFmh4jwNLsZ/qNfXcMM3q+xHl1PghB8+breeCtqvn
	uHzttzgbW8xiQbN+XRHhVMS+tRvuxr+aQNty4GBuA4Q4nKEKfSWmCi8s7mekDQzy/NH78Ld6AI26D
	2218mOwOukXjz8ZFTG7pNcljlxYZQplFV14Q8VZRdiwUyMYZrcvlUDIB0EEhPDBV+6LF1qNSP7UDk
	WkSn8K8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKvY-00000009gfH-1pkQ;
	Thu, 30 Jul 2026 07:11:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKuq-00000009gKs-210a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:10:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C38C5600AB;
	Thu, 30 Jul 2026 07:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B21C1F00ACF;
	Thu, 30 Jul 2026 07:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395451;
	bh=G9+ykDGTeX7ssPXU6PioVfASuLM5szFW8JhODOwghig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GC5jL5Yvk3BBNxpeTcyUiE43rRWpQGTSSZXneAYATTMu78kPRAkabECkPXFd/hZJg
	 XbNkATTY/QzRuwSZbY/CElX45F2sd7igxN2sKrl6jAoH/6cFFGo22lW0IiQVK7L7ak
	 d0ZO7pk3/ceq9ovY8X54Qr33YMBXyOgj4sOVmt9Gx/P8NWxZ8qNb7wpI5RgAQjZeYX
	 oulSL2Fyk5L8kFMCAIGXt9s+sZmwaIQ8L+4Mf9XJuDKFfO9ng/YMWr5E6Sisa5OoQo
	 WjYE7Hae8/EhMDj2+uA5xwCO7gTCcYXWcEtazsQH7cnVur3D4UJuC5s2Wz4xGsb9Ng
	 1I9D+etpVw71A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wpKun-0000000AOpW-3bIa;
	Thu, 30 Jul 2026 07:10:49 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>
Subject: [PATCH v4 07/29] KVM: arm64: Don't evaluate HCR_EL2.NV nor HFGITR_EL2.ERET on ERET fast path
Date: Thu, 30 Jul 2026 08:10:00 +0100
Message-ID: <20260730071022.296811-8-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730071022.296811-1-maz@kernel.org>
References: <20260730071022.296811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, yaoyuan@linux.alibaba.com, weilin.chang@arm.com, vladimir.murzin@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

We currently avoid using the ERET fast path if the guest has HCR_EL2.NV
set. This is an odd check, as NV doesn't mean much if HCR_EL2.TGE==1.

Similarly, evaluating HFGITR_EL2.ERET makes little sense, as
this only applies to the nested context, while the ERET fast-path
is purely for the benefit of L1.

Replace these bizarre checks with is_nested_ctxt() which makes a lot
more sense: if we are running an L2, the ERET trap must go to L1.

Fixes: dd0717a998f77 ("KVM: arm64: nv: Fast-track 'InHost' exception returns")
Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vhe/switch.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index bbe9cebd3d9d5..684cebf23aa0e 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -344,13 +344,15 @@ static bool kvm_hyp_handle_eret(struct kvm_vcpu *vcpu, u64 *exit_code)
 	 * if this is a VHE guest hypervisor returning to its own
 	 * userspace, or the hypervisor performing a local exception
 	 * return. No need to save/restore registers, no need to
-	 * switch S2 MMU. Just do the canonical ERET.
+	 * switch S2 MMU. Just do the canonical ERET unless we are in
+	 * nested context.
 	 *
-	 * Unless the trap has to be forwarded further down the line,
-	 * of course...
+	 * Note that this is made possible because KVM itself never traps
+	 * ERET when running an L2. The consequence is that any ERET trap is
+	 * the result of HCR_EL2 or HFGITR_EL2 programming by L1 for its own
+	 * guest, and the exception must be forwarded to L1.
 	 */
-	if ((__vcpu_sys_reg(vcpu, HCR_EL2) & HCR_NV) ||
-	    (__vcpu_sys_reg(vcpu, HFGITR_EL2) & HFGITR_EL2_ERET))
+	if (is_nested_ctxt(vcpu))
 		return false;
 
 	spsr = read_sysreg_el1(SYS_SPSR);
-- 
2.47.3


