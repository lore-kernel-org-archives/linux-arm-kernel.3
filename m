Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0E1C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PHi9Zj9Ui/Tog0J9ameekJ7BZTN9ebJ9txjTOhyyok=; b=3bxs+Nkuc/pmzUQsElhzzoW8sq
	zUdsLdao1pFEiwMv9xl51Ze2X/obYXNusBH9NDGC3sBykPy4eKR5ojMcifyxrPZd0OwTrZxE1Mngn
	D/K/yCOw+m+lq5DaOB+u6iz3bmECUCrn14HFU+ercaEibgmMuddBTuBjY/GyNgjmbiS+abPS9t7vB
	Rt+IVTPu1tWTT2Dh99sQFMyb49ZCbzIshQnoGe09cQWHLlBRnoUsjxwiCsCV7hM4pv5LaMxaDt+mh
	nX0RZkc5jHii+HdhzMB5P9BjODBzVMbLVzA0nUzZQgTXQAxi34v5m1IKgQep15917/KVMdbKpXFFA
	TacrgvoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVOh-0000000BjzX-2FgR;
	Thu, 12 Jun 2025 00:02:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9y-0000000BVpF-1Kuc
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 22:43:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9PHi9Zj9Ui/Tog0J9ameekJ7BZTN9ebJ9txjTOhyyok=; b=kn+F0ThdE9dvA9b5ARzZ342kB2
	ooDO8qxZfdCV6Kg+UEcNdLB9zjg8sj+i6TOb7bwAEPm0r2LmeGTM2IX9bDeOvYNJESul1/nKGQkWE
	tW0nSQQEtgrG+caM1yUBBAnphfAyH32eJ5/kQ4NMsZEToAscLgDKCm9ceHRmlAOK5opht9MyXnfDs
	tp7/mHliAAI913Zig5d2uTaUYD836kQgno3wwiJRJS3A5S7b4IvZESo6zqdtc2zkotz/i5tAPPQJu
	NOw77H9BY6mM8BVarKJRw7mAq0m7n3R/IvGCN5kw12QyuoVzfKPXhpbk6iuiUzIK42RsmKTSi1OGz
	F7+w3eaA==;
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9u-00000002X2o-2U7W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:43:04 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-40905ae04e4so126674b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681779; x=1750286579; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PHi9Zj9Ui/Tog0J9ameekJ7BZTN9ebJ9txjTOhyyok=;
        b=qpQkDkQ2nGwVeoX2driqS1Y1RPdPjdT3QYissF9FisDgmDrxj+WCZaO9NbKtcEbd9n
         66NNBTa5xp1DK0XwoelTASV/9nPF2Jpg7MXfYvj9LKyJYCqXf+CrFDRGbMBQKfitirhr
         6PQMAH5A+Vst1jRebInYvwP3zEknDZGds6OpzM6iC7sCjmliLGHUdmoVOxhntblPfXMM
         pP0VjPFerKD1OXAq93A0gWbwGEnpMfvr59Pxqmk2slOoi7QQgbkYU/lXYWtO/OqOKXUc
         T28k5x5JdLU9ITUOm9Dvm4/tu64SmJE5xdilAHyhm4876Rh0Wu4pv3A0V8cuyUxUxFn5
         y8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681779; x=1750286579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PHi9Zj9Ui/Tog0J9ameekJ7BZTN9ebJ9txjTOhyyok=;
        b=Y+L8qF/+OKUJWSjLjt/hc7Oa/tzYKi/GMn3Htt05o/LeBOrEXb+Z5VVsNAFMpDAHVV
         6MFmxvlPq+5CIoM5IEFrUITUgWMZQqdkeUWfrJUEMJlQRL04lJ3iglmgfzPSIGQXeyV7
         2pwxm3Gsy2M00tBMbz3dqJeDkfDNHM9gBJzKYgQ8M3KLkvTLPrNno+YZ0L8jXpmqmvaJ
         vcDELAzzS1JTfJwffTCgTci08/sv0VX2O+2x5LPiI3c3yShLen04xwH8n46665NbNsuC
         o0Igmd7Gz8BbOd8mPC9xfKfepq5+z5Yu78l2FPP/qDhhRpGrkBRLdALUEvpNZAwXHoEn
         qJ1g==
X-Forwarded-Encrypted: i=1; AJvYcCU6AgXWOZ+x50KGOYBMKy3rsdFZorS3aQazbXI0Ncd6HvfsWmlrwRfJ6Y8RFq9dsvtE4dHy6Y0OGOGEo4zsE4fg@lists.infradead.org
X-Gm-Message-State: AOJu0YzidRzuRb/1BBd9ZnD/vAaPYFzdM/a4wjUGM9heERdXeqZ/wU+m
	q0MZcCZAjSClZePuDUeFkkEVdojZG0r2VEtGbpbkDy701ZScI1K/aYTQJF7VaC8GZHU=
X-Gm-Gg: ASbGncvXI4tmrdc4Bv/BE4wxiGgj5b7AuhRr10ITvfjAYBLjfoQWqHhtyB3QFvulqRw
	zQYW37eWD3j5fteCez6bfAL+mIkNrUfYaev3STNZxzRrBY9vwP5eI2GkCppGcAsZZqDNa24pYjm
	+Vgroen4kcBZ1YwWAV1ANTNAPtYYi0dvO8N8LL77jyvplrTESgqufizz7rwai8OF1qxhyKUwQyQ
	nlsO6tDsrCNALDkVLVWLvmAVwU6QIJi0gr5jNcsHiyYbDFY2NxHWwbHLy3EPQg06hwAX0X6uxZ2
	eyulxsN4TicJdJ8ZeQghOf543lk4f+1iEYz6qt2mGavIVKxl89f9vpaCXpVmzVxzvk6v
X-Google-Smtp-Source: AGHT+IHKzyRz68sxYKViKX8XxVgxmO81ZgT2dv14jVru2VvIasYx7regY5fkOkngJzDhuEAN/YPCrQ==
X-Received: by 2002:a05:6808:23c3:b0:408:e68d:975a with SMTP id 5614622812f47-40a5d16d77fmr3602477b6e.39.1749681779529;
        Wed, 11 Jun 2025 15:42:59 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:59 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:14 -0500
Subject: [PATCH 22/28] iio: magnetometer: af8133j: use = { } instead of
 memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-22-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=844; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=xfo+bLocNZ+ozgq43j0BzWHfY2nDbmMn7PxtgVZEL70=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgYWPB3M7jW6HKeyERo49D2SpKAeHri46eI38
 JoL31MTT0qJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoGFgAKCRDCzCAB/wGP
 wPxgB/4grQvzDDyOnubC62RgBYgnw4jtW3rdAB2FG1+1ydj+0Kc43YVQztNQF+icooBBlvW5j6N
 FW4PY0Jeb0BTh9RBuXKyG7mMFgvtMx2dCggSrx6hB5UNgMYZODfVp8yw6VONYvXU+buhtXgt4D5
 qL/YfV2XT8KRBLCxk4K8o1NYevnW1tnYG/R126JosvMtbVgCNw/Dbk+m7jsH2CsB8vsr8KKQ478
 5DeyGyUBFsSiEiiP5NsqpdPDx4vcHq+LZBr9Fw0hANxaUoTgY5IhgMrcEJHSqPr5+gW9TzxR2uX
 6JcYo6fVBZyMpzSdbUsTuPWPLE/Fi7MLc5KlUVIbd9h5rmxW
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_234303_025765_7D7E4C66 
X-CRM114-Status: GOOD (  11.95  )
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
 drivers/iio/magnetometer/af8133j.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/magnetometer/af8133j.c b/drivers/iio/magnetometer/af8133j.c
index 192ba2da94e299d9a223a33bf15f9d6e6c29f6c7..b1768c3aa8f33c6e95e770a27f55cb357e6ac6f4 100644
--- a/drivers/iio/magnetometer/af8133j.c
+++ b/drivers/iio/magnetometer/af8133j.c
@@ -361,11 +361,9 @@ static irqreturn_t af8133j_trigger_handler(int irq, void *p)
 	struct {
 		__le16 values[3];
 		aligned_s64 timestamp;
-	} sample;
+	} sample = { };
 	int ret;
 
-	memset(&sample, 0, sizeof(sample));
-
 	ret = af8133j_read_measurement(data, sample.values);
 	if (ret)
 		goto out_done;

-- 
2.43.0


