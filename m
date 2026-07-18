Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C121C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 09:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hAQh92xiHuxy24em2szgQVZY3Sgo8YJL/c+Vt1olVPE=; b=Noj588JcH9QppM1eTEpTXbiCri
	+VUfYS0Ii9NxBRfo09OlCAO4leVJSSmq3X2PZ9CSeMblnZ+rstqiaLCzqobkzq7GGvmL00SG+nsAd
	6KF8OXVozGv2d2SbJgV2CqrkW0T2v1R2Eyp13XSMB7VU4RY0h/ktjzGMAbiIbVzEOaJEtbjGIQHgs
	1ioU2WHe3IYB7l1ZsLwoypx4LmXNAeVqKSwBn03A/G60c+lTp8CCI2tpRSNyBWWjWinTfx4qHNNwo
	H1SNcKBqNG9tEBr/ljs3WaG+buybNR3R4SqZCq5q6APn3qTknPuzbhJ5uPVb+NLt+FkA9ZwpDd+9k
	7F/Eqnfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl1DQ-00000003x0I-3Ts2;
	Sat, 18 Jul 2026 09:20:12 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl1DN-00000003wzk-21GQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 09:20:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784366396; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d4uXtXsojZ9niWNoSNItuz9oSsih7XWUHwEUcdNQ/w2WZFcHE3GJooCCqckeW6s46Xyn54rotrOTxjiUsXGPFo4BSS4cBm3g/YNyDuf3fOaEQW0JAhJL3Xmdv0EDYwreQXgbdJq1/1QTn1/XKzIYxYR2io+B8vD4XOZ48AQ742I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784366396; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hAQh92xiHuxy24em2szgQVZY3Sgo8YJL/c+Vt1olVPE=; 
	b=KlmFzUVym2NLPQ7lclvO2JhFV0N05sNvtsnw6hIq2OtTTrTPDUyhY7TzN3juwwn6Jr6UVUbrGKFbw51tBdfjLXBUbQDAJwcas0vjMy0RTbc7SuF2UHYlgXQN13lqqcaw0y+uCmLKWJFO5MYgp2MB0Ut77npbDGLMXIMCcFqKUzE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yoavmoshe.com;
	spf=pass  smtp.mailfrom=linux@yoavmoshe.com;
	dmarc=pass header.from=<linux@yoavmoshe.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784366396;
	s=zoho; d=yoavmoshe.com; i=linux@yoavmoshe.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hAQh92xiHuxy24em2szgQVZY3Sgo8YJL/c+Vt1olVPE=;
	b=l/aUp9Uv05QViHiGl8c1Lv4Fsq52btodrCQfR3iJcZhpWrC2bDSXkVaILnvy0s5E
	ESJqQq4yllokG0Bf0Qz3U/pFHqhBEMLdMScIu+WhHjHmXiiEdHq28fyD2xmXzbXWD/E
	jKs1uaTv7aJP88W3945DzoJ5AGKF2N4Un64t9n2I=
Received: by mx.zohomail.com with SMTPS id 1784366393113119.4825574702162;
	Sat, 18 Jul 2026 02:19:53 -0700 (PDT)
From: Yo'av Moshe <linux@yoavmoshe.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yo'av Moshe <linux@yoavmoshe.com>
Subject: [PATCH v2] ARM: imx: Fix suspend/resume crash with Clang CFI
Date: Sat, 18 Jul 2026 11:19:17 +0200
Message-ID: <20260718091917.81738-1-linux@yoavmoshe.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_022009_579980_B4EB7CE6 
X-CRM114-Status: GOOD (  11.51  )
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

Relocated suspend code in OCRAM lacks compiler-generated CFI type
signatures. When CONFIG_CFI=y is active, the indirect call to
imx6_suspend_in_ocram_fn triggers a strict CFI violation panic.

Annotate imx6q_suspend_finish with __nocfi to bypass CFI checking
for this specific indirect call.

Additionally, protect the imx6_suspend_in_ocram_fn pointer by marking
it __ro_after_init to prevent it from being used as a CFI bypass
exploit vector.

Cc: stable@vger.kernel.org
Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>
---
Tested on a Kobo Clara HD (i.MX6SLL SoC) running postmarketOS edge. 
Before this patch, suspending the device caused an immediate silent 
hang requiring a hard-reboot. With this patch applied, suspend and 
resume work successfully.

Differences from v1:
- Added __ro_after_init to imx6_suspend_in_ocram_fn to prevent it
  from being exploited as a CFI bypass gadget.

 arch/arm/mach-imx/pm-imx6.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
index a671ca498..b425a4701 100644
--- a/arch/arm/mach-imx/pm-imx6.c
+++ b/arch/arm/mach-imx/pm-imx6.c
@@ -63,7 +63,7 @@
 
 static void __iomem *ccm_base;
 static void __iomem *suspend_ocram_base;
-static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase);
+static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase) __ro_after_init;
 
 /*
  * suspend ocram space layout:
@@ -360,7 +360,7 @@ int imx6_set_lpm(enum mxc_cpu_pwr_mode mode)
 	return 0;
 }
 
-static int imx6q_suspend_finish(unsigned long val)
+static int __nocfi imx6q_suspend_finish(unsigned long val)
 {
 	if (!imx6_suspend_in_ocram_fn) {
 		cpu_do_idle();
-- 
2.55.0


