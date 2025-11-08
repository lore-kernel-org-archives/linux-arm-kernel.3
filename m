Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1302ECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 23:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIdZxomTiawbxwfqpMnoqPSizZxwJiiryInuVxUgs40=; b=tMv864xuuVeCy2i+5vBIzBstcD
	qAv4zNtUR1TUHCcOTFNxOfvfeIWEnfUbhsm3zT7HmLimDFd+5fwhAeEOniGcEpSApV5rv+7jEGqdm
	GKtT1wF/WbtW6b2bP6qRRzGsB+55+QeNg9hUWYHbVStmUQs1vqTbE1EkZZaGPYsSX1AgSmoYPEFzC
	PWTiR5ywoCeSgJ9QjnaAjGUgLAQo3TOcW+ORuP92xwe8bGi2r7117Jmsjl3AYjVTm6DeDvtrDc62L
	u4tha9oG12tyQviudQl8+UuNMMR0FIQYDYQJW98/M8ZC7zKrST95B4BiTGiiJ8uR10RFRqhDsV0CA
	dur6rslQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7Y-00000003YTg-2El0;
	Sat, 08 Nov 2025 23:13:24 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7W-00000003YRo-1clI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 23:13:23 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6417313bddaso518264a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 15:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762643601; x=1763248401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIdZxomTiawbxwfqpMnoqPSizZxwJiiryInuVxUgs40=;
        b=SRfe7JHiDNeBT9XxqEp+H/WAH2z/P3K+5gwPooRK3JbVjniCuCidsqCVgGbKvmgabi
         AOHFwV2ZzVO02Oy+V/R5D7DSXtx8xqMnmHkhdgcLNK4O25dwlGAbNQIjh9ZTQve/sEgn
         3JnrXuOeUdmGFoUCr5WIiPOOSGwEkDdPh6e/6pmq7Cu5gWgQs8KxisjGZ4U3g6pWnyDW
         lhLprEP7xiO9H8MZNWJcg4eGxIz/4vcGXSwQmCsBoAvsM2QG0Df/L4VnE2iJHerXEGPM
         xft3Spm/zMwUHN4JSmVjyFoOk7nEJSQmwdQdUoDzPcqaBg/18ZQMwqTFxKIMemUjczro
         wNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762643601; x=1763248401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OIdZxomTiawbxwfqpMnoqPSizZxwJiiryInuVxUgs40=;
        b=QCHXW5W+ZL8LbOBdXShznbvJEIEfqT5aF80oIwfqDAH7IOeJ1Z1DRKdbVORrrKtLj/
         mFC8MQbLsCUdVAe9AbSxiorYCcoDvZPzZ4Njs7aJU8wTeTyHw6WOUlWtmCshQnf+BJul
         qA96ffxErbOrojA3KWykm+ZyMT0ep8YlB2C0ti3zzU8lw/drRDHUZHXK+i/taaOiDFfe
         8mAPfqIE3WGNjKJiqmWG4ZV1fC4UdeUzkjBkiS7Jic/L8b5sWwN2jJVWwY0VN0SoJ0AN
         +PZPZzmb29tpjqiH+jrpr1nRxJ6xbHGIOv1UpsQ+EDGmsW5vlJP0EuOtboVIXgOAYMCS
         omCg==
X-Gm-Message-State: AOJu0YyAnDsuIyON3zZL/QZZl8F3qPGa52O2rm8LgwvvMORTB7hiCqL1
	dyVQfjHymDYngHd1Ovu8RWJdC5HZinxEznq5mA2SMMznZPQ24IEy4EE9
X-Gm-Gg: ASbGncvK2rKkg/PQmB6qi73wWb1ZRdu9Zqn9HWVaN2A6HHmZZo3AxDo3fjPS1RRp4HU
	7GuEyauWtgQGUtxIbYMyA0oZS4YqXzs4heh4nMvrKh4/RipG7Vs6Z8BVoOrVAkBsVygfcHPtebA
	QzXoDj4AlEv789S3XAPlz4OeoqapWuWA0W4vvq8y4JIxfOnKYlDLxBwBYEpmvjpvlQCpvI6fFjt
	MdXA9ZEn3MEuHWOu7Pzki+0clbrM7Z0x/lG0e2t1AQQSph7rl+G69P56opvC6FJlL6vaRBlenHN
	ULniymTjMRqa7lEuLFUoGjW4JlY2nKtZM8LuE5y3IY3GBkAiaRTCs+RCNvveEJw71bWUzCDNx5e
	NaEEwOMYhtwimcQNVySoYaJt0ayrE8HdUbOBLtuv/mriQaS8v6fPVW+60dG4i2YX0RgeDo/JVJI
	W7SUOGc96pYPrKgnP5dYWutB8Tdo9OLHoMGZYnyA4hudfZ7iCbb+2DNwkPSkyLJ4FGnPMVTpx3x
	BwjS2vL30AkM97dYjNfvNx4IP1IU/xn
X-Google-Smtp-Source: AGHT+IFQjlRv39XcJklWKjtg5/kXtIXi7GGXYRLVU3hdPD9cbN+MwifNhIboaa4CWjMgje18D1/dkg==
X-Received: by 2002:a05:6402:2106:b0:640:8eed:5601 with SMTP id 4fb4d7f45d1cf-6415e104231mr2993008a12.2.1762643600704;
        Sat, 08 Nov 2025 15:13:20 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a9b3-6600-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a9b3:6600:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6411f814164sm7642807a12.13.2025.11.08.15.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 15:13:19 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 2/7] mmc: meson-mx-sdio: Use devm_clk_get_enabled()
Date: Sun,  9 Nov 2025 00:12:48 +0100
Message-ID: <20251108231253.1641927-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_151322_443007_63B18874 
X-CRM114-Status: GOOD (  14.86  )
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

This simplifies the code. No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/host/meson-mx-sdio.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index 2448f21bd683..1159cc911359 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -103,7 +103,6 @@ struct meson_mx_mmc_host {
 	struct device			*controller_dev;
 
 	struct clk			*parent_clk;
-	struct clk			*core_clk;
 	struct clk_divider		cfg_div;
 	struct clk			*cfg_div_clk;
 	struct clk_fixed_factor		fixed_factor;
@@ -627,6 +626,7 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 	struct platform_device *slot_pdev;
 	struct mmc_host *mmc;
 	struct meson_mx_mmc_host *host;
+	struct clk *core_clk;
 	void __iomem *base;
 	int ret, irq;
 	u32 conf;
@@ -676,9 +676,9 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 	if (ret)
 		goto error_free_mmc;
 
-	host->core_clk = devm_clk_get(host->controller_dev, "core");
-	if (IS_ERR(host->core_clk)) {
-		ret = PTR_ERR(host->core_clk);
+	core_clk = devm_clk_get_enabled(host->controller_dev, "core");
+	if (IS_ERR(core_clk)) {
+		ret = PTR_ERR(core_clk);
 		goto error_free_mmc;
 	}
 
@@ -692,16 +692,10 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 	if (ret)
 		goto error_free_mmc;
 
-	ret = clk_prepare_enable(host->core_clk);
-	if (ret) {
-		dev_err(host->controller_dev, "Failed to enable core clock\n");
-		goto error_free_mmc;
-	}
-
 	ret = clk_prepare_enable(host->cfg_div_clk);
 	if (ret) {
 		dev_err(host->controller_dev, "Failed to enable MMC clock\n");
-		goto error_disable_core_clk;
+		goto error_free_mmc;
 	}
 
 	conf = 0;
@@ -715,14 +709,12 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 
 	ret = meson_mx_mmc_add_host(host);
 	if (ret)
-		goto error_disable_clks;
+		goto error_disable_div_clk;
 
 	return 0;
 
-error_disable_clks:
+error_disable_div_clk:
 	clk_disable_unprepare(host->cfg_div_clk);
-error_disable_core_clk:
-	clk_disable_unprepare(host->core_clk);
 error_free_mmc:
 	mmc_free_host(mmc);
 error_unregister_slot_pdev:
@@ -742,7 +734,6 @@ static void meson_mx_mmc_remove(struct platform_device *pdev)
 	of_platform_device_destroy(slot_dev, NULL);
 
 	clk_disable_unprepare(host->cfg_div_clk);
-	clk_disable_unprepare(host->core_clk);
 
 	mmc_free_host(host->mmc);
 }
-- 
2.51.2


