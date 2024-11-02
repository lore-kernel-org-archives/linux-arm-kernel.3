Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FB9E67809
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 20:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvvNhj8Jh93zpagJdBLhHBNGJCsGSzK4C5YOxnQO53E=; b=T5bDcjeKjKkGlIC2w/WROnNs4l
	rpRbUKfZSJezKBsuV2vYt6O8x0C7kbkFraDdp9ztpuERzSfi67YPu/cvGcfQTbjvzFAWpNvw/b1GB
	v0JodbYifN6Dldqq5Vdii4FQK19/8u2DQ9mzrFMcFQIGQ60bpFJghn+lkzO+Z3Iquel1hiLaNB/TD
	oPd+CbRzD+iYE+gaRL5MsWaAalwluuASJONxpJso7uQp5jz9mD/3DOh9GSXNHTNqCPcRQqxvEiYW+
	0+a6aJQukykEULlGhB8jVUHgTSNGY856YFhYf9zWd2wU1PRXDbSDj4MbkJnJbPZjQilF1U1ko10Po
	LIVTCtlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7KMc-0000000AKZC-3gpP;
	Sat, 02 Nov 2024 20:04:50 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7KER-0000000AJQr-1Qdp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 19:56:24 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id 69A2B4C84C;
	Sat,  2 Nov 2024 19:56:21 +0000 (UTC)
From: Aren Moynihan <aren@peacevolution.org>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Aren Moynihan <aren@peacevolution.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>,
	Ondrej Jirman <megi@xff.cz>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org
Subject: [PATCH v4 5/6] iio: light: stk3310: log error if reading the chip id fails
Date: Sat,  2 Nov 2024 15:50:43 -0400
Message-ID: <20241102195037.3013934-13-aren@peacevolution.org>
In-Reply-To: <20241102195037.3013934-3-aren@peacevolution.org>
References: <20241102195037.3013934-3-aren@peacevolution.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spamd-Bar: ++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1730577382;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
	bh=uvvNhj8Jh93zpagJdBLhHBNGJCsGSzK4C5YOxnQO53E=;
	b=iKg1Bs5ez3k57s5TX8B2KsJGqvkshKKwCERTQrh5gkSzMVC+c1ahFcgX9DDVEtcz8uswXR
	CQ73g9pKzfXbtlIPoTpg53k6VMYFigxLTGRewaGMfCZfXj+vXRY4NBSDCmwxoZkJtUhqZr
	u3lpZEO0IZNZsuJa/CQw3I5UB/Jg0VY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_125623_471385_E4E2565F 
X-CRM114-Status: GOOD (  12.99  )
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

If the chip isn't powered, this call is likely to return an error.
Without a log here the driver will silently fail to probe. Potential
errors include ENXIO (when the chip isn't powered) and ETIMEDOUT (when
the i2c bus isn't powered).

This function is only called from stk3310_probe, and this condition
should return an error, which fits what dev_err_probe is designed for.

Signed-off-by: Aren Moynihan <aren@peacevolution.org>
---

Notes:
    Changes in v4:
     - get a struct device ahead of time so it can be passed as "dev"
       instead of "&client->dev"
    
    Changes in v2:
     - use dev_err_probe

 drivers/iio/light/stk3310.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
index c9a3f02bdd80..becd6901dfef 100644
--- a/drivers/iio/light/stk3310.c
+++ b/drivers/iio/light/stk3310.c
@@ -509,7 +509,7 @@ static int stk3310_init(struct iio_dev *indio_dev)
 
 	ret = regmap_read(data->regmap, STK3310_REG_ID, &chipid);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to read chip id\n");
 
 	ret = stk3310_check_chip_id(chipid);
 	if (ret < 0)
-- 
2.47.0


