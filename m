Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A273EEA84C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 19:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VbOs3cQtoIqcba8ksEIev4JgP5sJJiSr7MKbA/ghxVg=; b=lzo2Y2nnVyW+K3YAnRlh/3xLNP
	K9H07zN0ClOiwoGetq4G0LovP/0TCC+A/vmK8JtpUA0V20BHR3Ye8gauoy4iYPWMy3PLcB0kiKBc7
	s061WaW+Pc6ELQO7McUqrHjXiXKcQbu/VyUYu14AELdLbRD+KXSSwkl33PtUGfo8JEl9Kt8CQkxc5
	mVXGYNLrTTH/Vxsbr40wTkUdZB2tIytnxzape4Xoni16GT/mKtqJvVRPsorOvWVw+GxaxLn9Ypdon
	W1/x66z5nohRHdyPrdXCjptyRRZuUA7C7aP8GhqVNVSKF72DxIowfv64T7wW/zENJxcZpbVwP3K6Z
	RPUYshow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqcKv-00000002Zn9-1vzB;
	Thu, 12 Feb 2026 19:26:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqcKr-00000002Zm9-3Nsg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 19:26:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4806bf39419so16840905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 11:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770924403; x=1771529203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VbOs3cQtoIqcba8ksEIev4JgP5sJJiSr7MKbA/ghxVg=;
        b=T2WJwvgCO7QIgxGUmeDWVhamRJiRiP5mB1zKJvwgZFOqxFPxlxDo/Vu20Jpwv6dEXz
         QLWcUrbZdiI7jNXOgt5z0Nv5CMev0W3StQnGlTuJzmPg7HOGfbWSBZ8uW2vEMNy8aDWQ
         jfHEFFF/fXID6phSRfGlOtJD6xewhn/b0n+ZYkDnq1VgTAEcWIkzzNlWSeSKEoQ69FAY
         +RFoOcThkCqVoLeh7ApbHwAde5JkM1B1+Ba/4KpIUzpLpE6mROlKPyAkLrVyErCltW+V
         T7533W+HMsQfsCmt72BtRweeTTI6XWzkN5K8QvkamHTwjDCelUniHbmnfNj4f8THrCFW
         njXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770924403; x=1771529203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbOs3cQtoIqcba8ksEIev4JgP5sJJiSr7MKbA/ghxVg=;
        b=Rxg6B6NvItzhkTm/8i/nRzP/lITigxqGSmIB58gUpb7ewpmcKwqWYD4QTKuYmr1NGk
         la2CEw7a/LQsRqWaqwxAt1Gi7Esx0N+FBezBeWtmzTr232uo6+pFkGkDcPWMqgcQVVE2
         0OiDbZpVNYGW4FB0BSUCxfcE2v761blSSEGEqJKfwDyjrbsNh47HCAvyZMDiNsZ7QMFc
         0ZAuPAQTqxb9HPcPSarDJj3wgdebbjd4RCCAJm8NRNbXH+cVE0BYywhznS4HD13n8gJG
         pycayw2nMZJnY7p4fGA/a5EeOFmO6UZBdY/HiRn5QQESBtrLZVs88p1Lcmtp1zXWPLJQ
         Vfuw==
X-Forwarded-Encrypted: i=1; AJvYcCUkW8efTp3qoRaF0YMumzub1feAJaE7foML8si9+b6jjH6jVnVIIm+NbIKYUGtl4CmN+alNux90BSCSE8T935N3@lists.infradead.org
X-Gm-Message-State: AOJu0Yza+kDM+EX6sKQNZ8tsGWc48r+ze0LsGDMajWuv2ZN5YHzEZ7F6
	Ozhrs5llpC9ivbCsePjvanfOM7R4Z90lITofTbrenY+r/5+ZysWICPK/
X-Gm-Gg: AZuq6aLxH5eT38quA9rL1wM0Tv+/YV/qSew6Lv6x07Q75qtMbLyNyyDH2G4wJKWwCMg
	15pEuepCtPa1XG61qCGcsLnLwBD+JHT2QYBkAXz8btMQpQapO6VZKTIDkyt43/CjuILLQavHDIR
	M6/gCbq0k4SUXlEwUtRrGvC4poAHErlnoTkSCdyldA28NLbhV3H8soJJ5lgqFmSCMIKugvwKwvX
	cjEfjkxl1jYHTcaAMP82Cw0Q3OUNXxa6RT5Kih2C6GcrGJZTBLqk3k72GbZI0fCl1XuuBwz7URf
	J24XMj0cOwkIvISBmIJMCk+QnJr35iiObfdQQoZ4t0UsT+9jw/PWDiXHmgIl14K/PyWbZntiOeb
	9FuX2723b6pOMP0Cx8QPFusC+rctOSxQmwxyK3DoJUZrqtK5HvMch43kYq0FLZzTqMfIIOOW9ih
	ERAQ88kxJwLf194+htst4=
X-Received: by 2002:a05:600c:1f8d:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-4836601387bmr57305525e9.11.1770924402981;
        Thu, 12 Feb 2026 11:26:42 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483719b8e71sm20405e9.2.2026.02.12.11.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 11:26:42 -0800 (PST)
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
Subject: [PATCH v2] drm/mediatek: Remove all conflicting aperture devices during probe
Date: Thu, 12 Feb 2026 19:22:47 +0000
Message-ID: <20260212192605.263160-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_112645_868236_2164E3EB 
X-CRM114-Status: GOOD (  16.95  )
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
display by calling aperture_remove_all_conflicting_devices before
registering mediatek-drm. This takes care of unloading other fb
devices/drivers and disconnects fbcon which then automatically
reconnects to mediatekdrmfb as soon as it's available.

The function is invoked just before drm_dev_register() to kick out
the existing framebuffer as late as possible to reduce the time the
screen is unresponsive.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
v2: Moved the call to aperture_remove_all_conflicting_devices to 
    right before drm_dev_register()

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a94c51a83261..02effd9fc698 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -4,6 +4,7 @@
  * Author: YT SHEN <yt.shen@mediatek.com>
  */
 
+#include <linux/aperture.h>
 #include <linux/component.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -670,6 +671,10 @@ static int mtk_drm_bind(struct device *dev)
 	if (ret < 0)
 		goto err_free;
 
+	ret = aperture_remove_all_conflicting_devices(DRIVER_NAME);
+	if (ret < 0)
+		dev_err(dev, "Error %d while removing conflicting aperture devices", ret);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret < 0)
 		goto err_deinit;
-- 
2.43.0


