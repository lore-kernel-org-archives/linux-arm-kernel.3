Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBC1D609D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 18:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5X020FpAKTZsCa95q5LWg2apUbkwZjMVGYaH/Bo+Eg=; b=bLOZHxAxlTRh0kSKs0Mf2R9VPt
	8CnC6mvRv9hyBUih99bbVaylGSzoEm0Nr93OvJfoI3tGB2Vd5ptARWWYPwokm00iH7T44ogCokebr
	iK9ves6rhsN8W8DFl2VElor5BCrrqgirHeGFd5mvNDXbihRRnyM8P7bkk30wB9XAOk3YniXruKjG0
	i0XrW/JpDAYMmV9l0x2WnIJC4y5kN2t9erC5Ma8q/7U0LCzwSWQd4PuZTI7qZItY9RM+r9xStPPQO
	aSTPHKMFJPodsoO7LOyphxNVAepacU4Cvyw2/kSi959LUqQtIn8SVPxNLB4QdIc+WK326T4FW4AIw
	0Cn6XbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLj-00000005evA-1Vf3;
	Tue, 16 Dec 2025 18:00:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLg-00000005erA-43P7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 16 Dec 2025 18:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=A5X020FpAKTZsCa95q5LWg2apUbkwZjMVGYaH/Bo+Eg=; b=fFfA3/RVTxjt4k+HT239a4nOCH
	6Y+W3mE0DzVV3R7BiXpdsOFGu9gcG6qdO+YfqBF9I8fq+BtHIxBkAb1Wv5oVsygAzgZI0ggeTCYAk
	W1KnWEcb270E+ygfTC3ntG7n/fOomLNXk01600TzQsz3n6SCsS3DThxGq5npnMO+uQH/86KegR5Sv
	Yfolajdhle1peJWUJPYdpbK91zOxvPoxpDP9ryBpNuHCq5sUqGJEfLSHIXKcOMTFgdyN9jH1hGnSb
	l4yMoOaz1s5pgMes2PkagLTKOZhD4x9VaOV1/BLI2TRKOkagFyWu9cnf5UwKaQIiUl9ReQ7SbM74h
	MTfAKsYQ==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYUA-00000005Jkp-38Yx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 17:05:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CBA9FC1A585;
	Tue, 16 Dec 2025 18:00:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 478E56071C;
	Tue, 16 Dec 2025 18:00:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA225119A97ED;
	Tue, 16 Dec 2025 19:00:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908027; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A5X020FpAKTZsCa95q5LWg2apUbkwZjMVGYaH/Bo+Eg=;
	b=NygTx0D997iRzxX4qtg+VZtGBkAX4ReGEGGEaLIiiNKTHs3Vzk3M89rT7rbc0rJnJ1Dmj1
	52rUcQrPv1rOm7GPIOWBKd4pI0B9DDyKnOlKEBe90WxCmv2qI0Zf+SUIIj1sA4YEikR7mD
	ecNCEArXJbpCFtuEjPjEdlr9gOg+UBXCAMj0DcCoA1zro7RcF1TQBGrodtbrtoxDi6qfTo
	akNHRTJiRcgTqIiIElILj8M1X1+p4mY8YXgtWbG39sQFbfwG7YNDZFPfHuKvCtuIGYdd3C
	esQfeoLQ6zolJKA5r7nRKY7TJJ9lkR3SvqcQ3D98X/ascf4Y34QJb7BEuZvWKw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:47 +0100
Subject: [PATCH v3 14/22] drm/bridge: imx8qxp-pxl2dpi: remove excess error
 message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-14-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_170518_982133_34B135AD 
X-CRM114-Status: GOOD (  11.29  )
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

imx8qxp_pxl2dpi_find_next_bridge() already emits a DRM_DEV_ERROR() for
every error except -EPROBE_DEFER. The caller emits another one, which is
redundant. Remove the message in the caller and keep the two in
imx8qxp_pxl2dpi_find_next_bridge() as they are more informative about the
error cause.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index a4941f39a2e6..e03a411cb9db 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -415,13 +415,8 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
 	}
 
 	p2d->next_bridge = imx8qxp_pxl2dpi_find_next_bridge(p2d);
-	if (IS_ERR(p2d->next_bridge)) {
-		ret = PTR_ERR(p2d->next_bridge);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
-				      ret);
-		return ret;
-	}
+	if (IS_ERR(p2d->next_bridge))
+		return PTR_ERR(p2d->next_bridge);
 
 	ret = imx8qxp_pxl2dpi_set_pixel_link_sel(p2d);
 	if (ret)

-- 
2.52.0


