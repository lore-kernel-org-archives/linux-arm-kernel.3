Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700BECD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 05:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LREGCnvB9r3+rbw8NbYyQSnfAuuxbV3j4ZuR6PAmnmM=; b=lBL76cBJecwnQwK7hsWgHak5/G
	F8vvUJd2eiWXoZcyQ5ITL7SEeC5vFYQDxk73K8CJEewkg0yUDZfVxikxHwU1Mn3UyK/MGse0sK72R
	rdw8DfYkHnJ1kuTKyySjpZhcQWum9pwQ6b0LOCBCidud0T56S0fZxFr9tAdNBa/RKkJgAWHzcWPb0
	CyrZLX16kCs9/bGxki3WWpdoLanOOYTHFEPnumNXX2nNSF7S5R5gjfo+EvK8WvpGSaPnJkFQMj5p6
	krkwM5X4tPcipd+dJOCCffZiplip3iC5S20KWOXWOwJhGS1frisFw5CNJRkhqTujHuvBj3SQIwSRc
	zwDS0hXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV0pB-0000000GBZb-0dEq;
	Thu, 04 Jun 2026 05:41:01 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV0p8-0000000GBXs-2Sm5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 05:40:59 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-7dd7818ac2aso4332747b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 22:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780551657; x=1781156457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LREGCnvB9r3+rbw8NbYyQSnfAuuxbV3j4ZuR6PAmnmM=;
        b=Al2pRSRF0hNAOrukMF0HPGsF+uLPkrRdriFAVfp8jd8icF6XDVqNh1qDRKGeqqy3bS
         rfyCmeASP57Q9lgrmThk6HJUiyRAccplemK+pcBXqXM/1i0LHN6bvH7qQcC8P4g91zWv
         VS8lLcMZOnpAyTYTqbb03ajljyHd03Qm21IbfzmKEVoCihEbfiBGzk4ZHN//mUU4n3Fp
         JDmgWBziZNfUReUK/RUnOTxnJs9zdYYU+T9vMZMCABOibzlUu9QrPBba6iFHKU/3mgY9
         vPx/CwJOYLXVqh1lxXWk3zqDb6RgCY5fgNV8G4/KY7oPmcscuBDfNxHiE5aFzLtkCQd2
         5ibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780551657; x=1781156457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LREGCnvB9r3+rbw8NbYyQSnfAuuxbV3j4ZuR6PAmnmM=;
        b=lAPBhB5gCaglcPQiIf1H3tty+pvVuw8N7dwU7gAMuRqMoAY+NxS2L6CrFBcGk7lIGl
         9Op4xwN+zy11yLO06kpboVQZQhjwYSl4qaTHfahl2yN1h9HUppWjED51Dl8gBNkNk7Gk
         sSloXu2J+hGQPbS5d0VEvmOm3ZjNSXn44UqyupcezC5Tm8cFdu8dndcRkL3Dro+yEFvs
         MXib6wU/WyESe+7M+7F4qaAPlmGNiv7ZPCgw0nFTH8JL8LviPvujJOUULUR6wkjmqdmj
         ZgmX0/zvutzNpXM63x2tiq7L7hcXgVKKJ18N7Szn9+Y8ycysmr88OYImXyo3paKbShZt
         rPlg==
X-Forwarded-Encrypted: i=1; AFNElJ+BsVvstvDbgofzersEAWRx4/WMMkgW5PCuRUjTj7f8fENR8QPA7wC0XI+rxcFU1XNx1tFR4s4EEdxk6QY4paLf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1uA0qtp7CrXIl9j3tZFq+Fsw91LJZxcyHWjJsgYDkk2u6BS8E
	oBiLHhHaZcxiXC6DgonNLWP0+pw5ZDll6ExPdp1qW4svUvM65cQoB3ze
X-Gm-Gg: Acq92OEm8jLhoVNWgW8bl+nIvSjqEqUsARMCaVZbuUswS0fuhc3AgiTmV1wv1RsuNP4
	qjvFgn9yc2l4f1bA9KG3TcoLyzlf3fe+ZTWrR6QMNLpnn7wi6x705DLAibnWDc3cYTnoaXRtRvU
	y2abdG+QEgqNw2KbaYGV1Ki8X3eN9nn8B+uflDtemC6AY3YZGBJozd1GqRMjoKYmupcaHo1WJtT
	zyZSnrmWpwpF2oQYVNg5zUVSoEs9BqsS4Mu1BJvU/1Tck6fAiO7PnP0Wcoxxg6effl0119cCky/
	kikFE2BZ0u+BudoleVhvvo/saN8lXkZMN8ZbiRLGzRkwYyFO1V3Bx9NGsuVmzV58rAZj8idmOlx
	zCdYVuI1pD0hfSGrTdojt5pmD88p7H0ygmUoRqkTHBoadnO7hovcaSdD/nuwowZw/6kk/eH9Xht
	nqLci4ikzSfMcN4cvrfdOoqbrH78SXwGz3g7RN3lKAdWRwgnvFKs10L9EDd6ghvkLzbPVI08DpL
	aJWzi82bbBQ+OxkxLkTrY1QfwG3GXYzfOzZFhXa1iePRIQ+FsQaJrK5gAVLvV1MIGYQ4g==
X-Received: by 2002:a05:690c:6d04:b0:7b3:3a49:752 with SMTP id 00721157ae682-7ea4d2715cemr58826857b3.41.1780551657199;
        Wed, 03 Jun 2026 22:40:57 -0700 (PDT)
Received: from localhost.localdomain (99-61-165-33.lightspeed.sntcca.sbcglobal.net. [99.61.165.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ea23592beasm29137517b3.32.2026.06.03.22.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:40:55 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mithil Bavishi <bavishimithil@gmail.com>
Subject: [PATCH v3] ARM: OMAP2+: Add CFI type for omap4_finish_suspend
Date: Wed,  3 Jun 2026 22:40:48 -0700
Message-ID: <20260604054048.18980-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_224058_630878_F2FDCA32 
X-CRM114-Status: GOOD (  11.73  )
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

With CONFIG_CFI enabled, OMAP4 can trap in omap4_enter_lowpower()
because omap_pm_ops.finish_suspend points directly to the assembly
routine omap4_finish_suspend, which lacks the expected KCFI type
metadata.

Annotate omap4_finish_suspend with SYM_TYPED_FUNC_START so the assembly
routine carries the KCFI type metadata.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/mach-omap2/sleep44xx.S | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/sleep44xx.S b/arch/arm/mach-omap2/sleep44xx.S
index f09c91978..8b515f300 100644
--- a/arch/arm/mach-omap2/sleep44xx.S
+++ b/arch/arm/mach-omap2/sleep44xx.S
@@ -6,6 +6,7 @@
  * 	Santosh Shilimkar <santosh.shilimkar@ti.com>
  */
 
+#include <linux/cfi_types.h>
 #include <linux/linkage.h>
 #include <asm/assembler.h>
 #include <asm/smp_scu.h>
@@ -58,7 +59,7 @@
  * stack frame and it expects the caller to take care of it. Hence the entire
  * stack frame is saved to avoid possible stack corruption.
  */
-ENTRY(omap4_finish_suspend)
+SYM_TYPED_FUNC_START(omap4_finish_suspend)
 	stmfd	sp!, {r4-r12, lr}
 	cmp	r0, #0x0
 	beq	do_WFI				@ No lowpower state, jump to WFI
@@ -223,7 +224,7 @@ skip_scu_gp_clear:
 	isb
 	dsb
 	ldmfd	sp!, {r4-r12, pc}
-ENDPROC(omap4_finish_suspend)
+SYM_FUNC_END(omap4_finish_suspend)
 
 /*
  * ============================
-- 
2.43.0


