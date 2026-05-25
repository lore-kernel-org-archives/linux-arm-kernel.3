Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66033CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 01:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dl/suvXhKsrJ4+KHwf1f2NduFgl57g1mFMb6s3BomEY=; b=Lm67W3fXWpunk2i5reCGS6ESXc
	/ocBfUXrIGtnTjnEAJGnbpQvNwHoXy2LTUt45c5/H0G/Vtz3Gsc4FaeUkpAp0GXAfMHhBzODI5Qev
	18myT9FTaK9lvJmCEN2bYbtOFx8QL4bCtAY3zVZTmmFfgjaG/6XDTsp0ZzDTZry4hZxSXniMue1dZ
	ZnU6xvB0BW/8RA2+VGCd8p0XbrOtnUfBq11ZD+OHIMC932HPhu2phMqTqdAYrqm+YETORImmBr+hs
	qpEuw8RKitgwuK9ST4Nalw+WSfqAMac+F2KlZw+8VsU4Z4WdeQSrPBTXKuSukUIabCCbtpitfvsau
	Xg8h3MHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKPQ-0000000G3LU-14sL;
	Mon, 25 May 2026 01:47:12 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKPN-0000000G3Kf-0V3q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 01:47:10 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-4855003fa6cso1779983b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 18:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673628; x=1780278428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dl/suvXhKsrJ4+KHwf1f2NduFgl57g1mFMb6s3BomEY=;
        b=GusVr1kvJKlCr8vCYh7loEfZ7eu//SbAsCO19tpuYb5/EdUGacTVWiYTivQk2XRx+E
         MdBRRBz+m6TMit9SvVjGoUK1tjDxHH42MQXg7fRmFFcsR+IaR0Yb7teHmIm3lDR+sk6q
         lMk17XKBqFmlK9Aq+R3xOx2YbANbVYH04w7TZNsB8G1NYmyXaYAGMu9gjAvsKIPKIj1u
         mJte2jptREIgadDaRziH78zm/WygxTDTtN4sW8cXl4stmHXU/hcq8X/Iskxj/E67KPlC
         6Rzu9Y8tFGTZ4zDBlnLwrgCjS0TA3JP/xUAXeMa06quXtaz4VHYLE2PRcGNSyYgQPv9L
         3/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673628; x=1780278428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dl/suvXhKsrJ4+KHwf1f2NduFgl57g1mFMb6s3BomEY=;
        b=Mig+wuHLH35T8V0fpRf5d4kFCraFUEDB+XzHUF/GNQUkH1ja952YeQVcPH++EWRou7
         Zp7pUKQv4sdXyv/5gu6LGPVSctUCYIvbrY8IZlEv1kGrS6KEDljEBAfdNAsYSY6jHhSd
         SXq/5M+6gqagyQMvZpI8xliGmUh+iskaOp68r+GdoOhVJQPZdbTRgrSqxjSr4exurmnc
         DLSM8oXR7pSjLvwCCQev4iPM1VxQEHTjz0fSmk3sGTQq2kVOMiy2F02O848g9pWwSeYF
         Jtfr8TSItO6KpGV5lQxbxeeVO9UDd7L3rLwEzb75SZIoLQEo/WcOgzRusERAeXIxJWB4
         cVaA==
X-Forwarded-Encrypted: i=1; AFNElJ+kZsJpldAc1KJb/zQuCmlVx/txkoZPcKr1EtVwjyIX90URnWV3KVMA3+k7LyrYKcMsKP0VCDRjzAjAbSOB9Wos@lists.infradead.org
X-Gm-Message-State: AOJu0YwxpyWWguB+U/GEMngR2Br5TK6yPc0iZb6Lcj+Km97ZyRKTy4kW
	ivhWAFjntKFemO94qAj++bjSR7vGNT7zt3fQMpd2sY+2p7BIKxVhzJvtZ3Ddpf/S8HY=
X-Gm-Gg: Acq92OF+pN/xAxsr++cJzlScpqA9I8K/yU4QbPWxNq2AqVbBisgKQ++Cj8UBnr5luA8
	bzS2Kp/D4mKDv141+95RU6BMESRRQQobWAQzw6VBkO5ClHfOC0rPoQFh9ZbcwxvcSU8bkjBRwxc
	FfvtXYgUnP00HhrHpP4Gh5Vx8dOvvioxxFo3gHDjqjpFfbSmq6em7epQml29CbSF31JPPW0nQNk
	jc6sU6SCfYBrQPr2GfAPMt7WJLekW7IOavf0HU37ld/NSxKb6WMpEFrgw7xiIoOl5pDSgt32C/a
	QGcoz9q2PcCZzWhUrIWkZuc4b5xdXxrd5wP3fpU2NIghaqOyEk2l7h0eUx5KrC0gckqqaCveR+5
	7AQrQFtdqGawRe+s3INZ4/+pxUrV3MMNhMBbbYmzgxlZkGmmLbBiYj156hUFxTq2hA3ztZMQ5TX
	EgCrk6I/boq23m+WS9JXFkzb3mQ42dLysUynHF
X-Received: by 2002:a05:6808:4fe7:b0:455:f0e4:4f89 with SMTP id 5614622812f47-48549cfca75mr7320262b6e.3.1779673628014;
        Sun, 24 May 2026 18:47:08 -0700 (PDT)
Received: from freyr.lan ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b6350ad38sm9263431fac.1.2026.05.24.18.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:47:06 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: David Lechner <dlechner@baylibre.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	chrome-platform@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] iio: pressure: cros_ec_baro: simplify timestamp channel definition
Date: Sun, 24 May 2026 20:46:52 -0500
Message-ID: <20260525014654.2399354-1-dlechner@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_184709_166044_E437366C 
X-CRM114-Status: GOOD (  10.86  )
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

Also drop obvious comment while we're at it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/pressure/cros_ec_baro.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/iio/pressure/cros_ec_baro.c b/drivers/iio/pressure/cros_ec_baro.c
index c6b950c596c1..6cbde48d5be3 100644
--- a/drivers/iio/pressure/cros_ec_baro.c
+++ b/drivers/iio/pressure/cros_ec_baro.c
@@ -170,14 +170,8 @@ static int cros_ec_baro_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	/* Timestamp */
 	channel++;
-	channel->type = IIO_TIMESTAMP;
-	channel->channel = -1;
-	channel->scan_index = 1;
-	channel->scan_type.sign = 's';
-	channel->scan_type.realbits = 64;
-	channel->scan_type.storagebits = 64;
+	*channel = IIO_CHAN_SOFT_TIMESTAMP(1);
 
 	indio_dev->channels = state->channels;
 	indio_dev->num_channels = CROS_EC_BARO_MAX_CHANNELS;
-- 
2.43.0


