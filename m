Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D651CA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 23:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jg7eC6O8sczD/5bWQmAv3EpmSexdLgJjBCRuuQxdedo=; b=lE8PULdFekygffAnAAYTPvWTvM
	XGnnujAakqnPt4E2shWy7bea31E7TQj7HKYsfDnYctUfkJE9sSX3Ge+oncjl5WSIb7OabToDYmVFH
	fCJ1Qlsra1pbOFplsmt4JAelaaZ65HQ5ZPeXKCnPNomcfOMuNxGk6LJdtV/0VTpN/1G43+A06T5p5
	T3eOrbbG41jjfqHttXVgvW0ScJrBaRM/PhudfzjbHF04uMV1bEzn4xI/MgJE+5uIDxNudbLvK6wuy
	w/J0OReIlyBGcFK6PDLnTuxq9ucvyd9N3JGckOkmbGTWyfR8gM7VIUP+RBZpy/pa1LfRkuE1y3sxE
	x5fJF2Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDsRJ-0000000HLtB-1Gl3;
	Mon, 05 Oct 2026 23:49:49 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDsRG-0000000HLsa-35XA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 23:49:47 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-33e46a15703so3193340eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 16:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791244185; x=1791848985; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jg7eC6O8sczD/5bWQmAv3EpmSexdLgJjBCRuuQxdedo=;
        b=oJgmCCwH575J7zUbfN6yBNMeBWbdu4hI2G8G92RrdVxhKvK6JMXKM4dYyDWmYIXFq+
         MlbdLo//4cXkTwGCKBNckYO934CTLWvTnTRY5sltW5vlZg8gxwxj2WLWODurJMEcly3t
         YfCLQnc35mw90i4ZqfzS7mwe2qWP4VXDeW2osFjCMCwvfsenvB0Uaq0Cm1zFRrw1XYhI
         viQlYwZzgExGRRV/ahJcd5OJ3UG4ehyMWRU98EzL08BwFtrraiz47+oZ8neAWxP0D6SY
         w8vO5/P8SfC4PZtgTT/iBNQav6IIcOSXuLWW89CCukv6pdSKjuBmPUtZBgtt4Kv1Vf3a
         fEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791244185; x=1791848985;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jg7eC6O8sczD/5bWQmAv3EpmSexdLgJjBCRuuQxdedo=;
        b=Uvz+tlXCMCUP0ZYN3uzqtRurxLtvBAq17K9K8JFg2OQF3/uRZPCTuZQnVJ34NNkT3B
         3wP9HQovjnbO8mxVqGDSW1GCIX/RXkiHLUdmx+yhNJwjGE4aODxMAMx74reXLnsOkmtl
         8EBj4xiO+c7Un5nc1P0Cj3tLGeTGtJD+1wpOrmzjPXKjc73MZfIT9CuSN4szl1uQVvLB
         UkIGsijKlUv8WljaVT2+8xQ0yD1WBbIhTNF2z0HCGJs5guGnHWyJ3tSGOgJZPGOlQk0J
         TsoettF3kwhU/7KC7nMygRwtUZWVwacchVs9NHEBCgJ0/eZtJBf+t4vdkWBb4nAVgOUH
         NpGw==
X-Forwarded-Encrypted: i=1; AKwUvByOxBu5P3ZJ4l2lvwnABhf0I94QrO0p1+TIPKQ4MxF0EneNb4AK+4O6Db+CLE07IDk2t1pee0Q2Tb2TXadlupED@lists.infradead.org
X-Gm-Message-State: AFuF++m3lkN+n/4uEeM9JVVHkIykKd/EK0e4mLeFS802aCWWDrI7SP5c
	FM7krpYU9lxJdT4TmKK4wXsHeP1+7G4MTKZgYOpT0nluaz1OxuJpZtwm
X-Gm-Gg: AYBFou3Orkv9UKfgnK+QmgF90hm2+pMTsnhDqhj0F10cWv8Ddi0cFdcUye4tK/QV0YU
	sRMsbAkugc+NPhsRwXBvHpX6IZzJY4n4d02YqLdbtZACBkqCcX6jaruWuOX+dgqeJLfz/JK3MMB
	v6itwvb99bg5wYdYaumEW3GYa53S2JG7YOBUb6zh5M25PvUo5sUAQMrhMsJzTLLJ0mNhd8MSuEm
	j0NlJ53WWUDFD5lCWKMQtevcb7k5TJAy46+tJbC1ho/UnbYAQ0Rma82H/MgcErpL2PNoetCPeW9
	4KzrpcUBHP2rn9JlU9Sxjfal74Y1PFfnt2Ut233eq5BopQG2NuxcYqkL+w6/vAPQgD0bhonqHxS
	ZeOkcv2GocYx28ou3VB7L8JIk9rUzh0iDsCj3hfhh4rLtrw53SH1YfMRDdUfvhC5Vm56fLm89JB
	GMSBXaKsthNVUyywN2TyX5sUJeOQyBfoSqhc0dZZ5bTT4QwU0fmjFdhicifLjvunZh
X-Received: by 2002:a05:701b:4587:b0:14b:992f:c168 with SMTP id a92af1059eb24-14f58fd2a19mr13452231c88.4.1791244184897;
        Mon, 05 Oct 2026 16:49:44 -0700 (PDT)
Received: from arlo ([72.235.71.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d84ec510dsm2126430c88.13.2026.10.05.16.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 16:49:43 -0700 (PDT)
Date: Mon, 5 Oct 2026 13:49:40 -1000
From: Raiden Horner <raidenhornerdev@gmail.com>
To: slongerbeam@gmail.com, p.zabel@pengutronix.de, Frank.Li@nxp.com,
	mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: imx: Fixed depricated implementations of 80
 char limit & open parentheses line ending
Message-ID: <asQ3lNQ2kZ_hBHZt@arlo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_164946_789303_70CFC1B5 
X-CRM114-Status: GOOD (  16.12  )
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

Fixed open parentheses line ending issue & readability. 
I presume this syntax was there to meet the old 80 char limit, and double checked the changelogs to make sure this was not already submitted.
If not I apologize, I am still getting used to using the indexing system.

Signed-off-by: Raiden Horner <raidenhornerdev@gmail.com>
---
 drivers/staging/media/imx/imx-ic-prpencvf.c   | 13 +++--
 drivers/staging/media/imx/imx-media-csi.c     |  4 +-
 .../staging/media/imx/imx-media-dev-common.c  |  2 +-
 drivers/staging/media/imx/imx-media-fim.c     |  5 +-
 drivers/staging/media/imx/imx-media-utils.c   | 54 +++++--------------
 5 files changed, 24 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 77360bfe081a..69f5ca280454 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -704,11 +704,11 @@ static int prp_start(struct prp_priv *priv)
 	}
 
 	if (ipu_rot_mode_is_irt(priv->rot_mode))
-		priv->eof_irq = ipu_idmac_channel_irq(
-			ic_priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
+		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu,
+						      priv->rot_out_ch, IPU_IRQ_EOF);
 	else
-		priv->eof_irq = ipu_idmac_channel_irq(
-			ic_priv->ipu, priv->out_ch, IPU_IRQ_EOF);
+		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu,
+						      priv->out_ch, IPU_IRQ_EOF);
 
 	ret = devm_request_irq(ic_priv->ipu_dev, priv->eof_irq,
 			       prp_eof_interrupt, 0,
@@ -761,9 +761,8 @@ static void prp_stop(struct prp_priv *priv)
 	/*
 	 * and then wait for interrupt handler to mark completion.
 	 */
-	ret = wait_for_completion_timeout(
-		&priv->last_eof_comp,
-		msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
+	ret = wait_for_completion_timeout(&priv->last_eof_comp,
+					  msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
 	if (ret == 0)
 		v4l2_warn(&ic_priv->sd, "wait last EOF timeout\n");
 
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index ef22a083f8eb..4eb621ddda25 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -679,8 +679,8 @@ static void csi_idmac_wait_last_eof(struct csi_priv *priv)
 	/*
 	 * and then wait for interrupt handler to mark completion.
 	 */
-	ret = wait_for_completion_timeout(
-		&priv->last_eof_comp, msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
+	ret = wait_for_completion_timeout(&priv->last_eof_comp,
+					  msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
 	if (ret == 0)
 		v4l2_warn(&priv->sd, "wait last EOF timeout\n");
 }
diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index 0d0ee8627a2d..be445df93518 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -377,7 +377,7 @@ struct imx_media_dev *imx_media_dev_init(struct device *dev,
 EXPORT_SYMBOL_GPL(imx_media_dev_init);
 
 int imx_media_dev_notifier_register(struct imx_media_dev *imxmd,
-			    const struct v4l2_async_notifier_operations *ops)
+				    const struct v4l2_async_notifier_operations *ops)
 {
 	int ret;
 
diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
index ccbc0371fba2..9e9bacf9dcec 100644
--- a/drivers/staging/media/imx/imx-media-fim.c
+++ b/drivers/staging/media/imx/imx-media-fim.c
@@ -205,9 +205,8 @@ static void fim_acquire_first_ts(struct imx_media_fim *fim)
 	if (!fim->enabled || fim->num_skip > 0)
 		return;
 
-	ret = wait_for_completion_timeout(
-		&fim->icap_first_event,
-		msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
+	ret = wait_for_completion_timeout(&fim->icap_first_event,
+					  msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
 	if (ret == 0)
 		v4l2_warn(fim->sd, "wait first icap event timeout\n");
 }
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index f119477cac6b..00cd391b5ff7 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -16,18 +16,12 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 	/*** YUV formats start here ***/
 	{
 		.fourcc	= V4L2_PIX_FMT_UYVY,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_UYVY8_2X8,
-			MEDIA_BUS_FMT_UYVY8_1X16
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8, MEDIA_BUS_FMT_UYVY8_1X16),
 		.cs     = IPUV3_COLORSPACE_YUV,
 		.bpp    = 16,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_YUYV,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_YUYV8_2X8,
-			MEDIA_BUS_FMT_YUYV8_1X16
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_YUYV8_2X8, MEDIA_BUS_FMT_YUYV8_1X16),
 		.cs     = IPUV3_COLORSPACE_YUV,
 		.bpp    = 16,
 	}, {
@@ -71,10 +65,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 		.cycles = 2,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_RGB24,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_RGB888_1X24,
-			MEDIA_BUS_FMT_RGB888_2X12_LE
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_RGB888_1X24, MEDIA_BUS_FMT_RGB888_2X12_LE),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 24,
 	}, {
@@ -132,55 +123,36 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SBGGR16,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_SBGGR10_1X10,
-			MEDIA_BUS_FMT_SBGGR12_1X12,
-			MEDIA_BUS_FMT_SBGGR14_1X14,
-			MEDIA_BUS_FMT_SBGGR16_1X16
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SBGGR12_1X12,
+				       MEDIA_BUS_FMT_SBGGR14_1X14, MEDIA_BUS_FMT_SBGGR16_1X16),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGBRG16,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_SGBRG10_1X10,
-			MEDIA_BUS_FMT_SGBRG12_1X12,
-			MEDIA_BUS_FMT_SGBRG14_1X14,
-			MEDIA_BUS_FMT_SGBRG16_1X16
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGBRG10_1X10, MEDIA_BUS_FMT_SGBRG12_1X12,
+				       MEDIA_BUS_FMT_SGBRG14_1X14, MEDIA_BUS_FMT_SGBRG16_1X16),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGRBG16,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_SGRBG10_1X10,
-			MEDIA_BUS_FMT_SGRBG12_1X12,
-			MEDIA_BUS_FMT_SGRBG14_1X14,
-			MEDIA_BUS_FMT_SGRBG16_1X16
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SGRBG12_1X12,
+				       MEDIA_BUS_FMT_SGRBG14_1X14, MEDIA_BUS_FMT_SGRBG16_1X16),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SRGGB16,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_SRGGB10_1X10,
-			MEDIA_BUS_FMT_SRGGB12_1X12,
-			MEDIA_BUS_FMT_SRGGB14_1X14,
-			MEDIA_BUS_FMT_SRGGB16_1X16
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_SRGGB12_1X12,
+				       MEDIA_BUS_FMT_SRGGB14_1X14, MEDIA_BUS_FMT_SRGGB16_1X16),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_GREY,
-		.codes = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_Y8_1X8,
-			MEDIA_BUS_FMT_Y10_1X10,
-			MEDIA_BUS_FMT_Y12_1X12
-		),
+		.codes = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y8_1X8, MEDIA_BUS_FMT_Y10_1X10,
+				      MEDIA_BUS_FMT_Y12_1X12),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 8,
 		.bayer  = true,
-- 
2.47.3


