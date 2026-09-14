Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A21C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdnMqmj9cGU6ZnRAl7N/gKJlpmrEN5nlYPcHO+cv+jw=; b=fmELBWACVc8Jqb/bzaN3KJ7AGW
	rlYahIbyya8wihwD4PiiNUJb+n8Zo9PqUt0jr1Tzc0dbuu9kykcEK2zDC0QkwYdpz4Eq7hox4TuQ0
	ksNrPnUR2OntqFhxXoFOjpYy+2zfQSCOs/tsVhKDLnsH9S66JDrP/4xoGqyUX4nYA8/3SKRQTqfPv
	I6h2LXoMj9FCzxEUvVKrfV+V4xrqvO5GNGMa7sxWccDppDJIO7siGbHzvvR9oOwkdaCPH97f2gESO
	CaaxoeYbRWuqkR8f050ukII9D3HGoIA/Vr+tmAsLaNL+vKghg99WgN6sync2qcbOcUN+e9yqmaLKs
	RlUA6XUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x653G-00000003Jnu-3pPr;
	Mon, 14 Sep 2026 11:40:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x652D-00000003ImT-31WT;
	Mon, 14 Sep 2026 11:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789385979;
	bh=0H+tW1eAiu3+cU9qtc84Bzl/5TCiUth2WAJTwtimCXk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J+BoyBOKZy1ES7tM7awNa3TC6jLqHaetb43MrieDgH+bj0SPSIKTrga72/1adMDyC
	 8/IkEZEN7Fzgoi5sbPd3I+SGwpSotS6qzGPLV57Nm71fmajZUoLKh307D7S+RLY+6s
	 ji2zpqNjzkbuaZbEirC0AAExDLiW6i0rJwcGOubu79jumOaPC3x72bF2pdqEc99T3e
	 0ubLe3aGbc/je8YsRBPYs+ZQeCKnn2Hl+PGuQfKxGEb00T53KPtCwFgcEYOlcYVd2E
	 wfyncYtbDu3T/xQ7ZrEdJfcd3A2OrvBt3zqxr0jNBY+58Lljew5Meol8N1ckNDH7Rx
	 iMZKYK7F+oB4g==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0820317E0C7E;
	Mon, 14 Sep 2026 13:39:37 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 14 Sep 2026 13:39:03 +0200
Subject: [PATCH v12 17/24] scsi: ufs: mediatek: Clean up logging prints
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mt8196-ufs-v12-17-9279d7ef814d@collabora.com>
References: <20260914-mt8196-ufs-v12-0-9279d7ef814d@collabora.com>
In-Reply-To: <20260914-mt8196-ufs-v12-0-9279d7ef814d@collabora.com>
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
 "Martin K. Petersen" <mkp@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789385943; l=9087;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=R6XUOtG+l9NxcAXb3eovE3XVvWX+L0RUpzqqexuypMY=;
 b=Krw9v05vCvVB66qrQF2rEGUxVx3NiaWjitiMvEtHJwZcHaeVz2gcWaLn3EXD9sPMA3kuSELre
 FdCj/P1UlauDEAFecBLuqo6msjO5EMGIkCpKg7tL9m3srDpi4HZaxmt
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043941_962279_2DD6D597 
X-CRM114-Status: GOOD (  17.27  )
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
 drivers/ufs/host/ufs-mediatek.c | 92 ++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 51 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index b5b13444d27c..071e81357537 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
+#include <linux/string_choices.h>
 
 #include <ufs/ufshcd.h>
 #include "ufshcd-pltfrm.h"
@@ -194,8 +195,8 @@ static void ufs_mtk_crypto_enable(struct ufs_hba *hba)
 
 	ufs_mtk_crypto_ctrl(res, 1);
 	if (res.a0) {
-		dev_info(hba->dev, "%s: crypto enable failed, err: %lu\n",
-			 __func__, res.a0);
+		dev_err(hba->dev, "%s: crypto enable failed with error %lu, disabling\n",
+			__func__, res.a0);
 		hba->caps &= ~UFSHCD_CAP_CRYPTO;
 	}
 }
@@ -576,40 +577,38 @@ static void ufs_mtk_boost_crypt(struct ufs_hba *hba, bool boost)
 
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
@@ -799,10 +798,8 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
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
@@ -846,11 +843,11 @@ static void ufs_mtk_mcq_set_irq_affinity(struct ufs_hba *hba, unsigned int cpu)
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
@@ -866,7 +863,8 @@ static bool ufs_mtk_is_legacy_chipset(struct ufs_hba *hba, u32 hw_ip_ver)
 	default:
 		break;
 	}
-	dev_info(hba->dev, "legacy IP version - 0x%x, is legacy : %d", hw_ip_ver, is_legacy);
+	dev_dbg(hba->dev, "IP version 0x%x, legacy = %s", hw_ip_ver,
+		str_true_false(is_legacy));
 
 	return is_legacy;
 }
@@ -971,15 +969,12 @@ static void ufs_mtk_init_clocks(struct ufs_hba *hba)
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
 
@@ -989,8 +984,8 @@ static void ufs_mtk_init_clocks(struct ufs_hba *hba)
 	 */
 	reg = devm_regulator_get_optional(dev, "dvfsrc-vcore");
 	if (IS_ERR(reg)) {
-		dev_info(dev, "failed to get dvfsrc-vcore: %ld",
-			 PTR_ERR(reg));
+		if (PTR_ERR(reg) != -ENODEV)
+			dev_err(dev, "Failed to get dvfsrc-vcore: %pe\n", reg);
 		return;
 	}
 
@@ -1004,12 +999,9 @@ static void ufs_mtk_init_clocks(struct ufs_hba *hba)
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
@@ -1096,7 +1088,7 @@ static void ufs_mtk_init_mcq_irq(struct ufs_hba *hba)
 		}
 		host->mcq_intr_info[i].hba = hba;
 		host->mcq_intr_info[i].irq = irq;
-		dev_info(hba->dev, "get platform mcq irq: %d, %d\n", i, irq);
+		dev_dbg(hba->dev, "get platform mcq irq: %d, %d\n", i, irq);
 	}
 
 	return;
@@ -1406,10 +1398,9 @@ static int ufs_mtk_pre_pwr_change(struct ufs_hba *hba,
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
@@ -1459,7 +1450,7 @@ static int ufs_mtk_auto_hibern8_disable(struct ufs_hba *hba)
 
 out:
 	if (ret) {
-		dev_warn(hba->dev, "exit h8 state fail, ret=%d\n", ret);
+		dev_err(hba->dev, "Failed to exit h8 state: %pe\n", ERR_PTR(ret));
 
 		ufshcd_force_error_recovery(hba);
 
@@ -1655,12 +1646,12 @@ static int ufs_mtk_link_set_hpm(struct ufs_hba *hba)
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
@@ -1964,20 +1955,19 @@ static void ufs_mtk_event_notify(struct ufs_hba *hba,
 
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
 
@@ -2192,7 +2182,7 @@ static int ufs_mtk_mcq_config_resource(struct ufs_hba *hba)
 
 	/* fail mcq initialization if interrupt is not filled properly */
 	if (!host->mcq_nr_intr) {
-		dev_info(hba->dev, "IRQs not ready. MCQ disabled.");
+		dev_err(hba->dev, "IRQs not ready. MCQ disabled.");
 		return -EINVAL;
 	}
 

-- 
2.55.0


