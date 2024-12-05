Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E72E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxhk2o0tAc4zIrdHxGtBhCpg5dWRaRnoqVjOuRbuph0=; b=fdaKvVBAErPON6k2r2JQ5g7Zxq
	/Nr+Kh04EMsxPTUIxs3bVYbrF6IL9UCh0k6YmOTl0Ae3ICoyt9lCVKNsgWWz5u6fX9q+UhPk9+xQw
	erXDyxF8mw+omJnu/vSDhA1BU0eU5g70XRkbDYl6kMf1CuNqqxcnTv7sNLE0JBstSZfaLN2p2oEy3
	Djakz1ky7fg7riJsKmYgwWPa3BqKwU5kYgfkbPkXUBTIOCSr5PM2cnGQKU5UufWB+ZBYzli0WWv7d
	bJMQkkNT13I10RNDWtMcdi3LqpX5AFr08t9EgVB7sB7FtTbP0cSZobNhi6lwLPQic3FuxTknLnDdZ
	OczaaL+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDTu-0000000GT1H-434B;
	Thu, 05 Dec 2024 15:09:30 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDO6-0000000GRkN-2afX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:03:31 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-385dcadffebso491283f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 07:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733411008; x=1734015808; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nxhk2o0tAc4zIrdHxGtBhCpg5dWRaRnoqVjOuRbuph0=;
        b=uYfhBLC9QP7HkGRQIBHWZXfDVbneEXkvkX6ZmLUPa2X0alckUjtrplQ0EWwpasas4j
         qa8BkQF+oGLHrRIk6tPN51VAiSUxu30Shpxom0U9UmZ/ogr3zxuN6PDLb9H6LmdWnhfS
         Yv3TPjkaGnm4S4pd0kinVOqTCLty1p0C63UoCmqGjFAtTLLXZyh6UlNIwdM0g8AG1LM1
         iWXC2HvPqMkAwwEMq+05J75svpqYVLKb0YpPHtmd44171sVLTzHFeLyc3lVOoyLlwq+C
         oI3U2aAiFeu670jnNoSTKIDPvJQ9mxTrh9BEfNYIioEwu7awPMjBrHFMtM8XC6mukbOG
         jI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733411008; x=1734015808;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxhk2o0tAc4zIrdHxGtBhCpg5dWRaRnoqVjOuRbuph0=;
        b=sRC8PwnAiCeTm+MqUm2a+kYtRE3scRN5/7mBAblGjilJlzJyBA6VUPzsiSxCtAXjEr
         KjPa3JAjcNLLz4p6E9vbWbKAI3pQ86DVbTTsTnHh8p3brlmuW+eoVEcJqN/uJzHCpu+2
         j4Hqlt/nqADQiGBYHjZyvrbfpoh4oqX3hF4LAnm+mEuLrok2ozOOVtXWvASPGm1AziNM
         /LBvTGTujBVI+OfOTIP6I2eDoxdAUDv4ATJq/tVz6pF2eJ97jfKINJZImcg0ygReS4eC
         ONEnayHGN3BIULfQY7MEgsAXAEZeg3/R6TH9CMUdUMEq/MIpeUxvCkP00zz5IDIHv5F5
         W8dg==
X-Gm-Message-State: AOJu0Yw5idRzxMm7HH0Nw5Rp6sS6Hi9q7xS0bWVUxSKwuNqxEjOcxVqF
	UXJLxo82O8vTRrHux/mrXtbnGL/vNX544oJ7pCInDgwE8XKyflkF2mopPbJdJCZuzkQQeNRHQ9w
	9xq82SNYX4b706oKuYMvgoswxNDI+ufjOZo13sv35Z/NaBOlkI91GoTFWeL4Za5CD9uArbD28u8
	wcP4xewQKwp46d56jK/ZPoj1eVhdapWCQmPyt1Nhsn
X-Google-Smtp-Source: AGHT+IGK+uqdrolwBE/YK0GzQSi2JfIN1swfXk1Cl/uS2VCNW+v/H02aP5idPYHHs/NRxJPEYLwBvIPp
X-Received: from wmbd6.prod.google.com ([2002:a05:600c:58c6:b0:434:a471:130f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:184c:b0:385:df73:2f24
 with SMTP id ffacd0b85a97d-385fd418d72mr9456469f8f.39.1733411007685; Thu, 05
 Dec 2024 07:03:27 -0800 (PST)
Date: Thu,  5 Dec 2024 16:02:35 +0100
In-Reply-To: <20241205150229.3510177-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241205150229.3510177-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2690; i=ardb@kernel.org;
 h=from:subject; bh=nNzKrIEGl5/jzZq+G376hZKl+MZq0c7mORI7knhQaps=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIT3wQG9+RtOixbsYNq4JUL8kkbBoa67TClvXWOHDh+ub4
 lvqRao7SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwEQSJjAyrKpamhqhsPpueoj2
 vnM+bCJGR+JXxx74/71z55d9FTvqnzMyrHjDzDGpYem2TsVDjDN9DVSf+la5LIyb+q/csYojo8i THQA=
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241205150229.3510177-13-ardb+git@google.com>
Subject: [PATCH v2 5/6] arm64: Kconfig: force ARM64_PAN=y when enabling TTBR0
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
X-CRM114-CacheID: sfid-20241205_070330_654698_C82E8340 
X-CRM114-Status: GOOD (  13.76  )
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
2.47.0.338.g60cca15819-goog


