Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27795C44512
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 22:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lo+kG++Zl0Kl2zxIYPSuQhtBBH9noHj84CgVxWP736w=; b=MHJdhuB89rfw+3VQYzZE+879k6
	0YfwbFUOXI2sKChxvBJVFgxSwnt6z+o0pgaTGd6JQ0yVLx943VkjbIayaWZXefnj5oSXbeKAtwbdG
	wtDKE0DGo72OYCcbJyCo/uskP+07UIvd3NJpJF188oFIgG4FFITgQl3neszHIkSR/71qL5Xfs5A+Q
	sokhwcezWxvcJiMDSyci0aohiVDHwn7/9SvqAOpjU77H0D8fXeIMUqFNSlnKfolNmsNKAVr73VvFT
	OH8ZF2DSTaRrgry6yqY79xQMFQjw6IK/8ZzYKz1jf4rD4BJg0ARhsap4tTpP4OuMGaCpgtydRmWvA
	O4tVCofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZIl-00000005OLO-1GCV;
	Sun, 19 Jul 2026 21:43:59 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZIi-00000005OL1-3yto
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 21:43:58 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-92b21f65b60so296705585a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 14:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784497434; x=1785102234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lo+kG++Zl0Kl2zxIYPSuQhtBBH9noHj84CgVxWP736w=;
        b=Z40PJF0KeMnlelQ+yRxLX+uJ5rCf4Qb990OnXcoZDyuH6/9wszjITKhu8IdfOxXsq9
         jZB6sPrygrntq98ElsHyR2/1vrQKK6LKYINjmOmiUGR2x1k5WlyNXb4a7KJWXyi1zJZi
         nkvTHyRpTg314iTgolRJQedc/behyKU3BccJBvGstus3UoF/B/Li3IoP10SlEgjyZDgG
         bo69hdXRi7T3+EdVNvAyZp+LZ16DES9yrh/hzbftssa9e5rLI1J39EnrpH76dmOmEsuV
         DzLKOkv1ScWAGgOy5a8me1GKslTpTKgTYnKR8Ov+VLi6a1K2L20X+yu7WdubXB1VTl6a
         w2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784497434; x=1785102234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lo+kG++Zl0Kl2zxIYPSuQhtBBH9noHj84CgVxWP736w=;
        b=h3JP72yIsHIDb4Y7B9SZIiy9tPwOjhF8QzlDEan394jEdaTSXAMlWd81e6TLTFBKk9
         N4MZ2Ty1cRNVYU00382tou820JuQvpmMDMXgi6S+fLfJ3WQ4pHpdqSI7ITUcuRSzlTGz
         7d49g92VS7NofNS5iFkUMpytNVtmFjCXHUeGeBBNRB/QjZL9zED+rJN5QZrfhjXyR4NK
         xVASBV9tqSJeyxp94Cl+m+sJJBiYdzmXmsbyCUdmy524frY/5aA5hyc4j8QICPf+/Aad
         WIMWwAZHypBD6NcdErONFvWdWbCITcpPsnxJI+A+Sya9uTEs4ptVIlIxAryMowje7gWA
         VTmg==
X-Forwarded-Encrypted: i=1; AHgh+RoBiFPwFSVsvdK0g4D9WFRtmqov+XieNeN8MBFp9uGc/5cJQbAM4wJxA8uaP5RKV5ncJre5cJqJ5uE+HIdwBHw5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9maEIy5/9BG80/tjsPR9e//Pd+u4ep0zGvPzCliACRiQjTMIg
	nu00toP1H9cvoWLIeFyz8EZXSUbVffKR/6r4g8fnCCIVTvAkUFNUiA5r
X-Gm-Gg: AfdE7ck1Cpz81ehrC5Tx65N1MNITh2JlxiX0kn6Rnyg0R+83AG3jgGn0p4e8pxebCru
	rgUm7WxpR6DiYv60v86ebsgYNVS+MNE4ARP0jNUat8ZoV6CpIProWa6Zv7iacGtHZkOyxWi1e+T
	tDTzNOSe7RUxw2vDImnMrzpaPdhk/CULcaQMRMcnrMGtKjqt8E2dzdEbICb/ej6EEao5cd4iE+K
	7XbV3lhp9qsk3pksacY2QdYu/Libi/cPtylcPHPDyJ7YaqK1p0csAkxmFG3PL0vJXdxNwsVAXpO
	ruA4UB8dstOV7mIcdQG9By4cQOJ6RcCe8zacYSe/YK55Meg63IpcID+dQel1mKMVvBsfsBayHCF
	RnVOww7w2HiULYXDW7ytJalLLrfFd6PQbby1+dVbmMlx/UeIf0qgxveOEjt8YW7/6w/bu/UMUym
	3IYiCO7w9OOBUSoRnTAEEER7MIub6TxX88PkVfY7jpTOmvBYQp9OcwanlYxhs5dZ2sZeTDl63+G
	HsKUC/iAq/5p5vm57QqW8ZogQYys021N5uCGsoIJIc05zSUHVexHTw=
X-Received: by 2002:a05:620a:440b:b0:915:5216:e5bf with SMTP id af79cd13be357-930b492fe84mr1146363085a.22.1784497434363;
        Sun, 19 Jul 2026 14:43:54 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b542e60asm744171885a.31.2026.07.19.14.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:43:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	=?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell PXA1908 SOC support),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] clk: mmp: allow COMPILE_TEST builds
Date: Sun, 19 Jul 2026 14:43:49 -0700
Message-ID: <20260719214349.734351-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_144357_020271_479D923C 
X-CRM114-Status: GOOD (  13.19  )
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

The MMP clock directory is only entered for ARCH_MMP, even though the
PXA1908 and MMP2 audio clock symbols can already be selected for
COMPILE_TEST.

Add a hidden MMP clock family gate, select it from the compile-testable MMP
clock symbols, and use that symbol for the parent Makefile descent.  Keep
ARCH_MMP as the default provider for existing platform builds.

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/mmp/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Kconfig     | 2 ++
 drivers/clk/Makefile    | 2 +-
 drivers/clk/mmp/Kconfig | 5 +++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 16191b297150..cb69872401fd 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -457,12 +457,14 @@ config COMMON_CLK_STM32H7
 
 config COMMON_CLK_MMP2
 	def_bool COMMON_CLK && (MACH_MMP2_DT || MACH_MMP3_DT)
+	select COMMON_CLK_MMP
 	help
 	  Support for Marvell MMP2 and MMP3 SoC clocks
 
 config COMMON_CLK_MMP2_AUDIO
         tristate "Clock driver for MMP2 Audio subsystem"
         depends on COMMON_CLK_MMP2 || COMPILE_TEST
+        select COMMON_CLK_MMP
         help
           This driver supports clocks for Audio subsystem on MMP2 SoC.
 
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 4b2c089f46a1..8383f9f1da51 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -130,7 +130,7 @@ obj-y					+= mediatek/
 obj-$(CONFIG_ARCH_MESON)		+= meson/
 obj-y					+= microchip/
 ifeq ($(CONFIG_COMMON_CLK), y)
-obj-$(CONFIG_ARCH_MMP)			+= mmp/
+obj-$(CONFIG_COMMON_CLK_MMP)		+= mmp/
 endif
 obj-y					+= mstar/
 obj-y					+= mvebu/
diff --git a/drivers/clk/mmp/Kconfig b/drivers/clk/mmp/Kconfig
index b0d2fea3cda5..35a069034b28 100644
--- a/drivers/clk/mmp/Kconfig
+++ b/drivers/clk/mmp/Kconfig
@@ -1,10 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+config COMMON_CLK_MMP
+	bool
+	default ARCH_MMP
+
 config COMMON_CLK_PXA1908
 	bool "Clock driver for Marvell PXA1908"
 	depends on ARCH_MMP || COMPILE_TEST
 	depends on OF
 	default y if ARCH_MMP && ARM64
+	select COMMON_CLK_MMP
 	select AUXILIARY_BUS
 	help
 	  This driver supports the Marvell PXA1908 SoC clocks.
-- 
2.55.0


