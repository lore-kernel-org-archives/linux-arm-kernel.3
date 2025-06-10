Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D091C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 13:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3F+4kh8HnzcTAXwMgO05FwI7b8fR5vWj+INTIOT0oXg=; b=fxa1rSd73S7kaO06ca6vbUF2eT
	+LY3e+pOH4fYclJ3iB+vhHPoXILDZHg+R40mKbrhYrEkoNmmekyJTOvUKBE3e2tI3RhLLzBihfz6q
	MNaTWPfSRKHLil6CBfTIPQeFEyk2431jXpEau325T4KCj55ghI+Uaty6hOTBFiKWFilJo/4vMG0Vm
	HaIehQmw0u/irU3R6KaAWYzUi4q1CZBn08rG2ilsHyiCZemYIfz3oTJUKrjJ1vWjZy0f1iTvA7spu
	xBC2sX/gfOb/cfIFStsV3UXFivJJAjwGGnPqBuipb04uSopQH40gjWK5brLv+AK5ud5xBdsf0N+8y
	376HSPMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzQM-000000073G1-06Iv;
	Tue, 10 Jun 2025 13:53:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAX-00000006mNZ-2Apc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:33:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3F+4kh8HnzcTAXwMgO05FwI7b8fR5vWj+INTIOT0oXg=; b=n7BgoghEwn0CmdCgP+qJMCjA50
	Op3NJTlSwsBWKW9bAhE251lk73Rq9cOwGRZweSTWJ2FRfeQJekm7OdLicQZD1mpJhFjWqWDjZAF5l
	oZQiRIhtcyqz/gQNDyME8DQVyBnVljxS9aJqMvPfI39O0sBeWh8yl/KYfElKTVjquK2gXBqJF7kMj
	I/d+fDW3m7SPY3YiWLiatu80P2nE0hcQm21XkSUiqqwqxfACUsWTQkNB2wVlaoj7NkbY3KBKzvNq6
	bddWUFWQumkyAAjW0EsrDJNydZhfpBmsTRFl8i2FGdwmafd8Wp/4s9rb9PYCTZ8D0aRssiic32tzB
	OyPpYFmg==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAV-00000001oXF-0tuG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:33:33 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a361b8a664so4442742f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558809; x=1750163609; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3F+4kh8HnzcTAXwMgO05FwI7b8fR5vWj+INTIOT0oXg=;
        b=n3mt2Zj/4NS7I46K2J4JcUb3LwM2i6Hwzi6bFO3OcoC0HgqyRUksFaIcX0ws7U4FhK
         hV7IXAYMCfUYOVCu0Tm5GYZuBQ5550feRb+78J9OYTnuYO+U4dT3yMIC/n3MFNQGayrJ
         OFCX5e80NR2AToc6ULzf1DcHVfNa2f9/QzBXLdpOShmFZtYgI2zqAQihrBA8+mUMHa+k
         To9ACEjQEojET/2XTLbmRzQZ2U6LIr1zj0V9u9SzePXMJCm7U2sThk3XmNf/pKlG8ZFv
         tIddanFfG5GiJASalBVj9b6v1krk5EqLVFEElMJqLCPd6uDVzi0NLONsCUIfHSDaDKGg
         DmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558809; x=1750163609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3F+4kh8HnzcTAXwMgO05FwI7b8fR5vWj+INTIOT0oXg=;
        b=uuA6SU2P1wMb+Eh1QbCQXv/UmVOBblZyemc2CU5O9r+LujCPCTxdqeOCpUoorInqbP
         IWa7AKD//395Iu48mXCfiMwhN0KfNEpeKI4Qt1P206JBbo1j5KQYZhE58KH6fYZktN2f
         GZltSUT+zz5Ff0crH73SxzBopbohjJo/ebyj67hA40NbpZqGFW8Vgid/yS/+KB9URhcY
         8ZsKYHMl+dtsr4BvoB7Yub0gLu5t3wSrGgBcM1XSd6deRcDbjogUk6GgMJCqO3oIHoP4
         /12kIVm1KJCLvTnBcSHTG5eGzsT8A6QiH71DInf5Mxh9qtiH36tc5usOHlCxUCCZmOsi
         DP9A==
X-Forwarded-Encrypted: i=1; AJvYcCVi64yOJVAgYMf9yLIQFR/LBEMgmqU/an4R40DQekSO+kbHzGN1C9VblTPQCSavS7ImV56R0FFiAtB7kXNB6vOk@lists.infradead.org
X-Gm-Message-State: AOJu0YwGy8UQ+vGA1EpcjBEK749hXtzxKRomIU3luTnAojPRyZ7qQ4yG
	jaWBws4J/4nOTCeI65paQ1Q3qrYNV0fby12BEY90FNBORAveuqIA6s9seN2xkPNGNCc=
X-Gm-Gg: ASbGncuLLCEl6YiJlcB/XpMVV0eDWfK/+vSoDBYtrX5IpPl7TfeJnQe4UhKzmGtjCey
	fEvSdurbKXCAPdMhAXhCkD0sdRPlJLPFhHUfi7/4439jaFAA2tTK8Bi92ssDrOwaALDpBWqSTye
	H5AepG8kpHWw9zi2DUZQF/uE8KY0o48SRGEqQnrTuvXdXCkxZH13WilgE0kePckLpSWzwLXLWWu
	1KTZSHXf+ly6jHsD7+IhSQv/LiP5wZHDfryHzbfLLUQjX++xeHDEsfMXMdmSq82A1tm8pOHI9I3
	xsM7xx3/gm0GTQvfLajSxENuCyFrr1jB0GvZl4QlFlb6+QoneGXy0OKevr3K7jc+
X-Google-Smtp-Source: AGHT+IFTYvxx+yPM6Fsk1C7fqSFoF6VLwEGT1tv11cW8KGpzuidERKwWdXVAfe2jAdVBle4RMS66FA==
X-Received: by 2002:adf:a342:0:b0:3a5:5299:3ae2 with SMTP id ffacd0b85a97d-3a552993bbamr1564362f8f.3.1749558809156;
        Tue, 10 Jun 2025 05:33:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:16 +0200
Subject: [PATCH 06/12] gpio: mpsse: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-6-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2989;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=TMx8xoTgcbqz3Qqy5NSYm5JAQDdrcON6VQI7QNVNO/w=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYPCFfXkFBozviHjnoa/3QfnofqJwkCL0YGi
 UwKuobyQmyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDwAKCRARpy6gFHHX
 cibjD/93BIE6A13TiKE9ysPDcrvPFrMv37iv7QXsvm0Lmv6wlgcG1+dairOOfUdjPMav8dlioDH
 8HTVlXxB0bqzKYrcS3mMMtkC0Q4qk+AhHImuFtNEKTIBl0+pBdYkrtisnh04673bsig5p6E+mlx
 JZijDEApCXAyE6O0CTrkgHRAb7i4AYOnDpnA1QohI0S/3WAQVPHJz09AmYsiqHLOcKbfT33n6lM
 tvD7LNztj6gvgddKar6MiiGD0Q/Ak+9crMBkju3I/FX2F7M2nOC8TKyVwk32eeIsvIczMIwnAnF
 v8O60v3shWlZ3IeiheyA7oiShU0F2/gUokAkpw9C5j/jY7mAB6zr8Fo21I6CMBjJgPG74UuyDlu
 GtGi5/jpDloLA8HOKSmNveS9WXC6IBcN6E5O1v8mXcjGTPr/1dbngoICJLlXXR5CPwEV2Cdb7aS
 +DYdfjcEIoA1olpZVfmqJtn+VC4VupcMQQnurxBHJa5cfDLRnKNvoJmSH+YnUXSxlnOo+8idA5e
 CMA8uth49bFCKuH+LjcK0+Atd2lYC8UDt+Zr9gOavzjr3DVEqp119wb0A+BOCHgtmO8KpHgr0nO
 0x/TjKxvqy6vM0e5hyVCvN7WbJSAsiw9m2LS+jMsU9hRHbm/PeAn7d8RD73HDqVCfA7JlvGSO8S
 vgw27DKUKWSkanw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133331_414162_1A4FB4F9 
X-CRM114-Status: GOOD (  12.94  )
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
 drivers/gpio/gpio-mpsse.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index 3ea32c5e33d1a445dec02996744429f17ec61af7..b17de08e9e03c5ce05ca5c1bbbb8a0f83fc2ba03 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -160,8 +160,8 @@ static int gpio_mpsse_get_bank(struct mpsse_priv *priv, u8 bank)
 	return buf;
 }
 
-static void gpio_mpsse_set_multiple(struct gpio_chip *chip, unsigned long *mask,
-				    unsigned long *bits)
+static int gpio_mpsse_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				   unsigned long *bits)
 {
 	unsigned long i, bank, bank_mask, bank_bits;
 	int ret;
@@ -180,11 +180,11 @@ static void gpio_mpsse_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 
 			ret = gpio_mpsse_set_bank(priv, bank);
 			if (ret)
-				dev_err(&priv->intf->dev,
-					"Couldn't set values for bank %ld!",
-					bank);
+				return ret;
 		}
 	}
+
+	return 0;
 }
 
 static int gpio_mpsse_get_multiple(struct gpio_chip *chip, unsigned long *mask,
@@ -227,7 +227,7 @@ static int gpio_mpsse_gpio_get(struct gpio_chip *chip, unsigned int offset)
 		return 0;
 }
 
-static void gpio_mpsse_gpio_set(struct gpio_chip *chip, unsigned int offset,
+static int gpio_mpsse_gpio_set(struct gpio_chip *chip, unsigned int offset,
 			       int value)
 {
 	unsigned long mask = 0, bits = 0;
@@ -236,7 +236,7 @@ static void gpio_mpsse_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	if (value)
 		__set_bit(offset, &bits);
 
-	gpio_mpsse_set_multiple(chip, &mask, &bits);
+	return gpio_mpsse_set_multiple(chip, &mask, &bits);
 }
 
 static int gpio_mpsse_direction_output(struct gpio_chip *chip,
@@ -249,9 +249,7 @@ static int gpio_mpsse_direction_output(struct gpio_chip *chip,
 	scoped_guard(mutex, &priv->io_mutex)
 		priv->gpio_dir[bank] |= BIT(bank_offset);
 
-	gpio_mpsse_gpio_set(chip, offset, value);
-
-	return 0;
+	return gpio_mpsse_gpio_set(chip, offset, value);
 }
 
 static int gpio_mpsse_direction_input(struct gpio_chip *chip,
@@ -450,9 +448,9 @@ static int gpio_mpsse_probe(struct usb_interface *interface,
 	priv->gpio.direction_input = gpio_mpsse_direction_input;
 	priv->gpio.direction_output = gpio_mpsse_direction_output;
 	priv->gpio.get = gpio_mpsse_gpio_get;
-	priv->gpio.set = gpio_mpsse_gpio_set;
+	priv->gpio.set_rv = gpio_mpsse_gpio_set;
 	priv->gpio.get_multiple = gpio_mpsse_get_multiple;
-	priv->gpio.set_multiple = gpio_mpsse_set_multiple;
+	priv->gpio.set_multiple_rv = gpio_mpsse_set_multiple;
 	priv->gpio.base = -1;
 	priv->gpio.ngpio = 16;
 	priv->gpio.offset = priv->intf_id * priv->gpio.ngpio;

-- 
2.48.1


