Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A2FD78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPI+uRMl4bq1O2uoMReaWsKRsX33Uxa7dW6AA7WPtds=; b=XKplb+n1OfdzeWIBUkhxoNHhCn
	k7p4K3qlaS8Kr0vcu8gMn40Db/p+TwW8b3L9PA5/aroCKDycbVQl2gJKiQVhjsMCg/2/HMjxOeAH2
	LroQn1wHpd67LOoxQQJ0itXWA3FhF2s3jsr0oHLhsfMkrMC7wN9sYBtIFNcm252boJPy8f01uwAoW
	EQIliQbXuYEJOZEayINnRdLXLycEKi2eh3kld4gwyiLZc6W/Zg7x04+8uahyscht1RJQvdfho/p1Q
	rJWKIh8HGAQrIJcE5IU3MW5whVs/lZzHEfsdp++iZfjHevIGWeafq7aVRzyucjKHQqQA0Co6tlvrJ
	qmqM+zHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8oA-00000006kcA-0cJF;
	Mon, 02 Dec 2024 15:57:58 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8eO-00000006iRm-03l1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:47:53 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4349fd2965fso42197925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733154470; x=1733759270; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XPI+uRMl4bq1O2uoMReaWsKRsX33Uxa7dW6AA7WPtds=;
        b=37AMNNawuZYU/3uydaxsj3+gWN6PKciLobLiYgCRqwEkfyxghfevXhNdDYQTYBDKBK
         ooy1aqKa6B7F2SQFFTyKKJNN0U7byjmOTp5g0UGEdEUnCHd88yRNDQJ7prhsvaeEk3/O
         WJsAF3/CMLSh/rRgfnw42WZZddk2dCHjhSmaUZsc/rVjFFArhtUWZ9J45VUIPOLsoec1
         SXQJ1r/iBPjQG2uhobA0LGQuLGPUbbnVAUM5b8Ete8wWbZzUMdhwChUaaRVUMWsXEqtq
         LJ9E9A9zO1dK7kKdrI0Btw/Y9/6+RyuLeRUl0m6Lh741EgrOFMhp3R99xd2Qs0au5xg7
         Jbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154470; x=1733759270;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPI+uRMl4bq1O2uoMReaWsKRsX33Uxa7dW6AA7WPtds=;
        b=h/JYLM+RmtyL5OuEd74iYy6SdAhQsZodK7exdQszOGjGPyVvGzhSRfG5ngERRGuMeM
         Sevx7UY8yEfZ25GOkDlXyJWB5hTiwAlWNNtu+UFYsySDnjZLsA+wlz2vvjNmuZbz5LxL
         oJnJWyudxORpCWTOdRDIZv+tpWOgpBa9D4Gooh2cTSE+2bHhCUJwFvHG/I6aY0+9Ma5m
         WWzGoj/UV4/5iAMVnLkgb87SPktHa7D2d9x5tLU7jo5zoqSCiFBdAtY7AxpA/UHLS0TO
         aABCVsRKKIzMt4r9aFugFHHjfzJ4/9UNDWkpaA0XwQevIFYQa85/T0cxvR0zeSvT6eYA
         UnFg==
X-Forwarded-Encrypted: i=1; AJvYcCWorqUXjk/RaWfE68+ac2Cx4KV49NMWlDQDfKvE/ACCXyW/1dUfFX5jp2dK28B6C0t0rezctw4KdBUT1gOez8qB@lists.infradead.org
X-Gm-Message-State: AOJu0YxXoZiJhYfkFRY0p0L+al9xl7eNCWRmAdvra2ZUK0D6koy1A2R2
	PF1AvEPm97jWaz5gy4ElW0kKY2BRvJb21G1u8YHI322vE4SyAoiAt7wknqk1dsWxyXRfF3ynqQ=
	=
X-Google-Smtp-Source: AGHT+IEp7X86inftmGsQ732cABCtsgiMxDhcYbTSYP08sh4XB67rpwq28/V7TmNj/VlEkuloUGb5UIFDxg==
X-Received: from wmlv12.prod.google.com ([2002:a05:600c:214c:b0:434:9de6:413a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d20:b0:434:a5c2:53c1
 with SMTP id 5b1f17b1804b1-434a9de8bd4mr219924615e9.23.1733154470020; Mon, 02
 Dec 2024 07:47:50 -0800 (PST)
Date: Mon,  2 Dec 2024 15:47:30 +0000
In-Reply-To: <20241202154742.3611749-1-tabba@google.com>
Mime-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241202154742.3611749-4-tabba@google.com>
Subject: [PATCH v4 03/14] KVM: arm64: Move checking protected vcpu features to
 a separate function
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074752_052515_765E0E9C 
X-CRM114-Status: GOOD (  15.05  )
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


