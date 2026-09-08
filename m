Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EA0C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FeF2uBjisRkRmsRj0aArun3W5kHwSdYSgKsWjzzZOfE=; b=IKJTSak0yIzBTmk7ffk/Q4zf8E
	a6Oo6jXiLgxCPuuaO32BVTRnM/kt0yyAc5a9r8X6awmH/5sVdvN6o+QZJYJ8VfV6h/ducxZ6dGeXk
	d2gSG05de9y9cb8UmLyQNlckno21q4DG9Y9X52B6016MQ5YgBrmCjl5N8LQXQf3POiWEq3Pi4LGzQ
	j+4F87HRzk8sLPghFVtnwYrdekZN2hMe28c3RasXCZmTVm8KKH96Mwa7Qy2FfcPf2odr5miDtnJ40
	rXyhmNkmPGRnXpgsZ3rp+nYkT6VlSsJGCFpQ7myuUTtYtRTgUnQxPD6oMOJFcHCEsiJvg148j1JAr
	01bL0Hpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ybt-00000009doG-0Lop;
	Tue, 08 Sep 2026 16:23:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ybh-00000009dbw-1oRe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:23:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FA6A1C01;
	Tue,  8 Sep 2026 09:23:32 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7C4D23F7B4;
	Tue,  8 Sep 2026 09:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788884615; bh=rcvFiEHuSI+iYZssP4YUoc0XZJr7UrWElOyPy2d1u6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WMDCslfUN1dre+HAmE9X1Q55Ii1XoTfcKIVPrHjrgsDViNunXcJ4JIobAh6hKTNAJ
	 ZGIcMsTnSSv9IWkenAEfgbsztp3S0KUdK6wB59Vh4pTkb7qGjsYDIfK46kUEG+/jLb
	 GByUP/siteS2s9n4sz1vR7apwihT9vs85j+0VOpI=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v17 13/20] KVM: arm64: CCA: Add VCPU load/put for Realms
Date: Tue,  8 Sep 2026 17:22:16 +0100
Message-ID: <20260908162223.1683432-14-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908162223.1683432-1-suzuki.poulose@arm.com>
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_092337_516665_E08F19EC 
X-CRM114-Status: UNSURE (   9.44  )
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

RMM controls the VCPU settings and most are hidden from the KVM, except for the
VGIC and timer bits.

A later patch would add syncing the VCPU state into the Realm REC related SMC
parameters.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kvm/arm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index b5e0893ea16f1..3dfe0e03fab7a 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -807,6 +807,13 @@ static void pkvm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		     &vcpu->arch.vgic_cpu.vgic_v3);
 }
 
+static void realm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+{
+	kvm_timer_vcpu_load(vcpu);
+	kvm_vgic_load(vcpu);
+	vcpu_set_wfx_traps(vcpu);
+}
+
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	vcpu->cpu = cpu;
@@ -853,6 +860,12 @@ static void pkvm_vcpu_put(struct kvm_vcpu *vcpu)
 	nvhe_vcpu_put(vcpu);
 }
 
+static void realm_vcpu_put(struct kvm_vcpu *vcpu)
+{
+	kvm_timer_vcpu_put(vcpu);
+	kvm_vgic_put(vcpu);
+}
+
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.vcpu_ops->vcpu_put(vcpu);
@@ -2210,11 +2223,17 @@ static const struct kvm_vcpu_ops pkvm_vcpu_ops = {
 	.vcpu_put = pkvm_vcpu_put,
 };
 
+static const struct kvm_vcpu_ops realm_vcpu_ops = {
+	.vcpu_load = realm_vcpu_load,
+	.vcpu_put = realm_vcpu_put,
+};
+
 static const struct kvm_vcpu_ops *arm64_vcpu_ops[] = {
 	[VM_VHE] = &vhe_vcpu_ops,
 	[VM_NVHE] = &nvhe_vcpu_ops,
 	[VM_PKVM] = &pkvm_vcpu_ops,
 	[VM_PROTECTED_PKVM] = &pkvm_vcpu_ops,
+	[VM_REALM] = &realm_vcpu_ops,
 };
 
 static unsigned long nvhe_percpu_size(void)
-- 
2.43.0


