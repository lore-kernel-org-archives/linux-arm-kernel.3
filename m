Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983D1C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SWmN0oZOf47ZBuNC1PAZKMF4JI0fWMJVI0uHHLJq/Q=; b=HLN7v+gxL2fvQxUbRvAd2VbeXH
	bhTsFYfHGqY7tui6iv1jcqe1aaaR7CxB1wQIhWT2GzgVxs2sLsWZmPToMBYsPduyOQce5Fd0uoroN
	JVQj+oueP0aMmBdMP9BCwz7GKWCN9pfQPNJ+XnWCuacR29aUXwuaj7+IaMvJQPndOu+XVcLaQ7jE3
	QVMNtiFMjDjhJ8dVauti3NxMEHgucrVJVbCSV7IlY9Rdtgfw7CEyR0f3WIDsEren86Xohlk5sVbrM
	+9QpdXiNRqtPON04Sy4Mxce+FA5t6RR82rLjYdlJqGBUBHQIJ0T4Qm+lxPvSssJG/mGqLzwnfTL0r
	2AA+rBpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhgx-00000001uX0-1fPy;
	Mon, 07 Jul 2025 08:59:15 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgcX-00000001kNr-2R1Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:50:38 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45310223677so17322665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 00:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874636; x=1752479436; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6SWmN0oZOf47ZBuNC1PAZKMF4JI0fWMJVI0uHHLJq/Q=;
        b=aVSxivJGN+gKtz+QK28+MGtDtqqcKRUshPSexGoPh1qWRfk02ZQHIDqE5JOpR96W9x
         YE4hiYQJjwVTnHcltX4ianEyVwiQDOAPz93qJ0/1qwDWgLW112mqNa6B7dSElZ4MEYxa
         oejXkSsQ3DrIH5NgqiYDCEz+ojUS/sYj6dJcSGxIitC2IxCOqZxeH/Ev29Brbt27es8T
         DlU+sDz9Hxf8vf6+22h0eNyl01KCVLZZGPjQ0fGJVP+qWabvocVXKlAIXRQeVpfccn7J
         /a9FCHJNJi6YscEk+hoApIdZxxGUoZko8vyll+n7V+WovJmCUgX5la6Z6Ji4MOelA/qX
         /fqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874636; x=1752479436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SWmN0oZOf47ZBuNC1PAZKMF4JI0fWMJVI0uHHLJq/Q=;
        b=NugkYs8VWG0k5UdEqjLx64MjF4JRbynMCh1aukU5AXTmwYR2rWCkOAmC4NEpwUwQos
         IQ3LohX/hPMGllm/6EJe/nopmevQ/kIw6urWUA/jGmuVTHHDoKK2AuQIp591mkOEE91c
         yjW5Z1VtALb6SVBYGahUxvBn6GyPSFejx4somV7TCU3WMbvPMwhTFArpyZzYv/sPi5vQ
         HYnSZHaBHjttxLd2QvwOcRRc2flp14xQ/syU8dpXKWftHUQA+NDg3344pVxhGIdvZCXw
         1KSqZvILnVxQjIzx96MK0R3djy/8bc3ph4JBMuiqxT61uIRxxnOMVaPyLet5LmI/e1xT
         ASTw==
X-Forwarded-Encrypted: i=1; AJvYcCVozbvcE1e0wndLdQfRhwWb8uBIMZL2k9RTG/TgLkoB9TRRTa/uA7xGHM0tA3EBHV0uuK6BaOStqbAMrW+TNbAP@lists.infradead.org
X-Gm-Message-State: AOJu0YyEZtV1CPl3sVXCQz6Lvon1/lkbP8iV7EVO6XAg6suf31G2iNvu
	zu1ch1i8G/5mXya2hxf4AE9XIGKNJxG5Ul8suAm+f9/GvjDNeQHsaiyjZJ1S8rYDTZ4=
X-Gm-Gg: ASbGncti+0QMFuIVLx8JHbCyUXb+NKpC4fENCNAFMPSfKjsNC5FCgQxsPCYGMrksRWA
	IjX7d5vP63ujdpB5BXbOADQxh4GmY2t+rw6ban1FIXm8s23qFdHr73snOnNBGEW665ZeZUKjWif
	ISaK0mzENWjDMMK4gu7qrAX0+uv+I8/5IsIHSmHwrbumvahbZubwsfNcmK7BsrR70QqedPP6ZE+
	hcRBnTuqNo/oBcQ9l5Ts8Zpyy8mTlIOjQ1ihCom12Yfrdh4hzwD1EeqPFBSrEm0IbK2dEUuq6ox
	6H1xdAOU8yX6ATt4VcdHBIXTfx9WuC+jHG5EEFlP5pgbgCeLFqQR0qlYUm54oqiEJ2I=
X-Google-Smtp-Source: AGHT+IGkf+l7zAbCVq2RM9nxUZWQcOta3ZZ/CUcd1IUsy3YNoRjJEdd3rGBCVueejV8IrTqJPkhe5A==
X-Received: by 2002:a05:600c:a4b:b0:453:6b3a:6c06 with SMTP id 5b1f17b1804b1-454b4ec3c54mr96906635e9.29.1751874636031;
        Mon, 07 Jul 2025 00:50:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:25 +0200
Subject: [PATCH 12/12] gpio: virtio: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-12-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1562;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=WBzxcByKBAOQyrVMEQA9NOf7MP8zLdwyhJ5inR/oPcY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w8yxjQpOYow6Ti0FXaO1aSbr77VEqywPKk3
 2RwPz7x3IyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8PAAKCRARpy6gFHHX
 coxND/9dppbq95ielLo9QfHw6O8rAfYnIC/QkOGI1bSRtDxVc8ijvATdgEARXzcG8jLM/e8I2oL
 ksw0hc7ylzWXX8rBjmHKEGYvWg2b7oiQdXuBqzquor1sLAQdezaSegOvOEmiUnA4DmbFu/dv8qR
 uVzn9tyMLNrYL2hOybxGyigDs8RN7e/I9PvsxwqUdiSM+FmltJD6ijePoyL6eDSDxHYz/seDAiT
 N9GD7fxPInPTAir4rIV8s10G/GBlxy5IctmxZ5zmTqVI05P8lrgAEgtY+vghcFtiCg058mfCug9
 cq3Y8sH6uXXxNDds8lbzNx+IvkP+qofDRCF5kyMEexQuB2s1tkWedNxTfUIEAzlbkEleI41OB7s
 q/qsCnoLjx1fio/B0+BBmG/rAyDpoiNl6JLMY0wEC37i+mdVajPwqteVW51UFtX8SpSoLKlDTMM
 mKw0pfW/3cELbn2Br7jE/H+CDShs5JSrBlfpnzozxWBkA5RJJfv9PgxhN3+kH76kJ58vByjHRHy
 ph5cMFrLy1s0HxEfS/ogCykmPLQRwbYPRWeVpsUPC+RmBo6TZTLPBxHTkhTePdPRNQvalymGYce
 pBbzqnznTVCAlkTIxCnXwvRO0fkfGIAuYcLHqZv5Mjfp/MGv+hX/9ppwqbeRVhsacoaaKEHCylA
 uA9yO4B5OLbLQeg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_005037_623745_E4F9F873 
X-CRM114-Status: GOOD (  11.80  )
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
 drivers/gpio/gpio-virtio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index ac39da17a29bb844b0dd1e36eaf37670261396e8..92b456475d895912c903ad04a9d101daab5ceb58 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -194,11 +194,12 @@ static int virtio_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return ret ? ret : value;
 }
 
-static void virtio_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int virtio_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct virtio_gpio *vgpio = gpiochip_get_data(gc);
 
-	virtio_gpio_req(vgpio, VIRTIO_GPIO_MSG_SET_VALUE, gpio, value, NULL);
+	return virtio_gpio_req(vgpio, VIRTIO_GPIO_MSG_SET_VALUE, gpio, value,
+			       NULL);
 }
 
 /* Interrupt handling */
@@ -565,7 +566,7 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
 	vgpio->gc.direction_input	= virtio_gpio_direction_input;
 	vgpio->gc.direction_output	= virtio_gpio_direction_output;
 	vgpio->gc.get			= virtio_gpio_get;
-	vgpio->gc.set			= virtio_gpio_set;
+	vgpio->gc.set_rv		= virtio_gpio_set;
 	vgpio->gc.ngpio			= ngpio;
 	vgpio->gc.base			= -1; /* Allocate base dynamically */
 	vgpio->gc.label			= dev_name(dev);

-- 
2.48.1


