Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636ACFDEE45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 19:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQtceYjF+45uWREVwWUPbe4XSHEMsSoK2/IY04gEcjA=; b=eoFd23Sp3DlUnWnpPk0CruNDah
	33deJYCZtITqcnNbQ4gGI/Qp47ngqwCEVAgKFtj4Hnofa2b+pteOv3JhFBs/LSklOlFN+Ohs7huti
	qyQQEin/bzAWh3W0QDSlUGdzownZJv4+gOeazLr8xIl+nmZb70bEmc3YKfiydans71OpuGJQSd4lv
	yEXHkZ6BeHYV6Dcr6iosa4hsVlo52J3Y6X8rt8JOmZBSJaCTnZFDbZNb2z26Hv6v1x5GHq3Qg9I+G
	0VYnc7uAaVo4ck39tHT/ZEQa/z9c/99u5MD2pNkK5e7WdQx1d6MTu4M1k+dR2VgGnlIqOZASK9Hm5
	pWOkzFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFzPG-0000000CCbe-10iV;
	Thu, 23 Apr 2026 19:08:10 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFzOx-0000000CCGl-3E3W;
	Thu, 23 Apr 2026 19:08:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1776971238; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LZFYuvIpdzTb+OTMQtDpV6yUzQpTtfpJJXBGpekI8S2QjyujH2T4vhk0DF32zYZxaXGdnr95NSgGGjQmx9M9UHQpHOYhB5e4gluk/H5Pmw5SXyCC71tpPFxv69OwPix7KDUnRxJaTR5Qrtht5TGzeiikgjTLvva4smkvv8pSfnU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776971238; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hQtceYjF+45uWREVwWUPbe4XSHEMsSoK2/IY04gEcjA=; 
	b=gGY2f6lforycL37KugN7jAllMAShuEfIasR0A7eh9oV9kzMvclUpj55WlpYg4uEpDRCfIL4UquvuZKjUCj0/ykVaI4aWDmYKP2X3KI3RDyX7qdqpj1YvFPApQqFPe0k+Wmldb1VaafTrao7iYn8b3RyBzDJRSVA9ckKCaPUuKy8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776971238;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=hQtceYjF+45uWREVwWUPbe4XSHEMsSoK2/IY04gEcjA=;
	b=jAY/CM0bOzs8tiicXxXJPvM7WLp5udfhW+mZIkKRO3A9aP3J2g477iQ3IPMa8mw5
	Pii6tCLI31eOR4SoB6VM57mthogItFpYAW0VvcdJ4Ax8x/CFKKxuio2ABILpNR5Sw7Z
	tBZVRzaw6yxH/WHJ+N0QE8wV9Cd/WBv1Kc2Bdc4E=
Received: by mx.zohomail.com with SMTPS id 177697123670449.67616514671079;
	Thu, 23 Apr 2026 12:07:16 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Apr 2026 21:03:50 +0200
Subject: [PATCH v14 27/28] drm/bridge: Document bridge chain format
 selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-color-format-v14-27-449a419ccbd4@collabora.com>
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
In-Reply-To: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_120751_919618_8B010DBF 
X-CRM114-Status: GOOD (  17.54  )
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

The bridge chain format selection behaviour was, until now,
undocumented. With the addition of the "color format" DRM property, it's
not sufficiently complex enough that documentation is warranted,
especially for driver authors trying to do the right thing.

Add a high-level overview of how the process is supposed to work, and
mention what the display driver is supposed to do if it wants to make
use of this functionality.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/gpu/drm-kms-helpers.rst |  6 ++++++
 drivers/gpu/drm/drm_bridge.c          | 40 +++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index b4a9e5ae81f6..bf5a9d909cf3 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -169,6 +169,12 @@ Bridge Operations
 .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
    :doc: bridge operations
 
+Bridge Chain Format Selection
+-----------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
+   :doc: bridge chain format selection
+
 Bridge Connector Helper
 -----------------------
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 3843d45a82cb..8ddac8424163 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -198,6 +198,46 @@
  * driver.
  */
 
+/**
+ * DOC: bridge chain format selection
+ *
+ * A bridge chain, from display output processor to connector, may contain
+ * bridges capable of converting between bus formats on their inputs, and
+ * output formats on their outputs. For example, a bridge may be able to convert
+ * from RGB to YCbCr 4:4:4, and pass through YCbCr 4:2:0 as-is, but not convert
+ * from RGB to YCbCr 4:2:0. This means not all input formats map to all output
+ * formats.
+ *
+ * Further adding to this, a desired output color format, as specified with the
+ * "color format" DRM property, might not correspond 1:1 to what the display
+ * driver should set at its output. The bridge chain it feeds into may only be
+ * able to reach the desired output format, if a conversion from a different
+ * starting format is performed.
+ *
+ * To deal with this complexity, the recursive bridge chain bus format selection
+ * logic starts with the last bridge in the chain, usually the connector, and
+ * then recursively walks the chain of bridges backwards to the first bridge,
+ * trying to find a path.
+ *
+ * For a display driver to work in such a scenario, it should read the first
+ * bridge's bridge state to figure out which bus format the chain resolved to.
+ * If the first bridge's input format resolved to %MEDIA_BUS_FMT_FIXED, then its
+ * output format should be used.
+ *
+ * Special handling is done for HDMI as it relates to format selection. Instead
+ * of directly using the "color format" DRM property for bridge chains that end
+ * in HDMI bridges, the bridge chain format selection logic will trust the logic
+ * that set the HDMI output format. For the common HDMI state helper
+ * functionality, this means that %DRM_CONNECTOR_COLOR_FORMAT_AUTO will allow
+ * fallbacks to YCBCr 4:2:0 if the bandwidth requirements would otherwise be too
+ * high but the mode and connector allow it.
+ *
+ * For bridge chains that do not end in an HDMI bridge,
+ * %DRM_CONNECTOR_COLOR_FORMAT_AUTO will be satisfied with the first output
+ * format on the last bridge for which it can find a path back to the first
+ * bridge.
+ */
+
 /* Protect bridge_list and bridge_lingering_list */
 static DEFINE_MUTEX(bridge_lock);
 static LIST_HEAD(bridge_list);

-- 
2.53.0


