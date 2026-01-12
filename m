Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D8ECF45D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 22:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FcYmnm0ThoGi8HpPBoZ8GjfC985T2EqRqZhLNr6hORk=; b=17xAdgIoN6e/jE
	FRD/raD2DJKrXINSrH9GZNASjeTJuzf1APKDwiJ2UfWMNUa6fA6umXoCwUMqSIOzQkrkm+uFZNlWA
	aGUhO7OpaZ9DimaH+YkL/MgyAiccFXG1C+XeF35z3dWwYjRQJBD0ssyCQY8NtBCI1ThrsGr3yES1N
	gOWwK2COHlj/6pkBb+rBh3EM/u2bynHnY2tywQshlME0M31pnZYiZnzb08crmF1SKjZGqR/QuBcfl
	tN7CJwfmV2Y4d7IzQHtqssHtst0qfvpUH1L2VWbS4cbZB4KzS64jMP5FQwQfA37ALwOr9hlTBNGlP
	rUkOrxG2Ezx/IisnHlXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfQMy-00000006FnK-3dy4;
	Mon, 12 Jan 2026 22:26:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfQMv-00000006FlW-2p57;
	Mon, 12 Jan 2026 22:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768256794;
	bh=TgYUCidDKWv6b2I1M6WbhdnXeMuTPT1duM24nQAyZlg=;
	h=From:Subject:Date:To:Cc:From;
	b=PKj03XzgkwC/BaGrdJQaZl6lDTjl55mcEilEjibuY9NQaAqwg1A5mxKXN/5DzHlZR
	 KivywoZZhIejOUv8q0Pmt+AXkay99Eo8lbFfhA+cvPR81ZiexTFwVzB9+EQSgU3ksx
	 ic02rfNz/jgGtSqLr7jYQyilr+oa4Fn0oYIFQ3taR9TBf9NRIc5QM5Znq3WmgQSAYW
	 46v5ZNtQQMo9g4vao4t5bPxcmrlWWoVocAhKYbf3yYFpx5mO1lUlZ8lhNr7JyO9y5A
	 wb2bRH/IvEcf+lp4wNICVe3Slmd9clOckC3kshh9ARHydFwxDWxRta64hoXG+aA5tW
	 Lb/VSnZnb7vGw==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A67217E0A49;
	Mon, 12 Jan 2026 23:26:34 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/4] Add HDMI 2.0 support to DW HDMI QP TX
Date: Tue, 13 Jan 2026 00:26:17 +0200
Message-Id: <20260113-dw-hdmi-qp-scramb-v2-0-ae7b2c58d24d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAp1ZWkC/32NTQ6CMBBGr0Jm7Zi2yO/KexgW7bTIJECxNagh3
 N3KAVy+l3zv2yC6wC5Cm20Q3MqR/ZxAnTKgQc93h2wTgxKqkErkaF842InxsWCkoCeDZI2tTVE
 R9Q2k3RJcz++jeesSDxyfPnyOi1X+7L/aKlFgnZe9qy5C6rK5kh9HbXzQZ/ITdPu+fwFEpJprt
 gAAAA==
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
 linux-rockchip@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_142637_903930_E3C310DA 
X-CRM114-Status: GOOD (  10.99  )
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

Furthermore, it optimizes HPD event handling in dw_hdmi_qp Rockchip
platform driver to run the detect cycle on the affected connector only.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Collected Tested-by tags from Diederik and Maud
- Rebased onto latest drm-misc-next
- Ensured the recently introduced 'no-hpd' support for dealing with
  unconnected/repurposed/broken HPD pin is limited to HDMI 1.4 rates
- Link to v1: https://lore.kernel.org/r/20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com

---
Cristian Ciocaltea (4):
      drm/bridge: Add ->detect_ctx hook and drm_bridge_detect_ctx()
      drm/bridge-connector: Switch to using ->detect_ctx hook
      drm/bridge: dw-hdmi-qp: Add high TMDS clock ratio and scrambling support
      drm/rockchip: dw_hdmi_qp: Do not send HPD events for all connectors

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 184 ++++++++++++++++++++++---
 drivers/gpu/drm/display/drm_bridge_connector.c |  73 +++++-----
 drivers/gpu/drm/drm_bridge.c                   |  58 ++++++++
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  44 +++---
 include/drm/drm_bridge.h                       |  30 ++++
 5 files changed, 313 insertions(+), 76 deletions(-)
---
base-commit: 38feb171b3f92d77e8061fafb5ddfffc2c13b672
change-id: 20251203-dw-hdmi-qp-scramb-cdbd8b57ccf9


