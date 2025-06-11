Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF240C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 23:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmCWs2rPIbc+6BQsfR6o7xw9HuF4FDfGQAsK57gqrg8=; b=BRyXx0AtBkOCmncf7cy64hE5tc
	BRO+g0ApnctT/Ex8X0+Kd9BZxbBJGTyCr1TZdq13aoZ0Nm4M1watiLz9g3eAj5/I3i4I+uDMpF9sj
	qBkyXLI6RKOaHykrdmkFvSazbx69+PxETtgjmOqhBUXJwRVli6t2DJid1IBb/uWvTOoFIv4pf33Qe
	0G5o4Bt2vgZag+ipl6SZIH8oujJwyhY96zV6u2OAInGG6/9YuM6moFXhmIz+evDnCJ/FzI+c79r0/
	VTkpss+Gp48by8rOZJVNdYNjlZ/5C5qI+yiHtXSdhb4tnJ+uByQZ7gAiGnNSCyhkKXaP80X2kbDLz
	xWx9ydzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPV9y-0000000BiJ6-2OJf;
	Wed, 11 Jun 2025 23:47:10 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9l-0000000BVeB-2hiz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:54 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-4074997ce2bso101169b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681773; x=1750286573; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmCWs2rPIbc+6BQsfR6o7xw9HuF4FDfGQAsK57gqrg8=;
        b=dvd5Iddai+O1LmfuvIhzFNH7IIEoDPwpOUOE8IXfNkx5CpKMdeMrEnNAekvtFehAas
         Mnk5OoJ1GiNXWykhAr94ORV6a1/f7XXjDhs9Nr0X1D8XQ/C1CcfiQmioX4F+OmSOsoja
         kc4zBwPm5RNDrudTiaLxDAkmM5XrT9219P8Z2wlsMRaroAs1BvcGJE6bqNbHqFiD7s/J
         K0ULEGch3nz3Me605AEjzP0bVcbOilWgMqjZncaw8Oxuqa55+TobdXayD9jdCkwyPvKe
         sqUTj3M5ESNeqE1PBaI3F5aEKZXO31iOirP317ughhUnUN0M1LlZDKAIp6iWZBox/USb
         5iKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681773; x=1750286573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmCWs2rPIbc+6BQsfR6o7xw9HuF4FDfGQAsK57gqrg8=;
        b=mIHdVsekhX0/qqY4ytH9QEIMkRM6DnZNvt96iIkcctteVfOMhG/dwwsF9DvhQMirjF
         PemT8oDUUnKYiDSXcgmID0dYITKb4yD4EoBtD7EREUuFpWy/w1+CHhB39086S3wB7ZAR
         4CAyzCxgw6SQ2rFhLQcI3t5fYNhG6IJ6Hbl4YB9Jcn7aFTJTd3qMeLf0+w4MoRD4jGf5
         M7/XLaUs5EN2XF6eB9WzlRAAoVDVUs3AQVKOVJvUwxljnb7v0FnqbKcgO0acu+vcmZUT
         RhdCstQd/sWuUzUmgC2n+H8ai2pqX8Bkns0joyVS6yiwjzrnHRYiyqngWKHovnoCPApe
         FXog==
X-Forwarded-Encrypted: i=1; AJvYcCWtyWkQaQPG6OXTGLwrg2ZN4uqkztr4Djvkdt7a1KCQExw4MYoVtRGiraBeM8FHRMdxqjc/L2Y7LgWumqR2nWxj@lists.infradead.org
X-Gm-Message-State: AOJu0YxhOCDMOqtOwBGSEeqPnoNyCZsMendvJ9EfWZ3NwQ3MMMgQNxVu
	sI63F0AzzuOE1acbFAlu4lvaBhQsj2QX3LIHyS+t6DpOr9mFxjDwwP3p06OuaZsPug4=
X-Gm-Gg: ASbGncs2d84T3v3sHiVXtBRcLkglM/y0gPeYizHt1wdk6T/5ikFhflQOW/8GNtUvqQ7
	H3fYckN8Y7Bw/1PP4xpnmyZKdrc9mesauM72EciRv1n9M8OssVPAfaD3V7RU//pYI0Qibamsx4u
	39/DG2UhKO93NvjowypgUZmDdlbCFx7GMeFAJsBHindct5CtzIz0/ghXXlNSr6qe4L2xHPJUTod
	FZK4Eg3XCzaVyoqFVQhXiwbbRsfqKiEb0lXe51w8WYggMrnfMTTulpAsavPU/F8RtNxkJd5rUcw
	Z1mxpWNq7/jA0YSGFMidUtt7q5ecG8axY/bjFcl0G4v+BIW3UhBHO7/rnaM8zzKD8Mqh
X-Google-Smtp-Source: AGHT+IHa8L4p8ghK5RcETbtRoE4Tgd0/CyY2JEUEIAGMkjSxYcjGiB/P1+veFGOZJrjbwtHUeltfLg==
X-Received: by 2002:a05:6808:2012:b0:402:b0f:4ccc with SMTP id 5614622812f47-40a65fefd04mr787770b6e.16.1749681772858;
        Wed, 11 Jun 2025 15:42:52 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:52 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:10 -0500
Subject: [PATCH 18/28] iio: light: bh1745: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-18-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=886; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=1a1blIlRZxXXjSZuCkjoNDJp58C2THl7ge1s5EwPmWg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgX65p3M31ivm9edVoF5bPU2YQFaJOkLpO/9G
 NBCVXlam2GJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoF+gAKCRDCzCAB/wGP
 wKzJB/907gw1xbojUL7cRNV/Dvgd0LFSxeZkF4YblcJ1Yz+0c2MtUIyS92I6I5pOn/tKJvqNWm3
 OJOzaJPV5qKYrztW7M9TNbQF8w9s9S/NwhajVc2tfvREV9bUA9SsTt65nWfJsDEEMb5Tq5278q2
 viPYYE2utKUiiA9yuxNfadtti+HV121T5zIS21mLLJ7f4ljjG9JLUI5k982MU+LRZnDJv3R6wlu
 X0mnXF+c+v+zAcup7pDNFWHXfGocmoqTfVT0p82kir3SPpz+xWHvyBSjJQUCFWQzPq8AVKiHYjn
 TyEpUDtbkf/uLkdvNbw7yzOY0jwiJn6iUuvFkTVih0RpJrWB
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154253_718118_FBCB6866 
X-CRM114-Status: GOOD (  12.40  )
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
 drivers/iio/light/bh1745.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/light/bh1745.c b/drivers/iio/light/bh1745.c
index 56ab5fe90ff9128035cf25948bba1589492e66e4..4e9bd8f831f7834dbcdbc5df4931f473d277d814 100644
--- a/drivers/iio/light/bh1745.c
+++ b/drivers/iio/light/bh1745.c
@@ -740,14 +740,12 @@ static irqreturn_t bh1745_trigger_handler(int interrupt, void *p)
 	struct {
 		u16 chans[4];
 		aligned_s64 timestamp;
-	} scan;
+	} scan = { };
 	u16 value;
 	int ret;
 	int i;
 	int j = 0;
 
-	memset(&scan, 0, sizeof(scan));
-
 	iio_for_each_active_channel(indio_dev, i) {
 		ret = regmap_bulk_read(data->regmap, BH1745_RED_LSB + 2 * i,
 				       &value, 2);

-- 
2.43.0


