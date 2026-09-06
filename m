Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5CCC79F85
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 15:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0nEO3AVU8BdN0/yPVQNPwgB0D96TiBKB6Di1KmEt1I=; b=OoS84COOQ2hUX9E9tXft2BO0Si
	Wpr2REFKS5MQBLV/qdXmnexCpN3muSdLJNU4gvjoZ6PKKzNqWL7nqSEHKhZin++v29Wj5xRicxid9
	0nChhUwKWVXAYnNvjFxThoGD0yAI2b+GwCvelpDc3+j/wYwnCo6EZqP66HiCtz/jzVxhmd2mlYUSl
	fHDAdprUDfRZmtW7yfM3tAlJggkIi+pAOeKJGYFSIGiRH+VAax3rgS1NurRgBloQtekjBbFs1HQdZ
	uIKWpNuOCwB3SSJkhH6TL9FUyfk4n+T/8xkbCZoeWr86DQzIsu95GzQ7qxHMp/1lZiqllZn+OUkQX
	2Oyu5xBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FGg-000000059uH-0PgS;
	Sun, 06 Sep 2026 15:58:54 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FGc-000000059tN-3Hvd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 15:58:51 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so2694958a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788710330; x=1789315130; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0nEO3AVU8BdN0/yPVQNPwgB0D96TiBKB6Di1KmEt1I=;
        b=LdknbzDAD+t2YVMR9SIsRC3akgVIqYRbF+bjiamw9wM73CB5Xq8GIJZWtp+uI3XO5c
         k8ZMG+wD6/D9+oDN6JvGC3bn3nu7ryEZnjKgzP/wArsEMvnrm7lNNwjZbc/7Eoj3iFK1
         TlJoGA27ol5r9QGYfAn6TFESZPftPrmF4dGhx6LJf/bX0IwCXj/XRcB3AdLABkknJ9Sy
         HKQe6rsYcfX8XwLacUF5LPdT7jvCsaJCIlgIBGiVLNj+CaFT+jJ6GwygY7Lure4+T86v
         SPnwYKKZbvI/v6Fq9Xscsw9jcZXgGbL+Wbyv3GZRYOlYgIuUKmCfaqJbdtE0El2v0+j7
         YVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788710330; x=1789315130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0nEO3AVU8BdN0/yPVQNPwgB0D96TiBKB6Di1KmEt1I=;
        b=DVNRVvAMsRar++ajpEEQ9dDJfVEC/1DewQWsymAo/cCoeJ1OytqikvD23hZkeZ2VuW
         QYebDb5A9U+pIg/4MoYn3RkqN3lpxslOV2TLcy56dW29rYAEPl4hN0v/ajqWvtwuKHBk
         L3xgvbRPeOC0p19iHQDM3xxWiEhddKLd460bV9XObJ6PM6bWZWEsz7Wi8v74ZK0djIBZ
         Oi13IAtKtoDmD54jxr8sIoWoMVecegdlscoveoNhdEala04M1Z/cdHUuzB9O5iL2Q1tP
         UdXYRdvsQ57vFZ0AuUNNuVX0AWMTDLWzvOIJJRmruqHHHrH5K5Z0RCr7jpXeprOGb08w
         XDIQ==
X-Forwarded-Encrypted: i=1; AKwUvBybON7CU1Ak5LUw5pvTMzpT2MsaupHkgEZlP8JdyFsdmDYj2ggP3NZToVwZiq05f/itHejmUazG7U72nDdmkk7Q@lists.infradead.org
X-Gm-Message-State: AFuF++m/u1s5UZmeiJ2Qo9y0g/lH/7fXk4bBr5EE5de9+Hf4VkOl56xg
	bKYYIGY0an2Sfp3Lwld3O+F2bDzd/mhWG9OqAMHHRhB60rsENtViURca
X-Gm-Gg: AYBFou3FmpQVk8yKUI4y/VGAmPVVcy77HtTc86s0VyXT5pLIG0wS23BnqQc57jRMPvB
	oqvGQ67djCi/k7pR0kYVgKfN0NnQo9cTvGgUZNuYPMpySJnTGX8//sS22NfXpWZgkzgPUp2bEF7
	MLXzaSoJxEjVQYJzWmyRCs2nZDvFCTStToWix0P1csVNE5OuGZX02toQYyjiHUqxQTlAdcbwkJf
	37I6hCOEybN0XA47AFrWgVhruAEuags0OXzgOkvkHekhcydpVMw23GB8Lqtvgco0n9fieJSEWkt
	amMyzRh6J+qXA5FsCTdhQdJzcFhfzC1uypTQBpTDOTkWZbO3mk244LbtZm3e6pcLikq39vphvhW
	W9MB9wzG2iNrSnkIvQY+I8rhGHx1Gp+xo0MtBgBNw8jVsybIrKUr180wUSyBU5CsvgJbR4Wii1T
	HCumPAzp5VZTmZEynXH941NzruzaPTj7SslFapDY9eNDnGHpodPYtHFkzKOBbKZ0uJBQoLO/NhL
	vSxfMQ7GfT+XVbsjT1vPbghBCHWpW2cjX62rbjAxEbiK+Iyor7aVXfE
X-Received: by 2002:a17:90b:5484:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-39b27c0fa43mr13496195a91.1.1788710329826;
        Sun, 06 Sep 2026 08:58:49 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260f64ecsm15941401a91.8.2026.09.06.08.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 08:58:49 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 06 Sep 2026 23:58:35 +0800
Subject: [PATCH 2/2] iio: adc: sun4i-gpadc-iio: clean up on thermal zone
 registration failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-gpadc-v1-2-92d3dc8ef355@gmail.com>
References: <20260906-gpadc-v1-0-92d3dc8ef355@gmail.com>
In-Reply-To: <20260906-gpadc-v1-0-92d3dc8ef355@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Quentin Schulz <quentin.schulz@free-electrons.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>, Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788710316; l=1124;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=Wt89mC38z1SB+RdqE6/iGje4kTh6KTtVF8QpLkUZBJ8=;
 b=oha1atVR2mqFYHAgjPpNIY23PNkzfXFXSgJrMheeJEnqaNoYl3svWtK+Ma/SC+uR/OUo2QZH3
 3h/DIP34cd5CTKVMzJcWpueUg07gLh1FmVc3T4LYCLOKHZWRSurCtUr
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_085850_849769_6B81A816 
X-CRM114-Status: GOOD (  12.70  )
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

If devm_thermal_of_zone_register() fails, probe returns without
unregistering the IIO map array or disabling runtime PM.

Jump to err_map to release them.

Fixes: b0a242894f11 ("iio: adc: sun4i-gpadc-iio: register in the thermal after registering in pm")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 85382e435f2a..ac5ba76b979e 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -638,10 +638,10 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
 		 * thermal because no thermal DT node is found.
 		 */
 		if (IS_ERR(info->tzd) && PTR_ERR(info->tzd) != -ENODEV) {
-			dev_err(&pdev->dev,
-				"could not register thermal sensor: %ld\n",
-				PTR_ERR(info->tzd));
-			return PTR_ERR(info->tzd);
+			ret = dev_err_probe(&pdev->dev,
+					    PTR_ERR(info->tzd),
+					    "could not register thermal sensor\n");
+			goto err_map;
 		}
 	}
 

-- 
2.53.0


