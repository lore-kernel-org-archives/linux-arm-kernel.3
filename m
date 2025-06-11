Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74248C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 23:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/fyvlcVM1ITpV4doxg6wZond1KIaJ0G2TrYPww/yVY=; b=egJWgUod6oqc9Rnx6Tez4Q1n9Z
	qkzMZvo3qgoO4ndG4GXcGLm/OEzTPEzQ+vr+xDUP/t03csRLX+V4chYDo8d8Fj2CPcQ89FB3Kr6/M
	SUISZQToC3KMSpyxfSPdFFvRCBbt3VbcYOZ18hGVPMLyI6MAFFKERjUaxAJvIZm/yVAwUpfCGfL94
	hgvQSyQzV4IYwIEVzsmE3BVs9ssool+mPS/KW1Dj0ym+D9JHQTT3b9JdN3VguI/fmJjNuus4ZUTgB
	aZ+qkFYw2nPQj6zyDViCyKZw0mN3710jeunvmCs61y1EC6n7bvxzxANYXou+fYJtV7GDuNNZ55A3m
	b8mxDSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVIO-0000000BjQV-0xIa;
	Wed, 11 Jun 2025 23:55:52 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9t-0000000BVkr-1Rtk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:43:02 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-408fa4be483so198883b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681780; x=1750286580; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/fyvlcVM1ITpV4doxg6wZond1KIaJ0G2TrYPww/yVY=;
        b=PZGvfwfdp9MMQb254Zc8I32qEx/UWDGZq8OaHS+XOn0gzfgwq6vTJQz3v7gE7VwSXh
         8vuYGKh1zn2WtiELH5HsX7Nqie9hM9voJxFk374IQwvnuPQz7CXZj/0FBeYOnPexkQVc
         3eMZ0HRGGbORT+4C7TJ/P52LVk0Gi2ADmhJKJPBKx2XJF694WaHknfXPblR4i0X3v3hZ
         CHsYYHfHPKccqF3bfZttHyViiOhbUQmSzdhxBp/BCsQazRzWi1/5bbpqXarOFuCyQGQ9
         2t54VzF+ht8la9ieAVfWmBBrntIjw3DHzvzMT5RVqCxDecKg0QzBsLolxKqcwh283Y9q
         eNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681780; x=1750286580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/fyvlcVM1ITpV4doxg6wZond1KIaJ0G2TrYPww/yVY=;
        b=I1JmK2jufR/7Yqdbo9dL/adgKjQPw2R2mGBEuK53AQasANvK6mNM9KbMdF2s6N8uPW
         lQ44RBFPv2afrn55FEGWR0wU1nrjB/jwR5fQH+Z2M1+Kq1hSjPZx/JpYHOm6IR0DkM6j
         l7tSyoV35uyMybw8nP4IHvzjHsI8ps8OdMm6zJNtLGaMV+L69r40Tc68RdWqPaUouY7f
         uVYeJX8ALt620tbm8thlGlrqhI4gPFBrR2E5m0QMOynK9VFnALGr0SNu+XvVxvhOjHXW
         VhwknVW+u2P0Y77U4lyWpeUMSgIChcQ0+3p8g6d1XoczbfoTiwdf98ZLKxXiwUciThge
         aTkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVhsGQ3Wkumd8M9czoWv4mi1dMDzpe3Zo7veN41JoaXWZsXNLJh6DjEHN3bro2I4f46nQwMa1qlMGRJQ8wOX6n@lists.infradead.org
X-Gm-Message-State: AOJu0YyuREkAKFRe+61iTOSEFu9EREtReP0UNl8I54CO+sbwg9/7g4kD
	9dCY+ehCZmEfQ4GJ2cRi5yMkQ+37efZNjBpWNZ2CA3lCQMq9GOl7h5cS5COMhhkj4gfkyDk8Mic
	RDYKI
X-Gm-Gg: ASbGncv0Cg00awSiN6FgByo2Dglp9HJ/znYljowwTZCu2J92FqqpsWA0wvfHVg0g8OA
	s/xrH+LwsNkIozYaOtTRX90ZEe6igL/dx+fX9OR0KFLxbOqn9ADLiJBgg5hMQWi+hTMKPx9pww+
	NIz0zaujp26FP4vF5W3E/q/qMMSkyOZUSGe695XJ7jic2vIRrzB20oPu42LUwubKy4q78tsqRPK
	3+wqcxZk1hNyF+nAkAQnB6QyQMbJOZcH6FfV0FTktL8LIEYwzKEFnpfmX3wBKxBYiMuCaS+EgLM
	d4TbaT5pWKQRWHeMMczFF/UzDTYcRaVQfDtPk9/W7uwQpJr8UcxyFUs6Zlj54lr0vxlx
X-Google-Smtp-Source: AGHT+IG6Fb6ruVGlbHN4wGtZayIBTNPpt4aY0XQOYZxYfr6Numkaii3iELBWcumofDFYzCahxlkCgA==
X-Received: by 2002:a05:6808:199b:b0:404:f14a:1345 with SMTP id 5614622812f47-40a66b0ca19mr438688b6e.20.1749681780657;
        Wed, 11 Jun 2025 15:43:00 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:43:00 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:15 -0500
Subject: [PATCH 23/28] iio: pressure: bmp280: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-23-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=940; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=jR04YIdN9O2ZMn6ou5NomkQoDwMcMUyRaU/L4iFhuwQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgYdm0BKld1aGwa/n8Ufra0S7lpef2bRmG8sm
 XrxLOEC2AGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoGHQAKCRDCzCAB/wGP
 wHmNB/9z/ZKAzqrCy6jCj9Nu3CwEx8km3zZWktgGGSTTwtSfGw/x5LdCO3sFLygxQWItan+1Ich
 yO8fN+fnbDRpUq82KyKlfgXYeZ2fx7BLOWimk7amjtwwGL7GwFtoDG6M4WAYuoSlfZDY4Z559WI
 avlUzdpOOZ0uGVROXj1yJsI9B8t1XZCb7Vcuz9L61yMgAPtHcR5MOGVBvenewxkzOS4/+HGapl9
 U67xnC/8UibkMOEViHKdq5RBSx4DBeDzP4zUfHQD1dbiPQO+Rqo8SfdFfQMLRFMpM2NE1QQXecV
 eoiNvbO76iaTybSyC3JuboXfNbd7tzFGUfKYhLRg4vDgwf0R
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154301_418897_5276B38E 
X-CRM114-Status: GOOD (  12.34  )
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
 drivers/iio/pressure/bmp280-core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/bmp280-core.c
index f37f20776c89173b0b2a8e28be0ef9aa30ceea53..74505c9ec1a08cf3ffdb55bf578d40ede3cc5d00 100644
--- a/drivers/iio/pressure/bmp280-core.c
+++ b/drivers/iio/pressure/bmp280-core.c
@@ -1234,12 +1234,9 @@ static irqreturn_t bme280_trigger_handler(int irq, void *p)
 		s32 comp_temp;
 		u32 comp_humidity;
 		aligned_s64 timestamp;
-	} buffer;
+	} buffer = { }; /* Don't leak uninitialized stack to userspace. */
 	int ret;
 
-	/* Don't leak uninitialized stack to userspace. */
-	memset(&buffer, 0, sizeof(buffer));
-
 	guard(mutex)(&data->lock);
 
 	/* Burst read data registers */

-- 
2.43.0


