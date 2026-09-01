Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871F9C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+g7GJIPtdWwedHTJ9podp+GVNIPQL4Ks21BLzIG8cY=; b=TmXq36bC9C4kXDdnxqUc3u0GG9
	+iSU7D+ZyKiGxiiCqyTnZCne3fTM6kO2POem67Ha7Zg9pdu/GlfEn947W8TH6NR7Ed6xDlgQqqXSr
	kvhoLVmnxyx+1C7XSjhkHgOZ03rQRuU3QIz9MVOiNtn0UW8UM2vyEM7O1cCK3gTX0p1ryE2/y8cHv
	+UjPuykBmBMky/0Cmg3iAAPVz35GUOIAcg/hsXSYZIYpItY97Rr1JdRx/ZIeFcZOLqejpgckvWhgp
	9riDM73Q00qsuSgQy7JqUJEYiszhDTLBIHre0GL7Xyb4lAe3Ui3P7dFITxa/PH2DpZCKwS2oKpeov
	g/wUXRBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Qaa-0000000CXs2-0gtM;
	Tue, 01 Sep 2026 15:39:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QaP-0000000CXIF-2b2X;
	Tue, 01 Sep 2026 15:39:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788277183;
	bh=NALQOEKplp53fKbWBEcQRlrRpuj47XyYSKa1+aBP/Oo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=acd8Gf9F1fl6s0YzknyGV1yqGb0aWKCptQmiMIwYbC7NJamMR0s23E9LroUkVU+rp
	 7xxbSELR2SnpItrl3nAHdHaw8+1C3EA7rg0N2iRkQHdN7y4bdU720aHvqQDPDkKitj
	 qlt3FFLH+pJrnn6j+92DkXT8XvW6cX/sqo/bjI+ekgo2NE9vCsqYN1AYoxwV/w5kMP
	 +QD/ayzjj6tHzPuqaj8Dno5M1EZwNwFYGjrHAJqKLkVYjq5XtPwzjuVe/R6HD2QO8F
	 J4oWmECsTyBq+14mPMgv7qttzN/UW54QLsOrMikJKyPnZDeE98DHX8d9qaghKHKW3Z
	 TAh4tzc9kdgCA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A059C17E0FC6;
	Tue, 01 Sep 2026 17:39:42 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 01 Sep 2026 17:39:05 +0200
Subject: [PATCH v11 17/24] scsi: ufs: mediatek: Clean up logging prints
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-mt8196-ufs-v11-17-dbd007704490@collabora.com>
References: <20260901-mt8196-ufs-v11-0-dbd007704490@collabora.com>
In-Reply-To: <20260901-mt8196-ufs-v11-0-dbd007704490@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Wang <peter.wang@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 "Martin K. Petersen" <mkp@kernel.org>, 
 "Martin K. Petersen" <mkp@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788277163; l=8869;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=l4jJLdOOVz2TRhDImW18T32qH+2cp0lx1YQmehfZ/8o=;
 b=HKH6IVPJkp/oeVA6EY60s5R8dQYJYm9NDD91O2bBNcu53U1Sm94fOtROr5CtFEDrkAtz/a2e6
 GkIKmeEiNhYDQobsRYalW1+rT7mxuiBqB4yiipbjFOnJOW1Y/e4IBK2
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_083945_904841_FABEE653 
X-CRM114-Status: GOOD (  16.89  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The Linux kernel's log buffer provides many levels of verbosity,
associated with different semantic meanings. Care should be taken to
only log useful information to the info level, and log errors to the
error level.

The MediaTek UFS driver does not do this. It freely logs verbose debug
information to the info level, errors to the info level, and sometimes
errors to the warning level.

Adjust all the wrapped kprintf invocations to rectify this situation.
Use user-friendly %pe format codes for printing errors where possible.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 91 ++++++++++++++++++-----------------------
 1 file changed, 40 insertions(+), 51 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 43fb5dbb250b..a84bffe069eb 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -194,8 +194,8 @@ static void ufs_mtk_crypto_enable(struct ufs_hba *hba)
 
 	ufs_mtk_crypto_ctrl(res, 1);
 	if (res.a0) {
-		dev_info(hba->dev, "%s: crypto enable failed, err: %lu\n",
-			 __func__, res.a0);
+		dev_err(hba->dev, "%s: crypto enable failed with error %lu, disabling\n",
+			__func__, res.a0);
 		hba->caps &= ~UFSHCD_CAP_CRYPTO;
 	}
 }
@@ -569,40 +569,38 @@ static void ufs_mtk_boost_crypt(struct ufs_hba *hba, bool boost)
 
 	ret = clk_prepare_enable(cfg->clk_crypt_mux);
 	if (ret) {
-		dev_info(hba->dev, "clk_prepare_enable(): %d\n",
-			 ret);
+		dev_err(hba->dev, "%s: Failed to enable clk_crypt_mux: %pe\n",
+			__func__, ERR_PTR(ret));
 		return;
 	}
 
 	if (boost) {
 		ret = regulator_set_voltage(reg, volt, INT_MAX);
 		if (ret) {
-			dev_info(hba->dev,
-				 "failed to set vcore to %d\n", volt);
+			dev_err(hba->dev, "%s: Failed to set vcore to %d: %pe\n",
+				__func__, volt, ERR_PTR(ret));
 			goto out;
 		}
 
-		ret = clk_set_parent(cfg->clk_crypt_mux,
-				     cfg->clk_crypt_perf);
+		ret = clk_set_parent(cfg->clk_crypt_mux, cfg->clk_crypt_perf);
 		if (ret) {
-			dev_info(hba->dev,
-				 "failed to set clk_crypt_perf\n");
+			dev_err(hba->dev, "%s: Failed to reparent clk_crypt_perf: %pe\n",
+				__func__, ERR_PTR(ret));
 			regulator_set_voltage(reg, 0, INT_MAX);
 			goto out;
 		}
 	} else {
-		ret = clk_set_parent(cfg->clk_crypt_mux,
-				     cfg->clk_crypt_lp);
+		ret = clk_set_parent(cfg->clk_crypt_mux, cfg->clk_crypt_lp);
 		if (ret) {
-			dev_info(hba->dev,
-				 "failed to set clk_crypt_lp\n");
+			dev_err(hba->dev, "%s: Failed to reparent clk_crypt_lp: %pe\n",
+				__func__, ERR_PTR(ret));
 			goto out;
 		}
 
 		ret = regulator_set_voltage(reg, 0, INT_MAX);
 		if (ret) {
-			dev_info(hba->dev,
-				 "failed to set vcore to MIN\n");
+			dev_err(hba->dev, "%s: Failed to set vcore to minimum: %pe\n",
+				__func__, ERR_PTR(ret));
 		}
 	}
 out:
@@ -792,10 +790,8 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
 		if (clk_pwr_off) {
 			ufs_mtk_pwr_ctrl(hba, false);
 		} else {
-			dev_warn(hba->dev, "Clock is not turned off, hba->ahit = 0x%x, AHIT = 0x%x\n",
-				hba->ahit,
-				ufshcd_readl(hba,
-					REG_AUTO_HIBERNATE_IDLE_TIMER));
+			dev_warn(hba->dev, "Clock isn't off, hba->ahit = 0x%x, AHIT = 0x%x\n",
+				 hba->ahit, ufshcd_readl(hba, REG_AUTO_HIBERNATE_IDLE_TIMER));
 		}
 		ufs_mtk_mcq_disable_irq(hba);
 	} else if (on && status == POST_CHANGE) {
@@ -839,11 +835,11 @@ static void ufs_mtk_mcq_set_irq_affinity(struct ufs_hba *hba, unsigned int cpu)
 	_cpu = (cpu == 0) ? 3 : cpu;
 	ret = irq_set_affinity(irq, cpumask_of(_cpu));
 	if (ret) {
-		dev_err(hba->dev, "set irq %d affinity to CPU %d failed\n",
+		dev_err(hba->dev, "setting irq %d affinity to CPU %d failed\n",
 			irq, _cpu);
 		return;
 	}
-	dev_info(hba->dev, "set irq %d affinity to CPU: %d\n", irq, _cpu);
+	dev_dbg(hba->dev, "set irq %d affinity to CPU %d\n", irq, _cpu);
 }
 
 static bool ufs_mtk_is_legacy_chipset(struct ufs_hba *hba, u32 hw_ip_ver)
@@ -859,7 +855,8 @@ static bool ufs_mtk_is_legacy_chipset(struct ufs_hba *hba, u32 hw_ip_ver)
 	default:
 		break;
 	}
-	dev_info(hba->dev, "legacy IP version - 0x%x, is legacy : %d", hw_ip_ver, is_legacy);
+	dev_dbg(hba->dev, "IP version 0x%x, legacy = %s", hw_ip_ver,
+		str_true_false(is_legacy));
 
 	return is_legacy;
 }
@@ -964,15 +961,12 @@ static void ufs_mtk_init_clocks(struct ufs_hba *hba)
 		}
 	}
 
-	list_for_each_entry(clki, head, list) {
-		dev_info(hba->dev, "clk \"%s\" present", clki->name);
-	}
+	list_for_each_entry(clki, head, list)
+		dev_dbg(hba->dev, "clk \"%s\" present", clki->name);
 
 	if (!ufs_mtk_is_clk_scale_ready(hba)) {
 		hba->caps &= ~UFSHCD_CAP_CLK_SCALING;
-		dev_info(hba->dev,
-			 "%s: Clk-scaling not ready. Feature disabled.",
-			 __func__);
+		dev_info(hba->dev, "%s: Clock scaling unavailable", __func__);
 		return;
 	}
 
@@ -982,8 +976,8 @@ static void ufs_mtk_init_clocks(struct ufs_hba *hba)
 	 */
 	reg = devm_regulator_get_optional(dev, "dvfsrc-vcore");
 	if (IS_ERR(reg)) {
-		dev_info(dev, "failed to get dvfsrc-vcore: %ld",
-			 PTR_ERR(reg));
+		if (PTR_ERR(reg) != -ENODEV)
+			dev_err(dev, "Failed to get dvfsrc-vcore: %pe\n", reg);
 		return;
 	}
 
@@ -997,12 +991,9 @@ static void ufs_mtk_init_clocks(struct ufs_hba *hba)
 	host->mclk.vcore_volt = volt;
 
 	/* If default boot is max gear, request vcore */
-	if (reg && volt && host->clk_scale_up) {
-		if (regulator_set_voltage(reg, volt, INT_MAX)) {
-			dev_info(hba->dev,
-				"Failed to set vcore to %d\n", volt);
-		}
-	}
+	if (reg && volt && host->clk_scale_up)
+		if (regulator_set_voltage(reg, volt, INT_MAX))
+			dev_err(hba->dev, "Failed to set vcore to %d\n", volt);
 }
 
 static void ufs_mtk_setup_clk_gating(struct ufs_hba *hba)
@@ -1089,7 +1080,7 @@ static void ufs_mtk_init_mcq_irq(struct ufs_hba *hba)
 		}
 		host->mcq_intr_info[i].hba = hba;
 		host->mcq_intr_info[i].irq = irq;
-		dev_info(hba->dev, "get platform mcq irq: %d, %d\n", i, irq);
+		dev_dbg(hba->dev, "get platform mcq irq: %d, %d\n", i, irq);
 	}
 
 	return;
@@ -1397,10 +1388,9 @@ static int ufs_mtk_pre_pwr_change(struct ufs_hba *hba,
 		ret = ufshcd_uic_change_pwr_mode(hba,
 					FASTAUTO_MODE << 4 | FASTAUTO_MODE);
 
-		if (ret) {
-			dev_err(hba->dev, "%s: HSG1B FASTAUTO failed ret=%d\n",
-				__func__, ret);
-		}
+		if (ret)
+			dev_err(hba->dev, "%s: HSG1B FASTAUTO failed: %pe\n",
+				__func__, ERR_PTR(ret));
 	}
 
 	/* if already configured to the requested pwr_mode, skip adapt */
@@ -1450,7 +1440,7 @@ static int ufs_mtk_auto_hibern8_disable(struct ufs_hba *hba)
 
 out:
 	if (ret) {
-		dev_warn(hba->dev, "exit h8 state fail, ret=%d\n", ret);
+		dev_err(hba->dev, "Failed to exit h8 state: %pe\n", ERR_PTR(ret));
 
 		ufshcd_force_error_recovery(hba);
 
@@ -1646,12 +1636,12 @@ static int ufs_mtk_link_set_hpm(struct ufs_hba *hba)
 	/* Check link state to make sure exit h8 success */
 	err = ufs_mtk_wait_idle_state(hba, 5);
 	if (err) {
-		dev_warn(hba->dev, "wait idle fail, err=%d\n", err);
+		dev_err(hba->dev, "Failed to wait for idle: %pe\n", ERR_PTR(err));
 		return err;
 	}
 	err = ufs_mtk_wait_link_state(hba, VS_LINK_UP, 100);
 	if (err) {
-		dev_warn(hba->dev, "exit h8 state fail, err=%d\n", err);
+		dev_err(hba->dev, "Failed to wait for link to be up: %pe\n", ERR_PTR(err));
 		return err;
 	}
 	ufshcd_set_link_active(hba);
@@ -1955,20 +1945,19 @@ static void ufs_mtk_event_notify(struct ufs_hba *hba,
 
 	/* Print details of UIC Errors */
 	if (evt <= UFS_EVT_DME_ERR) {
-		dev_info(hba->dev,
-			 "Host UIC Error Code (%s): %08x\n",
-			 ufs_uic_err_str[evt], val);
+		dev_err(hba->dev, "Host UIC Error Code (%s): %08x\n",
+			ufs_uic_err_str[evt], val);
 		reg = val;
 	}
 
 	if (evt == UFS_EVT_PA_ERR) {
 		for_each_set_bit(bit, &reg, ARRAY_SIZE(ufs_uic_pa_err_str))
-			dev_info(hba->dev, "%s\n", ufs_uic_pa_err_str[bit]);
+			dev_err(hba->dev, "%s\n", ufs_uic_pa_err_str[bit]);
 	}
 
 	if (evt == UFS_EVT_DL_ERR) {
 		for_each_set_bit(bit, &reg, ARRAY_SIZE(ufs_uic_dl_err_str))
-			dev_info(hba->dev, "%s\n", ufs_uic_dl_err_str[bit]);
+			dev_err(hba->dev, "%s\n", ufs_uic_dl_err_str[bit]);
 	}
 }
 
@@ -2183,7 +2172,7 @@ static int ufs_mtk_mcq_config_resource(struct ufs_hba *hba)
 
 	/* fail mcq initialization if interrupt is not filled properly */
 	if (!host->mcq_nr_intr) {
-		dev_info(hba->dev, "IRQs not ready. MCQ disabled.");
+		dev_err(hba->dev, "IRQs not ready. MCQ disabled.");
 		return -EINVAL;
 	}
 

-- 
2.55.0


