Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470E4C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 15:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWwWjRL2sG1kaP1KpOhM8tb9lVTY5ImgVviMKu9J/kw=; b=BxR2CFocDAE75Ivz7/i6Uf7nT3
	wUusMo3b0QzVJ/BzKd/twTLdBSphWgmP5ZfxAFjArl8EDrgxAFylSBC205Df0o/R/b7SBZ86/WPn/
	ErFz+Vt0tPh4PD68Xqs31YsZx9SnujnrUhtW6zzvdIaucoR47fEtEX5RqaY5S/wHUQE2eAhN5OsZ7
	jZ+0siE/JrbskcKQjEmtFer/Wz+SKFtK+ylTcxXrpqY+VdvrIq3aaSLxzggMDXundiFXhXVli7Ovt
	dd1+MHt8X3BXcoxrr1lpm6HVl9GVaTP7+6MPHmec5gcOsx5a9nJzfaIf45kc9lY0cr8mKe+rSrdTE
	wZL9CrEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0pV-00000007IKq-0Fu2;
	Tue, 10 Jun 2025 15:24:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAd-00000006mPL-0Sxm
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gWwWjRL2sG1kaP1KpOhM8tb9lVTY5ImgVviMKu9J/kw=; b=qAELk+JutNMNuUYDr5t/AE82gM
	3bIURAA6Ob+F8Wf+MNKNhAeWyoG1keNft4fOs+wdipbcuh+LZDcAfgVqbKh0dqDkAgKVM41roxU2U
	YDjAyaWhf6TIVpxPgKHruDBcAJ70Wf7/ktRD1mEix939nIzKHHjNrTxL1QFnwduA4klUGOTDkiUeI
	3iXWnU0/X8lKi40oApnhYXg1VFzR84aurx77icAdyuxdDkOCfSAoA188hfgZUNaYgvp17wt9FP02i
	sIp/FXAKvZHBP7mlRk+rZXE17QjdLKKPv565jt2INP74QqySt/npsnDpY2bAVb7PrrGn5G2wecsry
	M503lFDQ==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAb-00000001obP-0TPb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:33:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so65779665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558815; x=1750163615; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWwWjRL2sG1kaP1KpOhM8tb9lVTY5ImgVviMKu9J/kw=;
        b=MnAfGf7PDasWIfhfg5R7LWcA9izeBAU74SfA/5urJT3G0ytyy5wggF8hf+7+FBux1W
         cR6XGV8H1KzD2NqWL8EpqLfuIlD/Ze1UUWSVvqeORZKzfJRYNmzhdVqrGdmji7cZ3ajT
         L/9Tg4U0uxlwvC0kYuHAF6r0UVOqSoDkBHPIIA+f8LjLHP02F269vyHsL2Fohrzm/XLm
         ojyTCKiYk+mwUuaG/5FuJtxltsZu2PThpTOE1XoKXAjC75B0CUJRsDdXUR9ocwuSjZwv
         geDfqzDzn8bAwuIutDrugCVo9aOVIr/c13clh8IThyEAubh5iJqWcgkB7SKSGrusrnTX
         fT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558815; x=1750163615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWwWjRL2sG1kaP1KpOhM8tb9lVTY5ImgVviMKu9J/kw=;
        b=U5BQ06SPdVHFpsh/U3/GjwR3HZSyLE8W7u24dlrx4490GZsjr/tbe3kW5tAvlla4mN
         S9AiXp1LH4+6DkBCjkZ76QRtMLUhE7ShT/CTN7saokO81/hyD27GD4lkV4fqb3RWWC+b
         WikBb+u4W79tzhtnJ96iukMnppcqkKUcVHNhzpwUzo0QagKjmd4IFyWv/nTutUP5tOv/
         ZaXu4mpNKmf4E2HYVcx/g9CiSgmWI/ZkpLi2NWDKYmhWe+MVGSt6LaoyICAhxRyVMgFt
         p1/u2Gurkkox0u6ZZU9haWuORKYUsZgkcvC8jnmE2cS6azLBIu2HKiqjYNxJjLbC3aM2
         Dbeg==
X-Forwarded-Encrypted: i=1; AJvYcCWxZLK6VuQbghW4bwbxK08IskGNEsxrrCjUGa6Mowto2VnpFzyqvKceWG17IX2VwKHYTG5aUll8KcISdaeE6DRD@lists.infradead.org
X-Gm-Message-State: AOJu0YwFcdMUID7jhazbi3BgmDQMB3LpiFzn/6PuEB8/+7Gx7CdeNhF9
	adHW60C27KqSvptbQeemI9gdLstuQvPU4XsXnQjLeg2sFNskD0cUbsf88PvnYoUjqRo=
X-Gm-Gg: ASbGnctW3QOMEt4VpT2AZsUhbp00BGALDcp7IjVXN6PG4piujmsT1TNekmRlGArFUZ5
	Mt/GxjhhniHJWDeEADl7eteGdMzYjE1J50bljlJTFTZ6j3HbuHb0hmIQlcb0UcZzE8JeSBWyTJ6
	nrO+HaPsLs1XBCYc2HNNNr4cZx2ybovPp39Ptp2rLHKiGvRMhYttPWTwYCAcEi5csi/PWlL7utc
	FgpvDAkvlrexDGdnPqAwaGpnQseJ6jf4X+XdyVD5wK254VQCdNyArCgxyW2YV2rqtbds68cmokW
	NeEDkbe3R4O0WQzB22S5aK3owK6JwGOfADrSMcTuCvXHRPOaq8gQCw==
X-Google-Smtp-Source: AGHT+IG1enS1XXO5MOMxHtGmC2A0TWdm1D38HYK+u7jLnOQJgSRjc8Tt9JvPkZ2QOIrOTK0nknN0Zg==
X-Received: by 2002:a05:6000:2389:b0:3a5:215a:39d7 with SMTP id ffacd0b85a97d-3a531ab525dmr12050338f8f.22.1749558814690;
        Tue, 10 Jun 2025 05:33:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:21 +0200
Subject: [PATCH 11/12] gpio: omap: use new GPIO line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-11-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2332;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yxpS9O8VyBwfb+1xhv8Bj1RrUY/8b3PCfbF1mQmw8vo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYQMAyZ2DFFK2uTaeqWWkqsZrltQtYiNFD+/
 MelCJUiekWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmEAAKCRARpy6gFHHX
 cvAID/0SZN2Wd89qaQKgmmxwQk154LwwnFEUma6TiDSVFl0DYCIyoSmt+4ywy6/N7uybzS3xzR8
 wryJoLAuEDE8ndyVqjxweeVzP7/rSL0157QD86uNoS9RgjehI6GFWJY7jqIc6nzQRqQfjd4fA3y
 X51hb1N2boKXviFHtrMXrT7QsCH1/kB48RoFDmsxczMlCRDLNmLHEIBMoB8uexb7RkNv+ez4VgT
 4NqTADOXTj5kyXLTw5qABxy+OwvryoTQ0Phb90w9APCydzyQczAe+9qHW3XRuLHAXxMBVbPU3Hx
 czk2B4JWmnEmFMRSA0SthrZJk6pkl2RKeEPPxYXLvKA66IX1VmySqrHMqjEIlkje8vMYXi6HKdc
 OJx9I2c1uADeWrv/LWfubC5dlHXIe/Yz1MXY7PhBRom/bSOw114vQPADo4f1w6P0VhrS+IJGhgF
 lP1JWjYKSlGAJOlR4Bdan7uk5QXtcrn3bltIR9x1vJCMlmuZYZrNQzl27offS1w06rUuUK9uvwx
 IZRnZ6UAUfXoIAB0gbyqa+sORMJ4MXo5x5NShZmGLERhonmyI39orc4HEcm7a9p/qtiuD17AJTf
 U4MrqzutczKRKwe3qRSf3UFrc5gGSxR4yPGEGthaKAg1WdSyA7jHkMNgTpemGF7psGH7iDZk02R
 AGAbHK/H1WBZtCg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133337_273176_9F383BB1 
X-CRM114-Status: GOOD (  13.33  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-omap.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 54c4bfdccf56812b5f79435a97b6eb90904ca59c..ed5c88a5c5207063e1269763e6239441a42e0c3d 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -953,7 +953,7 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 	return ret;
 }
 
-static void omap_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int omap_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gpio_bank *bank;
 	unsigned long flags;
@@ -962,10 +962,12 @@ static void omap_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	bank->set_dataout(bank, offset, value);
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
+
+	return 0;
 }
 
-static void omap_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
-				   unsigned long *bits)
+static int omap_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				  unsigned long *bits)
 {
 	struct gpio_bank *bank = gpiochip_get_data(chip);
 	void __iomem *reg = bank->base + bank->regs->dataout;
@@ -977,6 +979,8 @@ static void omap_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 	writel_relaxed(l, reg);
 	bank->context.dataout = l;
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
+
+	return 0;
 }
 
 /*---------------------------------------------------------------------*/
@@ -1042,8 +1046,8 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct device *pm_dev)
 	bank->chip.get_multiple = omap_gpio_get_multiple;
 	bank->chip.direction_output = omap_gpio_output;
 	bank->chip.set_config = omap_gpio_set_config;
-	bank->chip.set = omap_gpio_set;
-	bank->chip.set_multiple = omap_gpio_set_multiple;
+	bank->chip.set_rv = omap_gpio_set;
+	bank->chip.set_multiple_rv = omap_gpio_set_multiple;
 	if (bank->is_mpuio) {
 		bank->chip.label = "mpuio";
 		if (bank->regs->wkup_en)

-- 
2.48.1


