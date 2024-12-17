Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A141FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLkOUnfvrMr56Ihfpy3Sfoqx94Fc1N1WgaqZqbK0Eu4=; b=DBrfmaJVrzbOFKOQU+Qqb4pSCc
	upFMug4LD3mUF0J4GxWjmOSCGsc2OxuE+4lgSmMg7WrBasTlzhDm3YvO6rIWFNYt4cCXMxDn0lV+k
	vkhStse4pQKE/JzKRQUR/QOmIdT+UdcVKwWyiOzEMqqorEXb8dtmZRn2CXX0OJ/N8cAVmqZg+k1F5
	dKpqkcOVozOZPevap6pEeHGpZtqfasSdAWX2Vqklvq2lemWjjXQznB/w8nJ5BGOk/VphRgHeLZ59U
	AxOdjBkDbg8e7CrS3/RXVEtbouWf51P8mpScc2O4lL5qBb43W1rIJfXiG1H9PuV36YA+5XaHzHCHB
	M0+vZAZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZUe-0000000DxRe-152u;
	Tue, 17 Dec 2024 15:28:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZGz-0000000DuWN-3g9Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 15:14:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E9B5A41A6E;
	Tue, 17 Dec 2024 15:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A52C4CEE3;
	Tue, 17 Dec 2024 15:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734448446;
	bh=yZevPphbLIaRcs4edJZitg1YrBi5XxHxu0Vy608/eXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FVpAi/l7lLaLPGkcTPxyiHf2mWf2kmyJpdtrkSFp3/WDfmpKBfvnjTWkfrzmnB30o
	 BuO4tJmStr5c0qMclqzwIeBnPojDCy+3t0GeIL0xfw+g8RekjJe/vi29co6rZmIDPT
	 0rFSM22mdkAqdnclPzFeEWtb0TW5hLbvIaWGb3cnze6rxC6MagPai3qp5C87/bXnxO
	 f0UEj/ryjnwc2AV22CXwyUhb5Bc8KFfoqve/BgsKai6BciftKCqjG8bwXWsgksGrh5
	 sWm7u7k04T20OfCR5zgbmljHJ5i9zqTbKHGwaOiuQk79pd164ZimGTIDiiX/qXfS/z
	 zMD/LKAkYvjdA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tNZGu-004bWV-TJ;
	Tue, 17 Dec 2024 15:14:04 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eauger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH 12/16] KVM: arm64: nv: Respect virtual HCR_EL2.TWx setting
Date: Tue, 17 Dec 2024 15:13:27 +0000
Message-Id: <20241217151331.934077-13-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217151331.934077-1-maz@kernel.org>
References: <20241217151331.934077-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eauger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_071410_090337_A10204D5 
X-CRM114-Status: GOOD (  12.24  )
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
index cf811009a33c9..5d2af20f75890 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -281,6 +281,19 @@ static __always_inline u64 kvm_vcpu_get_esr(const struct kvm_vcpu *vcpu)
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
index d7c2990e7c9ed..206eb6698db70 100644
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


