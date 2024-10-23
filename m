Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5663CCF539E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7hDCXGvpPSRvXfx8E3NrcEHOUhldGxyiNYJHXPFWd8=; b=Dy1JU2+y4+S9aE4uI5Lxvbm2r7
	kXVIsBKRnWhDOImJ0hAUdkKG/5R4nLcmMenHdbc8AXiNAoNcxk49X0wFOhukb8XcHTiFt0Xrf33jH
	NMslROsQS/jkFdvBiTYf17UzKLGxG3aYea03fgbEng1svhW64fflfGKmpf00S9lOdRV5Cwl4Bh5Rp
	v+6ySBDjY6rHg8VAQjnQDauzKIrhZ50Y8g2GqLdpWAOlCDCmXOVgNqxkNb5GFeR3U21LA63ctwYxI
	wTLeqbzLyvHX1Rrd5gYbDPXQBUm7KwE7RijPfm1ixMk9iVlIkApVs5ZkmDaRZ9nIneE25M6WxW0Ye
	k2+w9JHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3d6t-0000000Eux2-2tWd;
	Wed, 23 Oct 2024 15:17:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckH-0000000EpL2-2ucx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6FD87A45039;
	Wed, 23 Oct 2024 14:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B7EC4CEC6;
	Wed, 23 Oct 2024 14:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695234;
	bh=uJ4Rms5/TwwuLBnZE1CwoSIgCLvL2ISzaxDlkow7KA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jlUVfOdNyPY/qOawWIZvhAV90nbCbqna/z9BqryZaqBSAz4FVOtQRANHmDx9riq5c
	 ICQk+6GljfWtfxWEKmKLfn+IIXVtnyXoOr4s5pzVIX6QLmSQzzyw7tj6/5i6VbNHfp
	 TTeMXiQsub15FRvGOByP0Lm5ZY8jwSbpTgisGcIgJQU4BjTfJ851hozMzNVKlDg6lu
	 kfWl0gPKzilHBLepw9e978sRXAYgQtUjCnClwIb5kVZTM1Q+gNt6eDMxysva8yDzS/
	 z9zKOGg/fT3pS62NBbx8PE9VACdhKn4FN4R35B9mODoJCuguttHds5ysf1TFW+wz9c
	 xHpj/MszXrBYA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckC-0068vz-R7;
	Wed, 23 Oct 2024 15:53:52 +0100
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
Subject: [PATCH v5 16/37] KVM: arm64: Handle PIR{,E0}_EL2 traps
Date: Wed, 23 Oct 2024 15:53:24 +0100
Message-Id: <20241023145345.1613824-17-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20241023_075357_980513_A454E206 
X-CRM114-Status: GOOD (  10.67  )
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

Add the FEAT_S1PIE EL2 registers the sysreg descriptor array so that
they can be handled as a trap.

Access to these registers is conditional based on ID_AA64MMFR3_EL1.S1PIE
being advertised.

Similarly to other other changes, PIRE0_EL2 is guaranteed to trap
thanks to the D22677 update to the architecture.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index a85f62baebfba..c42f09a67a7c9 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -369,6 +369,18 @@ static bool access_rw(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static bool check_s1pie_access_rw(struct kvm_vcpu *vcpu,
+				  struct sys_reg_params *p,
+				  const struct sys_reg_desc *r)
+{
+	if (!kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S1PIE, IMP)) {
+		kvm_inject_undefined(vcpu);
+		return false;
+	}
+
+	return access_rw(vcpu, p, r);
+}
+
 /*
  * See note at ARMv7 ARM B1.14.4 (TL;DR: S/W ops are not easily virtualized).
  */
@@ -2873,6 +2885,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	EL2_REG(HPFAR_EL2, access_rw, reset_val, 0),
 
 	EL2_REG(MAIR_EL2, access_rw, reset_val, 0),
+	EL2_REG(PIRE0_EL2, check_s1pie_access_rw, reset_val, 0),
+	EL2_REG(PIR_EL2, check_s1pie_access_rw, reset_val, 0),
 	EL2_REG(AMAIR_EL2, access_rw, reset_val, 0),
 
 	EL2_REG(VBAR_EL2, access_rw, reset_val, 0),
-- 
2.39.2


