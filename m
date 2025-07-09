Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E56CC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 07:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0GTWsOu9uG2ti17ZWFd+vMXd12l4gYF9Zgggg+N/48=; b=JQoOmo92Qb0sOnb1RVC9eMZI2j
	yRXk296zVR9q4VhcJ+SFNEPBLlWkAJ0TXu3jYI1t91dE9HvaN2oh7Sj4ZNGqHep4Un30orTDwVvUe
	HRQx+9UA+IptZ4wdi96iOoy0KmjrjpPwH06bLOg+WpNZx0Sc4WNwwFCyMDjG53beFCLx6wEIdv9tS
	d15pUkCOyhkrYxnZnMgfip6J3pwl3vrgt1Wxg+oZhwU9Ex+BzWduUBdREl4FK7IGYWq7SsgM98Rtg
	KUcpjZp6i1GrFIVgKnWxSX5T7gUQh6pUYMzxXfv1lxkIpwpQpmVe8x4chOAM1R9Rl9Khe05CvjLHm
	jaxgr8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOxA-00000007mEg-3NqE;
	Wed, 09 Jul 2025 07:10:52 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOVc-00000007h8l-3W2V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:42:26 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a575a988f9so3337303f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 23:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043343; x=1752648143; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0GTWsOu9uG2ti17ZWFd+vMXd12l4gYF9Zgggg+N/48=;
        b=Yc50H54Q2hU1sj7kNXw36fceLubRynQRspHI8/P9ptYAqtFizFywX4aXcFF+AZWwj1
         I2g/SZgOeYsad52Xd1+Lgk+Q+cy8LUa4C8La8lEznwQ3qKrqgJcmWAKRWFS0kXylxWzL
         KhdBuIIkma6XvegIthHsndV8u8C4wB1vk21CIrkGbzvTfYDOzFzURld4L/DpXph9y9iA
         7GWMnTJPn2OdM3K0ht/sz67qMizlAcQUyxUjAmFyf6+6qv8yTCLWJEBnxftKnyyK+MRJ
         7V+mOMFiqNOTIBZ/YzFcMJegk4oRGBuBCOOxkHawSy1WiveCD8NSVG8l649Nm+Kwqr8m
         tKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043343; x=1752648143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0GTWsOu9uG2ti17ZWFd+vMXd12l4gYF9Zgggg+N/48=;
        b=THHykT8xRDNaAhgeMleM0/eRCC+AXQRyioUI3rSwRya4kLDE6uX4wlhhwp51VLsChg
         rgqfh5ihsx8PdTgBzSzt7mzayStY86/Mz6/jNIRMiEsfKwREYuZQUUZjy56GJSEnuRZX
         MeVL1NS3xZ+Fro0WVTem+IowlKrgP6NaRhjxt9bG2FfJON8iBMuE9YXzev9++546Ku1k
         s08rjnH37xejh2C/7Igg1eHZFmuftXjGCp6oGNJ1u1wfsrBb9KmXVap2sr7dNEYORZwY
         rEDz7ZhOYy/ggjqnNsszrQNxXjgxu0ldsNo4ldbXG5bmXWvdRFLttPDy6jNbFGf1ttFA
         cPHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVGIeQoO/U/RH/gYyA2X27WCLztlt7Gs3qDf03r0iGJTDdvnISLDVn61kYsTK0iQBCBgMPpYNKNo8w1bZCPuxu@lists.infradead.org
X-Gm-Message-State: AOJu0YxuQRkLZlB3LHBeCIxb6TgDVmQGW5XQbXXYm2NH+k6moi8zSe+1
	VbEW7PTy/dFMC0w8TgB5dYvqc+s0ZoEHdvmpQ9spzhLNxvM5ICEahnMD6HgQHpIG/LY=
X-Gm-Gg: ASbGnctL9ZCo7M97yxy54a+gNkuVeWdKtm5lSdG6iDReXrIytKgAY/x6rPbuuvKr7WC
	gDNdsCA0QHtP8i2taWMTrxbmhGSUnKTRiQm3MZvSNqJGR6z7BRqOmYJGq6ciZD+cWJLcfDI2Q9N
	8YIh485ZuVwKK60odOQuJYJ9lCFd8RoeqUJFp6QWtJ4KiBPBKqMrbL4+TeFQrl938O7dA8w89hD
	ShcLAPbWZ+/kthVnMnopKs/2oLHMNlHf8Kj/5OWqSAKrFHBDSCMC+y3hky6sXnfSwXQkdNkf2FF
	nPd5qhTRXfpdqbqnZxXW1fEG+K1kjSP1CnOnz/r9NAwc5XaX8nMNyVimF3+a+6mlFXw=
X-Google-Smtp-Source: AGHT+IFbVMdr0d75L9LrJuFHc5bAfTPbriBXW9lunAoig812CMNUofxZz8NhxaXM8EzbVQEAg1u24w==
X-Received: by 2002:a05:6000:1889:b0:3b3:a6d1:6b57 with SMTP id ffacd0b85a97d-3b5e450feafmr929702f8f.44.1752043343330;
        Tue, 08 Jul 2025 23:42:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:45 +0200
Subject: [PATCH 08/19] gpio: wm8994: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-8-b8950f69618d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1773;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bMvwtPNiNt63LSGpmR7OHG6qZ2xwr4UBH+2k6s0DqNs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9CCt462eI2pn9s3uEO4I0tk6oJMy8Tvp+7a
 3Nq0voElFCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQgAKCRARpy6gFHHX
 cgE0EACp3RSpGOITFPecyCp/0Xj3r9cidbDgW1F3GQ9BDbUKvb4s1Yvm/Cp/XgwvFiLzziYKjHS
 Izvo7p30VdlU4QZvfFDI21uaO06VuiDw+hOKGn0W6iebNslxzAH15QKrmc9bw39ZRYdzbea3vX3
 YRPZkLzi0PG0X+Z23xs20DuEsGFISlomz2ICShJzHSBpnzS495xrlqCmgbT2BaegDmlPxz4XPWB
 oa4kBwyt9uiSuxu3Vt6kyHCPBczXiVLGcLIAaaJrrilmlhUPSV7ydFNlhfBihSOE5VLvCQEV3AD
 i/3KZvSTgIv3D9pZAECKrR4ZmCbKujPdqY1MtJEw6loAt3zZx03/1CXMmcY/QwV2SfATnccSbol
 Qk6gT+SSq2uWK0d8ujUtf0PqvHzESnDvLY/SdtId0dN5V0CV+OUUAyz/LEFuQD8uOfrOgiTAmc+
 p0DylAqEuQPpBAGHnJHGejWrf40Ru4TzK143OVIVNYF/sJnmxQeZHu43d/6a14Hd6VU6oEluCRP
 /fSjRuHsSKDnIXr2FKl27mfAgLStmLtLzSJ50eIJpv1dqHl2YrAxFur8s4+zJGwKnFo0q49Tc2Y
 s21SwIPty2xRofxYtrfYojak7m8Pu9RrLW5Wc4XYS9S9j9yKqpi17qJ1Kvb8ZNLS8yuOtP1eH8W
 OdAeWmqZDOYJdIA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_234224_882741_F016F719 
X-CRM114-Status: GOOD (  12.74  )
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
 drivers/gpio/gpio-wm8994.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
index bf05c9b5882b89c1abbe7a0617f6a45e2968dd50..ccc005628dd278f2db5e5d8bbefe89dfb1fb2f67 100644
--- a/drivers/gpio/gpio-wm8994.c
+++ b/drivers/gpio/gpio-wm8994.c
@@ -89,7 +89,8 @@ static int wm8994_gpio_direction_out(struct gpio_chip *chip,
 			       WM8994_GPN_DIR | WM8994_GPN_LVL, value);
 }
 
-static void wm8994_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int wm8994_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct wm8994_gpio *wm8994_gpio = gpiochip_get_data(chip);
 	struct wm8994 *wm8994 = wm8994_gpio->wm8994;
@@ -97,7 +98,8 @@ static void wm8994_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	if (value)
 		value = WM8994_GPN_LVL;
 
-	wm8994_set_bits(wm8994, WM8994_GPIO_1 + offset, WM8994_GPN_LVL, value);
+	return wm8994_set_bits(wm8994, WM8994_GPIO_1 + offset, WM8994_GPN_LVL,
+			       value);
 }
 
 static int wm8994_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
@@ -254,7 +256,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= wm8994_gpio_direction_in,
 	.get			= wm8994_gpio_get,
 	.direction_output	= wm8994_gpio_direction_out,
-	.set			= wm8994_gpio_set,
+	.set_rv			= wm8994_gpio_set,
 	.set_config		= wm8994_gpio_set_config,
 	.to_irq			= wm8994_gpio_to_irq,
 	.dbg_show		= wm8994_gpio_dbg_show,

-- 
2.48.1


