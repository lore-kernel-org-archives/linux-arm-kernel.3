Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87529C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 06:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WsD2e1QJlzgvmLmP48lO1+C+ll7gzL5r8DZrODbhezA=; b=gb8tO7JKgk8166MrWIph5eUEF3
	pF9v0Zs7iWFdrOeK14lSFTrJFBkIMKyrLZZdF8PIM5uSjStgxIqGPwSOvzc1LdpbZ2Hcz9oOdKm7b
	/nGChX6pzspif8rIMtxckldGXJxT2FuiSTX6ug/pcyRjTprKzbQV9L69vkrBjQ8KyPGPxbAlFuLMQ
	s+W32k95cCVfy+3CyE6ho4FrbA8rMvQjs8J9V8lHy12f8UCVQ5yJdJVdccft1/scc5GbBdJJtWlcB
	Vhu6Q9+WmeYO8kZIcR9lZ+CGz8+BzRbVn+ttBnOTpvEcjnWVn0+LxZR3GkbMKkOVCZmDZkK+ptO4S
	kwK9D32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue6F2-00000001P8h-1XJq;
	Tue, 22 Jul 2025 06:12:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue6CH-00000001OsG-3JMJ;
	Tue, 22 Jul 2025 06:09:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3A3D43B46;
	Tue, 22 Jul 2025 06:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 925C9C4CEEB;
	Tue, 22 Jul 2025 06:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753164592;
	bh=XGAIAHIZBmEv3evmUan1R6uHqDA6sAxZQIqw2i8fDaA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sw6ZZbDDsaqqUR/58lb3a9ol4DENQAwYBUNWbg9gkVvzrfsI+u5yyPkjDxSb1HStn
	 JvMFo/qsdJlfv+5tw12PNlzG8qvI+LW0dE1oet2xlL8eB/mq2WYV2qV3CyWC8CRm2o
	 3nOCOWx3Xo7LjaC9sVkwhOKH1IjfvHJ/w6z9L7F00bgHrk4YT/kTv0cmMDrPCZWz4S
	 9yeUU7gf2V3FoLhTvP7mtbF8UK16PUnkEyFI3IYEOznog+Yjaq68UVQeYkciO6IofN
	 eqp8KD+5s7MicXNgnYt2qRSpTX2oaapC9t1MB6xADwUgtQfUKmZOj08iVyNYeAf3vt
	 vNDX1OS71VihQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E664C83F25;
	Tue, 22 Jul 2025 06:09:52 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 22 Jul 2025 14:06:58 +0800
Subject: [PATCH v2] soc: amlogic: clk-measure: Optimize measurement
 accuracy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250722-optimize_clk-measure_accuracy-v2-1-cb121fd57e6d@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAIEqf2gC/4XNQQ6CMBCF4auQrq2hLVB15T0MIXU6wkRKSQtEJ
 NxdxAO4/N/iewuLGAgjuyQLCzhRJN9tIQ8Jg8Z0NXKyWzOZyjzNpeK+H8jRGyton9yhiWPAygC
 MwcDMzygKRJUV1kq2GX3AB712/1Zu3VAcfJj3u0l815+shf4jT4ILru4naTWA1Zm6Gtf6muAI3
 rFyXdcPHuTCBMwAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753164591; l=5869;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=oQhUGoSZxIi1keYigrFF8wPRjrcx7Jaid/BmEwKEBDI=;
 b=bpOdsOdMACbofeQdme94D/tMNvgjUoxblptycdgowPS4uvd+6e1Q/u5IQ9xiLpOl2r7MsinL4
 trf8cV7rEWnDBlVa18F4KqZXXj0gV+MqS9yJu1AYIUQzZI8RERXJcDz
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_230953_879921_EA7887D0 
X-CRM114-Status: GOOD (  12.73  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

The cycle count register has a 20-bit effective width, but the driver
only utilizes 16 bits. This reduces the sampling window when measuring
high-frequency clocks, resulting in (slightly) degraded measurement
accuracy.

The input clock signal path from gate (Controlled by MSR_RUN) to internal
sampling circuit in clk-measure has a propagation delay requirement: 24
clock cycles must elapse after mux selection before sampling.

The measurement circuit employs single-edge sampling for clock frequency
detection, resulting in a ±1 cycle count error within the measurement window.

+1 cycle: 3 rising edges captured in 2-cycle measurement window.
    __    __    __
 __↑  |__↑  |__↑  |__
  ^             ^

-1 cycle: 2 rising edges captured in 3-cycle measurement window.
    __    __    __
 __↑  |__↑  |__↑  |__↑
    ^               ^

Change-Id: If367c013fe2a8d0c8f5f06888bb8f30a1e46b927
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Improve measurement accuracy by increasing the bit width of the cycle
counter register and adding delay during measurement.

The 800μs delay between enabling the input clock gate and activating
sampling is determined by the minimum sampling frequency of 30kHz (the
lowest commonly used frequency in applications is 32.768kHz).

Here are the test comparisons based on C3:

Pre-optimization:
cat /sys/kernel/debug/meson-clk-msr/measure_summary 
  clock                     rate    precision
---------------------------------------------
 sys_clk               166664063    +/-5208Hz
 axi_clk               499968750    +/-15625Hz
 rtc_clk                23982813    +/-3125Hz
 p20_usb2_ckout        479968750    +/-15625Hz
 eth_mpll_test         499992188    +/-15625Hz
 sys_pll              1919875000    +/-62500Hz
 cpu_clk_div16         119998162    +/-3676Hz
 ts_pll                        0    +/-3125Hz
 fclk_div2             999843750    +/-31250Hz
 fclk_div2p5           799953125    +/-31250Hz
 fclk_div3             666625000    +/-20833Hz
 fclk_div4             499914063    +/-15625Hz
 fclk_div5             399987500    +/-12500Hz
 fclk_div7             285709821    +/-8928Hz
 fclk_50m               49982813    +/-3125Hz
 sys_oscin32k_i            26563    +/-3125Hz

Post-optimization:
cat /sys/kernel/debug/meson-clk-msr/measure_summary 
  clock                     rate    precision
---------------------------------------------
 sys_clk               166665625    +/-1562Hz
 axi_clk               499996875    +/-1562Hz
 rtc_clk                24000000    +/-1562Hz
 p20_usb2_ckout        479996875    +/-1562Hz
 eth_mpll_test         499996875    +/-1562Hz
 sys_pll              1919987132    +/-1838Hz
 cpu_clk_div16         119998438    +/-1562Hz
 ts_pll                        0    +/-1562Hz
 fclk_div2             999993750    +/-1562Hz
 fclk_div2p5           799995313    +/-1562Hz
 fclk_div3             666656250    +/-1562Hz
 fclk_div4             499996875    +/-1562Hz
 fclk_div5             399993750    +/-1562Hz
 fclk_div7             285712500    +/-1562Hz
 fclk_50m               49998438    +/-1562Hz
 sys_oscin32k_i            32813    +/-1562Hz
---
Changes in v2:
- Change "HACK" in comments to "NOTE" according to Martin's suggestion.
- Link to v1: https://lore.kernel.org/r/20250717-optimize_clk-measure_accuracy-v1-1-3b82d7ccd743@amlogic.com
---
 drivers/soc/amlogic/meson-clk-measure.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index d862e30a244e..df395e015f26 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -22,7 +22,7 @@ static DEFINE_MUTEX(measure_lock);
 #define MSR_CLK_SRC		GENMASK(26, 20)
 #define MSR_BUSY		BIT(31)
 
-#define MSR_VAL_MASK		GENMASK(15, 0)
+#define MSR_VAL_MASK		GENMASK(19, 0)
 
 #define DIV_MIN			32
 #define DIV_STEP		32
@@ -805,14 +805,23 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 	regmap_update_bits(priv->regmap, reg->freq_ctrl, MSR_DURATION,
 			   FIELD_PREP(MSR_DURATION, duration - 1));
 
-	/* Set ID */
-	regmap_update_bits(priv->regmap, reg->freq_ctrl, MSR_CLK_SRC,
-			   FIELD_PREP(MSR_CLK_SRC, clk_msr_id->id));
+	/* Set the clock channel ID and enable the input clock gate. */
+	regmap_update_bits(priv->regmap, reg->freq_ctrl, MSR_CLK_SRC | MSR_RUN,
+			   FIELD_PREP(MSR_CLK_SRC, clk_msr_id->id) | MSR_RUN);
 
-	/* Enable & Start */
-	regmap_update_bits(priv->regmap, reg->freq_ctrl,
-			   MSR_RUN | MSR_ENABLE,
-			   MSR_RUN | MSR_ENABLE);
+	/*
+	 * NOTE: The input clock signal path from gate (Controlled by MSR_RUN)
+	 * to internal sampling circuit in clk-measure has a propagation delay
+	 * requirement: 24 clock cycles must elapse after mux selection before
+	 * sampling.
+	 *
+	 * For a 30kHz measurement clock, this translates to an 800μs delay:
+	 * 800us = 24 / 30000Hz.
+	 */
+	fsleep(800);
+
+	/* Enable the internal sampling circuit and start clock measurement. */
+	regmap_update_bits(priv->regmap, reg->freq_ctrl, MSR_ENABLE, MSR_ENABLE);
 
 	ret = regmap_read_poll_timeout(priv->regmap, reg->freq_ctrl,
 				       val, !(val & MSR_BUSY), 10, 10000);
@@ -846,7 +855,7 @@ static int meson_measure_best_id(struct meson_msr_id *clk_msr_id,
 	do {
 		ret = meson_measure_id(clk_msr_id, duration);
 		if (ret >= 0)
-			*precision = (2 * 1000000) / duration;
+			*precision = 1000000 / duration;
 		else
 			duration -= DIV_STEP;
 	} while (duration >= DIV_MIN && ret == -EINVAL);

---
base-commit: 58abdca0eb653c1a2e755ba9ba406ee475d87636
change-id: 20250523-optimize_clk-measure_accuracy-9e16ee346dd2

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



