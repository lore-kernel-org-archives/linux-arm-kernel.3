Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AE9C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 23:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zveqOADtHS31WFyPmzToD+nPl3JZ4+wju2m9sYArtpc=; b=SN4ObjJM3fDPrfwuHrnQW5tmJN
	YzMBwW3NYTW71C0Xxcx72u4c+jV5ZSIENxokaPfV+v9unaFvBoYHx4ol5XbNFNxDNIAgTY7RkH2Gh
	yBrbNbkk7bw/x/8nFX+cWXKQeXMQ+we6E3nNhWiieXADvlLchaVvXZVhz63/LArhlkzQWkDMe8YFx
	o+KSavAwnsUgU3Ie5RT7kZLl9awRHhA724q8n+BfHLp93fTirOCtZMFe8zOo5fThvpSRwsjNgPxap
	s3NvU5hLIcmpq5riDn/lBwFkC6guf3KL84UVpJlQj6+7+t2Zw9sKOqM0f8TVhTEBlxdknfyBn4RKh
	iRnB876w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUho-0000000BetB-3KTf;
	Wed, 11 Jun 2025 23:18:04 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9B-0000000BVIg-1AZd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:19 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-40a4bf1ebb7so195030b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681736; x=1750286536; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zveqOADtHS31WFyPmzToD+nPl3JZ4+wju2m9sYArtpc=;
        b=t6QMfENppwM9EnqR/bTk+e6T7EC40bO2ZHuAsDFsNZCuJqZqniVVI2kw9M8CeuWwgI
         yjSBHTRYf0SBHcHcbci6lCdrp8rBPAHU73WuF34rXjMb7vZg9z0zPL/MvFHgRWiIVdk7
         C0K/UMvIq8j6dk58mo4BQ1awceepNyeEKMBY1Ro80srlQ8Jp9LcYi2h55WKIiNZVoXns
         L6mS2uipE844RqlPajPt03wuO7HhTxj4uyAUKgI2Chd9fOl0YIU6PxR6L6cgKr4/4Sur
         XlvNOuHR0jgIxQTeXHNjXKYEiVmhzWhuksWpG+j60u9S36GpKtYRNE3VuegsNUNvcrgN
         UymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681736; x=1750286536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zveqOADtHS31WFyPmzToD+nPl3JZ4+wju2m9sYArtpc=;
        b=YIYZ0/Vt4BZkx27/FZpllnPQA+WOyIZFiJrudkzWu0vCwHR86U/qKOTgaU6bIPOyOk
         br3E+li7xEr+l7UhHYZMg0B8T58akMcJwAqBR/nx8SP4uJjJC9MKM1VbJIMYL1SJYpDg
         xRh5IhWx62wBj9o+U0XJcFtggahhWnq0PyJ+HGkxXNOhecpptK7xJ/EXDyZP5S54im9S
         NXPW1bLGCGhI4AApuDokR+vtoxXqvngcjVZZGa/PhTfIC0SBexGz2eZWCpLk5u1a/q1+
         9NZT1wc5ubm2MOAo8lN+9llO4WCFNKEZ/o4QbBra22sonv/D3zF1LHK8CN48HAxvblcw
         xakg==
X-Forwarded-Encrypted: i=1; AJvYcCVWB3ibOcvg/6QOlw6cETvcfftGYV05sxXXX6Dlg6k+H/R9yAFwZx6KUextltX8A1AYqwll8MBne+IejGhZDvyw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6vBLNjiI6wP8lSpgILDScMKEYqUjMUm1Qrm40U/96VG7dLYJi
	iTqUjGw9TAeMtnRhxfTdp1sA2eGcOB+vwVoEafZgsNm/KCNdckvjJGSorKvWyYvD8ds=
X-Gm-Gg: ASbGnctm03Y9uqFzgdBC+sE6Nb3bMadHwKoENSM3yNect7MbuoY/jKqcZTcDX3nZGnv
	M8ap7rTy9BJgylVt6o4Ukhu4TP/eC1Izb9oLzH+C8vCBSaE03jsG5mUAHN+2UudT6rlQ9v3pPlV
	LdckK7Swh7aNPTmNepkvPN7KoZ1DP6h1crqPPURcw+B1pIkYGQXrQkBK3SulBIhWvNDeH5a/mpE
	9mX22lsq/HMhJ90nexRqxBPxopG02FACedudpqU91Otyy9fx6MF0XDVfnHWQgFrucZyVW5/ZXQI
	UDgiHXEoGkq9RL+0le/gzGCFj5BOZOkGDMDk5sCA1IWIF9Ev5lup54Y6xPqtA2FLQHJ+
X-Google-Smtp-Source: AGHT+IGIpzPnDrmzBmfsC4tKKskTV7D3wfzLsNC4g3WTLnbA1Yephi0RklISAXQUfRO/ncM9aBfPJg==
X-Received: by 2002:a05:6808:6a93:b0:403:3fb7:3870 with SMTP id 5614622812f47-40a66a5b32emr592491b6e.10.1749681736398;
        Wed, 11 Jun 2025 15:42:16 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:16 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:38:53 -0500
Subject: [PATCH 01/28] iio: accel: adxl372: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-1-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=903; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=OtTTIp23r83l4FPUg27mf0gCVgpkwXuq0SNiBdQqXRI=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWKKhpCfFTksDG9gr+9eawR0jxJfSx6dAJNM
 0SZmsoqdzqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFigAKCRDCzCAB/wGP
 wCJwB/4gUJ8t7UOdIfHCp1gF5oikHABa4eS0J2FUBt6zWTkee4P4bV5tDwfS1kcYHllaJBX/CtO
 7HxkjtZxmdIfL2tBgPZCBP8S01Mg+OXaLOQaEx17gLl45c23P1lCfWSYP+PhWq/8KoX2NIR7n4F
 9oees3ltMwkbduWFqU3iEDQB0oXjzl94CRk6aPeSRv1xieFkbXgD4FSutJmNiyViLOv2q4OqnYa
 4gaqd53Li0HDnpieOacuZPGeu3GoPzOXOtMsI7N1pk1zfWsrHFkxI3Yw04/HUQokzunQaFQaFF+
 HR9AsvwTdenSczLxmQcrifmcH2iDoIhYwK3xodh8KKtXzNMd
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154217_314562_60044462 
X-CRM114-Status: GOOD (  12.28  )
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
 drivers/iio/accel/adxl372.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/accel/adxl372.c b/drivers/iio/accel/adxl372.c
index 961145b502934674e7655573b12121fffb2328db..46d518a2a029179bdd2cc2b9e98f09b6b9854fba 100644
--- a/drivers/iio/accel/adxl372.c
+++ b/drivers/iio/accel/adxl372.c
@@ -600,10 +600,9 @@ static int adxl372_get_status(struct adxl372_state *st,
 
 static void adxl372_arrange_axis_data(struct adxl372_state *st, __be16 *sample)
 {
-	__be16	axis_sample[3];
+	__be16 axis_sample[3] = { };
 	int i = 0;
 
-	memset(axis_sample, 0, 3 * sizeof(__be16));
 	if (ADXL372_X_AXIS_EN(st->fifo_axis_mask))
 		axis_sample[i++] = sample[0];
 	if (ADXL372_Y_AXIS_EN(st->fifo_axis_mask))

-- 
2.43.0


