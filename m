Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A59AD2E9C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 08:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYXPp059bnBZquw3jsb03/CH5q5Ir/ZRO9Vlwe8AifA=; b=OaYY/zglPolg/IFPbN+Rr0XBfK
	p6OSwPqtJUYAg3RedhUEh8SIvJDnJifwlBRLTw2V7oZAMKVqKcbQ2OtTbPaMGYC4+eA1A4Q2D/n4d
	UukM+djbBSvvT44u/1l1YHfBGAGK+MBGwIEDzzgP9euNaJDizGE+OA4XJEFM6YlS6flBSdMNSdNvs
	qakpKQpdPBtYzG3w71uz5d+r4NzCDEe6U+r/MU2CuqEehO7nteqdAN3711+xT7j4LK4Sp0i8Jr3rr
	4+EQ3xeajz+jvpzmXd+e2nKmKsV07DnRvZ0HJchOoIj406aB+rJv/ZhUkZHFgk+BgiAcaiQkaR22n
	/+n+1MGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQ4g-0000000GrRb-0CL6;
	Mon, 11 Nov 2024 08:47:06 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPu4-0000000GpP0-2H9w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 08:36:09 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43159603c92so30498465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 00:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731314166; x=1731918966; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oYXPp059bnBZquw3jsb03/CH5q5Ir/ZRO9Vlwe8AifA=;
        b=2YfuXIZu4kzWOXBixO/wmQi/9ZgCUH/XGipPHDW0hX/VcADlq608eQNfXcGXPe2EPP
         2ZSDB7HxstADYo0+30oR47biBt+tnE3KE8aA2AxXzu6d5ROrLHu67zkDV9uynp2PXbm8
         sBIQSwbrmkkxZZKStUC+NrlqDf+E8KVavmRW35w7ulUH+p+2Lu2Q1zhN2ZSF/82F5BaM
         OkPbUrCLlJzD8F3P9hy8y6PJ3VUh5dxgPw/T3Ze3b2Qo2O+J4BDF420VDd/u37rK81Fs
         Ynsy4iEVCK0s9DT0xhEJ5YuQDHxdn9esoCjBrPpaZNWF1ts8/8Veih6pdOzx9BjJ0Sp2
         JZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731314166; x=1731918966;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYXPp059bnBZquw3jsb03/CH5q5Ir/ZRO9Vlwe8AifA=;
        b=wh9DQoVYV1yzNhZ2E1hRuIJJAhmf9SG7UbmNxvgk0bs6/eQhviExJvPaobG2bkrNim
         NwHbVougkWVF9BBQx0vbYEeRxtK7FudiQUBtNMAF/B6DteqR5e9qppJULy0/9v76MPeH
         c3oqs8N8oNUcV0Hhc3Nac4GUzEGf4g4Ne4CrCIGy/MJL8Y5IQ0xbSKTTF8WZBP4jlfq6
         7+YLif3Wp1g3mkc5ldJWBhBaNA2H16XmkXaaAv/ATHGo+ttUJiwG1aJjedKI4TvMtkEJ
         a+Mj40IuB9Pqyp3Uq0Qb8niWt7Fh/UJJUyRu5gwwpzcEcUiarz2XawsMiWg6Gf2+BDEJ
         NJcw==
X-Gm-Message-State: AOJu0Yxxla+5KarEiZm/HWhZ0F+QuLq05aI7fmo68WYtDH4eI5QbIgJ8
	Xu3S44dIfwTf8t3oGD+Hk66VNsAWRqCHkBM/P++9wMtx3+IxMRPRmuycFBumef+OD+1ALt+Imzh
	vE4Qm0Ff6k+Y2DfJTVWZ10aQFie7LO+Hn0KnjllqqZLxcnPTMzeYFrdmclFfP1lIec/NjCA5puF
	ZD3cKQwXWNO7Y76b6/RTDcDBp5vAs0M7jSfp4ap3EK
X-Google-Smtp-Source: AGHT+IE02UNmtXOHYFjrucm9+q7KBzR2E2ndSPtx+J0shefNcLQtRP1OFaNSXkaOsrH95Sb1gjDJZQcB
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:600c:4202:b0:42c:ae4e:a983 with SMTP id
 5b1f17b1804b1-432b7515cbbmr106975e9.3.1731314166058; Mon, 11 Nov 2024
 00:36:06 -0800 (PST)
Date: Mon, 11 Nov 2024 09:35:49 +0100
In-Reply-To: <20241111083544.1845845-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241111083544.1845845-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2688; i=ardb@kernel.org;
 h=from:subject; bh=9dZ738TTk77gIGMJKlX5UefvULUxz18unqArcxKdWUo=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JId3w4DPfB/t41n9lMpqgcHm/xMxkYYYzvTdv7m8rY1EVS
 kquUP7eUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYyex8jw04pca3Hcsv3pRy7
 Ornq5Yevqz5sf/3/2VPBNwJHAnKtWXMZGf4lZ/sK6Wvl6TROagyP4q01d117Nu7z7oiZ5+62qfY aMQEA
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241111083544.1845845-13-ardb+git@google.com>
Subject: [PATCH 5/6] arm64: Kconfig: force ARM64_PAN=y when enabling TTBR0 sw PAN
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_003608_607987_4B3A2593 
X-CRM114-Status: GOOD (  13.66  )
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
2.47.0.277.g8800431eea-goog


