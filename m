Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5C4C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 02:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiF2DulFgRfRNMjiDxreAgm5rKmLlr34bZCxk6U0CK4=; b=oDQKQMc67o7Lm3IYEPROwdNI+7
	p7QBxMBG7/jvwIYQJ7Rxsrro3PEhx6XBNqblYPuw/5xUploYX5mI7E7+RLMkuFdAh3W5aGa9qir58
	06YNrxl1aBXG5oDdECBCG5U754nZ7RFxVW2dw+gUi2Al5fc8SIYXzTTt3louWgTuy2YB8D2uPsMFI
	+83/2LVxBTEK7aH668tyWQD1Xc083FdaWyTnYWqijHsiQz0XBDwjItrvJ8yHEFB2VfetyrCygz146
	KLjEAScBcMoi58GVzilI/on5CpCCk7py68yV80wrF0BI+u5/262okWuL8PCNr1mreCtfjb8/5T8qA
	mVU5Db4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXq5-0000000BzBz-3KDw;
	Thu, 12 Jun 2025 02:38:49 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9f-0000000BVay-0zb2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:48 +0000
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-408d14c7ebeso206893b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681766; x=1750286566; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiF2DulFgRfRNMjiDxreAgm5rKmLlr34bZCxk6U0CK4=;
        b=BB/oli3idsNzvPUmElI7XYXzyQd4PL4ptTm+w0bTMkiSpuHvLBNJrUKozFhuqHK4Jb
         QsoFJHsnafmxor5PJbZqaVpNLYfVa2ehOwbo5i5+P2/h6q4kfN6NVRyL3wZiB0xuIxu3
         H3e/KpHvOmO7V0iBwbkvEMbUrADp/0ahn8ojSKJOl5oZuwxFxOTFuB87XWS1yNgbsumT
         TM83AJg7/t/lOfhbqdc86Hl9IkuQXzZHCS+Pvl6dEoFLfbrf0mD7ArP4Wfz8kY7Vbr+g
         ekH0ojtWgapnmdw1uA1SCc62LMyQnrd35q+OQlxwtcD+KslWEsnAFt16VGZruf4TF+Ac
         ErZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681766; x=1750286566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LiF2DulFgRfRNMjiDxreAgm5rKmLlr34bZCxk6U0CK4=;
        b=jr1BaF0Ba2GqkLK47D0qMrJv3sDsrzhlP0HNGZm8btP1hiKZSHYNPFnlnnQI5ZKEtp
         N5ypW/2T58XUVcX21HuADBVO0AZMP14cS21UO2Pchk7LQ/f33CBC4rJYS7BJ2mB92W67
         xSyGI5zUnBbTMcIgkPmrSh48vvn0uNLc5QSRWIVkeghxGdRjXemcuDORUtvvwV+54oEN
         F+gBhdJpmInl7WTZppx30SOXIjnwRC3Dw4dzgw5TNqyOPGk6IY6JYAgT6KCKBeet6X18
         0DL135dmg7qRoavmscmPY4YIv6KRcJgCIw/6pkyuvtO+0/+Yt/QoQuXPY+lgs80UTiQn
         0yLA==
X-Forwarded-Encrypted: i=1; AJvYcCVytUK1Gj0OTBIMxxd063TrdQZtLgxM4ajDyCIlLwEHEcB1Hcpqw2vB/iKZ1BRI7Y0IXXaxcrfjzIiRks9SrDd8@lists.infradead.org
X-Gm-Message-State: AOJu0YzyISt5Nlu0frzarR4FPxRi2agXVakc2wkzD0LAdAMp6NHPLztw
	Bbiho+ooJo3d2eMwVI3zayL63sXTGGZGmzCsRo1OH5dPv2yA7drH/tkIx1jT7NrjNNM=
X-Gm-Gg: ASbGnctB0EDN1Va37AQENqqxjkTKKgHB/SZWmbbFg6yZP43R8dGKiT2lKDfD30XGHtH
	vg3AE3cEUCyhb1WacetxZT+dHyI7BL0sSha0O55w0+XJAjs4faO2EyOAAR3vvY3FghQZa+xw03u
	cUZZ79HIbOYJs6F+4T3Fi1c+HfGo8EqTspcGwNMfRazxeLKBvg7hxh1e1+mmbxFf0U5NxyuthhC
	BqqXg94NP/KZGJIKjheUiVByNKvLym4XLAOjfKaxPS4PSW+n3fVYGt1wp1mS953Qsvi8QjlyZs4
	k2tWU4W2Njlg966JrFIb4GYbdLfKE5Iufk4BvJ+d16OPktt3mXSIThTAp3jcEQr4b95jRBhi65L
	Q92w=
X-Google-Smtp-Source: AGHT+IGZSFpZmGlN0w2Un5vLT2W24kqk9q0DeivfstNV8sNtHQdO7UhGZijU6igQSf2A4dpARH8gnw==
X-Received: by 2002:a05:6808:3086:b0:403:3814:b2b1 with SMTP id 5614622812f47-40a5d081c0emr3858130b6e.10.1749681766169;
        Wed, 11 Jun 2025 15:42:46 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:45 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:07 -0500
Subject: [PATCH 15/28] iio: dac: ad3552r: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-15-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=915; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=UJXbN0f/Sc264QMDW6dBftvYOYfvz10QBoW4bFVFUX4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXmmJnXqBUX52BnBQ8vdrjyxdthhoLPWdbRL
 R+WVVgUfXeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoF5gAKCRDCzCAB/wGP
 wAHpB/9uvsuwsxPRCNHjRwNuY0qyeu9AO2EJoyNvSVzZWpvJJXh6el4lDtmSOYf7BNiSzxoL7GH
 ZA9fAXagxB/cnJd0lWxqHu6IllSBT9tS7KDugmBh+2loJ450FcplnrPuRlzFJx5QRs7XWieNUFB
 MXxCk/XXt6zIf+oAV23jZWywwUtyAzZ6IAh9PIHNdcMrm/xyZ/gKGv3UMTkLdL5rp5SJBwxh4cc
 00NEmMDVhDI8758T0v6AVJa5hRW1epfYSYXca9HF6od0VNpE0B2edgAefLgFuwdtJeZH/7Ms8qJ
 Qcdf79QFtQZEJjej/ETfZd9QxjJxo8qX5fR8v+r3taHVCkrk
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154247_281223_DFA5B198 
X-CRM114-Status: GOOD (  13.27  )
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
 drivers/iio/dac/ad3552r.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/dac/ad3552r.c b/drivers/iio/dac/ad3552r.c
index a44b163f318315cec179aa2ac9d66883a327ebb9..93c33bc3e1be438c2e10c1ca990d8046ba87c9d0 100644
--- a/drivers/iio/dac/ad3552r.c
+++ b/drivers/iio/dac/ad3552r.c
@@ -293,10 +293,9 @@ static irqreturn_t ad3552r_trigger_handler(int irq, void *p)
 	struct iio_buffer *buf = indio_dev->buffer;
 	struct ad3552r_desc *dac = iio_priv(indio_dev);
 	/* Maximum size of a scan */
-	u8 buff[AD3552R_MAX_CH * AD3552R_MAX_REG_SIZE];
+	u8 buff[AD3552R_MAX_CH * AD3552R_MAX_REG_SIZE] = { };
 	int err;
 
-	memset(buff, 0, sizeof(buff));
 	err = iio_pop_from_buffer(buf, buff);
 	if (err)
 		goto end;

-- 
2.43.0


