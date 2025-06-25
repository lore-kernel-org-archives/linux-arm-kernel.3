Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D489C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 14:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJHIuMYrWN8IdFB2bnihanEiItYdX6hdAm3LOb4QX6U=; b=Cfc54osY/eFCFHrMDPk414aN49
	uVmD9qtTcNazYpKMffCjXXNOFHnF1A2hMOnHIpu1Irpj8CaUCSLEMYEw685dGYXKccpDx/6UOQF0U
	I85vnLnY7qm612BiMn2DJVvVDxAyS4hjp3hA1MDWHv7FEeun9/45UQlBn3dqiQa1+O4CL83XWZ5Vb
	LrAeEHMbS/ebzAKz9KYPj2eddjcbBhuaGGao5xMgnNmL4Xt4PfQTv0p1rUdjCP7EDyD+Gp2Ru9QB6
	1xCU0xvtg1cW8eZGbZO+RHJxN5gb7MJHHvEEZcW8lIU8lqWDLY+070cw+LbySGL3VPaaBt3k4f3Fo
	9XzjOucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQgD-00000008tEK-4746;
	Wed, 25 Jun 2025 14:00:49 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNRw-00000008K8M-3hB1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:33:53 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so4983555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847631; x=1751452431; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJHIuMYrWN8IdFB2bnihanEiItYdX6hdAm3LOb4QX6U=;
        b=vo6s83T26yMAgYg2/aYSwVc66RTNvqdPwWBUYl8XB7JiKwNqFqaEzRwVKXmuTOQWrQ
         N+xUvSlo3evrHHQ9/UJ+51O21oQhsZkKNOXP/R5jqzz12Fxplv4VG6GTKnbCznBQPt5B
         9efQYsgGOdd4ka8rjQfMXSHhjdm1CE1+adTT7mNMf8MiK7GCbHAZd5NYWefhtY11IhF+
         skcyn41jA7u2DXVbi8VnfzxCD1C+jgcydetMjuojDQ+AQ1sIg3C7zord+Dbb8Uu0/qxa
         G8Urrc6zVSZWPdMXulnRQWWwXu5wOJULhYUS2MezVFTJFEUZH3ZF5oMTYMlWlcz0CIrc
         VGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847631; x=1751452431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJHIuMYrWN8IdFB2bnihanEiItYdX6hdAm3LOb4QX6U=;
        b=en7bjgMDmNDF5+zxuZ1OG4rKHQaXI0/l6Ep9r/HEFq/88SbM9f9TCi2Xsl1uDq9IZk
         ac+qrzcUZyLpo7+vJ/VdVJieqpaIC0fs/ORVuIx8LxdHuGWxrlk5kwes5XmibbGYOv5L
         Yzqc923DorJWqdLZ51iEOKECGYI1IyWIeIRVAmWwtzySDH0RTQpG4tDpTNgO+hxqhtKJ
         Tm5NVDduv0z8Y9/uTNCbFxgq9yVHA+7JyMFr8KFYZjxOk6Zl4yOXZar+ZnRtdKXpQ2G8
         bmUFFtCE8Ks/0pYiIHh+f6haJ8yoKCYAsLBMnRQQOcdXWa+chza0vVMnWhkFYIEwhA9S
         hgKQ==
X-Gm-Message-State: AOJu0YwtTo7pzt4uQez/PUdCzdEOaTMRwYQ1wfKmfDRomFzFtCXjuDEA
	rU7oq+CwYhJSMfk0S+UJTq12P7ILjWO3OwTbzhjyPrmSHZ0HwYWVpTK0zxGvPcW/gkk=
X-Gm-Gg: ASbGncucu8pH1rh8jx5C/nVbUVZDwbTZ1rhLH+unAYkz40iz0MNjW77qQSaJ5zRJ41Q
	b0MAe3KqyvaUxpqzcEt9hGcyB3/YIZ4MGx65fNQC/8Gd9Qc38LA1AlGBwc5B9mCv/wX4TCwVtKz
	LQmR2HTK9yv478ET0yYCxXbEojFx80R8dC/CqMWJZAGnv/b+OfriZByNWA0fryBFgb3W/SoiPxP
	nbihS5IrWI7M8L1kU6VSZeCvYJP+gSnu0RwHdRhuN8rqTkA300VElhLtXM+RpvfMwsU3O6SZj8r
	Gqw8aIOs5nQH6XJxeyTPF9B+Az7V1AF44IjabVg4OOOCHNQEwNVZBuaB
X-Google-Smtp-Source: AGHT+IHVlfqB4inzXZzLgekCnTIjuihgVCYxGd7tprEn7YokvX3NE5HXPw4UxnDwuCjQPML6+E/5Fg==
X-Received: by 2002:a5d:5f92:0:b0:3a5:25e2:6129 with SMTP id ffacd0b85a97d-3a6e7206741mr6336631f8f.21.1750847630882;
        Wed, 25 Jun 2025 03:33:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:33 +0200
Subject: [PATCH 10/12] gpio: syscon: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-10-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4222;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sjfHOc+5FIElw6Tn67jgDQmefJjmNImROrNF3EFqBFg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9CA83SVJti9vEV1Z0Jj0mn5RsqIkTfAL4+Q6
 qHpliBjLBKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQgAAKCRARpy6gFHHX
 cmakD/0bM1j6L2o30Tp+dbPHedW5MlBncI7X9OnpYlO059zCAtX6weW1EA7auFfb0pdgDrfc8ju
 9P5nzipoqm1g9uh5EW5ZdT7ZJoaL0KAOfmZNC9NMTIotgDYZkC/9K7W7ZJtXNYQiofJYV47yCOZ
 kL4vOnVBZPiaEyKO0xFm5x7OUnV3dVCovfICjZ96PuxIInIlToYVDkR0g30XRN2sigYYgNdtCIE
 kerUi0WQNQt5yS4+00WCichtEFr2W/q6AlgHPAoQ/WLm2q1Fs+eUj6D2HCIVFCfNXrMepgTYmHZ
 FdAGaF9VjhyPnlgQ0zSGcbmIXVlYkf6+/iicvTtJDzo69K4mh1b17ZLpIqg5UMIqOx7LjhijbfO
 JyQfwsyWY2rZafQjfgE5FrfPlKPGbzs+EiYzCdlYrO0mlbq4/UByZXeNRZ3LOOWOcou8CZQ74kd
 XPDPaP07F2vdEPMHkbRs2gfZ9dfQdnayC0IIQnzR13Sh5nrdUW2YtalxOl12QBXSWNfkCsDRNfW
 +F2WqxK7s67FsSnl+Id/m4j6wu+PqYDnwxHKdTXsaXCw6dCmHAF8J2qY3udEZcemFhsuR3Kwc/g
 2RQ1p2buy65m4uB9eJE9W4PHCBI/Z8niJDMCY/e9NZMH9aqqOAj44pwau4RDrH9m96Q+0L7S2pJ
 vIUv+bZN/Ve660A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_033352_932897_4324BFEF 
X-CRM114-Status: GOOD (  15.00  )
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
 drivers/gpio/gpio-syscon.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 5ab394ec81e69beae2080a3ca7ecf35868e79abf..f86f78655c2420ef91f1248653b4943b5d8ed1c0 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -40,8 +40,8 @@ struct syscon_gpio_data {
 	unsigned int	bit_count;
 	unsigned int	dat_bit_offset;
 	unsigned int	dir_bit_offset;
-	void		(*set)(struct gpio_chip *chip,
-			       unsigned offset, int value);
+	int		(*set)(struct gpio_chip *chip, unsigned int offset,
+			       int value);
 };
 
 struct syscon_gpio_priv {
@@ -68,17 +68,17 @@ static int syscon_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(val & BIT(offs % SYSCON_REG_BITS));
 }
 
-static void syscon_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static int syscon_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 	unsigned int offs;
 
 	offs = priv->dreg_offset + priv->data->dat_bit_offset + offset;
 
-	regmap_update_bits(priv->syscon,
-			   (offs / SYSCON_REG_BITS) * SYSCON_REG_SIZE,
-			   BIT(offs % SYSCON_REG_BITS),
-			   val ? BIT(offs % SYSCON_REG_BITS) : 0);
+	return regmap_update_bits(priv->syscon,
+				  (offs / SYSCON_REG_BITS) * SYSCON_REG_SIZE,
+				  BIT(offs % SYSCON_REG_BITS),
+				  val ? BIT(offs % SYSCON_REG_BITS) : 0);
 }
 
 static int syscon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
@@ -115,9 +115,7 @@ static int syscon_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int val)
 				   BIT(offs % SYSCON_REG_BITS));
 	}
 
-	chip->set(chip, offset, val);
-
-	return 0;
+	return chip->set_rv(chip, offset, val);
 }
 
 static const struct syscon_gpio_data clps711x_mctrl_gpio = {
@@ -127,8 +125,8 @@ static const struct syscon_gpio_data clps711x_mctrl_gpio = {
 	.dat_bit_offset	= 0x40 * 8 + 8,
 };
 
-static void rockchip_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			      int val)
+static int rockchip_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int val)
 {
 	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 	unsigned int offs;
@@ -144,6 +142,8 @@ static void rockchip_gpio_set(struct gpio_chip *chip, unsigned int offset,
 			   data);
 	if (ret < 0)
 		dev_err(chip->parent, "gpio write failed ret(%d)\n", ret);
+
+	return ret;
 }
 
 static const struct syscon_gpio_data rockchip_rk3328_gpio_mute = {
@@ -156,7 +156,8 @@ static const struct syscon_gpio_data rockchip_rk3328_gpio_mute = {
 
 #define KEYSTONE_LOCK_BIT BIT(0)
 
-static void keystone_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static int keystone_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int val)
 {
 	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
 	unsigned int offs;
@@ -165,7 +166,7 @@ static void keystone_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 	offs = priv->dreg_offset + priv->data->dat_bit_offset + offset;
 
 	if (!val)
-		return;
+		return 0;
 
 	ret = regmap_update_bits(
 			priv->syscon,
@@ -174,6 +175,8 @@ static void keystone_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 			BIT(offs % SYSCON_REG_BITS) | KEYSTONE_LOCK_BIT);
 	if (ret < 0)
 		dev_err(chip->parent, "gpio write failed ret(%d)\n", ret);
+
+	return ret;
 }
 
 static const struct syscon_gpio_data keystone_dsp_gpio = {
@@ -248,7 +251,7 @@ static int syscon_gpio_probe(struct platform_device *pdev)
 	if (priv->data->flags & GPIO_SYSCON_FEAT_IN)
 		priv->chip.direction_input = syscon_gpio_dir_in;
 	if (priv->data->flags & GPIO_SYSCON_FEAT_OUT) {
-		priv->chip.set = priv->data->set ? : syscon_gpio_set;
+		priv->chip.set_rv = priv->data->set ? : syscon_gpio_set;
 		priv->chip.direction_output = syscon_gpio_dir_out;
 	}
 

-- 
2.48.1


