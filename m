Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCE7C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 05:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSjMR1x9fxvd3CNHCT9Z5p4pNb/EakIO+LJLpVc6pwE=; b=nVAxvVUh0WoqywOXS+HqatSQvj
	kkAtXGW49a9lVhgzFwVaWpMc6qA9eMRnrdhkP5BSi+Yu9w72+MBpRnWbiGAr7rZgcyUukuXS5bJcy
	CmiCdi/2lB5v4Wle32fVth3NCXedvfYAwFaCSrxEfxMqtAujiYEsMFcXDILJ7A/aMuGmLSY6ocv9b
	fUBgH92Zicu1/ZTVETHlI1Ktb/gRXSF+vtbr8Ud7PWKcO7TDv2gz+AX1EZcE0+BKFaugxnb0KqCOf
	/zo5KrAB62AVEFDXwn8b0wrBYACJQaO9gS5M0gCNMWzYetK+E+ED1f9+4rkc7RMDy2FjwZKxt8RMN
	TLWKgsJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIKcO-00000002yB3-3xfn;
	Fri, 23 May 2025 05:06:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIKCM-00000002uCa-3ize;
	Fri, 23 May 2025 04:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pSjMR1x9fxvd3CNHCT9Z5p4pNb/EakIO+LJLpVc6pwE=; b=mgHXOrPMwwuIE5ZDWkVlUeLZLf
	cPhPXZvYWjQ7h3o21EdE+y3gFe9yzaEeSH5MJVg4DDUN5mK2GR5RNGWwsSa0TAQUyaY3OrdZ8MwlD
	4Zl7rSDRjyi7gfJwPnG1e2t+tjC1RXl5Ekn/mMgcbgDwkGd6KXroITu8hLm64V8G10mAyYLiDqWxY
	DizX3SxHN9jkRpiVdv17bSXRjkLa8qGBmI2oyUxJuzgW4EtTnXIJMtsO1yyibX1wWPmhDMSpi9XjC
	qjKJCYVKVqIWkSfROSYLK0uHalrBAi4FVGqVLactnsgS0dFKwa5kq7sz6k6VCM6nJnod2RO8/HILb
	5nD14UsA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIKCD-000000017td-0srB;
	Fri, 23 May 2025 04:39:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FE4B4A969;
	Fri, 23 May 2025 04:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420A4C4CEF3;
	Fri, 23 May 2025 04:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747975181;
	bh=ukIvmUzCX4cqw7NZIKavKwcJ5OLiJ4po8qig+DsNSjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uUwE0i0mzO0Zz+j7Us+A/yzvLL8wesT1b29aGk+XzYhm3jnxB0QmFL1bW3NDq2VBF
	 mM/v6TzQA3enBRrrnZE8Gxfnke3DBVYhp8AJ54Jc49RzwDSVZJ2g2twPNnbe9bKjny
	 WgMEbYki7U05FMp8iUIvdHvsYvY8fEkcjZxwO6cTEVw5NeusAprtjcombRsjl98E56
	 Z7OsPJA2T4UOircixEEDM0HVPN8rL+TqdWgfWY8HXgPYU27uI1LsGRnihkuFz2JiQ1
	 qTyO+NKnSW1jgPs/kwVYKXqqXGF2jO1cR+P0Cx0S7RMCBY+Zt1y19Z/2Tf8HdBUg5d
	 55EgoqgS825Zg==
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Allison Randal <allison@lohutok.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 05/14] arm: Handle KCOV __init vs inline mismatches
Date: Thu, 22 May 2025 21:39:15 -0700
Message-Id: <20250523043935.2009972-5-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523043251.it.550-kees@kernel.org>
References: <20250523043251.it.550-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3494; i=kees@kernel.org; h=from:subject; bh=ukIvmUzCX4cqw7NZIKavKwcJ5OLiJ4po8qig+DsNSjY=; b=owGbwMvMwCVmps19z/KJym7G02pJDBn6v3/+eOy6cc/2RIGpN/7obJr+t2bVlidcXIkfP8xQ1 a3nOnpNqKOUhUGMi0FWTJElyM49zsXjbXu4+1xFmDmsTCBDGLg4BWAiy0QYGTon/Tmgw7nhdvo/ wRdnq6bd8LbuWrrlwoINcV8Xz6/XsQln+KeoVfztP/+eh4En7ucZ6kupZIYzLLs4sX6mv1rXt5y ayWwA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_053951_872353_BEE6BC1F 
X-CRM114-Status: GOOD (  14.93  )
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

When KCOV is enabled all functions get instrumented, unless
the __no_sanitize_coverage attribute is used. To prepare for
__no_sanitize_coverage being applied to __init functions, we have to
handle differences in how GCC's inline optimizations get resolved. For
arm this exposed several places where __init annotations were missing
but ended up being "accidentally correct". Fix these cases and force
several functions to be inline with __always_inline.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Russell King <linux@armlinux.org.uk>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Nishanth Menon <nm@ti.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Allison Randal <allison@lohutok.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: <linux-arm-kernel@lists.infradead.org>
---
 include/linux/mfd/dbx500-prcmu.h  | 2 +-
 arch/arm/mm/cache-feroceon-l2.c   | 2 +-
 arch/arm/mm/cache-tauros2.c       | 2 +-
 drivers/clocksource/timer-orion.c | 2 +-
 drivers/soc/ti/pm33xx.c           | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mfd/dbx500-prcmu.h b/include/linux/mfd/dbx500-prcmu.h
index 98567623c9df..828362b7860c 100644
--- a/include/linux/mfd/dbx500-prcmu.h
+++ b/include/linux/mfd/dbx500-prcmu.h
@@ -213,7 +213,7 @@ struct prcmu_fw_version {
 
 #if defined(CONFIG_UX500_SOC_DB8500)
 
-static inline void prcmu_early_init(void)
+static inline void __init prcmu_early_init(void)
 {
 	db8500_prcmu_early_init();
 }
diff --git a/arch/arm/mm/cache-feroceon-l2.c b/arch/arm/mm/cache-feroceon-l2.c
index 25dbd84a1aaf..2bfefb252ffd 100644
--- a/arch/arm/mm/cache-feroceon-l2.c
+++ b/arch/arm/mm/cache-feroceon-l2.c
@@ -295,7 +295,7 @@ static inline u32 read_extra_features(void)
 	return u;
 }
 
-static inline void write_extra_features(u32 u)
+static inline void __init write_extra_features(u32 u)
 {
 	__asm__("mcr p15, 1, %0, c15, c1, 0" : : "r" (u));
 }
diff --git a/arch/arm/mm/cache-tauros2.c b/arch/arm/mm/cache-tauros2.c
index b1e1aba602f7..bfe166ccace0 100644
--- a/arch/arm/mm/cache-tauros2.c
+++ b/arch/arm/mm/cache-tauros2.c
@@ -177,7 +177,7 @@ static inline void __init write_actlr(u32 actlr)
 	__asm__("mcr p15, 0, %0, c1, c0, 1\n" : : "r" (actlr));
 }
 
-static void enable_extra_feature(unsigned int features)
+static void __init enable_extra_feature(unsigned int features)
 {
 	u32 u;
 
diff --git a/drivers/clocksource/timer-orion.c b/drivers/clocksource/timer-orion.c
index 49e86cb70a7a..61f1e27fc41e 100644
--- a/drivers/clocksource/timer-orion.c
+++ b/drivers/clocksource/timer-orion.c
@@ -43,7 +43,7 @@ static struct delay_timer orion_delay_timer = {
 	.read_current_timer = orion_read_timer,
 };
 
-static void orion_delay_timer_init(unsigned long rate)
+static void __init orion_delay_timer_init(unsigned long rate)
 {
 	orion_delay_timer.freq = rate;
 	register_current_timer_delay(&orion_delay_timer);
diff --git a/drivers/soc/ti/pm33xx.c b/drivers/soc/ti/pm33xx.c
index dfdff186c805..dc52a2197d24 100644
--- a/drivers/soc/ti/pm33xx.c
+++ b/drivers/soc/ti/pm33xx.c
@@ -145,7 +145,7 @@ static int am33xx_do_sram_idle(u32 wfi_flags)
 	return pm_ops->cpu_suspend(am33xx_do_wfi_sram, wfi_flags);
 }
 
-static int __init am43xx_map_gic(void)
+static int am43xx_map_gic(void)
 {
 	gic_dist_base = ioremap(AM43XX_GIC_DIST_BASE, SZ_4K);
 
-- 
2.34.1


