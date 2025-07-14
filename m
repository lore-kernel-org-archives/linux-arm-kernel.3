Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3D3C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 23:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJZ+xwDjyMIGIgaKCFQ3UPZ4fJ+Lh0B/3NWWuRP6Bzw=; b=Gma7z0ozkPyxqtt0ftMhmcvK3b
	knAjuusZwLWR8Fx75JK0/mrRCLi79bVLPmmaOV2Lgrogco8phnT5+MCDYMgqxYURpR52slLb8vw1+
	QRsMFIQt+PETlaEQLtHCnH+Yh2M24/HU+DmVlsfyCIWelK+pZKDce+/pwsvXfR6Hs6QVOYOxZTFaO
	fesw2bHPHw0B3eS3PDVUReGSdcHzasifHRrWdf+NASw9UOqdvFdjqIZczi0lxRW13zT8BZQrqwW4j
	C+qnfLqff7NPyvQRfSZ7F7bW25M5X0jRvV2aVYQ5rECCPv4S7IDrLFvokpHrEmpymceSm3oKbYnJv
	/ZADO46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubSVZ-00000003X73-3P6H;
	Mon, 14 Jul 2025 23:22:53 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS95-00000003SSp-3CMq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:59:40 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-8730ca8143eso546251039f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 15:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533978; x=1753138778; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SJZ+xwDjyMIGIgaKCFQ3UPZ4fJ+Lh0B/3NWWuRP6Bzw=;
        b=usFY4Cjq4T3lunZvVwA2itEL88DvgqSIRa8dyTDrnjeZVF0Q0cpHkKaQ835tFrGI94
         CZT0rsmxVbPDtpx7uepPTErvX8BA2AAJUJbuo+SRaNAzwbVEvIFuhdy/RjUCbVgFlWOu
         SDm+GWZLoxYiwT9jr7HVxnduLHjLlHgX4ALhJZcgi2VWuADObRlMnu0lVRb9+CQwO2sP
         Na7ftgH/JSQMS0G3TXlbtNDVKye5eVmam+gCd0Mrs2A7qutTKBhvyU2KvNzKyaWtQoqd
         /GtFKIzsgvRb5UtVHavhtuySci+v/WaW9w3lBCqmdJKh/Gf46owgfoYg35azdL+0tnKN
         bcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533978; x=1753138778;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJZ+xwDjyMIGIgaKCFQ3UPZ4fJ+Lh0B/3NWWuRP6Bzw=;
        b=IjovfhkC63/yNFMhP26uhUqK1r7y/wsVeeKijNPRqDD6GlMTpCXdtal2/btCYKJK6m
         s5pdpavlsrcaUVdvATzx04mNu0sRjrS28rBevcth3jzRmpK2aL+8SEkyygersdxkdznR
         fVamWYMXqny8cQh8kA+9D/C2m+nGRpvQabHSeti6kspSUgWh2ACPwJ7jog/FXEgQ3zkR
         mOycuaYVU3JNmSyO9DCCCZAeMKir+WjMICKC6KY6SNHUJZSNBrn66dpFeqPryV2P9oPd
         SZKbnwMbBNk5+DGiXrobV/qa+/YOHv3vWzbQT77VkGfsUsBLiooeBf8n/Dc60+uwvLBK
         NTNw==
X-Forwarded-Encrypted: i=1; AJvYcCU0SQqopE+O4eW8fk1ekDxQR4jl3GS4pQXY+1keoA0o0rYlQYa/EwWyIh8rFySUnlGE+pDa39cGrtSmT99EN1EX@lists.infradead.org
X-Gm-Message-State: AOJu0YwGKa7W6jXHDgP8zIPfLL4uw02vzIfaavM3VYpDdVOaZB8IQNiy
	2+jOmBylRhCEAaXbgU/ifFSD0U36OO42Ij93pPJEf4aMiUGTfcEI0cnvl9YgZ8HUu1JLSr2tDty
	yAPqsZiWF9anB/8KVFwH0Bo8ShQ==
X-Google-Smtp-Source: AGHT+IGcsfYXq37Q6WkECHaXfuTpZ4xUC2MHD5EzXhz1ZNa8q/Bm5uigtDkeVAlpUUfariaZ73ybTmOi3F0pZZ07NA==
X-Received: from ioxw3.prod.google.com ([2002:a05:6602:5c3:b0:86c:9981:d21d])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:3411:b0:876:b17c:dec3 with SMTP id ca18e2360f4ac-879af05ab13mr188823039f.8.1752533978200;
 Mon, 14 Jul 2025 15:59:38 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:59:02 +0000
In-Reply-To: <20250714225917.1396543-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250714225917.1396543-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-9-coltonlewis@google.com>
Subject: [PATCH v4 08/23] KVM: arm64: Introduce non-UNDEF FGT control
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_155939_803469_91597BD5 
X-CRM114-Status: GOOD (  18.38  )
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

From: Mark Brown <broonie@kernel.org>

We have support for determining a set of fine grained traps to enable for
the guest which is tied to the support for injecting UNDEFs for undefined
features. This means that we can't use the mechanism for system registers
which should be present but need emulation, such as SMPRI_EL1 which should
be accessible when SME is present but if SME priority support is absent
SMPRI_EL1.Priority should be RAZ.

Add an additional set of fine grained traps fgt, mirroring the existing fgu
array. We use the same format where we always set the bit for the trap in
the array as for FGU. This makes it clear what is being explicitly managed
and keeps the code consistent.

We do not convert the handling of ARM_WORKAROUND_AMPERE_ACO3_CPU_38 to this
mechanism since this only enables a write trap and when implementing the
existing UNDEF that we would share the read and write trap enablement (this
being the overwhelmingly common case).

Signed-off-by: Mark Brown <broonie@kernel.org>
[Removed unused vcpu argument from macro]
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_host.h       | 6 ++++++
 arch/arm64/kvm/hyp/include/hyp/switch.h | 7 ++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 92d672429233..f705eb4538c3 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -301,6 +301,12 @@ struct kvm_arch {
 	 */
 	u64 fgu[__NR_FGT_GROUP_IDS__];
 
+	/*
+	 * Additional FGTs to enable for the guests, eg. for emulated
+	 * registers,
+	 */
+	u64 fgt[__NR_FGT_GROUP_IDS__];
+
 	/*
 	 * Stage 2 paging state for VMs with nested S2 using a virtual
 	 * VMID.
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 7599844908c0..7fe5b087c95a 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -153,9 +153,9 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 		id;							\
 	})
 
-#define compute_undef_clr_set(vcpu, kvm, reg, clr, set)			\
+#define compute_trap_clr_set(kvm, trap, reg, clr, set)			\
 	do {								\
-		u64 hfg = kvm->arch.fgu[reg_to_fgt_group_id(reg)];	\
+		u64 hfg = kvm->arch.trap[reg_to_fgt_group_id(reg)];	\
 		struct fgt_masks *m = reg_to_fgt_masks(reg);		\
 		set |= hfg & m->mask;					\
 		clr |= hfg & m->nmask;					\
@@ -171,7 +171,8 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 		if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu))		\
 			compute_clr_set(vcpu, reg, c, s);		\
 									\
-		compute_undef_clr_set(vcpu, kvm, reg, c, s);		\
+		compute_trap_clr_set(kvm, fgu, reg, c, s);		\
+		compute_trap_clr_set(kvm, fgt, reg, c, s);		\
 									\
 		val = m->nmask;						\
 		val |= s;						\
-- 
2.50.0.727.gbf7dc18ff4-goog


