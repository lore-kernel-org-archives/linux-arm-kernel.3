Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D484C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urgZo6HtwVajmJ+VMQkmSQjRZHquFbKRUH55wzxTQsc=; b=GNNp1gvZLgAi0xGwJQBpwTFKaz
	A8SNbIjknNlj6/ZsNsaObXA6oLYt8gvE4abpnRyw+T4WValSh0PkiSXoHP/Dhfumlky6F9R0zEAGw
	ab4BtoAVMHxhIZj/NYJqL0FmS2lMX0ME9QK5HCyOEKOY/W0GSCSK+P77LrBSjezKLU9v/bFgCQCC2
	109VrI32f6/qINEd0fbtkclGQfQ3xiGN3N5rIIez8Jk9AYZy8oC0coqWnzG3jTdObGX9wRgWcRxUx
	zqfmsfH0xH58N+0bACWUzNuu0Tcd084Ki6x2ZZSA+9aTILuHLeM6EmvdMrBJZdu1J7M2LKTp76vgi
	p7nlFyoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Scb-0000000DlPA-1hPk;
	Thu, 17 Apr 2025 17:01:53 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SUg-0000000Djga-26k1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 16:53:43 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-60297d7ab47so529672eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 09:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744908817; x=1745513617; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urgZo6HtwVajmJ+VMQkmSQjRZHquFbKRUH55wzxTQsc=;
        b=U2Wsei9o7PXrU41O7wv2NOsV10WLfmKDfsmJe1K2el0aBxf9CqCN43ce2OiZRdKq1Y
         5iTMmvmerGRVVh74UH/JcEX2mhbj8CKDOhRjuaZQ4TPEIxVOO88NX9n0dnppivbDQGjd
         JQiBM8BMGYKESKRxCmn0xRwWP/bi6noiDn/SC49AORELvvLnAeQjEloCkLkfk252ro4P
         zoyzCDJ2Acq4rzU7b/hMhSA3oUHcuj7F18wOyeqQsCgHZQAEVO8aOsP1ide5EciJ4EUw
         +y0BO5rmAthzHZCIn5zJV5MxxQlGoQeV4bYLSUBTEtHB4ZAnc+mAT8l7Rpxhfn6okHIx
         MVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908817; x=1745513617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urgZo6HtwVajmJ+VMQkmSQjRZHquFbKRUH55wzxTQsc=;
        b=ktIxpYOJJxfiSnH3tmgz6PyXZepmB4Fa5wLEYqxqex8zaNAkmDd/skhoL5CCGjlVNe
         pPcvgs0eITK8vspOdxs2wJCnwWBs0IRKza4VKolPU9RyiOWk1rjTkA86VKVf4VRMrK4u
         t7UsR32gViOAk4CaIBWpi6j0SA2xyZlnfJABin2lAi/cYLwpRsm3RHcGNQOcCsGttOiP
         45VoIxKMM3dg3Z4HVWmn0cKo1OSLsj4/i1+fZlNTTQhJxmviYpIekVuN6Y5y9cqlU9re
         o2IiYyUu2Nf7ibNX3QJBzIGvsxUDoQlGlNaX1IPdq7xgVwPlMKqrCuyJisczS0PpSjJ8
         jQkg==
X-Forwarded-Encrypted: i=1; AJvYcCUSZ0PuzzOjVPBuLScgGkxaeZE+WzAqs6RYFdcqXmF4y8oYDg3on42rXErHUGVHI2RLagUvHUQ+xAXZ+yBC6LcD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6DwTHqzzQHukmB8I14eizZoM8vsgUJj0639ppMGQOMWWxTYji
	wenTKqivE2Bb0MDN1di7QyrlM6Y2rT35LIlVqxtMYo20wfUm7B0XtYy68DXvH2A=
X-Gm-Gg: ASbGncuStMbftolT5M9XQXoPI8Jb5fmrL2RZaANRweoIHbdjFdhG+LNmr9Gz4w8YMdz
	LM0C88YVgMYof2VIVwNCAbMEBVdIxD+nFya2yvoNS9ugCGaxbnzZOC49jpBoo56+JqP3oiUwYFe
	AymsQOjruNbkwowQWi251NDPyJ7GdAWV4H5xFf6zyZyxsOSaFcgE1YtdHAzL3H9CnzGEvQ7SvUe
	iRPjxqoo3zd2jdQk4leuwNn73deXZIg2S5smApq6oW4It4sAlbgcJgzWuvvuG2fJE/C4a+HUmcy
	R3u68z7fOnqm75sJA/Drdf4BZDUsy1qnyhwRQ+KofSc+XvQ=
X-Google-Smtp-Source: AGHT+IHBMalnX/GkmDtCv+f1x7qh5UNts/SZQEVLrZNpUXQl72Kd/ilm5X3OIBmpcIcTGM/GMMDEDA==
X-Received: by 2002:a05:6870:4f88:b0:2d0:4a2c:7be6 with SMTP id 586e51a60fabf-2d4d2d3b3c9mr4250599fac.30.1744908817353;
        Thu, 17 Apr 2025 09:53:37 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm15812fac.47.2025.04.17.09.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:53:35 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 17 Apr 2025 11:52:33 -0500
Subject: [PATCH 1/8] iio: adc: dln2-adc: use aligned_s64 for timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-iio-more-timestamp-alignment-v1-1-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Tomasz Duszynski <tduszyns@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=873; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=3GHpd6dz9Xc3JIqdZ4xpPWZT/4sI8qxCKSwerXxcldo=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoATHapmPoJGvzEiuALVzGsh9ToDLFxuW4TbQ5R
 7lBYAYqMbOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAEx2gAKCRDCzCAB/wGP
 wOT6CACeVDDKfDNuZTZfOKiNnIAEqMI+pxNQ8ap3qk+HKIbWt6YPw0yt3LkJQCHeOlxwqIgeHsa
 inouAIcp1tkzHBI52RUlHaYGuAjT4mOuwX1xy+jtlqm9HMdv3C6noj2PS4Bq15vHyw6a3uW0oeF
 4H+p2/XpeenenXw2Euxv2/O5lWq3DYipfml0HFQqksM1YrWKVypQyZfdvo0u3d2AlxyWycSPe4n
 RET1aMX1SB6MTVEiOjzHoiwMJZUuLU1jQuOQ2ByivQ2sgtWhZS8K5jdFoK3aKGZoHCIWj7Hc25s
 EEH/9/vc5VVzuUXZM2GyUsQdjFzpmuouco4AsTHhf8uBlBYe
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_095342_534297_85BDC9C4 
X-CRM114-Status: GOOD (  11.46  )
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

Follow the pattern of other drivers and use aligned_s64 for the
timestamp. This will ensure the struct itself it also 8-byte aligned.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/dln2-adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/dln2-adc.c b/drivers/iio/adc/dln2-adc.c
index a1e48a756a7b519105393f77c4aebde1f2f85d50..359e26e3f5bcfe16d723f621bdfc01df2dfcf6a9 100644
--- a/drivers/iio/adc/dln2-adc.c
+++ b/drivers/iio/adc/dln2-adc.c
@@ -466,7 +466,7 @@ static irqreturn_t dln2_adc_trigger_h(int irq, void *p)
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct {
 		__le16 values[DLN2_ADC_MAX_CHANNELS];
-		int64_t timestamp_space;
+		aligned_s64 timestamp_space;
 	} data;
 	struct dln2_adc_get_all_vals dev_data;
 	struct dln2_adc *dln2 = iio_priv(indio_dev);

-- 
2.43.0


