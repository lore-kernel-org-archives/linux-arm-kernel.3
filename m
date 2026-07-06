Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E79C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 23:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oNXd6QzSk+BXgrcPoXQNdH4mYIibz32g1jx98ECqKtY=; b=heqBFMr37xmkIBR+vrrMxgWSvO
	iyZ7QiMhqv+8XjnzhfLqbzqOst5qucVZB7aQbTtrYHm5RvXeqBD5AqBcTZ3pmEq1L1+cCrCwJPMqD
	Mzs7gw/MuGj2Orvu6rQ80Q5bb6lVJMEPyqsFvIVVxnhfS5ofoGFK35MAGWF7P3FOUaRiOhQDpkASq
	V0p2SWKDSoEFd78H2N/7N/CsrXc2lO41xcl+R2p9pHCoca4Ius2cgcA+64zG74hVAnLcry+voCpg6
	l7bL3rQD8E23WGq0MWDWVOPX2P76sh7wKGIk0o1J0Uh+xD9LM0uREM2lY5/jZZ80hTblhZ9Tl3ZDy
	5HvaylJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgsYU-0000000DmU1-1hnT;
	Mon, 06 Jul 2026 23:16:50 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgsYS-0000000DmSs-1Lgv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 23:16:49 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c89704da8c7so5736150a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 16:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783379806; x=1783984606; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oNXd6QzSk+BXgrcPoXQNdH4mYIibz32g1jx98ECqKtY=;
        b=PJSX/4qjgGimDMBKz69g6e4cu3thGecykTOuaUINoHmPGJwlVlnLlc9w74bY5cBevD
         Na9PHMzbX4TrxhcUhRNg4dWJHQ2yCU4+0pmJE7r73F6haVLNa09n0rR0z+TCKJBuUTWz
         zsObA1UGOKuYO37X77KImmWerhNfJpn8LVh4wm6/XOKMuks2eF6DiflWAQtHFSw5msIP
         kwHJwEXU4d4UWWt5dwiW1YOAYnpufPch9GtV51VMDt4jFuTrdMbUT79DpEmpXTA4rsgc
         s0QY1QDEe/GZMHY1C9Ijo32ioC0i3QHSWOLkjS1GgfWOO/E2nE74ljFKIIerbQ4e1VPo
         lFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783379806; x=1783984606;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oNXd6QzSk+BXgrcPoXQNdH4mYIibz32g1jx98ECqKtY=;
        b=fm4FT+1Tcb19RvBFv/qLUvktTNftKYYNbUYPH9Ybn/+gll7vE2KWwMdbhGXcNWp+5j
         yJYTmn+ug2hf0YvmA50K2Fkcwbe3/5ga4TIn1N982OLOe9onjR+4lvBlgUIQaDXdRG24
         ypBETHkMiWjUf8l7YTA5TFYtShkHH0PSvxDF4VzoEYDMYvLi+WzmaoOH7oxeXFjJ9UCG
         /yDrsro9ZjT97daR61rT+cSDtTz/nYRnAzBUfw1eCO85vb/NRgJxh8OtWjZYzOlZP2In
         f2VcbwTN9l2+VuXeY//hGkqTdnEL26QLXhAWfPewGVpcwymYjh9I39wzXiCMOeay7RW6
         vmQw==
X-Forwarded-Encrypted: i=1; AHgh+Rov6y4W+QiHZBQgwJfmq2gxfGY9tXDS1/qX0IsWasaOAYiLcGDKMNgYMKHZ2LQd1VuvMwZNRQBjoK6usY15AJq5@lists.infradead.org
X-Gm-Message-State: AOJu0YxiXsfkMBuR9rFoUd4ovLHTew5NW03YOG5frr/V8BFFtK7TvhLD
	n0xlVmoV5ug/Jveq2VhQh84wuX5NY94hlFQojt1KbkXQAwzF9QIa83wzQZ+LSKi3t2R1M/TZ2Z3
	at68U82YesGLKHAhvoA==
X-Received: from pgcv24.prod.google.com ([2002:a05:6a02:5318:b0:c9a:c533:8316])
 (user=rdbabiera job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:cf88:b0:3c0:9c19:6589 with SMTP id adf61e73a8af0-3c09c196d09mr246244637.67.1783379805627;
 Mon, 06 Jul 2026 16:16:45 -0700 (PDT)
Date: Mon,  6 Jul 2026 23:16:34 +0000
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=0B74D21BCA57BD40083A73A0DB00FC8CD80B20A1
X-Developer-Signature: v=1; a=openpgp-sha256; l=19558; i=rdbabiera@google.com;
 h=from:subject; bh=nnNmnAax+BpzPcWSzgE2L0OSmg45VP011immyS0iNaU=;
 b=owGbwMvMwCV2m+FPzw1uhYWMp9WSGLJ8zAO357HUPtzhH9A8+eeBzj6m8ttCR/h3Cvm9avuoe
 5rFeLtKRykLgxgXg6yYIgt3ySXpU+F7HTisihfAzGFlAhnCwMUpABORXMrI0JzZKyA6i/uxz/Nj
 5qLsUvlV3JOvMB/iXN4q//n/94C3AowMB2tmPXKblcrs8EI6t1yv3mp77bXJvAq9CcdvXVzy7Mg ePgA=
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706231633.700676-2-rdbabiera@google.com>
Subject: [PATCH v4] phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver
From: RD Babiera <rdbabiera@google.com>
To: vkoul@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, p.zabel@pengutronix.de, neil.armstrong@linaro.org
Cc: badhri@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_161648_388839_9F5757C3 
X-CRM114-Status: GOOD (  26.43  )
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

Add USB3 PHY support for the Google Tensor G5 USB PHY driver.
This patch adds functionality for the usb3_tca register, usb3 clock,
and usb3 reset as defined in google,lga-usb-phy.yaml. Kconfig now lists
USB SuperSpeed support.

Refactor the probe sequence to initialize the USB2 and USB3 PHYs, and then
initialize clocks and resets for both PHYs afterwards.

Refactor set_vbus_valid to reduce duplicated code.

Implement USB3 phy_ops for phy_init, phy_exit, and phy_power_on.
combo_phy_state enum is added to track PHY bringup state across
PHY API calls.

Signed-off-by: RD Babiera <rdbabiera@google.com>
---
Changes since v1:
* Removed mix of goto-based and scope-based cleanup from usb3 phy_init
* Removed unused usb3_core resource from probe
* Added combo_phy_state enum to interally track ComboPHY bringup state
  to allow google_usb_set_orientation() to change TCA orientation.
* Modify Kconfig documentation to reflect SuperSpeed support

Changes since v2:
* google_usb3_phy_init now sets USBDP_TOP_CFG_REG_PMGT_REF_CLK_REQ_N
  to false if phy_init fails elsewhere.
* google_usb3_phy_init errors are now handled via DEFINE_FREE structures.
  This affects set_pmgt_ref_clk_req_n, clk_bulk_prepare_enable, and
  reset_control_bulk_deassert.
* google_usb2_phy_init also handles undoing clk_bulk_prepare_enable via
  DEFINE_FREE structure.
* google_usb3_phy_power_on allows program_tca_locked in the
  COMBO_PHY_TCA_READY state. Waiting for PoR=>NC is only performed once.
* Note: there are checkpatch errors for the DEFINE_FREE macros resulting
  in "ERROR: trailing statements should be on next line". Other cases of
  DEFINE_FREE where the line limit would otherwise exceed 100 columns
  have the indentation done the same way.

Changes since v3:
* set_pmgt_ref_clk_req_n(false) in google_usb3_phy_exit() comes after
  reset assertion and clock disable to match phy_init() sequence.
* program_tca_locked in usb3 power_on() now requires a valid orientation
  to match google_usb_set_orientation requirements.
---
 drivers/phy/Kconfig          |   2 +-
 drivers/phy/phy-google-usb.c | 407 +++++++++++++++++++++++++++++++----
 2 files changed, 371 insertions(+), 38 deletions(-)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 19f3b7d12b7d..d2d401129af7 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -100,7 +100,7 @@ config PHY_GOOGLE_USB
 	  the G5 generation (Laguna). This driver provides the PHY interfaces
 	  to interact with the SNPS eUSB2 and USB 3.2/DisplayPort Combo PHY,
 	  both of which are integrated with the DWC3 USB DRD controller.
-	  This driver currently supports USB high-speed.
+	  This driver currently supports USB high-speed and SuperSpeed.
 
 config USB_LGM_PHY
 	tristate "INTEL Lightning Mountain USB PHY Driver"
diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.c
index ab20bc20f19e..19256588d50e 100644
--- a/drivers/phy/phy-google-usb.c
+++ b/drivers/phy/phy-google-usb.c
@@ -20,6 +20,7 @@
 #include <linux/reset.h>
 #include <linux/usb/typec_mux.h>
 
+/* USB_CFG_CSR */
 #define USBCS_USB2PHY_CFG19_OFFSET 0x0
 #define USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV GENMASK(19, 8)
 
@@ -28,11 +29,41 @@
 #define USBCS_USB2PHY_CFG21_REF_FREQ_SEL GENMASK(15, 13)
 #define USBCS_USB2PHY_CFG21_PHY_TX_DIG_BYPASS_SEL BIT(19)
 
+/* USBDP_TOP */
 #define USBCS_PHY_CFG1_OFFSET 0x28
+#define USBCS_PHY_CFG1_PHY0_MPLLA_SSC_EN BIT(1)
+#define USBCS_PHY_CFG1_PHY0_SRAM_BYPASS_MODE GENMASK(11, 10)
+#define SRAM_BYPASS_MODE_BYPASS_FIRMWARE BIT(0)
+#define SRAM_BYPASS_MODE_BYPASS_CONTEXT BIT(1)
 #define USBCS_PHY_CFG1_SYS_VBUSVALID BIT(17)
 
+#define USBDP_TOP_CFG_REG_OFFSET 0x44
+#define USBDP_TOP_CFG_REG_PMGT_REF_CLK_REQ_N BIT(0)
+
+#define PHY_POWER_CONFIG_REG1_OFFSET 0x48
+#define PHY_POWER_CONFIG_REG1_PG_MODE_EN BIT(1)
+#define PHY_POWER_CONFIG_REG1_UPCS_PIPE_CONFIG GENMASK(31, 14)
+#define UPCS_PIPE_CONFIG_ISO_CPM BIT(5)
+#define UPCS_PIPE_CONFIG_PG_MODE_STATIC BIT(6)
+#define UPCS_PIPE_CONFIG_LANE_RESET_NO_PG_EXIT BIT(9)
+
+/* USB3_TCA */
+#define TCA_INTR_STS_OFFSET 0x8
+#define TCA_INTR_STS_XA_ACT_EVT BIT(0)
+#define TCA_TCPC_OFFSET 0x14
+#define TCA_TCPC_MUX_CONTROL GENMASK(2, 0)
+#define TCA_TCPC_MUX_CONTROL_USB_ONLY 0x1
+#define TCA_TCPC_CONNECTOR_ORIENTATION BIT(3)
+#define TCA_TCPC_VALID BIT(4)
+#define TCA_PSTATE_0_OFFSET 0x50
+#define TCA_PSTATE_0_UPCS_LANE0_PHYSTATUS BIT(8)
+
+#define GPHY_TCA_DELAY_US 10
+#define GPHY_TCA_TIMEOUT_US 2500000
+
 enum google_usb_phy_id {
 	GOOGLE_USB2_PHY,
+	GOOGLE_USB3_PHY,
 	GOOGLE_USB_PHY_NUM,
 };
 
@@ -46,34 +77,172 @@ struct google_usb_phy_instance {
 	struct reset_control_bulk_data *rsts;
 };
 
+struct google_usb_phy_config {
+	const char * const *clk_names;
+	unsigned int num_clks;
+	const char * const *rst_names;
+	unsigned int num_rsts;
+};
+
+static const char * const u2phy_clk_names[] = {
+	"usb2",
+	"usb2_apb",
+};
+static const char * const u3phy_clk_names[] = {
+	"usb3"
+};
+static const char * const u2phy_rst_names[] = {
+	"usb2",
+	"usb2_apb",
+};
+static const char * const u3phy_rst_names[] = {
+	"usb3"
+};
+
+static const struct google_usb_phy_config phy_configs[GOOGLE_USB_PHY_NUM] = {
+	[GOOGLE_USB2_PHY] = {
+		.clk_names = u2phy_clk_names,
+		.num_clks = ARRAY_SIZE(u2phy_clk_names),
+		.rst_names = u2phy_rst_names,
+		.num_rsts = ARRAY_SIZE(u2phy_rst_names),
+	},
+	[GOOGLE_USB3_PHY] = {
+		.clk_names = u3phy_clk_names,
+		.num_clks = ARRAY_SIZE(u3phy_clk_names),
+		.rst_names = u3phy_rst_names,
+		.num_rsts = ARRAY_SIZE(u3phy_rst_names),
+	},
+};
+
+static inline void google_usb_phy_clk_disable(struct google_usb_phy_instance *inst)
+{
+	clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
+}
+DEFINE_FREE(inst_clk_disable, struct google_usb_phy_instance *,
+	    if (_T) google_usb_phy_clk_disable(_T))
+
+static inline void google_usb_phy_rst_disable(struct google_usb_phy_instance *inst)
+{
+	reset_control_bulk_assert(inst->num_rsts, inst->rsts);
+}
+DEFINE_FREE(inst_rst_disable, struct google_usb_phy_instance *,
+	    if (_T) google_usb_phy_rst_disable(_T))
+
+/*
+ * combo_phy_state
+ *	COMBO_PHY_IDLE: The ComboPHY has been torn down and USB3 has not completed
+ *			bringup
+ *	COMBO_PHY_INIT_DONE: The ComboPHY bringup sequence is complete.
+ *	COMBO_PHY_TCA_READY: The PoR => NC transition is complete, and the TCA can be
+ *			     moved into USB.
+ */
+enum combo_phy_state {
+	COMBO_PHY_IDLE,
+	COMBO_PHY_INIT_DONE,
+	COMBO_PHY_TCA_READY,
+};
+
 struct google_usb_phy {
 	struct device *dev;
 	struct regmap *usb_cfg_regmap;
 	unsigned int usb2_cfg_offset;
 	void __iomem *usbdp_top_base;
+	void __iomem *usb3_tca_base;
 	struct google_usb_phy_instance *insts;
 	/*
 	 * Protect phy registers from concurrent access, specifically via
-	 * google_usb_set_orientation callback.
+	 * google_usb_set_orientation callback. phy_mutex also protects
+	 * concurrent access to phy_state.
 	 */
 	struct mutex phy_mutex;
 	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
+	enum combo_phy_state phy_state;
 };
 
 static void set_vbus_valid(struct google_usb_phy *gphy)
 {
 	u32 reg;
 
-	if (gphy->orientation == TYPEC_ORIENTATION_NONE) {
-		reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+	reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+	if (gphy->orientation == TYPEC_ORIENTATION_NONE)
 		reg &= ~USBCS_PHY_CFG1_SYS_VBUSVALID;
-		writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
-	} else {
-		reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+	else
 		reg |= USBCS_PHY_CFG1_SYS_VBUSVALID;
-		writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
-	}
+	writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+}
+
+static void set_sram_bypass(struct google_usb_phy *gphy, u32 bypass)
+{
+	u32 reg;
+
+	reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+	reg &= ~USBCS_PHY_CFG1_PHY0_SRAM_BYPASS_MODE;
+	reg |= FIELD_PREP(USBCS_PHY_CFG1_PHY0_SRAM_BYPASS_MODE, bypass);
+	writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+}
+
+static void set_pmgt_ref_clk_req_n(struct google_usb_phy *gphy, bool resume)
+{
+	u32 reg;
+
+	reg = readl(gphy->usbdp_top_base + USBDP_TOP_CFG_REG_OFFSET);
+	if (resume)
+		reg |= USBDP_TOP_CFG_REG_PMGT_REF_CLK_REQ_N;
+	else
+		reg &= ~USBDP_TOP_CFG_REG_PMGT_REF_CLK_REQ_N;
+	writel(reg, gphy->usbdp_top_base + USBDP_TOP_CFG_REG_OFFSET);
+}
+
+static inline void disable_pmgt_ref_clk_req_n(struct google_usb_phy *gphy)
+{
+	set_pmgt_ref_clk_req_n(gphy, false);
+}
+DEFINE_FREE(pmgt_ref_clk_req_n, struct google_usb_phy *, if (_T) disable_pmgt_ref_clk_req_n(_T))
+
+static int wait_tca_xa_ack(struct google_usb_phy *gphy)
+{
+	int ret;
+	u32 reg;
+
+	ret = readl_poll_timeout(gphy->usb3_tca_base + TCA_INTR_STS_OFFSET,
+				 reg, !!(reg & TCA_INTR_STS_XA_ACT_EVT),
+				 GPHY_TCA_DELAY_US, GPHY_TCA_TIMEOUT_US);
+	if (ret)
+		dev_err(gphy->dev, "tca xa_ack timeout, ret=%d", ret);
+
+	return ret;
+}
+
+static int program_tca_locked(struct google_usb_phy *gphy)
+	   __must_hold(&gphy->phy_mutex)
+{
+	int ret;
+	u32 reg;
+
+	reg = readl(gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
+	writel(reg, gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
+
+	reg = readl(gphy->usb3_tca_base + TCA_TCPC_OFFSET);
+	reg &= ~TCA_TCPC_MUX_CONTROL;
+	reg |= FIELD_PREP(TCA_TCPC_MUX_CONTROL, TCA_TCPC_MUX_CONTROL_USB_ONLY);
+	if (gphy->orientation == TYPEC_ORIENTATION_REVERSE)
+		reg |= TCA_TCPC_CONNECTOR_ORIENTATION;
+	else
+		reg &= ~TCA_TCPC_CONNECTOR_ORIENTATION;
+	reg |= TCA_TCPC_VALID;
+	writel(reg, gphy->usb3_tca_base + TCA_TCPC_OFFSET);
+
+	ret = wait_tca_xa_ack(gphy);
+	dev_dbg(gphy->dev, "TCA switch %s, mux %lu, orientation %s",
+		ret ? "failed" : "success",
+		FIELD_GET(TCA_TCPC_MUX_CONTROL, reg),
+		FIELD_GET(TCA_TCPC_CONNECTOR_ORIENTATION, reg) ? "reverse" : "normal");
+
+	reg = readl(gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
+	writel(reg, gphy->usb3_tca_base + TCA_INTR_STS_OFFSET);
+
+	return ret;
 }
 
 static int google_usb_set_orientation(struct typec_switch_dev *sw,
@@ -92,6 +261,9 @@ static int google_usb_set_orientation(struct typec_switch_dev *sw,
 
 	set_vbus_valid(gphy);
 
+	if (gphy->phy_state == COMBO_PHY_TCA_READY && orientation != TYPEC_ORIENTATION_NONE)
+		return program_tca_locked(gphy);
+
 	return 0;
 }
 
@@ -122,17 +294,18 @@ static int google_usb2_phy_init(struct phy *_phy)
 	ret = clk_bulk_prepare_enable(inst->num_clks, inst->clks);
 	if (ret)
 		return ret;
+	struct google_usb_phy_instance *clk_dev __free(inst_clk_disable) = inst;
 
 	ret = reset_control_bulk_deassert(inst->num_rsts, inst->rsts);
-	if (ret) {
-		clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
+	if (ret)
 		return ret;
-	}
 
 	regmap_read(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, &reg);
 	reg |= USBCS_USB2PHY_CFG21_PHY_ENABLE;
 	regmap_write(gphy->usb_cfg_regmap, gphy->usb2_cfg_offset + USBCS_USB2PHY_CFG21_OFFSET, reg);
 
+	retain_and_null_ptr(clk_dev);
+
 	return 0;
 }
 
@@ -161,6 +334,119 @@ static const struct phy_ops google_usb2_phy_ops = {
 	.exit		= google_usb2_phy_exit,
 };
 
+static int google_usb3_phy_init(struct phy *_phy)
+{
+	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
+	struct google_usb_phy *gphy = inst->parent;
+	int ret = 0;
+	u32 reg;
+
+	dev_dbg(gphy->dev, "initializing usb3 phy\n");
+
+	guard(mutex)(&gphy->phy_mutex);
+
+	if (gphy->phy_state != COMBO_PHY_IDLE) {
+		dev_warn(gphy->dev, "usb3 phy init called when combo phy state is not idle");
+		return 0;
+	}
+
+	reg = readl(gphy->usbdp_top_base + PHY_POWER_CONFIG_REG1_OFFSET);
+	reg |= PHY_POWER_CONFIG_REG1_PG_MODE_EN;
+	reg &= ~PHY_POWER_CONFIG_REG1_UPCS_PIPE_CONFIG;
+	reg |= FIELD_PREP(PHY_POWER_CONFIG_REG1_UPCS_PIPE_CONFIG,
+			  (UPCS_PIPE_CONFIG_ISO_CPM |
+			   UPCS_PIPE_CONFIG_PG_MODE_STATIC |
+			   UPCS_PIPE_CONFIG_LANE_RESET_NO_PG_EXIT));
+	writel(reg, gphy->usbdp_top_base + PHY_POWER_CONFIG_REG1_OFFSET);
+
+	set_vbus_valid(gphy);
+
+	reg = readl(gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+	reg |= USBCS_PHY_CFG1_PHY0_MPLLA_SSC_EN;
+	writel(reg, gphy->usbdp_top_base + USBCS_PHY_CFG1_OFFSET);
+
+	set_sram_bypass(gphy, SRAM_BYPASS_MODE_BYPASS_FIRMWARE |
+			SRAM_BYPASS_MODE_BYPASS_CONTEXT);
+	set_pmgt_ref_clk_req_n(gphy, true);
+	struct google_usb_phy *pmgt_ref_clk_req_dev __free(pmgt_ref_clk_req_n) = gphy;
+
+	ret = clk_bulk_prepare_enable(inst->num_clks, inst->clks);
+	if (ret)
+		return ret;
+	struct google_usb_phy_instance *clk_dev __free(inst_clk_disable) = inst;
+
+	ret = reset_control_bulk_deassert(inst->num_rsts, inst->rsts);
+	if (ret)
+		return ret;
+	struct google_usb_phy_instance *rst_dev __free(inst_rst_disable) = inst;
+
+	ret = readl_poll_timeout(gphy->usb3_tca_base + TCA_PSTATE_0_OFFSET,
+				 reg, !(reg & TCA_PSTATE_0_UPCS_LANE0_PHYSTATUS),
+				 GPHY_TCA_DELAY_US, GPHY_TCA_TIMEOUT_US);
+	if (ret) {
+		dev_err(gphy->dev, "wait for lane0 phystatus timed out");
+		return ret;
+	}
+
+	gphy->phy_state = COMBO_PHY_INIT_DONE;
+
+	retain_and_null_ptr(rst_dev);
+	retain_and_null_ptr(clk_dev);
+	retain_and_null_ptr(pmgt_ref_clk_req_dev);
+
+	return 0;
+}
+
+static int google_usb3_phy_exit(struct phy *_phy)
+{
+	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
+	struct google_usb_phy *gphy = inst->parent;
+
+	dev_dbg(gphy->dev, "exiting usb3 phy\n");
+
+	guard(mutex)(&gphy->phy_mutex);
+
+	reset_control_bulk_assert(inst->num_rsts, inst->rsts);
+	clk_bulk_disable_unprepare(inst->num_clks, inst->clks);
+	set_pmgt_ref_clk_req_n(gphy, false);
+
+	gphy->phy_state = COMBO_PHY_IDLE;
+
+	return 0;
+}
+
+static int google_usb3_phy_power_on(struct phy *_phy)
+{
+	struct google_usb_phy_instance *inst = phy_get_drvdata(_phy);
+	struct google_usb_phy *gphy = inst->parent;
+	int ret;
+
+	dev_dbg(gphy->dev, "power on usb3 phy\n");
+
+	guard(mutex)(&gphy->phy_mutex);
+
+	if (gphy->phy_state != COMBO_PHY_TCA_READY) {
+		/* Wait for PoR -> NC transitions*/
+		ret = wait_tca_xa_ack(gphy);
+		if (ret) {
+			dev_err(gphy->dev, "PoR->NC transition timeout");
+			return ret;
+		}
+		gphy->phy_state = COMBO_PHY_TCA_READY;
+	}
+
+	if (gphy->orientation != TYPEC_ORIENTATION_NONE)
+		return program_tca_locked(gphy);
+
+	return 0;
+}
+
+static const struct phy_ops google_usb3_phy_ops = {
+	.init		= google_usb3_phy_init,
+	.exit		= google_usb3_phy_exit,
+	.power_on	= google_usb3_phy_power_on,
+};
+
 static struct phy *google_usb_phy_xlate(struct device *dev,
 					const struct of_phandle_args *args)
 {
@@ -173,14 +459,61 @@ static struct phy *google_usb_phy_xlate(struct device *dev,
 	return gphy->insts[args->args[0]].phy;
 }
 
+static int google_usb_phy_parse_clocks(struct google_usb_phy *gphy)
+{
+	struct device *dev = gphy->dev;
+	int id, i, ret;
+
+	for (id = 0; id < GOOGLE_USB_PHY_NUM; id++) {
+		const struct google_usb_phy_config *cfg = &phy_configs[id];
+		struct google_usb_phy_instance *inst = &gphy->insts[id];
+
+		inst->num_clks = cfg->num_clks;
+		inst->clks = devm_kcalloc(dev, inst->num_clks, sizeof(*inst->clks), GFP_KERNEL);
+		if (!inst->clks)
+			return -ENOMEM;
+
+		for (i = 0; i < inst->num_clks; i++)
+			inst->clks[i].id = cfg->clk_names[i];
+
+		ret = devm_clk_bulk_get(dev, inst->num_clks, inst->clks);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to get phy%d clks\n", id);
+	}
+
+	return 0;
+}
+
+static int google_usb_phy_parse_resets(struct google_usb_phy *gphy)
+{
+	struct device *dev = gphy->dev;
+	int id, i, ret;
+
+	for (id = 0; id < GOOGLE_USB_PHY_NUM; id++) {
+		const struct google_usb_phy_config *cfg = &phy_configs[id];
+		struct google_usb_phy_instance *inst = &gphy->insts[id];
+
+		inst->num_rsts = cfg->num_rsts;
+		inst->rsts = devm_kcalloc(dev, inst->num_rsts, sizeof(*inst->rsts), GFP_KERNEL);
+		if (!inst->rsts)
+			return -ENOMEM;
+
+		for (i = 0; i < inst->num_rsts; i++)
+			inst->rsts[i].id = cfg->rst_names[i];
+		ret = devm_reset_control_bulk_get_exclusive(dev, inst->num_rsts, inst->rsts);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to get phy%d resets\n", id);
+	}
+
+	return 0;
+}
+
 static int google_usb_phy_probe(struct platform_device *pdev)
 {
 	struct typec_switch_desc sw_desc = { };
-	struct google_usb_phy_instance *inst;
 	struct phy_provider *phy_provider;
 	struct device *dev = &pdev->dev;
 	struct google_usb_phy *gphy;
-	struct phy *phy;
 	u32 args[1];
 	int ret;
 
@@ -212,39 +545,39 @@ static int google_usb_phy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(gphy->usbdp_top_base),
 				    "invalid usbdp top\n");
 
+	gphy->usb3_tca_base = devm_platform_ioremap_resource_byname(pdev,
+								    "usb3_tca");
+	if (IS_ERR(gphy->usb3_tca_base))
+		return dev_err_probe(dev, PTR_ERR(gphy->usb3_tca_base),
+				    "invalid usb3 tca\n");
+
 	gphy->insts = devm_kcalloc(dev, GOOGLE_USB_PHY_NUM, sizeof(*gphy->insts), GFP_KERNEL);
 	if (!gphy->insts)
 		return -ENOMEM;
 
-	inst = &gphy->insts[GOOGLE_USB2_PHY];
-	inst->parent = gphy;
-	inst->index = GOOGLE_USB2_PHY;
-	phy = devm_phy_create(dev, NULL, &google_usb2_phy_ops);
-	if (IS_ERR(phy))
-		return dev_err_probe(dev, PTR_ERR(phy),
+	gphy->insts[GOOGLE_USB2_PHY].phy = devm_phy_create(dev, NULL, &google_usb2_phy_ops);
+	gphy->insts[GOOGLE_USB2_PHY].index = GOOGLE_USB2_PHY;
+	gphy->insts[GOOGLE_USB2_PHY].parent = gphy;
+	if (IS_ERR(gphy->insts[GOOGLE_USB2_PHY].phy))
+		return dev_err_probe(dev, PTR_ERR(gphy->insts[GOOGLE_USB2_PHY].phy),
 				     "failed to create usb2 phy instance\n");
-	inst->phy = phy;
-	phy_set_drvdata(phy, inst);
+	phy_set_drvdata(gphy->insts[GOOGLE_USB2_PHY].phy, &gphy->insts[GOOGLE_USB2_PHY]);
 
-	inst->num_clks = 2;
-	inst->clks = devm_kcalloc(dev, inst->num_clks, sizeof(*inst->clks), GFP_KERNEL);
-	if (!inst->clks)
-		return -ENOMEM;
-	inst->clks[0].id = "usb2";
-	inst->clks[1].id = "usb2_apb";
-	ret = devm_clk_bulk_get(dev, inst->num_clks, inst->clks);
+	gphy->insts[GOOGLE_USB3_PHY].phy = devm_phy_create(dev, NULL, &google_usb3_phy_ops);
+	gphy->insts[GOOGLE_USB3_PHY].index = GOOGLE_USB3_PHY;
+	gphy->insts[GOOGLE_USB3_PHY].parent = gphy;
+	if (IS_ERR(gphy->insts[GOOGLE_USB3_PHY].phy))
+		return dev_err_probe(dev, PTR_ERR(gphy->insts[GOOGLE_USB3_PHY].phy),
+				     "failed to create usb3 phy instance\n");
+	phy_set_drvdata(gphy->insts[GOOGLE_USB3_PHY].phy, &gphy->insts[GOOGLE_USB3_PHY]);
+
+	ret = google_usb_phy_parse_clocks(gphy);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to get u2 phy clks\n");
+		return ret;
 
-	inst->num_rsts = 2;
-	inst->rsts = devm_kcalloc(dev, inst->num_rsts, sizeof(*inst->rsts), GFP_KERNEL);
-	if (!inst->rsts)
-		return -ENOMEM;
-	inst->rsts[0].id = "usb2";
-	inst->rsts[1].id = "usb2_apb";
-	ret = devm_reset_control_bulk_get_exclusive(dev, inst->num_rsts, inst->rsts);
+	ret = google_usb_phy_parse_resets(gphy);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to get u2 phy resets\n");
+		return ret;
 
 	phy_provider = devm_of_phy_provider_register(dev, google_usb_phy_xlate);
 	if (IS_ERR(phy_provider))

base-commit: 2ace2e949979b82f82f12dd76d7c5a6145246ca3
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


