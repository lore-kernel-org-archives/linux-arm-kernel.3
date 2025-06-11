Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E18C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 23:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlnZuUqEMiDPyoPu1uidt8DikGLHmN/8IAgm5AlJwiI=; b=g2Ga2ooyG7re+t0y79LL+H1I/Y
	LshRdCkddL+nOTLG2kdnUmlEPRCsSnOpcuyUt8xRB/My+roXbDB4dcy0YfucrrB1KDets3i9EYpUD
	xJHMVADCkmE6Esi/DmS3142zYZrBhw/oRsucLvnubCVwgM/8Qg9ps0pmAXGHTYQUaB7lpIl+Ul1vn
	YnqdwhP91m88o3ViVm2dBhk8sPySJeQIvzq08FiSMt7qsfsFxNsyTJuedrLJoKE2uklWHsPhDTqyc
	Zv7qfIYMLGlVbdcUs7gxsn6++IBkEfc9y9B9E8r70SPH0BBff8uolehvQhenaxK5bnqD8i3ptdLb1
	HazS7fMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVKU-0000000BjcG-1tpr;
	Wed, 11 Jun 2025 23:58:02 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9v-0000000BVmg-2RYO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:43:04 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-4067b7d7e52so92999b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681783; x=1750286583; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XlnZuUqEMiDPyoPu1uidt8DikGLHmN/8IAgm5AlJwiI=;
        b=h17+jNScjLzaZIHw6XPujfmByLsq0PzNyxwQrcVBhmvPpDaYOA0SzwLD9HdUh7EWOv
         ze/7MH9HmEcwN4gKNovHcxi5+2969nS+Cg9Gdutgu+ot9wDuvT1LHpFJ4ZGuWaeZGxEn
         Bj9R+hhOpQMpU/Sy+I1aL4DpjfNU4qOj6Q9tweg4C0INic9j3t8iEM6QpGMLcMJCDzCd
         CTx1hNE9aHv6mc6xmLAOBQA2o2xvA8hqOIxAS4ASIWy6PAi4/JPL//SOdu8hksf6mEUp
         odEWxhziCF2o+Gv3LDflnyugsQNKYnDixk/cHt+32Gd9eEZFEu2jDPp/PV/d3DBAjqUf
         tGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681783; x=1750286583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlnZuUqEMiDPyoPu1uidt8DikGLHmN/8IAgm5AlJwiI=;
        b=nGjZtJllHrLiLa2CrBxm55SzJpaqQgi7Xn4s1KTaR/y56SgqhpOpIDV1ZG8wcfmB+F
         ZSyIzUvSCGMBz/Pc+EC8RJeeTSS2SG5kQTUa/IJd1rIHIdObCI65lNzjD4CisWePg7v9
         8GJTx67fB4UvdmgPwqgX/KCIWxL15X+pjkx2nTP+zDaP3Al7lwWsvzqMBudiRY+kD00M
         CS9ko7Z6dPhe2l1Fll1QOO5aZAw95ENXQMBz6SYszStBr3h+wrPZfzKnenrWT53co3cq
         7FTm+1CP8ilnfGKq5JinLGAOFFLHh8nbHRdyUxKVcTHWc/YH78Y/bSNixmM/5e7FeSZ6
         kfCg==
X-Forwarded-Encrypted: i=1; AJvYcCVIZ7eiJb69rRWUQy8ATc/z8DhijCCQcgplTYtnBktMLOcwQvvvCQWIv7Em2lYqzMM+ecQUD1fzq/e4hjzrmhY7@lists.infradead.org
X-Gm-Message-State: AOJu0YzH4cb2T1UBgFXGShAB43xb1LOoQV/bH/s/wLkmH6sk9EGOJzPf
	R/IuqkaVNt8AWox+zUu9aA0fEvmcHXrb61pUFbPY/AjFWuAbKEltRJTGvePHP70jgQw=
X-Gm-Gg: ASbGncuBQT1LpBbBqlWyYoDvxKokM+zplLxKTS13wxZxKcQd8or+JHqzN1CAQ1Gocpq
	X0yyCoMUldfFY/N0BjMavfYoptiDD3UHrKf2Pxgzs8sF5JQXQlZEtS+sM2oTDKi61FuuLHfX9D5
	YHSKRs+CBAaIL+QL+26yV7Z+qFR8l8G8GsIxSS+Edej0T4m5GjGPXqgUC1gcrA1auGxZd5XuzVj
	XnfEvB9faMuYF3Su0IEMEOeH60ag6qX1nEoUb9tcVv4vINTx/urMmV7vz85TK38n9tJ2LwDxq4i
	lCmNBH9CsVHVOSJ9J9KmMFPE22lwDiydkoG+2rkZCnUGDU1umq1uKPltZSmqeVb4am+P8PGttoL
	OD8k=
X-Google-Smtp-Source: AGHT+IHanymhU6haQwMX08UaVWjgDuhrBJkJnuAw0FtFP5FomR3rskOHKaWp159bL/od+P/uW3UjAQ==
X-Received: by 2002:a05:6808:2388:b0:3f9:4f55:a002 with SMTP id 5614622812f47-40a65fd343amr919002b6e.12.1749681782819;
        Wed, 11 Jun 2025 15:43:02 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:43:02 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:16 -0500
Subject: [PATCH 24/28] iio: pressure: mpl3115: use = { } instead of
 memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-24-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=F7t+iKhqynKqsGA0Dj6cleYDfnxlvUihp6+d7Cd3LFc=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgYkRI+gTkzxZcqPjcDI24PviRY3280AM10XW
 Soj9nQ54b+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoGJAAKCRDCzCAB/wGP
 wJavB/49bwHnqdL6jGGKc0R+tNBC8oWNqAgzFcpqGTNVFp+z2yNK0M3aP1hqPHGL2QBr2TA2lr3
 eaNmz5m1EZlIb1/czf8EL21m6pLnB/38XHfTEkuUfIR69m6fw3BS3Fc7dMyIcsr8vdRdjMxUgEx
 amFPpQ4mKamDXx1TLLaF0FtED8EH22FcU0HwsL98z1KR/0+4fZ6CTqvl2MRVikEAFvjbQdfenTc
 pegbUCdP51Apv3/KFpJJk3XTP46eI1vJ9vHFWabzWZyk42ooaanCWQC61vYb2d1I3+Qq7771tUx
 7nB5lSZddiuam+AwBUXxlh+iq8FqViKV9rtz43g/ULV3QsZ0
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154303_651347_F7E0C72E 
X-CRM114-Status: GOOD (  13.69  )
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
 drivers/iio/pressure/mpl3115.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/pressure/mpl3115.c b/drivers/iio/pressure/mpl3115.c
index d6715997f13727e22346a76819cb7dc58a96614e..579da60ef441482a82f3bdf4f67436a13ab3e09d 100644
--- a/drivers/iio/pressure/mpl3115.c
+++ b/drivers/iio/pressure/mpl3115.c
@@ -160,7 +160,7 @@ static irqreturn_t mpl3115_trigger_handler(int irq, void *p)
 	 * of the buffer may be either 16 or 32-bits.  As such we cannot
 	 * use a simple structure definition to express this data layout.
 	 */
-	u8 buffer[16] __aligned(8);
+	u8 buffer[16] __aligned(8) = { };
 	int ret, pos = 0;
 
 	mutex_lock(&data->lock);
@@ -170,7 +170,6 @@ static irqreturn_t mpl3115_trigger_handler(int irq, void *p)
 		goto done;
 	}
 
-	memset(buffer, 0, sizeof(buffer));
 	if (test_bit(0, indio_dev->active_scan_mask)) {
 		ret = i2c_smbus_read_i2c_block_data(data->client,
 			MPL3115_OUT_PRESS, 3, &buffer[pos]);

-- 
2.43.0


