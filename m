Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E66EA3F2B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 09:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/4pWXM8MAKWeYJmoBAYToovJi1wgFNm1p75GzaAUFNs=; b=LAy4Ctky9p0FDC1/+m8dgahOZs
	pvx0/ln14YmXQs0v+mPdk1kbfua0a2ceb+12+IeIraoKr397pc4K/66cBz+xtI6O3+A1xu3vQ2bb9
	2eJvwa3H+bFEew/JhQ/CIfOwfnZbu8kRAafWDxIEFf4VdzjHC/i2GBpFBoRSNIsrxFfm3W3fl7xXA
	YA2tEdl0BBDGWXiRWfb4VYYCAYRkMMikPJunmJ74cni7L13EMuVj/OjnGBlG5kNeTz22ZFECOd2Ct
	9yEjleOAW5zn9NFAOq+HOe49q56eGluPUczxmM2msvGAPNtRn5JLpY0LLhIiAIsiBvvQJAkeftJjw
	UvyWjiHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpk8V-0000000Gkgf-17j7;
	Tue, 10 Feb 2026 09:34:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpk8S-0000000Gkft-2uKN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 09:34:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so17430065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 01:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770716058; x=1771320858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/4pWXM8MAKWeYJmoBAYToovJi1wgFNm1p75GzaAUFNs=;
        b=OZzc3rrbvO8th5jL70Wyr5kU4yBAAD3gBkbNiy83eVY9pqa0B+c08oqoJa6GsgtAk2
         Etqmpi9LW9wkY+9o2iCX/u7LvIhZtierrKzDyOBdxyca2MgJZX5pWnZz/11VtKcGD5ba
         HhUzmOWMSjtF8D38v3W7yyBHLZ509KHZbwoODywDPBQ06ipI+QB6lIHZaR5SBGmGDfhi
         nHMq7/ixe+GUv0ffTKyFXIVCZ/ONKDEOIMwrhLVqq7pvW7aIgxzPdjQoro5bYj+mm5QD
         aqHBnlUEft2EC60Od2mAl1eNdu+9ct1q8iDrGPb0OuBn2ScU3ZnEUxm4iiiPJ+J/8rxv
         EydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716058; x=1771320858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4pWXM8MAKWeYJmoBAYToovJi1wgFNm1p75GzaAUFNs=;
        b=JRfO66K3p4kRjBjidec09TqTBDQoJCOpXi6FxlwaoMwVcpCJVBqnXlj5GlP00tJii7
         E0+0ADXsKHuuujcMvklwhFkgnvBPCXxctHzN7ncRebUW7tbowRWJVgaeds1NOKrova9H
         c4ClCwcWx+ThVOLQxjW9U5q7O8Bm6hBwCB1IE3xR44Iq0sNH+EHj/hPQ1rSRPSjIi/uF
         wdVwKpaC5FbPpXMFJkk3pZ5C/A0g6Z1JfKGCWCvGr5BbGxD12gMbEfPoNsLe06aYsn+Z
         KI3P7FLeOSQQS5GKRlc0/tbTt3CYFiHoGkzO+cxrxvxj46AlDKkWzDWmncOg56xYIwAB
         RvJw==
X-Forwarded-Encrypted: i=1; AJvYcCUSE3NALramPpLuprMGWiw2Kc4h6PBKfK0N9mYYpvSpkacm0yVUrsBhyNsTzYU/WoAsAnP/B1bLtiBtuP2Ho8Sd@lists.infradead.org
X-Gm-Message-State: AOJu0YygqTQc4OMs356uDu9xbZ7e2ufYCXajzu3jTerKSun9C6YyWbQO
	vZUa4E/uks2CM2RklEsivivSya3VDZe6F/CsR58t34nFmBX9kajic5BP
X-Gm-Gg: AZuq6aLdUqyO9kMD59SXCu70GmLIG6amBS/0Y0NLGif2sVkNTjZuGPT4mMo0i42nenP
	Cu9wyvR+x/bv48fdT1BEJE82+Z1koK+//UWzlLy1Vw18u56nO6H1dz+ZlUDlrf7VZ5g39AFVRuF
	Mq6Ip/G1Cd+FrPWg8sUznfmp3CREt6+P8KIwejLsii9sMX1ACEmfRFShNAKo6gBOgKC2G46cvSn
	bF+1Pl6ZNCPOjm0fKS+RY6qVdqSyGCnqQ+OK0r1GuL8guZ16Ic7i3Pmsn36sn9XVrCqT+faoAQW
	w9h8BGpopMtchSw6y1nASK7/lt3EmPnVBk+gVBqoV0S/204mp7KIKAOe4r5E8WDogb+K7eDRGTP
	1Tf/t2mcCd813OzEUaxdcKmySZUjG9tmqYp+jWliWiZmdm6fQOFJFjGLZd7pZZ78BOh7VAk5Uow
	n2NsexfrbB/xon7vQXz2o=
X-Received: by 2002:a05:600c:621a:b0:47d:92bb:2723 with SMTP id 5b1f17b1804b1-48320928d7cmr202536005e9.3.1770716057605;
        Tue, 10 Feb 2026 01:34:17 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm16571660f8f.20.2026.02.10.01.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:34:17 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFC] drm/mediatek: Remove all conflicting aperture devices during probe
Date: Tue, 10 Feb 2026 08:39:43 +0000
Message-ID: <20260210093333.5112-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_013420_752259_9A70D812 
X-CRM114-Status: GOOD (  19.72  )
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

If a device has a framebuffer available it might be already used as
display by simple-framebuffer or simpledrm when mediatek-drm is probed.
This is actually helpful when porting to a new device as
framebuffers are simple to setup in device trees and fbcon can be
used to monitor the kernel boot process.

When drm-mediatek loads a new fb device is initialized, however
fbcon remains attached to the initial framebuffer which is no longer
connected to the actual display - the early fb is never removed.

We can gracefully transition from framebuffer handling to drm-managed
display by calling aperture_remove_all_conflicting_devices as we probe
mediatek-drm. This takes care of unloading other fb devices/drivers
and disconnects fbcon which then automatically reconnects to
mediatekdrmfb as soon as it's available.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
This patch has been tested on Xiaomi Mi Smart Clock, however
I'd like to get some feedback from more knowledgeable people,
especially about those points:
1. Is aperture support on mtk-drm desired at all?
2. mtk-drm does not know about the fb address therefore as far 
   as I can see we can't use the more specific function
   aperture_remove_conflicting_devices. This means that all generic
   aperture drivers will be unloaded. It might not be a real world issue 
   as I can't see why one might want to load mtk-drm while keeping 
   other aperture  device drivers active, but my experience is very limited.
Thanks!

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a94c51a83261..17e45b93fe49 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -4,6 +4,7 @@
  * Author: YT SHEN <yt.shen@mediatek.com>
  */
 
+#include <linux/aperture.h>
 #include <linux/component.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -1116,6 +1117,11 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	if (!private->all_drm_private)
 		return -ENOMEM;
 
+	/* Remove framebuffer owners, this will release fbcon if active */
+	ret = aperture_remove_all_conflicting_devices(DRIVER_NAME);
+	if (ret < 0)
+		dev_err(dev, "Failed to remove conflicting aperture devices (%d)", ret);
+
 	/* Bringup ovl_adaptor */
 	if (mtk_drm_find_mmsys_comp(private, DDP_COMPONENT_DRM_OVL_ADAPTOR)) {
 		ovl_adaptor = platform_device_register_data(dev, "mediatek-disp-ovl-adaptor",
-- 
2.43.0


