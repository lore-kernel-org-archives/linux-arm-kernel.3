Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE91C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 15:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqgCDDArZ572FHUpAzhS/HBREsxxOZb3IuEva34YUxA=; b=foBEux8ygAxpuzCUeDIKtF1ATA
	m9j6e8icroASzILYllJlZztKMk4HEooxhkTFrqDSphKgn0NUEKN7D1puMHpqrGhSlJAThdAwBR5jd
	6lNNq+i0QQPoQfaIX62xPs3rydcwhwLkDzVYM00ly3aa2l+B+gvlolneN7zJ0W9mi6dYfgp6FLPY/
	aL2Uveb2TkBN6n+EWyzkQGgwX158/iYfaacp0qqmEQ3MAES8IHFwmMVhDnH4rFw/6raDyghbikSFb
	pehrWci/Oyt35JSwpsCX288dimZtJgFSc3vi4J9aQWvx4MvgII1RSfX8yaWrt2wDKyOZ8YyXAWboq
	9Qg/FSpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1IS-00000007O2O-3mGq;
	Tue, 10 Jun 2025 15:53:56 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyFj-00000006nXh-3jAf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:38:57 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so1694446f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559134; x=1750163934; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqgCDDArZ572FHUpAzhS/HBREsxxOZb3IuEva34YUxA=;
        b=DgqxPWGOCxGNN5GEW3M2xiOl/9d/vtjI6nGNsyO8620eDULZw5cOD/J9PpkuJpYAax
         fOf15D/MFDNDem1L/jEf4rKoOLKtIPDVe2PfxT5tEbiBPS2wOMU8Z8EO1Yl06aLM6WPt
         DTNnZpOD6HV3D/lmvJ4xlUu1RAAtffPlm+CAbe5jkdA9dgpySMLahWS1bkdAiXe4zjeo
         d9rcs5OX1V0LC34nJUmhaapP/tWFmQsyrlro0RzfYCvJWpRLdajrekiFbDzDf7t3g/BR
         VOzLz+6u+MHGjOqrbiJ4qpRlJy4aV2567Wtv2RjMecS6PV1yoKeU2P2M7XVTKOk8MF/I
         nWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559134; x=1750163934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqgCDDArZ572FHUpAzhS/HBREsxxOZb3IuEva34YUxA=;
        b=UtUZJKyniIHkN9ipLOxO8ZsYCLsFiK5WvCtNQ/DUL6HeGBlPkJwsCGLe+EqLP6OhjI
         YBH+mKV7ra2a7ZXYLD8cfCQdgUIB61rDSaWqm57uQw/p4zSmMHW0XIS0nSPfZP99eOQd
         AZzkkIZelgai2Bht4nQM4eLtot2h7PF9o6gU81Bf0pNJqp6NoG2A95GKfONDhwgrY0oj
         QsR1IIGNRa1gO93JaU9P52NGXdQKdBf16ZY1XG1ozo+USVzenm7bNv6KZkIuGiT7vbhT
         4BHiddb7dAR6NgKJmashBh/rRu5UAZdar2C4z53ZKjkjDMbFvrlVVbCxGR0XM3t7qeWS
         ObdA==
X-Forwarded-Encrypted: i=1; AJvYcCURtt7Z220GcIQpMwo4MaRJsrZIKYsyZUfZEfKrLlqqC7WU/A3b+rvV9xPN+pHRssV+roTvLRm7/W1C5cJ8va6b@lists.infradead.org
X-Gm-Message-State: AOJu0YwGFxJYZfFM0apQVMk/CD74Hmg2jweCa0YtcQZi3+1LPiFoV39I
	ofp0d/dpQ45R1LvdVIpFCTY6/XerMx3JzIYmVkSMMRVH1DToEivMU5GmIUHuQNoJ7FcvTZ4yiMn
	RP76j
X-Gm-Gg: ASbGncvtr3uBCGls9BDJ+V6olSSzmo7iO69bSK18aAR2/jDF8eUQ8rpMfoFgAldZ9/i
	h0TYqqOPOBH8XLe46rMsjJcWTEKd7BeVZsNwk2esHNp9r35tJqrRtuA2qKsKDE1bLe+6OwWSIOQ
	biBHSpcA+j2+S6MdjJq3RQRmEgCy06Hh9JV1iwSBNnSfzRQ81T/orf1O0uWCw6ITY+xgsp4hxQU
	A3FV2wsbNqXdABPcxNMK1DXLTLJVufcCxQSpDWKzaB9gaj2XU/hj4QeyAEIYhP8wdQxUlkD37RF
	gQ0XDcYGUTuRltYHulT2C/+C5WSRDyWUJf1HQMuwRdl749+59O3D
X-Google-Smtp-Source: AGHT+IHlB1y0ZjbgeXpz76d2couim3mNJe1/2Uc3w3RVGOP5uqdDS0LfEGFNGp3xL5kvkO0RqpYjEA==
X-Received: by 2002:a05:6000:2408:b0:3a4:ef30:a4c8 with SMTP id ffacd0b85a97d-3a5319ba543mr14280976f8f.10.1749559134071;
        Tue, 10 Jun 2025 05:38:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de7csm12374676f8f.14.2025.06.10.05.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:38:51 +0200
Subject: [PATCH 2/2] soc: renesas: pwc-rzv2m: use new GPIO line value
 setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-soc-v1-2-1a0c36c9deed@linaro.org>
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=w/R5FPd0nERo4YQWYIn9uu2U38SBTYgN/a3aiLLK2Ck=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCdbhUtX31m+OVwib9APVcYmsABA0x2/6gKsR
 TJYlbULcYuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnWwAKCRARpy6gFHHX
 cgTtD/4kqsZtwhCB7vQ7MmMqpUwLdHHDM6gFISObV14Szp9iMSMPUAyuo0Z78c9gILfz4rL1An8
 Neap+Q/me8JIAApLU4droApbvrB0ktvlH7jGqcjAmn/VEinrHo0ykIA/j1Qgaibsuk+1JlxuBSj
 5iNN3lDlp47ccDM+4EUZ9dK2rty+L1cDfepGeIn0tMSgR6lr6c75u6aoApy9C3H/pAY+ArmWwqw
 eStPNXUmtMGQ7ljd1E0SzkuD8fawtnS6fxAArCS3tUGWvE7ZwFhbC27Yw914vQ2qs3peHTjeFp7
 gMoJx9pLB1GGYC6kGjCcB+tLtkp8Eqe+eXt+IR/HO5EBfyZvrYzb1+GmTcn1i4I4T5XrXkSMOqR
 IrBgs8MJkCFVXP+ayhvNg6r66aicYjl/YNQx20/x44kiOFq5f5uYYafWo4IOvJebQ+SM7xmqj/n
 zeGsPxUFwnlMiVZnrIOfcqxrduv7SCGzKDo1cbgsv3Qo0lL3tpy+YTUhjSLKa+oE+FAd8A7ImkM
 2MsGkCOaAwB7dQpOjoRGsYPDgidCskOeBaFplQqCCuhH04Q17iEzNkhqo/QMnAeLW3vINUrHGKf
 kjzMUw+07BnrOkdsmPPCVGOiBRD2lzYCAhrZZ+U1VYdWMMNqENHqs2JwXT7sJ36zZAWQQA6Cv4n
 Qout1IT46h7Aujw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_053855_949456_E56E157E 
X-CRM114-Status: GOOD (  13.67  )
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
 drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/renesas/pwc-rzv2m.c b/drivers/soc/renesas/pwc-rzv2m.c
index 452cee8d68bee7d04e7acbee6bd90dab457c77c3..4dbcb3d4a90ccd2796e26d6250aa246b32b09285 100644
--- a/drivers/soc/renesas/pwc-rzv2m.c
+++ b/drivers/soc/renesas/pwc-rzv2m.c
@@ -24,8 +24,8 @@ struct rzv2m_pwc_priv {
 	DECLARE_BITMAP(ch_en_bits, 2);
 };
 
-static void rzv2m_pwc_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			       int value)
+static int rzv2m_pwc_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			      int value)
 {
 	struct rzv2m_pwc_priv *priv = gpiochip_get_data(chip);
 	u32 reg;
@@ -38,6 +38,8 @@ static void rzv2m_pwc_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	writel(reg, priv->base + PWC_GPIO);
 
 	assign_bit(offset, priv->ch_en_bits, value);
+
+	return 0;
 }
 
 static int rzv2m_pwc_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -62,7 +64,7 @@ static const struct gpio_chip rzv2m_pwc_gc = {
 	.label = "gpio_rzv2m_pwc",
 	.owner = THIS_MODULE,
 	.get = rzv2m_pwc_gpio_get,
-	.set = rzv2m_pwc_gpio_set,
+	.set_rv = rzv2m_pwc_gpio_set,
 	.direction_output = rzv2m_pwc_gpio_direction_output,
 	.can_sleep = false,
 	.ngpio = 2,

-- 
2.48.1


