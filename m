Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9151C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 22:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjOkvTAh7xLR6oz7Jraj3xIzj+YnPpAgZxo7IErtZuU=; b=eGvqJP4szsW8lFm406PTQV22vK
	TXT6tBkhw+7shVBQpqwigF6RTAFpIwdY/GaEjtwQCnrW4os3vQZN1qBW9PecUmoYbUmnWwQZnjXrg
	eZnD+KuuA8BJlysAhVVzI+KCNF1o7EwbdxDSGRfgMupupdjuq+IqCGWfmEZTOMUm1nmmqtvpXtFST
	5fHpZPl30JOCkyLniPSdcWPu43IJBfqtW60gB/ivJzMTkLZQBLvTJ5K7XX7tAbMLLeqxDODdhxfBM
	/srelaXnN8Ei9/CApgdxoPAojdHp+o697+YYpiEuNGvg5hskdY/1YSmhcU9/6RwcvQIxsi0lwcxaL
	PT9wyLyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1jL-0000000FACh-3z8P;
	Thu, 23 Jul 2026 22:17:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1jJ-0000000FAB1-1MPs;
	Thu, 23 Jul 2026 22:17:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784845042;
	bh=jeWM9ZuBdRXow1lN7QNQeJneeNo//Es7iVqVebEQ8cY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y6Gk2N2DhPm3iVoNYPd0oLeFx9xS0LNf8zl27rJnjzfhGmSUKscV6dcvriXUzj9q+
	 smmi8L2GL6M0XrN+9UoxdUXOXGtsg+NmxToiBj0NaonCalKR9CRGyAQ5FYZ6pSiXtB
	 yQkucpGO8H5zr+ITAyLZkVODa0yB3zrX/tweygu8k6NwlJtLf4RlUilU//zeoyHxjI
	 KLecxqE7b5Umunl8wgjS4scHF5+zEMWBb5sIv+Kxbw5vnjMTktJb7tBAr1oF5EWIaC
	 ULEBcbSFCikjVoBEwFORRh1PfoV3LmG94b8Y2636J3U7ULW0ZKFCafKSXhPNoSkaeL
	 D9+NsMxk342zw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 585F517E374A;
	Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0F1B648002F; Fri, 24 Jul 2026 00:17:22 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 00:17:11 +0200
Subject: [PATCH v5 03/15] drm/bridge: synopsys: dw-dp: Add missing mutex
 cleanups on module removal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v5-3-9445c2e87441@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com>
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v5-0-9445c2e87441@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=jeWM9ZuBdRXow1lN7QNQeJneeNo//Es7iVqVebEQ8cY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpikvFPvo2ZIkJ8uLZPCJzc6vi15qDRM98JN
 iMUI5MxtaDdt4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqYpLxAAoJENju1/PI
 O/qar94QAKMabvQ5SACPBz3BeZ0iSQQz1+2BImnHCxL1/Kf9RiEwR2QnECLvik1LtYn2YQMgD+8
 FAGhQL/gAPGYIx89JG44TPUoSh5vHl900v7Hn7V72i/3zwVDWyHh4zFHAwsYpEANk6f4Ujfjtcx
 JCsfioCAV16caRPUpJWEVF6wj+zEDbtJgTjrb1k8olPyj+SrWJDkwn61xygba/iN0sUM8Mh7TEx
 p4JMm8ySXG6XiewPNspApp+S66n3JvVzYZiROroiqVWQSkr5BcgEfIdVfz3qFi2GvAfqJDNt96j
 UPtpW2S2p6VKsi6kxXdBQGjSikJsofxKf6/nVPMorAGFi475y8Q8sU+46CxjnCoMSD9pf4ZownV
 I5g6Lwp92s2JulvH0VGdtU2QxXYvnpheuCKVcAh1dxUhbJ7DNH+W53mx/KkcP24l6NDeCvotXhi
 vzDkCvJtHNmiTXxwwGu1yiBgCz7Yvru7xF272J3aOmzwHI1w9gkNeILFBk+OvWouB9D0wVtcB9c
 orXHOMzmTDTPspAFNPD6TgT+vVAgBfJGlBpnno+Mrk3r1UBZH57tPKmyhXxM6Ym0PqFglCO431X
 TPmqqJCXxGoTUJEEgnHIbFdUrRAAs2ea4jj8m41GTEHrzDeFN6+0UZJeOvWC0nXs2ihdVWzVizr
 iXAa/Ov6gVFzheGCDdPkvOg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_151725_525039_980FF7A1 
X-CRM114-Status: GOOD (  12.58  )
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
that the mutex is cleaned up. This is only relevant when CONFIG_DEBUG_MUTEXES
is set, so not worth a Fixes tag.

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


