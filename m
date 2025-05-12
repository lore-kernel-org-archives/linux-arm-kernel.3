Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A29C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjdqA5SphZm+l2ts69ztB+ZwZbqHkrkuYbQuDIwGCqA=; b=VKrrF+m5BBF3dxa+Tm96OSjXMw
	63SHMNa7lERe8FgYVPKiXFv1FvM6xdfEIZb+svfipKpAxzfUlZ6dm2h4AkcXJJEdvO4jjkVOzyx8m
	/AYjGAjLjVHgLOTHgir1TETGsVf613t1cbs5WDrBWSYLXgXSznC6mS0fBkErdIsxY73BlhsFyvEOJ
	YBMgUjTuC6+cd9yXJYa+2hxpdW/bLQsIL/s6ON2aYzhavUozUhin4qKymwrRjN8lT46+90BcFD4Pj
	3BpecB0OFs+/cKMbk4HmPZJYONyP+fiENlduExtN3xwDv7pQa9HD+WXHJF/x1khMe3yeLwDYBr/Zh
	Ss6k+9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUVI-00000009ndq-2Lqd;
	Mon, 12 May 2025 14:51:40 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU3m-00000009hpD-2Ef2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 14:23:15 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5fc9c49c8adso4389246a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747059793; x=1747664593; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjdqA5SphZm+l2ts69ztB+ZwZbqHkrkuYbQuDIwGCqA=;
        b=PX9HVgVkRzSRVsnu/FQSrE+uklOSbcAnzgnzoIZQWvMli2XKyTKtWuU3gCrHebgiBL
         GQuK5WjXYg3yMKNMNUOqmn3B/slE/VGGCQRix56WYGBV0iBNukygYzegba4p8umAILpW
         tdPMle4TJ/A+ZEYiadsRs35ZQo6uULS9wySHV/srThiu67tZBM97TqIcMZWf1ah/ApBK
         BwL7c0dOXjV3cn+b4DZJc0jB/jlqez3tUb4eKM2+yW4jPGbM3MKiCkDWLjNg3x1352zM
         sxdd6s5ASz/55ugyMPohwWt69+AdxvFREq1ZwLdgh8rtxaCPFdBkAzq765sOJX3XxzRQ
         mIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059793; x=1747664593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjdqA5SphZm+l2ts69ztB+ZwZbqHkrkuYbQuDIwGCqA=;
        b=mIXoXWUC38NiVIzf/TnfXa6lxI56F2mP05P1vBns88OHJxIPxNlJw+lZOZnaRm9jj2
         zTgb83TRRjTJGzN/ubQN1DEYwJIR7OCrGdwEM3MkRWZR40A3TsuQ67g7dvRQ7NJ5AUfY
         FsFk8Z3Apxli17mY7nJoY394+dsB2ZOmYOshRCukTQdeKwym4X403Upcx3s0CnWCw7zL
         Hu3fd95d8Vqyhxa8N5N3tYCheWDxn3dVJ568ENIZLrfyUFpuWbQO2WKgWZp28QXUOJee
         bnpbfNJEzZ0dzF3AcpLHI1I6lYi/4zLbW7LydOpVf4k+fzNg4H7bJKuUZpa6tBCCUZoE
         uivQ==
X-Gm-Message-State: AOJu0Yxodvd/8OmtAguVfErjwTHmnUM7Y//EvsGdpHhuGgyWIG4OZu45
	lbcPuGeBQTPM2tovVw8ZVGqaaegC5TGD9S0R9pC33SH3Z+SkoBHyjt87qQ==
X-Gm-Gg: ASbGncsnNYLy/HMnH5oms6lZ60JjrJPXonIer9fSky/b1eerswM7lacUbK4Ssg1qy+a
	5BV8Aih4qN8ifVW983xsOQsq86+LOYY/1F9tmni/OcvwzqpuDUpxQoH4kkAPDXTGdUiEqkf9bZ4
	p5YbIo1wHslqRrXJv0yXrGO6zZviuW+ww6cSdDTne1MeaDjtvgHpHlR5nLJSDk6M9ZZoh/+dxAf
	1mXQ5MTa9J97AMtWrNWmi+E7GeJl82oM4st7rSjzNzF056seqnamzcPy0oxDbtgBJxtDdQ7Qefz
	DvidiNGpcvo2hmTb6czh+evpmtBh3C77GdwRH4slBRmIzcQQdkY59TEDz5r6aw48vom6GDZ4urH
	Ksj/bgDggsdYki5A=
X-Google-Smtp-Source: AGHT+IHY89ib1m+RqAiIfHD1t0Lvi8Km0tjdoUyONCMCestwVPtVg38jm6cI4xiUm+sBXYxZlhwWDg==
X-Received: by 2002:a17:907:7a8b:b0:ad2:3fa9:7513 with SMTP id a640c23a62f3a-ad23fa97742mr725361766b.46.1747059792642;
        Mon, 12 May 2025 07:23:12 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197be0c5sm619626866b.153.2025.05.12.07.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:23:12 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 12 May 2025 16:22:43 +0200
Subject: [PATCH 7/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_pmx_set_by_name()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-pinctrl-a37xx-fixes-v1-7-d470fb1116a5@gmail.com>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>, 
 stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_072314_583798_D73AD36A 
X-CRM114-Status: GOOD (  12.27  )
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

The regmap_update_bits() function can fail, so propagate its error
up to the stack instead of silently ignoring that.

Cc: stable@vger.kernel.org
Fixes: 87466ccd9401 ("pinctrl: armada-37xx: Add pin controller support for Armada 37xx")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 18c6c5026b26c294ee65e3deea02d2e852e10622..f35bf0cd98c97419ba0ab0291a23d4774a595d39 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -358,9 +358,7 @@ static int armada_37xx_pmx_set_by_name(struct pinctrl_dev *pctldev,
 
 	val = grp->val[func];
 
-	regmap_update_bits(info->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(info->regmap, reg, mask, val);
 }
 
 static int armada_37xx_pmx_set(struct pinctrl_dev *pctldev,

-- 
2.49.0


