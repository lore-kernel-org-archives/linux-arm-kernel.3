Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575B8CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 11:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7pQfDGCPblKxfSBCBsu+k2H7lASoalxBm+PQPOef3U=; b=hFtEc7PxdDn2YzGaLDYfkEV6Og
	Y99zwGfvFaUCVYaA6EZUuPEfaM/Dqux/78HVG8KlR0hZyl3IaGTTKUcEQ+RkXeCRc50aIBJuKrTZn
	2df54qrBU+AKrYyfbouhJyBZ/qXz0vPX1dhJ/ERoEUCylszyFBiFAOhn2f/MZOpKMxkR2xEjDa0Ui
	Uc3svV1rOVhoMOrqElZ5Z8DFwhkBH2ZxXRoWn4kESrJ9P0U3LO3SXqlnFONSU8gTMC1PHj6m5lzy1
	mGErdlkCRKzkKvL/gtvq7Z3XubAo2QGPORxb/MicMWysZ2sjxn1W5QKwLVU39Muz6cW35NA0sgcqx
	jE4t7R7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwJ6-00000006eTu-1nnY;
	Tue, 09 Sep 2025 11:14:40 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuS1-00000005sTI-1ZPl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:15:46 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3df15fdf0caso4111218f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 02:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409344; x=1758014144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7pQfDGCPblKxfSBCBsu+k2H7lASoalxBm+PQPOef3U=;
        b=oDMzmBa6+iR/9wLwCbynqNf6S8Sk6QivcJiZLjns4++qiM85QwJsJoGyIZVHaL6U9q
         CaPHCTrGUmW94P23Tex+GPzuboGvRxUDHHflhRPZ9bzDh81y359mWLMijRFEgn3rda0Z
         i1iPqyFiTF8K8LAnVPBwAOvMW9ZMrVK3fHwnGATsnbvfKj7ITLLkaVF5nB+d98mGhBJE
         46O/FJ/XHrh7xhqF33biiQVaQ6LHwao8uM9CK9ls9N5Lpf4iRoB+8mSKPKEUO835k/EM
         CYpjA9269yus+kZUkNoqRWw8gUn9wG37loUJQ2syT3HZ+Vk3SNcX5gdmvTjI3o8V06DB
         XJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409344; x=1758014144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7pQfDGCPblKxfSBCBsu+k2H7lASoalxBm+PQPOef3U=;
        b=utYI/lCVoeZYmMAWbu0Ads8csB8QrtAcv9LlN6hNrLWBcLuGjSE6tAHF/WHBOovgwT
         0CXMto4K786Atp0eG+f1mTp/zQtSNeZaU/qll5VF0uv7gJ8GNxUmTbVQpq2AD0sLXmsg
         s/jJB94gysJxBskmdsZuBBzEqZib3kgmHnCE0V56R6Ouh+zInsRmjm1Clah7j04/Y+RY
         ZQgAZFxU4c8TFZB0GHnO3Gq4RSmAK2av04YvUFkRm7Uq7l/PU+73a8/yXMEtTbFhqsDB
         xAvBCOpdlKmhr+x39jySn4QAVXJg4TI7Wa7yZUM69wDREJSbPymuOpGY3f33ICCwfBsS
         dNcw==
X-Forwarded-Encrypted: i=1; AJvYcCUy2CytHwgz2PHWm5KZryeog8m/twYasIzhPZAv7wTr8sA0EDGeq+WE4c8A+rM4ck82mAaNnr4qQJlfWzO07+Dq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6gvp31u29ae1y42NKkrZjcZf6w2mm3NN1zTy144ToM3y4xZDe
	/ItyTSPA/hDaAeZHBoQUvZmRbTjwUNGLNH7oz/GO+fJ1qJhbpFhbEs81q2dkx2f2Mvk=
X-Gm-Gg: ASbGncvKSboozxierHgzwvh/0MQepYQjxrm1e6Va8gMknxxCndEaXhCODDuawEhm7DO
	BzGFpAV4DCN0+2ov7ZJz3l/OOTS7wejZYPbekGj8PENb8ixTsHhooU28mNUilURwV3slVMMoC2c
	cBA7ZowLtyq72jtRquVC0csuW6k6zB050ybXcMR4+/BH82VDTC3/6/7ianLIyB4KWMFibu8M9du
	aT81u8BY1KIurJRUnIj0lgKawojJQZubBM/FNnv+/H4AAXkTg2l0uhV8sJoLPRnEVrg+dJ3CeS/
	lKgasGTfaNRdSjuNXx9DIzfIgTYC6KPkKz+bpO4pH+4R0uJc5hBCf3ITszxhQQmxVeIKeCOkoCw
	YXuyKUj51bMNSRqI79w==
X-Google-Smtp-Source: AGHT+IECDvyJ3MhP86HfNBVWgMSE9naIJTJZ0ycY5JDb9n5YXZLF4Z2JGvdK2tqbA8o20swd57M3IQ==
X-Received: by 2002:a05:6000:40c9:b0:3e4:bec8:dcd3 with SMTP id ffacd0b85a97d-3e64c1c2d59mr10736450f8f.42.1757409343760;
        Tue, 09 Sep 2025 02:15:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:28 +0200
Subject: [PATCH 01/15] gpio: loongson1: allow building the module with
 COMPILE_TEST enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-1-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=739;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iZ4PlFFkHvr3VSD1LivXtszs5JdORDU8d2OKjqzKoYc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A2X122vy1cTHyhSgsG7MkIlsciNRM8ZFaAn
 T0KGuq7L2KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wNgAKCRARpy6gFHHX
 coJPD/sF2yokXt5SbcL4IYbnNJAAMtC0yciCVu9NMg4HOIEJbnJLMgoDU6f/Lye1GJHoJd/r8bg
 psxEzWVypKMAKXC2sb+CSVVktqi2LrWPd8WvjbD1w2ncKGKzuoVyrAB92tWBa1NfLh3OHEC0/ku
 wXBtt25qo0HmUF1tPPNUvjxgq2bP9TIbQyvUarSxnG1iQ43oZqiFep6k+G/aSkGV/eXl9TU97AV
 RiQxqO1JzL7fY/XVn+T589yE1pLjj+axt8MR7YyrZIyTlTCZzpRhxzrT5TOcFcBXyrdQuaK4G8S
 JvZcqp69ousBbMjF2RCkf6zj9stt/FPHhc+NIVzaO/+3Sa8+ozpD12cukCkwRGN1QLu8gIdG3B+
 7GobaI7NpSdG8YFEC2lE+CIWQTVJpeopaa/MVfsBLom8dXS1rNZSHXTXXExOTkQne5Y8oRI54bO
 dSblAGdXRavGi6h4oh3itiTfoSZ4M2+tv/WBS0fg0FbvwFAs4Zzw6lqS5iigmBx328VHt10DT4d
 p3OpeS4s1QtcpZmXPa9n3iQz4eK+u7bsgZALZlItLZr+caxJ/Q5lFLxgMJeqxzV4cHRROk2u17y
 qsz/m/yy5OZlZLgQ7uwBNunQYNBtvrqCQsCUhjR2JYSvEf0IrCHidjQP2VNeU9r0zEuIV4zBpsJ
 WMI3XWLHsq/gdow==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021545_581433_9FF2AFD6 
X-CRM114-Status: GOOD (  13.21  )
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

Increase build coverage by allowing the module to be built with
COMPILE_TEST=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 31f8bab4b09df1640c892f4d839860edaa2ad6a3..09cb144f076661e0a2069016175d0692257fb156 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -885,7 +885,7 @@ config GPIO_ZYNQMP_MODEPIN
 
 config GPIO_LOONGSON1
 	tristate "Loongson1 GPIO support"
-	depends on MACH_LOONGSON32
+	depends on MACH_LOONGSON32 || COMPILE_TEST
 	select GPIO_GENERIC
 	help
 	  Say Y or M here to support GPIO on Loongson1 SoCs.

-- 
2.48.1


