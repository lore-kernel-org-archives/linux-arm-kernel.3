Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B23FD5CC88
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCB5nfE7CGuNRBvDe++G1u/AhX4jCAZ21H5NNpZdneM=; b=3SBZysseEtyfM1aQ2OZcPDSA/k
	Un64OMeSPbKz9H0KppHsIuRAw2nYUPkwkesCwWsx8eP4FTjbeFBJJexrVe/esBr3HsCq3OgorhPuV
	fEVUiqDMNhB0tKsuBuYdqFiHDU4z1LBW/kOGgM/DrJ6KecKzut16NCzU40Z41n8a64q1PRI2BNz8z
	AguVpOnnLpX3GYnAga9A2vufBvpO38W0ZyGDfDTWc2k3kJ02X7fWCWqGdD3U4OjAs9wZ5056xardF
	5IdOKbKtoZ6+qgCJIuayUPIYS2jXCUuElwLVX0SDemev8M/VNjIcsehdav6w2k8kggXjxZj3J3m2g
	kuc/f1tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65pn-0000000HXFH-2rTC;
	Wed, 30 Oct 2024 10:21:51 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65mY-0000000HWVv-35fp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 10:18:32 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-37d45de8bbfso4454273f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 03:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730283508; x=1730888308; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GCB5nfE7CGuNRBvDe++G1u/AhX4jCAZ21H5NNpZdneM=;
        b=RSqTO9aaT8Ie6CzSmOudHt6BniXqmXNyMbiU1J43DoQ9JAp7H+llDM0/qeWuvg12Ae
         OHQm20wdiHsEMSiATSkv4EGrzsGDNN8/yJQEE1U10j1DiFuhzQ6o+HQ8N6Np0JLzpU3o
         FJOIB9B7bJ24R6HwIZEWe3KDS6KDNr5i8wVTN2CoRRqu1afhnLXz8C0+WWBTp65ZnlFm
         ePpn/umPUXmMRdeBtTkuu4gAPhYiPKaFa80h3mdE2FqKAiEwnyn1pGht4xn1nungqYFB
         WlXAtgutfQdLK68pU+CixWYaUSgKtyY+a0FjWvjpcvqaKZ7IokeCOpUZcQ2In1ctuc3L
         BIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730283508; x=1730888308;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GCB5nfE7CGuNRBvDe++G1u/AhX4jCAZ21H5NNpZdneM=;
        b=tR1Ya1PfUT+6NCANOZyhZZS1P4Gb+SgMT2gmKYqzYyTtOv3sMn6z6rV6c9dHi846Y/
         8kXi9q35Ts4qAbr7LsjrEQm/5OanWEglVcc5rvLcE1XYbRw1knrVUkeGoqY+R1r984E8
         yGbUXy1HNolg6KdBOGywZBXrQLzREOWWBYLH+gVsDlwsEPP2Au5TuWuQvGBJMIc0qWOI
         W1WrZefnTnAdROKCdQ6M4m1LNt2EhZHBwcJbTfi1dbOk3S1bOprRKgbwfSRCjFdpngA1
         AgfKEu91Rl77is54LEnjdebdgT0UpM0svtldNZknSQ+FLDODnR127D2U35NTjmPNgAb8
         zK+A==
X-Gm-Message-State: AOJu0YxSPCi4JCF6nRzLp7D6xYZIqrz/NZ8Z8/XeaVK1ks3ra73QUJMO
	yYGHvqfCXJGH/M5DZTw+BvuA99KqQGcheuYA66GJIMnZr23sheARQixkqqmF+9o6QIkb1dq/9oP
	GKfk5cOFPAw3eesfcRSIxm83BrhR9SJv8z3s8JUyUbF2Crk5+E7oEdwuKepnkkwMOYtqJdlOFYX
	NZjJu+GXSqRiBY9kmLYEcSd1PHaRy+uUbyRstK8U/4
X-Google-Smtp-Source: AGHT+IH4tMMcP9ENuBVAD8pIlbbZTGfAbTgfXdsdcBy01t2vMHHwycPrtUm3l2DZ83XxryT9zDG5yMKk
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:adf:f551:0:b0:37c:d162:8289 with SMTP id
 ffacd0b85a97d-380612281c3mr9870f8f.10.1730283508476; Wed, 30 Oct 2024
 03:18:28 -0700 (PDT)
Date: Wed, 30 Oct 2024 11:18:05 +0100
In-Reply-To: <20241030101803.2037606-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20241030101803.2037606-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2688; i=ardb@kernel.org;
 h=from:subject; bh=VuHW66kh3SrzeofrGytIHYJsJQA3k3osacidUqjC91c=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV2J/W7XOsuH/Kd2h5y8J60kczJ8TXYDx74Jz/etkPzYa
 Mjj5WvRUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYS94fhr+iqt7mP91+MuW97
 Omn+Hc536Vmsa2W7Jv1IfWp0kMN6cgQjw67VgjcvcT2quZ2S0enprazpknZsq/5FwzgVId25cSk l/AA=
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030101803.2037606-11-ardb+git@google.com>
Subject: [RFC PATCH 1/8] arm64: Kconfig: force ARM64_PAN=y when enabling TTBR0
 sw PAN
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_031830_803976_906F615C 
X-CRM114-Status: GOOD (  13.92  )
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

From: Ard Biesheuvel <ardb@kernel.org>

We have a couple of instances of Kconfig constraints where PAN must be
enabled too if TTBR0 sw PAN is enabled, primarily to avoid dealing with
the modified TTBR0_EL1 sysreg format that is used when 52-bit physical
addressing and/or CnP are enabled (support for either implies support
for hardware PAN as well, which will supersede PAN emulation if both are
available)

Let's simplify this, and always enable ARM64_PAN when enabling TTBR0 sw
PAN. This decouples the PAN configuration from the VA size selection,
permitting us to simplify the latter in subsequent patches. (Note that
PAN and TTBR0 sw PAN can still be disabled after this patch, but not
independently)

To avoid a convoluted circular Kconfig dependency involving KCSAN, make
ARM64_MTE select ARM64_PAN too, instead of depending on it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/Kconfig | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 232dcade2783..ec218ef22f2b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1368,7 +1368,6 @@ config ARM64_VA_BITS_48
 
 config ARM64_VA_BITS_52
 	bool "52-bit"
-	depends on ARM64_PAN || !ARM64_SW_TTBR0_PAN
 	help
 	  Enable 52-bit virtual addressing for userspace when explicitly
 	  requested via a hint to mmap(). The kernel will also use 52-bit
@@ -1420,7 +1419,6 @@ config ARM64_PA_BITS_48
 config ARM64_PA_BITS_52
 	bool "52-bit"
 	depends on ARM64_64K_PAGES || ARM64_VA_BITS_52
-	depends on ARM64_PAN || !ARM64_SW_TTBR0_PAN
 	help
 	  Enable support for a 52-bit physical address space, introduced as
 	  part of the ARMv8.2-LPA extension.
@@ -1667,6 +1665,7 @@ config RODATA_FULL_DEFAULT_ENABLED
 config ARM64_SW_TTBR0_PAN
 	bool "Emulate Privileged Access Never using TTBR0_EL1 switching"
 	depends on !KCSAN
+	select ARM64_PAN
 	help
 	  Enabling this option prevents the kernel from accessing
 	  user-space memory directly by pointing TTBR0_EL1 to a reserved
@@ -1923,7 +1922,6 @@ config ARM64_RAS_EXTN
 config ARM64_CNP
 	bool "Enable support for Common Not Private (CNP) translations"
 	default y
-	depends on ARM64_PAN || !ARM64_SW_TTBR0_PAN
 	help
 	  Common Not Private (CNP) allows translation table entries to
 	  be shared between different PEs in the same inner shareable
@@ -2118,7 +2116,7 @@ config ARM64_MTE
 	depends on AS_HAS_ARMV8_5
 	depends on AS_HAS_LSE_ATOMICS
 	# Required for tag checking in the uaccess routines
-	depends on ARM64_PAN
+	select ARM64_PAN
 	select ARCH_HAS_SUBPAGE_FAULTS
 	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_USES_PG_ARCH_2
-- 
2.47.0.163.g1226f6d8fa-goog


