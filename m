Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4CDFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g+pkBk61K0bONezvT3hKFR4CsnavUHfQ0OwvNOKj+rk=; b=zSojZOCULaAaxDetB2kcSR0Rvl
	ojo5NkX0aQHo5rHY29YiCq/+Fu8VJXffxWxtIPbKdPWk06MxJ+mAdvv46AeO4uM9Jqv6lHO8HzrDh
	O5wuQzXYS+d4niyPl3+9/pjSGUefA3/6wPY34tAwPwZwnCrcQp1ljvTfiXn7fmYehA/sTmeVY31vu
	cDw56y4llitV7+ResqPVpaO6YxjIE90ltjeVOMIy5Oc4rPEzrZWISUgvvSxgGrS8IRG/q5G7Dcc3y
	4eOlKGHMyHG4ecwQt4wEqCnFJrdxEoGB2Ld0z3MSG5TQWYxC22fceRSxj/2jYXWVPYSUhvEzxXvoL
	1L24lkUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHke-0000000GVqe-0whI;
	Mon, 27 Apr 2026 08:55:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHkd-0000000GVpT-20uR
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 08:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=g+pkBk61K0bONezvT3hKFR4CsnavUHfQ0OwvNOKj+rk=; b=Rx0DXKr/WvtRkJy+HfkpcRKNR6
	6jBDTWMgeAlv1TtmrouAJkKt+nO6rmjBAKijQ5apWgdLIoeTnR1HzDC9twM5Y/wJfGkXBLkYIx8Bp
	kCLeeyGnmeywjcgwI72Gz2oC6aoLtmpmxKOMZp3aEWXBfnGE4XhQxS24oSwQWfib2Prv6/n2ZGpQb
	FpF3AIOkZFPa4S1l8sHm/YlSFTJkSqosGWkxGWWvwS3ueM4UVJ1F6UxHQkTGL1smexcP834RwPaFX
	QWupNNWghjE+KYM+EDM/yLQNVN1TlmjCB/RAH/ytUL9dO2EKhlDwsVgqsIMvJQrh7dj3Z9qlgHHGf
	wEBKchNg==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHkH-000000007Lu-3geE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:55:24 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso83015605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 01:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777280111; x=1777884911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g+pkBk61K0bONezvT3hKFR4CsnavUHfQ0OwvNOKj+rk=;
        b=QihJgHVAQs2ctx/d40qXO8uUuMGHKjDMUrh62DZdlJNYBwea3aADeXk8piL5HNPoYf
         pZ46ZjdpTR5PsTRfOPC6euYPoZY0iWImDD59dVqpY4TMDKUKNzMz7Ly8At5vXbLbb/4D
         CqeqUaVrc4mea3nZnKYyDlEZO8c/lBVf9PYP+9yNdE2tzGlBAJop4McnsJ7Eul8Dxv8R
         96jPlwSai8IRMdD3leSKzN2MYyMKbjN50fnn8AKaqni9jsw2jKzfriBZm+rP2PSbE/YQ
         gCd/+uJWtDjLwRQ4kZm9DhQuFzjRXdmap/4cazWNbvg2TXE/87s/prNX6E7WaSaZ+iH4
         qTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777280111; x=1777884911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+pkBk61K0bONezvT3hKFR4CsnavUHfQ0OwvNOKj+rk=;
        b=V1ggE8E4tKxF/CoVA1S4N6NzhOS5b/cNC+d9MmEbJOjyGnwEA+npBvXTOrdOEmlxre
         jP5+DAEftGC/8fuMhTh0cpF7kRJRjP4oRH/qXS3bSma7Qq9LPgTMTXTmmg5BbFh2sVEC
         wrUwuhdtzuyXDDTxRRKSw7hiPfDvb/7EM/hfeIOI2GCHOYHcdEjLzzLR60XRmnRL2ncZ
         9dgfmdzjV3ag76IKXYEYDNq+oee+SliY4K7Imdqp7pShtlznGCI8PQ+OSJnnahGWBb11
         gDFiL2xokmgDLiYAW7rJpF6MQAkC3mvbFuaTFB9XNPCPLsisDNjPFQo0r8hK+tw7F0Sk
         rOag==
X-Forwarded-Encrypted: i=1; AFNElJ/k2lczFfVjzn3/z+YmZGckUvz6/SzltRF0ZKe8t5lqmmJZ9wykvPIvSEu4/8wfKVupTxQjsRfn6rROx8H8ZlbZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6P/4fB2i9Wy4WU5JB5pvGYLppeTQP7Li/z+AW7AlCKyCes5YB
	Qigw/aMkxHGkJkeOI3I/FB+Qi3WFhup76mmkoPYhzDnEUMgDMGnpdJO6
X-Gm-Gg: AeBDietqxxtkmCK4JA9WPt8ykerZQFdR9O2ZEKC+E/VT7i+EirEb6kRomsDjtqAVFq9
	VTgjbLkIHsNyuapH+m2o8O62rcwzQWv1ADwRFL3UqbTB4LED47qbKAIwNJLSThiHdaFDs/0Q8Z/
	+nBJgtkFJ4Hu9ocRCps8md1Gjw0+1HvUNnuDoiP9E7oGHDwb/5/iJ4RNtLAHrZ/pmH2rXiDCSbP
	hsC5L/TLP36Yq2CNQuRUhocKUYpC59R5tke5GZdOm7iJ5k7o7WM2B4k5gz5u7hj7yvw5HCa/zDU
	pb7AmlKXhGOxJktdDwujZSAiXeQsVhMSddiiAL0DwyL5VYz+8PIBqi6p9Tjn+ypzJJXqCKOPMzu
	GwzZPKOGCiQFv0+AHDvubg3D0ImMh0ZDhFZIndaIoG4JqU3cf0acB/bGxvCHS9Hubu7NhvR3Q3f
	8G0B65/kkvMYiz7/+ZPIUIeCoCjpkIdFv9xiEBsEJkHKluVadgbdLFK0Y7CgY=
X-Received: by 2002:a05:600c:4a15:b0:489:1aed:1658 with SMTP id 5b1f17b1804b1-4891aed16d8mr269026355e9.23.1777280111056;
        Mon, 27 Apr 2026 01:55:11 -0700 (PDT)
Received: from localhost.localdomain ([196.235.152.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d5b1sm82248879f8f.30.2026.04.27.01.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:55:10 -0700 (PDT)
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
Date: Mon, 27 Apr 2026 09:54:57 +0100
Message-ID: <20260427085458.38546-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_095520_926264_2E7E4912 
X-CRM114-Status: GOOD (  16.52  )
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

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
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


