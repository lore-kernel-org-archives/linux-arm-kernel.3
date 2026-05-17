Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1997CD4F47
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6UxGHyqTBFAbz6gyJLQjZxvD5Vh1uuTNWv0BztIsXk=; b=vaU7G6/so3m5iUlvebub4h0zIV
	+AZxWRjxfxTeGgWyW1wGWiToEB1j7rzMpIQMF7wx6et5V0DTEqgArrWjwStZEQrraPM68pmjL6FyE
	eyhRlD0qw0pTqYRMepzBhYJCUoop19BmI3FllQBLIxRpOfW8hGva8v7TTcvJqLsvSl6CAki9icUEn
	QrOtT/sIBNNjY2uz20Fa/iWfPIoODKnVZcixKG9/NYsmjWpkdwCVMnL0yGw7R3V41MQQ1RSaYHb88
	euoRK6VGd6YzB3cngklvQa/G2d8vWw14vQnGwyicqRzj5zRLdEQ0OQo4CDwzWhpGIWV9q/3T0anFj
	//jI/9sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOg4V-0000000DCWC-0lCq;
	Sun, 17 May 2026 18:18:39 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOg4O-0000000DCQl-1CiC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:18:33 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-43a12c2ecedso936121fac.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041911; x=1779646711; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G6UxGHyqTBFAbz6gyJLQjZxvD5Vh1uuTNWv0BztIsXk=;
        b=M/+8TvusW9u5JjNOmRKGnoLTkfLDzQ0GRN15QP5Y3zyxA/oPRhB4ffxS6y2Kb3OSEW
         Ba65wsxoJwUlHSxn2vnxa4/p6UuFvkH0MhpnQO050KsY/FLnL01/R6eCEQ0co3EyASdB
         33F+WZ+N1LBfOQkBOA3Hwel2DqulvQPhjCxokyz45/uTJmEaRsWlKu0VjGu010AA+xMG
         j4Wk/ES77rfsFOI0ZAry2En2k3oGY33XbX6HUDmaJK+3y6T7YikBL4+Db3UuC/U2DzZz
         n8o/H9V1dI8OhLe1nj2la9tbAVxXKznfsLKn8hkAL9EhuS7gSIZ8R/H3D4KYO/J2SDce
         6Giw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041911; x=1779646711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G6UxGHyqTBFAbz6gyJLQjZxvD5Vh1uuTNWv0BztIsXk=;
        b=HKRlfLnn4tWxLWZHa9UsGIJtxOYeC7CqlMG/pMcuUqXXviiowBRwpNfOkNPjP7Lobj
         H0YZDK6lZzlIxAfBAHDiUQLK/Ptxc8KW17Cr+V9r4xhNJyOnfg2WR89JPnOl94tCg0j0
         tQjhAgH/MkZdWmHTurtdxtbegAhgYpYS8IDfhJcQGFbk69Xmdg6nsVILzbCndZMOKsBp
         qsQFGwS8pbsPaGtILAZTmwaRnFVAfhMFd/EHHUg4j1P1O8FZdi2qnrL8hPlLLi9WAO0o
         pNf0BvMegdPwr6qCY++UpISqQV+4gE2X5uhuXbq4tOuKaf4OMQhnI6p//Lnnuc+MXx4z
         b/4g==
X-Forwarded-Encrypted: i=1; AFNElJ9Iy+A02bkXai67AftD3FXn9cdOmVn3FYNk5qZmHsOCMhLGeQQPFSEGzErUOAQITSIFlbCaGl/eNnb4/moJzGOq@lists.infradead.org
X-Gm-Message-State: AOJu0YwSClMuHHWRwlAtKM05zv9Gp1KqJSqxbbnXuZzQRp8hSyqBmNVa
	mK8LdAWb/5AH0Nf8YALwfzBAFt8FZNoADBeEx1f17LiB4S9YoW7wUa2WXeIAjsWOxto=
X-Gm-Gg: Acq92OFDn+P7eENl2ZpJKZqpfNjVW58fOBY/SBXOGTh9so7FydYZKsJCFeIU3ogUqYz
	fKZcpRdJqdH3TAU5JuV6EAMDwo4PupnJaa1edwpqsvT0MqPESl3t05S4QjjLyT2GTtksg/MYFJe
	eEJ3RahLfTUtbhv+Ou7wAQwsO76wzPcGjry+a/otJcbxPaEVBu7wTuu/Km1SyFB7Kwd3kijG0lE
	81iYrcwhEP4/Y83yh2w7zkfP5OQLt0sV/cFV9o4SOfQMnZ78WszqJWJOH+K0fSNTTCZQkYMuLRL
	4ryFKBsxo4kvHO14srboFTD3QR2bCRQooeQgBMVgRn/HWa8YfLnda2RWf0blBHIouwqMxREMJ/a
	JIhE0I3s9nphp9Di6ir3NctPndxTdy+xTi/KDOghjJWYOXr+MTcRJjqgOONgL76yEgwa2/pMfKe
	5zpH7R0GtXtwETxzxv9fO9/U9oz6WK5NAwo+16Mw==
X-Received: by 2002:a05:6820:6ae5:b0:69b:94ac:da1d with SMTP id 006d021491bc7-69c94373aa3mr7665754eaf.38.1779041911234;
        Sun, 17 May 2026 11:18:31 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:18:29 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:21 -0500
Subject: [PATCH 4/8] iio: adc: cc10001_adc: simplify timestamp channel
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-iio-timestamp-cleanup-v1-4-61fb908c11c7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=jMaxL+lkdri/M+fKkvGNkjtPGnxhg7f3ihACoPlbHZ4=;
 b=owGbwMvMwMV46IwC43/G/gOMp9WSGLK42Lwuqlm/LFjzrVdp+58P61ccz7ZW2e2/qC23Qn9z3
 bJVJRxmnYzGLAyMXAyyYoosbyRuzkvia74250bGDJhBrEwgUxi4OAVgIlP62f/ZLFZfcLFibrc3
 L59V+K3MP4681b2Wy4+dNUxVc0yRUV3H/aJx8zJ1P7sj6lFPb562tff/oLnrSySLgKhv/mxTR7m
 nkhfDlfo0+sL5NizIzBdl+3rFy/2XxEvrnwUlzj9DXoSJ3r1toXztdeLZdS8Yw8KL0vLiPbVqwu
 Y+3yT/u//QlDc3ngocPe/GckMkWUxYSFq+5ar8aaZncVJRotZ3daYv/i9+kkW3sZKnL6M5SH837
 9RdT17PFssTckpp46z7c/2oiTZ/wiatj4Zrl/L4ZAifEK+QNHl42d/YO2nqvTPcUp6cX+ua3sXO
 7/onvHhaMOeZJtGpwbGqf6UyPe3FNVk27JE9czA1UuoxAA==
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_111832_344419_4EC4EADA 
X-CRM114-Status: GOOD (  12.06  )
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

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/cc10001_adc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/cc10001_adc.c b/drivers/iio/adc/cc10001_adc.c
index 2c51b90b7101..9ca6a6b33740 100644
--- a/drivers/iio/adc/cc10001_adc.c
+++ b/drivers/iio/adc/cc10001_adc.c
@@ -262,7 +262,7 @@ static const struct iio_info cc10001_adc_info = {
 static int cc10001_adc_channel_init(struct iio_dev *indio_dev,
 				    unsigned long channel_map)
 {
-	struct iio_chan_spec *chan_array, *timestamp;
+	struct iio_chan_spec *chan_array;
 	unsigned int bit, idx = 0;
 
 	indio_dev->num_channels = bitmap_weight(&channel_map,
@@ -289,13 +289,7 @@ static int cc10001_adc_channel_init(struct iio_dev *indio_dev,
 		idx++;
 	}
 
-	timestamp = &chan_array[idx];
-	timestamp->type = IIO_TIMESTAMP;
-	timestamp->channel = -1;
-	timestamp->scan_index = idx;
-	timestamp->scan_type.sign = 's';
-	timestamp->scan_type.realbits = 64;
-	timestamp->scan_type.storagebits = 64;
+	chan_array[idx] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(idx);
 
 	indio_dev->channels = chan_array;
 

-- 
2.43.0


