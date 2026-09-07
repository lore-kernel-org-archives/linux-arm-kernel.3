Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86499C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rtoq7BEyavTGfZjSp7IB1b4Ruu54qj5DkL46/QVJ8UQ=; b=qu5sYLJdYHYQcIq/OrvQD4HbJ9
	hTIECnHjtSVdFnqg9WhS4wRrXoASRY9xLjuGguRSn4Edj4fjWol+rgppf1ox8UvewdMt8Jj3DuGmu
	j+wg0jQZg+lqM1ypyA6gjmezswSnDG9LKHr/owKdWgoY2K06wsEis/CoBnvB2qrkXjrWcpoz7UxhH
	rv+khs3irBROP39n1/Hbn4qcJbNCeMEFqzWdMe88AQl+ogDeuYX+9Z7IaJ+3Cq9rGg4bzie9GfaWo
	KSk8EtbNtEQ7RUPTuo6NBK86VG6YGvyM08q4WiYJ6aiR4w6ZoOgKJr7H8SC40dHk2ImiaAB1iqTp9
	xHYKxkLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TA5-000000063qR-0EnI;
	Mon, 07 Sep 2026 06:49:01 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TA2-000000063pb-1HX0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:48:59 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso2263162a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 23:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763738; x=1789368538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rtoq7BEyavTGfZjSp7IB1b4Ruu54qj5DkL46/QVJ8UQ=;
        b=CBlIxShIVON9u6eKrXvJQHss2fM2qzffAd0cAWbOIjXHY2wQ3mlS0pD14iTGtE6HOR
         s3UvxPSq+OQnuziRVUiyuBIgpIypWBgw73c/CaEavdKDChFqn12tMG0f2H9jEjxNZLwl
         +g6v2Gj5aL7tfrx2KJIhirdeYAeAVGzYyfP6I4GFVHgAYNRvWwH7BHsdj2J4MjTEgCzH
         W/I0rxDq5S3dsrIVJ6i+rhOhXDadMoNCRzYyrHlEDrICdz9BdmX5pIyCXQv0Kv9WoeA6
         i4GLkX8DPiJDOEqpxctoucZbtRJff4OM/y36zyjtx7M9DxwNSP9WxQhuN2Ylo0+XZPHH
         46hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763738; x=1789368538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rtoq7BEyavTGfZjSp7IB1b4Ruu54qj5DkL46/QVJ8UQ=;
        b=Jv50fUplpybJdiZL4sxTF2dV4Pc2r6f0+TMdTpV55Q0WMuMR/iHSEZHuzkgMjX6yk4
         sTQcylOAoUpRU3NTek3NNg7EdR6uzSOU4voBww+koMG/nB5cLMVAGNTWyN8KYyAqaE0T
         l7ok4YQtdqStUnlDhrriN9RdJmAvALLEeEG4M3IKXQnG7T1ubQzinAKPeyr6f7EZxEtZ
         wAxWofrKJgy+2WNyIRWf7vz6wJ+20O46rdy9ABZa8rQHXU0YwyG1kqQ/F22nE2yQCvdo
         FJNedvaqJVbbOtrNVI4iJ1bGfR+tdN9c4AGEbx3dEO5dmvxhzIvXnNzMrFEOYEVKozS3
         T/qw==
X-Gm-Message-State: AFuF++n6Niu6vKDIgPWAYJ2LcTM2HTVM6roar29DeeejmDQUqY5Xgxnr
	rTQ1Xr3l8fSWM7YdVNIcw3kaf9/j2dfoptfFEG7LJfUF797hYTmPSZbC
X-Gm-Gg: AYBFou0TjCJHCOeA6e15/nR82GP2GSr+mUNWRlxec8MM1dElofcXne92laqh3ntO3wH
	Z7Nxwwr785qtmMbxbiULGmFh7bUO8aOr4AM5lhQi7td9pOSdXpVmRlO42ivJCWFMdnUCIFaZk/K
	mnsMQ5P7YV3XOoWv3pBs3OYNKJkhnoqFVSeU4xt0a2mIZt18E94Gdvsf0YLth1oqWrghKi/an1o
	jqMaipnwED0wuBZ1LrQnIWrIy8s1hBH6dLuDzCvwW6bCj+qfiM5S9erJo/Mqr2Zz7KQNA9SkI0O
	JOZg6P+pHQxOT9GS52Hcmd7bV8OEmUstFGH2CIGysUoM7Rwtfk6ZrzwCp3jfwb3gOaZMaFOa2T+
	g4CdQkLOyfgMDnmcEMUNQen9FQuVKRiKht+Xv1LZACqEtZAdsLoXW2mawXuZReNYe27kErWZsHW
	o6WoNF80s8iDc52AitZVvCutMTDPM+LAS51ca5j872mnjGEYoQvF5ixOGjQTbq3nMIxMRNg3czs
	mOEj3zEy2+UGA==
X-Received: by 2002:a17:90b:564c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39b2612338dmr35180041a91.4.1788763737558;
        Sun, 06 Sep 2026 23:48:57 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm25057807eec.26.2026.09.06.23.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:48:57 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Paul Walmsley <paul@pwsan.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] ARM: fix typos in comments
Date: Mon,  7 Sep 2026 12:18:49 +0530
Message-ID: <20260907064849.23086-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_234858_346577_00273E1F 
X-CRM114-Status: GOOD (  18.62  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm/mach-imx/suspend-imx6.S           | 2 +-
 arch/arm/mach-omap2/omap4-common.c         | 2 +-
 arch/arm/mach-omap2/omap_hwmod.c           | 6 +++---
 arch/arm/mach-omap2/powerdomains7xx_data.c | 2 +-
 arch/arm/mach-tegra/pm.c                   | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-imx/suspend-imx6.S b/arch/arm/mach-imx/suspend-imx6.S
index 63ccc2d0e920..3f8670296358 100644
--- a/arch/arm/mach-imx/suspend-imx6.S
+++ b/arch/arm/mach-imx/suspend-imx6.S
@@ -234,7 +234,7 @@ set_mmdc_io_lpm_done:
 	 * mask all GPC interrupts before
 	 * enabling the RBC counters to
 	 * avoid the counter starting too
-	 * early if an interupt is already
+	 * early if an interrupt is already
 	 * pending.
 	 */
 	ldr	r11, [r0, #PM_INFO_MX6Q_GPC_V_OFFSET]
diff --git a/arch/arm/mach-omap2/omap4-common.c b/arch/arm/mach-omap2/omap4-common.c
index 5d924b85b694..633451b6f548 100644
--- a/arch/arm/mach-omap2/omap4-common.c
+++ b/arch/arm/mach-omap2/omap4-common.c
@@ -96,7 +96,7 @@ static void omap4_mb(void)
  * interconnects.
  *
  * This situation can happen only when the idle is initiated by a Master
- * Request Disconnection (which is trigged by software when executing WFI
+ * Request Disconnection (which is triggered by software when executing WFI
  * on the CPU).
  *
  * The work-around for this errata needs all the initiators connected
diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index 03cd523dff87..0f4ba19804c6 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -646,7 +646,7 @@ static struct clockdomain *_get_clkdm(struct omap_hwmod *oh)
  * @oh: struct omap_hwmod *
  *
  * Prevent the hardware module @oh from entering idle while the
- * hardare module initiator @init_oh is active.  Useful when a module
+ * hardware module initiator @init_oh is active.  Useful when a module
  * will be accessed by a particular initiator (e.g., if a module will
  * be accessed by the IVA, there should be a sleepdep between the IVA
  * initiator and the module).  Only applies to modules in smart-idle
@@ -674,7 +674,7 @@ static int _add_initiator_dep(struct omap_hwmod *oh, struct omap_hwmod *init_oh)
  * _del_initiator_dep: allow @oh to smart-idle even if @init_oh is active
  * @oh: struct omap_hwmod *
  *
- * Allow the hardware module @oh to enter idle while the hardare
+ * Allow the hardware module @oh to enter idle while the hardware
  * module initiator @init_oh is active.  Useful when a module will not
  * be accessed by a particular initiator (e.g., if a module will not
  * be accessed by the IVA, there should be no sleepdep between the IVA
@@ -1706,7 +1706,7 @@ static int _ocp_softreset(struct omap_hwmod *oh)
 		return -EINVAL;
 	}
 
-	/* For some modules, all optionnal clocks need to be enabled as well */
+	/* For some modules, all optional clocks need to be enabled as well */
 	if (oh->flags & HWMOD_CONTROL_OPT_CLKS_IN_RESET)
 		_enable_optional_clocks(oh);
 
diff --git a/arch/arm/mach-omap2/powerdomains7xx_data.c b/arch/arm/mach-omap2/powerdomains7xx_data.c
index 921cb1b29cb4..df13451bd0f4 100644
--- a/arch/arm/mach-omap2/powerdomains7xx_data.c
+++ b/arch/arm/mach-omap2/powerdomains7xx_data.c
@@ -223,7 +223,7 @@ static struct powerdomain mpu_7xx_pwrdm = {
 	},
 };
 
-/* l3init_7xx_pwrdm: L3 initators pheripherals power domain  */
+/* l3init_7xx_pwrdm: L3 initiators pheripherals power domain  */
 static struct powerdomain l3init_7xx_pwrdm = {
 	.name		  = "l3init_pwrdm",
 	.prcm_offs	  = DRA7XX_PRM_L3INIT_INST,
diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index b21f51b8e19e..d7bc21bdb519 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -257,7 +257,7 @@ static int tegra_sleep_core(unsigned long v2p)
  * tegra_lp1_iram_hook
  *
  * Hooking the address of LP1 reset vector and SDRAM self-refresh code in
- * SDRAM. These codes not be copied to IRAM in this fuction. We need to
+ * SDRAM. These codes not be copied to IRAM in this function. We need to
  * copy these code to IRAM before LP0/LP1 suspend and restore the content
  * of IRAM after resume.
  */
-- 
2.48.1


