Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D8CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFNa8Q+6QowOPJl++ePGanSGMFsq1Ca84tP7hBZzTlI=; b=Ni4QUzHDuXl9J2SCReV0jP8r1M
	CKBiMPD+NUE94La7ezWfFVh+0d3yIQGKJ3MrXcqKEqJzbDmuywPci589PYW2lVhN4/uWmWdyQvyrL
	0mkngH4hNNhiuTME9SNQC2pozFwPG+/51Ei8D5Z3p9Szzb6rGXJoUJnpugEePOBbXC7qOP5Omcckg
	VUVV5obTCmp82sVYLymX0K/6RpioFqP1utv7lfjoQRrU6zble+F+nMK1+CauDh4002aiV2jD7lXze
	0x5qrc/PnD1srglIF+rUtDhor4oX2MCd5e03XILdPXAvOEu6PYFLbbP3+j/ncfC+1/kLV+Ch1G3l/
	KKTzrs4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGd2-0000000Bp7N-0d5l;
	Tue, 04 Nov 2025 12:59:16 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGcy-0000000Bp3u-1hza
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:59:13 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4710d174c31so59510415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 04:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762261150; x=1762865950; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DFNa8Q+6QowOPJl++ePGanSGMFsq1Ca84tP7hBZzTlI=;
        b=21k3Cf3CWmc0bRBmax1t4whULZ7NExUUmUptrBDNiosTEjNr+zv0/JgCgd/qIJdmOT
         WpLRXhTq0NBm1TYfrjkadl02bvCVDVlMOh7bBzl2D58J4TOgDps+kNXt71Lz7FU/LRcN
         RxpLyI9E9vaxnB/RBYZuKwkSWCTvQyAbIpIAjAG0V2iyj8bBz5M81NvYuhJ1ch0gtT1T
         CEdhtISB9WiqzST+kev1sqE2D19Qr5nJqf2bjLP11VDOm8FibNiAs2oV97iDtQwwRPwB
         bV3oOpnxATmDumq2rycFOMAXsMqPDgI/LxFMWrz8MuCRjhF+72Oyzrg6gguq8p4WowFd
         FHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261150; x=1762865950;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFNa8Q+6QowOPJl++ePGanSGMFsq1Ca84tP7hBZzTlI=;
        b=i5ndB9KpQKgWZ2fXa8TdtH+/qiX/gWqu0vvnVE6FElrFCKFrVANEUAdqiiJP4x9o5/
         78KWsYX+7EBt5whM9j57SW2hzMCatjs1E1x8Y4XCv+9/394629FYqCLJ8NwHh0KTxUOv
         NNRuOMgWq9MFkx8JwfoaBVo3B9v3M9HziZloSYafo8O/Qk4HOiwh4keGgGL4UezOn62v
         IhF1vqmk/8nTYXBfH4+9TNLK7ufSix+ryW9b+ST8sy1pV7o9rRbJ9xtb+Kit83W4cAAe
         PPwexu4NCsVRZM7quHk4+xMsgT/U77igljc++fN//AW49YgGETziN30huNRNvaRyx1ic
         h39Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/q3m258sszHWpdQb+dXgjtNBE8Ur+fxoJ98aeEdunlPiycQB/uQV3qNp9QFz9RVLBAPxo4SjAJJFJiceoZDiM@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxga1gbyGnj2hFYFZDPI6atI/mfmIUSfitHu9JZw83XRGy4+Ni
	c/frILt/O0+bavCCwgLGu8KHVUximzrbb3oD1nu+7qNORClBS6HhzHyFsazVO5oAvAEK5Amu8ul
	7Vw==
X-Google-Smtp-Source: AGHT+IGTc02+16G7D3Eoo2FaQw/VYtwtLC1xToRD8P5tjdCEwwml9nC0y9kN+6d1sQAh8I5L6ersq2lLgg==
X-Received: from wmbje18.prod.google.com ([2002:a05:600c:1f92:b0:475:de83:8f42])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b8b:b0:471:989:9d7b
 with SMTP id 5b1f17b1804b1-4773086d53amr155827455e9.21.1762261150630; Tue, 04
 Nov 2025 04:59:10 -0800 (PST)
Date: Tue,  4 Nov 2025 12:59:02 +0000
In-Reply-To: <20251104125906.1919426-1-tabba@google.com>
Mime-Version: 1.0
References: <20251104125906.1919426-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.997.g839fc31de9-goog
Message-ID: <20251104125906.1919426-5-tabba@google.com>
Subject: [PATCH v1 4/8] KVM: arm64: Refactor vcpu_set_hcrx() to reduce indentation
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_045912_463746_77BFCFF7 
X-CRM114-Status: GOOD (  14.92  )
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

Invert the main conditional check in vcpu_set_hcrx() to return
immediately if the CPU does not support FEAT_HCX
(ARM64_HAS_HCX).

This refactoring pattern avoids wrapping the entire function body in
an 'if' block, reducing indentation and improving readability as the
function continues to grow.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h | 54 ++++++++++++++--------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 7880e8290a20..034e1b39de6c 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -674,40 +674,40 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
 
-	if (cpus_have_final_cap(ARM64_HAS_HCX)) {
-		/*
-		 * In general, all HCRX_EL2 bits are gated by a feature.
-		 * The only reason we can set SMPME without checking any
-		 * feature is that its effects are not directly observable
-		 * from the guest.
-		 */
-		vcpu->arch.hcrx_el2 = HCRX_EL2_SMPME;
+	if (!cpus_have_final_cap(ARM64_HAS_HCX))
+		return;
 
-		if (kvm_has_feat(kvm, ID_AA64ISAR2_EL1, MOPS, IMP))
-			vcpu->arch.hcrx_el2 |= HCRX_EL2_MSCEn;
-		else
-			vcpu->arch.hcrx_el2 |= HCRX_EL2_MCE2;
+	/*
+	 * In general, all HCRX_EL2 bits are gated by a feature.
+	 * The only reason we can set SMPME without checking any feature is that
+	 * its effects are not directly observable from the guest.
+	 */
+	vcpu->arch.hcrx_el2 = HCRX_EL2_SMPME;
 
-		if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, NMI, IMP))
-			vcpu->arch.hcrx_el2 |= HCRX_EL2_TALLINT;
+	if (kvm_has_feat(kvm, ID_AA64ISAR2_EL1, MOPS, IMP))
+		vcpu->arch.hcrx_el2 |= HCRX_EL2_MSCEn;
+	else
+		vcpu->arch.hcrx_el2 |= HCRX_EL2_MCE2;
 
-		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_V))
-			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
+	if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, NMI, IMP))
+		vcpu->arch.hcrx_el2 |= HCRX_EL2_TALLINT;
 
-		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64))
-			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnALS;
+	if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_V))
+		vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
 
-		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA))
-			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnAS0;
+	if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64))
+		vcpu->arch.hcrx_el2 |= HCRX_EL2_EnALS;
 
-		if (kvm_has_tcr2(kvm))
-			vcpu->arch.hcrx_el2 |= HCRX_EL2_TCR2En;
+	if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA))
+		vcpu->arch.hcrx_el2 |= HCRX_EL2_EnAS0;
 
-		if (kvm_has_fpmr(kvm))
-			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnFPM;
+	if (kvm_has_tcr2(kvm))
+		vcpu->arch.hcrx_el2 |= HCRX_EL2_TCR2En;
 
-		if (kvm_has_sctlr2(kvm))
-			vcpu->arch.hcrx_el2 |= HCRX_EL2_SCTLR2En;
-	}
+	if (kvm_has_fpmr(kvm))
+		vcpu->arch.hcrx_el2 |= HCRX_EL2_EnFPM;
+
+	if (kvm_has_sctlr2(kvm))
+		vcpu->arch.hcrx_el2 |= HCRX_EL2_SCTLR2En;
 }
 #endif /* __ARM64_KVM_EMULATE_H__ */
-- 
2.51.2.997.g839fc31de9-goog


