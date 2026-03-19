Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C623B108E1F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 11:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w3fIGi3nO3mbAcAspJa31NZf3Lp/D1S+4Ye959hPyNw=; b=wZQEEQ72w0+4k0rLYGYOm9uQA5
	AZ3ItczgYnOGRHHTVecPIyvkFsBiPe5EvDJr6MH7J82WAKYEqs556qvpi0inNzRcXH3uTCfyxge6T
	WTAKY51pOijRzDJrG0/r0yjuKiVvq9ogZMK6hJeImX7ioTWD9Uv8qCAB8ydZ/9JtjMj2E2O9Z9RpW
	ZL3eVeJUNDDQ+HvCDV9vvh2Q+4Xx4fallTnJlfMJQnr7EFRu85f7LqrsEAv+Db0q0g7tCb0oVQfer
	Kxt9bBsiugWboBJlSLNg6vF5efI8uSG3e7qyrP/IlDqIKsJ46ukUgPxMUYyOPHpf0xKFi6sJzRPvh
	ViPUAMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Bp2-0000000AZ6R-13Wi;
	Thu, 19 Mar 2026 11:45:52 +0000
Received: from [195.187.100.5] (helo=ni.piap.pl)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Boz-0000000AZ5h-0cJy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 11:45:51 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 10210C3EEAC9;
	Thu, 19 Mar 2026 12:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 10210C3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: i.MX8MP: Fix HDMI LCDIF FIFO underruns
Date: Thu, 19 Mar 2026 12:45:40 +0100
Message-ID: <m3ms04caaj.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_044549_364539_013C6FEB 
X-CRM114-Status: UNSURE (   5.47  )
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

Running (and terminating) Weston on i.MX8MP sometimes produced black
or grey screens. The LCDIF3 INT_STATUS_D0 register showed a FIFO underrun:

32FC6024: 1000002

The PANIC0_THRES register was set to:

32FC6238:  AA0154

which apparently meant low =3D 2736 bytes (0xAA * 16 + 16), high =3D 5456 b=
ytes
(0x154 * 16 + 16).

With this patch (based on NXP's driver) the watermarks are only 16 bytes
higher (register values increased by 1) and the underruns are gone.

Tested on Solidrun Hummingboard Mate with a 1080p60 HDMI display.

Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -353,8 +353,8 @@ static void lcdif_enable_controller(struct lcdif_drm_pr=
ivate *lcdif)
 	u32 reg;
=20
 	/* Set FIFO Panic watermarks, low 1/3, high 2/3 . */
-	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 * PANIC0_THRES_MAX / 3) |
-	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 * PANIC0_THRES_MAX / 3),
+	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, DIV_ROUND_UP(1 * PANIC0_THRES_MA=
X, 3)) |
+	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, DIV_ROUND_UP(2 * PANIC0_THRES_M=
AX, 3)),
 	       lcdif->base + LCDC_V8_PANIC0_THRES);
=20
 	/*

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

