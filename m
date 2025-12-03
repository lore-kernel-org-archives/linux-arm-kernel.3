Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDDDD1BDCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 18:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hZg2aFfZ0Qj0BMxD+iLMPJrJzJvqfJ8njpJ8CCNogUM=; b=rGT2JYJJNjPEl6
	1A6Oc7pwvdKypLK5IDGlrNDyYbFAv3MxcFVEBE9II+dh7FqKvLLGXB/LQ17J8V1Cn5yXGqB7IyhO0
	W7UyxnrgbOVG3BfXx7Qi/ZZV2JX/Rt4+a7jRfxytstRBoUROHlXNrP3cZrbiezPblGHDrfvcYdILY
	X/umO2+MnErAG+7IsVroSNlHmH0paC0QQNQdZ7kHK5LW+859Hnu48uFjjg1Wwi7QYA1LRHUCn6an4
	8QamxwiBrGpam0kyV68/IqBJxajBSJmLwGfZ1Q76GdXrDjFNy3qN1PJBdrMPqs/wnHcdZE0WO1GBO
	pwmq+WIv9tgmKPDf0piQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQray-00000006vpq-0HlT;
	Wed, 03 Dec 2025 18:28:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQrav-00000006voL-43Gy;
	Wed, 03 Dec 2025 18:28:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764786529;
	bh=udSJwwXwBFZjbQtJenJ0sbprvwc3rZuZzFk1UVTG5P0=;
	h=From:Subject:Date:To:Cc:From;
	b=IIHso8Ku5GjXwp8O5a2Rkp3N7O/VS0gV2TMybw97A3JWsGItHADQpi95QROpQqb4e
	 kf2IeBr3I1vknihJvYfmfdgrQF9YBPisAjyZe07j8ZCB/d6aU4UuXXcGwDiUrIUXva
	 az9z9Co9DXcnKWTa0xJCZ035hnWXzUYOtipvx+DW1SIc7uByJSPJiiJWqO1aOt6446
	 Nu+oym6wSCZEDMZLsGxK7/u4dd7sxbDxjSJWDm+UtaCIjewLl46Jpb4pjdtHix6vot
	 In0gPNwRit0XYRIMXwBjur9SfX0SAo6QdObdADzt77VnhjxtYlv+380NSRBKws8tTI
	 z3e5awJcHZpcA==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C449917E0117;
	Wed,  3 Dec 2025 19:28:49 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/4] Add HDMI 2.0 support to DW HDMI QP TX
Date: Wed, 03 Dec 2025 20:27:51 +0200
Message-Id: <20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACeBMGkC/x3MSQqAMAxA0atI1gZqRRyuIi5skmoWTi2oIN7d4
 vIt/n8gSlCJ0GUPBDk16rYmFHkGNI/rJKicDNbYqrCmRL5w5kXx2DFSGBeHxI4bV9VEvoXU7UG
 83v+zH973A5G+bTVjAAAA
X-Change-ID: 20251203-dw-hdmi-qp-scramb-cdbd8b57ccf9
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_102854_216382_1D3AAF13 
X-CRM114-Status: UNSURE (   9.61  )
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

This patch series provides the missing support for high TMDS clock ratio
and scrambling to DW HDMI QP TX library, required for handling HDMI 2.0
display modes on RK3576 & RK3588 SoCs.

In order to allow addressing the SCDC status lost on sink disconnects,
it adds an atomic variant of the drm_bridge_funcs.detect callback and a
new drm_bridge_detect_ctx() helper, which is further used in
drm_bridge_connector to switch to ->detect_ctx hook.

Furthermore, optimize HPD event handling in dw_hdmi_qp Rockchip platform
driver to run the detect cycle on the affected connector only.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (4):
      drm/bridge: Add ->detect_ctx hook and drm_bridge_detect_ctx()
      drm/bridge-connector: Switch to using ->detect_ctx hook
      drm/bridge: dw-hdmi-qp: Add high TMDS clock ratio and scrambling support
      drm/rockchip: dw_hdmi_qp: Do not send HPD events for all connectors

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 174 +++++++++++++++++++++++--
 drivers/gpu/drm/display/drm_bridge_connector.c |  73 ++++++-----
 drivers/gpu/drm/drm_bridge.c                   |  58 +++++++++
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  44 +++----
 include/drm/drm_bridge.h                       |  30 +++++
 5 files changed, 308 insertions(+), 71 deletions(-)
---
base-commit: ac5b392a8c355001c4c3f230a0e4b1f904e359ca
change-id: 20251203-dw-hdmi-qp-scramb-cdbd8b57ccf9


