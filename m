Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11753C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 23:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9BvUpsqK/JBPl2TbbTXHb6yTJ1fEP8VZTqeB2IMqFw=; b=4C2OSPe8KvZOk1jYLCNOOS0egi
	eK9oKZ845dT3pflL4KIksrRqR1MeLnZhw1QyUAHZT+4OOUPMUSxGIr0L5uBxCycPFrAA7kokXmPkt
	JzyO+44EH+bExfZatA4Wtze0/MA7ZQdMIdRT1hV/S7afx7a4kDyDQcawXTrje61nll9HV7v9GLMj7
	HFi5e4FBCvLQ45WwzrE1fDfmxDXZ7dFUEV8krlxR+fOnMqqolpxYWykUnHDJzQNztvtOtWV+8pp9a
	CxfbFOh5Y+i7ZmvTGWBhSCHpY1OJP9DQatD0dEFi4XEuj5pj6aHb/7yixWEqUJFQaAtmklHwF3oIZ
	Y/2PhaDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUyb-0000000BgMD-2YXp;
	Wed, 11 Jun 2025 23:35:25 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9T-0000000BVTJ-3Itp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:36 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-40667dc8a62so159228b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681755; x=1750286555; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9BvUpsqK/JBPl2TbbTXHb6yTJ1fEP8VZTqeB2IMqFw=;
        b=bRzJ4beKGcJNj2n2LaxQWFcU+n5AN3PbHTPKMdKBOAfHUK2z0NiY8siDa4Yke4BgxB
         2AwXTPKxWR5Jb3jOLpNQ3Dw6GWEAB3VdsgHlLYLbF2uVSJRAlEBA8P6ztK0pUG0At8HX
         /nIQAEDfNOijB1EWC7Vu32YYSuKKWDrBoSSxO4gP4anNwLlkS9eN5GLJ7GhiEi/PXpt7
         VvhRZLpCeI2rLb6iuyuw0Z3Jl+WW1gpSmom54dLA4YK8XpMc4Y1vRFFTSD1BiHefM/dR
         bcjEFJHFV0SRj2qUFQm7eqPXnwmau7Tt1I/FvgJ9dgoPURrep+/CH4dN0Vy5chZzo+I6
         SWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681755; x=1750286555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9BvUpsqK/JBPl2TbbTXHb6yTJ1fEP8VZTqeB2IMqFw=;
        b=epNddY5UOQNKrNBzbs39Flta8uWSjS2x61mjIe1uT4zwPhfz130FXWKA76E1Ejxdw2
         acY6zh1eNGL/JJ7y19+07RXuHo5bouLEKQQUVHhupFzykdaPLE2qucQAP5O2w2k/oySK
         hfIIUxMs7cHZSyLBNBnmR85W3IW3ro9RZt360C+N7lN1qyRIgSQ7z1EnA4C9LnRy98rO
         0+52S5u9nMHoaW6QSBJGU0NvUEVy+U3ncJCV2+LZSAE364hDkPcQ8eRkHvPdlOpz4NmP
         K9sVJT62YSQcFRuHdd/SaO1NV0JisIxD3Gp3LgidedOwSei+BqwAYkxYX5YgJdJOD4uO
         KkVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWefd5jjl9Z772xzkfiTI1LeMDedOhb1pNIn6CYjUvWhgkVXv5su63c/lHf9uLa6j8tz/q+6YMZgCn0awQ6ox6V@lists.infradead.org
X-Gm-Message-State: AOJu0YyS28So9anxHx9lBZsw9bJxhB2iwrhv1wbUS5cwta4yd01dPa/H
	qX7ze1U8HRIy7wiGtTIcZp6QgHuUT3iYyrkrJ3ah1aisZ1FvWSBcjwif57Ug/BnZLHc=
X-Gm-Gg: ASbGncsnSfWyLSB30ilg5k+WkwHsyGRbHUBQjxUD0eVEdVJLnjhRyxZ3T4Xf7hDsa+9
	n4kFLgFePWod60Bd7Pinfvdx2e9n2jccLHJr2EWAtMZq87DzW+xi4Zgk12vg/Sb6rlpiEK6CcoR
	WgGhX4pGUCDBrZtpV0KBF5KWKe/BGPhRXeCSNj1BuopU8RFlLqAjnzwu2i1/iT5NMcXpKAF/TbQ
	gLsomAagU61Ck6D7vSxnzdKn8uO7yNmu9l1TROb41fV5MGXr/CD2Om5ABvyVGqdAaaX4MSjT01R
	QdsfK75OkBvjEERM+OaGVDQ1QKm5Ss9O59Sr0Am4gh5J3iNj00oCOtdj8FAU6UUUVMgk
X-Google-Smtp-Source: AGHT+IH4s7lziWY4EX5g9K2vsF1LhCQHLal8KFovkbFZ6XWeE1Gtee1uuWTA5RlWmKL64/b/sVT1OQ==
X-Received: by 2002:a05:6808:3512:b0:409:f8e:72a6 with SMTP id 5614622812f47-40a669bffa8mr423102b6e.1.1749681755112;
        Wed, 11 Jun 2025 15:42:35 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:34 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:01 -0500
Subject: [PATCH 09/28] iio: adc: ti-ads1119: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-9-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Fa5HFGJPviPDbkysR8aRcatKX4I+wowmJDzu126VxiY=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXAO2JaPHgSGAZdorjz1JGy3kAcpjr9Jr7g+
 ungIXqOY0eJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFwAAKCRDCzCAB/wGP
 wHxjB/sFWh2ELQP61fduPRox8/3+KyTM+RQlgumdT7LlO1lLAEpiFtW4X7LruzoNcg26HI9DIYM
 5xMgNMPlGQDH43u5zRNeQb95sLGhX38U/gEtybJQi9OUyW5XA7GeaqKbCi0nbrZHcDXAaw653s8
 Q0RMbiOeC7z6YROCPWks3b4eF5km/n+4y0RKw0Ifa3ipSc4Z7II3nQzGglfRIiER6v4xfR7JQsQ
 pOPPQ0zXq7qFUoYOnx0ctpg/4uipiA1WrZfArVpBS+2ma7OGrqtQKtP5I39yVCX6SdgiNFnLCg5
 DI3AqiaO66yFIW4VRSNdwSecT26YAQ4pOsJLv10vRGEbzusn
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154235_833469_D1989280 
X-CRM114-Status: GOOD (  12.36  )
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
 drivers/iio/adc/ti-ads1119.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1119.c b/drivers/iio/adc/ti-ads1119.c
index d280c949cf476c7bcbc1e046755619ac31d97c63..d2f86e1ec65641feb3625218611fc8ca00e9f64f 100644
--- a/drivers/iio/adc/ti-ads1119.c
+++ b/drivers/iio/adc/ti-ads1119.c
@@ -507,12 +507,10 @@ static irqreturn_t ads1119_trigger_handler(int irq, void *private)
 	struct {
 		s16 sample;
 		aligned_s64 timestamp;
-	} scan;
+	} scan = { };
 	unsigned int index;
 	int ret;
 
-	memset(&scan, 0, sizeof(scan));
-
 	if (!iio_trigger_using_own(indio_dev)) {
 		index = find_first_bit(indio_dev->active_scan_mask,
 				       iio_get_masklength(indio_dev));

-- 
2.43.0


