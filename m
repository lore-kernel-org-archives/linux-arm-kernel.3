Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11FFFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 16:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o3ZI0LJNGOCBI20WP1P2qZ+bTqh4ah0JmxhMCroQ3y8=; b=jEdlhde9YpZBT4pDdnWUxp8pF5
	fB8EFeuADBXQvqsAo+vhmWUzY7T84/jns1EI+pcZT0yKn3acyOZS8xpp8aliPjCqHfnTXl4KWTINj
	ilfPv3IlH4YbugzMHqF3rMUvb8E2xzpxSPDMM8XXS5CLhN+To4f0CaPtfLSmEuIpJRnrgXuJCQ8Qh
	wGmp+o3bIAQZ0uaKGPXMmOE8JtQf05f2tkQQs/yvqIDNVLKbYLcqdgOZ7aXKMYVuL5S6qBsb9dGLg
	H8aY/NmbPeJ83rnlZv3R/oV3vO9f3j2+hp35ppqz41WAdkmBJkocuAMYgag9OOFFwXFvB2Ocfg39j
	Ms5fbW1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPBp-0000000HOHx-15YI;
	Mon, 27 Apr 2026 16:52:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPBm-0000000HOH8-3YJl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 16:52:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so130023925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777308725; x=1777913525; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o3ZI0LJNGOCBI20WP1P2qZ+bTqh4ah0JmxhMCroQ3y8=;
        b=mdYKTQKSY0zu2N52TvU/WTE+4Hge3b2wxlDhPZJw4qSQ49b4BrrFOTPOD3/oC5RcTc
         x/G41GtDDx3c2C8iAIsRldRQ3GVr1FraYqd/dcp7OqPlb4YhJI0GOxMW15mvLk7ayDlU
         0tyv2crbFiG6mQr3caeuIDYqZdos4lshS1rVwjoqVW3XA7L6LCS5yVeAUFGYkwVd6+ok
         EVEibz9NpN7o+9xuD9EnejFRkgTbIyPRhglbE7t3Ziunt8raIp/XzUVhqlqFLkPAhxzY
         ROK9OaeYEwhBdjgXnORSDbzosx9gckZvZ0NAOT5B8C/wJz093AsdEx4cIMKU9rxzPOVo
         I96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777308725; x=1777913525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3ZI0LJNGOCBI20WP1P2qZ+bTqh4ah0JmxhMCroQ3y8=;
        b=A08iNoG7p5lmXydPFOBbSYxguzvb7F3UkS0P14hjWYIkfkb7NWhQaB2iSeW2Yuvv97
         JXrgxNHlQjCDjUCg66Jmt7exunonhGd25KD4AR6mOFq2c1b12t9exNrDEazfpns54qz3
         EzYNgvFOkJxerwmxKmPbik9YZopaozJsyWRZBr7lbSw8GK/+JwjArwtFAqPMpygpEFL/
         WLKjl3DCYwWqWjRRP08BAJo2wWGz29dzYwiJxpyBga+GF2k79u4mDgSaR1CPvNbl+/Ik
         /124qr/F3weQJBoKey2p01fGcOG3ofG97jeIEzC79XL+teuiQveEs6ELLFSpH2WmrqEt
         nJkw==
X-Forwarded-Encrypted: i=1; AFNElJ9B4kNDqf/xzDQNyIfTyisYi8OlVPh30B655SaxTOd9VqwA15IW0UDVVvUWcLxqkqnCa1iLnMSf9RTbrZ3wUh3i@lists.infradead.org
X-Gm-Message-State: AOJu0YzHZrugLm8E2h13t8uC0bsTuIiF0/jJbbdUMzFKtLEEaqFpDiWH
	G3YdERmaDuw+d6JuKgotk+wfQiftyZleruPiO4Jih5S9CoVrpQHf3YnZ
X-Gm-Gg: AeBDies7+bwKAk30WsD2tl4r6pL80UAoN+gLt3DrYyYq/VefMniFdOg6GcHvL1lAWOh
	68WEGyRWmq7E8UnIPGp0zyVeT0dVeV13Roi8EbK+8fAImglyfXXYyEXea01jA1tqIbY9zU1x2K7
	/GLpd+TRt+Ltasx9CklvYRqE+Zc5jEE36OPUUGjaFDh1gY2U2yjb0xeLV0xdvbN82ZBSQbmDvGN
	TQXbyTfcjQIbe2urb1RfRNYNYO7s+w2r+yPZojsFc8GhLQ6OYRnURfSngcG/ORAS+BO2+QXYMSF
	Ilz5C5tVifSuawOdMKOJGIdtvRxBluDOn4hll4FRl5miMiI2oTx8x5tUQbJ1s4iZIBQSf3+Ff1r
	YSMrdipdn1lJwVGL8snxKW7Vd5XsAyM3mX5Z60VglM33dazIwJnOfemnnlSVU+t+Nt3kQuvFuUt
	Iw5SGWJdaPvNd2R5a+hzUZoRCaN6l8Ef77BKtICQM0gWQHo2oz
X-Received: by 2002:a05:600c:6216:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-48a76f53addmr2241825e9.9.1777308724693;
        Mon, 27 Apr 2026 09:52:04 -0700 (PDT)
Received: from localhost.localdomain ([196.235.239.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a773aeb6dsm1483495e9.5.2026.04.27.09.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:52:03 -0700 (PDT)
From: Salah Triki <salah.triki@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Salah Triki <salah.triki@gmail.com>
Subject: [PATCH] iio: adc: mt6359: fix unchecked return value in mt6358_read_imp
Date: Mon, 27 Apr 2026 17:51:51 +0100
Message-ID: <20260427165152.5583-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_095206_911572_B5FB9BE2 
X-CRM114-Status: GOOD (  18.44  )
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

In mt6358_read_imp(), the return value of regmap_read() is currently
ignored. This is problematic because if the bus read fails the variable
val_v remains uninitialized.

The function subsequently assigns this uninitialized stack value to
*vbat, leading to incorrect measurement results being reported to
the IIO subsystem without any error indication.

Update the function to check the return value of regmap_read(). Ensure
that mt6358_stop_imp_conv() is still called to clean up the hardware
state before returning the error code.

Fixes: 3587914bf61 ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
Changes in v2:
- Added Fixes tag.
- Re-examined the entire driver for unchecked regmap operations.
  While several regmap_write() and regmap_set_bits() calls also ignore
  return values, I focused on this specific regmap_read() in 
  mt6358_read_imp() because it leads to an uninitialized variable usage
  (val_v). This makes this fix critical for reporting correct data 
  to userspace.

 drivers/iio/adc/mt6359-auxadc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
index 6b9ed9b1fde2..f927bff4a26a 100644
--- a/drivers/iio/adc/mt6359-auxadc.c
+++ b/drivers/iio/adc/mt6359-auxadc.c
@@ -497,10 +497,13 @@ static int mt6358_read_imp(struct mt6359_auxadc *adc_dev,
 		return ret;
 
 	/* Read the params before stopping */
-	regmap_read(regmap, reg_adc0 + (cinfo->imp_adc_num << 1), &val_v);
+	ret = regmap_read(regmap, reg_adc0 + (cinfo->imp_adc_num << 1), &val_v);
 
 	mt6358_stop_imp_conv(adc_dev);
 
+	if (ret)
+		return ret;
+
 	if (vbat)
 		*vbat = val_v;
 	if (ibat)
-- 
2.43.0


