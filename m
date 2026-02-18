Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EA5E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 20:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgtQYzUApyiQz10T+cRb0FtV8nPLoTQ14FL2GFbOzVA=; b=BepyT8J1wSohVd7aS9xnX5kWFZ
	IzO0RWpWnIzvX1lkHFwcbXtVy0fEe+6wn2sju0qZL6OBzaqmvAlgxmSHH3AaGg6vopqH+n+U8uK8O
	BZB4dbFqmmarxqPFjtrWnyolxNdM1PG4/EOzPRTfHkFRlnDgHT528nwamedxXncZELqAJ2OCorT7O
	NkUBpBun4zq2ZsZLLkYqsDJM65guWp4A5zVxwzG8leIz5lflQ3A+kjVdpcrBoeWC8Gq0RUm8/kBtx
	i4+QLaj+7qVKQAOmsDj4KJY2+D/8iR2f0ZJJ5MWLnmP6X/Is/+d2VKg/tOpiw/Kk6o1sVBc4pkii0
	43lc97BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsoQz-0000000AOao-17UN;
	Wed, 18 Feb 2026 20:46:09 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsoQv-0000000AOZm-0MUv;
	Wed, 18 Feb 2026 20:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sgtQYzUApyiQz10T+cRb0FtV8nPLoTQ14FL2GFbOzVA=; b=rwDoe2YzEogG3q5VbAAnz2K9FW
	WkyQwHzqTTkxbZ7/fKJ3r+GNGrcS8PaytSJr8KuPFUEi9t3FfQKka2ocYyPTj9l9k7swIKnz7AvrO
	a5ae8yeqFqLte5IiiumNNUAkWs2ToYTIiNxWE2YDThq6Qi2GSXuGPz+EMwL7uVXcOh1I/T1LaVrMo
	vpX2dq2muAfl3HyDweAmFy4ik+knL+dcW+h52e4+Eanc2GcJQvVKv1FuFfOpsDvm/m2GxNAgpc1ex
	2V/oE40vHFfeSns0JSNPCIJ5uyTCElWisKwBX28vXCVP11kiUfadNrW3Et2OlUnribZG0UoBvuZPV
	zhCFWCRw==;
Received: from [187.36.210.68] (helo=1.0.0.127.in-addr.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vsoQo-002Czn-Vb; Wed, 18 Feb 2026 21:45:59 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Wed, 18 Feb 2026 17:44:59 -0300
Subject: [PATCH v6 1/6] clk: bcm: rpi: Manage clock rate in
 prepare/unprepare callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260218-v3d-power-management-v6-1-40683fd39865@igalia.com>
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
In-Reply-To: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5144; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=IA1YBUMs/iIQl36lh0k9HyH0QwFi5qeoZtBc3SU2miA=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpliT45j6LIUMOG+Wd1sW9pNM7ypsiQP42M1KoQ
 PxsTOYMkeeJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaZYk+AAKCRA/8w6Kdoj6
 qln2CADfJXhF/h7MuQ2xD10xBv8GfzdHfEnRl6FxgRsgPtMiecFZb/cjQy70YeYu8XgQ8t1spQx
 v2OkKQ13gMqOfbOS5VD+YeYefy1/Nd+osgTOzRtGYjAzratxfBFiRDjiJaH+4DYyi32fFW6wfm0
 LPpqDjgufQBVNNL4bVVIZAHBkHLm7rYcCbnVzKUNLupKKuEHopcnilx7CzS9ctel6eMzNEyaTx4
 eBOYIjzA68YndHWpR7C68vbMailgLTlMkixngrIzwo6QN1tddgEdDQjisjMbQYo3f+hnBIPjjM2
 PMQey2m6/lkieZvM6nMC8xb5Q2/ve1sbIR6wL0K4NV9Ax3yI
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_124605_589890_7D3AC820 
X-CRM114-Status: GOOD (  14.91  )
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

On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
actually power off the clock. To achieve meaningful power savings, the
clock rate must be set to the minimum before disabling. This might be
fixed in future firmware releases.

Rather than pushing rate management to clock consumers, handle it
directly in the clock framework's prepare/unprepare callbacks. In
unprepare, set the rate to the firmware-reported minimum before
disabling the clock. In prepare, for clocks marked with `maximize`
(currently v3d), restore the rate to the maximum after enabling.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 61 ++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 1a9162f0ae31e330c46f6eafdd00350599b0eede..0d6e4f43c3bac0e7b38934c5c6e4db51211233de 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -66,7 +66,8 @@ const struct raspberrypi_clk_data *clk_hw_to_data(const struct clk_hw *hw)
 struct raspberrypi_clk_variant {
 	bool		export;
 	char		*clkdev;
-	unsigned long	min_rate;
+	u32		min_rate;
+	u32		max_rate;
 	bool		minimize;
 	bool		maximize;
 	u32		flags;
@@ -289,16 +290,22 @@ static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
 static int raspberrypi_fw_prepare(struct clk_hw *hw)
 {
 	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
+	struct raspberrypi_clk_variant *variant = data->variant;
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 state = RPI_FIRMWARE_STATE_ENABLE_BIT;
 	int ret;
 
 	ret = raspberrypi_clock_property(rpi->firmware, data,
 					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
-	if (ret)
+	if (ret) {
 		dev_err_ratelimited(rpi->dev,
 				    "Failed to set clock %s state to on: %d\n",
 				    clk_hw_get_name(hw), ret);
+		return ret;
+	}
+
+	if (variant->maximize)
+		ret = raspberrypi_fw_set_rate(hw, variant->max_rate, 0);
 
 	return ret;
 }
@@ -306,10 +313,19 @@ static int raspberrypi_fw_prepare(struct clk_hw *hw)
 static void raspberrypi_fw_unprepare(struct clk_hw *hw)
 {
 	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
+	struct raspberrypi_clk_variant *variant = data->variant;
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 state = 0;
 	int ret;
 
+	/*
+	 * On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
+	 * actually power off the clock. To achieve meaningful power consumption
+	 * reduction, the driver needs to set the clock rate to minimum before
+	 * disabling it.
+	 */
+	raspberrypi_fw_set_rate(hw, variant->min_rate, 0);
+
 	ret = raspberrypi_clock_property(rpi->firmware, data,
 					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
 	if (ret)
@@ -334,7 +350,7 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 {
 	struct raspberrypi_clk_data *data;
 	struct clk_init_data init = {};
-	u32 min_rate, max_rate;
+	unsigned long rate;
 	int ret;
 
 	data = devm_kzalloc(rpi->dev, sizeof(*data), GFP_KERNEL);
@@ -354,18 +370,20 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 
 	data->hw.init = &init;
 
-	ret = raspberrypi_clock_property(rpi->firmware, data,
-					 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
-					 &min_rate);
-	if (ret) {
-		dev_err(rpi->dev, "Failed to get clock %d min freq: %d\n",
-			id, ret);
-		return ERR_PTR(ret);
+	if (!variant->min_rate) {
+		ret = raspberrypi_clock_property(rpi->firmware, data,
+						 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
+						 &variant->min_rate);
+		if (ret) {
+			dev_err(rpi->dev, "Failed to get clock %d min freq: %d\n",
+				id, ret);
+			return ERR_PTR(ret);
+		}
 	}
 
 	ret = raspberrypi_clock_property(rpi->firmware, data,
 					 RPI_FIRMWARE_GET_MAX_CLOCK_RATE,
-					 &max_rate);
+					 &variant->max_rate);
 	if (ret) {
 		dev_err(rpi->dev, "Failed to get clock %d max freq: %d\n",
 			id, ret);
@@ -376,7 +394,7 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 	if (ret)
 		return ERR_PTR(ret);
 
-	clk_hw_set_rate_range(&data->hw, min_rate, max_rate);
+	clk_hw_set_rate_range(&data->hw, variant->min_rate, variant->max_rate);
 
 	if (variant->clkdev) {
 		ret = devm_clk_hw_register_clkdev(rpi->dev, &data->hw,
@@ -387,20 +405,11 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 		}
 	}
 
-	if (variant->maximize)
-		variant->min_rate = max_rate;
-
-	if (variant->min_rate) {
-		unsigned long rate;
-
-		clk_hw_set_rate_range(&data->hw, variant->min_rate, max_rate);
-
-		rate = raspberrypi_fw_get_rate(&data->hw, 0);
-		if (rate < variant->min_rate) {
-			ret = raspberrypi_fw_set_rate(&data->hw, variant->min_rate, 0);
-			if (ret)
-				return ERR_PTR(ret);
-		}
+	rate = raspberrypi_fw_get_rate(&data->hw, 0);
+	if (rate < variant->min_rate) {
+		ret = raspberrypi_fw_set_rate(&data->hw, variant->min_rate, 0);
+		if (ret)
+			return ERR_PTR(ret);
 	}
 
 	return &data->hw;

-- 
2.52.0


