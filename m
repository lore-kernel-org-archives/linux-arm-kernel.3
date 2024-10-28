Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EB8D33990
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3SJsn209UDpyRULEXcIotSNd90N8HU8i+Pdz1wraJM=; b=Zjafvf7lirDTJXmfcVJCzq8GEV
	RNxxYmC/oQmiXwgt0+WN84cRu4c6soY9VZX5/VJXNHmTS4OTkMnK8qKO8auXsqdVEkxtBqjwpC94P
	GFAfxPZdLwXkWmAmq/s06LVWBUPdjylkBtcS+PuRhUm15c1lZusyaD63gplRdsR0EEntBuRxiIsse
	+Da+v/kiMVnCIg9AFJrpDk2UYvYkSlh1dsbvdpZpCbsCnutk+qXny8UIFJIJ1vdMfOpMviubNeJ3Z
	flQ4VCfqg7LJKxIF5TDz9kAbiTbhIFjLngRfPW0CJ6KSETTq97Hrm3tkdeZD5jFDTRBzJqaOwATzS
	f7z/lDIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5R6W-0000000BCRg-0xTg;
	Mon, 28 Oct 2024 14:52:24 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QdG-0000000B6DK-1qmd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:22:11 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id 8DB834C784;
	Mon, 28 Oct 2024 14:22:08 +0000 (UTC)
From: Aren Moynihan <aren@peacevolution.org>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Aren Moynihan <aren@peacevolution.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ondrej Jirman <megi@xff.cz>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org
Subject: [PATCH v3 5/6] iio: light: stk3310: log error if reading the chip id fails
Date: Mon, 28 Oct 2024 10:19:59 -0400
Message-ID: <20241028142000.1058149-6-aren@peacevolution.org>
In-Reply-To: <20241028142000.1058149-1-aren@peacevolution.org>
References: <20241028142000.1058149-1-aren@peacevolution.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spamd-Bar: ++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1730125329;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
	bh=i3SJsn209UDpyRULEXcIotSNd90N8HU8i+Pdz1wraJM=;
	b=FBqMepA1LEQfxSQzxA8lQ7FXfVil2UfQKoUX/doiPoLlKCQ+r0/cnJtv9A6iO7QSWOzHwa
	y3iP0aHsKbF15e8rC43zc0nB+8ka+zp6c91Z0Ch9bc38wA/iEY0MCJWqDkdU75psvUDhzO
	Woiq9EL4FydfpkCjf+85CXPyDBjKpcw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_072210_563912_6BB678DE 
X-CRM114-Status: GOOD (  10.25  )
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
Without a log here the driver will silently fail to probe. Common errors
are ENXIO (when the chip isn't powered) and ETIMEDOUT (when the i2c bus
isn't powered).

Signed-off-by: Aren Moynihan <aren@peacevolution.org>
---

Notes:
    Changes in v2:
     - use dev_err_probe

 drivers/iio/light/stk3310.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
index 968a2cc59d09..d314659e7dc2 100644
--- a/drivers/iio/light/stk3310.c
+++ b/drivers/iio/light/stk3310.c
@@ -508,7 +508,7 @@ static int stk3310_init(struct iio_dev *indio_dev)
 
 	ret = regmap_read(data->regmap, STK3310_REG_ID, &chipid);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(&client->dev, ret, "failed to read chip id\n");
 
 	ret = stk3310_check_chip_id(chipid);
 	if (ret < 0)
-- 
2.47.0


