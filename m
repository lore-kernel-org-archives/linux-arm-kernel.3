Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8805BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 08:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdgtdUqEBd5LKxpewIKQlxiAPN7TmKSwfgktC1/nR3M=; b=ZZ+pzY9s5vXZwDmGVoPVqtT7kn
	/goFzmdyo1YvwgnsoPwRB1ZEL6qDuih6X+cabl+cqG3UkbDTkECmuHe/DyvSbXrZUjb6BPbVOKDnr
	xjkUUL+3WrvqDVlBAfIIMTjVpI/Z+p4eQHqA/eG2Kv5XZvq0ohLKZShLQl7G3JaI6luBHiSsZh68P
	ca+z4X7LljENDvpVrT7kztnp+NFmBNTYHqCywNtiN+Fd4F3PC4P6deikQaCKp7R3k2nfKoSlkpGsx
	tafavvF0PwGzEgkfsjh0x0YRUa3/ajQ4XbwOs1qBH0DWgHKr+0WNrrU4gfOGSiesB7G3y1qvJzQNe
	2yPmnUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeWP-0000000HIMT-23DT;
	Thu, 12 Dec 2024 08:26:09 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLePd-0000000HGls-0wEl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 08:19:10 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4361efc9dc6so1858455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 00:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733991547; x=1734596347; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HdgtdUqEBd5LKxpewIKQlxiAPN7TmKSwfgktC1/nR3M=;
        b=svjDpZ5XwctKdKDnXC5OPvCO1+EEWGBPsEnpmQAcjF/XsfmJu5WVvFfowucBaF+HQL
         bo7NuDx+MX0YlvwvrnOIziHi38X5dOA3CxzIPwepZKPAvGoUnraMJ4MFVwJHxB4A8ISZ
         Srz8aN3DORWXPSv2YCR+ZPlJ7r7Sh00bOINWrkI48uaCxgMx/596fESnCkim9Ap2NW6R
         Ntx0HTtt10xUNWTW661fQotvZgOYyPTR8dKFueSy52dZQjPGc3N7aINIkTCYGmm0JcPd
         BgEByDIotHKBUcWEZxKtgTkYafH14TXmlVtvXqehB4U94lzhrOAc2jawMvWEi0iyZ0NJ
         24yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733991547; x=1734596347;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HdgtdUqEBd5LKxpewIKQlxiAPN7TmKSwfgktC1/nR3M=;
        b=LiNrYiW3MI7uL+RXzsAcm07a6dz73TB62z7WI5wkiSWpNiqFEc1JPLmpHKC89Yz7AC
         M6xXrqSc/tbZGp6pSLJJKgasbI1jZmTaiPTcP6ses6LoZwJDb9TNfe5EDujCMlfJhFin
         fj42ciizfikgpqq7s5F8UeLOirWrsnhL255qtlY0YIJETqpyVwHlgVb702J/oQ4a1hit
         lcJ4JJ9Z3d3ij0+m5p4AbqnHKlSEG5K8gwvJTFfZgw+bcUUUpD/5uasOZ6gV3v5+JPrv
         wm+rau1sfVOS1FArFGEKMX/4UHg3gslafWHQxuy1+ooV3CeDGWvJ96USkklv3AbdFGoK
         /w9g==
X-Gm-Message-State: AOJu0YwvAFdotdrrCMqtt43M8ASPbJ6GbmfSGtwryPV+xUHsk2SRPkcA
	CK0A3wpXFe/PUJulUP9iXr3T+Hmqy/b3Fw7D6wyhbQtP5r5s5Ie0pmzS0Pl5pdFqIIC9G2RlppF
	JHKsUfaWgg/7vDiCBHHkM3yxI++RqRcUya9nuMVcGcXgE6ip1TdG0kBQHz2dwShJTK5BHS2RgIs
	H4JsAEB+m3K2hKjz8GZOtNmh3AdJ4lDkEQmBwsKA1m
X-Google-Smtp-Source: AGHT+IGWPJvO6+9CCQmmFw3OSCuh5I3iyCbxp28yrcBF8dbr114C30A5zZAFQgAChqfAkJPHTDhYBmac
X-Received: from wmqy11.prod.google.com ([2002:a05:600c:364b:b0:434:fc6f:e8c3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:ac7:b0:436:aaf:7eb9
 with SMTP id 5b1f17b1804b1-4362285f79fmr17388455e9.20.1733991547419; Thu, 12
 Dec 2024 00:19:07 -0800 (PST)
Date: Thu, 12 Dec 2024 09:18:47 +0100
In-Reply-To: <20241212081841.2168124-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241212081841.2168124-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2690; i=ardb@kernel.org;
 h=from:subject; bh=vw43pFoSabaJKFXhQUhpwCIEl+ZhAtorVG0O+2+nOWw=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIT1qTub9hSnTjk48PK1RpV2XYXXNlqrNtyyiLh7s1n/+4
 PPZT7ZRHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiFxUZGQ6vfyod9Ht3of+P
 SYo920KmBTy4duOD/dJ7dlxsCjaKSv8Y/im7pDU+c+SIbvS/7bu477PN5Snpd9uubteI6Nf3Tlj byQIA
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212081841.2168124-13-ardb+git@google.com>
Subject: [PATCH v3 5/6] arm64: Kconfig: force ARM64_PAN=y when enabling TTBR0
 sw PAN
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_001909_261511_5ACBB9E5 
X-CRM114-Status: GOOD (  14.11  )
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

There are a couple of instances of Kconfig constraints where PAN must be
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
index 100570a048c5..c1ca21adddc1 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1379,7 +1379,6 @@ config ARM64_VA_BITS_48
 
 config ARM64_VA_BITS_52
 	bool "52-bit"
-	depends on ARM64_PAN || !ARM64_SW_TTBR0_PAN
 	help
 	  Enable 52-bit virtual addressing for userspace when explicitly
 	  requested via a hint to mmap(). The kernel will also use 52-bit
@@ -1431,7 +1430,6 @@ config ARM64_PA_BITS_48
 config ARM64_PA_BITS_52
 	bool "52-bit"
 	depends on ARM64_64K_PAGES || ARM64_VA_BITS_52
-	depends on ARM64_PAN || !ARM64_SW_TTBR0_PAN
 	help
 	  Enable support for a 52-bit physical address space, introduced as
 	  part of the ARMv8.2-LPA extension.
@@ -1681,6 +1679,7 @@ config RODATA_FULL_DEFAULT_ENABLED
 config ARM64_SW_TTBR0_PAN
 	bool "Emulate Privileged Access Never using TTBR0_EL1 switching"
 	depends on !KCSAN
+	select ARM64_PAN
 	help
 	  Enabling this option prevents the kernel from accessing
 	  user-space memory directly by pointing TTBR0_EL1 to a reserved
@@ -1937,7 +1936,6 @@ config ARM64_RAS_EXTN
 config ARM64_CNP
 	bool "Enable support for Common Not Private (CNP) translations"
 	default y
-	depends on ARM64_PAN || !ARM64_SW_TTBR0_PAN
 	help
 	  Common Not Private (CNP) allows translation table entries to
 	  be shared between different PEs in the same inner shareable
@@ -2132,7 +2130,7 @@ config ARM64_MTE
 	depends on AS_HAS_ARMV8_5
 	depends on AS_HAS_LSE_ATOMICS
 	# Required for tag checking in the uaccess routines
-	depends on ARM64_PAN
+	select ARM64_PAN
 	select ARCH_HAS_SUBPAGE_FAULTS
 	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_USES_PG_ARCH_2
-- 
2.47.1.613.gc27f4b7a9f-goog


