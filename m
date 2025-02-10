Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A31FC021A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFebtXrOWndUzuv2fSU0cOEnRIpE55tmdlOxQ2WUWEk=; b=iR1BQj/MWzQPazKRsmGWuyYj55
	QSq6Y6fgYejzS7SSFjJ1zdOCwOJ+z3hgyR7Ym/wTmJRG/EFvlmmN/RemX3Vjnvztve0Uc8wQORnGh
	gw6JK6NrXbIy/CcrvaYHH2etsAqvrDR40Pl2ZvYwwbQRseMoxjrWWArRzgACwLwPHXUrCbfMjQGve
	RgG0k7JKs0A0YKOVdX9CIeKLZceNeJOKFf7SI2UCcOxDjTli2qbBx4P33DNTuftfE5DBzOo1XzWqM
	HTV+aRSfhJFXwNURlETSQmq/7OS/tVwEQicgnC1Lu0bZt3LnsoazfwbWGswgL3ycpsn1kxyQryL2x
	nsY/GFVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZYW-000000016YS-22uz;
	Mon, 10 Feb 2025 19:34:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYjJ-00000000ysv-33Wt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:42:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D7D6A41FEF;
	Mon, 10 Feb 2025 18:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F9AC4CEE4;
	Mon, 10 Feb 2025 18:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739212920;
	bh=LBhMAoSTvoszfWJXdD38bJcBWVL2ZZN33sSHGe7TcMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XByF0I4tRIAVss43HkQ/y7gYcB3nO1fiwJWEdkoiJ33THdXyahtUVlhGH2HCTM9rc
	 p2nDr9h9LF3BTdi4BVTs4WXf26eEmvVDOrOubxUr6Xl3gYZ+AlPVxgwosajLBSJDa1
	 xAJG2LDl1PU582/nbf67j8lCZVtv3W/vJfhnvjuETWxojR8Za4QyRc7l1IwU00VYx4
	 Zqw8RWiqBKS8yfPpHTvNB/rLiXC7LrZZ/y57+zGu2teXZ1RrfcvPgIKrEm2JEVSL6A
	 yOvb25ZKq0dOwVBiiA/dEx4QVTt1XmV88rl6f17JZNqc2mU9GYFFfMnvkxfLEU4Gzi
	 1Pdsv67XA7fxg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1thYjG-002g2I-Ip;
	Mon, 10 Feb 2025 18:41:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 06/18] KVM: arm64: Plug FEAT_GCS handling
Date: Mon, 10 Feb 2025 18:41:37 +0000
Message-Id: <20250210184150.2145093-7-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250210184150.2145093-1-maz@kernel.org>
References: <20250210184150.2145093-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_104201_919261_66AE73C7 
X-CRM114-Status: GOOD (  12.65  )
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

We don't seem to be handling the GCS-specific exception class.
Handle it by delivering an UNDEF to the guest, and populate the
relevant trap bits.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/handle_exit.c | 11 +++++++++++
 arch/arm64/kvm/sys_regs.c    |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 4f8354bf7dc5f..624a78a99e38a 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -294,6 +294,16 @@ static int handle_svc(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
+static int kvm_handle_gcs(struct kvm_vcpu *vcpu)
+{
+	/* We don't expect GCS, so treat it with contempt */
+	if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))
+		WARN_ON_ONCE(1);
+
+	kvm_inject_undefined(vcpu);
+	return 1;
+}
+
 static int handle_ls64b(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
@@ -384,6 +394,7 @@ static exit_handle_fn arm_exit_handlers[] = {
 	[ESR_ELx_EC_BRK64]	= kvm_handle_guest_debug,
 	[ESR_ELx_EC_FP_ASIMD]	= kvm_handle_fpasimd,
 	[ESR_ELx_EC_PAC]	= kvm_handle_ptrauth,
+	[ESR_ELx_EC_GCS]	= kvm_handle_gcs,
 };
 
 static exit_handle_fn kvm_get_exit_handler(struct kvm_vcpu *vcpu)
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 18721c773475d..2ecd0d51a2dae 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5056,6 +5056,14 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
 						HFGITR_EL2_nBRBIALL);
 	}
 
+	if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, GCS, IMP)) {
+		kvm->arch.fgu[HFGxTR_GROUP] |= (HFGxTR_EL2_nGCS_EL0 |
+						HFGxTR_EL2_nGCS_EL1);
+		kvm->arch.fgu[HFGITR_GROUP] |= (HFGITR_EL2_nGCSPUSHM_EL1 |
+						HFGITR_EL2_nGCSSTR_EL1 |
+						HFGITR_EL2_nGCSEPP);
+	}
+
 	set_bit(KVM_ARCH_FLAG_FGU_INITIALIZED, &kvm->arch.flags);
 out:
 	mutex_unlock(&kvm->arch.config_lock);
-- 
2.39.2


