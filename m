Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FA1D41C26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 11:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gs+Q4zsHPmfn9d2bK4NrhKT3oLA9uDx+1JwH1OB2RUs=; b=Ic4Zo62F38zvfZkv/EStOSyldX
	BSxXieXSOkwjXQCPDGVWNfVi3ROvAuYnsT40I8kh2/UTk7dQpmqViJocO46QPxa4aUfX8abbN4svq
	mXsgBxT4T7fEyGmPdu/amh130Z20vDpcF5iGormsLNT7vjANhTJOFIOu1HU8WAneHygnEB81JL/v7
	O5Sdx2ag7PnkVqkWWrVF95Zkg4PZm5eZQptFGtYafZp0yhBI25moUAx9n1s8qrpIHlLF/0qvTK/8s
	l4oil/ekR8H/iiRlDEtWMAMnbxOoaNOvc3EzymvtstUQLqZ6cvsoZYC/14GjzoeHY9V8gAq82DBMM
	htOziF9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTf0H-0000000GYBH-2AaO;
	Thu, 11 Dec 2025 11:38:38 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTf0C-0000000GY8G-2ZGl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 11:38:34 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477b8a667bcso10578795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 03:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765453111; x=1766057911; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gs+Q4zsHPmfn9d2bK4NrhKT3oLA9uDx+1JwH1OB2RUs=;
        b=IDdYQPEb4hQeGV0/UUiXH8Ty8mC52cr9mAOXrXhB/yL8ZWPXox9V0JQEG9NPtRi1Cl
         0Os0yqvjhv+10C0DKEGW30ZjdxcC4JLdv0WduFmXDzF+TfDNggaReUP759iFU+DgyXMV
         unXqd66oG670YC5CU9UQB19eJDKssSRaryssxC5f5MwAcx5MD81n+5XSYcf3qt6susrJ
         aAW8DYE5IpLzLDCbA3vmA8TGThxHiwgWt52GUuQJnW+44XdGMDzTZLkxD0vFicgUrPee
         ji6uADZcQxKnurEjOUvl61It4ikzCjYXiH2eILu2bvafnvRrcHCxfcPWaZAjk1+2NvQ2
         cR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765453111; x=1766057911;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gs+Q4zsHPmfn9d2bK4NrhKT3oLA9uDx+1JwH1OB2RUs=;
        b=PHhOvlociYKLeRuHmf09gOqv7/iDm2sDtpEy58wdkjL5lB3cReBju1vNs90OOALBsf
         UUVgYaba/N3ePKsEZ0CNVW43jNsNEIHYK+HD99pQ/5DJQYiQYTH1xHLfRYRPu9HTrBdG
         go2v0fdTEpPsSqujMWUclDXgNigoV19XBOMDn3inEpnQ3zAnJ2aNwpIjsKELDSZI75Lg
         FQTjZtYv7Z9Qukk0G7p29m07JoS/aBZn58zd3xSelVqtysBRc8Xycm6vtjtvXmBe9JPH
         kF0p9B9AAkcO0NmNeUeF/D3+2EhTdbITYMR8Vgpg8VDIv7taBFS+2WmyQoDiBTtKW+GB
         2AMA==
X-Forwarded-Encrypted: i=1; AJvYcCUKS71H9HLdmISyjeyIIJiFJIj70OXpT1s9SuIlj/JlxlFWzBAfZgoO3HATllLBtoZW9LeyFldyp6oeh66eHyau@lists.infradead.org
X-Gm-Message-State: AOJu0Yzaqs6cIy4r24YfE57lfRih2nio3QmJyx8Y8qidaVDVrTEBx5PQ
	8nH57FncSGvx1n6m/RjGpmATVBzFwHwxECj8WfeV0VoTFyLhKKixyzgFwStrpAXTDJabaTxFx1F
	lBQ==
X-Google-Smtp-Source: AGHT+IGPJRiGq3R7mZWn5CrzLP8vm1wupxaeI5H/gIQqF11dMv1/zMHsAynG4PMZbWmvXJ3VunNPyr+QDQ==
X-Received: from wmcn8.prod.google.com ([2002:a05:600c:c0c8:b0:479:36b0:ff54])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1e88:b0:477:54cd:200e
 with SMTP id 5b1f17b1804b1-47a837449f7mr53974875e9.1.1765453110985; Thu, 11
 Dec 2025 03:38:30 -0800 (PST)
Date: Thu, 11 Dec 2025 11:38:25 +0000
In-Reply-To: <20251211113828.370370-1-tabba@google.com>
Mime-Version: 1.0
References: <20251211113828.370370-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251211113828.370370-3-tabba@google.com>
Subject: [PATCH v2 2/5] arm64: Clear HCR_EL2.ATA when MTE is not supported or disabled
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_033832_666789_61FFE492 
X-CRM114-Status: GOOD (  15.98  )
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

If MTE is not supported by the hardware, or is disabled in the kernel
configuration (CONFIG_ARM64_MTE=n) or command line (arm64.nomte), the
kernel stops advertising MTE to userspace and avoids using MTE
instructions. However, this is a software-level disable only.

When MTE hardware is present and enabled by EL3 firmware, leaving
HCR_EL2.ATA set allows the host to execute MTE instructions (STG, LDG,
etc.) and access allocation tags in physical memory. This creates a
security risk where a malicious or buggy host could lead to system
crashes, undefined behavior, or compromise guests.

Prevent this by clearing HCR_EL2.ATA when MTE is disabled. Remove it
from the HCR_HOST_NVHE_FLAGS default, and conditionally set it in
cpu_prepare_hyp_mode() only when system_supports_mte() returns true.
This causes MTE instructions to trap to EL2 when HCR_EL2.ATA is cleared.

Early boot code in head.S temporarily keeps HCR_ATA set to avoid
special-casing initialization paths. This is safe because this code
executes before untrusted code runs and will clear HCR_ATA if MTE is
disabled.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_arm.h | 2 +-
 arch/arm64/kernel/head.S         | 2 +-
 arch/arm64/kvm/arm.c             | 4 ++++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 1da290aeedce..a41e3087e00a 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -101,7 +101,7 @@
 			 HCR_BSU_IS | HCR_FB | HCR_TACR | \
 			 HCR_AMO | HCR_SWIO | HCR_TIDCP | HCR_RW | HCR_TLOR | \
 			 HCR_FMO | HCR_IMO | HCR_PTW | HCR_TID3 | HCR_TID1)
-#define HCR_HOST_NVHE_FLAGS (HCR_RW | HCR_API | HCR_APK | HCR_ATA)
+#define HCR_HOST_NVHE_FLAGS (HCR_RW | HCR_API | HCR_APK)
 #define HCR_HOST_NVHE_PROTECTED_FLAGS (HCR_HOST_NVHE_FLAGS | HCR_TSC)
 #define HCR_HOST_VHE_FLAGS (HCR_RW | HCR_TGE | HCR_E2H | HCR_AMO | HCR_IMO | HCR_FMO)
 
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index ca04b338cb0d..87a822e5c4ca 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -299,7 +299,7 @@ SYM_INNER_LABEL(init_el2, SYM_L_LOCAL)
 	isb
 0:
 
-	init_el2_hcr	HCR_HOST_NVHE_FLAGS
+	init_el2_hcr	HCR_HOST_NVHE_FLAGS | HCR_ATA
 	init_el2_state
 
 	/* Hypervisor stub */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 052bf0d4d0b0..c03006b1c5bc 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2030,6 +2030,10 @@ static void __init cpu_prepare_hyp_mode(int cpu, u32 hyp_va_bits)
 		params->hcr_el2 = HCR_HOST_NVHE_PROTECTED_FLAGS;
 	else
 		params->hcr_el2 = HCR_HOST_NVHE_FLAGS;
+
+	if (system_supports_mte())
+		params->hcr_el2 |= HCR_ATA;
+
 	if (cpus_have_final_cap(ARM64_KVM_HVHE))
 		params->hcr_el2 |= HCR_E2H;
 	params->vttbr = params->vtcr = 0;
-- 
2.52.0.223.gf5cc29aaa4-goog


