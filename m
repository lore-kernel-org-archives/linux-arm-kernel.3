Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2304EC71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 23:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GqXAUC5ztniIogZLpwpNEvpFvqt5l5bmngIYMTHsoc=; b=EGxz3QHMX7bH6IxowkUIE+bB5P
	JvHGAhRygOENXqi1DwHjKfiGFLkhxX4NTUgmAqNgXQ6p1PR1A6Uqg+W9b8J12LGm8Y11wrIz84ygk
	/EKkrbt304dnyP7iEWxv/xWyZJW1tQzjA9QlurZ47I++SMePyUCLHMcUlbMYeMCGbXzOqkOvKu23e
	reWrzDM9ILmxns+YHjNI47+7Fb7BWOVATNmflDfxZCiGd0Nye65JWfkEspvakUJGAv1jmsPWvg6uv
	u+I3T7hKAhSEBRVxE2J7tqaEDi1BGEZ24LQFa5YjwnJXtDp29Ch4xvYTcVM4+RAsrOavDGnpe2opr
	dQ5bYoKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVC3-0000000Biah-40Qs;
	Wed, 11 Jun 2025 23:49:19 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9m-0000000BVfO-3A2B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:55 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-406e31162c6so124119b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681774; x=1750286574; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GqXAUC5ztniIogZLpwpNEvpFvqt5l5bmngIYMTHsoc=;
        b=l0HjuM/dcw0eWim1TwnJk8ndjDaB4Hkn/xCoFZSLXw/RZaggZLSRrJidHpGJLnwrlo
         64OEYvrd/n4ZorqSp/b1q4nBZYzeQW9nF7Jza9lNXPVErg9ePm65izgJ3M5CcOTg6yMT
         xq6hWLtVcGi2TqjSAQsWWQefP9i0W5EQSxCv4hU3ArYuHEwoFWf2vNwFLLTbb7wM4+we
         sV6ROW1sc8Z3BDlQPq8mFxkGFQ4J8Kmxv9j6GLKfoptOPJRmi2KBlcTR46EtI6y1w1Zh
         Wl7QVJwWLi6ObF4Pm0NGN4GeVJBquvdAVMoxt/Rvbq3vfT6CbPqu4hYCqwODqX9qjcsz
         ORBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681774; x=1750286574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GqXAUC5ztniIogZLpwpNEvpFvqt5l5bmngIYMTHsoc=;
        b=ZPMg78u5NIt3/Y8Gz311LmzvtZpNMRfinpHp1uei8DgHQNx1UAPRUojDrhTKTywnvf
         VCBOuhGrLbsR8UmP+PmNI+JdLr9rMbZdTNPlet6ijiaiVHliooNdUHegxy9GV73cvzC9
         6F4N9jCVClwwvau90LaUfvgzNgRd6+txO7h61s0ahQRqLKI/DKMyWNn0ytB7LiBwylO3
         hziH5eT3lAMzabDjpyHp/7IAMBIB0h0m+kK/VP0nNo4j06JWlJVJbzdBgFmVyOOtc8A4
         TxK/cTc1iCwUbr3p0wsKjTR23kDBnhhotL2QuRWOHNZ8OECwUusI/VbKWDLOiKZJAVDX
         Lq7g==
X-Forwarded-Encrypted: i=1; AJvYcCXt+hmVosr2Xrbnx3sOvCojKZKhN1eTTyU/shScBN2cFG3MRx3KQktny9cSCX+sGkaebDfEmvTu4bxSwtaSI5l6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3JYWcGlQuYMklDwVEc8Rc/K0ZpYPUJT8jelUpwF2bLA4ne57T
	YLHwBQpXjRvgQNABv5b7xWRB0bRtJjBVrqoXeD88mHImK1sAHwwY/HULaKYfMHg6cI8=
X-Gm-Gg: ASbGnctxFGRhbf4u57v2FoAtPRU9kdyh72/8i2BleY9rvu463pT+UGqk4vDaFE/2hVH
	ocFaKQyUPXB4mbQKkXyXikjVqrQ2DIB02zEAWGaemJFFtziMW2JbJwzUf2d2d+s1OTPRbBuN2gV
	1ooY/k2MTMWeWUwKOxLOReLMV8W9FodCkD3Xtqvk7rPvpEUvWLqm+oAkHQ2hHj/Oy9DJuTDliPl
	vK8w9ok1SLRD7xN5zTLW2Pcx9wnVzyHWkbeQn1fK59AF0FY7omtsrvQEDnOSBvFk8z+VceTwVY5
	o2ErKXlGdhbFy3oLGCag8rlKER6B1GgS5K0YjoHcn0jgWurV9NYA4/hgXl3kqm/Ip7/U
X-Google-Smtp-Source: AGHT+IEno7iivJ7V9DJ4jS9BfN9qMtC3Kbpn1hoqPd/0X7I8V1hxaDUFP1SUYvG7cJTjWfN6V3+JZg==
X-Received: by 2002:a05:6808:1a10:b0:406:6fd3:ff13 with SMTP id 5614622812f47-40a5d127d4amr3587773b6e.25.1749681774060;
        Wed, 11 Jun 2025 15:42:54 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:53 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:11 -0500
Subject: [PATCH 19/28] iio: light: ltr501: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-19-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=gCWBhc3n+k0rOzdOzNEkxMDkk/9qdZ4NyBLN5i838X4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgYBVhD9q4Dm7oGQ6HylErBkZw8NPS9LtGnpg
 QcqtFQcxeCJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoGAQAKCRDCzCAB/wGP
 wNsdCACOa3y5zsZO5jRJ6TXkHQFX74S3Nr/9bVgpmLdGxld4Z+7+JIvhiis7hU/SPgSfaXy1HEh
 ktDMqm+R/k9m6uW1HuOC7FUOZJLVTDEKAKUxRNRhp4bfH2LUFh/G/3GgfwO9f8PoXq/NmULXpda
 7A1aG/YSYU2eMZZHKx2FjIlroUI+Q0DIRxoJJRuaC+0ZUZnQcDdRFGU+SUR6ZUAwal16z0jOcSF
 j9VebgtqFrmJs6emiKebaukDj4wXBej4ZpE+d+H8FqpWL6gldFBpIJFLejRYOTZaFfnP4LO0Eri
 JrZp1IDGBtR97RjR801xEzHW4QUVCM5l/UjRUFcCLscdfHuy
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154254_801119_9DFC37F5 
X-CRM114-Status: GOOD (  12.57  )
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
 drivers/iio/light/ltr501.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
index db0cc3642bd8010358de8515c24337d7385bce38..c14767472fbe8620ad59c8417d2ceff14f9485a6 100644
--- a/drivers/iio/light/ltr501.c
+++ b/drivers/iio/light/ltr501.c
@@ -1279,14 +1279,12 @@ static irqreturn_t ltr501_trigger_handler(int irq, void *p)
 	struct {
 		u16 channels[3];
 		aligned_s64 ts;
-	} scan;
+	} scan = { };
 	__le16 als_buf[2];
 	u8 mask = 0;
 	int j = 0;
 	int ret, psdata;
 
-	memset(&scan, 0, sizeof(scan));
-
 	/* figure out which data needs to be ready */
 	if (test_bit(0, indio_dev->active_scan_mask) ||
 	    test_bit(1, indio_dev->active_scan_mask))

-- 
2.43.0


