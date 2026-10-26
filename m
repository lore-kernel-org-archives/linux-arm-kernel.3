Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AF3606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JQQLYKCS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Dnm/tcUJmHvrsoD+AO8fIj+Ywcx6TXnaqfDc8lUuFK0=; b=JQQLYKCScnj7Ya
	6CMQ2JMp008/aziVyxi1gvhhw5Yhd7EZH2vIV2L+gbln0cd3/BQmmxtPQhGIdZOS+4pfwFjHSE/Vw
	DrleEkO/XtQwgANJsyqja9v2jrT7vdBWEhc8tfz6oHPKBNmhzaT7lmgIrxp9erXeUvB7//94wkdUK
	wHaMeeYR828rQhwGJNit0YcCCoCs3CDE41KTg3+HT7U3G0jF8O7illI8A5cI8EXvuGIdHoLhNlxHR
	JE1hjdrJ8t07JmHLFlMDyZbTcODfSGDZHyWel6rzjCTrneyWKjCAe8J3fxLcU3EjyhBmvOReWXM50
	RNSugIRNBPd4IGFUgb9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM7H-00000002iIY-49po;
	Mon, 26 Oct 2026 14:56:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM77-00000002iCj-02Ex
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 14:55:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F70D4049C;
	Mon, 26 Oct 2026 14:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91871F01825;
	Mon, 26 Oct 2026 14:55:47 +0000 (UTC)
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
Subject: [PATCH 04/11] pwm: rcar: Add helper variable dev to rcar_pwm_probe()
Date: Mon, 26 Oct 2026 15:55:20 +0100
Message-ID: <05d7b0c93b90f1d9d7dd3a54eb4c299b9b40442e.1793026273.git.geert+renesas@glider.be>
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

rcar_pwm_probe() has many users of "&pdev->dev".
Introduce a shorthand to simplify the code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pwm/pwm-rcar.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pwm/pwm-rcar.c b/drivers/pwm/pwm-rcar.c
index 4641f258df531baf..f1f68bfe016f729f 100644
--- a/drivers/pwm/pwm-rcar.c
+++ b/drivers/pwm/pwm-rcar.c
@@ -202,11 +202,12 @@ static const struct pwm_ops rcar_pwm_ops = {
 
 static int rcar_pwm_probe(struct platform_device *pdev)
 {
-	struct pwm_chip *chip;
+	struct device *dev = &pdev->dev;
 	struct rcar_pwm_chip *rcar_pwm;
+	struct pwm_chip *chip;
 	int ret;
 
-	chip = devm_pwmchip_alloc(&pdev->dev, 1, sizeof(*rcar_pwm));
+	chip = devm_pwmchip_alloc(dev, 1, sizeof(*rcar_pwm));
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
 	rcar_pwm = to_rcar_pwm_chip(chip);
@@ -215,9 +216,9 @@ static int rcar_pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(rcar_pwm->base))
 		return PTR_ERR(rcar_pwm->base);
 
-	rcar_pwm->clk = devm_clk_get(&pdev->dev, NULL);
+	rcar_pwm->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(rcar_pwm->clk)) {
-		dev_err(&pdev->dev, "cannot get clock\n");
+		dev_err(dev, "cannot get clock\n");
 		return PTR_ERR(rcar_pwm->clk);
 	}
 
@@ -225,12 +226,12 @@ static int rcar_pwm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, chip);
 
-	pm_runtime_enable(&pdev->dev);
+	pm_runtime_enable(dev);
 
 	ret = pwmchip_add(chip);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to register PWM chip: %d\n", ret);
-		pm_runtime_disable(&pdev->dev);
+		dev_err(dev, "failed to register PWM chip: %d\n", ret);
+		pm_runtime_disable(dev);
 		return ret;
 	}
 
-- 
2.43.0


