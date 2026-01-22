Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA223D6261C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+k1LmUzPe66jfGdVIo8KvWNogHSOvBXaX+ewOgvEHqk=; b=vOl8e2hHUKHMbia1lnRZqhKKkc
	GinGwTl8GxSjKfz1YdhLN6Ui05AUAY7QM/H0y+zuEH8TsMXOqozBYpTMuVMSTR0u00u4NizAC1VuK
	NNm6Ckf3fafZu6QtsyDV+qfFZEmV5GVEMVVjPsMQZ6FqNdHa2OrB7qFABnH/mclg+0fv+GtYmKuhh
	qSr0ib0CMW+9oxhk1oH6qPRcVcz+QgdD5ljZ7B63TMpnGfkb9CoPau1X3Ieg4neuohSSxJWUeo6BN
	2dOzanbqu4X6ecxsMGLBnqeC6VAXcC3ybsR+hX59EE9kL7Yd1wim+oIvnwisPg4K619kO6lM2lIZr
	TYJnD5Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vislh-00000006x2F-0yVa;
	Thu, 22 Jan 2026 11:22:29 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vislb-00000006wz7-17ic
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:22:24 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-435aadfaf4eso380743f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 03:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769080941; x=1769685741; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+k1LmUzPe66jfGdVIo8KvWNogHSOvBXaX+ewOgvEHqk=;
        b=KpGvafwdU+UFeXRKvEdjYnfVd0VfhEIJTAowMe2vuBQd/qXRpRTHN64m8DuyWGUVSF
         q4lDF+TgIrHJZi11xtL2yUMx5KRJZS0mSI7zJ+PB0z1ktqR1sSA8PpElwLjkZsFhMjsF
         dMiy10yV6P6xb4l/r+298BoXo84oMuUlC6eCyWP/VAO3UdlbLm1BlTU4nsa+MZvaKOWG
         8gW6Ruy0v1+bXGi+93vIKBASKCG6F7K0A5yg1+B9jFxLN30/eFdjPb1ZgijJhXzwp0WA
         k3ep2baur/tYNWarmzQ1eHHhbpjLl3uopeghwYFh8NHOlVekPvAb9XNS+P7Qm7Tj1m24
         q0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769080941; x=1769685741;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+k1LmUzPe66jfGdVIo8KvWNogHSOvBXaX+ewOgvEHqk=;
        b=cve1tkjgFtThZ3onlzmXubbLe99AHSE5ZEWD8zvPgEu+0qCsBqdkCjJQkXVKQ8z3Mt
         N/LrmtYApKxlEgEo3aLoOmXF72bXfI/6OTUEOR5un7XBAvFBYa1SsMF4LgN6oIMF6qdQ
         Ox4Nam7prTydbRFkNS615DlVpFJ14rQ9JVgR36nFzpd9vpGGHHkd2mZdq5rRfN78G8pU
         URcPuOzc5XUXwPuDHLf4ZWWFYD0KusQgBg58q7+vz1yaZwf1iaMxlk4Na0pZrTKtY335
         xfS5Mlb4Kl+MxChIjayAqKxvPia+woCcJZbFryA3V6Fu8qMFLHHtfCIR4i2HDYSPm/lR
         VrDw==
X-Forwarded-Encrypted: i=1; AJvYcCW1XzUGjhRjwmrxYosjrAo69V0VMWD6Fwi+ty8AgprRh1M7gXDFkNqSr1KtD9NmgmZ9MdVuv00Pc+bIoYF1Ok+N@lists.infradead.org
X-Gm-Message-State: AOJu0YybO0OfPqFEWVyRvKtjpj5yF1AF3LA6LQWcjZsXbbrgcQaOUe++
	fwkSYRBqI/B5CVLv9huOhHTaAE+3P28mjThkqiA83/O0gm/oZSr3DeYzn2UxdIjgoIKTkX0Hkt4
	DhA==
X-Received: from wro14.prod.google.com ([2002:a05:6000:41ce:b0:435:9760:a8f1])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:48:b0:435:729b:c390
 with SMTP id ffacd0b85a97d-435729bc399mr20497315f8f.47.1769080940774; Thu, 22
 Jan 2026 03:22:20 -0800 (PST)
Date: Thu, 22 Jan 2026 11:22:16 +0000
In-Reply-To: <20260122112218.531948-1-tabba@google.com>
Mime-Version: 1.0
References: <20260122112218.531948-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122112218.531948-3-tabba@google.com>
Subject: [PATCH v3 2/4] KVM: arm64: Trap MTE access and discovery when MTE is disabled
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_032223_340135_8619D33F 
X-CRM114-Status: GOOD (  16.43  )
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
configuration (`CONFIG_ARM64_MTE=n`) or command line (`arm64.nomte`),
the kernel stops advertising MTE to userspace and avoids using MTE
instructions. However, this is a software-level disable only.

When MTE hardware is present and enabled by EL3 firmware, leaving
`HCR_EL2.ATA` set allows the host to execute MTE instructions (STG, LDG,
etc.) and access allocation tags in physical memory.

Prevent this by clearing `HCR_EL2.ATA` when MTE is disabled. Remove it
from the `HCR_HOST_NVHE_FLAGS` default, and conditionally set it in
`cpu_prepare_hyp_mode()` only when `system_supports_mte()` returns true.
This causes MTE instructions to trap to EL2 when `HCR_EL2.ATA` is
cleared.

Additionally, set `HCR_EL2.TID5` when MTE is disabled. This traps reads
of `GMID_EL1` (Multiple tag transfer ID register) to EL2, preventing the
discovery of MTE parameters (such as tag block size) when the feature is
suppressed.

Early boot code in `head.S` temporarily keeps `HCR_ATA` set to avoid
special-casing initialization paths. This is safe because this code
executes before untrusted code runs and will clear `HCR_ATA` if MTE is
disabled.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_arm.h | 2 +-
 arch/arm64/kernel/head.S         | 2 +-
 arch/arm64/kvm/arm.c             | 6 ++++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index e500600e4b9b..752e3e1604e8 100644
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
index 4f80da0c0d1d..aeac113e5e74 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2044,6 +2044,12 @@ static void __init cpu_prepare_hyp_mode(int cpu, u32 hyp_va_bits)
 		params->hcr_el2 = HCR_HOST_NVHE_PROTECTED_FLAGS;
 	else
 		params->hcr_el2 = HCR_HOST_NVHE_FLAGS;
+
+	if (system_supports_mte())
+		params->hcr_el2 |= HCR_ATA;
+	else
+		params->hcr_el2 |= HCR_TID5;
+
 	if (cpus_have_final_cap(ARM64_KVM_HVHE))
 		params->hcr_el2 |= HCR_E2H;
 	params->vttbr = params->vtcr = 0;
-- 
2.52.0.457.g6b5491de43-goog


