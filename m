Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C8DFD006D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 17:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JC8dtCejMLT5Ebas54y2Sb5Ey1Dlmdy+AbqrqYYmf+k=; b=fzZf1FDbGuEaIS1eCH5+GJmAN1
	aIx4hjQqHApxy6oU0HYi0a60Q6qmQGhhHsNwVrbYrKLM3aCpkWj8ohIxUk4BAJifSWwrgzisgNWK2
	3joqltBMLwL08EqxssZPBhu7dLDJUIoTAtNS+jucAE3ZKd7b6B6ninVuqaoWySq6e0qyCTGUeL6Z9
	gmUWHkG3Rxrj8mMx8M7HAztJoPhw8IXlpL/g0ZhJtMq1/fx27zXeRouQPqAtnrdQenmPa/BeOXq+1
	+xf+USHrHlvBPnD8SZAc4XbzY5N6fn0NT2xhGXr9gqBaMRm+tCwV5LPXXNYGi2Ii2f2ifQlhzRDra
	fXzoPqUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkHh-0000000Bhiz-0nG3;
	Sun, 01 Mar 2026 17:08:49 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwkHe-0000000BhiT-1eVy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 17:08:47 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c6f306faaffso1284289a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 09:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772384925; x=1772989725; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JC8dtCejMLT5Ebas54y2Sb5Ey1Dlmdy+AbqrqYYmf+k=;
        b=lnTMzdWM39rZDqlNF9S2pMFJbErM97w4Q0V3nimBf6fBhcb/DtEYlaazq2LOm+mLaq
         isz23ceFwbJ7dSvfsvjEJaf0/hZnmSaqrh852ca0mQohm31Zv4FtiT+7d7MU9/ukJ6H5
         kQwTbw/98bCnw+AHcMzJjzZoBYfv6ZpCVcrH8PLc+6xGH7r/X8gp/rAlDtx6E30Uyq9R
         LlluBmqhhAbdIOgIsAHVfipk2m0KuvR+a6EbLD8lA98JkhbRPBAb6vlAkibcEDUVUtON
         AErvQ/E8uHE7ch09U+peFJb0qS7VgiAltVcyZc7aKuObt7wc00jzoKLZR9oUpx+cZKMg
         zY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772384925; x=1772989725;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JC8dtCejMLT5Ebas54y2Sb5Ey1Dlmdy+AbqrqYYmf+k=;
        b=Ojqwj10sJm20KtUas6FVi34TadHdOJkUuJGnRlBqZs6CQ7+LDjbY96OMvrVqUxP30/
         gEA7PnzpX6If7fo01Khp64URInAC4o1i5HzoamLiyy4q+3OCqFM2OIFMDvUmor9WvP7B
         Vqt8ze4De6znxEkbEg4Cr1Q4aM8zWFykuX9VapCCNHMw9PpN01Bl8p/KLl/n07f9rnwi
         M8uCoXdOxEGPAIuGXGswkeShTp9y8zZ2lK3vPJU9aNgQkIsOMLX7xnZ1NjO29GHjAyiO
         0r9CEkyE+A5Q8GT6sW6AJzLly+AZa+0kUQthFKFjoBitVtRq/1dhkQRzVMgP1TZq/GpR
         c6Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXYLRxxrQHGynNuz2R6MvhwnHMOZmb8ugoopw0Bo8+45EYz31fbsjXm7LxEiSVYkHmL0yV60vh+0aamKdEAhRFU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw370NKmHyGY132fHRMfKftU7WARq8hr+sptUDsEPD/A8D+YUny
	NhEW5YOTpoaO04XwvxKLidXvKN+ZjABJTnnZ6fnYf7ZprQdNlJ8MZSki
X-Gm-Gg: ATEYQzwqLpZ4abCAoaR1fSuGYJ1C9z+6xMYzsmUm95tzECPHy23vLc25gyXIKviklWL
	ged7+v2sv1EAFFJdN1GcVLh21cor7cM6LrSKGaB+qJ/l9qvB44hkeHn9yFkSWyfnbM0KqY6W8kq
	mvKgk7xErrBAFmbF9DDNkOsyvg/HlwsAXu5SzYrEuiVAtthgE8Tqyi5ykxzla2rqN5taoJSXTAe
	dNcwXrp2n63KOnSBpxvU/sYMVqrda4w+AS/v1kXY4cPdkuccd/TaQ7hIgl9zb9Quh6f1huzc4/K
	ewCfd0dQvJGwULHAYEPBAT8li6q8MvFkvyGGBd53reR6yYE1irUprAB3lB7NQgTVm0ryVGX+fgL
	JjLhN2D3e/L7CRkiAyg2hg2TVWy5LOtYTz9C62WkAP/35qVB9KFKtUuATvZ+bMY269JJgmmt8cv
	k5QaaB7AWTJA3PvF/vsQgEFXgtKk7sq6ukDxOV
X-Received: by 2002:a17:902:e884:b0:2ad:ae41:76c2 with SMTP id d9443c01a7336-2ae2e496e4dmr118882715ad.26.1772384925120;
        Sun, 01 Mar 2026 09:08:45 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:fcc8:844a:f21c:8d7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b257esm113727485ad.4.2026.03.01.09.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 09:08:44 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 02 Mar 2026 01:08:40 +0800
Subject: [PATCH] spi: axiado: Fix double-free in ax_spi_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-axiado-v1-1-1132819f1cb7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJdypGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwMj3cSKzMSUfN0kQ4OkNIskExPL1CQloOKCotS0zAqwQdGxtbUATZB
 QCVgAAAA=
X-Change-ID: 20260302-axiado-b10bf8b449eb
To: Vladimir Moravcevic <vmoravcevic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Mark Brown <broonie@kernel.org>, 
 Harshit Shah <hshah@axiado.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772384921; l=2297;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=yRcPxQvhGF4Ecv8niJ2audTUHBcYg9U8KcKsj1DASZI=;
 b=6ZyludJkVlCPWMcgh0edieK7UilddIXrENzghd58O7RYYEezPlqmEAkZztl66/zJRQ+npqbeV
 Uk98OQPSAFoCPV+XJQpBmGIpVwAwS1M7RjQGYCVPeocfqiPnTaDYOMb
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_090846_443918_89872EBC 
X-CRM114-Status: GOOD (  12.29  )
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

ctlr is allocated using devm_spi_alloc_host(), which automatically
handles reference counting via the devm framework.

Calling spi_controller_put() manually in the probe error path is
redundant and results in a double-free.

Fixes: e75a6b00ad79 ("spi: axiado: Add driver for Axiado SPI DB controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-axiado.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/spi/spi-axiado.c b/drivers/spi/spi-axiado.c
index 8cea81432c5b..8ddcd27def22 100644
--- a/drivers/spi/spi-axiado.c
+++ b/drivers/spi/spi-axiado.c
@@ -765,30 +765,22 @@ static int ax_spi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ctlr);
 
 	xspi->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(xspi->regs)) {
-		ret = PTR_ERR(xspi->regs);
-		goto remove_ctlr;
-	}
+	if (IS_ERR(xspi->regs))
+		return PTR_ERR(xspi->regs);
 
 	xspi->pclk = devm_clk_get(&pdev->dev, "pclk");
-	if (IS_ERR(xspi->pclk)) {
-		dev_err(&pdev->dev, "pclk clock not found.\n");
-		ret = PTR_ERR(xspi->pclk);
-		goto remove_ctlr;
-	}
+	if (IS_ERR(xspi->pclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(xspi->pclk),
+				     "pclk clock not found.\n");
 
 	xspi->ref_clk = devm_clk_get(&pdev->dev, "ref");
-	if (IS_ERR(xspi->ref_clk)) {
-		dev_err(&pdev->dev, "ref clock not found.\n");
-		ret = PTR_ERR(xspi->ref_clk);
-		goto remove_ctlr;
-	}
+	if (IS_ERR(xspi->ref_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(xspi->ref_clk),
+				     "ref clock not found.\n");
 
 	ret = clk_prepare_enable(xspi->pclk);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to enable APB clock.\n");
-		goto remove_ctlr;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Unable to enable APB clock.\n");
 
 	ret = clk_prepare_enable(xspi->ref_clk);
 	if (ret) {
@@ -869,8 +861,7 @@ static int ax_spi_probe(struct platform_device *pdev)
 	clk_disable_unprepare(xspi->ref_clk);
 clk_dis_apb:
 	clk_disable_unprepare(xspi->pclk);
-remove_ctlr:
-	spi_controller_put(ctlr);
+
 	return ret;
 }
 

---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260302-axiado-b10bf8b449eb

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


