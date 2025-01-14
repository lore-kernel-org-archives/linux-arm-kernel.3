Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A20E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ig/5LxUL10bhBFW0xWHuz8rUT0GzUhM//SEgmnsWbuo=; b=OeZcYWYwFRp3vao8I0wxmwhkQf
	3EPYLpcs3bGQx3Z+zhz81tT5llhYpSpVeASseL2b3afeScvtTn6hpewfO9OOj0xvE+e5lhtsSsNOa
	5w5r9zKWCpknde3Wou+VpNzWHVrECVLA/4h17IEQTCLpg+8PtPn8xBTxVxp14LXgLNGtH24ssRACf
	CGFwy1PtqOi1e8OT/r1TKW0SbD4D4NJ0B0gImoolgh/KHs75X3WNYGaJR6uU+ocJ6vFUuyvkFqhvn
	ghlk07sfPPka4KsQg6IkN4+9iOA6rfE2QFP7/wDHFePi7QFijdLuosXrCuiZvgKQAautiD9NE9p7i
	JqTJOpJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnes-00000009hFL-0LLq;
	Tue, 14 Jan 2025 20:37:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXndc-00000009gz2-3tjZ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 20:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Ig/5LxUL10bhBFW0xWHuz8rUT0GzUhM//SEgmnsWbuo=; b=BjYE1dYiqXldGExN7Grn5gGnbH
	qxibC2e3Cq1odaM8vngLH6b0Krn960htXsoIIYPPcGWUApK42SAxq8sxhi+Qv4abPcdoeAoamKBaL
	ppNh0eTE6Tk3AXVmHw9+OB2gqbOCnElnkI+eoagQc8iKk3QkO9YrbKCNveZh1RGHcb/W1Ryg4Sqx6
	mEfWcS9VG+JI34+zIZFSPIdBI5Bs8AeDx7glIVs+ZX9PZjtUhS58n+CWCMOp77r0nbgF22iu4TQKn
	YPY1/jSJsaLE2FIm8r/QwTbLJ9HH5t76JVYSOfYvj9lbYs3O0Yp5ZqkCiiaygpUzuU2ACO4pKBjZb
	/eSVc8qg==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXndZ-0000000AcHw-1qyU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 20:35:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43616bf3358so7513605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 12:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736886943; x=1737491743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ig/5LxUL10bhBFW0xWHuz8rUT0GzUhM//SEgmnsWbuo=;
        b=xSPHXLyjxulv4CmPR97w4vu2FnuxTezDazhLAmAc6TL3CivTMcXpVZKNlvV59H+XPs
         Di6CeQL5O2/iFWpk2zJJ9jHPqc6QkupbR0dkybVF/EWVDuPkcqD2j/x7nBCf2QaIclj/
         meLbSLFrQedFkKGX4kAJm+Ue0Ln+4X6tSmPA+UpWLaGM7AgSEwNe6x2TbKncQu9fO9fw
         IvyAL7K8Fxdl8dYAdkTNs867XDdYg5LBijLlzqfrHrMytLhYqzIofThmr7BpZ2wGdqb2
         gQS9p73VHPXC/gGCKlgLP0q/lDnoB4Drq1P9/6DtX8E0nK+SDrf9NRiokdyL6LwgOuju
         b2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736886943; x=1737491743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ig/5LxUL10bhBFW0xWHuz8rUT0GzUhM//SEgmnsWbuo=;
        b=C66Wz3XDKcvrq6GBi6f8PDGy8H+9QShAePjljMGXpu0AYtJvIiX7yIOR9MPjOFQ3Ts
         mLkqSTe7e8oxTvSeOp9k3D3AltraMqAMQPLUokfQ4+1tYS01BKinHrfsY7tFO4nTPr2b
         2TjXcdbMsgoIVp0L5hgVoOX2YoTacXOZm+clTal+X1tzTNG2LBrHpu5ElPr5suL3/3z1
         tUw0l8rsBdEvLxsPW/Lgv4bGrolTmH1OoSUSOI++JwIJnZGOXbl99npQfNsi016ARCq/
         D8rwqjp+/CEzd9SdsAbQG/kyIAbfMTm4TS3gpI1UfPtfboZY3qRUIWamDL/tTb+vVqBT
         EzIw==
X-Forwarded-Encrypted: i=1; AJvYcCWEA87jdsOXJVlkGB4DgYBqXMoY5BUFvIujzQ1x5wt7blpVwRin3n9H1bxiofjfOUzlmWOrlocFqPSA7/lJU8f8@lists.infradead.org
X-Gm-Message-State: AOJu0YwU2ycWPQ7vpdj6xtTjdRxabs13uYvwfXlmtVsoOOhE1IgClB1C
	dW2XVzDmSN81YYl9fnn1kuuhx5h2YYqoV8fH92FOFBRsHaWJODrtsh+DWZFVT1s=
X-Gm-Gg: ASbGncs2dg+O9GcCa9nSvHrta/gKMRQLIiDZNZ5JZLIHFOdoefR9VTp3DdNKGPTsA8E
	KWAw+1NF0RVYuTLF+WEBY4ZoLNBVQcrr+aivaToOulMJ7WqYcYJmGCm+8s+ompBUxtG9f36CB/7
	Iyp9GwJo++CkmOxUmsf33PoVKUmPmpt7DloSQ5wmwz6f0STjDXwMCc8yslcxO2fYE/emxv66qSG
	UlFXYQeabMHvDuxPwxd1Es8nyMoAHXo+2Oq7J7v3/6C3as+oofaog9FHGMPhKNodBRdRsI=
X-Google-Smtp-Source: AGHT+IHWF7xnFpcXGXKNjhHTEjsUJ8iHcCbcevP7fJYnt+RuxU+qwF0tnnycUSXbl2RWpTG3C68iZw==
X-Received: by 2002:a05:600c:1c88:b0:434:f22e:a5be with SMTP id 5b1f17b1804b1-436e270621emr94885475e9.8.1736886942974;
        Tue, 14 Jan 2025 12:35:42 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9d8fc81sm189284205e9.5.2025.01.14.12.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:35:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] phy: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 21:35:37 +0100
Message-ID: <20250114203537.1012955-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_203545_917003_7396D050 
X-CRM114-Status: GOOD (  12.14  )
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

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/broadcom/phy-bcm-cygnus-pcie.c |  3 ++-
 drivers/phy/realtek/phy-rtk-usb2.c         | 15 ++++++++-------
 drivers/phy/realtek/phy-rtk-usb3.c         |  9 +++++----
 drivers/phy/ti/phy-twl4030-usb.c           |  4 ++--
 drivers/phy/xilinx/phy-zynqmp.c            |  3 ++-
 5 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c b/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c
index 462c61a24ec5..562d7d7151c5 100644
--- a/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c
+++ b/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c
@@ -7,6 +7,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 
 #define PCIE_CFG_OFFSET         0x00
 #define PCIE1_PHY_IDDQ_SHIFT    10
@@ -86,7 +87,7 @@ static int cygnus_pcie_power_config(struct cygnus_pcie_phy *phy, bool enable)
 
 	mutex_unlock(&core->lock);
 	dev_dbg(core->dev, "PCIe PHY %d %s\n", phy->id,
-		enable ? "enabled" : "disabled");
+		str_enabled_disabled(enable));
 	return 0;
 }
 
diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
index 248550ef98ca..14543636796d 100644
--- a/drivers/phy/realtek/phy-rtk-usb2.c
+++ b/drivers/phy/realtek/phy-rtk-usb2.c
@@ -14,6 +14,7 @@
 #include <linux/debugfs.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/regmap.h>
+#include <linux/string_choices.h>
 #include <linux/sys_soc.h>
 #include <linux/mfd/syscon.h>
 #include <linux/phy/phy.h>
@@ -729,7 +730,7 @@ static int rtk_usb2_parameter_show(struct seq_file *s, void *unused)
 
 	seq_puts(s, "Property:\n");
 	seq_printf(s, "  check_efuse: %s\n",
-		   phy_cfg->check_efuse ? "Enable" : "Disable");
+		   str_enable_disable(phy_cfg->check_efuse));
 	seq_printf(s, "  check_efuse_version: %d\n",
 		   phy_cfg->check_efuse_version);
 	seq_printf(s, "  efuse_dc_driving_rate: %d\n",
@@ -741,17 +742,17 @@ static int rtk_usb2_parameter_show(struct seq_file *s, void *unused)
 	seq_printf(s, "  dc_disconnect_mask: 0x%x\n",
 		   phy_cfg->dc_disconnect_mask);
 	seq_printf(s, "  usb_dc_disconnect_at_page0: %s\n",
-		   phy_cfg->usb_dc_disconnect_at_page0 ? "true" : "false");
+		   str_true_false(phy_cfg->usb_dc_disconnect_at_page0));
 	seq_printf(s, "  do_toggle: %s\n",
-		   phy_cfg->do_toggle ? "Enable" : "Disable");
+		   str_enable_disable(phy_cfg->do_toggle));
 	seq_printf(s, "  do_toggle_driving: %s\n",
-		   phy_cfg->do_toggle_driving ? "Enable" : "Disable");
+		   str_enable_disable(phy_cfg->do_toggle_driving));
 	seq_printf(s, "  driving_updated_for_dev_dis: 0x%x\n",
 		   phy_cfg->driving_updated_for_dev_dis);
 	seq_printf(s, "  use_default_parameter: %s\n",
-		   phy_cfg->use_default_parameter ? "Enable" : "Disable");
+		   str_enable_disable(phy_cfg->use_default_parameter));
 	seq_printf(s, "  is_double_sensitivity_mode: %s\n",
-		   phy_cfg->is_double_sensitivity_mode ? "Enable" : "Disable");
+		   str_enable_disable(phy_cfg->is_double_sensitivity_mode));
 
 	for (index = 0; index < rtk_phy->num_phy; index++) {
 		struct phy_parameter *phy_parameter;
@@ -830,7 +831,7 @@ static int rtk_usb2_parameter_show(struct seq_file *s, void *unused)
 		seq_printf(s, "  efuse_usb_dc_dis: %d\n",
 			   (int)phy_parameter->efuse_usb_dc_dis);
 		seq_printf(s, "  inverse_hstx_sync_clock: %s\n",
-			   phy_parameter->inverse_hstx_sync_clock ? "Enable" : "Disable");
+			   str_enable_disable(phy_parameter->inverse_hstx_sync_clock));
 		seq_printf(s, "  driving_level: %d\n",
 			   phy_parameter->driving_level);
 		seq_printf(s, "  driving_level_compensate: %d\n",
diff --git a/drivers/phy/realtek/phy-rtk-usb3.c b/drivers/phy/realtek/phy-rtk-usb3.c
index cce453686db2..77ce58f98302 100644
--- a/drivers/phy/realtek/phy-rtk-usb3.c
+++ b/drivers/phy/realtek/phy-rtk-usb3.c
@@ -14,6 +14,7 @@
 #include <linux/debugfs.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/regmap.h>
+#include <linux/string_choices.h>
 #include <linux/sys_soc.h>
 #include <linux/mfd/syscon.h>
 #include <linux/phy/phy.h>
@@ -363,13 +364,13 @@ static int rtk_usb3_parameter_show(struct seq_file *s, void *unused)
 
 	seq_puts(s, "Property:\n");
 	seq_printf(s, "  check_efuse: %s\n",
-		   phy_cfg->check_efuse ? "Enable" : "Disable");
+		   str_enable_disable(phy_cfg->check_efuse));
 	seq_printf(s, "  do_toggle: %s\n",
-		   phy_cfg->do_toggle ? "Enable" : "Disable");
+		   str_enable_disable(phy_cfg->do_toggle));
 	seq_printf(s, "  do_toggle_once: %s\n",
-		   phy_cfg->do_toggle_once ? "Enable" : "Disable");
+		   str_enable_disable(phy_cfg->do_toggle_once));
 	seq_printf(s, "  use_default_parameter: %s\n",
-		   phy_cfg->use_default_parameter ? "Enable" : "Disable");
+		   str_enable_disable(phy_cfg->use_default_parameter));
 
 	for (index = 0; index < rtk_phy->num_phy; index++) {
 		struct phy_reg *phy_reg;
diff --git a/drivers/phy/ti/phy-twl4030-usb.c b/drivers/phy/ti/phy-twl4030-usb.c
index 6f12b38cd894..4bf4c4f93b4c 100644
--- a/drivers/phy/ti/phy-twl4030-usb.c
+++ b/drivers/phy/ti/phy-twl4030-usb.c
@@ -26,6 +26,7 @@
 #include <linux/usb/ulpi.h>
 #include <linux/mfd/twl.h>
 #include <linux/regulator/consumer.h>
+#include <linux/string_choices.h>
 #include <linux/err.h>
 #include <linux/slab.h>
 
@@ -567,8 +568,7 @@ static ssize_t vbus_show(struct device *dev,
 	int ret = -EINVAL;
 
 	mutex_lock(&twl->lock);
-	ret = sprintf(buf, "%s\n",
-			twl->vbus_supplied ? "on" : "off");
+	ret = sprintf(buf, "%s\n", str_on_off(twl->vbus_supplied));
 	mutex_unlock(&twl->lock);
 
 	return ret;
diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
index 05a4a59f7c40..b96bdc39bcc7 100644
--- a/drivers/phy/xilinx/phy-zynqmp.c
+++ b/drivers/phy/xilinx/phy-zynqmp.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <dt-bindings/phy/phy.h>
 
@@ -865,7 +866,7 @@ static int xpsgtr_status_read(struct seq_file *seq, void *data)
 	seq_printf(seq, "Reference clock: %u (%pC)\n", gtr_phy->refclk, clk);
 	seq_printf(seq, "Reference rate:  %lu\n", clk_get_rate(clk));
 	seq_printf(seq, "PLL locked:      %s\n",
-		   pll_status & PLL_STATUS_LOCKED ? "yes" : "no");
+		   str_yes_no(pll_status & PLL_STATUS_LOCKED));
 
 	mutex_unlock(&gtr_phy->phy->mutex);
 	return 0;
-- 
2.43.0


