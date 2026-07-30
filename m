Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C971AC54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5q7g0Tr+SZI10mLKtzVtO1D8rNE5+dliITwvOUWOnk=; b=0NkFqvTwznckBhUyxZSfrp/fkW
	RLlkIU8qdteLbf5MIA51n9Pp0yKp2jFeJ+bvCy2dxmSzGEU7m16qUQAxy0XR9wUXxydCDIxB/Ov+b
	So00xuHHnJWq0vdMXZWacMO/CMbSxVBBfZHv4lvzoKlMux3ktcIPm6p5Ge5oTBVreQLP9FE4Alyz4
	C3Iaa+9L/RE+zwP0xoGDd/2ZylwI5xn+EJ4jmSvYkTOPYa+5j8blZYWA+ECQcOkzu6EUvcpNZ6ufH
	jdRHLtSz6AjCRY0LgKoxM+QBwYusXdO73Nl+bGTOx+HqlebBeXmJPbB4kSmr+sHEPmmnxjisScSMP
	rPv8Yt/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKvZ-00000009gi7-3Ott;
	Thu, 30 Jul 2026 07:11:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKur-00000009gNU-3yIH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:10:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AF220419D6;
	Thu, 30 Jul 2026 07:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B00D1F0155D;
	Thu, 30 Jul 2026 07:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395453;
	bh=c5q7g0Tr+SZI10mLKtzVtO1D8rNE5+dliITwvOUWOnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EpHQ5fJNOZiy/x1XyD2zTqwYkkGWW6roZBeLZJBcYgB+pvfd8//crvrVkVcJTqZ3J
	 MxdcpXwJO2O6uTHBbOCnfCgynxop/6So3eklO/URS/gCS8nR4I+CuR1FSgvFgim0t3
	 aN5XpRiK1m+cNvjuaQsGn2HqKPfHWPAehemgSjct/wsypCVIfZQ+ApxqC7q50hQtS3
	 O5uUZwkwjDe3Lmm5DzYj3Fz6Jke113Y4RwH6RmCxcXS9E14zF5PSM3MEP4f302Psp4
	 i+BxS5FYCuZCdKuxgtPXuGcwZWPYL32wPZVyUAzQoLeBseW5NHBzTn1K2Be69frD62
	 dn7hhKDfa3VqA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wpKup-0000000AOpW-3gmO;
	Thu, 30 Jul 2026 07:10:51 +0000
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
Subject: [PATCH v4 16/29] KVM: arm64: Split NV-specific exit fixups from the non-NV handling
Date: Thu, 30 Jul 2026 08:10:09 +0100
Message-ID: <20260730071022.296811-17-maz@kernel.org>
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

In order to facilitate further changes, move the NV handling of
early fixups in its own helper. This also makes the code slightly
simpler to parse.

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vhe/switch.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index a8da40568a048..53af19212895d 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -539,18 +539,15 @@ static const exit_handler_fn hyp_exit_handlers[] = {
 	[0x3F]				= kvm_hyp_handle_impdef,
 };
 
-static inline bool fixup_guest_exit(struct kvm_vcpu *vcpu, u64 *exit_code)
+static void fixup_nv_guest_exit(struct kvm_vcpu *vcpu)
 {
-	synchronize_vcpu_pstate(vcpu);
-
 	/*
 	 * If we were in HYP context on entry, adjust the PSTATE view
 	 * so that the usual helpers work correctly. This enforces our
 	 * invariant that the guest's HYP context status is preserved
 	 * across a run.
 	 */
-	if (vcpu_has_nv(vcpu) &&
-	    unlikely(host_data_test_flag(VCPU_IN_HYP_CONTEXT))) {
+	if (unlikely(host_data_test_flag(VCPU_IN_HYP_CONTEXT))) {
 		u64 mode = *vcpu_cpsr(vcpu) & (PSR_MODE_MASK | PSR_MODE32_BIT);
 
 		switch (mode) {
@@ -567,8 +564,15 @@ static inline bool fixup_guest_exit(struct kvm_vcpu *vcpu, u64 *exit_code)
 	}
 
 	/* Apply extreme paranoia! */
-	BUG_ON(vcpu_has_nv(vcpu) &&
-	       !!host_data_test_flag(VCPU_IN_HYP_CONTEXT) != is_hyp_ctxt(vcpu));
+	BUG_ON(!!host_data_test_flag(VCPU_IN_HYP_CONTEXT) != is_hyp_ctxt(vcpu));
+}
+
+static bool fixup_guest_exit(struct kvm_vcpu *vcpu, u64 *exit_code)
+{
+	synchronize_vcpu_pstate(vcpu);
+
+	if (vcpu_has_nv(vcpu))
+		fixup_nv_guest_exit(vcpu);
 
 	return __fixup_guest_exit(vcpu, exit_code, hyp_exit_handlers);
 }
-- 
2.47.3


