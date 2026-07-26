Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5A8C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 18:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PdwZxxP8oqz0gMmIElZLBFtAWKuHTGQms5/kGxcVlaA=; b=FZH8OiroSyXbIOkq3VBFVgcS2d
	rGM3mlJytldfj3BIqA/0P7zNiFurDinOn59Ly2mtEXhsBjVJEcmwJdL10jTVUWkBNQUukLWQJLztJ
	wpHXNSH6ClVi4tW19TJ8eIZGpLwHah/IVqdq5fp8yduTfeI86s2F7ws7f4u+jbEcdHvubv5niWLmI
	P3kkN2iFTu5cf9TVWPmiBq1mrL96YohaQr1FD/4X1Wh+Cygw1pFrKKn19vaXO/oMDTQOIAPzfw54d
	xw3MS5rIEjqJ3Bhmb5k5EeKHXgwg4VYBNwcERjxlBZw0kBDNO4rF/TJOA4tTiXE03AHNLoLCRfYFM
	JDAxX7yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3Cf-00000001RwB-2Cwg;
	Sun, 26 Jul 2026 18:03:57 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3Cd-00000001Rvn-1dLd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 18:03:56 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-ca80d708489so1305017a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 11:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785089034; x=1785693834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdwZxxP8oqz0gMmIElZLBFtAWKuHTGQms5/kGxcVlaA=;
        b=mJ3aIM7++u/EF5BPlFtFJHqfnXeLLMMAKfPIKsOXn4E1WoQQ596B0FsgFIH5S9m1QI
         LYdLON3udg5XMHKe3sX6G9yxtDULEX2gxeJbLzc0vCPMDwLBO3Jt/zKd7/L3KSAr1mM8
         9nu6X8XpUfvkF5/6mFcWLH4PwcKE6I685PHhuNduOzN0dcVTETlbJTTj72zHwg5Q2C4N
         2ytQcVhdyxJOJMrVwcCJWcW4yaYHwAuh4F4rh/7Ho70sjIEAA8d8x0ZtVLZ1nqV7ipu7
         WNU814QmuDmeVTOyR/9Tvj8dncOr7JttmW4qBWqnF0b2ReylQG+W14MrUO4jdkB8MY8q
         61zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785089034; x=1785693834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdwZxxP8oqz0gMmIElZLBFtAWKuHTGQms5/kGxcVlaA=;
        b=SEA5Ey10EBhqrPy03Q2/p+wkqNz9jBaebnVa9QhFFxWcIDjs/ey8NqLWX9Dec1oqvB
         hUGxBmw9b/ciA84e5L0bIiAxWzv1MeBu05FJdTPgz5H9n6WIE4R6kfwePxgYOT542jCm
         Q3NnfiQcSdqmJUIzW/n4BgRIRPU/HaDANNTc9oq3bBYqmYxbmI5dgolprUcnfutQeiPE
         XXOpfDUpqmdcDDdOwHsUxOwoM0ezMsG5pJri83yPKjCYFTFtVPE96c3qlufzgCmTLdbv
         rAq2SpmEQ4OOMPaCWzd5aaKsz7NImlyJokzvmmnAJq09USNl/ncAh9QUfGxtKN3sHA3g
         7YuQ==
X-Forwarded-Encrypted: i=1; AHgh+RrEwa2F4ZGDRJ2V/Kx2scEgoElZwNKaQropSy/ka5OqGtUp+FP2RV9KREHQoZCnE7hZS2nhLBf2Q01h9WE3dTGQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd7Aqt/5DmBctG66rCFD5fHzk5VhbkQ9BqAHGXBr8w1Zd0KlsU
	aXLjS9hsr5+ntt4WnF7IkgqqY+aEacfmSy4xAo5yP+F7TPel/iNgTVch
X-Gm-Gg: AR+sD10gBUUrkjR+yEuoG7lYqB+7cWBtyje3VRF427xufSSRIwn/XQUvBvJXzJqdIdr
	WiylqA+hFKVvkgoorDHXrXe1KaejkXmuVFLqBnzjuvt5nrqua+yzRgbHfjZFXrGoOxrPrOqcdK/
	7eJdQZwVX9sWSfYrC/skOoLyqyXbTL8D/HmOB51GgWMU6BUn9FMmms+D+CZ/XY0bXiQ7kiv7k9V
	twqnYul+hz0gO8sE2t0WKeTJVVqQi8yxdu1HWtUNRO9AMTcBTIG5bOMK72dQfjVy4qqujRhpHOS
	xQtHfUwmOSC/Ywxpcx0omKsW0HgSYL8bksYJQemY0yXpmqckbvGV3DWQifMgE4s4+Oap734Tj4D
	aIBwXU2YQj8hU9hWc8VbTtb5XcrBYV40J6i3N84dUd5rG1lvKsuFALqJsFhu55NIFJJ81p2EfCG
	kd0JB8LVc6ens=
X-Received: by 2002:a05:6a21:6b8c:b0:3c3:8315:80b6 with SMTP id adf61e73a8af0-3c67267e948mr7535903637.32.1785089033798;
        Sun, 26 Jul 2026 11:03:53 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:30b7:9ffb:4fac:ad00])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1285sm24729671eec.5.2026.07.26.11.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 11:03:53 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] iio: adc: bcm_iproc_adc: Use dev_err_probe() for resource acquisition failures
Date: Sun, 26 Jul 2026 23:33:19 +0530
Message-ID: <20260726180319.315016-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_110355_431662_D8902D3B 
X-CRM114-Status: GOOD (  11.37  )
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

From: Mohammad Shahid <mdshahid03@gmail.com>

Replace open-coded dev_err() and error returns with dev_err_probe()
for failures from syscon_regmap_lookup_by_phandle() and devm_clk_get()
in the probe path.

This simplifies error handling and properly handles deferred probing.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index cf4738b16e62..62f12eecc8b2 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -522,19 +522,16 @@ static int iproc_adc_probe(struct platform_device *pdev)
 
 	adc_priv->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
 			   "adc-syscon");
-	if (IS_ERR(adc_priv->regmap)) {
-		dev_err(&pdev->dev, "failed to get handle for tsc syscon\n");
-		ret = PTR_ERR(adc_priv->regmap);
-		return ret;
-	}
+	if (IS_ERR(adc_priv->regmap))
+		return dev_err_probe(&pdev->dev,
+				     PTR_ERR(adc_priv->regmap),
+				     "failed to get handle for tsc syscon\n");
 
 	adc_priv->adc_clk = devm_clk_get(&pdev->dev, "tsc_clk");
-	if (IS_ERR(adc_priv->adc_clk)) {
-		dev_err(&pdev->dev,
-			"failed getting clock tsc_clk\n");
-		ret = PTR_ERR(adc_priv->adc_clk);
-		return ret;
-	}
+	if (IS_ERR(adc_priv->adc_clk))
+		return dev_err_probe(&pdev->dev,
+				     PTR_ERR(adc_priv->adc_clk),
+				     "failed getting clock tsc_clk\n");
 
 	adc_priv->irqno = platform_get_irq(pdev, 0);
 	if (adc_priv->irqno < 0)
-- 
2.43.0


