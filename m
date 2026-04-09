Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FF0F364A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 17:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQHs+xJKsUMQO+6CCh7X3NX/2yXBo/WKUOrvcvLPWfg=; b=cwa62B7tj+ENyhaihHNHzodAiX
	S8F3w+9lIZih4LMoCO+FMZIfyt1g4Uf93aggwCievPBX0Y2efXum8kMBbZfW67XhuDmKu8K/u1/KN
	tzIYor5qpm+qrEp+9AKzFOw96gjOah59MrO+mMwE0hWLN2ng5Bjy6JqRo2YHndVlkjekUG6YtB/1l
	7bl+8vo4yjXvpQDu9ufZrICrEP0k+YcLQiwEA6c6/4p3+HuQHeyJ/iAUZVqwZeYW42S5yvsi04Gns
	+MuXHfKZXORK5+TzKoFJPmwkfp/EkfSZFgnLkbXt1VOGxZao4gWGlrVkU/2IBh7lGsLrPV9RMQHfI
	2c28yjdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAssH-0000000AyXj-0b1W;
	Thu, 09 Apr 2026 17:09:01 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAssD-0000000AyWy-1ihi;
	Thu, 09 Apr 2026 17:08:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8B53CC5C18B;
	Thu,  9 Apr 2026 17:09:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C09BA603E4;
	Thu,  9 Apr 2026 17:08:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BAF410450194;
	Thu,  9 Apr 2026 19:08:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775754534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wQHs+xJKsUMQO+6CCh7X3NX/2yXBo/WKUOrvcvLPWfg=;
	b=MIZWIZeI6SDzL7xElyXrZcp1xP5FU/iv6TVLEMIzJzuy69V14+eWik9kRKFGixgQaD6ciS
	Ddf0uG5jq9ljh6Qn4Bfo3Lo4wh3XkM6VJnIAAGk9dBUjHNGHVUxP2CdnVN7cr8dJaD0IMj
	J0Syiixw7j9TNbIZj6PVG1Ugn2d1/iCHei/yCZMmd68Rx+dsZQxLDuWDrcTWQIm7QeB+QA
	164m9FfPe/Owoxjn26H4BCuDi+FulELgNLV8kTRt7/wicDSenIEtyWuk+lzDtW7/7QYFln
	hwwOk/KBfs0c9gD6gPRrMcw5DivnFR3liiquTWK6mqxqzChKFRM/bHEfHbbn+Q==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Thu, 09 Apr 2026 19:08:17 +0200
Subject: [PATCH RFC 01/12] drm/i915/display/intel_sdvo: Fix double
 connector destroy in error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-feat_link_cap-v1-1-7069e8199ce2@bootlin.com>
References: <20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com>
In-Reply-To: <20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>, 
 Jesse Barnes <jbarnes@virtuousgeek.org>, Eric Anholt <eric@anholt.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chris Wilson <chris@chris-wilson.co.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14-dev-d4707
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_100857_598569_BF69746F 
X-CRM114-Status: UNSURE (   9.90  )
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

intel_sdvo_connector_funcs registers intel_connector_destroy() as the
.destroy callback. Once drm_connector_init_with_ddc() succeeds inside
intel_sdvo_connector_init(), the DRM core takes ownership of the
connector object and will call .destroy on teardown.

The error labels in intel_sdvo_tv_init() and intel_sdvo_lvds_init()
call intel_connector_destroy() explicitly before returning false,
causing it to be invoked twice: once in the error path and again by
the DRM core through the registered .destroy callback.

Remove the manual intel_connector_destroy() calls from the error labels
and return false directly instead.

Fixes: 32aad86fe88e7 ("drm/i915/sdvo: Propagate errors from reading/writing control bus.")
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Not tested as I don't have such hardware.
---
 drivers/gpu/drm/i915/display/intel_sdvo.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 2e1af9e869ded..6eb2b4b45a9b4 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -2873,16 +2873,12 @@ intel_sdvo_tv_init(struct intel_sdvo *intel_sdvo, u16 type)
 	}
 
 	if (!intel_sdvo_tv_create_property(intel_sdvo, intel_sdvo_connector, type))
-		goto err;
+		return false;
 
 	if (!intel_sdvo_create_enhance_property(intel_sdvo, intel_sdvo_connector))
-		goto err;
+		return false;
 
 	return true;
-
-err:
-	intel_connector_destroy(connector);
-	return false;
 }
 
 static bool
@@ -2945,7 +2941,7 @@ intel_sdvo_lvds_init(struct intel_sdvo *intel_sdvo, u16 type)
 	}
 
 	if (!intel_sdvo_create_enhance_property(intel_sdvo, intel_sdvo_connector))
-		goto err;
+		return false;
 
 	intel_bios_init_panel_late(display, &intel_connector->panel, NULL, NULL);
 
@@ -2967,13 +2963,9 @@ intel_sdvo_lvds_init(struct intel_sdvo *intel_sdvo, u16 type)
 	intel_panel_init(intel_connector, NULL);
 
 	if (!intel_panel_preferred_fixed_mode(intel_connector))
-		goto err;
+		return false;
 
 	return true;
-
-err:
-	intel_connector_destroy(connector);
-	return false;
 }
 
 static u16 intel_sdvo_filter_output_flags(u16 flags)

-- 
2.43.0


