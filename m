Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37003D63928
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 10:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPI+uRMl4bq1O2uoMReaWsKRsX33Uxa7dW6AA7WPtds=; b=YXB/pAjo0RBlycP6RDmmPhAam5
	Y/AXN7i8oxgWz0d25gEmiyyEKjw1PmIsC4HbbhP3YheppBDX0D8LY3vsUKt3X+W4v5S7Ogu7vc6MD
	AQKUUEGjIJO3qySZpihahXEYTR15yq//jS0OIxkIFuCPBozmEI0Xlo00cns0zCmBjhFfJJcoPeJR8
	r9aPTfUZCyutTgMn/ioP2piCKM3hYN+c4X3DHbUtrNQnKQXDpCGxiYsbkZ6uilTyMeZwzJemKUTiu
	lHq48IYOQhhv+suxY22m6FIwKeE962hCUL+Ljo2wDV/hyJUF+MHoGKUs6wfF7i0yh6LandYkuvLcs
	PhS7u3EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiOD-0000000F77s-2ShF;
	Wed, 20 Nov 2024 10:56:53 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiKX-0000000F6Qd-1ggW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 10:53:06 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-38243a4ba5fso2908677f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 02:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732099983; x=1732704783; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XPI+uRMl4bq1O2uoMReaWsKRsX33Uxa7dW6AA7WPtds=;
        b=wpVLvBH+fzjS1MHmHTCBJg+VBAQQMJVvR+VT7i9L9eRAmylrGEdLRKAvDAeuLoYGJ5
         jm4yK75tYs9Bj8hTTNv7gpE4BFHG0ctVn53gYXVCZLiRMu0d97jwAtNSI/LJ8AvClsnE
         IQhTWw9RCgmAXKsaaV7HcpEEZ0OJf4oSO0JyTX66sN8gGkkL1iWYepE0xvSj4UU6+8fC
         65jmt36ldcUE3drH3n6qyVaIwYDRMeTDyS9zO++duAIIbkPX95mYClE5brwkjay+buQT
         ST2zQIZHZu9ZwS2GpUxue5nZZ+gNlCqsR3yC+S/iMf4OLRRcXDi2khy77TjuQyxf30MP
         N74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732099983; x=1732704783;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPI+uRMl4bq1O2uoMReaWsKRsX33Uxa7dW6AA7WPtds=;
        b=IL9J8BvTJWG2UrQw1Skw2jfbWjpGlFyFKXtYxKcjn8r2wFYGIQ0tWJSsx5tJwmrkh3
         AaMBO+661fuOSksdjBV5XDr0hO3Gt/8eDl2oLmWU+5HTTh4jICl9EXYoEW6BVM1+nofh
         JIRs7nj4o7MiRTt3y64NpG3VpzET436GZJYO2fMsXi5r0heH+48IQ/B7LOKNlda0Qzv2
         RGkYWt3Ei1rI5W149WnCCN1YP/fWLBRbu3PLz+/H0OaOt/U3s3km9Q3PzO+/DOIcKumt
         37QGRkCwgTXuqcEllz+zoSizzndQ7sbf1RFrI0rrMHu4SK8UH5RunE0+EDnom1jI6kDa
         rrVg==
X-Forwarded-Encrypted: i=1; AJvYcCUzXS7pWupG4qndksw7xZkKIV0f0VSWvRVlX6LSEtd8PRhFPJRLQkufmeip3djksfP4mwFEF/LDrpl2rEbO+x/5@lists.infradead.org
X-Gm-Message-State: AOJu0YyZp30lMQfr7E5/cXrQsxgE9mFBMTQxneyQmjkcp1zMVIzrdABB
	wiMayeMkQ76plp5zbHkSWvXA31s5rydrdmsNXDdeUyZ8XuQ/c/N1do/+6/aF5KeVi3BgpsDtGg=
	=
X-Google-Smtp-Source: AGHT+IFi0faN+HYWfuzsVdJslCptQyBCIQ/zbUCCFshMYtb0EBDBR9kVLdsYAblLclntUA35rcQB9IEGUQ==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a5d:614f:0:b0:382:360a:777d with SMTP id
 ffacd0b85a97d-38254a864f5mr764f8f.0.1732099983563; Wed, 20 Nov 2024 02:53:03
 -0800 (PST)
Date: Wed, 20 Nov 2024 10:52:45 +0000
In-Reply-To: <20241120105254.2842020-1-tabba@google.com>
Mime-Version: 1.0
References: <20241120105254.2842020-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241120105254.2842020-4-tabba@google.com>
Subject: [PATCH v1 03/12] KVM: arm64: Move checking protected vcpu features to
 a separate function
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_025305_441543_3A7AB532 
X-CRM114-Status: GOOD (  14.90  )
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


