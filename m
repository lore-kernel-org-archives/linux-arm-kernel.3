Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA752E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 11:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vkc2lJTmOE5SwiXWL8j1pu4J4OtvYGFDXBGNRHI6lfg=; b=LYNSoA02EEttr6Yfb/SvKvqxyb
	g4zfzaAQQirFc85OGllLJzdmwMJdez0lqlh0y1Doe3Jfz4KfjroPlH7Pl+9WH4WRjjBw4hwc0zO8N
	vdLbyXDizL2uzg8+kMkN1uRkJMUoInawDelzQr4hgwQSLX3Hml9Gq77qIUOwQg2g6zw7eWStwneUX
	FXysXVAIRhu/3bdyfivIy/Wia/I1RmF4xGSokwd5ajS7gdK6g70x1JTb2OydRUbC5ASKx6ywN6UPi
	y5CBjTELUnebKmIaExU00Jeeq6D9/AGm4IAPtU5tzkQPmNLrZAmcMmxS9keypGdZy2YAjNxhwlSQe
	o6E/XuVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8zq-00000009mvQ-1hVv;
	Mon, 16 Dec 2024 11:10:42 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8hN-00000009k38-2mpH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:51:38 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-436219070b4so21337965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 02:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734346293; x=1734951093; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vkc2lJTmOE5SwiXWL8j1pu4J4OtvYGFDXBGNRHI6lfg=;
        b=qwXFtT0wXfugcBNWXgRPHRcalgZtxKLZqVULirbm3HkTaNMXzB0r0wtoUicj3ZUtgB
         ripJh4zxO8p6X222c0EG3/A2914hKnZHs399UOnGdhMeol2ZIlnnh72bN082znT5d13r
         RQksltFmttHz4FOpKwlsZeNLzv+bn81xpR/ntJjt5mOlc/XoqATLdh6gdutcEEm4Vzwk
         w05VGQdU0EGZKQXwJiP2m9Da9FKKOIt3Z7Wx500X8bBTFKXC64DkIN66RcOxKztccVvA
         7dEAbu9Z4ZgoDKCuy1+qBUAF++ZchcDQTblX0BlG7M7cgwnoy1RaTTAJKEkuxISDiY/n
         vCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346293; x=1734951093;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vkc2lJTmOE5SwiXWL8j1pu4J4OtvYGFDXBGNRHI6lfg=;
        b=wjpQ/mkJi2hoQzK3cCJ5JRYEmRcxDFE+SNSrRAc8+BYfIpeYVXMX059ErDHSHOpvAz
         rnboTL0FdorQGaxYrZHGZYCbcjZTvD7gJSUA67N5j7qGlsy1vbHhk+iZHiRQRPCAE/Zd
         e6RqKHRCBjqnZCKAbVHQgJ97xIWQawEM2NMj9NURAv9yHYCcgX6e+js556EtldiQJ/BN
         MDI3HcTxaFPrYD5RI4QzU+ny3R+2J3AwOj2fCMXK/VHRIeN3PrqWtGR6Is6Yzs/zTaOm
         mUFq/92tku5/Lm48RIbIdtWa0Iyd2B1jzBYqF9X0XqhaP+z3ye6dFK4vjQAGpXhLpB6v
         42LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNMDOCG6VebKZLfGziKHzRGFG+t7yaQnYFaHDCn5upfnSItwWVF53XcDKxpX/i6Ae5hcQtWFaXUstddxR00ICh@lists.infradead.org
X-Gm-Message-State: AOJu0YzuZmRgz3A/WbRV9KVj/Rm9DHts/uqRwbK6x5tPzVvghF0Dv1hG
	7Ws5AQaRfw328PUitHPkbx4k1iwCTj6Rh4bd3LsU8AdYeF4e/kuceOSmP2bvMsUTvsDdsKiU3Q=
	=
X-Google-Smtp-Source: AGHT+IE6dzPeC92Qjqfbxx0NlZAcvO57FuNuJtWGIFlLNf+nKTtzoaYF9JxHvI4ZxzEANAaeGwhjrxt5iQ==
X-Received: from wmsd5.prod.google.com ([2002:a05:600c:3ac5:b0:431:1903:8a3e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:871b:b0:434:f0df:a14
 with SMTP id 5b1f17b1804b1-4362aa147f8mr118538075e9.2.1734346293709; Mon, 16
 Dec 2024 02:51:33 -0800 (PST)
Date: Mon, 16 Dec 2024 10:50:57 +0000
In-Reply-To: <20241216105057.579031-1-tabba@google.com>
Mime-Version: 1.0
References: <20241216105057.579031-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216105057.579031-18-tabba@google.com>
Subject: [PATCH v5 17/17] KVM: arm64: Use kvm_vcpu_has_feature() directly for
 struct kvm
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_025137_699726_96CC06C7 
X-CRM114-Status: GOOD (  10.33  )
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

Now that we have introduced kvm_vcpu_has_feature(), use it in the
remaining code that checks for features in struct kvm, instead of
using the __vcpu_has_feature() helper.

No functional change intended.

Suggested-by: Quentin Perret <qperret@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/nested.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index aeaa6017ffd8..92e746040de4 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1021,8 +1021,8 @@ int kvm_init_nv_sysregs(struct kvm *kvm)
 		res0 |= HCR_NV2;
 	if (!kvm_has_feat(kvm, ID_AA64MMFR2_EL1, NV, IMP))
 		res0 |= (HCR_AT | HCR_NV1 | HCR_NV);
-	if (!(__vcpu_has_feature(&kvm->arch, KVM_ARM_VCPU_PTRAUTH_ADDRESS) &&
-	      __vcpu_has_feature(&kvm->arch, KVM_ARM_VCPU_PTRAUTH_GENERIC)))
+	if (!(kvm_vcpu_has_feature(kvm, KVM_ARM_VCPU_PTRAUTH_ADDRESS) &&
+	      kvm_vcpu_has_feature(kvm, KVM_ARM_VCPU_PTRAUTH_GENERIC)))
 		res0 |= (HCR_API | HCR_APK);
 	if (!kvm_has_feat(kvm, ID_AA64ISAR0_EL1, TME, IMP))
 		res0 |= BIT(39);
@@ -1078,8 +1078,8 @@ int kvm_init_nv_sysregs(struct kvm *kvm)
 
 	/* HFG[RW]TR_EL2 */
 	res0 = res1 = 0;
-	if (!(__vcpu_has_feature(&kvm->arch, KVM_ARM_VCPU_PTRAUTH_ADDRESS) &&
-	      __vcpu_has_feature(&kvm->arch, KVM_ARM_VCPU_PTRAUTH_GENERIC)))
+	if (!(kvm_vcpu_has_feature(kvm, KVM_ARM_VCPU_PTRAUTH_ADDRESS) &&
+	      kvm_vcpu_has_feature(kvm, KVM_ARM_VCPU_PTRAUTH_GENERIC)))
 		res0 |= (HFGxTR_EL2_APDAKey | HFGxTR_EL2_APDBKey |
 			 HFGxTR_EL2_APGAKey | HFGxTR_EL2_APIAKey |
 			 HFGxTR_EL2_APIBKey);
-- 
2.47.1.613.gc27f4b7a9f-goog


