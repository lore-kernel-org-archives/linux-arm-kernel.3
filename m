Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7AAFC72C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 13:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SrIW8xtAyVysxyWJhbGBQFiTsDupVZxP4JLEp/IdUF4=; b=v1mg5yo759NKLxMBSnKZYztwnA
	wi0EcfTEh7udzROTwM3Yb/vHETjFl0ry6Jlb5kQtye5q5QQ0zCcr3/y3WwTB2IumcbrYhbuAI2ahS
	7McefIxZAgbOGiuaaQzQXJAApUtZEwSpKiJtHnbmzCP2cNrhypo6Kw6RCPwI9dXSIntYkXOqOJ1dQ
	b0Da521rCm86pPc670SpUuDIPiF9XISA6kIKrsaMFsXACbip74XhHEeGx89R03CPE0+EDMdkL0Y47
	y4NPMfgTg/QTzyYs2RiWapz2WI/T12QCVP/JdnCcidd8UIGDhqIEMceyww7+LGIw4HaMJ05oxmUo/
	IqxDYO3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4IsZ-0000000FMok-2xJT;
	Sun, 22 Mar 2026 13:30:07 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4IsV-0000000FMo1-3kjD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 13:30:05 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2b061b6cf36so15335875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 06:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774186202; x=1774791002; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SrIW8xtAyVysxyWJhbGBQFiTsDupVZxP4JLEp/IdUF4=;
        b=ToJ1CVDrTMsi7R6RXobSuzEY6x6QXFWdnFwVvyxTKJaZbgOTafQha6PfS+G9gXD3mK
         p1IvZRFwRjci5fWEBWax2DHAqCO7m0qjzPR8Dk/3qQf4pSbD2/N4RfUudba9xXgT9o71
         bL5i2EtVjesfNUHXCfP3z0oPqiAEoB3njffF6tDXO2r1vNnfzUUeUurfASCx9g6jn847
         /L6931ZvB52Mmy0yIWf7STYamRPa6Gd1gclDpSak+KpGASsqmrpClsF83QXuIYFF7PK5
         dwKvzak4/22GtdjdjcI1skBmYhmSqw3Mj6k6Oieg96lW6YByPYONvDlVn3ZGxxCF9Q30
         ghew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774186202; x=1774791002;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrIW8xtAyVysxyWJhbGBQFiTsDupVZxP4JLEp/IdUF4=;
        b=ZN9V5qsFd1JHrf8jdKtrOYJjh6JuGcGM1YwZ5JyMR5u7dqvKnxxPswNpa83sp2GS4p
         /9B7rxIBdTLvUZqLFix3fiDTeBREd4R26U57Eqw62FAJ82wa2cnadbXpYmdCuI7w1JdK
         PdwaxWyZddDZV9c6FWGKxSdZJeE5otjJ67aWEnbZAzAXPM5t3MF0I7lKR/lOa8QApr5Y
         iWW6ghkhuoROYGRSR1mtwLTNkCKaC2GDaYGLLJPiV1EtExeqq5yR/xk5v11Tj2zhlIRt
         1pfnxJg7krUbSnDojyrpfxjWI6JKorjT3dHXDoaogI2aWCsT6iEb1gJ+VuWf00IqO2vO
         hGNw==
X-Forwarded-Encrypted: i=1; AJvYcCU1VmNRD12ptYCH3u0/EyKUSVgWJsA4QwKsk/bcRN66Azcqmpe+VLtu2nAfPAmVmzRftyHOzFRQudOraEqjI7Ot@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ6NHwdGRgLhJw8vYx4l/xpabT851CGrxCq0YRb8VhmaDKSwAR
	o4/XSJp8X1vr/w2uvZ07MO1oyztDkj0Ag7AanZptJNlzWUxMy8Yvxzrl
X-Gm-Gg: ATEYQzzc2lI6/BhfqkPHO4FwPB8vY4d7hvsosqJBowWh5Ev3FAkigWZyPCiSdrUGs01
	2NpJiKGmH5jsUJp6p2NmdMAHwrJm2pNoYlc0JZj5Uj37yHN0/LChJfMGH5fmVXHNpPSjHlTVrdW
	tOLsl0Mb6tDDN9OHGHWnplvC5sQD7gT/WHdlYadppXlPuMHzkM56wVzwqFAEiypYIMn1ziXX2fF
	0t9+nGIUOaFXeuWh2hZwnI7/LdmJSGbJWTUu4c6LisPm/sh5T8HZ0K1/SJXe1N6/QXe5XsVXRWX
	Tdz1lqLGUVQ394KYx75bf/9rdW0OTMCW1nKE8EO/5G6R8UVR30xD2J09pu4Bi7Bml+g9dK+c878
	0PmZbUdu67X4xOCrb0LfoowHLdVIYrIVW2DNmGu5ijhLXLUKobWUgtzGFInehJcJHAov291obox
	A0n0dgiqUko/pZgeGidMZYMrVeX7BGK+BkZVcp
X-Received: by 2002:a17:902:eccc:b0:2b0:5472:ac85 with SMTP id d9443c01a7336-2b08278b1c6mr81255475ad.26.1774186202363;
        Sun, 22 Mar 2026 06:30:02 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08352ae70sm82428685ad.23.2026.03.22.06.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 06:30:01 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 22 Mar 2026 21:29:56 +0800
Subject: [PATCH] spi: meson-spicc: Fix double-put in remove path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-rockchip-v1-1-fac3f0c6dad8@gmail.com>
X-B4-Tracking: v=1; b=H4sIANPuv2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMj3aL85OzkjMwCXaNEMwMjQwsjM0NjcyWg8oKi1LTMCrBR0bG1tQA
 QXofoWgAAAA==
X-Change-ID: 20260322-rockchip-2a6021826137
To: Mark Brown <broonie@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Dongliang Mu <mudongliangabcd@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774186199; l=1052;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=IgWmy4QA7Nns3VcVuEiMlxkNPJRgKy13zfHehRaQ8LU=;
 b=dLgftTxPLhBEjASFdBodKe9Oa/2BVSKKuobIs2yLPKcz6YEYlPHAm2ZONouYTQlHozSyDTzz4
 Hbhn7HkyqvYB/ymGHGdt7PmckUH6vjxfwNcoNmgq+lvWTlIbDGTgtK6
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_063003_946927_C0EB84A2 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

meson_spicc_probe() registers the controller with
devm_spi_register_controller(), so teardown already drops the
controller reference via devm cleanup.

Calling spi_controller_put() again in meson_spicc_remove()
causes a double-put.

Fixes: 8311ee2164c5 ("spi: meson-spicc: fix memory leak in meson_spicc_remove")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-meson-spicc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index a7001b9e36e6..57768da3205d 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -1101,8 +1101,6 @@ static void meson_spicc_remove(struct platform_device *pdev)
 
 	/* Disable SPI */
 	writel(0, spicc->base + SPICC_CONREG);
-
-	spi_controller_put(spicc->host);
 }
 
 static const struct meson_spicc_data meson_spicc_gx_data = {

---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260322-rockchip-2a6021826137

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


