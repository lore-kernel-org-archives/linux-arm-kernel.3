Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1F0C19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 22:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlVLEjSuR40DJq8DeUp7Tn/A3CFsKq1qRgCr3BfZnrg=; b=TuFojlgVzqjHGvf+OmLAgC2T2m
	SdOWCkQY3eKRPYPt0kwAH482QY1TNt3ygUaIeyygad1l4tbu3Kv8ABHAweKoOPCfz+BznU9OrHkm0
	mmjzJ+Vjh/rZIIFYGsx3fXfSlTKrWHHon4NkNe9LzmmGgcLn2l3iV97U7f4o+NYCSHZ3Ps+/IdCN2
	VD6/d97iMTEBOyp1WGqVnTv4EiiY/gHLYbhbxXZH6p52x0cUkQiViplE8RcCdP3MBAjswUH/TiOwE
	tZQ0lnqNd6eJgG0mK8nhaV7X/a6J8iVVKA7aev7RfOwvPTVm+Jk4b1r1rp408USM9IvkWeXO1lQVt
	OCtN8XDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPYH-00000005Yjk-2paw;
	Wed, 26 Feb 2025 22:06:49 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPNL-00000005X8v-19dL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 21:55:32 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5da14484978so206234a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 13:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740606929; x=1741211729; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BlVLEjSuR40DJq8DeUp7Tn/A3CFsKq1qRgCr3BfZnrg=;
        b=0RACNPLQ0b9E8BM0l21xYk6J+aEjOhHni389AbGb+R9XikqFFjs+iq1uUuot+Sezin
         3vtV0QIAfyyHipqV9VVXCr8aP7cB+TWsJ5J3YLnvU99b2wu4K2xKY0cNgPPqX5JJqN3Z
         u5j8Ov8Zo3DgKaRCTQCtt0l0VAV4V1fNJsdIHEYPzF1ltOTyKu9mBIAne/DxWz0/2J5F
         Oco8SAsZ8HH4JCnq7FctKdwxw62cD7SYycay7lpxUkRjJ//GAmOLkk5Sfa+nJ1SmkWum
         zKvBmw27z3tja/2Sp9ZJ45HWGpnrZQ2Fls/60NuGeeolWQjftxoZS3iSBkuuh1bJgxMP
         j2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740606929; x=1741211729;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BlVLEjSuR40DJq8DeUp7Tn/A3CFsKq1qRgCr3BfZnrg=;
        b=fKeCyk2GSrWSahUjACYj74Q7G5i2Fg0Prp11AGJy6Q5u7t22+YMtgGBfFa4DqeDd6X
         l9nPBsXI+1w/iTtdhgX8sXdkryR1J+JSvR/gfzo+XqjJISDIjFx1BLWue30Uqdv6oeHw
         pWK5jlTqrFKLb8qcr8RuIJaKhEQgtRvHUF92gTyg/iR2FU3c4cO6QpHT2A48LX0wDKEF
         tazX5gTSBvnbe1U9jlIt2VCJhsv1zanmO7dRigdU7dYelQospLygui5vKFOBnR5fSlRA
         bfJdTBw1KdlzflRh9ctRgfyifTCnraZpimMbYRU1CIz6F1c+hVQLtol7jDH2UHobKaNs
         lUEA==
X-Forwarded-Encrypted: i=1; AJvYcCVeZu+GhfsQf2PiPAOPoh+uL107IJVF+Binh6vyiChLX/rTKw2nc/1papSj+3D/VIYEc/ZwAgB0NH9oPPqzYZ8v@lists.infradead.org
X-Gm-Message-State: AOJu0YyYJVdevz7jkutdbuaAoPoqH5YcRF8CmmCwYTPYGxWWVQ3yYExo
	SegJfExRyHrV2DyqxYDtzXdTqvS1PPbJv7Q1jdKyZtq0TgEv5yl5c6pM4+h/LlPQa8siGjm1uA=
	=
X-Google-Smtp-Source: AGHT+IEddKLeb5DU9aLaMmqh8NRm6HKFBbipNbn6fg8v8hDnY6472Y5nLiUu15PYKstb25+YBP5pSMprRQ==
X-Received: from edwj18.prod.google.com ([2002:a05:6402:11d2:b0:5e4:befa:4839])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3583:b0:5e0:9ffa:1348
 with SMTP id 4fb4d7f45d1cf-5e0b70cb619mr23003688a12.2.1740606929001; Wed, 26
 Feb 2025 13:55:29 -0800 (PST)
Date: Wed, 26 Feb 2025 21:55:19 +0000
In-Reply-To: <20250226215520.1759218-1-tabba@google.com>
Mime-Version: 1.0
References: <20250226215520.1759218-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250226215520.1759218-4-tabba@google.com>
Subject: [PATCH v2 3/4] KVM: arm64: Factor out pKVM hyp vcpu creation to
 separate function
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, mark.rutland@arm.com, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_135531_311091_119419AC 
X-CRM114-Status: GOOD (  14.58  )
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

Move the code that creates and initializes the hyp view of a vcpu
in pKVM to its own function. This is meant to make the transition
to initializing every vcpu individually clearer.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/pkvm.c | 48 ++++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 930b677eb9b0..06665cf221bf 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -113,6 +113,24 @@ static void __pkvm_destroy_hyp_vm(struct kvm *host_kvm)
 	free_hyp_memcache(&host_kvm->arch.pkvm.teardown_mc);
 }
 
+static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
+{
+	size_t hyp_vcpu_sz = PAGE_ALIGN(PKVM_HYP_VCPU_SIZE);
+	pkvm_handle_t handle = vcpu->kvm->arch.pkvm.handle;
+	void *hyp_vcpu;
+	int ret;
+
+	hyp_vcpu = alloc_pages_exact(hyp_vcpu_sz, GFP_KERNEL_ACCOUNT);
+	if (!hyp_vcpu)
+		return -ENOMEM;
+
+	ret = kvm_call_hyp_nvhe(__pkvm_init_vcpu, handle, vcpu, hyp_vcpu);
+	if (ret)
+		free_pages_exact(hyp_vcpu, hyp_vcpu_sz);
+
+	return ret;
+}
+
 /*
  * Allocates and donates memory for hypervisor VM structs at EL2.
  *
@@ -125,9 +143,8 @@ static void __pkvm_destroy_hyp_vm(struct kvm *host_kvm)
  */
 static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
 {
-	size_t pgd_sz, hyp_vm_sz, hyp_vcpu_sz;
+	size_t pgd_sz, hyp_vm_sz;
 	struct kvm_vcpu *host_vcpu;
-	pkvm_handle_t handle;
 	void *pgd, *hyp_vm;
 	unsigned long idx;
 	int ret;
@@ -161,33 +178,12 @@ static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
 	if (ret < 0)
 		goto free_vm;
 
-	handle = ret;
+	WRITE_ONCE(host_kvm->arch.pkvm.handle, ret);
 
-	host_kvm->arch.pkvm.handle = handle;
-
-	/* Donate memory for the vcpus at hyp and initialize it. */
-	hyp_vcpu_sz = PAGE_ALIGN(PKVM_HYP_VCPU_SIZE);
 	kvm_for_each_vcpu(idx, host_vcpu, host_kvm) {
-		void *hyp_vcpu;
-
-		/* Indexing of the vcpus to be sequential starting at 0. */
-		if (WARN_ON(host_vcpu->vcpu_idx != idx)) {
-			ret = -EINVAL;
-			goto destroy_vm;
-		}
-
-		hyp_vcpu = alloc_pages_exact(hyp_vcpu_sz, GFP_KERNEL_ACCOUNT);
-		if (!hyp_vcpu) {
-			ret = -ENOMEM;
-			goto destroy_vm;
-		}
-
-		ret = kvm_call_hyp_nvhe(__pkvm_init_vcpu, handle, host_vcpu,
-					hyp_vcpu);
-		if (ret) {
-			free_pages_exact(hyp_vcpu, hyp_vcpu_sz);
+		ret = __pkvm_create_hyp_vcpu(host_vcpu);
+		if (ret)
 			goto destroy_vm;
-		}
 	}
 
 	return 0;
-- 
2.48.1.711.g2feabab25a-goog


