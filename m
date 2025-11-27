Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017B0D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8t7JCSo1LSco+lfW6s2Jl4uvle1Dm+5io69ZjZFXR4=; b=Kt+oEhG1sq48SZ/Hul4x7nvhZJ
	lhPTiMeKLVB4lWbLEeUJxIMUJt1AiYno4FvtPwfV9i6ELNIovkVkBKDOujHqjS+GYe3NmD+dgIr3W
	9BerAi9tN51Pk0a7s6nQDG/NjhY9aXEFHTn3I86ZMlqjqkZHnrDypPvsUDB684aWlitd1oa+o51NF
	+jw+2scyJizbRWf6wg1UZByXibNUddpqqXN9CWKTc3IiDnOQMAzBtdtZKEuqIquRCqNeOcXt7B6Zk
	wT/Y7rAi8ZBo8oZvfVafRabmIihs4k4mbGGHHCs2+hzENSIDBmrnY6v6jIyIw/XjSdq4aDrf/SAU/
	aSmgNOBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOb0w-0000000GXi7-15Ls;
	Thu, 27 Nov 2025 12:22:22 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOb0p-0000000GXej-2fy9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:22:16 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-429cce847c4so499544f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 04:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764246133; x=1764850933; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K8t7JCSo1LSco+lfW6s2Jl4uvle1Dm+5io69ZjZFXR4=;
        b=ODH2tnpkCV5NFqU5GswOllS6oO1CpoR922/imCwmQHLVaZMXLwfG6KHcI0cc2uuFnj
         GQyyOtHucWwTrLsVkT8WkjXDa1d9EWPsvEchRvLJMLPlohw7zKHyOLtvILmCD74KNwJ2
         x70XH17Tp+H0s0Qz1eh3Ew2zGYq8JzJzfjFW80+bwFHcw54kOf2sat5CiCxjpUGo/8ft
         LrfkA/mZMxRwA7e59NE7OOZJrVqOi98B9e0j4gt18tU1w0B7ZWKXzoYgIWbE23jXTI9N
         FGZ/BbnniLMEDPAuF72NuQafYX8jySHDWl1kxwPk/w4xO3gRZeEZqwg+hYCnjY75S/RW
         UCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764246133; x=1764850933;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K8t7JCSo1LSco+lfW6s2Jl4uvle1Dm+5io69ZjZFXR4=;
        b=CSyk+nH0JDbJsIIfdBxtQgVHdhEjNroeYa1pA1z+/4RU0l3rSnoX25wvC6X0D29Tf/
         MPT7HsektoRwPS6s+1VqoDVGwFqn7ojkzp0hojjDK00bXY/7rFgTL9ndnsJiYWA1i9+D
         o4QMu5PoGKjiVps0euqTVv1YQsq+Rw5kVBHwfrgbP3Z4lCDzajrr+flJztd1rkwqVuL+
         UzEIpJz22Fqvom8nxWCA0HvswT4WOCvHij4Ccu8bKA+f5fwJCF/JOB8yvjKifcj4Z4nm
         gYIGcXArMiTaNaXIVkhAQuDWmCwtmjOQ3vQJyjqcHzZBrjdEEtruGQbvifh/v8Bjhu4P
         itWw==
X-Forwarded-Encrypted: i=1; AJvYcCWC75uoCeXk3bNZFxWGLYOXZKw1DHX0Lb2G3eqO+rXylFgNexFHUDmcZwWPyLqryDm6DijP5JnLwz11KYxlOn0K@lists.infradead.org
X-Gm-Message-State: AOJu0YwOosFEBzI1puBRxtQ5QeBIzzj/OdKfThv1RGCf0tVBI7a0mn4o
	WeknnQJ1SnsmrgFldg+3SnUHUHjdiLZCilBD7R9fSKwnezUNZTd2tN11dC8PbwGMrRrd6HyVR07
	xDQ==
X-Google-Smtp-Source: AGHT+IEqSAdYc8YHjn0eimTFu8K6zN3jS5v9Ar+BYfq+408jOZe7QNhivJMHsv31TKVmV6tQ2R82jdCQ8g==
X-Received: from wmpx22.prod.google.com ([2002:a05:600c:1896:b0:477:a181:1919])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5491:b0:46e:32d4:46a1
 with SMTP id 5b1f17b1804b1-477c01c36d7mr211055005e9.22.1764246133472; Thu, 27
 Nov 2025 04:22:13 -0800 (PST)
Date: Thu, 27 Nov 2025 12:22:07 +0000
In-Reply-To: <20251127122210.4111702-1-tabba@google.com>
Mime-Version: 1.0
References: <20251127122210.4111702-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
Message-ID: <20251127122210.4111702-3-tabba@google.com>
Subject: [PATCH v1 2/5] arm64: Clear HCR_EL2.ATA when MTE is not supported or disabled
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_042215_737488_5005CF8E 
X-CRM114-Status: GOOD (  15.85  )
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
2.52.0.487.g5c8c507ade-goog


