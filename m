Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B754C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y42OaWjgB0rg7blG3Pk/mPM5kBIbWAmK/8gVhR7spnU=; b=ca8Y4nV4zhNzI3JIkGTBYz5vgt
	1+vZyly6+y0Fkkucdw9ro/AstYvR9qX2jFlKiKgGNqL74f3vyfGqIWIh9B9qBtGouYYAaXw/GrW/l
	y6YepWMqAnZm9DB6mfNQtXaHAaOHsMouQf4k63VO133tcSyP6U1Ltd+lNOawU+e+S6nonZI8Wz0th
	JT1k5SjcNyTwobzjYmS0TF9m1Sbvqa1YshjNCmi5TZbcELoEgmme7tS392CZlXil+iddd52OqXm8f
	ciarsUb4mZqv4VHP0PAMhXW25Tviugn4HqaKFaYHVXxNPhUr/GwO+uWCArd4qwz7sPf+8FVYyhbYw
	zX4uGsOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixGS-0000000FF7T-1eY6;
	Fri, 14 Feb 2025 15:06:00 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixDc-0000000FEoc-0PPI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 15:03:05 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43935bcec0aso17782745e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 07:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739545382; x=1740150182; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=y42OaWjgB0rg7blG3Pk/mPM5kBIbWAmK/8gVhR7spnU=;
        b=e46PfrN/LFp1tCKNXicsvL4PgUNJHOeC+h5jGF5/c5NUuwHn/CQuTnnJLx+8Altszq
         QMkRUUw7ztH4bWQng0M5gv7ZS0p2sF6ejJg6z1vd8pnwfsQyDfqlZywP64welgeKhg4k
         KucvAHyOT/pvTSjQzJLRkR8lOiXBIwoNQtDnQBhxyX71JlVD53shZyM8DilPgPcz3F4k
         QcyHpztUZAmYSbGWG3IqisPKb46sc/9i4NBLSHp7BYti06qwyUjYTP9L4fyry3rPr+1f
         gevEYW1Cy0dwHw1vZKmZna399UNVX7CWZk5FZWPwFjgfQhGB6Qlckd0o2MSu4V83wJQW
         PPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739545382; x=1740150182;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y42OaWjgB0rg7blG3Pk/mPM5kBIbWAmK/8gVhR7spnU=;
        b=nqOzZty3Q2F21K+za3glv5qxGS2JmJTrdVFC7wKUHVHDhHJN2qQOJiOOWzoudghP6H
         7/QcrxTNidWKV63xBVM9N7YaHC1s56W+y4V8FZGcEDi0xXHCXgCOkut0egYOGyVfI5pf
         drzJx+vAIui9YjiX7BoOrZZSfbJvjG+lA1NqTECqG3CkYvfMPIZvuK/WFdTXjQfCw3nC
         74bvfB7GumtWaUtT8KBR0/Am+xC//aRjSQF57GvBpfpg70RLzygbrVBbvr/kx+6zJUd9
         O1aYfRzCwxN/8alQakEr8ILvCJGY8foYnYe7x9TREbIp0rRF6le4EWOv66WQcnWXTBBw
         ejMA==
X-Forwarded-Encrypted: i=1; AJvYcCWTNlIB1xi7qGF2luP+AGgsN6Yuk5q7FUYPmysDTDZBxHofi6ZRxPyvKC1OARfnb4ig1pAjnunZK+KI6nDVQV4U@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm7rfNc4mhpC3j5iiQDJW55toPBEDXUaKqDcEGbVEKAWJerV1G
	9Cu7GsTggcMMKOvaDlcZ3U6h9Doj8ySL2wO3fcKWjnSrsaIkIQbWBb5rBVpbC3D2dKO7cH1aig=
	=
X-Google-Smtp-Source: AGHT+IF62UW0ZAUqxob5YZZPd/L0FZ9/3SweMzcmTIEF6W/RKtm+jgMe9LQ3g7afaCYpLDIDmocY+1lPOw==
X-Received: from wmqb9.prod.google.com ([2002:a05:600c:4e09:b0:439:6217:c147])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3d9b:b0:439:5aa1:1efb
 with SMTP id 5b1f17b1804b1-4396018a96bmr139269315e9.11.1739545382155; Fri, 14
 Feb 2025 07:03:02 -0800 (PST)
Date: Fri, 14 Feb 2025 15:02:56 +0000
In-Reply-To: <20250214150258.464798-1-tabba@google.com>
Mime-Version: 1.0
References: <20250214150258.464798-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250214150258.464798-2-tabba@google.com>
Subject: [PATCH v1 1/3] KVM: arm64: Initialize HCRX_EL2 traps in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, mark.rutland@arm.com, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_070304_135815_9071D139 
X-CRM114-Status: GOOD (  13.87  )
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

Initialize and set the traps controlled by the HCRX_EL2 in pKVM
when the register is supported by the system.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 46 ++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 3927fe52a3dd..668ebec27f1b 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -58,6 +58,30 @@ static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
 		vcpu->arch.hcr_el2 |= HCR_ATA;
 }
 
+static void pkvm_vcpu_reset_hcrx(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
+	struct kvm_vcpu *vcpu = &hyp_vcpu->vcpu;
+
+	if (!cpus_have_final_cap(ARM64_HAS_HCX))
+		return;
+
+	/*
+	 * In general, all HCRX_EL2 bits are gated by a feature.
+	 * The only reason we can set SMPME without checking any
+	 * feature is that its effects are not directly observable
+	 * from the guest.
+	 */
+	vcpu->arch.hcrx_el2 = HCRX_EL2_SMPME;
+
+	/*
+	 * For non-protected VMs, the host is responsible for the guest's
+	 * features, so use the remaining host HCRX_EL2 bits.
+	 */
+	if ((!pkvm_hyp_vcpu_is_protected(hyp_vcpu)))
+		vcpu->arch.hcrx_el2 |= host_vcpu->arch.hcrx_el2;
+}
+
 static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
@@ -92,6 +116,26 @@ static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
 	vcpu->arch.hcr_el2 = val;
 }
 
+static void pvm_init_traps_hcrx(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+	u64 hcrx_set = 0;
+
+	if (!cpus_have_final_cap(ARM64_HAS_HCX))
+		return;
+
+	if (kvm_has_feat(kvm, ID_AA64ISAR2_EL1, MOPS, IMP))
+		hcrx_set |= (HCRX_EL2_MSCEn | HCRX_EL2_MCE2);
+
+	if (kvm_has_feat(kvm, ID_AA64MMFR3_EL1, TCRX, IMP))
+		hcrx_set |= HCRX_EL2_TCR2En;
+
+	if (kvm_has_fpmr(kvm))
+		hcrx_set |= HCRX_EL2_EnFPM;
+
+	vcpu->arch.hcrx_el2 |= hcrx_set;
+}
+
 static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
@@ -165,6 +209,7 @@ static int pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
 	vcpu->arch.mdcr_el2 = 0;
 
 	pkvm_vcpu_reset_hcr(vcpu);
+	pkvm_vcpu_reset_hcrx(hyp_vcpu);
 
 	if ((!pkvm_hyp_vcpu_is_protected(hyp_vcpu)))
 		return 0;
@@ -174,6 +219,7 @@ static int pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
 		return ret;
 
 	pvm_init_traps_hcr(vcpu);
+	pvm_init_traps_hcrx(vcpu);
 	pvm_init_traps_mdcr(vcpu);
 
 	return 0;
-- 
2.48.1.601.g30ceb7b040-goog


