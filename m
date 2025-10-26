Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A26CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 14:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVg0MZGuo80z4I/+VDSlzSWYbs3/3Bkg6CRYSPb0JEE=; b=FYhI0lpSs2AWHYG9pJ7YtE2jrP
	/xGXFwHyU5zQK1rgoI+r9zG0WBiFjj+3YChtqTbqbrSrJXUxJtcyEXITC13tbsHoLRjZeLnOtPli4
	hGktnnoWjpyh5x7QlB1wXRZGrSptbfz06ZE/knbZFpOf/hIGLqAHCrFDktNuDcMDKuqet8G/Lcpse
	8+Ayq8Sbm8jP0ScV6nEOexTzv5NomL3/M2JWsuPkLJk2MjlQnwrxZPFRkRIommydrQA43xFw9ltQq
	Ddw8Cx4QtCl/TxhK27c9Uw9DEOjrD4KqcLSnBF/oSxy7ZxluiAQ+oUfkjJANW7ZM/a4HNKRhoCHT9
	p3Ugx4LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD250-0000000CS2E-2vIi;
	Sun, 26 Oct 2025 14:50:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD24v-0000000CRyz-2x1T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 14:50:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2580E60418;
	Sun, 26 Oct 2025 14:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DC2C4CEFB;
	Sun, 26 Oct 2025 14:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761490240;
	bh=ZF7t5uIV172t+m2t7jx1vVOLVPSTzJbCEn2iGsK/fNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I4uxg9xA1zacNgtEP7WmqVNIbTU38uqiWwkqMQhQ86uA+9vdt08CIgUkWTO6i1LPp
	 vGHgp7ac1dGy0l5xArTKA7i0ZvHqaV6rn1MKkUT9CKoMNKwaOd+rZsba3U/wQnBr43
	 zPBi2RVVXiuQRurP5xQYICl2vTJNFKbcrq0nqtDz9yauDBfmzMOvJp8kTD0oOOhcId
	 KqbQDHImQXCAnbgTXTzJ/Fvh2nZKjh8f2SY9CCCDaoq5g+gHOoSmvTIE8jERwnbXdX
	 P4/oIH1DMSYInLIH764szsiu4PBGst25GLlqth/plf3MD4qRvsha8/jqKKOM+7RT+H
	 +ajhiJ0OFsg9Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Cristian Birsan <cristian.birsan@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-5.10] ARM: at91: pm: save and restore ACR during PLL disable/enable
Date: Sun, 26 Oct 2025 10:48:55 -0400
Message-ID: <20251026144958.26750-17-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026144958.26750-1-sashal@kernel.org>
References: <20251026144958.26750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Nicolas Ferre <nicolas.ferre@microchip.com>

[ Upstream commit 0c01fe49651d387776abed6a28541e80c8a93319 ]

Add a new word in assembly to store ACR value during the calls
to at91_plla_disable/at91_plla_enable macros and use it.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
[cristian.birsan@microchip.com: remove ACR_DEFAULT_PLLA loading]
Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
Link: https://lore.kernel.org/r/20250827145427.46819-4-nicolas.ferre@microchip.com
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES – the patch fixes a real suspend/resume regression on the
SAM9X60-style PLLs and is safe to backport.

- `arch/arm/mach-at91/pm_suspend.S:693-767` now snapshots the PMC PLL
  Analog Control Register before disabling PLLA and restores that exact
  value when the PLL comes back up, instead of blindly reloading the
  legacy default `0x00020010`. Without this, every suspend cycle
  overwrote any board-/SoC-specific analog tuning done at boot, so PLLA
  resumed with the wrong charge-pump/loop-filter settings.
- The saved word added at `arch/arm/mach-at91/pm_suspend.S:1214-1215` is
  the only state needed; no other logic changes are introduced.
- Multiple SAM9X60-family clock descriptions (for example
  `drivers/clk/at91/sama7g5.c:110-126`,
  `drivers/clk/at91/sam9x60.c:39-52`) program PLL-specific `acr` values
  via `clk-sam9x60-pll.c`, and that driver explicitly writes those
  values into PMC_PLL_ACR before enabling the PLL
  (`drivers/clk/at91/clk-sam9x60-pll.c:106-134`). After suspend, the old
  code immediately replaced them with `AT91_PMC_PLL_ACR_DEFAULT_PLLA`,
  undoing the driver’s configuration and risking unlock or unstable
  clocks on affected boards.
- The regression has existed since the original SAM9X60 PLL support
  (`4fd36e458392`), so every stable kernel that supports these SoCs can
  lose PLL configuration across low-power transitions. The fix is
  minimal, architecture-local, and does not alter behaviour on older PMC
  version 1 platforms because the new code is gated by both the PMC
  version check and `CONFIG_HAVE_AT91_SAM9X60_PLL`.

Given the clear bug fix, confined scope, and lack of risky side effects,
this change fits the stable backport criteria. A good follow-up when
backporting is to run a suspend/resume cycle on a SAM9X60/SAMA7 board to
confirm PLL lock persists.

 arch/arm/mach-at91/pm_suspend.S | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-at91/pm_suspend.S b/arch/arm/mach-at91/pm_suspend.S
index 7e6c94f8edeef..aad53ec9e957b 100644
--- a/arch/arm/mach-at91/pm_suspend.S
+++ b/arch/arm/mach-at91/pm_suspend.S
@@ -689,6 +689,10 @@ sr_dis_exit:
 	bic	tmp2, tmp2, #AT91_PMC_PLL_UPDT_ID
 	str	tmp2, [pmc, #AT91_PMC_PLL_UPDT]
 
+	/* save acr */
+	ldr	tmp2, [pmc, #AT91_PMC_PLL_ACR]
+	str	tmp2, .saved_acr
+
 	/* save div. */
 	mov	tmp1, #0
 	ldr	tmp2, [pmc, #AT91_PMC_PLL_CTRL0]
@@ -758,7 +762,7 @@ sr_dis_exit:
 	str	tmp1, [pmc, #AT91_PMC_PLL_UPDT]
 
 	/* step 2. */
-	ldr	tmp1, =AT91_PMC_PLL_ACR_DEFAULT_PLLA
+	ldr	tmp1, .saved_acr
 	str	tmp1, [pmc, #AT91_PMC_PLL_ACR]
 
 	/* step 3. */
@@ -1207,6 +1211,8 @@ ENDPROC(at91_pm_suspend_in_sram)
 #endif
 .saved_mckr:
 	.word 0
+.saved_acr:
+	.word 0
 .saved_pllar:
 	.word 0
 .saved_sam9_lpr:
-- 
2.51.0


