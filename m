Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F65DCAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 16:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yDDLmXNOpjcbDQQVLqyrBqQRayXD1BDsyJCQpGZRtw=; b=jH8JNan3nmIirkx66lb+jtxnC3
	mApHG3xZNy3m7MRWMxPe8ixmZ9sv8oooTGA87eS2NNDYfGVgzuFmGRdEFT7yhSD4mxxYFzocEjgl4
	V9aMZdggY++yjqGAW2bQCuFdbxK7KkCTFB1F7deEJp2cJv4Z5+JsU+hi2OO32l4tcfRa9D5D0aYh5
	Jpu3/gX2TRw7Yt5znfqPmypK3JOXh1BZATBEvsiC0NhfxOo2BI0r8MjuZ5EAIw9nvK3Qfvp/PnDDb
	+vMUJ4EgAhpZvi+6WPhT3VnUgF3KjLn8H3Tq2qSXIcBFho8SRwArkPDSn8L1n+5cqa6WvVcNqqgti
	FdfRUp2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNak-0000000FRpZ-2F5H;
	Wed, 10 Sep 2025 16:22:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNaf-0000000FRke-3R47
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 16:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757521357; x=1789057357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HRy4Y8fxp59EvUPRyo1sN5bM58I22ICctqiwhIZ2ORo=;
  b=M4UNBCcTGu7+G1vxJvO9kp4hAWkv3uSF//mEdrVbY36PGgEpnyZvsnQr
   eKKnNzmlVBBGHM9LsUD6k0qShzaijJ6429LlVsMU/4vK0GwhRShjuz5Zk
   1z1H697ArWT0wyqR7/dk2dEIB1GWs1+4lc9OjxMzDqMlxm/iqYloAYN5d
   0rkN2qJ0Yet0V2EPT2WOALGGOsjBn/EOd04AqZznuq1/dR7EMKzsNHKYP
   6q0aFJZHYfWzVShhCzG1JclsW4cDi8/0Z274U8oRp7kgF5WVBYJmhVxqO
   YxsvKgRlI/N2BWRpOfbta18xtVGxq4mGSPMUa21mmv87d3MvhONxhfkus
   Q==;
X-CSE-ConnectionGUID: yOp9HMF6QSeW0ZytE26RNg==
X-CSE-MsgGUID: ELQo421uRx6cAqZp9KSB4g==
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="46875550"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Sep 2025 09:22:36 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 10 Sep 2025 09:22:10 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 10 Sep 2025 09:22:10 -0700
From: <Ryan.Wanner@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <sre@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] ARM: at91: PM: implement selection of LPM
Date: Wed, 10 Sep 2025 09:20:37 -0700
Message-ID: <e72d9af1326cf44888059270263afde875ccc994.1757519351.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757519351.git.Ryan.Wanner@microchip.com>
References: <cover.1757519351.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_092237_932147_542195C7 
X-CRM114-Status: GOOD (  28.29  )
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

From: Claudiu Beznea <claudiu.beznea@tuxon.dev>

The LPM shutdown controller output could signal the transition to PM
state for different devices connected on board. On different boards
LPM could be connected to different devices (e.g. on SAMA7G5-EK REV4
the LPM is connected to on main crystal oscillator, KSZ8081 PHY and
to MCP16502 PMIC). Toggling LPM on BSR PM mode is done unconditionally
and it helps PMIC to transition to a power saving mode. Toggling LPM
on ULP0 and ULP1 should be done conditionally based on user defined
wakeup sources, available wakeup source for PM mode and connections to
SHDWC's LPM pin. On ULP0 any device could act as wakeup sources. On ULP1
only some of the on SoC controllers could act as wakeup sources. For this
the architecture specific PM code parses board specific LPM devices,
check them against possible wakeup source (in case of ULP1) and tells
assembly code to act properly on SHDWC's LPM pin.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: Fixed conflicts when applying.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/mach-at91/pm.c              | 98 +++++++++++++++++++++++++++-
 arch/arm/mach-at91/pm.h              |  1 +
 arch/arm/mach-at91/pm_data-offsets.c |  1 +
 arch/arm/mach-at91/pm_suspend.S      | 50 ++++++++++++--
 4 files changed, 141 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 35058b99069c..29348d6c852b 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -116,6 +116,7 @@ struct at91_pm_quirks {
  * @config_shdwc_ws: wakeup sources configuration function for SHDWC
  * @config_pmc_ws: wakeup srouces configuration function for PMC
  * @ws_ids: wakup sources of_device_id array
+ * @shdwc_np: pointer to shdwc node
  * @bu: backup unit mapped data (for backup mode)
  * @quirks: PM quirks
  * @data: PM data to be used on last phase of suspend
@@ -126,6 +127,7 @@ struct at91_soc_pm {
 	int (*config_shdwc_ws)(void __iomem *shdwc, u32 *mode, u32 *polarity);
 	int (*config_pmc_ws)(void __iomem *pmc, u32 mode, u32 polarity);
 	const struct of_device_id *ws_ids;
+	struct device_node *shdwc_np;
 	struct at91_pm_bu *bu;
 	struct at91_pm_quirks quirks;
 	struct at91_pm_data data;
@@ -243,6 +245,84 @@ static const struct of_device_id sam9x7_ws_ids[] = {
 	{ /* sentinel */ }
 };
 
+static int at91_pm_device_in_list(const struct platform_device *pdev,
+				  const struct of_device_id *ids)
+{
+	struct platform_device *local_pdev;
+	const struct of_device_id *match;
+	struct device_node *np;
+	int in_list = 0;
+
+	for_each_matching_node_and_match(np, ids, &match) {
+		local_pdev = of_find_device_by_node(np);
+		if (!local_pdev)
+			continue;
+
+		if (pdev == local_pdev)
+			in_list = 1;
+
+		put_device(&local_pdev->dev);
+		if (in_list)
+			return in_list;
+	}
+
+	return in_list;
+}
+
+static int at91_pm_prepare_lpm(unsigned int pm_mode)
+{
+	struct platform_device *pdev;
+	int ndevices, i, ret;
+	struct of_phandle_args lpmspec;
+
+	if ((pm_mode != AT91_PM_ULP0 && pm_mode != AT91_PM_ULP1) ||
+	    !soc_pm.shdwc_np)
+		return 0;
+
+	ndevices = of_count_phandle_with_args(soc_pm.shdwc_np,
+					      "microchip,lpm-connection", 0);
+	if (ndevices < 0)
+		return 0;
+
+	soc_pm.data.lpm = 1;
+	for (i = 0; i < ndevices; i++) {
+		ret = of_parse_phandle_with_args(soc_pm.shdwc_np,
+						 "microchip,lpm-connection",
+						 NULL, i, &lpmspec);
+		if (ret < 0) {
+			if (ret == -ENOENT) {
+				continue;
+			} else {
+				soc_pm.data.lpm = 0;
+				return ret;
+			}
+		}
+
+		pdev = of_find_device_by_node(lpmspec.np);
+		if (!pdev)
+			continue;
+
+		if (device_may_wakeup(&pdev->dev)) {
+			if (pm_mode == AT91_PM_ULP1) {
+				/*
+				 * ULP1 wake-up sources are limited. Ignore it if not
+				 * in soc_pm.ws_ids.
+				 */
+				if (at91_pm_device_in_list(pdev, soc_pm.ws_ids))
+					soc_pm.data.lpm = 0;
+			} else {
+				soc_pm.data.lpm = 0;
+			}
+		}
+
+		put_device(&pdev->dev);
+		if (!soc_pm.data.lpm)
+			break;
+	}
+
+	return 0;
+}
+
 static int at91_pm_config_ws(unsigned int pm_mode, bool set)
 {
 	const struct wakeup_source_info *wsi;
@@ -481,10 +561,17 @@ static int at91_pm_begin(suspend_state_t state)
 		soc_pm.data.mode = -1;
 	}
 
-	ret = at91_pm_config_ws(soc_pm.data.mode, true);
+	ret = at91_pm_prepare_lpm(soc_pm.data.mode);
 	if (ret)
 		return ret;
 
+	ret = at91_pm_config_ws(soc_pm.data.mode, true);
+	if (ret) {
+		/* Revert LPM if any. */
+		soc_pm.data.lpm = 0;
+		return ret;
+	}
+
 	if (soc_pm.data.mode == AT91_PM_BACKUP)
 		soc_pm.bu->suspended = 1;
 	else if (soc_pm.bu)
@@ -1266,7 +1353,11 @@ static void __init at91_pm_modes_init(const u32 *maps, int len)
 			AT91_PM_REPLACE_MODES(maps, SHDWC);
 		} else {
 			soc_pm.data.shdwc = of_iomap(np, 0);
-			of_node_put(np);
+			/*
+			 * np is used further on suspend/resume path so we skip the
+			 * of_node_put(np) here.
+			 */
+			soc_pm.shdwc_np = np;
 		}
 	}
 
@@ -1669,7 +1760,8 @@ void __init sama7_pm_init(void)
 		AT91_PM_STANDBY, AT91_PM_ULP0, AT91_PM_ULP1, AT91_PM_BACKUP,
 	};
 	static const u32 iomaps[] __initconst = {
-		[AT91_PM_ULP0]		= AT91_PM_IOMAP(SFRBU),
+		[AT91_PM_ULP0]		= AT91_PM_IOMAP(SFRBU) |
+					  AT91_PM_IOMAP(SHDWC),
 		[AT91_PM_ULP1]		= AT91_PM_IOMAP(SFRBU) |
 					  AT91_PM_IOMAP(SHDWC) |
 					  AT91_PM_IOMAP(ETHC),
diff --git a/arch/arm/mach-at91/pm.h b/arch/arm/mach-at91/pm.h
index 50c3a425d140..5707ff6ff444 100644
--- a/arch/arm/mach-at91/pm.h
+++ b/arch/arm/mach-at91/pm.h
@@ -40,6 +40,7 @@ struct at91_pm_data {
 	unsigned int pmc_mckr_offset;
 	unsigned int pmc_version;
 	unsigned int pmc_mcks;
+	unsigned int lpm;
 };
 #endif
 
diff --git a/arch/arm/mach-at91/pm_data-offsets.c b/arch/arm/mach-at91/pm_data-offsets.c
index 0ca5da66dc26..fb9651abdfdf 100644
--- a/arch/arm/mach-at91/pm_data-offsets.c
+++ b/arch/arm/mach-at91/pm_data-offsets.c
@@ -20,6 +20,7 @@ int main(void)
 						 pmc_version));
 	DEFINE(PM_DATA_PMC_MCKS,	offsetof(struct at91_pm_data,
 						 pmc_mcks));
+	DEFINE(PM_DATA_LPM,		offsetof(struct at91_pm_data, lpm));
 
 	return 0;
 }
diff --git a/arch/arm/mach-at91/pm_suspend.S b/arch/arm/mach-at91/pm_suspend.S
index aad53ec9e957..198236bdbbb3 100644
--- a/arch/arm/mach-at91/pm_suspend.S
+++ b/arch/arm/mach-at91/pm_suspend.S
@@ -110,9 +110,30 @@ lp_done_\ena:
 #endif
 	.endm
 
-	.macro at91_backup_set_lpm reg
+/*
+ * Set LPM
+ * @ena: 0 - disable LPM
+ *	 1 - enable LPM
+ *
+ * Side effects: overwrites r7, r8, r9
+ */
+	.macro at91_set_lpm ena
 #ifdef CONFIG_SOC_SAMA7
-	orr	\reg, \reg, #0x200000
+	ldr	r7, .lpm
+	cmp	r7, #1
+	bne	21f
+	ldr	r7, .shdwc
+	cmp	r7, #0
+	beq	21f
+	mov	r8, #0xA5000000
+	add	r8, #0x200000
+	mov	r9, #\ena
+	cmp	r9, #1
+	beq	20f
+	add	r8, #0x200000
+20:
+	str	r8, [r7]
+21:
 #endif
 	.endm
 
@@ -502,7 +523,7 @@ sr_dis_exit:
 	ldr	tmp1, [pmc, #AT91_PMC_SR]
 	str	tmp1, .saved_osc_status
 	tst	tmp1, #AT91_PMC_MOSCRCS
-	bne	1f
+	bne	7f
 
 	/* Turn off RC oscillator */
 	ldr	tmp1, [pmc, #AT91_CKGR_MOR]
@@ -516,6 +537,9 @@ sr_dis_exit:
 	tst	tmp1, #AT91_PMC_MOSCRCS
 	bne	2b
 
+	/* Enable LPM. */
+7:	at91_set_lpm 1
+
 	/* Wait for interrupt */
 1:	at91_cpu_idle
 
@@ -533,8 +557,10 @@ sr_dis_exit:
 	wait_mckrdy tmp3
 	b	6f
 
-5:	/* Restore RC oscillator state */
-	ldr	tmp1, .saved_osc_status
+5:	at91_set_lpm 0
+
+	/* Restore RC oscillator state */
+8:	ldr	tmp1, .saved_osc_status
 	tst	tmp1, #AT91_PMC_MOSCRCS
 	beq	4f
 
@@ -611,6 +637,9 @@ sr_dis_exit:
 
 	wait_mckrdy tmp3
 
+	/* Enable LPM */
+	at91_set_lpm 1
+
 	/* Enter the ULP1 mode by set WAITMODE bit in CKGR_MOR */
 	ldr	tmp1, [pmc, #AT91_CKGR_MOR]
 	orr	tmp1, tmp1, #AT91_PMC_WAITMODE
@@ -624,6 +653,9 @@ sr_dis_exit:
 
 	wait_mckrdy tmp3
 
+	/* Disable LPM. */
+	at91_set_lpm 0
+
 	/* Enable the crystal oscillator */
 	ldr	tmp1, [pmc, #AT91_CKGR_MOR]
 	orr	tmp1, tmp1, #AT91_PMC_MOSCEN
@@ -1083,7 +1115,9 @@ ulp_exit:
 	ldr	r0, .shdwc
 	mov	tmp1, #0xA5000000
 	add	tmp1, tmp1, #0x1
-	at91_backup_set_lpm tmp1
+#ifdef CONFIG_SOC_SAMA7
+	orr	tmp1, tmp1, #0x200000
+#endif
 	str	tmp1, [r0, #0]
 .endm
 
@@ -1117,6 +1151,8 @@ ENTRY(at91_pm_suspend_in_sram)
 #ifdef CONFIG_SOC_SAMA7
 	ldr	tmp1, [r0, #PM_DATA_PMC_MCKS]
 	str	tmp1, .mcks
+	ldr	tmp1, [r0, #PM_DATA_LPM]
+	str	tmp1, .lpm
 #endif
 
 	/*
@@ -1208,6 +1244,8 @@ ENDPROC(at91_pm_suspend_in_sram)
 #ifdef CONFIG_SOC_SAMA7
 .mcks:
 	.word 0
+.lpm:
+	.word 0
 #endif
 .saved_mckr:
 	.word 0
-- 
2.43.0


