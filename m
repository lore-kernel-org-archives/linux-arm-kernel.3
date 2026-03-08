Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D96F5512F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 06:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NdmHfX8iJMNVaUFQiMWVIu/bs4A6fwnA5qtvVTfwi5o=; b=FFcdoLAD5C0djc8yalgaJFf5o7
	YGBbyierqTWKUHPv9b5iqoQd7ZaucOkHwGWk3WN6bz9E8JeLV0F9vJrIS56JQoOa5lzFHWz68WJ1+
	3U4kMttdS8VihRDySquiLP16FtIlLEqVyGk/xVLGEAtgXsrHqA5PrB0QmN2Qb+zIPs2smnkbRJX9Z
	RwQ/zlOxwsI+LbdyCD51vlDmq7KP89ri44XAanZnQh/bIuegPVj5rG6bC6ctedM7P6pihgSj01EN/
	+kh7wLZ1nMrcXWlbN6AKejP97wUx5z5B7wnIy9sLvZR1BFpxyNguGkAy9+pHGPsKojqOgo+munwrc
	dCugYXCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz7HA-00000005kE7-1AI5;
	Sun, 08 Mar 2026 06:06:04 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz7H7-00000005kDm-1kgJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 06:06:03 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so4029953a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 22:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772949960; x=1773554760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NdmHfX8iJMNVaUFQiMWVIu/bs4A6fwnA5qtvVTfwi5o=;
        b=enHwIq7RK+Z5LGpSjhrJUx83TllMatHANW7/oHhcWUvJfCaDOayQvCcVQ///MM9NUq
         sZkPXfiDGCpl/hN9mEUnVD89qTWAwck6K/3Megg0ArZczT0Q0tq0MhN/Rn0eV7qY2aS1
         A2mYcSezp31aAl7Hs4rRoX0Vjx37TexiJf/E+6fVejrn0RJnjcHFxeWQ7G34dAg/iyRY
         Fbm4HreKMzvwnzgXu14OpNtdc+Fnc50gemVIk5LTtSSBDQKDeTlU8zxBnSZ6FfVR2VAA
         O70qjoG4xUzgmuksUyt+d729hGE5J6UByLtapZADIAcr6WdGc7Iso7ZIwLS7JaewkIN2
         a0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772949960; x=1773554760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdmHfX8iJMNVaUFQiMWVIu/bs4A6fwnA5qtvVTfwi5o=;
        b=jYLJEOsFqt6/jD951JxWk+M+gSSEEOQ9b3osTdyUt0WRh0meDe89+eklZMdeeW1awb
         hT7hgSJgCQR4mdgB8NbPturhvFAqMfOn8q0mex3IZHy7rDfoDz8AkYThdMkvUWnTiaZS
         aiZwpkJjJvUIfJrQo4VnSOU/uWgMIeMKWcK4M3awtt+Kz7GGEkJq0P1fdY4lrcXcj7T1
         F5ytXcSXso3jIfC1ydDhT+FxrGBtFxsim+qD3rYx1oR++pD/TE2qDzYuQyCGDgeC0MmK
         wAeBSeGO5a6N5oTM4VErgozbIS/d9rIrw9LhD1KLNIgt0xxa0bg0d5Lbciojfae2ETbL
         r72A==
X-Forwarded-Encrypted: i=1; AJvYcCUxKCBQ7R9DjQj2UeG6FTpePwDQQIe2b+m/p6QUL90UkkHOZmhrwT2/hQB14edumbDzy2ASqRQiHxDMZ07s164a@lists.infradead.org
X-Gm-Message-State: AOJu0YzmzTSQsVTAI9EPMhfyFgVMZtO93A8vxVbIcueRHDUd2+I0wUV8
	l/d/1aXFA+PGus5fQRuH96db0SNhmrD5ybPVxqcX1wA2u8ng7Qwe2EmTG362CPKX
X-Gm-Gg: ATEYQzzihN8RYkhTpgYSvBktprjwninKbjOeCFT2ZFFhfAN6fVxuyWMi+Pd7biJ5juj
	R3+VDCoq5g8Cviy2xjirwL3ciP1xlw+nD03P1pPfWQWhqARpnT0idXCAs+1x8+qvlrQ121IdYwu
	sORg3x7KEjboyKKVhycD07F/cRr7T6ZVfAB6nyLL6xTeliV+t/kMdkTWOukeJNZ6A6vgIaBu3V9
	xjIFHI3HxqrX0Ex3Xq4PmEGM8kI6JQ2kkXru3LTrs//QAMXCSP5gjz97KKJ9zCxZ/XzTTxkhJdZ
	DVcC7OI/seqe+DiOfQeD+DmqaH6jeBVne+SR5+fsD+tJBlM605CJpEIjjgdewtuVSS0JhdjVoeA
	qIHLipM7yx9kyLySh6ERfUmoQ4++c65nxASbzUEtOLNdel27eVmzCjvz2DRdeOcqhfk/r9Z4U92
	BagWDiiRZixFfnCYQonc0ixFOAAXvMJ5qoKavQ4zUMnxALioBU
X-Received: by 2002:a17:903:2f85:b0:2aa:dad4:dfa2 with SMTP id d9443c01a7336-2ae75c01749mr109084195ad.18.1772949960247;
        Sat, 07 Mar 2026 22:06:00 -0800 (PST)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840aefbdsm93680815ad.82.2026.03.07.22.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 22:05:59 -0800 (PST)
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
Subject: [PATCH v2] media: imx-jpeg: convert kzalloc_obj() to devm_kzalloc()
Date: Sun,  8 Mar 2026 11:35:54 +0530
Message-Id: <20260308060554.1764128-1-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_220601_481490_680ED0A0 
X-CRM114-Status: GOOD (  12.55  )
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

The driver allcoates memory using kzalloc_obj() and frees it in the relase
path. since the allocated memory is tied to the lifetime of the device,
devm_kzalloc() can be used instead.

Using device-managed allocation simplifies the error handling paths and
remove the need for manual cleanup.

No functional change intended.

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
Changes in v2:
 - Rebase on tip of latest tip
 - Updated commit message accordingly.
 - Link to v1 https://lore.kernel.org/all/20260307210404.1428894-1-sanjayembedded@gmail.com/
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index b442dcba02e7..bd4b5f08a85c 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2200,14 +2200,12 @@ static int mxc_jpeg_open(struct file *file)
 	struct mxc_jpeg_ctx *ctx;
 	int ret = 0;
 
-	ctx = kzalloc_obj(*ctx);
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


