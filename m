Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECDAC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 09:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyle+PTVvJI9HtkNC+doJ7iKTHR2VjoZcHSFBrvKbps=; b=OD98Zcgut2bMPFwLcBzqyauP7m
	ecBENlkcNVzQlxo3ypagQ8cc7YR6YDcej/mkffCqB7YQ2bbRvEu+mCAgTaeH1xUou/Kvrw+9zIs0U
	DRAxu14iqz6eN+GzkNG6iKekS89uhjtFVn+U9srjFe+qzZxusE5Ez2uaG3pv9L1Iz6WLW+qkoyV32
	ga0rN/tEuL9a5Z2jhe0wDlPwf84vWUmzOgvJZh100/22Nc6EsdSToeRgQIVAmEL+5vXpBh8FG+c2r
	J7Vj09YyIWeAeEt1eDzhzf3JZQa5RMxpmjUUQ+vPwthR0punsAOVN6DJelYUIKRsxvegyY7i6u9hZ
	W8mjFfHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtM2J-0000000BMmq-3J58;
	Mon, 10 Aug 2026 09:11:11 +0000
Received: from mail.zlab.su ([109.73.193.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtM2G-0000000BMl8-215H;
	Mon, 10 Aug 2026 09:11:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5404DBFAE6;
	Mon, 10 Aug 2026 12:10:48 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786353058; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=xyle+PTVvJI9HtkNC+doJ7iKTHR2VjoZcHSFBrvKbps=;
	b=KWJ9hcB3IAX8O35ipyuGOgsC7dWdATXvVpfc9LgZAENQ1kSGfkWfAeWSJxDB5OErCxxbIZ
	ca1Gq533PI8Dzqke5MI1U3js+lZlErHQQP63ppDjOigcZLA86R8RCkK2VJgqc+PCif8rXA
	PYIeG0wl+g9b77h4d/piOj603eGybY6mkOFyZmnVC2D9Ie9h/eC7QqaqFlByoxnoGIdtUX
	XgIWShh7jQRnXSTz4mmk6RVDYAJEkIQmGa97/PQsm7lD1DoK60hkr6tyGrLFc4xYGjRGbD
	Azzxw69tSQeEvbYE+xgp25uywODWCVaMcp0PMcG2se7XyJH7A88DhZUxLn6xOQ==
From: Vladislav Leonov <vlad@zlab.su>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Simon Glass <sjg@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>
Subject: [PATCH] iio: adc: rockchip_saradc: Add support for RV1106
Date: Mon, 10 Aug 2026 12:08:26 +0300
Message-ID: <20260810090826.146758-1-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714131631.v2.1.0b846080833e4b836793c43fc26d1c6d817cf9b4@changeid>
References: <20260714131631.v2.1.0b846080833e4b836793c43fc26d1c6d817cf9b4@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_021109_046102_4ECC48D2 
X-CRM114-Status: GOOD (  11.30  )
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

The Successive Approximation ADC (SARADC) in RV1106 uses the v2
controller and supports:
- 10-bit resolution
- Up to 1MS/s sampling rate
- 2 single-ended input channels

"dt-bindings: iio: adc: rockchip-saradc: Add RV1106 compatible"
documents "rockchip,rv1106-saradc" as falling back to
"rockchip,rk3588-saradc" (see Link below). The two IP blocks are not
equivalent, though: per the RV1106 TRM v0.3, chapter 20 (SAR-ADC),
RV1106 only has 2 channels at 10-bit resolution, versus 8 channels
at 12-bit on RK3588. Without a dedicated match entry, the driver
binds via the fallback compatible and uses the RK3588 channel table,
which reports 8 channels instead of 2, and an in_voltage_scale that
is off by exactly 4x (4096 vs 1024 full-scale).

Add a dedicated compatible/data pair for RV1106 with the correct
2-channel, 10-bit layout.

Tested on a custom RV1106-based board, with:

  &saradc {
	vref-supply = <&vcc_saradc>; /* 1.8V fixed regulator */
	status = "okay";
  };

Before this patch:
  # ls /sys/bus/iio/devices/iio:device0/in_voltage*_raw | wc -l
  8
  # cat /sys/bus/iio/devices/iio:device0/in_voltage_scale
  0.439453125

After this patch:
  # ls /sys/bus/iio/devices/iio:device0/in_voltage*_raw | wc -l
  2
  # cat /sys/bus/iio/devices/iio:device0/in_voltage_scale
  1.757812500

Link: https://lore.kernel.org/all/20260714131631.v2.1.0b846080833e4b836793c43fc26d1c6d817cf9b4@changeid/
Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---
 drivers/iio/adc/rockchip_saradc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockchip_saradc.c
index 0f0bf2906af0..5c45fae11890 100644
--- a/drivers/iio/adc/rockchip_saradc.c
+++ b/drivers/iio/adc/rockchip_saradc.c
@@ -348,6 +348,19 @@ static const struct rockchip_saradc_data rk3588_saradc_data = {
 	.read = rockchip_saradc_read_v2,
 };
 
+static const struct iio_chan_spec rockchip_rv1106_saradc_iio_channels[] = {
+	SARADC_CHANNEL(0, "adc0", 10),
+	SARADC_CHANNEL(1, "adc1", 10),
+};
+
+static const struct rockchip_saradc_data rv1106_saradc_data = {
+	.channels = rockchip_rv1106_saradc_iio_channels,
+	.num_channels = ARRAY_SIZE(rockchip_rv1106_saradc_iio_channels),
+	.clk_rate = 1000000,
+	.start = rockchip_saradc_start_v2,
+	.read = rockchip_saradc_read_v2,
+};
+
 static const struct of_device_id rockchip_saradc_match[] = {
 	{
 		.compatible = "rockchip,saradc",
@@ -370,6 +383,9 @@ static const struct of_device_id rockchip_saradc_match[] = {
 	}, {
 		.compatible = "rockchip,rk3588-saradc",
 		.data = &rk3588_saradc_data,
+	}, {
+		.compatible = "rockchip,rv1106-saradc",
+		.data = &rv1106_saradc_data,
 	},
 	{ }
 };
-- 
2.47.3


