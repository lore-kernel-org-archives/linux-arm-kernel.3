Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842DCCD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5md7O2xvTV43+eK3/wu5mO/23eGXmmz5QIIajGxZX4=; b=QAJ+T8BVfj0i+SExZZm6sthzPt
	VP+3OkAAqDY3DnIn6GwDIT1ONHTuDnd6GNHuW92IXrLA2meFcnGca/LM9sdM9H4f3mJw8d/+yr3qy
	ltw9uLct9BXr4kEm99oKRF0dPEbUOf6oMY4buZ8cxtyyO3qk7cZAiDcP8t7yHo5pYxf+4Nx/rfggw
	dx5BanimgZtjiMSXAklPjMC9/pGRjX83O7u8wBPwTuiwlg4Ap5zE3ls009O4OIgSwIiiSFk4IfdBX
	syRwa+qtzt2MDzkr/gWQkPGDqPr8Y8Nc5WPRcgkt/r8jJhdtEspiazLKqlHLZW3IXEZDFtQLvLYYL
	x+FKtKeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOg4J-0000000DCOh-2jbs;
	Sun, 17 May 2026 18:18:27 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOg4H-0000000DCO0-2UFK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:18:26 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-69b747a8984so209580eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041904; x=1779646704; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5md7O2xvTV43+eK3/wu5mO/23eGXmmz5QIIajGxZX4=;
        b=EH7QpyhEryUcLLEd9kt3dZXHQPHqcWBaQFYpoh0S0jsqDUEB85tC1Y+DBYXD1SiSPE
         h8PQfkH7vKYwp0QGV5IHp1moHqVZpw/jq/x6bkY+9isPdwZa7QYLUH5+5f3G0T5AkjlZ
         Q8Dzj/kMftBQymAZXRMQflkPF5CYNGWDtg0SY9BltJIptrPWsxJiTjvYVV//wGH83CU0
         BhiEavpiczFAnQ+dyWEwNX0YnFwNQa4d8mjpGw1tg/3OK66vXld4kM2KtJxjZWBu3ytZ
         too7zcrONN1bgy5dtwt6YcQ9fezR7eFgl/hF9Kx44nK/O2ZJI2JUBTbLavy0wPrtaX4E
         h7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041904; x=1779646704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R5md7O2xvTV43+eK3/wu5mO/23eGXmmz5QIIajGxZX4=;
        b=qKEo+Ztx06wUqqzI21kslDNQxcZfEzoMrsE3TtNp/mg0X6DP4m0eemNECP4CmQ53Tp
         epeo+/GI3vbtKN0g3nrh2diYfNUM2CbAaiw5sL7Pf2Qm8uVJwi92XO42bmedO1hQzAPu
         PWHjpKOrj+NFDGCjOoqJGqdgRJ9t5e1Xid+JNCQ6kSOjJ/1QU9tYBM8dcYdh+O0Q6//I
         fBptRwS1mOfJeGQlWZ5dnL+wuGGJztQaXARDwvIAam/bSK0TAnDBpeWRPQM/zkhkUiT6
         F83jbgnErCd+KX3jhnrOv++IjZ8kh514CbpkjLTzlE0NgwXcjpUwYO2fwoyibzoExV99
         EL/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9YE659fSxU5v0H0QD8XjKM7RweCErbUts/qOhNsQqjyzIbK6Qjz0iyo+53sEAX+gN649FO2ZWvGRjHBYrdXn2n@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2JPld+tOiTeemykb6re+DYsirl/YNV2I++gQmoV5PMdNvdiB+
	l+fwjF1SyNkEyqNn0M9xpzLFemxDwgZN5VnZOkSjFFURz0VjStw2rZSIoYZMqXf+oSQ=
X-Gm-Gg: Acq92OFC+cHnMcKVGXofl83iw73Zug1/hxKPgDZwYsbCIymHiywqRofnMDbK3s3GxqB
	80viFgQBk/gcUz8YwSlP4nYZCr9UEpm053+vclQigOAUaTSXGTeDqZB9hvj5lCxXq6G54r/dH16
	1QQ77ZZSZZQEIpMGZfjqJb/RZHlFfXWctBYoU7A5qHbLC73SNj41lTWTm0btZu50dCpB2kIlH7q
	h5OI/MuI4sVcLpATllQn4H2ERbvYnGUvIndZ1cUt/MSxoDGUD1PFt6gDmNFqxRfC9yLGd4+1sX8
	0xSdG4t3T05FW4/w7bgJ/8lHjI/lZQGfWpssgsWwWgPYy4Va/kA3arrMY/zMQd8nUwOtTfTqEzP
	Blh5G68bRqw6t0C+uCcDxrdxpGNToGvl5FpGXYzhGjd9NatIPHuXRy1sMhEw+qTHReC+YkB1dYu
	O6N5QDy2ryatdMC9HQyhy5LP1DRGImX4FtU1RHLQ==
X-Received: by 2002:a05:6820:4c87:b0:694:9707:4e59 with SMTP id 006d021491bc7-69c953dd3b3mr6941197eaf.46.1779041904452;
        Sun, 17 May 2026 11:18:24 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:18:23 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:18 -0500
Subject: [PATCH 1/8] iio: common: scmi_sensors: simplify timestamp channel
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-iio-timestamp-cleanup-v1-1-61fb908c11c7@baylibre.com>
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
In-Reply-To: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
To: Jyoti Bhayana <jbhayana@google.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1891; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=YHpI50wSYZTXW1ieL+zX+tDCAyrdW9auMcLS2k6lfoQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgY2aTT2VX5TYgMCbz8OOiBDnYFmV3i0a+6HO
 ro398kMNK6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGNgAKCRDCzCAB/wGP
 wOFCB/4xQ4eSKQgFfsKouXQR3vu8NexauORSshAXou2t3MRLSZK5t6EF9VUuh0inu/5WRCWFGej
 u4u1nzKt/RtnOitc15cyY9Nnn7nkczdAzczNckuYghWXqK91XhaJgcRwG/HFuNtLIj4lKoxm+Sf
 q0Pu9iIKleW9yv4r8X+98Kbv5DjrCSCaPYDHTexcSLUAT8wJohTJAL71EMnB6FODtdCObmx812I
 rURmDEmfF633QDjdS0XJe4MEqg1T4IkiUhtfcGY8NszNTCxYMwSfI7i0oUR13FIruJz1m3VsXVT
 jK2zkSF2GmXef8vaZjcYIebODvZ4ngMnNUIx3PtA78Mw9WPo
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_111825_639170_D7E943FC 
X-CRM114-Status: GOOD (  12.24  )
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

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

In fact, there was an error here as the sign should be 's' instead of
'u' which is now changed to 's' by using IIO_CHAN_SOFT_TIMESTAMP().

If we find that this breaks userspace, we will have to revert this
change, but seems unlikely since the timestamp channel is well-known to
be a signed 64-bit integer globally.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/common/scmi_sensors/scmi_iio.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/iio/common/scmi_sensors/scmi_iio.c b/drivers/iio/common/scmi_sensors/scmi_iio.c
index 5136ad9ada04..86e1782deee5 100644
--- a/drivers/iio/common/scmi_sensors/scmi_iio.c
+++ b/drivers/iio/common/scmi_sensors/scmi_iio.c
@@ -419,17 +419,6 @@ static const struct iio_chan_spec_ext_info scmi_iio_ext_info[] = {
 	{ }
 };
 
-static void scmi_iio_set_timestamp_channel(struct iio_chan_spec *iio_chan,
-					   int scan_index)
-{
-	iio_chan->type = IIO_TIMESTAMP;
-	iio_chan->channel = -1;
-	iio_chan->scan_index = scan_index;
-	iio_chan->scan_type.sign = 'u';
-	iio_chan->scan_type.realbits = 64;
-	iio_chan->scan_type.storagebits = 64;
-}
-
 static void scmi_iio_set_data_channel(struct iio_chan_spec *iio_chan,
 				      enum iio_chan_type type,
 				      enum iio_modifier mod, int scan_index)
@@ -629,7 +618,7 @@ scmi_alloc_iiodev(struct scmi_device *sdev,
 					 "Error in registering sensor update notifier for sensor %s\n",
 					 sensor->sensor_info->name);
 
-	scmi_iio_set_timestamp_channel(&iio_channels[i], i);
+	iio_channels[i] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(i);
 	iiodev->channels = iio_channels;
 	return iiodev;
 }

-- 
2.43.0


