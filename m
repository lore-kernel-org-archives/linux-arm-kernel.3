Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E68C71141
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 23:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sYRnmDUxprHg+LgR2XosmphvKPLQ0+i+LbqXhoNfpA=; b=VzxlJ2lfJ7sIbt+RQWf28Ik0HV
	cJ0E0yDq+4q3YtETSSP1+ri3z1kIWhudR+JUXiJNzBfdpBvDwIlbDZI4Q/l3txTUiwATeyfue9z5L
	LXe9ztQaSc9dByJDJtaXZJVA3/fexz3dJ9+7gg0L1QQyiEXv/3VWqrItCaVQKIAEKirRvp79SUI2z
	1mguAG38mjT6AMwiJynK00bF96ns1Q5KpWF/Ea56mhVAFeOa508sVyLmcw5h70gEFxhMmm1l3hbzF
	BL8CaSJDuxc4idq2cpcVxfoTjGTjP7+NcHknCwMiPM8iu9+G329YRPc4AG6t14gaPPttUxS2vLOfI
	+yERH6PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPV2o-0000000Bgsb-2MwZ;
	Wed, 11 Jun 2025 23:39:46 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9Y-0000000BVVx-0ReX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:41 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-4067106dd56so208954b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681759; x=1750286559; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sYRnmDUxprHg+LgR2XosmphvKPLQ0+i+LbqXhoNfpA=;
        b=GdNcbbXlrHKX45a+LtNNjghXplfRme4buV/6pkQj/ZcltuJZrOiysNqgs1zzE8rb6z
         sRcEXWtQrzbRHyGKLX5FM8vY2caKiAJS5h2+vu5guNeZxB5eDdZbulEQKu/b/z9PGUAk
         yHOn0D6Mpb43LN50ZeF6wHWx521WETE5WwutzPYdNJc1PeDh6PEZfS/O1cgtBX7OVofa
         cz+uWTJGqjxIeSL1BiiNYWB+UflRJx91ImAfBgYXIGE8K0sbZzebhHLlCn3tcbgC3kFG
         eHK5c+mmNxCcrLQjGQGfqAjPQKws+//yqQ/f+fHhuekfk5fJZqDyJ1VoH2SWpyy5Yz6m
         pUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681759; x=1750286559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sYRnmDUxprHg+LgR2XosmphvKPLQ0+i+LbqXhoNfpA=;
        b=N8bVazT+G8FeaoADVhW7am3nMgkDhOhUMpcdd4aM09qImtilIF+EaCGmvXKtS0PBXF
         iVnOuNaYRb8mXNnf7qo4Y6P7WhR8sE2CgzOiY8Gp+xU/f1kky1VW5t7EvR5o26ochRz6
         6EaPdt8ef8BERU3OeDwZ7YIulVAj9cah8FXqfdqMjSF7TuhSiPpJGnmWEGhpktfoc4hc
         dlfExMxMA3a5JNGwfvI5IK2g7K5i/5GxGvS01cJfweeXe1poMSmZ7w7RLQkWItlX/APx
         55ERyyOOxdMTL0Q9ITPrr77hNldgOrp9pRUmSmIJXoE5ntglemsRe/0a42xL9h5HjTgy
         gy0g==
X-Forwarded-Encrypted: i=1; AJvYcCWPXBqy1R4V+7tUayimpWgdubUReCzXygy7NFlokGFmvzAt0+lbiMJw4X2fsjrtxbL1ovjWlzDqF50tpOiaGexS@lists.infradead.org
X-Gm-Message-State: AOJu0YypDEKmu+KSXUkLwT/rfp4DumesltRz4H1OX1oQ9eYEDIyVunpn
	hUE62HpYybVY+sNpgc7y6OCioEtL0vjdl4fndtS+GHsoeJpTd1SPFdSrGNny6vId3aQ=
X-Gm-Gg: ASbGncuLHafoYSzQxSdtDMdoNLyNNWow71USURhdj6LhPGMFNLP/Vpyd4nXa2Z+IwrE
	CwLLg98GPNnUc3ECrPe8NX05GZByiV2I8ue4ijQDm+kIOLVgkZ/Em7eXb751ULfJRXwpcIJXkBh
	iwwwgLkcq1JJW2ZEO0UmtjZs2en/eD+qLmwDR073sFi+kLbnolt5utgd4re3S1FtElKij03aeHw
	mTCnvQyakKKerxNItmTSx6nEep3dFyIfcp4gitI22ikAaIWvFNMhAeQWs2WKSZdnIS2bbdwyIWb
	wCpT4YU+NyU9lJpYgzTUpXOr3taNfp9O9ZMFdHxsnrRBkYznOPF5mbhNzZLyKcLBvLm6epmO0qF
	cCe8=
X-Google-Smtp-Source: AGHT+IErlYL4bsSFy9ngVg9McugAmwec16wRc+73AVkKa1/aJVelh+e5fLLya/tzgRaNA/PwviOmtQ==
X-Received: by 2002:a05:6808:2213:b0:406:6dd2:5eb9 with SMTP id 5614622812f47-40a6609c56cmr824967b6e.26.1749681759456;
        Wed, 11 Jun 2025 15:42:39 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:38 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:03 -0500
Subject: [PATCH 11/28] iio: adc: ti-tsc2046: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-11-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=yBs3XS+1GgmnqB6Z/LBOG9076RbaTKgSQXFeV9Rx9Tg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXMR0GMvFJcokv5VGg+Ekcm/aUw3x65eQXt5
 Qau3vKbyEKJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFzAAKCRDCzCAB/wGP
 wEqYB/0aWaPu55zIJCA1+8Yh+2nKwvk/9shr5lt8X2HMjBVuKIJBARV1Ihwlk9gBU3FIMvsGMgJ
 W4gNnxW2ahFYBRU9X6NIB7qIDdnlu9FLgIBs+7HvG5ZrFCdOT1vleHncGAZvz81Lg/RtNlspo6w
 s1e4DQd9TKIrPHH4VDXiTl3tRfJ9p25SdmwrE3UDuHM6w2LPmkgKoeJBV8Q9r3QX0867CsQZJaL
 9H8G6DUTaF7neBW/gG1OOaACNgb6ckSo1vV7pvEjTzFp78nLZuf8MaSYHl/PCQHCKhEakB8WqjH
 9f3O2YBAUgw4FjBIASvaE7wTglESbk23by+IQjvgTwOJGF9M
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154240_138557_08BA8666 
X-CRM114-Status: GOOD (  13.47  )
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
 drivers/iio/adc/ti-tsc2046.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ti-tsc2046.c b/drivers/iio/adc/ti-tsc2046.c
index c2d2aada6772aae6fc8d01c3878d6e869d413bc7..74471f08662e0291b097fcb277b8ad9cb6df200c 100644
--- a/drivers/iio/adc/ti-tsc2046.c
+++ b/drivers/iio/adc/ti-tsc2046.c
@@ -276,7 +276,7 @@ static int tsc2046_adc_read_one(struct tsc2046_adc_priv *priv, int ch_idx,
 	struct tsc2046_adc_ch_cfg *ch = &priv->ch_cfg[ch_idx];
 	unsigned int val, val_normalized = 0;
 	int ret, i, count_skip = 0, max_count;
-	struct spi_transfer xfer;
+	struct spi_transfer xfer = { };
 	struct spi_message msg;
 	u8 cmd;
 
@@ -314,7 +314,6 @@ static int tsc2046_adc_read_one(struct tsc2046_adc_priv *priv, int ch_idx,
 	/* automatically power down on last sample */
 	tx_buf[i].cmd = tsc2046_adc_get_cmd(priv, ch_idx, false);
 
-	memset(&xfer, 0, sizeof(xfer));
 	xfer.tx_buf = tx_buf;
 	xfer.rx_buf = rx_buf;
 	xfer.len = sizeof(*tx_buf) * max_count;

-- 
2.43.0


