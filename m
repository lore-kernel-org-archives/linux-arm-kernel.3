Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54024C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 23:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nA/Lk9tPGfFaI22ceEDpAoxrxXFiJ/9IsqCSjqV/LI=; b=K5uAZ84auw8HaX7igjqGTze6Va
	tAm+vZqVobOWUZ4YyCdt63BelnmhGf0MQiVryzcxWdoXf37JYoDklgoiqZAO6sARS45Caz7LUlXGz
	2psQjSBvKPEemhuBnzxRv7oFJ5F+bHg6veTMdLnFb4bGKb4Z2z4/Kra1GmakWdYSTkyjp64ZM3814
	Xdmu/j4d6fZ74JyWeFTccTEyPnmp3YzNXxnS0Q1Q8GSE2t3kSnKuDhM2EDMM+KRPu7L/5QsEggfLH
	gqfbAb9gPhE/9vM2exnlZVeLZWv7DGNd18bZUQDwW56mrebWVqRDNbjACTRznMz0ua+YoJOt7qUSM
	XyHCoH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUqC-0000000Bfc5-2EAu;
	Wed, 11 Jun 2025 23:26:44 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9K-0000000BVNF-3ooG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:28 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-407aaace4daso173531b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681746; x=1750286546; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nA/Lk9tPGfFaI22ceEDpAoxrxXFiJ/9IsqCSjqV/LI=;
        b=xxwipwCMbZPCDRKO3KmNrY5xQOyNUifOPNX++HjVV+lcNr3hL2KFNmdyJO7HrzACj2
         XrUtBGRZLrfYGl8D4kyaYY6z9g+MFYhE+s2/ZgG5jfaBuA1K89fUcdl8OPOt38u+GbPd
         OCkxDVChol19o2nfBweizxtd4heljBXqnCl1uw/pS0mDIVRQiQNvoLuUK7FW9neiPvOt
         uFrp56giZtR0/moJk8vQTsvCeSTdVILKzFP2oZ2AlufSPpAoM4rY/1Xx/1WHLWj9TEyQ
         bj8oOd2qZ0U796lYYUmRDkcL1cyekyf6c0htBwMQXgSxGxaaFZq9ZEa/otr6tAeDiofq
         AQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681746; x=1750286546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3nA/Lk9tPGfFaI22ceEDpAoxrxXFiJ/9IsqCSjqV/LI=;
        b=tAK0EHncXjFdePNTS6r9M6LoPCQVaG+M/mIS5FZXhZUJ0jhq9C+B+0qif4xKlyLtSm
         XEixeVEXzq3325fqpxd/csKi6MySMrsa9h5Ze8M+u+hQx2kIfUQR3jalkSdM1wNcRZXJ
         1Km6BTkPWBkWOmtHn9T8ET+F8lLOyzUGFfRbtyLVMhibL7bx1hOJMkeAmGiaWZ07Ppsa
         4kWBpKuFEFoAWbXRyoC97nTm8iNfndGi5C638A1a0AqmfAJVi9jdSnOpCpoYzxBk3cuj
         AEuo0FJBY/VEujIKNFzQj+v40ApgCkAvCiSUlz9UtoPGfqcC0DDpZg21koFSLlnr3gFO
         eRHg==
X-Forwarded-Encrypted: i=1; AJvYcCXE2u+9K+4AZU/eP+VSwdrPfw/nPQ+QFQllD8hN1CaaSJU8c6wEEKmadkm9TnaPrfLvswb43nAkTWHLWF+VnB3K@lists.infradead.org
X-Gm-Message-State: AOJu0YxVqek2W9Xh5hcII7szlvuyv+iNkndKACxn+jqUZw+ESLOgDuLB
	7eF1ZD+of4wl8/jDkog2hYpiohUUSjBYDXRpNjebs7alj+PgwaAlxXCJbveCXR2JiLg=
X-Gm-Gg: ASbGncs1YomYHXDmIheR+yp9ZnS6piqPQAOv9qC5Ccbm8iFatmLKAQKtFVS2WBlDGeJ
	WWR8ITlh3gMOIOeySdM4r7Jh8mj9d7GDT1BslZxi5MGY7PN8yVJ5SE4XsdEmv6zG9eNGm9GyWY2
	xOP6MrM86NAVaj5OXrOr1WYoTPtLG6l/dKgf1vkVwsuvI++Ph6+DdrvXKap7HLcI59Tk5XOdm5Z
	z70hLmniFRVxnmDjiLleGsBWzot4A/O8pOK0ihbs5/d3iVs6JlAWVpFu1IJro2JiznB7gsVVtQz
	7S1vHyRiFIHxwIRqO6G00INK6RKEE+Pq1mCRw1cmUKFl0lJ4kMl3yfaBKgIKUZg6U+VF
X-Google-Smtp-Source: AGHT+IG0W8cN0RBqzvza6bDhDRqg08z0+EUeK0uOjK7EVtYqqJLeVsRO4zcpkxGJblg1Kp+3B4rIBQ==
X-Received: by 2002:a05:6808:2186:b0:403:3c95:3684 with SMTP id 5614622812f47-40a66a419c9mr505006b6e.1.1749681746196;
        Wed, 11 Jun 2025 15:42:26 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:25 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:38:57 -0500
Subject: [PATCH 05/28] iio: adc: rockchip_saradc: use = { } instead of
 memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-5-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=859; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=5Dt8chRh9Q9zFfR+o0HlVC5RLtjfsBgIEofeyEgWWKs=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWkPxj+ITtdzYFOhYRqZrV7rzI2N1a8bxnjv
 BHEMh8oTqiJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFpAAKCRDCzCAB/wGP
 wPI1B/9lozodgbkP5rQVG6ALBHKR3d7hz5SMy/uywa3QBiiLmgj5QX1cAyGMFHI7hO3uO3aQSl/
 mDQT4eItTwkjzu/N/k2p6HIl0UyXa2lwFwPguAh6Fco94W+bqLyMiXXgd04TmGW4jedL9LbPCgY
 07pa9FRxuw8J6Kg4xZzUitsXeewyNtdFUuzGLvmvEY9oqh7A/1iuMLVZyNULwWAqpBbAvI4BDWY
 mrWqXne1TqcmnTZJBaLxnti67Z2+Kmlj8oL+TyU8uXKtKa9kYw2cN9r+8cjaEZt5I4qaauKXSq4
 I+XFZqyqUd67pwca8QgxuwJVoQn6LMRTdn54nn8A0dcTI+q1
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154226_971721_8FE0B9C8 
X-CRM114-Status: GOOD (  12.56  )
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
 drivers/iio/adc/rockchip_saradc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockchip_saradc.c
index 325e3747a1345c84cddcfe9a455da6ccf655447b..bd62daea0a3e5b879a8a970d107e3342fda7b8c0 100644
--- a/drivers/iio/adc/rockchip_saradc.c
+++ b/drivers/iio/adc/rockchip_saradc.c
@@ -404,12 +404,10 @@ static irqreturn_t rockchip_saradc_trigger_handler(int irq, void *p)
 	struct {
 		u16 values[SARADC_MAX_CHANNELS];
 		aligned_s64 timestamp;
-	} data;
+	} data = { };
 	int ret;
 	int i, j = 0;
 
-	memset(&data, 0, sizeof(data));
-
 	mutex_lock(&info->lock);
 
 	iio_for_each_active_channel(i_dev, i) {

-- 
2.43.0


