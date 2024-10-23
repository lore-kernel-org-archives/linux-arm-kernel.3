Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CEBCDDE7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqISrRXha6dSZL8HjHpXJAPtu8HouhGprMPsFki3RbI=; b=xhx7Xq57HSCocyFKdKHxuSeDqG
	F/qSyxgQcXd04z5FU637ZylbFrBKGHZqMLYzNAU9tlwDRbhNHRShY4JgaKPIE1M3MdIEZVgRCaqGa
	bOa1yZPT1JlGjYvfw4r7pLTtRNElCpRNHiubt8VgI8mVtv3pYD+oXMJakPbMoHKLlmSOYAFrr22hG
	rka6PoztwEmO+TD3YvlQNu7O7dBlg9pCjBM5rKjwG4V9EbNXOVMQjSKw4Qwast6n1aVVaOwo0GKs3
	fFk1CnJoMG2WDC/+mm2ji9/ZZJpwY2gxDMBaRg8mNIO9n5PevqnfLAZGtz136pnyEo7qzfvUk/Qdt
	5LI2WW7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dKR-0000000EyFE-3E8W;
	Wed, 23 Oct 2024 15:31:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckP-0000000EpQy-0vEH
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 14:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zqISrRXha6dSZL8HjHpXJAPtu8HouhGprMPsFki3RbI=; b=bg9gfiMv/QlT1OhNOwusGsUtYP
	BSE5QyqhC5dZ/otkz53+i+7ZoeNE/t0OmwRwHPB6Zzwkmq7nVqmw8sw+K91kZBSCW8hV3S6yz+9Rz
	UOu2HrLYsnTJjKfZO+OEgJjgxINYJE0sxNh7gZJ88KiXxdIGSUkdx/Ysm3ifliDKeQvsnGzeSt9t0
	wLzjOpavSgBNXlJePL8fsCGQWdV0y6Xv1NGW99umeP7j0YuroIlufGzYS8eKLfZafjDD6T8kiQki5
	GSjlnwvXMscjVuJj9HrSIj1nUhF4SOdZEzs6C4wSsz1lJSJR98JWA5o+gPEEF8WzHX4Wf8HgGkLCE
	GqWLWlWA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckL-00000008Qd4-17PQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 546A3A44FF7;
	Wed, 23 Oct 2024 14:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5000CC4CEE7;
	Wed, 23 Oct 2024 14:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695235;
	bh=t5+ESdUFFUdCGyZIUjbqtV8WtvkmdsB4SAcVKjsOytc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=efj1SHc8LKdko7sK5Ys9C2HM50c9jxprEC8yM+mPMpB0PnM8b1TdIUvcUz4Q9hJ8P
	 8lfFE8Rh7F1n6yxOX4wfpa4STjaaT5JTbCy/A7Sa09zdUck+EZTd/xAayheIJuE7bA
	 9l8Jm0mS6qFclkH6nf3p0tQqSnNxsOFcyEoQiw5YlvZezTAYigOEPdC80A3JnW/in7
	 KjVdbL7mJ+A+GFPohN2QVAPO3ApkPtOUzh+WGm/ZGVDF3ErsWR+OvxkUuXlmnuwt3g
	 Yx3B7ZLFnLYDGADEHnn+7+/kRt0AvGZolxTVCOYEirF0wpoNCZ4LWqNQsJA96GJoJ3
	 nbixPLD/0f1+g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckD-0068vz-Jz;
	Wed, 23 Oct 2024 15:53:53 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 20/37] KVM: arm64: Disable hierarchical permissions when S1PIE is enabled
Date: Wed, 23 Oct 2024 15:53:28 +0100
Message-Id: <20241023145345.1613824-21-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_155402_148587_7C62ECBF 
X-CRM114-Status: GOOD (  11.60  )
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

S1PIE implicitly disables hierarchical permissions, as specified in
R_JHSVW, by making TCR_ELx.HPDn RES1.

Add a predicate for S1PIE being enabled for a given translation regime,
and emulate this behaviour by forcing the hpd field to true if S1PIE
is enabled for that translation regime.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index adcfce3f67f03..f5bd750288ff5 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -93,6 +93,23 @@ static enum trans_regime compute_translation_regime(struct kvm_vcpu *vcpu, u32 o
 	}
 }
 
+static bool s1pie_enabled(struct kvm_vcpu *vcpu, enum trans_regime regime)
+{
+	if (!kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S1PIE, IMP))
+		return false;
+
+	switch (regime) {
+	case TR_EL2:
+	case TR_EL20:
+		return vcpu_read_sys_reg(vcpu, TCR2_EL2) & TCR2_EL2_PIE;
+	case TR_EL10:
+		return  (__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TCR2En) &&
+			(__vcpu_sys_reg(vcpu, TCR2_EL1) & TCR2_EL1x_PIE);
+	default:
+		BUG();
+	}
+}
+
 static int setup_s1_walk(struct kvm_vcpu *vcpu, u32 op, struct s1_walk_info *wi,
 			 struct s1_walk_result *wr, u64 va)
 {
@@ -186,6 +203,8 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, u32 op, struct s1_walk_info *wi,
 		    (va55 ?
 		     FIELD_GET(TCR_HPD1, tcr) :
 		     FIELD_GET(TCR_HPD0, tcr)));
+	/* R_JHSVW */
+	wi->hpd |= s1pie_enabled(vcpu, wi->regime);
 
 	/* Someone was silly enough to encode TG0/TG1 differently */
 	if (va55) {
-- 
2.39.2


