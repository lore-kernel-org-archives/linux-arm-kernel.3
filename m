Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9B1C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 07:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dk2490V7toxDqdX6m2bpZwWhZapb2e47P6mgRch0L+A=; b=AxKR/Hsed7FBz3duxEfx9zW6dQ
	ni+dWDU+7r7aGZVL/iUcPL7/rldkZ8nklPfRAL7GEwyWVvLBc9Tre5W903oBS0CvRSVTEj2NJPSHE
	b4ZzN2n3nm8bgUsulfxlxzmpCdz2lLseA9dBF265S5oAmJgZYWwy2S1ht3fcTIcw8WDd+1oDuxGnd
	MGfzA3HO+KtEGYYcxbAviYoW6iRChRUIryOogPB5M4VYhy92/kpROZarX1BXkCeqW+8BKnoWceAAC
	2bXGzSNi81F/RZH4TEOroTPY+wy/2Zf0RnNIKX44HmL1bttCoCM+7HqCnKbjyKkEw6Gu9omZh2JN8
	MtIX/ggw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4WN-00000003gU9-3rxW;
	Mon, 16 Jun 2025 07:44:47 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4CZ-00000003dIz-0rPf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 07:24:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-450cf214200so35585325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 00:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058657; x=1750663457; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dk2490V7toxDqdX6m2bpZwWhZapb2e47P6mgRch0L+A=;
        b=SW85icgM7GDB08j0agpj9F5w7DPKP0r372p9DYvBox12bqUC5svTk382RPYab4i8+i
         9eFMOLkmFeC+DHYimW+EsB2mIaF15jnX3OObU03vJV2KNh1dA+a0mjhiYgt0NJvmjBuE
         kqSNoS63QWhJ+aj5JU5h8sc0sAgV2TSfyaMmj/RSmlV/m6ndvE3Pqvnn2PF7KyMmVd4G
         nsm0+lNrKNs61uOmXc1fZFNeKl2VnCIMOFnC7AcP9OJPobyv9LAIUhKw9DlNdYvT6OGl
         L1x9i+xLGessayzBPgtV3imDkHgPkpjIYUEapmxoduQCdVTNDyqWqqz6TOdZZmCL63wk
         DEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058658; x=1750663458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dk2490V7toxDqdX6m2bpZwWhZapb2e47P6mgRch0L+A=;
        b=WRIyJEGizJIosGBC8i2zvMESlaDFb0zUh1Lb1NiQcYdRV16fZF8FkHF0XAyRHY0om0
         2tdEFaobAu4CdCDuXIAbxren3WMoU+tl/Jwq8gYxlqMC2nnBBgBDjndCzWaSS7FlfIZc
         3oZaKWks7fDs8sN8CLChADLsCvc+IZKyGMy/C4b7koO+VsorCwj4zA3m1n+x+lH2mVu9
         7DXWAyax809ev54DK2hNGCupqfPRlnqTWLFNTTbXlOpHPhHolyTpF6glKj2N1VJBKDIZ
         +/cH1s5b6j3JJG/nBxMgjav6CN/tXkLBRtkaVXFfb+BtaiH9ooWyb8xrz3knVAGSpfly
         N2bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf11T9cNnslnsUIV4JkLU1c30+UkYsrpUmsse7w6OtSGSugjTxaXe1s3uYqG1JJjXw0H1TnzfsPtHRN+cpQsA8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0dSZ8F8ZalJtvGga3d4MbOlQxFaeH6kb7+HgM0gdN+JdLNiUs
	kC1P3uzIHvdhHE54zT+YTdn/QP/E3Q90nJQqb91NDXvBNdSVaQKE7FLb4zXulCkQshU=
X-Gm-Gg: ASbGnctI3eSxFe8xw7PKjIGfDiupr2S4yPDhK91u4fMv/pFz2J30Fr9l1DgBXisHjDO
	k0e6pT+SRdd+x29GXGmOPTvflzTbbmw9UQB3VcbBIaRQC8XX1BHIdvLkVieK0aDwGceIXmy+DVF
	Z3AWUilnN8mPyV0XB9/7ioTdSBAUijJIpxpQ9BaN126ZA0zb4HYcxK5GJy3exmua6frxINzRlVL
	HLu9QLHgykuYuL8/138haTxKDAiprSEAwnhhQHTali4YEey5GNTP2dggd+gcfE649BG+PUgkC1m
	r58YhI4Tn0s+Hxq9zWdoLIMT5m//PCt6EWvlWZiWi3SUBrSdzdA2aJ93
X-Google-Smtp-Source: AGHT+IHjTITSdrkkTH11GT/+EzTBq3NAlKsV/J8ox/RCJxKJGn5B+8SotQM6qAKPmFBSZqyU8wHWmA==
X-Received: by 2002:a05:6000:2901:b0:3a5:2f23:3789 with SMTP id ffacd0b85a97d-3a5723721acmr6221770f8f.15.1750058657595;
        Mon, 16 Jun 2025 00:24:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm10312334f8f.63.2025.06.16.00.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:24:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:24:08 +0200
Subject: [PATCH v2 5/5] net: phy: qca807x: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-gpiochip-set-rv-net-v2-5-cae0b182a552@linaro.org>
References: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2068;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=902geVroxqYNedJuDkhJncS6CjvxOYP3g9PjXCsT2tY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8aZsS4bPVXRFW8hbhc2HST9zbVAikAosjSbI
 VX1fc56BVGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/GmQAKCRARpy6gFHHX
 crs/EACb+XZ2NzlhRTyZfKfSIMQTWBEOV5YlX+0P+ziYYneyaZfSMCBPUdEJBK484XG1I1qHbJv
 Cmm6pNOUfA/aS3PvVVLRpFRew4lHAGNBxWMwkEDMdr4R3fLHomhTENRC/o5GlosvQbirXlm+YZ3
 xl+ulmmLLqnxVo2rkU85w+4KaCvAZQWOWrGHjCmP6qbYdLh5UvNbq7Adfu7hvuaNn7tPTdVrvCP
 gpod/ON6nr2S48R5ssyepgil95lcxK+GL883CxVhFpYNBxXswOlUjmb6dhEAAQIs7lz0k5I4Vfz
 hkDI0NuwjjNWG5VCXCF1c6rDyDn0MZNaoQTxhuAlk/RzIoE9VW8n/mTzISVQO3uI4qq7LakfmQa
 QmACdUVNQJcVF/bhdLfkbTm3wYlVcgj5cVhg+D/6XuIyJ30s8VfVltAyuh8+0HDtqRGLJ396pNN
 gK3QIS5FwHsvtDIEWoswl/DsYodSNONEubXFnddYuM4SvhMHM1Oj4EVkC3F8Lx7AVMGpeCu4Rnk
 e987RhUzSpX7bPmzdtASZSflEpbRKe5vESs+ZXkMWWBo8qbfL4QEINVH4IpN2b82fUmSAUTKXns
 XPxhjw4a+Gggh9ujtD6GzkOXQbxq2Nd+85WregsI5+tVUQXeGUsF4WLG/lJKPiGKSIEVaGEXZVp
 SbeagtT3GHBmMPA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_002419_303935_5E1539A3 
X-CRM114-Status: GOOD (  14.09  )
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
 drivers/net/phy/qcom/qca807x.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 1af6b5ead74bf615ad155e396b0ecc6fe5636e8c..6d10ef7e9a8a4d906ea3a7e0d73087e8907be9c4 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -377,7 +377,7 @@ static int qca807x_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return FIELD_GET(QCA807X_GPIO_FORCE_MODE_MASK, val);
 }
 
-static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
 	u16 reg;
@@ -386,18 +386,19 @@ static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int valu
 	reg = QCA807X_MMD7_LED_FORCE_CTRL(offset);
 
 	val = phy_read_mmd(priv->phy, MDIO_MMD_AN, reg);
+	if (val < 0)
+		return val;
+
 	val &= ~QCA807X_GPIO_FORCE_MODE_MASK;
 	val |= QCA807X_GPIO_FORCE_EN;
 	val |= FIELD_PREP(QCA807X_GPIO_FORCE_MODE_MASK, value);
 
-	phy_write_mmd(priv->phy, MDIO_MMD_AN, reg, val);
+	return phy_write_mmd(priv->phy, MDIO_MMD_AN, reg, val);
 }
 
 static int qca807x_gpio_dir_out(struct gpio_chip *gc, unsigned int offset, int value)
 {
-	qca807x_gpio_set(gc, offset, value);
-
-	return 0;
+	return qca807x_gpio_set(gc, offset, value);
 }
 
 static int qca807x_gpio(struct phy_device *phydev)
@@ -425,7 +426,7 @@ static int qca807x_gpio(struct phy_device *phydev)
 	gc->get_direction = qca807x_gpio_get_direction;
 	gc->direction_output = qca807x_gpio_dir_out;
 	gc->get = qca807x_gpio_get;
-	gc->set = qca807x_gpio_set;
+	gc->set_rv = qca807x_gpio_set;
 
 	return devm_gpiochip_add_data(dev, gc, priv);
 }

-- 
2.48.1


