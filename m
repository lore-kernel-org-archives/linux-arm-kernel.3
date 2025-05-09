Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E71C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sP8BenM70fg9+z8SyPiPBxWFk7VOIZwekGT+V/qP82I=; b=PxrTNEJbZRBTcd7sqV/jNRtJcl
	0ZYo8/QSfglZ4kcqYDpZ240g27x22cDxJC7cxAPCozl/SXqHRUiLqtnU8VkZyvqHtaoDGVFZWhSaK
	ruaQaGsaku/3v0/zbDIbMiLmCP0mygExJQcaYU5lukDqrcMFqu9HdQZx1sf6KBz1CIzTbuzh/C3Qo
	O0tYGO//PL2yugVvjF58gdr4std2NXTzmX4vQuHQ6isArM1+oiYgg+5m2r3Zfaa/cnvIfkmATPeTS
	wd3o0t1t6ZykPq4WmM4IqKGsMbYjn/OQY/nozSBJimtcTEttVDcwvdMz6PI//LZNIPo0jJzmj3CEQ
	cgrVFRfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLHh-00000003L9G-0UKm;
	Fri, 09 May 2025 10:48:53 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKdD-00000003Cgs-2br0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 10:07:06 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 5E851C405A46;
	Fri,  9 May 2025 12:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 5E851C405A46
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Martin Kepplinger <martink@posteo.de>
Cc: Purism Kernel Team <kernel@puri.sm>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] Enable MIPI filtering by DT on i.MX8M*
Date: Fri, 09 May 2025 12:07:01 +0200
Message-ID: <m3h61u9jy2.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_030703_815796_85D65D81 
X-CRM114-Status: UNSURE (   4.97  )
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

In addition to raw image data, certain MIPI sensors send additional
information like NULL packets or "embedded 8-bit non-image data".
Without DT (data type) filtering, these packets end up in the frame
buffer, corrupting it.

Tested on i.MX8MP with IMX290 sensor.

Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/pla=
tform/nxp/imx-mipi-csis.c
index 29523bb84d95..d53a4262b63d 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -654,8 +654,7 @@ static void mipi_csis_set_params(struct mipi_csis_devic=
e *csis,
 	val =3D mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
 	val &=3D ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
 	val |=3D (lanes - 1) << MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET;
-	if (csis->info->version =3D=3D MIPI_CSIS_V3_3)
-		val |=3D MIPI_CSIS_CMN_CTRL_INTER_MODE;
+	val |=3D MIPI_CSIS_CMN_CTRL_INTER_MODE; /* enable filtering by DT */
 	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val);
=20
 	__mipi_csis_set_format(csis, format, csis_fmt);

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

