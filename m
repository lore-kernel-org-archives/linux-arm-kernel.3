Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF7ACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 01:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XIM9OnRzGFA/35nH6Wlvv7D5+fTDWpMhEIG9GUqhfM=; b=BPM8XRIUmKJJ7FiQheU4InYhLS
	KxQ/wtmmjPUcgk55w2bZlY24YxvgNSscMEfNHXAJFRehh31gYvvJcSlwxoYyTx5WzShW+iDPlD2e9
	othorKlJFyGJsG6FPMRI53LiCeiHnU0xsIfhq0Lz7JeNm+b7QaHHa2R0XPkpqGVZG80AMp1yz0Uf0
	UwWUaq3eyR9w27Xfpqj2MK6A6ZWuinu/gUBeIMqqGgmUIZN10ioIMJ4gX735YrfuC5Opfzxe+DE5G
	tFyGiT02qnEqAD4vtBIWvoiCKwXQ5lYuQ0dnpGxEQFukkJygTNZF+vPzTIongt5iSh0xrT4mZllOK
	Dsb1fgvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKId-0000000G1xY-3hrT;
	Mon, 25 May 2026 01:40:11 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKIO-0000000G1nD-2Hbr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 01:39:57 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7e61e251966so589145a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 18:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673195; x=1780277995; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XIM9OnRzGFA/35nH6Wlvv7D5+fTDWpMhEIG9GUqhfM=;
        b=jjl4OJeKIBpAKbPnN2uvdY3HBEO6zPqrzdAPxxlMOzLhkek8bUqUL6UEQ88MpDbEZo
         DT8A9jw6vI7xLAbWBLFCG21SP8k6EKzSJBLQ5+T7RX5Tt2G3ZcJ2Kv9Nwy8uuEzCCYRa
         aC0XGgbtcc3iT3tOgHtfpfiFBqWGFxMUHjtNv96RHovUyVh5N7OfcD/kpicSJ8nkuwbz
         HWLUML4/LWKetAcDVpPGPiTCoQyZVo2LtbZ38jhA601RT8mgowZcH+3ajnTLFqjFvZSN
         iRzU6ixBYs9O+H3CFoYUhKArzz2yD0FufJAbz/4c0qSxpxfKkysNq1LUwez0YbAuxn3T
         Qq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673195; x=1780277995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9XIM9OnRzGFA/35nH6Wlvv7D5+fTDWpMhEIG9GUqhfM=;
        b=B31ekH3XYanEMnHabgJWQcaBL/guoeUoqyOCVQ9epxTZOgyWZT7eK9BQ0dsHtHgzjr
         BHImTLPNqsr1c2sNmVVd22Mgp4VP2AL5NsPreJ0XC0/eDPzKU1xzKU3iZicfRhluzTN6
         3WhwMCEEkDgL+d8/pyDZbAxcrSgMc6JN6aC6uO2rNupA/N9xghgz0R+apeit2jNc76+7
         eP1xDTgFbm8vVxJvQs8YW7E99bkKiUlQtw9tWQvU1qzz/BksTvQki+Eh5c9lD5/4d/3T
         KVCf9HfXvGba0sdJrbKyxf5USkZ5i8nnUbKBFpnt81C4M/tT2PEJO/5pseYddkW49tUQ
         rssQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FFeaqm5qgkF16rbHmvte9sqqL9WsXtv/OZ5NALdtj+f1NTSwrKFFa8BIpMwhk9IFttgfCYLYedcaglTEEcmkJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxIlEpOaf/Is1w85hX2SD27CtBFit3lJrBOY/AKsmn86dcfeRcL
	7irx6fi4AOJpVKrOvC39NpOJ6q3gwPS+ey8Dn4DS/L5ajCiMEkqJaaOypyzmoy7hdMY=
X-Gm-Gg: Acq92OHFFlnAqhEiqpn9hCL+Yj8Ws4ukT8TGiQIsx3ccSQW3aiFyfV5kd6pZybydwuP
	1xSNXS/fABoD+4vbmDjhrFU/UcQo3PUGND+/73+5RZ/ILGJDuh0VC31pdmcmjAkAzJmhwZor8tk
	UowZQC/tLv3L0ifub7wum9YE55OR+4lxdzCfzFH0jd1P/Xk6TFuTjnycHKxEV/RKYeiRqkL+4gF
	gxRoqQ6vCpODlIjcq+PztHtI9BKRbc9RVDxPFlrxt/wSrENiFZq9HRVlfXqV3cnEUS5s0Jd1d9K
	KnoRgFi2uZ+46/gdIE65eUdym/lk2hYTTYhf0LsyiHLwEFAzjr7+HuzFgMQnNXCRFhh6zJFB6k1
	ZXVFVgqxlIgzos/vcjnWz7m1sbywBanoVwp/sFdGbSazhbFfCwx6+ZvuvWjah+BJj7uUwvEGggk
	Q34RRSYRJmoCD+r6JRZK7+0D1B10eB
X-Received: by 2002:a05:6830:2b28:b0:7e5:68ca:8856 with SMTP id 46e09a7af769-7e5ff0cd9a8mr7659996a34.26.1779673195498;
        Sun, 24 May 2026 18:39:55 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:39:54 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:38 -0500
Subject: [PATCH v2 6/9] iio: adc: stm32-adc: simplify timestamp channel
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-iio-timestamp-cleanup-v2-6-c37c9408b7f7@baylibre.com>
References: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
In-Reply-To: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=YS6jCjPN/UIoggB95tUfxTv9uEHe7AlMRn11CmiFLdc=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6hFHAQyCONXja9H0qJtqJqKBq0yFqO1V5bYl
 UUyScLbRw+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoRQAKCRDCzCAB/wGP
 wErzB/wMCUV6Kulh51VMVLYxbDxRqv2BQZyM4BEr7RGpkMe/7Sr5HhXXNKGKeXJlc5yf57l7AsA
 vEsbN8YovaCmH8igLt9085Ee1QmvXe7rqmLPxILVsisABoUotxEWojib1VpHUyh0y+5oKbvCkFI
 un9trVfnhd2Fkr/rMxT6n347Q6AgHgxxzlckMEsMl8COcXXQGhHNuk+yxIcrU3Pom7uFoleeXXb
 ZLcYLd8BJMp+OBmBH0kreyAOK7vuqjllPoTjNkQnZRLUYY/HtjMCQGYwC6UZm4XYtO1aP9kGOyK
 JJaCG5ByQgdUjZh0Z6DER1eRR/h5VNepua6TfjsZTrje3fw8
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_183956_592400_3C6FCDB8 
X-CRM114-Status: GOOD (  11.13  )
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
 drivers/iio/adc/stm32-adc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 46106200bb86..5c5170b19b56 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -2443,15 +2443,7 @@ static int stm32_adc_chan_fw_init(struct iio_dev *indio_dev, bool timestamping)
 	scan_index = ret;
 
 	if (timestamping) {
-		struct iio_chan_spec *timestamp = &channels[scan_index];
-
-		timestamp->type = IIO_TIMESTAMP;
-		timestamp->channel = -1;
-		timestamp->scan_index = scan_index;
-		timestamp->scan_type.sign = 's';
-		timestamp->scan_type.realbits = 64;
-		timestamp->scan_type.storagebits = 64;
-
+		channels[scan_index] = IIO_CHAN_SOFT_TIMESTAMP(scan_index);
 		scan_index++;
 	}
 

-- 
2.43.0


