Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DA2CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 16:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0ZaEKTjPgCaxtREs9/gKrzFrbBFMN/HtD2a6vaPHT4c=; b=rv1EfFNcFeHSgt/SoJ7tkhbOcI
	sek8nxObaY7SWwsQ47ltZvo7sH5eWXIWEINInqxCK0Po/4eFN2aa4yrXkWa3vcOEdp5m+a2Ys+pXP
	B+0dPXnvEXedJgf6HXcuiQ5WKbPmbUkcocHwUPNDK/XM67PKoq9cSNL9+GE5ImnaZMP9/D8GFWO1F
	/iSktNXIM1+fdL46a0nlvpQ6slLtLDluwLb2BJpc0PP8vxW1wcbhNY6v3Y36Gzn4fmPzruQocHYnt
	xF7FO2Rcd4levbv9aZBSnqcHfIqDQ6Lo2JnvydK7Wbz8JcMeSdmE7l/92vVbxSIkC9AbbA/A9twb4
	CRMcNwog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYGt-00000008P9c-0YIP;
	Tue, 16 Sep 2025 16:11:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYGs-00000008P9K-0SNW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 16:11:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36D1E601DF;
	Tue, 16 Sep 2025 16:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A3DC4CEEB;
	Tue, 16 Sep 2025 16:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758039068;
	bh=6wYcoEAkVyvq2dC25L2mVkyq9vs38Lp9ZDtXq0HWe7w=;
	h=From:To:Cc:Subject:Date:From;
	b=d2S0hk89nRZzt0Rrdhps1nN+c0s+Q2s5ODETkt1LUXBQ/BV73MTaPqBpxnNGc3xwJ
	 kl56zC5pSwN1+KqCqRjz8sEC6XCRWvTY8fksR4shlArJNm+QLFuqucQ/s01G7kZ2cB
	 I+FLR3cGg5GrScqGzUsux8kw+TPTFjwp3u2jf0F3S5cVt2e9oBFs4GkCQ2cvzSAgsm
	 JyByURy5ev2ES+czmWVHk8N2YSVVseCCEdOKHgBPI4ziaNr1I5DyMWMNNmngr/cMnb
	 EPQhTL6kQseoN6ToT/rUIHkUxDEeZeYNTKQpE71qrcImgGGhRJ+ilPtM9QJRfSrged
	 h3dakp48Fwf5Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uyYGo-00000006mbe-2kwH;
	Tue, 16 Sep 2025 16:11:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] KVM: arm64: Fix kvm_vcpu_{set,is}_be() to deal with EL2 state
Date: Tue, 16 Sep 2025 17:11:03 +0100
Message-Id: <20250916161103.1040727-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
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

Nobody really cares about BE, but KVM currently only deals with
SCTLR_EL1 when evaluating or setting the endianness in PSCI,
meaning that we evaluate whatever the L2 state has been at some point.

Teach these primitives about SCTLR_EL2, and forget about BE...

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index fa8a08a1ccd5c..85f998dffea5d 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -511,21 +511,29 @@ static inline void kvm_vcpu_set_be(struct kvm_vcpu *vcpu)
 	if (vcpu_mode_is_32bit(vcpu)) {
 		*vcpu_cpsr(vcpu) |= PSR_AA32_E_BIT;
 	} else {
-		u64 sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL1);
+		enum vcpu_sysreg r;
+		u64 sctlr;
+
+		r = vcpu_has_nv(vcpu) ? SCTLR_EL2 : SCTLR_EL1;
+
+		sctlr = vcpu_read_sys_reg(vcpu, r);
 		sctlr |= SCTLR_ELx_EE;
-		vcpu_write_sys_reg(vcpu, sctlr, SCTLR_EL1);
+		vcpu_write_sys_reg(vcpu, sctlr, r);
 	}
 }
 
 static inline bool kvm_vcpu_is_be(struct kvm_vcpu *vcpu)
 {
+	enum vcpu_sysreg r;
+	u64 bit;
+
 	if (vcpu_mode_is_32bit(vcpu))
 		return !!(*vcpu_cpsr(vcpu) & PSR_AA32_E_BIT);
 
-	if (vcpu_mode_priv(vcpu))
-		return !!(vcpu_read_sys_reg(vcpu, SCTLR_EL1) & SCTLR_ELx_EE);
-	else
-		return !!(vcpu_read_sys_reg(vcpu, SCTLR_EL1) & SCTLR_EL1_E0E);
+	r = is_hyp_ctxt(vcpu) ? SCTLR_EL2 : SCTLR_EL1;
+	bit = vcpu_mode_priv(vcpu) ? SCTLR_ELx_EE : SCTLR_EL1_E0E;
+
+	return vcpu_read_sys_reg(vcpu, r) & bit;
 }
 
 static inline unsigned long vcpu_data_guest_to_host(struct kvm_vcpu *vcpu,
-- 
2.39.2


