Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D25C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 18:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/77TfeRNu9EBRepYUS6uBuAxlXkQrRteMUqLSP0EFmQ=; b=CdD5/HiGXzu5xLw5mndE60Wuwe
	v8MQmBVP3omYCfpka8XV9/z4L9/x+tCbs0NGif9Nnamd9Ls1lYJ1B6g953Ff/icbM9aFHIOaG/n1z
	pSKS81JNnkqvydeW18eEc3HUiCl9q4JgKRe7fHbunGayP/05SGOCHKIrnwKOwpuzVDACNadISg4of
	rPYUViHo0AFYfiwcztLLMoSVu8sBYocIeGFkLNFUAtVdfgtvwZU+OO+OBKVDFUhH3q/rdZEhnXMWo
	M2vyBTJf+FmgB7GHSNizJ/kYveaOiGN4AunEhDn1aV8O0tb0JspR/v9IRRGu6G4ndkFY5kQHsNTSj
	Nf/1185g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKFR-0000000H0O6-3nAM;
	Fri, 24 Jul 2026 18:03:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKFB-0000000H0C9-3LWo;
	Fri, 24 Jul 2026 18:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784916209;
	bh=K1Za5bWNUcnyTglAfKgP5KR/CLG+7GCG0v3x3t2iK7c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hX15Hf/9X+CVUa51M+H4hMh87dr+fBVbdDaU47SwjNZgs3Z+btzcSB9nPn0eIkHtw
	 h8YuOeiyGtHfxoMH3YGTPYUyXeIM8+8ppLxxsQzgM3k14tuj0qSgZ8YVbptAKcPFxV
	 HRdLxLD80ItpSMWTzAqKR3O8urZnoA0YbUmL5XAw0CW9NUzvoF6gVmiid+nDqFM7sG
	 RFIDDHArANCMIw+0fp0MIkEt0C6tIZ+5cH0weX8fcC1KwYwWYmHWCOZhV3/aySp5rO
	 O/1TQXxumtIuXGJGQSp3yqev+NcDzUJ+1e67Ykix1N6526n/sNpaUGlzXocPBiRPDL
	 j8eXMKxm6dwcg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3240517E0203;
	Fri, 24 Jul 2026 20:03:29 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DEBCE48002F; Fri, 24 Jul 2026 20:03:28 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 20:03:25 +0200
Subject: [PATCH v6 03/16] drm/bridge: synopsys: dw-dp: Add missing mutex
 cleanups on module removal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v6-3-041d99a19c4e@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=K1Za5bWNUcnyTglAfKgP5KR/CLG+7GCG0v3x3t2iK7c=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpjqPDGJdnZhc59GK1KDLRjF9Jl7LYQ91BvS
 bRWTpG6CuDCD4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqY6jwAAoJENju1/PI
 O/qa+9cP/ix24EjhRs9MFdFHjZ82uXi6N6SVX5BFk9ZCHGqhbdwr/XovPynmESWgj4k/gkzOCXv
 W/8kMdEQRAnqpJIj5noQRpCq6akOcdQ6Twl5k67poAjtH7BMMYlvoJAMkYr5nx/dxOIrIp3rcLy
 gV1Hoig4MJE/IFQr9RFb2iR/pqTo4XntvkqNM/cq27jo+hy4mNlCCkXbyzHRntJIIIcwCQGKUPA
 wc1vsJbx/g5aEJ3MF/YmPvMciDkOP5g7MvYtNAntuwIm1NuH7hdOKEkQlFIWRzLmHy0DFKRQV/F
 6e0ZjmjIo2nOawjb2I5Vkcq+k4IVc1nSDPzEg0psT5D0dxaZJb7HpjmO7FeJGulTGgXD7AnImRZ
 Yd2mN15thHUTyVRG9J8WFzHnUPsy7/iFV9JIf0xGUs46XGNi78TTRrmo0chkuk+aETXZMKMMXgk
 zef9bByN+xjIJApPKmCawS0M5r0GsNXyk1bzoGEunR9IRuuzltmLfbebVHO8Rfrf4adtF/QHMfd
 2j0jyIdw0POkFYrBBzS8NsyTbLgVg9RGLw25OdwFd+Jd1feaHCsNQNhUxfo3xISwJVJjOEPWdzS
 SjTeeI9c7zLY456ydEUCZZJRMjZHnPtRTopwhp3q6A8hXYTfheMYFfYaNXNDVmtVn6r0dCR7Byt
 rJMNa5DSX4g8ZayQrltknZQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_110333_994678_38F046E7 
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

The driver is currently missing to fully clean up after itself. Ensure
that the mutex is cleaned up.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 21bd08571dcf..b28040d69fab 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2031,10 +2031,13 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 	dp->pixel_mode = plat_data->pixel_mode;
 	dp->plat_data.max_link_rate = plat_data->max_link_rate;
 
-	mutex_init(&dp->irq_lock);
 	INIT_WORK(&dp->hpd_work, dw_dp_hpd_work);
 	init_completion(&dp->complete);
 
+	ret = devm_mutex_init(dev, &dp->irq_lock);
+	if (ret)
+		return ERR_PTR(ret);
+
 	res = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(res))
 		return ERR_CAST(res);

-- 
2.53.0


