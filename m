Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CEACA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCFyd8etVT9azwaPs92BWUORGBNE2YBN4q+4LkBM8Do=; b=tDUq+1G2PjgqyUQKz4xvOToYI9
	WUQhojeNi54wwYC32MWVTCvq66b7SXyKvZ7ngLywEnYmsJWGwzZr5EKRqM7m4hPX4dlwl7Oyt267u
	eTQvAQ7UYxKiZL9oXsdx1dtrhXB3/TKF73xCEkjD3JhFfKqZMALUlPhoVaQnF33jwty9i0QvjCkeb
	SEUoXvzFa2l18bK5gcdLm5xI+avbjEBn6g42Rygbu+F3O6jRJUPz4jZPCx4Gmfc61y5gxaIVofojg
	nOBDdyUOh6F5Zk/Zz07oV/mMPx+Rz1/LiRlMD+TfXVf6FzHD2Dj9LI4qn5mfcT9hTOwFjyWlch+Yq
	/IlRRIEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEbf-0000000ESoV-33iZ;
	Wed, 13 Aug 2025 16:45:43 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umE9I-0000000ELfd-0TCu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 16:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=TCFyd8etVT9azwaPs92BWUORGBNE2YBN4q+4LkBM8Do=; b=XwKHkS
	IO0ibfv7Y+8QCxivRG8baE2TiRouuIuPToduD3zcmvsySw8T41QCLriBJ5xAHpMG
	2NMSncLeg0c3DaqmJx7VfNnU3PEJjiGIML+8F5PKnljjUo3nBxbg9iSeJPNey2o7
	e2f4JG9LIUzVlOUOIWACzKhktltgXkd4sd+ip+J97lUE0omIyKSYDzbMWYZS0ZqK
	+5uO6nDnsW/AnNoRIYz0VNVPf0vT9r0jzIzeqfG7nivoIdgH95O913q/ph99qcU6
	YfWjbrglkO/K6k3nSoaNbRwEfALrgWZrmKlmNWFQ0iJRfvZFD0j8wic82EJ1U13Y
	BYgbKGILeqMmwlIQ==
Received: (qmail 694745 invoked from network); 13 Aug 2025 18:16:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:06 +0200
X-UD-Smtp-Session: l3s3148p1@pgdOeUE8MJVtKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 05/21] iio: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:14:51 +0200
Message-ID: <20250813161517.4746-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_091624_423966_23953CFC 
X-CRM114-Status: GOOD (  10.64  )
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

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/iio/adc/sun4i-gpadc-iio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 6b8d6bee1873..e4bc2e199a07 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -154,7 +154,6 @@ static const struct regmap_config sun4i_gpadc_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.fast_io = true,
 };
 
 static int sun4i_prepare_for_irq(struct iio_dev *indio_dev, int channel,
-- 
2.47.2


