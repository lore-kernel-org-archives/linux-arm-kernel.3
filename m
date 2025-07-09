Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429F8C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 07:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxmgj9ZkJ5jurPImgmtTOMxeXOQfmg5em6Z870ZYXDo=; b=rXh+8BrY78oydJLks5iXTMck1O
	4lpXj1GXGjHNEw9eMmanXd1tgBf5NftgT4AY7tlyO4Iy8Vbx/0FVK1bqYa2wdBCm72kHegWI+plEN
	RTrQIc+gi9CTBWq05QZCDk93FbIZgG/yv2aGatkDiH228NTfn1UgBYok2xauEEmSdAd0vBID0xog9
	Q9D7vZrUetYDQ/ch4hmv3nO9iaxQpY7rJHejFOVFdA1EVJ4Gt+2Aqp6xpcZ5rAKWGfJLbXpEd2KuN
	jGBtYoUqkTCov8QH0D8yslJJS5GfCEdZsjfjt4V2JMtiaOLvlSQJQhbXRMidv9q/Uc4yN18MuUsoC
	NAT9ZDDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPDL-00000007oJL-338i;
	Wed, 09 Jul 2025 07:27:35 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVm-00000007hD6-00fD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-450cf214200so40459745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043352; x=1752648152; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxmgj9ZkJ5jurPImgmtTOMxeXOQfmg5em6Z870ZYXDo=;
        b=SoQUV3FmUKc1iwOitIHDDX2YOhWbceisTBjY+t508gUM9rUsAiGe/g2CNtKOyfn+dr
         ZNbKsI/JmpTonHv/5C1zaCEiTOFpLNXvxVn3BjDXAbOToyS/Fb7RVaZCmVQRAsawROTl
         RDrY5ENX4byKId8Nzbfslp4INALUF06Kzh/rvs53O6walnl+bgAQoEGU/DU7BR+tHZhn
         ioU8D6UpDwVu3GK46+AT/7FvkbX9vPBUWcqpst2a+NVjkcZ9ynXyAhbuOsc32dtI6sut
         6fiztbEOgYxRdAz30wR/CaU/o0nf7JvIbA43OBCOiu4yWAPFnfqK1UREiqHPF77u1I8t
         O0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043352; x=1752648152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxmgj9ZkJ5jurPImgmtTOMxeXOQfmg5em6Z870ZYXDo=;
        b=Di8i2/DIzp+pW32ykGytuNUdIBKQTZ2bXTcb+E++rZLwsrhK/FD5N7wqkrUPdvUq87
         bZ8VX3jkGKY8TakU44OMhZtLEHxn7G/A2ybriZikt1CgKnb/sW3VE/sRUsY3w1sQCVxQ
         dMpAesaMuOWhbBOubGyr3/GdOvfyf2fECUE6wq0uaQxwrxWIXwslbWIOKDasl7/f7tkP
         4mAIheK794qeXlgHRBb3j3wJaZO0n+fQIe733RgZLwUxqQIaQ+OVazY69advgr1ygWAW
         R5LExe+jxkqpsmd7Nc3ly9r8nwPj9ZOw1VS9SxT2WKkjpiYqFWX1+7gDWnuF8gSD43Jx
         zt2w==
X-Forwarded-Encrypted: i=1; AJvYcCWqnYs4Aiwz52Maktt3gW9j4BJ2oY2MOBCOzMqkWe6a3VrfU779BGqa1KNkfjlkK+DoDSyZVQpCikECCOpoct6z@lists.infradead.org
X-Gm-Message-State: AOJu0YzTQWmsBF73v8rgSsUNZjVpDTvAfnAxtLbQ+S8CnblzPhpZFvG9
	6Bw79T5mK82cXzZeXzHIKKBxKgi6sj33B9TCOvWvw3iWty4G7E5yVFhkTsz4NqPQKV8=
X-Gm-Gg: ASbGncscS01owSaFUry36brmRK7KHEKKry8lsT+WxrklOamsMeKdCG78xEfHex0VJCL
	7mLA1GF+zh0NE5t89dlur4MKXpUVHC979B5TIW3I1b8NV9C0pO4eNtmD9y6lmenwqJ31GHd5ba/
	KHz2q5cUNE5NqqZR61byN5gmLASUdY43x1u3bCMKe/IEopLwiCbDj7TF5KwWNvqsCT4o7KcC5Wc
	yHB2WboHLPzPC+QBtulpBUkdnzq3BiZfO98xsY3EFk5Xqde90+jp/iJE6d/qXOhfy+teat+/6mL
	PtmOFueMA0JimdrPx2Jp9AgaK9GLx9gIPvRqNqy2bHU3fyLzrT/QJvxW
X-Google-Smtp-Source: AGHT+IGa8OeT6Su0xQMb55IebOHa7FxZEnAgwgWyolIZA5g7MajlX06UmKPCAxL8NqmfqAXS3scFfQ==
X-Received: by 2002:a5d:5f8f:0:b0:3a5:1c3c:8d8d with SMTP id ffacd0b85a97d-3b5e45427d2mr865828f8f.55.1752043352510;
        Tue, 08 Jul 2025 23:42:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:52 +0200
Subject: [PATCH 15/19] gpio: xtensa: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-15-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xOGYY5ENTKrRdSfcTsOuqSbkZ5L1bqtvDcfCIDUw09k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9ERYsDVKFTcLDqt6CETEM4apoSIwe8BI8yW
 ZZFc+MrCzGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PRAAKCRARpy6gFHHX
 cpdED/0d/XUebBHliQqqKY5yPOQb6XQu6PvCh1bytyMvyLaMReMjHObOewAxXS7iyYPVRWIiNl9
 L3jwzjQvJUok7DM5ArSNPrQkIpbOAp0DN5bJCcjH9XHjwYvZmysbplGnzR3Ux53QQsVe/894eFy
 zviRyEFKISZ3jaEbe2mnDsJUBlzzL1tGIoAhlrbOApap5vTl0uzz706rnue574iw1dEoHuyeAIx
 Gmkjf+q1NRUtFFnQqw0j2l7F+4gdlq50vHiUYlXwSpeRQw1a3t5Y+GG0Q/8mEGxlcSsCFkW6DaG
 96+oo6gx7X11HBQn0qTNTuB/lXWcuPecqSnYF0exYLSGPOh40ykPRv2E79yCX6qCcYmtaiJytUu
 VP/hMQVlE79E0awK5+J+r2o8P36SfvUNdA1tNkrN6Z7f3DpXI9jqQqQ62qiypDiJIGwKPnG4tf2
 /wXqbJwRFEvoCQOr6u1plkbALucwzfmiqrcx8rIINEb8pcoYHSnekgvj0JT6gsReER07lt+AqzV
 GQbfrebKPTvkReF9qJuSOzPjt1CEX/7dxcJVLg5mBhv13iSpJTyMd8yBGVvqZdKrkP5e0MsbDPT
 bLVEwVRlRa7WZ3rsMqdypNzfPXsjLFbXbtw2BG33d0vOa1YMxZvl/AgNnSIFW+khgc6azrKH3wY
 a8StzwVcct8bC+w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234234_071994_96719F4B 
X-CRM114-Status: GOOD (  13.64  )
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
 drivers/gpio/gpio-xtensa.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xtensa.c b/drivers/gpio/gpio-xtensa.c
index 341b691ac2345b93320a6e8b933444d26dcf50e6..e7ff3c60324dcd11aa03348684bb4743a771729d 100644
--- a/drivers/gpio/gpio-xtensa.c
+++ b/drivers/gpio/gpio-xtensa.c
@@ -103,7 +103,7 @@ static int xtensa_expstate_get_value(struct gpio_chip *gc, unsigned offset)
 	return !!(expstate & BIT(offset));
 }
 
-static void xtensa_expstate_set_value(struct gpio_chip *gc, unsigned offset,
+static int xtensa_expstate_set_value(struct gpio_chip *gc, unsigned int offset,
 				     int value)
 {
 	unsigned long flags, saved_cpenable;
@@ -114,6 +114,8 @@ static void xtensa_expstate_set_value(struct gpio_chip *gc, unsigned offset,
 	__asm__ __volatile__("wrmsk_expstate %0, %1"
 			     :: "a" (val), "a" (mask));
 	disable_cp(flags, saved_cpenable);
+
+	return 0;
 }
 
 static struct gpio_chip impwire_chip = {
@@ -130,7 +132,7 @@ static struct gpio_chip expstate_chip = {
 	.ngpio		= 32,
 	.get_direction	= xtensa_expstate_get_direction,
 	.get		= xtensa_expstate_get_value,
-	.set		= xtensa_expstate_set_value,
+	.set_rv		= xtensa_expstate_set_value,
 };
 
 static int xtensa_gpio_probe(struct platform_device *pdev)

-- 
2.48.1


