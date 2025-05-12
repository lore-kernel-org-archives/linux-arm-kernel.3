Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C9EC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gAHy2dqHD8XlNE+NQO8OdbzNGj6fStBzDiksNNBgM8=; b=UyLKnYtJbhLltpBBIvm8ha8deV
	y4LVMz0YTAmkV2mgvtZh9FrmwyVvq1rK7p9Odre2zLGd99v+N8OQsNHYfkEu+r2tUzDuldPkZqTNq
	4Bjthcr5TdR03iWNtWxRlXBEGq7W6oy1XN0+2IWYGIdKNVFJDyg4AQQeZ3yA0ycxLeFUfovMJYH+x
	0Szjgpt+E1hHnCgmZIJTDvKD/Lp4Niq6qIipsGZbPdI1H89QxBL6Av0NgSDEXlqxDb/WZHLBy+qPR
	8o4PcR2/DJ0STQ3170oWlIx2qcp99wixjuroanjwsaLgJFUR0o4QfLIit1HMq1Tm/vHO2obxzHykX
	48gFkkDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUXN-00000009nxB-1ccW;
	Mon, 12 May 2025 14:53:49 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEU3u-00000009hrS-0DXb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 14:23:23 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-30de488cf81so44864681fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 07:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747059800; x=1747664600; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gAHy2dqHD8XlNE+NQO8OdbzNGj6fStBzDiksNNBgM8=;
        b=gv+gHIUs38FX147xKH1Fzj1o1fakQivSzFo+QpBFZSpOpAC/0srcgaGG1mdJZGhE2Q
         hS3Nj0FTaoasfotLxjg08UMORrmWay+EDCoG+dZwLTBoY6pt5vPmSuJMSO063OokrrYT
         Z+ceR/sfwXDi6MHTfRJKKSHUqrGrOEMKKpCGIPzj1ewQ1ekQpXb6McEl7EUevIGjRX/Y
         PtDVKkMk1Vi7aBxD4mioWTSAnCzJaz5RNrm0X5zRoxUJGY2TlsCgpVfchrdt+Vjkh+uW
         GCOIoHkUFMseoZs/HL6IHxXvgN0XxvS6JNa3stEWUz78x0SNyNyG40O6ArEzx28TUmSM
         6RGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059800; x=1747664600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gAHy2dqHD8XlNE+NQO8OdbzNGj6fStBzDiksNNBgM8=;
        b=SlZXMhgQPdkKf34YCFPM5yuzX92Vty6ekx4WSLXMTMCMLTy9rvOWE0Nl7v+XLRnU5L
         XPfI0N3hNpZEInUL3nwpPD75FGDh3dxBZgAYA/dJIbRpftTQZi8X+65RNrgp9WC2INOs
         +N+/t4vjCrjBCBll0XX17UmZiQ33Q/JTFrcYwDvHoRKpg8NcFqwcAUViia58e5IsAwVI
         lkNZN8W8Ed1jahaeZXDbF3oBA7PbagVgibmuS5SYkpxxqrVy3ywO9HCXTsBzXeWKA1Gw
         DyQBc5LjfFY60ZNqCwX3kuaciIyNqsaC+n+beoeQ7GFQXOwu2JXxf0Ib7iE2plrU5Ndp
         CSzg==
X-Gm-Message-State: AOJu0Yz83hAhPxt0EqQVvWwVJCPG5VmW9m1oD7ZZv1NobpVT734tH2Jn
	PqozWRJzPe9/21hjWgftKTdU9BZep7a3mXHyjAzhpSpc1Odo/bFaba6w6Q==
X-Gm-Gg: ASbGncsFgwoUDzUvx0htvMXarfmP57ZQ36uMzsPvQVe0r853xLe6Zx64DSGOiNUDcRk
	/oHqpkdCereZxXpeogDhPfs8liPmDvb28fr1R6mcM3ZD6ePnpEPvuqfIUZz4fsUQ/i2PBhQW+Wq
	EiFRUCF0Sbt0pdTQ/6y5674rNba25mcXPzvA+b0v5gsT2UeBnSRfqJvU/OxicQ1jRVrwNObnlPM
	6Tv8bOljtXF0KOTAFxL68xumOoZ+52C2nd7zWE2umt/pTCL7Nf9g+CMxm9R0dDgzxfqj1VC8jeJ
	V97gGE7ze4yO01inGAHg399PTJJcnGr4KrVGQNeU65SzUmaBjBl+FjkDtjwB/wMEyiofwGThW8x
	YGDte
X-Google-Smtp-Source: AGHT+IGgwLVhY4Dppc9nKpM99+nmIcpUTBUiHOn5t/pN1WR9JabBYoC8Dok1NUb/mKsm5Hmdd7j+iA==
X-Received: by 2002:a17:907:613:b0:ace:f078:e08b with SMTP id a640c23a62f3a-ad21916975fmr1032950066b.47.1747059789964;
        Mon, 12 May 2025 07:23:09 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad2197be0c5sm619626866b.153.2025.05.12.07.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:23:09 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 12 May 2025 16:22:41 +0200
Subject: [PATCH 5/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_pmx_gpio_set_direction()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-pinctrl-a37xx-fixes-v1-5-d470fb1116a5@gmail.com>
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
X-CRM114-CacheID: sfid-20250512_072322_099126_FB454FAE 
X-CRM114-Status: GOOD (  11.73  )
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

The armada_37xx_gpio_direction_{in,out}put() functions can fail, so
propagate their error values back to the stack instead of silently
ignoring those.

Cc: stable@vger.kernel.org
Fixes: 5715092a458c ("pinctrl: armada-37xx: Add gpio support")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 2e88a0399d1a205064b58890db6477e2202bf311..aed0069b085ced5867993e95e0244df7ccda556d 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -472,16 +472,17 @@ static int armada_37xx_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 {
 	struct armada_37xx_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	struct gpio_chip *chip = range->gc;
+	int ret;
 
 	dev_dbg(info->dev, "gpio_direction for pin %u as %s-%d to %s\n",
 		offset, range->name, offset, input ? "input" : "output");
 
 	if (input)
-		armada_37xx_gpio_direction_input(chip, offset);
+		ret = armada_37xx_gpio_direction_input(chip, offset);
 	else
-		armada_37xx_gpio_direction_output(chip, offset, 0);
+		ret = armada_37xx_gpio_direction_output(chip, offset, 0);
 
-	return 0;
+	return ret;
 }
 
 static int armada_37xx_gpio_request_enable(struct pinctrl_dev *pctldev,

-- 
2.49.0


