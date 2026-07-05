Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6F1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dTixSXqM1M3nFZ6wcRAermlWHzTw0peN+qhtvG6hqcg=; b=kQdW94eP1xTpMihYdbCs33YDBe
	wzdlfqDV+6jVqVMSjFR56ePzvaq/zr5MihGVyFm/rrmMzT7J0lQTehT7oobpN8x7jtsO4js50V/JL
	Kkd9c80MjTeAT1UDYFHZlZyex9CHPP4MI7zN27dLJa1qvyqJwBwsZv91skfH9YLbOmkcdEH1wWwk+
	vtbTbjaZ/CLdbgMsgJ/rPqfEfgLNcobBVtPNfxcbvGaHJIg6a0KRJCL5xcOP47DO3LPU/9FfeN3zR
	iRNcYkur4aBg6w2fXMMY22n/BAzCqFLzZiB6EIlNkMDpxtWzQxqULYCKXRFFC4/HREu0XiW0pVDds
	+RKcSHJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIYK-00000009AMC-3GH8;
	Sun, 05 Jul 2026 08:50:16 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIYI-00000009ALI-2DqQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:50:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so14454295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783241412; x=1783846212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dTixSXqM1M3nFZ6wcRAermlWHzTw0peN+qhtvG6hqcg=;
        b=HNh/uHIjcI/0LFYvoe5QPUDWAoPGqqKyKcs8WIp+hd9md1Z4UeK0nVHe0W0SUiT+2V
         u2b0aLNZB6HPCxHE0Y8MceXDa7oi2IDxq6KYdxAo/hase3kugEnjbvneTYWW5A/ikI57
         BrZyjUDmXZvxeXVNyAIxEyLPlvC7gVt3/aoe4z106V+zvPqZ9r4jbdgPK/lMiSw36/j7
         bLNoaO5u9OYO8Msihz0s94t+PVLILQai9cFvXta93S6DJ5yMULWyeonJaJlo10wT9X5c
         6GOidfE1sq2s+Ppzznwy8CCLtfTcokw+oh0JnzN39QD3wvTr+sUJWJ7M0UEbC5Lxnf/P
         rzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783241412; x=1783846212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTixSXqM1M3nFZ6wcRAermlWHzTw0peN+qhtvG6hqcg=;
        b=ftvcAxLUIjgpH6ix3weCw3VDEs/2r/kcRYHetmnvOUWYIcfL6HGg6nhcag2ziovyJp
         kKZu3yXGfnWfaOlPscDpZ+136/dqs2B7koO1rwb/0IqnGyhSHiuLm4rBgCb9f9LRuoVd
         SlVh2ga1Il0EebG4LkL5WHSUrgkExYHwq6dzyL3ep0ugfDUxncm/D2psOpLzQulyAJZB
         0xHBZNPPmecYlM2CyhdAHruqRdFDiTjgz0Nm22Y+FIbONDBmbTEU72yj7GMEMjEdPtqF
         F79gyQ7NiSwsdhJsUsCg6Rrtl4s/7aT/M+XHxOryUTR/vhx4hB/i/jJyPwA+FyruUFut
         q5aw==
X-Forwarded-Encrypted: i=1; AFNElJ8I0Cwj5px/Oly4D8guHjyvETzL0gd8B+oEpTPjweiAJFDr4yHhpKMCt2CsQTfJnwZ3U66lmGHO1lb+sxv2KYP/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn0i1ivS/i4FnuU4ArZ5BmrXLP7FVV4/F593N/h/eowslXQViO
	va5KAsr417cohkwaCZHAN4Yh0teoin2GO4nk6LA6nNHqpwG7n63TFM/cJt/YUWJlEvg=
X-Gm-Gg: AfdE7cl6CTVFzqGbhVO9Omj3x0LmFVsdaNfCC5SbvkdLhwFPfwP0o0Y0Z1OnZ3Nxkh7
	Qc+2sz7hz9guJ3H+wIkZUhJFU1//CcadS+w9jt/ShkQzetrh55aT7odwY1XL3Vq0GxQ4wsUK2xr
	GFa98OvQR8n7hOVnU5i0kilhF6MSEvOVqEW34oDknrBdI3nFAjZnCMRBdU1sOHPldmzxjw9AILN
	8dv6Kwfgyj/Q6ASf5chgEk7ueMoZOe2U3jon4EUgE3BfaAan3WNve4wHF/8VB72HvzTy6JEQ2ij
	JUpKVCWZYpMG1Dxy7ndFv0P/TLphkJ37OycDiGZM4t9/eeg/92HHkfNsVUqbGpnyG+zrZGlqpp+
	Ib4T3sbjiorGhRoO5yfsZBsA3FT1zz7hUyvls7KFn2ZlduZh5n+9l9djRBaYtwIh8L60cS3vCwc
	G5kDlDyJNz+43LkRr/hg==
X-Received: by 2002:a05:600c:8b17:b0:493:bdaf:83a7 with SMTP id 5b1f17b1804b1-493d11f8c55mr65567935e9.28.1783241412156;
        Sun, 05 Jul 2026 01:50:12 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960b06sm13667826f8f.28.2026.07.05.01.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:50:11 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>,
	soc@lists.linux.dev,
	Imre Kaloz <kaloz@openwrt.org>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: Don't let ARMv5 platforms select USE_OF
Date: Sun,  5 Jul 2026 10:50:00 +0200
Message-ID: <20260705085000.3510576-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=UACOGRi5zwKM/GlH3MUrcVH7NTPYPiS/pta0KBrGtsQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqShq4ZQaUz2sgd5mn3XqmqSu5yqtJWJAFqNvOW 1EMngDN2a+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakoauAAKCRCPgPtYfRL+ TtF6CACsq3oN9xBSWZAYF+udT8In3FGzcI9+Kw+Z3Vn2Z1skdF5IJvOLCcP1jCbNLc8YbiimQNY ZvhF7mbdQh8XIIHBlPjLdf/UpxTcTzTUv8KioedjFEfcCyA1ZKGtCUel4HvdfS2WDAX/6XtCu+8 4y44kavClHYDRVKgm0jVdd236wmzgwS87b8XWELqHeMmTcS9kxr8g9fPVMVlbtZ5lWfSB4OSy7j Ha4Pmv/3X5PYZY5yJCmdP/AwKlv57EICLpwEpIuaP7bsAnRnQgJ0mxjJXVROSjhiRLhmuTni5D6 IhCOcjT3ukfqUSw122Aj5K6lNeFvaAa3qLU7wCslL3lF1dWP
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_015014_587466_23930E0C 
X-CRM114-Status: GOOD (  12.67  )
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

USE_OF is already selected by ARM (unless ARCH_FOOTBRIDGE || ARCH_RPC ||
ARCH_SA1100; these all conflict with ARCH_MULTI_V5). So there is no need
for an explicit select and it can be dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

If I should split this patch by mach-*, tell me, but I think it's simple
enough and these architectures don't move much, so getting this in via
armsoc should be fine?!

Best regards
Uwe

 arch/arm/mach-ixp4xx/Kconfig | 1 -
 arch/arm/mach-pxa/Kconfig    | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/mach-ixp4xx/Kconfig b/arch/arm/mach-ixp4xx/Kconfig
index cb46802f5ce5..7f812020e082 100644
--- a/arch/arm/mach-ixp4xx/Kconfig
+++ b/arch/arm/mach-ixp4xx/Kconfig
@@ -14,6 +14,5 @@ menuconfig ARCH_IXP4XX
 	select IXP4XX_TIMER
 	select USB_EHCI_BIG_ENDIAN_DESC
 	select USB_EHCI_BIG_ENDIAN_MMIO
-	select USE_OF
 	help
 	  Support for Intel's IXP4XX (XScale) family of processors.
diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
index 66e26990e2c8..c478fb8a6f78 100644
--- a/arch/arm/mach-pxa/Kconfig
+++ b/arch/arm/mach-pxa/Kconfig
@@ -22,7 +22,6 @@ config MACH_PXA25X_DT
 	select PINCTRL
 	select POWER_SUPPLY
 	select PXA25x
-	select USE_OF
 	help
 	  Include support for Marvell PXA25x based platforms using
 	  the device tree. Needn't select any other machine while
@@ -33,7 +32,6 @@ config MACH_PXA27X_DT
 	select PINCTRL
 	select POWER_SUPPLY
 	select PXA27x
-	select USE_OF
 	help
 	  Include support for Marvell PXA27x based platforms using
 	  the device tree. Needn't select any other machine while
@@ -47,7 +45,6 @@ config MACH_PXA3XX_DT
 	select PINCTRL
 	select POWER_SUPPLY
 	select PXA3xx
-	select USE_OF
 	help
 	  Include support for Marvell PXA3xx based platforms using
 	  the device tree. Needn't select any other machine while

base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
-- 
2.55.0.11.g153666a7d9bb


