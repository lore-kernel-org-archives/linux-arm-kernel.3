Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A776F55102
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 21:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SGXhq2UxUJDL3aAv90iI2xuTf9Opn9T2dvuqIOW5Q3g=; b=MCNspMK/L1Ud5m9YrV5cvik7tR
	Jx7PUw8eR/6dA5J+FtQrb4EYvU11OhV6hDtuyY1BphSpppzqq7RKvW/TdcwDUM9WNLjiYUyZllpfI
	LUtx39VxqWE4hHMz7CCL8mMGAQoZg+j55U6rb1sAxAfexc7kawKjflvarOQyG+ajsSEKJlmcTvSlS
	VTHP2OWbB67SbvtMUpEL5+CWM3Ft5h7amaX918tobYd1uLADYnizVVon5GrjJyWCmePFQdbzY6rKT
	h2kvcM/53YG9X+/4HbQVxxYXtrOJ4t1S18I+5TrcUYLIYp3Sb54GVbxxAzo5kLjZpXtZKX2LERPiM
	nJzX7lSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyyop-00000005VWh-13OY;
	Sat, 07 Mar 2026 21:04:15 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyyom-00000005VWF-3vlo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 21:04:14 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c7393c6832bso1083579a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 13:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772917452; x=1773522252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SGXhq2UxUJDL3aAv90iI2xuTf9Opn9T2dvuqIOW5Q3g=;
        b=Q9/KWGMsIw/z1ieVhCBBpBX/brhLBCvCEZbDUNeyVOZOPqIFTdIdcLvbx8VEtglvtY
         bXxhzzZww86ofGrUAKIW1CuujjYw9hqNJ6sZOHLy1LcPAP3la3sKkgonA46hQhw0BmhH
         8pPRmqVwlwLRtSqRtBG/CgYwCZsBwwHai1lOJyZ1vS7T2zmDyKKWnx5ay3caCJ0kTOur
         J/ce/C2mVcbao5A+v1EBqB9/c6jgp+or27te+ivBFZ+gQRiBHiaoBcOIwiofJx+a5VCr
         bLv/bkkmEKSCus7x2nTnqyCMjDXw19+L5qXPkoFh3ngg3EwIuw/okbCRW5gYpWTyeHZz
         KpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772917452; x=1773522252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGXhq2UxUJDL3aAv90iI2xuTf9Opn9T2dvuqIOW5Q3g=;
        b=Y45zLWDLfZOlDUQ0ZnPW+AQ6vRKcmWUttjBQzBUpEd3vVdiPAkX808Q15rJOyBIPrz
         tmghPsR/wNKebzyg6WWzowmVTO0NaAuDtqnHZ/1Gx+B+5gZ55+7XLpZsT6IbnhF/zZ+G
         r4+J9dnsrw9VasrsWX+dGvaRpl2uq+S56hkwOPHw0YU5Uh+EPq/h8IdzIykaDQhSq3NH
         CXqRMi1+ZI1oeqSbUf2SDCgOeNHA8jRg3PErOmz1dhkRmUhN+LIvfFGTUEvpf0ZPpcA7
         QkYjOAjwqOkD+d68yXrpczMphPhBStaVpXqkgHDOs6Vxw2xmmH15FWlI0a4O8pvmqJbr
         9Gug==
X-Forwarded-Encrypted: i=1; AJvYcCUSkU68PfdF/oIFbJ5D1dwKelylDB5cw6LwcMuWIRdGdOjvp5/+ObHEfn2u23df2S9PHFriIzyoePq41CWCUCq/@lists.infradead.org
X-Gm-Message-State: AOJu0YzebgDW8f8VJxIhabLtqkxaHxrYOSTNsaazm54uujwuwQXsNoZE
	sV0yugeLzlTorVHdoZSGqnU5gQOe9DA+kbJ0ic2pR2XqKefKEA2bIhoC
X-Gm-Gg: ATEYQzyS3tq6q7c1VVjaMADZQkfXSIDbHnP2nJ+TCBr0Vfb/qecgeQLg0Xo/+Bi5uDR
	c+KLioWbaL8MCmOVZ6UUNhBSkFGh0HO5isaem+5NyNf7NJDMMW2ndq+Id3rq7a+xcXyW8d7vdU0
	SKwVlqWeSyoXwedq9Vxsgvu4ThatjfAySW1Sjr3Y9QFJ6jKLEszSxADPrWbeYrycPdODIST+5CY
	uigZYqVx0txSYXzCWMrWXpPadaIwGi29t0HzDto9zQVPs9Yu80W/4kgTZ2izO13oJY6qAu0x6c6
	o/dYQWi7O2GBVa4HirFQ02f/75LfUQCfppSfuBeipC99YrPUxerKrU94x22ay1W+NiJNNcoZjaO
	iXAV1l0I6UclW7Me2+hHpZ6x/fUbeTgJWbDROC2zng44YKGWBcixGh5OfP5OEsbfOZ2D7BWEJeE
	jzQwArm7XzecVH+jH/7qNIidX2TzNOH3uxnE6HleCISSOuCQs+LI3m67PlHm4=
X-Received: by 2002:a05:6a21:9cc9:b0:341:5935:e212 with SMTP id adf61e73a8af0-39858fd5915mr6251896637.18.1772917451630;
        Sat, 07 Mar 2026 13:04:11 -0800 (PST)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e182d72sm4840124a12.25.2026.03.07.13.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 13:04:11 -0800 (PST)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: mirela.rabulea@nxp.com,
	mchehab@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH] media: imx-jpeg: convert kzalloc() to devm_kzalloc()
Date: Sun,  8 Mar 2026 02:34:04 +0530
Message-Id: <20260307210404.1428894-1-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_130412_979324_0BE02932 
X-CRM114-Status: GOOD (  11.57  )
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

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

The driver allcoates memory using kzalloc() and frees it in the relase
path. since the allocated memory is tied to the lifetime of the device,
devm_kzalloc() can be used instead.

Using device-managed allocation simplifies the error handling paths and
remove the need for manual cleanup.

No functional change intended.

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index b558700d1d96..bd4b5f08a85c 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2200,14 +2200,12 @@ static int mxc_jpeg_open(struct file *file)
 	struct mxc_jpeg_ctx *ctx;
 	int ret = 0;
 
-	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
-	if (mutex_lock_interruptible(&mxc_jpeg->lock)) {
-		ret = -ERESTARTSYS;
-		goto free;
-	}
+	if (mutex_lock_interruptible(&mxc_jpeg->lock))
+		return -ERESTARTSYS;
 
 	v4l2_fh_init(&ctx->fh, mxc_vfd);
 	v4l2_fh_add(&ctx->fh, file);
@@ -2246,8 +2244,6 @@ static int mxc_jpeg_open(struct file *file)
 	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	mutex_unlock(&mxc_jpeg->lock);
-free:
-	kfree(ctx);
 	return ret;
 }
 
@@ -2754,7 +2750,6 @@ static int mxc_jpeg_release(struct file *file)
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
-	kfree(ctx);
 	mutex_unlock(&mxc_jpeg->lock);
 
 	return 0;
-- 
2.34.1


