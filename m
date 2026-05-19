Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCF6CD5BA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Di2t9C3Wga7u13endyDgbNt60je3EfQ2HxxTrMzvD30=; b=cQ3Sm/uAu7G9Zj89Lc6i2pHeW6
	dy99SXMYaqLqulnmLWuoYpkPhECHYvecPae40gyFHHcuNU+ZL5m8TYzhUx4SoRd9fmTYJ+qULWEDJ
	Xp4XpeUtvwSHVdVyS5m32COp/ILYraTIm/eTv94100QST6+mMn5bjOj3wIE6O+7o2cxg+aisr7jiP
	YD6pURvZwOQDN0w75apCKNmPPzQ4X8jeN2PNhTnE4Wkoj8bNdpfPGL7kZVccadf5oG1aKttDy8lsN
	jJ9/KGFIrvwjsKbGjQFiW5MqQEZMWgdXJbqBlzYh9GxW9zvQZGHmw2PwVCC7y4Rv/tfokpGRAo57Q
	yKWfiz5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHqk-000000017oY-2QIQ;
	Tue, 19 May 2026 10:38:58 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHqc-000000017eD-3fbm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:38:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5F898C2B9E5;
	Tue, 19 May 2026 10:39:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 33FF4606E9;
	Tue, 19 May 2026 10:38:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14C5C107E8AC3;
	Tue, 19 May 2026 12:38:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187127; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Di2t9C3Wga7u13endyDgbNt60je3EfQ2HxxTrMzvD30=;
	b=mN29/H1dlWQgyTgztrhOqG93sBuV28HHJ43/F+Zd/4GyUw6vHmmtlBG693qH6KjfCe9QYw
	OES8DUkhvsB+hi5YAUAP1XxlLr34ku+aUezCyP5G97iFnOddGtOuUhFf3SYDIw7Ndc0z1/
	lMquoJcTfROUqySTdyM3vAT/xD3WR5FKIgrx9ikqzPk004e7B66XSWxbmnS+lsCFZfkYCK
	hE8YhL0fFd485kmIbQ5Zb84nAJohjSJJgUeDg2XckAl7HIJFMmwUWr4VPUxB5oWE+ZqF1U
	dr8cwuM4Y52/4ZEwWkki9n4TAgU4O6OWJSuLEGz6/EYbLRdEFlfNJDJCb2oWPg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:27 +0200
Subject: [PATCH 10/37] drm/display: bridge-connector: return int from
 drm_bridge_connector_init_hdmi_audio_cec()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-10-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
In-Reply-To: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_033851_091970_B2A4BF71 
X-CRM114-Status: GOOD (  11.07  )
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

This function returns a struct drm_bridge_connector * because this was the
case in the origin of its code. In current code it does not make sense
anymore: it can only return either the same pointer it received as input or
a negative ERR_PTR.

Simplify up error management by just returning an int (0 or negative
error).

No functional changes.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index e6306e98a167..6066ca0c5624 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -930,8 +930,7 @@ static int drm_bridge_connector_get_bridges(struct drm_bridge_connector *bridge_
 	return 0;
 }
 
-static struct drm_bridge_connector *
-drm_bridge_connector_init_hdmi_audio_cec(struct drm_bridge_connector *bridge_connector)
+static int drm_bridge_connector_init_hdmi_audio_cec(struct drm_bridge_connector *bridge_connector)
 {
 	int ret;
 
@@ -954,7 +953,7 @@ drm_bridge_connector_init_hdmi_audio_cec(struct drm_bridge_connector *bridge_con
 						    bridge->hdmi_audio_spdif_playback,
 						    bridge->hdmi_audio_dai_port);
 		if (ret)
-			return ERR_PTR(ret);
+			return ret;
 	}
 
 	if (bridge_connector->bridge_hdmi_cec &&
@@ -965,7 +964,7 @@ drm_bridge_connector_init_hdmi_audio_cec(struct drm_bridge_connector *bridge_con
 								NULL,
 								bridge->hdmi_cec_dev);
 		if (ret)
-			return ERR_PTR(ret);
+			return ret;
 	}
 
 	if (bridge_connector->bridge_hdmi_cec &&
@@ -978,10 +977,10 @@ drm_bridge_connector_init_hdmi_audio_cec(struct drm_bridge_connector *bridge_con
 						       bridge->hdmi_cec_available_las,
 						       bridge->hdmi_cec_dev);
 		if (ret)
-			return ERR_PTR(ret);
+			return ret;
 	}
 
-	return bridge_connector;
+	return 0;
 }
 
 /**
@@ -1051,9 +1050,9 @@ drm_bridge_connector_add_connector(struct drm_bridge_connector *bridge_connector
 			return ERR_PTR(ret);
 	}
 
-	bridge_connector = drm_bridge_connector_init_hdmi_audio_cec(bridge_connector);
-	if (IS_ERR(bridge_connector))
-		return bridge_connector;
+	ret = drm_bridge_connector_init_hdmi_audio_cec(bridge_connector);
+	if (ret)
+		return ERR_PTR(ret);
 
 	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
 

-- 
2.54.0


