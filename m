Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3582EC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMnZDW0+WjKu5VVmfXnLpwr7ldbiW0HO9GK6bYyQE9Q=; b=nJnOXg5K9EVeaIcRV4+VRmiWIS
	2qf7y1zSu2st9L1FFEeegZFJtA1+0l8HBF0T/pOnDYHTDK/yZrf9R4I5z7zCyHbcOxfOAv+ER8HsL
	qHE4nln7rzSQr9dkLRy79eig03SfcwotX+Pfc0N0luQT2mE5+dzLISLKszGd8rcD41nDXVrwrIPXm
	bWNqA4dcgNO1p1gq6RDPGkoBW6LQtjjpPy/MMPoK3j08PlZPKTbNHCnrC7tpBBmI2BDJNdahnyXeo
	anypI6j5poJOOgZ384OEXs7LaiJZ99TQ7BIaFPZsPHU5mzubWWI/ShS9UsadMEF6NBVi28D40rubj
	mmSY6i/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzVa-00000000svN-1XKe;
	Tue, 25 Feb 2025 18:18:18 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyke-00000000eA9-06vw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:29:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6AA8612D4;
	Tue, 25 Feb 2025 17:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C0FC4CEDD;
	Tue, 25 Feb 2025 17:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740504587;
	bh=72XqEPX1zId4CcUK/Ah9AwDghJvNGnFuzi01nVVJvcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ntbXKJ9w1z40KZ9jRupbXbAbf4l32PXcOXMoZKmzX7KeB5zjbCbm6QJDMVAZvlqRU
	 3pzA7G1hf/FxUhTZHTOnS+ULrBzUM1OtYpx7S+sLsL2jYYj67eqPpcKWIgkfcKSAid
	 MvApacq1yf3NBQ4IlkHdf650rlfvjE1l+N2y1/kEc8MFHMiqL1xnDOCGkCgeDXjMJ/
	 BFhY4fiia9E2xwoyxeEWL1F8/IEfOuuEWLt9wX6P3MLwmiFNDfE+dpKUDfg/a34h+P
	 UsxiRJ3KvykUX788YHoGfFXLS9ZeMLelfWBtjz06HMdGSzw85aDJ1FpwjqDTUPYQ+Q
	 z3gWicONPd8tw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tmykb-007rKs-TU;
	Tue, 25 Feb 2025 17:29:45 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v4 11/16] KVM: arm64: nv: Respect virtual HCR_EL2.TWx setting
Date: Tue, 25 Feb 2025 17:29:25 +0000
Message-Id: <20250225172930.1850838-12-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250225172930.1850838-1-maz@kernel.org>
References: <20250225172930.1850838-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
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

From: Jintack Lim <jintack.lim@linaro.org>

Forward exceptions due to WFI or WFE instructions to the virtual EL2 if
they are not coming from the virtual EL2 and virtual HCR_EL2.TWx is set.

Signed-off-by: Jintack Lim <jintack.lim@linaro.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h | 13 +++++++++++++
 arch/arm64/kvm/handle_exit.c         |  6 +++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 78ec1ef2cfe82..d4e4212ff5967 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -275,6 +275,19 @@ static __always_inline u64 kvm_vcpu_get_esr(const struct kvm_vcpu *vcpu)
 	return vcpu->arch.fault.esr_el2;
 }
 
+static inline bool guest_hyp_wfx_traps_enabled(const struct kvm_vcpu *vcpu)
+{
+	u64 esr = kvm_vcpu_get_esr(vcpu);
+	bool is_wfe = !!(esr & ESR_ELx_WFx_ISS_WFE);
+	u64 hcr_el2 = __vcpu_sys_reg(vcpu, HCR_EL2);
+
+	if (!vcpu_has_nv(vcpu) || vcpu_is_el2(vcpu))
+		return false;
+
+	return ((is_wfe && (hcr_el2 & HCR_TWE)) ||
+		(!is_wfe && (hcr_el2 & HCR_TWI)));
+}
+
 static __always_inline int kvm_vcpu_get_condition(const struct kvm_vcpu *vcpu)
 {
 	u64 esr = kvm_vcpu_get_esr(vcpu);
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 512d152233ff2..b73dc26bc44b4 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -129,8 +129,12 @@ static int kvm_handle_fpasimd(struct kvm_vcpu *vcpu)
 static int kvm_handle_wfx(struct kvm_vcpu *vcpu)
 {
 	u64 esr = kvm_vcpu_get_esr(vcpu);
+	bool is_wfe = !!(esr & ESR_ELx_WFx_ISS_WFE);
 
-	if (esr & ESR_ELx_WFx_ISS_WFE) {
+	if (guest_hyp_wfx_traps_enabled(vcpu))
+		return kvm_inject_nested_sync(vcpu, kvm_vcpu_get_esr(vcpu));
+
+	if (is_wfe) {
 		trace_kvm_wfx_arm64(*vcpu_pc(vcpu), true);
 		vcpu->stat.wfe_exit_stat++;
 	} else {
-- 
2.39.2


