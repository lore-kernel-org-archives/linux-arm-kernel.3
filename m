Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9966ED69104
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 12:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPI+uRMl4bq1O2uoMReaWsKRsX33Uxa7dW6AA7WPtds=; b=XqdLAVJ/H8PKWxPTdmqpdz+YKF
	wbZRxMsPmztVUVvu8INfjOA+WhJ5ILvBBQ2iiMSocoCawqWk6Z+AIyN559Kno90WMFNWrZdwPAc69
	DzUPWA+4pFYyGUTJoj8fMUrNsQdWGtgkZy8EzDJyHqtbXGff6OdeKahylALximMm9bqRfOcZ4EuTA
	FUCbCAafkTnQ6JslIRcB3t4Zx/6shLe6BJZUnnzKWpXBkkPt5pbEzvfpuYhpX1YptwUnG5y7nZvdr
	PUkBU6YwhuD6PTNTvQqdMaf6fVE71LipeXYO4XVElHpvqza+4CuxuHvu+pYnnLVDrvsozlbMTUXuK
	not9+f5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdng-0000000FVqx-25s6;
	Thu, 28 Nov 2024 12:39:16 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdjw-0000000FVLL-3z51
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 12:35:25 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4349df2d87dso7251375e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 04:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732797323; x=1733402123; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XPI+uRMl4bq1O2uoMReaWsKRsX33Uxa7dW6AA7WPtds=;
        b=a4ZPBfDhPlq/VcXqw+w0wd5i44Cdrd5P+WzZCtpzQbRICQwLTkf56K0N3PzKm3g8tU
         Pf20AgDYv1mvVyt9BieA0zdBPIa/Fkh+5TwoTgqRBzZE0LC8A3pU8231hkxX/mR6gDeO
         u+6i496pvyrNOytaqBQLvaeofxKSo2/Ok42nEBgdI7Kt8qNgnmHim02M0FIIb0y6yCjO
         kYt2O3YivjOjuX9uDfNcfvf+3M58NUm+5qTuFuRzxLWydswID9i+glXM0Z9xDit79h8d
         w6DB6egURoG9hFc2E8d/6KcGpj55FoWjH1AAkqGMZUH/f6ChLUKu2ft324Y4Izhbrfwf
         pPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732797323; x=1733402123;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPI+uRMl4bq1O2uoMReaWsKRsX33Uxa7dW6AA7WPtds=;
        b=X/FGy8KaXoB/TZtDMDjD45/v7WTjmJ30sXnlI8Epk1afaOd8c5vgRkpQ10Od311fK8
         9biiw4zF6+NsNSSqJfzuatCBA3Fhb4OJ+jrHARzogWK0aRPxqTeGPkXFcc5jX0IrH2hs
         aLa+J5oQzIHc0/tddYC2fIzI4JV66TrnuDepeJCtQfn4+41taFkVMePQD0fESpQ+ygLy
         6ObM9RjklgTl004Zw4zVIZpWA3mwXUOTETBOCljbBZ9D5q1ySaWOTbTtd5USpxzA7Adx
         26JOdK8msy0q9IIqb4exwWMTRk1sM1BN/AIaqiHoyhiVm5Qwgn3wIrwct2h76sRbdrIq
         pSdA==
X-Forwarded-Encrypted: i=1; AJvYcCX28XOGNPtGRa8YvkBqJ7bEDA5SpVOTse+DnimmQC+zu/HAMvbuuQ2vcyZxleRZVN4LYau9M4uffwN1iqggcMjY@lists.infradead.org
X-Gm-Message-State: AOJu0YzyrB+yk5mT4CwizmjHBgKBy5hPU2g/TEPDnMxgtd/LDk7yuEH3
	WG8gymZkLkDkO1XYsP0Mq5FmKmSghYCbjCwBS23C/TNMuJxE7nQRro+3anLsRdNrnTqRUKtADA=
	=
X-Google-Smtp-Source: AGHT+IGDUIjMWG2C1D205pF0+TzoXyj8S3VTD3hZfnFv8RXrdOu6JZJXuSb32DY556yY3ixL7HhbnCYPlw==
X-Received: from wmjs15.prod.google.com ([2002:a7b:c38f:0:b0:434:a72c:1d0a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c93:b0:434:a852:ba77
 with SMTP id 5b1f17b1804b1-434a9dcec68mr75825275e9.15.1732797322990; Thu, 28
 Nov 2024 04:35:22 -0800 (PST)
Date: Thu, 28 Nov 2024 12:35:03 +0000
In-Reply-To: <20241128123515.1709777-1-tabba@google.com>
Mime-Version: 1.0
References: <20241128123515.1709777-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128123515.1709777-4-tabba@google.com>
Subject: [PATCH v3 03/15] KVM: arm64: Move checking protected vcpu features to
 a separate function
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_043524_985387_EA2A4B9E 
X-CRM114-Status: GOOD (  14.27  )
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

At the moment, checks for supported vcpu features for protected
VMs are build-time bugs. In the following patch, they will become
runtime checks based on the vcpu's features registers. Therefore,
consolidate them into one function that would return an error if
it encounters an unsupported feature.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 45 ++++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 1744574e79b2..fb733b36c6c1 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -178,20 +178,11 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
 }
 
 /*
- * Initialize trap register values in protected mode.
+ * Check that cpu features that are neither trapped nor supported are not
+ * enabled for protected VMs.
  */
-static void pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
+static int pkvm_check_pvm_cpu_features(struct kvm_vcpu *vcpu)
 {
-	struct kvm_vcpu *vcpu = &hyp_vcpu->vcpu;
-
-	vcpu->arch.cptr_el2 = kvm_get_reset_cptr_el2(vcpu);
-	vcpu->arch.mdcr_el2 = 0;
-
-	pkvm_vcpu_reset_hcr(vcpu);
-
-	if ((!pkvm_hyp_vcpu_is_protected(hyp_vcpu)))
-		return;
-
 	/*
 	 * PAuth is allowed if supported by the system and the vcpu.
 	 * Properly checking for PAuth requires checking various fields in
@@ -218,9 +209,34 @@ static void pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
 	BUILD_BUG_ON(!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_AdvSIMD),
 				PVM_ID_AA64PFR0_ALLOW));
 
+	return 0;
+}
+
+/*
+ * Initialize trap register values in protected mode.
+ */
+static int pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	struct kvm_vcpu *vcpu = &hyp_vcpu->vcpu;
+	int ret;
+
+	vcpu->arch.cptr_el2 = kvm_get_reset_cptr_el2(vcpu);
+	vcpu->arch.mdcr_el2 = 0;
+
+	pkvm_vcpu_reset_hcr(vcpu);
+
+	if ((!pkvm_hyp_vcpu_is_protected(hyp_vcpu)))
+		return 0;
+
+	ret = pkvm_check_pvm_cpu_features(vcpu);
+	if (ret)
+		return ret;
+
 	pvm_init_traps_hcr(vcpu);
 	pvm_init_traps_cptr(vcpu);
 	pvm_init_traps_mdcr(vcpu);
+
+	return 0;
 }
 
 /*
@@ -417,9 +433,12 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
 	hyp_vcpu->vcpu.arch.cflags = READ_ONCE(host_vcpu->arch.cflags);
 	hyp_vcpu->vcpu.arch.mp_state.mp_state = KVM_MP_STATE_STOPPED;
 
+	ret = pkvm_vcpu_init_traps(hyp_vcpu);
+	if (ret)
+		goto done;
+
 	pkvm_vcpu_init_sve(hyp_vcpu, host_vcpu);
 	pkvm_vcpu_init_ptrauth(hyp_vcpu);
-	pkvm_vcpu_init_traps(hyp_vcpu);
 done:
 	if (ret)
 		unpin_host_vcpu(host_vcpu);
-- 
2.47.0.338.g60cca15819-goog


