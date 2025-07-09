Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5ABC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 07:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tn5OaSA7pgX+Buq36989f1K2AZy81JVBiD7CPukS9v8=; b=s+abtPv15vpO1jnpTsvVbODOVy
	yhk42kPvyM80bx3Sci3MX1nnw/9LNMCUawcxgy0LzLpkk+4vmwbZO7MdzJID9UvfhdrFV+98PGoLm
	xiz+vE7/C2NrIDiL+vggF9CfhXixUsOfNfYwth3E1mmPlLl+K4JjTu+uWIvxNwbI7x5NxFkbmhbdK
	tI5Ah08mupeTsZr/whgRMR2hKIHzhErcquJET14yhESgODs9X0laOmbTWe1T58CHNtVpES6v+ofzk
	QKRMs9CBH3Nw29wFg5ng4SaJr5y2VXu4k0F83JHxkxZKDE4U1y2nN9qslXXhrbCIxCzIB05QTzXr7
	HiXRbQeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPFf-00000007oZz-1ybw;
	Wed, 09 Jul 2025 07:29:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVm-00000007hDi-4BbP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso44942475e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043353; x=1752648153; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tn5OaSA7pgX+Buq36989f1K2AZy81JVBiD7CPukS9v8=;
        b=grX3jfcZaQL5ggC4W06Sh7a5RH6Wa3iaOQLzRRRAuVPLB7jXTtkQ4g7AsNlrUmebEU
         dq++2MvuIH/ayx6ummzFuYhjlsLBcWIOGHhk/jW26g8LBAEXMKfAtXI+9Yok3ryK+iUd
         XT6fL39ZaKlul4wfifiRXWMpdacDFjqqBckucFWb/bYaU1x2DXQgZ7kRnE2rb45Gwwfc
         HcSzGi+af2po51o4yu/hJXhWsyMNGHVPwXQJ8xgd4E4plJm/afVwczdTfO1OxpKrdGLg
         bLQjMgTL3mDJVQJX7bAwfvpTfkicQ8EW2PLoIdpJWJoZ5yanJ9NVlsUPbldwW6LUnLos
         P3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043353; x=1752648153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tn5OaSA7pgX+Buq36989f1K2AZy81JVBiD7CPukS9v8=;
        b=MbH/qEVImOtQxtwAn2H6Mh9BTJfUYMone5OT6zzTVdY1EH04ZvHg37X5s2tbr61fWv
         H6iM/sl9gwAa4LKc/buA1/Vv4bJt8UFRMZoEve9qmq0Ol34FBPgIOs8p033XPxSaUaab
         3UBjkAusV8xNrBAjDT+26wvWMxvt1XAwOU2Gdx/pgUGoqfYqZrhIgYuxWCzBuSUewwcH
         gTX7cWaxDDMyx2LoydGIz2I3nT5z3sLQ1ZurlMIkfbZN7chA0f3DkAddxLIZQfeuae01
         iieSaCfhN5N2/nYVPbwE3EuZcVn2w+T1TJYb7GrjCE3XCew3G11gfREVS+yTOy4c0pgD
         GAhg==
X-Forwarded-Encrypted: i=1; AJvYcCU3DT3QzwSfT+YxSnaJaoGbnlIQ+BIJCmk21UavIEINM4JRb9FtlPh9sBRhPfVYZbmSMfynaMST1Pm6zTck/ZWo@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+h8bqP1Hcyt18ehrWmnkXmAKrJGcbDHXhe/Zz8EpP4AMVg8Bl
	07D++C/iXbQtg17oYXs6+SlLaFr/lqWqazq73V6nvT8q4EABsW9JV+96v3VPKbpfiIY=
X-Gm-Gg: ASbGnctUVWuEAxoRjb57274ftDFFyXtPq0Q6Lxvdp4Jf730LTULS9R+Hkxt8dgWj95T
	rdvh+wApDdKRCgnvN6McrNJRPw+m/2uYgdohYNmt9Bz8qAMTsoB5b7f69evmanrQiB8i4U8AuL3
	uobjZPSAuwEyYCaR74ERIYm1K53r5LYK1R7Wd+HMEi+bFOD/QYMYahsh/VDS4n6zjkDTyj1upa9
	ssOF/eoMrAvgwSz0UZ7fnT95N5H/mOvkwDgC7mOsNUirY5WlD47FuaNMBqUiPy2CvqOmTTxxnmQ
	hDcwf+0vFug1wbgcV2FFKCzsFQ/zJgmY0BxIhwGXq8xEzRGkW0PGGyQr
X-Google-Smtp-Source: AGHT+IHCZJ76BMC5iAZPOvIZO3R/y4bpK26NWs5OpVLQ8HU7QJFCnY014+kXEIs26M8XIAEwlsTESg==
X-Received: by 2002:a05:600c:3f19:b0:454:aac0:ce1a with SMTP id 5b1f17b1804b1-454d5325fb2mr10408415e9.14.1752043353524;
        Tue, 08 Jul 2025 23:42:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:53 +0200
Subject: [PATCH 16/19] gpio: zevio: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-16-b8950f69618d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XJxjpVAEddSlG/MvMeh2gzi/IAd557glLV2SQIYcYKo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9EueEJwmHe+XyFmtP4FA9GXo0KRwJswOqDK
 T0DLaUwyQyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PRAAKCRARpy6gFHHX
 cnbJEACEn7ZUF+EQ5MudtA1pSdv/Gh/JFn+mK4bQ0UyUdv6ibTfVuUV8C3mDGMjP+4fPdF379K+
 qujYuRfL5iufetXWOz/Gn+D8NGHNALZ6un1R8i6quoSxM529YWbjg8VFeXQ3TztEt1jwShJgYts
 jdLzbXs373mTlh8Fa6IkwpSrHIf1+2jfkDJ7bqIEMlhU7gK9H70nTKbuXRgjOYH3eJGJaNdsY3a
 IyLoN23OP/nNBLPWMV+voveftWtuCZvdKcTKmAFAFLtl9syPdIQ1G4tSEOEfxCuQtl9joaHMcae
 4ECm2Tp+AnHf/POhDnu0+o7SygFNaUIXATnQ3kUd9rdY9lwQt56OQW/BeQ/p79WuEIGU3x+C5lK
 XpNLhz3b+l8UpCynS9gMOINaJGMocrU5XEt4fL9RN6XwaBSRBffxSbvUUCRadCtrN3IUDi5zebk
 s9nWpMVFna5J+JOEZ/wevv8irNpo6NLQmqblYI0VUThLFoyNmRNlTE6zI6gxOTa1hp6U+FUBJiV
 v78jLvhMeBp9Yyu8L0KCD4rsjm6Emhws8k1+XbPDv6kE+7daKHFT15tET2KDgD1iuCFHvV35KYM
 WHlUNSWhg4scEvhorLRFf6lByc1fdNu+8jm652odomc9yFGx/lqWUwE7dNUgVBWoqaxy/gma1K7
 9UJuiwSPNmIwpQw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234235_039870_21BF4191 
X-CRM114-Status: GOOD (  12.79  )
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
 drivers/gpio/gpio-zevio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
index d7230fd83f5d68a9d80352b7a57e12cd21c389ce..0799f79767107d1775b7692e582e9548a6bb38d6 100644
--- a/drivers/gpio/gpio-zevio.c
+++ b/drivers/gpio/gpio-zevio.c
@@ -91,7 +91,7 @@ static int zevio_gpio_get(struct gpio_chip *chip, unsigned pin)
 	return (val >> ZEVIO_GPIO_BIT(pin)) & 0x1;
 }
 
-static void zevio_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
+static int zevio_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
 {
 	struct zevio_gpio *controller = gpiochip_get_data(chip);
 	u32 val;
@@ -105,6 +105,8 @@ static void zevio_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
 
 	zevio_gpio_port_set(controller, pin, ZEVIO_GPIO_OUTPUT, val);
 	spin_unlock(&controller->lock);
+
+	return 0;
 }
 
 static int zevio_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
@@ -159,7 +161,7 @@ static int zevio_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
 static const struct gpio_chip zevio_gpio_chip = {
 	.direction_input	= zevio_gpio_direction_input,
 	.direction_output	= zevio_gpio_direction_output,
-	.set			= zevio_gpio_set,
+	.set_rv			= zevio_gpio_set,
 	.get			= zevio_gpio_get,
 	.to_irq			= zevio_gpio_to_irq,
 	.base			= 0,

-- 
2.48.1


