Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A26EE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 10:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xINd9m1enPF0BMWAgJgrGlweRAoQYidCOTnyfqcrJ34=; b=GeWucjcbpJIpVbDb9kBIYR6aLw
	NGLr6+f4KJUsJsMvoFqTB+CZxXELX0qb5kHhxiP5WyB/d0LMQZsAusCLEXzV4ntx87uqa8tfEz70U
	7bF9KQmGmgCoov+hm+2G4+wqWYyaJbdh3Tm0QpNIJgyKTFZvd1wlESSzMpRmCwJutXovpuWoYUm7s
	Pohu/m5hw0FMKMynKxUuL4gq1g7rBg/Ne2ya1V0ZlVGWRp5PXCc0REJf6mRMYBOdC6ovQ9bEqUG2O
	Jdf1zVxAE/W73ZlmG7lwaxVp9xeIHTcX24c87NUG9xnQ/uR7c+oi9zvCZ7auTWaZBoP3YfnNMRRzj
	hmSXS6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8l4-00000009kdV-2EiV;
	Mon, 16 Dec 2024 10:55:26 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8gt-00000009jwT-2Gu5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:51:08 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43610eba55bso2941405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 02:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734346265; x=1734951065; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xINd9m1enPF0BMWAgJgrGlweRAoQYidCOTnyfqcrJ34=;
        b=Hgqhu5TQ9xEnig9iHDfziobfdKczSc3GQoRxs6kRcPmcHTAZtPKGzXRm2vDvYs3FcN
         UmkdZG5PQTmNPzdT5jvYoVHMgtXPf4k7WJ+VdhPJBRqzHaC+06XEFejnimk0QOcKAvlx
         fREnSHFIMYI4G83M+nZuGwGgiAqZldXSZAATjsUynSGbMP4DR/WEkhVONl+bntjDcBi4
         MR5LYDp0U0UiIQFXg3y+EBAgNt+Vv+TxHlBjmnMo68EHzyz7Jgp/w1Ad/5bHjrNOANsh
         7NrDX5+5ickzsbm22cJt6wV2WFDAV00faMnDW7fJnvQ070HnqVdlUJSuYuAFfAYuWKwN
         ACEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346265; x=1734951065;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xINd9m1enPF0BMWAgJgrGlweRAoQYidCOTnyfqcrJ34=;
        b=cFbQJEdVmO//xFJM6Y9jIHXx/fnhE8IDiJPeESonmBpD6g1fDW81FzM9TqG8NoBVNg
         xSzYDNoe9m1pUdZGF0dL7uRW3Iha/oSSxXZCJYQCdduCgn1nGttzwmXncGHHYzexprTj
         txNead0D579azrNE2NRxhtXKwZVWU54m4O3+FWzcRbze/kuM8YCM5ObvXutPVmoUvK3n
         PFCeCHGAp/60+x1CJhNLSKOKBg5/1wwA8yfl/+dmSP3k1tugk5xNJInWuH1zz3K+f/1L
         f4fZBP0gZYSR3rgiFEmzFT2JnJH79zLVi/FPeA+E6re9zG0Oe3S29Txnq8VjddAY67To
         azhg==
X-Forwarded-Encrypted: i=1; AJvYcCXlIenwP9LTq/7uTiFfUgsSOHrGsjdFNE+qdSzyNCZMHzeu+psTjVfzMIVJFFOdhH7eqmmhM1NZfm5v4clBpeD+@lists.infradead.org
X-Gm-Message-State: AOJu0YyG/bYkn3M/H58CpSLCA2Oqk4ZM9gpuo+7Bf5A17NBVeBpD7/v+
	45BSmaFucsJSsvKCTxGhNmvr7kkNWkVdB7zZ2neBJdn3C4JIhE02k3NYDBgkAiJ6vTJCQkqfGQ=
	=
X-Google-Smtp-Source: AGHT+IEkppS2FfLAL9KMtR1A3yTWzMg2ideEuEAUEGrL411aDfJOIT/6mrKwmt3iUJ4BEP1l0XAETHjHOw==
X-Received: from wmfo9.prod.google.com ([2002:a05:600c:2e09:b0:436:17fc:a902])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3503:b0:434:ff25:19a0
 with SMTP id 5b1f17b1804b1-4362aa94379mr101994565e9.21.1734346265316; Mon, 16
 Dec 2024 02:51:05 -0800 (PST)
Date: Mon, 16 Dec 2024 10:50:43 +0000
In-Reply-To: <20241216105057.579031-1-tabba@google.com>
Mime-Version: 1.0
References: <20241216105057.579031-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216105057.579031-4-tabba@google.com>
Subject: [PATCH v5 03/17] KVM: arm64: Move checking protected vcpu features to
 a separate function
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_025107_577897_F27D938E 
X-CRM114-Status: GOOD (  14.41  )
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
2.47.1.613.gc27f4b7a9f-goog


