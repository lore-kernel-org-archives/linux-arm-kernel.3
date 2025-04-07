Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30F6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 07:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oJEkpaKzk7KM5O+yA10t99Sq6/Y0ezDYdwYB3ESkdY=; b=wBAH+Coynbh1Q11uPzcf68E6CN
	M+xJcXX84inmu3R66POUQOiDdCZijau6uLQaoTuyaDEzE9oSDP1b7O/2W+98ViIuQwd8VAxCudZWP
	w9sZ8InhvG0nxNW5Bc6Z3PIa/awaES3skwNReo21079wMBCHpBIWL19DezOyr7yOJbVU4kcbTuurF
	nLDHsggPSeIAHWcd4RaGGwvR0zg1tUK2eUrJp3MjgOUkPvO3tUTRTXf6gqS0iYx67dA4YFZq8YMA/
	Mep668z1+uBFP+dcfJlzBCGFRHXfV9D7ioFpCMtMgGIiqSFqbRQABeJ1ixYIeeDfyKq5+ojjuxkEu
	6MOM1S8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gfH-0000000GhWE-1DQh;
	Mon, 07 Apr 2025 07:13:03 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gbn-0000000GgRV-31RC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 07:09:28 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cf257158fso26759595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 00:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009766; x=1744614566; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oJEkpaKzk7KM5O+yA10t99Sq6/Y0ezDYdwYB3ESkdY=;
        b=rLa6iw66dwycPYgRl94V7/xQLXarj/noTPKj1ycRuQ/MV1vxcEFKM3rSqBwohX6Or6
         KlJEb5Px1MG0tKxoZDpEuHOmu/73cSo5UigIJ6rEOJIdht7EpCXtNO44CL0lw2XTaXXj
         jFammtGwo43/HiBX9TZUicvmm1FdQM3Dce2PJxpBBCpQW2QyRnAjqFUCMomHW5PmJ9tV
         ytHzko/GuQHsbSsFOoDOb2/5RpBe+8YGpoelVDOoExwssVWcueFczcfOjwIIMHTu7I5Z
         5CD31iOmcEbZahIeeLBnvr0hyskwyhA4xvcJQu9r/Tfb/O4u3oIeMu5fmtR5EGOHZHPB
         UfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009766; x=1744614566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1oJEkpaKzk7KM5O+yA10t99Sq6/Y0ezDYdwYB3ESkdY=;
        b=mGXRYEU8TH0AI1WZaIdXDTXKycIKJtJKmatCeMDzgI7m059OhRloFxA9c7q6fuChFy
         wzYh2MayOvsN5kBUrdz7jDnHzJ0NtbgdlwtwX21QVfqPsJIVFtkDBniAL20F8SUe0wxm
         7kAMFkAXc/Eg82k+FIki6jGIvDZE9pQNVp9LDWSVBVyIVeYuB00xa/yZjQIFWDma2j9C
         K6L6KuzOYK/9Cdl4s/7GSEDtTCX4n94nodYmwCpb7e73uuuGg0ebsE0AXzcV6NqFAb07
         8l2PzJ8+zIj/URfBJnTZi9AtNH0BBu1spmYhs2YBD9Ir75Utrp+tCVqwYtEZzwV8wuOV
         1yQA==
X-Gm-Message-State: AOJu0YzxTdzP/12w45ob29NVSL+d/PMbCLK+7gL9Vpns700q+VMg87xR
	WH54LOZoyuFHip4CqYk7/VTNtcnKkrEF7m76lqmMdnO8aMNL/chaIl9zFKh9TLY=
X-Gm-Gg: ASbGncuwyG5lQU9jO12sS8Kc59wIS7l8u3bas/npytGROnjgvx+ekopdK5TCVMpUk6F
	iahx61lfKwYzVRxtP49EJQ03wNtZ/NzKQYPEvkDa6sryzHGs4FozpotgwOv5SrLCI20sFiT6TCe
	4NA//RgzaE7kPz606mcPZ2XojW+MkxHLwNuJ9ce16IMR6ZUiromlyJK69y+gJ3fK4iqOWhS8gdJ
	bRPGWvK6RLqnmuCZ8Z4umQTipQbZSMwD+x3Kl1XuSTmptbpM1I6WxT8TstgaaFI9Oy4rqmxRf9p
	r3ORlywz2DI/qEpbPUBkUCXoZ0lJf6TCZWzbI4OxHtMPLRIB
X-Google-Smtp-Source: AGHT+IGFE6oyFiQ9CpLcLlV+haks6tvvNCLBB+aF4dXus3yMP1Llx4O8MohrwYM8rVwVT69R0foFDA==
X-Received: by 2002:a05:600c:8719:b0:43c:f85d:1245 with SMTP id 5b1f17b1804b1-43ecf8e7321mr124503985e9.17.1744009766064;
        Mon, 07 Apr 2025 00:09:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663060sm124622795e9.14.2025.04.07.00.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:09:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:09:18 +0200
Subject: [PATCH 1/4] ARM: orion/gpio: use new line value setter callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-arm-v1-1-9e4a914c7fd4@linaro.org>
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1612;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6854LsY/CEKL9LDW7nLKKhBRDGj/vD8F0/gksPec/Gs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83ojv0NTNspg6Wx5Fggczg/6It7m8U2gT0lPo
 rxrHkr6h86JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N6IwAKCRARpy6gFHHX
 chutD/0cndTpas2Wdg5qBWP1Y3VKSiVXC6hIuu1om0Dd6+1pvJPesqjLF2JFC6zXuYLNkg0+5Jg
 rGlvPXMOI1t9FgiAdbgKurXOq+HFhT4k2qSnOquBOC/PNHNbPYOOlpJuZidhiPkiCKltu3o92pr
 K7HivuuUnrD3r2PaQXoLjhIhZ+jnddu7iDYZQQYgSjAF2FXJVs/TOgQY+fnL2rRRAXZ4kfA/ll7
 6dbIgHm1IM735m+b5kQW+9UuDG14bt/y9uWTJbvgK+xvtRhl5k9jyTWi/P6P3K93ceJolsL+zdC
 WUj/jWB0+TrXlKsF57cr4miv9xpRtfcFOM68jyZJYP/8RT/B5CCxCMHxW7L7SpUkcHnwtwhj6p5
 Iz9NnHrsLZdZsytg+wpvHk5roaSVuWDVE77oA8uClfW6LB+PcAYTI3kuSkoVRVI7dfSXJWSLVn/
 ouOOd1MUVkGTz++pCGaCtcnKe176tnqXb5Wm5MNK93LUMpg2F7KMVNZUW0NBY47bKkYN3Wz9ANJ
 hLKVuAzR5UxbPRdG3dHLIKEHknx3vm0Ac7/z0V1wh99rz6jMLZWAHXAY+/BJPRpl9jTJQEazQ6e
 7nKzWccg6Qhy55gudCDhtyMQvrJPacNqZJ+cdOXjly/IYjPEwBorwqoF/42IPiZqADwOvawnQ1U
 Ns/4rCW8lnZP6Rw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_000927_762774_610A27AE 
X-CRM114-Status: GOOD (  13.66  )
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
 arch/arm/plat-orion/gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
index 595e9cb33c1d..766036fdd792 100644
--- a/arch/arm/plat-orion/gpio.c
+++ b/arch/arm/plat-orion/gpio.c
@@ -211,7 +211,7 @@ orion_gpio_direction_output(struct gpio_chip *chip, unsigned pin, int value)
 	return 0;
 }
 
-static void orion_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
+static int orion_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
 {
 	struct orion_gpio_chip *ochip = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -219,6 +219,8 @@ static void orion_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
 	spin_lock_irqsave(&ochip->lock, flags);
 	__set_level(ochip, pin, value);
 	spin_unlock_irqrestore(&ochip->lock, flags);
+
+	return 0;
 }
 
 static int orion_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
@@ -540,7 +542,7 @@ void __init orion_gpio_init(int gpio_base, int ngpio,
 	ochip->chip.direction_input = orion_gpio_direction_input;
 	ochip->chip.get = orion_gpio_get;
 	ochip->chip.direction_output = orion_gpio_direction_output;
-	ochip->chip.set = orion_gpio_set;
+	ochip->chip.set_rv = orion_gpio_set;
 	ochip->chip.to_irq = orion_gpio_to_irq;
 	ochip->chip.base = gpio_base;
 	ochip->chip.ngpio = ngpio;

-- 
2.45.2


