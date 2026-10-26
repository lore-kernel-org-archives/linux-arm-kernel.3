Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BDF606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 14:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lDNRgqi5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fj8cRFNdTuS88avz+KuVmikpDiQtONWEEH1nURlLM7Q=; b=lDNRgqi5np/wgt
	xuaCv6tyfvYJO/3lgcRogO5Yf7lir3UrT2X/lHzn6KlzwsuReuPYPhyyKU8znsrbtwIldQ+eAwyJM
	3qLGPLXbxrScvhQ/9FDcDk8x+JFOpfcbdZGaRzz77E0FOV1nwj9YVuHfnhsTOxFDIoZyMQLLak8Df
	rqheBBLvYQ7qeErQf1Gd9XQ9Zgp+enw+CutL/5+idJpufOEWNBAOkfr2/79VQzHfUPAd3zfCP+wQD
	MPyyMqIvNoNf1rp4sSsaqGsaMaO/yuWuE8gDfAmYe/bR1b0hQEpVt9yqFy5mQjLTYE59Pvx75HoLE
	V6MIW/4tsqNxkLySI6Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM7I-00000002iIc-0PRs;
	Mon, 26 Oct 2026 14:56:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM79-00000002iFa-49O7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 14:55:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BAE3443ECC;
	Mon, 26 Oct 2026 14:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32871F01828;
	Mon, 26 Oct 2026 14:55:51 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 05/11] pwm: rcar: Parametrize cycle counter field size
Date: Mon, 26 Oct 2026 15:55:21 +0100
Message-ID: <a11daddd0c005d9bdf2b36e3b8b93720f1da4f55.1793026273.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793026273.git.geert+renesas@glider.be>
References: <cover.1793026273.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Prepare for the advent of PWM blocks with output cycle and high-level
period fields larger than 10 bits by parametrizing the field size.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pwm/pwm-rcar.c | 51 +++++++++++++++++++++++++++---------------
 1 file changed, 33 insertions(+), 18 deletions(-)

diff --git a/drivers/pwm/pwm-rcar.c b/drivers/pwm/pwm-rcar.c
index f1f68bfe016f729f..3813094c601efc8c 100644
--- a/drivers/pwm/pwm-rcar.c
+++ b/drivers/pwm/pwm-rcar.c
@@ -22,7 +22,7 @@
 #include <linux/slab.h>
 
 #define RCAR_PWM_MAX_DIVISION	24
-#define RCAR_PWM_MAX_CYCLE	1023
+#define RCAR_PWM_MAX_CYCLE(rp)	GENMASK(rp->cycle_bits - 1, 0)
 
 #define RCAR_PWMCR		0x00
 #define  RCAR_PWMCR_CC0_MASK	GENMASK(19, 16)
@@ -32,14 +32,17 @@
 #define  RCAR_PWMCR_EN0		BIT(0)
 
 #define RCAR_PWMCNT		0x04
-#define  RCAR_PWMCNT_CYC0_MASK	0x03ff0000
-#define  RCAR_PWMCNT_CYC0_SHIFT	16
-#define  RCAR_PWMCNT_PH0_MASK	0x000003ff
-#define  RCAR_PWMCNT_PH0_SHIFT	0
+#define  RCAR_PWMCNT_CYC0_MASK	GENMASK(31, 16)
+#define  RCAR_PWMCNT_PH0_MASK	GENMASK(15, 0)
 
 struct rcar_pwm_chip {
 	void __iomem *base;
 	struct clk *clk;
+	unsigned int cycle_bits;
+};
+
+struct rcar_pwm_info {
+	unsigned int cycle_bits;
 };
 
 static inline struct rcar_pwm_chip *to_rcar_pwm_chip(struct pwm_chip *chip)
@@ -77,7 +80,7 @@ static int rcar_pwm_get_clock_division(struct rcar_pwm_chip *rp, int period_ns)
 	if (clk_rate == 0)
 		return -EINVAL;
 
-	div = (u64)NSEC_PER_SEC * RCAR_PWM_MAX_CYCLE;
+	div = mul_u32_u32(NSEC_PER_SEC, RCAR_PWM_MAX_CYCLE(rp));
 	tmp = (u64)period_ns * clk_rate + div - 1;
 	tmp = div64_u64(tmp, div);
 	div = ilog2(tmp - 1) + 1;
@@ -111,21 +114,19 @@ static int rcar_pwm_set_counter(struct rcar_pwm_chip *rp, int div, u64 duty_ns,
 
 	/* div <= 24 == RCAR_PWM_MAX_DIVISION, so the shift doesn't overflow. */
 	tmp = mul_u64_u64_div_u64(period_ns, clk_rate, (u64)NSEC_PER_SEC << div);
-	if (tmp > FIELD_MAX(RCAR_PWMCNT_CYC0_MASK))
-		tmp = FIELD_MAX(RCAR_PWMCNT_CYC0_MASK);
-
-	cyc = FIELD_PREP(RCAR_PWMCNT_CYC0_MASK, tmp);
+	cyc = min(tmp, RCAR_PWM_MAX_CYCLE(rp));
 
 	tmp = mul_u64_u64_div_u64(duty_ns, clk_rate, (u64)NSEC_PER_SEC << div);
-	if (tmp > FIELD_MAX(RCAR_PWMCNT_PH0_MASK))
-		tmp = FIELD_MAX(RCAR_PWMCNT_PH0_MASK);
-	ph = FIELD_PREP(RCAR_PWMCNT_PH0_MASK, tmp);
+	ph = min(tmp, RCAR_PWM_MAX_CYCLE(rp));
 
 	/* Avoid prohibited setting */
 	if (cyc == 0 || ph == 0)
 		return -EINVAL;
 
-	rcar_pwm_write(rp, cyc | ph, RCAR_PWMCNT);
+	rcar_pwm_write(rp,
+		       FIELD_PREP(RCAR_PWMCNT_CYC0_MASK, cyc) |
+		       FIELD_PREP(RCAR_PWMCNT_PH0_MASK, ph),
+		       RCAR_PWMCNT);
 
 	return 0;
 }
@@ -142,12 +143,15 @@ static void rcar_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
 
 static int rcar_pwm_enable(struct rcar_pwm_chip *rp)
 {
-	u32 value;
+	u32 value, cyc, ph;
 
 	/* Don't enable the PWM device if CYC0 or PH0 is 0 */
 	value = rcar_pwm_read(rp, RCAR_PWMCNT);
-	if ((value & RCAR_PWMCNT_CYC0_MASK) == 0 ||
-	    (value & RCAR_PWMCNT_PH0_MASK) == 0)
+	cyc = FIELD_GET(RCAR_PWMCNT_CYC0_MASK, value);
+	ph = FIELD_GET(RCAR_PWMCNT_PH0_MASK, value);
+
+	if ((cyc & RCAR_PWM_MAX_CYCLE(rp)) == 0 ||
+	    (ph & RCAR_PWM_MAX_CYCLE(rp)) == 0)
 		return -EINVAL;
 
 	rcar_pwm_update(rp, RCAR_PWMCR_EN0, RCAR_PWMCR_EN0, RCAR_PWMCR);
@@ -202,11 +206,16 @@ static const struct pwm_ops rcar_pwm_ops = {
 
 static int rcar_pwm_probe(struct platform_device *pdev)
 {
+	const struct rcar_pwm_info *info;
 	struct device *dev = &pdev->dev;
 	struct rcar_pwm_chip *rcar_pwm;
 	struct pwm_chip *chip;
 	int ret;
 
+	info = of_device_get_match_data(dev);
+	if (!info)
+		return -ENODEV;
+
 	chip = devm_pwmchip_alloc(dev, 1, sizeof(*rcar_pwm));
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
@@ -222,6 +231,8 @@ static int rcar_pwm_probe(struct platform_device *pdev)
 		return PTR_ERR(rcar_pwm->clk);
 	}
 
+	rcar_pwm->cycle_bits = info->cycle_bits;
+
 	chip->ops = &rcar_pwm_ops;
 
 	platform_set_drvdata(pdev, chip);
@@ -247,8 +258,12 @@ static void rcar_pwm_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+static const struct rcar_pwm_info rcar_pwm_info = {
+	.cycle_bits = 10,
+};
+
 static const struct of_device_id rcar_pwm_of_table[] = {
-	{ .compatible = "renesas,pwm-rcar" },
+	{ .compatible = "renesas,pwm-rcar", .data = &rcar_pwm_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rcar_pwm_of_table);
-- 
2.43.0


