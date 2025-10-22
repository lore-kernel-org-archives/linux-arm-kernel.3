Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D05DCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLUcw2OFBeNQGOHQeLxgckCo4wtobuiOcK0Z/3Mk7WU=; b=t1gscj1UdZ/npFonv3K8s33Pel
	smP1mrfgGSkWwUn76+lUlaPBi5vjnb2aHb6oat0ndaDji9o3jThxbJjhFIdnwiX5P18K4aFkARu65
	GtYW3QnoDj7qf9TR7Vm7fMh/xp/5ARgyv/bhskhxsdkyUtP+7ki98xW/NfS740NP4w9/P6viui//y
	t4ySFl/ViLmwFI3/T9AhtqLZErsIu+v+gA0c15AdU8xS7lCzokSaaks7u33/auhnNUs61iakDUYSZ
	Z0t7SWD56K/TrXQMHsrNW92kY9aHHkQoaE9kQM9LEX6QNrfz4ioXMNxaO+wvl/jL1oBex/BR6WzHT
	5Ca4uFHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYcT-00000002wAE-3sOJ;
	Wed, 22 Oct 2025 13:11:13 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYcL-00000002w62-1L0E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:11:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-471131d6121so52264455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 06:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138663; x=1761743463; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLUcw2OFBeNQGOHQeLxgckCo4wtobuiOcK0Z/3Mk7WU=;
        b=IDE8vhSD5Rs8o/shXgNvjNbinrWNb0LnxPh+EosJPi/XFlhZbr4JBxvvJiPLqOghZg
         q9HZw9W/Y8/Ly9oWoqDQ228rCePkHohwr0UuuDRYZ64HJkm9PhtYLMTVP3r/SraPAGzI
         /qKF2P57bN4FpT7d2d2EKiXWdW5UQmMHCq1hBbVbiAl9qce/s5TXFWj+XOzNwE/6FZMz
         IWUTwK+EiaBP8aeTHyF5DE9lvMkNL0lCIQutpfm3gm4X/Xxo3JpCscS7btb9dHJ2BrR+
         i+BS/7Wxa3Yn/xavXEhZjKsRWirGevq3smMDA5TMZp/4SzKL+7dDrLPlOdbW2DoLqnPw
         901w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138663; x=1761743463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLUcw2OFBeNQGOHQeLxgckCo4wtobuiOcK0Z/3Mk7WU=;
        b=SPme+lM2Dny13h5J6rDJ642av2F7vljKEQXGg/sIpN5ks0/EYaxFP/TRmT+gKiRhJd
         y7xKSp0HM+JvOlRVpHabSmxcSM1ooVMlfkjaoeqJFC6qw+ovRz3GNUksgA1z4bbx1VuH
         6DDuO74vxoyiwoMGRGWPnbd8EMXHZP6CLBrvvCzcOye5UKSp9UYiYz6lyeTMA2EWMUW9
         JJ1CBqRGDIxHbqWJHG9xqpnUk+fIogvmSojc9v3et9Pa73Wm6xxxkY2q92hqzziv2oJJ
         HTQ+cK98tLEA8X+ESV7wM+Ycy/S6xx+Q5ITZuNFAYm74AJmjDUoewd+2J2U3/ubTgMBG
         ejZA==
X-Forwarded-Encrypted: i=1; AJvYcCX0qqr7cN84mwmev8cv/93mwrtfinJQbQHMdt0iG1VxOJlNeuiuNhm+deCZpvBGUC6vKmEUYf4rYLnhttnfwt5t@lists.infradead.org
X-Gm-Message-State: AOJu0YzYKjJqq1vwc0CVaWWrB0BHUeWpDjWFovLsxQdsgDJGDCRNF4Qr
	k1DWL7UehBA2/8TLToTZWvQIWBt/31tQR1tncT4qFNqWhd7Z1aEsVcC0wQJOEmydkTw=
X-Gm-Gg: ASbGncuDSoYZBieNq15gENRe0qg+zdf4yT0JAKenebDyOuBmi9rpDP03iyHiDPSt+iV
	X72iRC4TUOzmdumsRAMmZl16+KjJhr7YIWl9DVZBgET5FHFvXnE9eOHBBTtfxpgacbfRBZ5zGiY
	zaW4T84Gq6WnvOLxkjIkfN+1kwOXEHqW7qOg6mfPN2LTWOt91WuQ64lPSkaU1zb1tmJEflni1G6
	Z67h/6PchZGKtKp824VurK/PDyfp2XEuQnvdAbHl22Z4MYbA5r3Ek8MshiX987yxeL3b3KPdUqO
	g0z/aA47OZd51+puyBMMLWVrWPwOC6zV6wQPMG2hA+rPgbOoqHO8HkJDyxLH51c6JYekTAurWEb
	x9Tt2gGNbIfScBon+NS1ax0NM0G3lscrRTiMK080x6LllhC3FYbup6TLOZAr8nn4/xGgPwnkTyv
	Ztd9Cszw==
X-Google-Smtp-Source: AGHT+IF2yoMxKRceyJY5g7EYD06lQq4MGEUKhu1hgrBk0d1+Vdu+vYEezPyJjW99uVj5oDoAk/M1OA==
X-Received: by 2002:a05:600c:4448:b0:45d:e28c:875a with SMTP id 5b1f17b1804b1-47117912b0dmr153800955e9.31.1761138661004;
        Wed, 22 Oct 2025 06:11:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:11:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:10:41 +0200
Subject: [PATCH v2 02/10] gpiolib: define GPIOD_FLAG_SHARED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gpio-shared-v2-2-d34aa1fbdf06@linaro.org>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1034;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cX89PpdM44a3eQ0k9H2mF6X//0m35VFWgOWbVIYFNfM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+NfcfcpMLzR96W7BN60H4x3MK6Q+puGFD9uIE
 wmMWYL6QtmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX3AAKCRARpy6gFHHX
 cv4hEADgQsk4SDqsQQ4g2XVBZsPrB5rQs2uMZN0YJS0NTCuXM0VRt8+hcPaZqBiwgJ/aqaj0piN
 /NSpg+kXgqg7ZrB+r4iMLM7BwWFCk0uRXWTDqnvnr6IYOjiOk8tmrng05Pycm9LuHYzNxCIuzkl
 yLT3Ixm2/TxEY8e91EQRqZwxggaGKdwvENXSdcCJwXiWIGaCKaTa/HIDkkJHitBi3wU9hmRy79H
 MU69QTGVIu5qvdMUJO8L3eUwgzxZ4poU34/hJOvi7I4ivBvnCT7fcZqWIIMsXMe26WS+kZMfd6p
 Hc44SjrXUUje/Ntlxl0u+T1U7PFLaHoElR5h1t4Uv+7VyrTaGyhPxWZV2x7h687RKI50sv5V4Hf
 a/KahzwR8wvuwT84wDya3UTX/Dn4PCcNnJlN7BKCE58QJ8eVvUybGhEEUd/pEKIxcD3sFCcWt1r
 IRWNJ5Lmx8FQjzDGtu3Yl7DKVYXhfAJsC+59NnbGprw+ZLrVIMNpjhjyPZ7otpfrcDQxf6XJ35X
 wMPLgFrbkb3z9gmBRGl6ug6KGXgsc0Q10xXksnOMpMYWy30rL41Z0pa4GZ48zVmtHszl1luX9dG
 xdrId88bhFySFAMazRmpG3q2PafzOnaTN3PdOT8C9kL39JU6486eE3+eqtF8nP7jMkGWfAhYYsX
 KQaaOpV+fZHnThg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_061105_389388_35D1ADA2 
X-CRM114-Status: GOOD (  13.38  )
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

Define a new GPIO descriptor flag for marking pins that are shared by
multiple consumer. This flag will be used in several places so we need
to do it in advance and separately from other changes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index b4c5369f8a3314244424d0c90ba006f7568b314e..ae9aa145ca055c08dad55a537567a27de57f7066 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -204,6 +204,7 @@ struct gpio_desc {
 #define GPIOD_FLAG_EDGE_FALLING		17 /* GPIO CDEV detects falling edge events */
 #define GPIOD_FLAG_EVENT_CLOCK_REALTIME	18 /* GPIO CDEV reports REALTIME timestamps in events */
 #define GPIOD_FLAG_EVENT_CLOCK_HTE	19 /* GPIO CDEV reports hardware timestamps in events */
+#define GPIOD_FLAG_SHARED		20 /* GPIO is shared by multiple consumers */
 
 	/* Connection label */
 	struct gpio_desc_label __rcu *label;

-- 
2.48.1


