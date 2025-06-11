Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81928C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 23:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nl3LqMpYZe7rL10QvcxF4QXnsqo21gvi2tg2ycz1DlM=; b=XR+BV9tiMPFRavUvPCy7t6TgMY
	JZD2uorh6OY0ErUhLpYE8UXB4RiugKfSvsrZPGTcIXeg+Kyw/VzzVRhrqfi+t501t6UZODA3wI+SY
	cukT7/KI1DfzCB42ke3XKyptHQfRzlRAl6sTE835AkNYJ2Tarcbd2D3XqBbxozCKtr3L/tW+RTR2T
	sBh7wlazvKY1PCkP1LOpZvYah/WLWiNmECn8rBBbgFyiaw/17M14wnCADUXeB29VINY4FUUK+zdnK
	xuCHOyZugJ3b6e/fhsCU5dmzv8rk4d5BeYeSzWLcetZCAa4MPOfxHjniXhbebCvBCUiMHgEo3i9zr
	rGzDU2vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPV7r-0000000Bhdg-0nJi;
	Wed, 11 Jun 2025 23:44:59 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9j-0000000BVd5-1RY8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:54 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-407aaace4daso173733b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681771; x=1750286571; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nl3LqMpYZe7rL10QvcxF4QXnsqo21gvi2tg2ycz1DlM=;
        b=R7BEZ7ZnB24ibTFV4RCvbKa5D+69yhNDh7jmVD0RM0pxgSAjDlj+YW44zuRzSu7pX8
         vD0OtId870uCfisJIcpeLmuOCUJfPcEVUssgp7Zgd+D3GiuvI6tGOmnQvZzQWQDZx/RG
         W81Dabdcyy0HNVulnGMNWBBja3LyzK2WMk68kogA8Ab9qzAgSfJeXY0098cJQTg6QIoF
         g4YGhMMSzI6fPghcnAMZFWoi2ebh9ovowOnkXKM9Ou2RKN+YQXVkPQp1hNplbuzRjERE
         BerpiH9WiLHEfri95XlXCT2u/647JziWdZPH741/etfBxPId0kp2Ool/NZ8FZtQaNCc9
         ijLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681771; x=1750286571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nl3LqMpYZe7rL10QvcxF4QXnsqo21gvi2tg2ycz1DlM=;
        b=AkKBQIfdkZB+xeUVpqEGST+XGGeArsY1yqZFkVfZHTUYM+9lmM1x1ehiUATlbeWz3x
         5DI68IDC7F7/4mWMsfXllOJwQU0b+DwRSmUv66zIua/CRuxuzeML0S+wqFOE3MLweq+W
         3+w3RavnL3x3Sl8xPvmmCxnXTj5W56DgrQFnxlgVACfSYdv9Kg1wQct0Fo1KU75/D+f6
         w1YAMdlfEstyRVSrOxDVN5u7Itm43k7mywYpt/PUXhMRhTii2d1jXfSrvUPZF2yn4HXc
         MUBoop9sr5Yei1crg0LSXoaJ+5OPpZaH/Yo6iZ/KyMiOF9Xbyb/RKjLtMKoH/Kqu3TFr
         sfAw==
X-Forwarded-Encrypted: i=1; AJvYcCUMPyT+vxgLE9WD71ABS3xk01dCggydo+9tCaW0+ctTy8bm2nEGm+vy2rz5ybBxJ8fqWijFN1NWwqL2KYsl5dQY@lists.infradead.org
X-Gm-Message-State: AOJu0YwfVf3iq6i8ze9LyXSWR0XKsiGFtSvuTk83OapYM3VJp8+1qK/a
	PKoRASb4BdkYNUY2pSkvUxo8pP5j1Tw7Rcfy3SH4x9lTg7/dNBZDzR8WeYB2dQMFwrc=
X-Gm-Gg: ASbGncuX1MauP2q/INBpL/75BcKLV6tM9QykyP1g61NuNR0kyLFl0q7yLCrJfN/8neo
	C3P3RBU5y5QFN/jzE5bBpPuIzc4MUhlaM6dzZk50B3j+xl6LdkZw5cPWI3Virw6luLzOV/zGhrf
	Yo2FZCaQx+GiVYG5Y2IUYCAn2adCnGlqTmwWfCoE0EGy8SplPDryj6U7l83+2CY3VGGy5ybzCAv
	1+ZFvi52fjc2JcwNgX6h0fHd8WtwXh3JfQrNqjnWPvieFPUGNEnNF1mI9kIyJBsrpHlpg/lhDX6
	qMbG5z4qygFGbk167ZKyULeJxQ659ag6bHTNgpzO7THxsv6CgLaVQ0H8bCfY02ymDJmc
X-Google-Smtp-Source: AGHT+IEZSzWZ0MLiN0yyfGFrwS0RNkzhIod27nlhwUlhO/mElQY328781XuzrgNg/ZcIzQzVUMXtHA==
X-Received: by 2002:a05:6808:219a:b0:406:6fe7:37c1 with SMTP id 5614622812f47-40a66b32e32mr548422b6e.28.1749681770650;
        Wed, 11 Jun 2025 15:42:50 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:50 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:09 -0500
Subject: [PATCH 17/28] iio: imu: inv_mpu6050: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-17-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Roan van Dijk <roan@protonic.nl>, 
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Mudit Sharma <muditsharma.info@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2147; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=NMgmVVL3w5aWTWvBC+xusdF+bAVkf9GZ8B3SAIKd/as=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgX0U8uxbbKAo49fqrCappc+c/T/hCIP3Y0dC
 FOJqlflsliJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoF9AAKCRDCzCAB/wGP
 wL4lB/9xRpYrOL5Dj/pVmFpiHVwrPZM5pGRIEo0tTLcH/Q5JOsLHQ5o/dbIirg/cJUikFfWLQ1G
 B7dqgu1hAl2Md4Pk6GklQzFpnaL0IqNcpDktycC3rp7CqezQvYDEGRcuC/yUKNmBLrL1HXOhMRu
 dFj7jXb/+0YU55sXaMa1UFfO2HiipdgqV0VoMprzCz8d6D6awosWDwQteOQXp56VLuseeqIvY5D
 bhcFYRq6FJO79v0KxUsdYYvTaGAhGGdrxJMabQ/o+fRiSHpy1dkzRXUnLMkM+Qf/Fgbfp1xFNWk
 WGqVvxJtN90stHJuDSbPGOqyJqWTW5GIY/9TYdSUXGc8gS0j
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154252_257244_42DB63FC 
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

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c | 4 +---
 drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c | 6 ++----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c
index a9bcf02e5b43fac0e210c6f78816a3c042b52f3d..460792ed27e03192464066dfa088734f0b6b1cdf 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_acpi.c
@@ -130,12 +130,10 @@ int inv_mpu_acpi_create_mux_client(struct i2c_client *client)
 
 	st->mux_client = NULL;
 	if (adev) {
-		struct i2c_board_info info;
+		struct i2c_board_info info = { };
 		struct i2c_client *mux_client;
 		int ret = -1;
 
-		memset(&info, 0, sizeof(info));
-
 		dmi_check_system(inv_mpu_dev_list);
 		switch (matched_product_name) {
 		case INV_MPU_ASUS_T100TA:
diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c
index 273196e647a2b5a4860e18cfa34a088c773540e4..c4c11124f92f7fa6730e7443e3be67d920b8c115 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c
@@ -50,7 +50,8 @@ irqreturn_t inv_mpu6050_read_fifo(int irq, void *p)
 	u16 fifo_count;
 	u32 fifo_period;
 	s64 timestamp;
-	u8 data[INV_MPU6050_OUTPUT_DATA_SIZE] __aligned(8);
+	/* clear internal data buffer for avoiding kernel data leak */
+	u8 data[INV_MPU6050_OUTPUT_DATA_SIZE] __aligned(8) = { };
 	size_t i, nb;
 
 	mutex_lock(&st->lock);
@@ -103,9 +104,6 @@ irqreturn_t inv_mpu6050_read_fifo(int irq, void *p)
 	inv_sensors_timestamp_interrupt(&st->timestamp, 1, pf->timestamp);
 	inv_sensors_timestamp_apply_odr(&st->timestamp, fifo_period, 1, 0);
 
-	/* clear internal data buffer for avoiding kernel data leak */
-	memset(data, 0, sizeof(data));
-
 	/* read all data once and process every samples */
 	result = regmap_noinc_read(st->map, st->reg->fifo_r_w, st->data, fifo_count);
 	if (result)

-- 
2.43.0


