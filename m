Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78056E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 12:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GzI6ojaHRtxqwhRF3SUc2EWRLaNMTnv2fcL6TjkwiHI=; b=1mt93En7FHnsCJlzJAGSqZDakQ
	oCZum0pkQ0F3Obiy7YBso+I4mKx9muA01OKCQ4eMP03/BsJK9YsHueQcFbGVWooynNO+bZUWLyOAv
	l9iGGgorCNKvT98Fr8MtsBxyXMYS48vUFqneKq5ybHr6c9Bma7tfYh0F2ViFIDOyrtDrDvNLJL79J
	pVxrRmZ0G9E1sR7mHqyCRCQ1pR/mt01PbEbab1an0HbLUF+zAKEAtlfKMMefxeqrD3TiGd3JF9pQk
	CCCvVGDkQ87DZtuHqRXo4H0GveCxPwcIKuVkpHdA4ILpVpvCf/HjvMqx2pIre53SV9FyhJ1bKjJF7
	dPQwKF2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKz6r-0000000BOqr-0SkQ;
	Tue, 10 Dec 2024 12:13:01 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKz5C-0000000BOXU-1t4s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 12:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733832670; x=1734437470; i=wahrenst@gmx.net;
	bh=GzI6ojaHRtxqwhRF3SUc2EWRLaNMTnv2fcL6TjkwiHI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RshNwLsn44/ehDqRQo/F+yQKl8Hhf2l5O/Mwjxag+yehwT/2UKYm2NC+uZDmowRu
	 mreJwEy9XpLfEOvyoAKFAUJO7phFXpZy+WQqsLW/kYm7VIlCNHhM6mYcwuaxg0QdZ
	 /Ue9zrAgZz9qhilggECWYwZ4f2mvP3n4Pt8rcgMbXyFRdhT5CVJDMHgVpLlHSw4F3
	 /uX4ve/tjXslRZmikqRWWhPchxb4XvcCM213k2uiQSaiIemY1uo6MUGAW15EnagSF
	 0KxwqikvdU4Focqy12UYz86jTYuDEiKzJGH7JiY3jhsnLJxZ51SSIos9vz0THkDpa
	 EFv8+c+1aM8bERBhZA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwwZd-1tX1FN2aM7-012AJR; Tue, 10
 Dec 2024 13:11:10 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Mark Brown <broonie@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH V2] spi: mxs: support effective_speed_hz
Date: Tue, 10 Dec 2024 13:11:05 +0100
Message-Id: <20241210121105.5314-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:inUN7R817bgJ5FVj1Azb7aI2HnZq6RxaKGD63Uv7UkmN4vKpXV+
 roFsgS5xxM0krRqVdlVLN52y7LAUQyjOl3XaYlzFUst3zWrRnfOcI7ge/dfJ/pzY9f6lpT4
 1BeMhZkwxmO8ipMqJrgBFrp69/S3aGTVxrOmEqBwaKC8e85DW6BtDct8c9zPqraRGZh+ZEc
 yY+wogUQPp3U1EDopZ+5g==
UI-OutboundReport: notjunk:1;M01:P0:fvwzoULYPCo=;2mwIPDWLPY8uKxrhfgq8PdGQn3n
 E9i/NtV90B2/y86Pa/IiXgJxBYiivYOGqGnUUU3OGXS4vMj0kzcJeMAcrt79O7JNTeA39ZRR6
 LA4yXQI9BrR0/v3XhJcIStOdmPIihkf0zCvXn4zHizoPAIE7rDzoMPhn9IEyDwNYRuWkQ0YrL
 JzKVoIGL2PYfpV6Pxclok4KQ8wdNcOQUXDstncJ4YHzrHp8kwiPZYB7T/qQ67c8GiVD4jEo2M
 X+KPGve+fDkD+3MG1F4OWhDekes6HIV+wFAKyQjmhXPwhaQl0yhIBrO87FqOJnMcvYepUT6Qi
 qaJ+WHW3lmiTbl6WzQUO+OpAQyVvwjMI3K0v/p2FLIKLtdgcdDZvPB++v/PDI8lYW55aIuetc
 ++v0mVeokCXxTFUK7SMfxwRJ08reGF5TXEnAoRA0MQb+VS0eQUk5A09XzLYXi93HgokaOivdn
 /uNX8WMnWFD+Qtq7fmMZ3EDIqy4Gr9xMJ7V2zhA0JZooXlSJngnDIh4ENdr1Ryv5yR1zhpttt
 5hggLMuJ6u5pR9KnUVCl4Kx/FyyuzEdvFMJL7nxKNXeW0yU8lq6pciGWCbV1Zuojw/a+9BLHT
 Lqo24pvbqQYuVqDe34jFnAPyFQQS6LGYeZ6X4EAjtLqd/uNaV2vO6jgxAD49ofFrCbXSJ4j8G
 4ivTx4gTfSFm1EciIi+VujzfXcbZ48j7wG7KhmK1F8zukXka6XhvzxehH6oeoHPY9P+o+kMls
 wWNdSaEkNNJu5eYXAHhx/Ed9USQwRfHXTrmf6NmBJbYcFNZSJJK/xmb8KJDS0UEz9EpBnExaY
 uNNK0LJfbJSnViW7GA5e+3eDiFC2DrgCrlwigNAXqzaPWpquvy9PKqEf+4C4NHzFOnGJtlNDz
 YhogWdAzRQ1HEC2HdVlveYZrnvCDIDSd1XDNWc7NFk8LqHVqSTixW+9YpkgYycPxYwPyUxX6h
 G1UAQxqD76HV+9HJs6B1aBEO9wysk1vmJsObS5LSvYAQAEoJwG+N6qOghqawceLSEeUhy0d1Q
 6avn6Ej7fYdcv8r6cJzLqA2ZpGiX/OQ9BwJORlkAiFhPEFQWpyzUX9WKuLULkiuEr8jB0w82f
 jeLP+fRdEf6H250LiCgh3BFBb1OYoK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_041118_847043_C958E4FD 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

Set spi_transfer->effective_speed_hz in transfer_one_message so that
SPI client driver can use it.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
=2D--
 drivers/spi/spi-mxs.c | 2 ++
 1 file changed, 2 insertions(+)

Changes in V2:
- fix grammar in patch description
- add Frank's Reviewed-by

diff --git a/drivers/spi/spi-mxs.c b/drivers/spi/spi-mxs.c
index e6d955d964f4..43455305fdf4 100644
=2D-- a/drivers/spi/spi-mxs.c
+++ b/drivers/spi/spi-mxs.c
@@ -381,6 +381,8 @@ static int mxs_spi_transfer_one(struct spi_controller =
*host,
 		if (status)
 			break;

+		t->effective_speed_hz =3D ssp->clk_rate;
+
 		/* De-assert on last transfer, inverted by cs_change flag */
 		flag =3D (&t->transfer_list =3D=3D m->transfers.prev) ^ t->cs_change ?
 		       TXRX_DEASSERT_CS : 0;
=2D-
2.34.1


