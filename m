Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AE7CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 11:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=; b=IgaPD9j9Q/SrrXKQu8cRgn0d94
	5sh0/MWAJdNDC+F3p7htz+Xcesso17tCyWRZqeaVi4C0L2AUkMAudEIizberXmp6B2UTP893o4BtN
	OIXo1GU0jz9NSMgZoE680OCsmGoQr3+8cH0Rk+rmV3uY/a69h35vS54A7Macwhrbbqs2vjEgqwOgB
	aKzQSAFL73fWWfEaYDACRHFeCgUAThKS3+RLOxXT8XhIYPn3yADb2ZHFL7r4ji9kPursD8eFvSjbr
	1jh05dQUelcaSMt3euFUNAxlu1tpFStpcBuHMbIFoJfW8RnyPnBxuf4KWuJlCo2HK//yW9qa85jX8
	9wCu8Rdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVaF-00000007n6I-0NC2;
	Mon, 25 Aug 2025 11:41:55 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTot-00000007YCH-2DAB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 09:48:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3c8fe6bd038so526316f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 02:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115334; x=1756720134; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=;
        b=go5ZH6ejtyP08W05Rk7VLb+NCV6J0i+8RKuN/wGELZfNxixh4lR5ImM9pgrfh2ET4D
         NSmGGWcgjwzYi/8KTUaXJSOPz4d0MwlsLbIxYvipx/3a8Ys0xNtHhILxKOmgIe1I9Wwr
         PGgnYuiCVRHh63AvGuocXFdKmE8zv+1FRio5QzKilmlEbcDiLZeJbyBrwyRvfDWpVw1c
         oSjGgx3oz35fUbGrTNUQwC/2ryR/9/IfCQ6J8UwO1QkVmKNhUWcnlG6vSYgE3PdHaad/
         X9sWDTUhpf2smG5+J1HxfcnY1pFgKoVzzsF3/PLK2SSvW/9SJ8bWNPLr3R3FzQ54X9dl
         pyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115334; x=1756720134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEezOkT0DMYtBQNI+88wui4CFNSwtPL8noFajy31AHM=;
        b=OlST8qISvXT9IScaHuC63dHYtpcWQq/JG8Mjpz01kUUrPjAfDkdisC1hJQ7PfLvWU5
         KsdSqpUtnA5LyM+uKlExM4UeIIk8OdnG2f2FqLcDEqN2iWW+7O77xVkFhnkrrUz0tCs4
         5FoL/G67Q2Q3kQH6EKWzcYd3sXf34XXOMtiPOFdW+se9Fytzz4bVbOITC/qo7M/8B1IV
         5hoHf398CCutNTkGROhTNsg4Yq5etrDuuDbon0DuyotmGSxwzWYaYOYXNku195DTi4uf
         Y67RDwyYvXbzBLCk0i2wNClbAzK1T8o0vfQSl26q3OMHwdqGrWO+T4uv8YXDmaOmjUUX
         m4ew==
X-Forwarded-Encrypted: i=1; AJvYcCVYMfY9J46hh9R69IwjCJXNvMFoKD77lzhkpYaY0mP8saSTetXOBtSU2cKHXRGUBoEwv+LW6Z1f75YakdvY9uKS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7jvdCJ6bQIkwIpneW3jC4t8AFzb2MtpLHVO7mo+R1DyNFR3Pl
	SLNEHKKCnVrAEVpfjrLXXA3aMdkuy6OGv//6SLJ1bl093e1GPCZ6i/UyJcoB6jepUUg=
X-Gm-Gg: ASbGnctRw7wQqnxxIZmHGXMUV3OZi6YHpVwWI/rsoT62nF8tAkIQ69l7iCb7s7Ms9hR
	xWg0JYNYAQJMWvFG6r54pa0os5mhU6SFHNLNIvoW2AMvdx3c/qFQ14QVoifuXnKTr83YtIDoMRa
	SNr5w5WNXcY39TJTz2iVJ+TTQnDRBMx6/ZPf2pveAS+R3BtPlkGoPYFK/v5Bjv03CixxywDdj/Y
	AUcTB2L/jq/5eeWMj5BC9dBoJvEn7wZoIEbSzAgCdVTxx5VySQClviKVxhfsKhYCSAJQKxU5bDB
	4P/A87pAOq+vB1+QNkUBfCgfKHlpzLYDXnxhxXtl0RkkIQj2wR1f5tTnlk9gD82tiPaCD2t60i3
	W45iGYN1/KCe1eG2gIA==
X-Google-Smtp-Source: AGHT+IG0krJTq4Jgt1IPZ/cibP+uYVb/N3x1kVGXAllB8t7somMdG/PDXIbNNQwFp+zoe9Zmdf1r8w==
X-Received: by 2002:a05:6000:420c:b0:3c9:59f7:ae7c with SMTP id ffacd0b85a97d-3c959f7b103mr2545040f8f.20.1756115334197;
        Mon, 25 Aug 2025 02:48:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:48:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:45 +0200
Subject: [PATCH RESEND 04/14] gpio: ts4800: remove the unnecessary call to
 platform_set_drvdata()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-4-356b4b1d5110@linaro.org>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=749;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=l19XxlCMzrhQb7segGk57h4S+g8U8d8cxgGqBJH6nF0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDF+dmaB6cWzgm2SX91hFFwqfh18cFEuENOte
 nL8RUAd71KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxfgAKCRARpy6gFHHX
 cv1LD/92kRpIMtl2PZLTNmSBg/nbx4JFs5adi1jle8Ro6PoiveSkeouWOncXl7ZGS5367YmHXsm
 sVVjoeuol0qV685ZewLBky/Uh8Wc/i3mrR3YunQhN3fWnq3ZypbuHN+QSasKrtXzo5bKCJIubBX
 /arpVNk+o5r4co0IaZU5ZOBcNNzhkOkJ6KizZ2uYbA0zacx1D8765JmUpbPbVqyXTf3WmmDTz+r
 bNCSXq2TEgn37Bn2Qlg5K1UvtWeGl/Lhgw2DBezQboSRVARFq+2VHti/r/gzyoze2PXjOFFci2W
 U/PZQfbfow13027M7jD5UlSkWcdznjt1egU8aZtQwtYJFGxHa11FA1ozAeR2DAvPftb2WN1/4R7
 rzMIBUHtxstYWt6rbgdijl8YVgvPMmc6m7dxFyZkB5qMB8mNGhD4L/xGpC4LAP+P5N6wIdR+u7E
 0r8SoqCWuHo8D/kJPEz4UCXxXoLOlTLmx4LpZLUk7vGHRT/8RRvVJbaP1u34HdG103Q1k4xHFlW
 oyGIWH9nGCkrPeRSSIcelEJKZ9vMPO/pwzEBBlETXmG9K5DJRLHoxMj2gvxK8NTcFQ/9Ujz/vXu
 uwFVjwosz8GWkmTdng/1tY1TScUvLSBkhao3qKSnl7wpRttlC3GrAtnqGLd+0up1Vl9fWZiIQAT
 X4Zx4skN4CDLNxw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_024855_573536_02613F27 
X-CRM114-Status: GOOD (  10.56  )
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

There's no corresponding call to platform_get_drvdata() or
dev_get_drvdata(). Remove the call to platform_set_drvdata() from
.probe().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ts4800.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index 4748e3d47106cd2db6a994928b20f76921540a60..86f7947ca9b2d23292c1e6660fe93c611e0cb837 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -51,8 +51,6 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 
 	chip->ngpio = ngpios;
 
-	platform_set_drvdata(pdev, chip);
-
 	return devm_gpiochip_add_data(&pdev->dev, chip, NULL);
 }
 

-- 
2.48.1


