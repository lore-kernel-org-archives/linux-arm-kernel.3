Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298EFFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 11:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MRULM3iCCqXJE5g/4xg/Q1GMtMSkkTbAvywHS3WulkU=; b=Xh8bgA623Xo3o5TQ8u7lCCE5F4
	+M/eWDXeNN0qAfL36ChT0gz1lQPW2HAjAl0bufnarT/bhaTY0RM44iWCHwnIXoTp3qLMgXefRZs4h
	utiKp52M2c7ncMN7ZpRtJnjBMudpxqrtXvpUUJcjuiZuG1VzTLbRL3xd3OPIyAijtMNhk0CXJHzlj
	Z4IefyHJnQ30DWsXlHrYmgvtnQTHQJhpThTO+2qfJ9y3hIXiUlxPReMFnSGi7U1X+E9glu9AS1I5R
	TTz6q8osKme/AehLMwowh3KaPcZM3uC7qxVuhlixkyWNlzRqoo87dbsAxrSZP1nSzSwVPC01VgKxE
	vLMF27xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHK6q-0000000GnWI-3KFo;
	Mon, 27 Apr 2026 11:26:40 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHK6n-0000000GnVI-34yx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 11:26:39 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82f1f6103afso4600157b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777289197; x=1777893997; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRULM3iCCqXJE5g/4xg/Q1GMtMSkkTbAvywHS3WulkU=;
        b=nZ54fFwhdU3n+tmJtpOcjA0ZGExgTbsEFQd4oyav+zcKmgoTHnEC+AmeIUiDww7afQ
         n0puCsl+iaLKALjQTyAWByX1IJ6UJAQgf0/hk62Yx/haHr/F5uaKF2NG03tIN/BzWe3d
         wQJgrGFweHFOJ1xwnisXuVAtsGcuMVopHrU3lgxn+2LF4zAtWiCpVSJ3o8mfKr8cjdZV
         jZNjTOmRcghqlk/QDFy70XxAPN/mKVKbpkG6BK8CpPR7rtFvTfr/VPNemW5SMTbBDXzH
         J842HLGHWHKIv5wIwpTQgMp3G9Vm3z/b8LGKxk7hctgjDjn5oqeV0pwy4MYnSdJrOQtl
         UCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777289197; x=1777893997;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRULM3iCCqXJE5g/4xg/Q1GMtMSkkTbAvywHS3WulkU=;
        b=gd9E6PYRCnoSk1ngWW4IdsycVG/RVw+Q8iIy/Jv0lMb3Bmsj+2sIWAwjHbEbkEbWqC
         UGwC9tsoVZAJyuWxe+hJhaq7QfFac2+gS828ss4JChtNNBTOin9J9HBO4OEaycxDT7yk
         KOO1j13DDR7Q0QT3tp4tEyfk+yoU1lniwkTD+yRWPUVr4lZpj9Scp0Rs4EWd8DHRAN1t
         kB7muHk58+zVw17a2sbwGYYaz7bPF6jhJns8ktFesHxIPQbH8RzJENtQ8L9koLycm4f8
         W87tgFjsBMTCCyKiM+5pS0WI2d9hUhPvrZQgMWYf5uE7cT4gn7G5E+q+4YMXdmBx626g
         +Gqw==
X-Forwarded-Encrypted: i=1; AFNElJ9pdL6Uyc05DjboqC8DUZg0iQ35IoLU6hdHBa60GdVq5bZejpxsikgTM5eWgswWHqZNL6mF7jPsi7vVJViKBZn4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8imK1IRxbRv3h+EUeReTpKA3OzEGRlJhA/APjM27z4+qyoex9
	sIBphHDCsLQIGVhK6vT86/oIiUpZuRWgT30btbiIYJiZw6Um35nmgGnJ
X-Gm-Gg: AeBDieslfW50MvRw9W1v1sDCyU6HqY9mgiogLgjnNgykCLH+1iISLFXVX9Np93lmLGh
	UBSxLA63m8xhF9cLGk7+JxFfK1WzbrpqcriklVX7k7lNYJH7kKPRSAnRCCJS9w1S5j+5STb+3oJ
	LVNcmMkfVclj+mfT9F0GqFE3DgbJbYIhLcPmM4GQpbjiaaptTwZcgv/1PBE8E68UgWx/wOiT+Ei
	4cis1AFsaXPgv2q6hqSmEQ0t2LeLjHbIiHsthR3ynNnzGQ4WUuJcO3ojyx8FBEQW5QBSYQTqwaX
	Rr3+xqPGrApRUvyDHXQ5RNV0ssODDGyvmywfSsm1biMmxH+PNCbcvZp3yG0cat0gmp0qFkp8TPa
	yqdPloguHoCtpW6hDm0vfJ8/xRSN/cc9PDtpj79NMM8FcMsyEoBsOkjavCkLYD4Ph/A0YXPUY9H
	ZwmR5C1RTB3Uq1LPcBfx6v9zrXeVd+lL2WhA+oyHHacgywZlbmFLXsneZLaovZW/D0EOwAvqU//
	Uo4DsbJu6aMa/MG1tyZ/y2V4/JiHhE=
X-Received: by 2002:a05:6a00:3019:b0:82f:8b84:50c0 with SMTP id d2e1a72fcca58-82f8c973bf6mr46567455b3a.45.1777289196476;
        Mon, 27 Apr 2026 04:26:36 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe40dasm31504074b3a.40.2026.04.27.04.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 04:26:36 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 27 Apr 2026 19:26:31 +0800
Subject: [PATCH v2] iio: adc: meson-saradc: fix calibration buffer leak on
 error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-meson_saradc-v2-1-8981c56fd05e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOZH72kC/1XMQQrCMBCF4auUWRtppkmwrryHFEmTsR2wTUkkK
 KV3NxZcuPwfvG+FRJEpwblaIVLmxGEugYcK3GjngQT70oA1mlqhFhOlMN+SjdY7oZXtnUbf9o2
 Eclki3fm1c9eu9MjpGeJ717P8rj/I/ENZCikMtabH9oRONZdhsvw4ujBBt23bByPCEXmoAAAA
X-Change-ID: 20260425-meson_saradc-54abc52d9b31
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rosen Penev <rosenp@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <jic23@kernel.org>, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777289193; l=1435;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=kEiZHKJqit4MGPY+b2Ld1n2nTYLDwv8qfRcBrOW6l7Y=;
 b=OgBTJVEKI4XrARc7cMlcqcU7gP8GsABoiiF9yu7IVEyF9y6+My2J18Bx+/02Bvsj4MdK4S/nU
 QSfZVGrBreDD30Ae6PJwlEGnW3XjAo8m8gDqfw2XihWA8ZQPKwIUPfM
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_042638_024099_D6529C30 
X-CRM114-Status: GOOD (  12.84  )
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

meson_sar_adc_temp_sensor_init() allocates a buffer with
nvmem_cell_read(), but the old code leaked it if
syscon_regmap_lookup_by_phandle() failed.

Fix this by adding missing kfree(buf).

Fixes: d6f2eac64403 ("iio: adc: meson: no devm for nvmem_cell_get")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Switch to a minimal fix according to Jonathan's comment.
- Link to v1: https://lore.kernel.org/r/20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com
---
 drivers/iio/adc/meson_saradc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 23991a3612bd..000e39ca5c62 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -817,9 +817,11 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
 	}
 
 	priv->tsc_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "amlogic,hhi-sysctrl");
-	if (IS_ERR(priv->tsc_regmap))
+	if (IS_ERR(priv->tsc_regmap)) {
+		kfree(buf);
 		return dev_err_probe(dev, PTR_ERR(priv->tsc_regmap),
 				     "failed to get amlogic,hhi-sysctrl regmap\n");
+	}
 
 	trimming_bits = priv->param->temperature_trimming_bits;
 	trimming_mask = BIT(trimming_bits) - 1;

---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260425-meson_saradc-54abc52d9b31

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


