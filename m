Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AB8C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGTxG2oVwgVmmQXCyhauY5aLJERWACnLUbauLJungFQ=; b=HUNFL8CevOB8CbC1usFveeIPMc
	fE9u339mosFhoUIZA9Sq091N8CTog47lz6W9NXYhSJI+a/p8RnkMwnsi9s/g5dS6SaNEuCKPiLcuW
	oyqdX/zhRQJaS3M8+vEltlYMZrsmaj3FwI/9BNJdn47HSxNrlAIKsQ8GD6P+it3BU6o8bOm7AXHKV
	Gky2eMfJl1ouPrjVvK+p6WYjLyDys30Ntbxy2/S/8TC5596CvNAAvxH8/fiSHKfoPkhXCblTkOt0B
	21e+l4Esl0Wt6z8KBfXHV1gb0kL6RKSRsCkGSzIbBUNGse7Y8slIJZS1S4KKtyG3xIRHpF8K8MGeV
	GsCU7LMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gMf-00000002jw7-2I6t;
	Mon, 21 Sep 2026 15:55:33 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gM4-00000002jNW-1w50;
	Mon, 21 Sep 2026 15:54:59 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790006063; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MGzb9I3lJG6/w4sDzPIQ6G7X83UNuPF/21AZ37wkS0cD6MZAsLDH+2RVj+GViuQApJgXnJz6kQcLZeBcCf0tCdRumo/9Xb+Sv+mWRTZPOj0j/7+dN8N+LTU7yCIqQLkfsA5w+uodald0sikSmpjZDKOkqlxasF11BqHCGECqLEs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790006063; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OGTxG2oVwgVmmQXCyhauY5aLJERWACnLUbauLJungFQ=; 
	b=RDtONl1oAN8C6S/Cq55Tc1m4dhomRBMo4mf1LG9KKP7IurcK7hT377vIH9k6TLcmDr7htH9fKk2sn68KAGzMvTnXz7vWpiEmLyoXno57Lyl1lWNwffP3Rc2tcXuQMiLKYbl4d8h6a2nBfEtl7xUkScZg4j5dvDAHTY8oOos/oBM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790006063;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=OGTxG2oVwgVmmQXCyhauY5aLJERWACnLUbauLJungFQ=;
	b=exKmfr7oIJcDNpqQCMBp9rrgcLlUYiMSTfS9nfwLh86y6S65UZLHp+fvhIiEWCHG
	TEEShdoUxY6van1eWLJKYcgd6yQulWugGCzWbYog1ny7I1guaz6OnP2GgXzs7aAvYnM
	t660TgiABNqt77I6LKuUOhvbTs9Dt9lx4mAyWIKk=
Received: by smtp.zohomail.com with SMTPS id 1790006061638752.154553168372;
	Mon, 21 Sep 2026 08:54:21 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 21 Sep 2026 17:51:51 +0200
Subject: [PATCH RFC 25/25] drm/atomic: Disable VRR in helper_set_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vrr-limiter-uapi-v1-25-2fcd7d011646@collabora.com>
References: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
In-Reply-To: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
 Leo Li <sunpeng.li@amd.com>, Daniel Stone <daniels@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Derek Foreman <derek.foreman@collabora.com>, 
 wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_085456_642933_7AFFE9B1 
X-CRM114-Status: UNSURE (   8.58  )
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

The in-kernel DRM clients do not know how to deal with VRR properties.
This means that a DRM client that does, exits, and does not clean up
after itself, will leave the KMS fbdev console non-functional.

Address this by simply setting crtc_state->vrr_enabled to false in
__drm_atomic_helper_set_config.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_atomic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 9bb761eda59f..1d3c35f7788e 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -2051,6 +2051,8 @@ int __drm_atomic_helper_set_config(struct drm_mode_set *set,
 
 	crtc_state->active = true;
 
+	crtc_state->vrr_enabled = false;
+
 	ret = drm_atomic_set_crtc_for_plane(primary_state, crtc);
 	if (ret != 0)
 		return ret;

-- 
2.55.0


