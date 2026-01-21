Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF63C4453F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 13:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvJgPMT+HU5WR06OrKvq+eql2T6omfgWB+OE+x/UWsw=; b=DUxK/9xlJ93HW8sKmwWST/nB4B
	2WoZMYAGUBAccJow5qULYgOr1rNwaYALupStOokjgxxrq8NZYaJLFsPBvnP5X1dzO1K61lsaH8XSd
	ZBjcjnl4anNjzyhehJIn1tvAX9upqW09Pe4U+ftCd+tLBiTP1hCuvO692SIbGWnfHSwjphLRE3D0M
	JFpHWVV2m5KV+086AhtzqZFDY+nXMAmX8ASSxbQobqHHfgE9tLKP5F7OU1bvZ/hgnNMvbuMmz+ufG
	yh7o2/ZKqDUM6KkWUC6mZ0HMFEYPHzrHxPh1Ae5WhOwYtxYyh22Kq5IYsbttua+CirQzYOeC73kX0
	65ru9c7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYY9-00000005VdN-3i2S;
	Wed, 21 Jan 2026 13:47:09 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYY6-00000005VaU-3tTa;
	Wed, 21 Jan 2026 13:47:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769003195; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QrIkvXjY2DTWhmA5EyZ+VZyphcWkLLrdMBwFscvVw6G9Rn313eZZ7Y2smyAUujBR6iU6FxfHjDU4PrMOV+MCpOCk4vsmXUZUqMgwzCK4ifASRwKWY2k5CEYIOUxap59GiOj36pBbr+Ca8lir/KEZobt5zviH07LeP8XtmT2OMNE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769003195; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rvJgPMT+HU5WR06OrKvq+eql2T6omfgWB+OE+x/UWsw=; 
	b=nowNrHCKZoM2GXi37P3HHv6tfqy5pnyrADbEJqbjXJQK6SU2TShVwqaUuREm2Ya23ICjz/J0pIqfjw/8X42utrk/nLzz54isZBn06rPCsifikGVoK5XAVmG4Lay/vYw0inyeC9l8CjMUXfK3XacqMqDOGAZEShupoK1w1LySfBM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769003194;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=rvJgPMT+HU5WR06OrKvq+eql2T6omfgWB+OE+x/UWsw=;
	b=PEODl+ITwKP6GlpLs9KULhubv61COnr4rsvAnEtSJ9A6w7WazZ1k+f44XwU3VMjb
	UTLI5L2C3SheqRh0V96GIw7BpH9Y2M5jyucR6zvZOLn7MhKxKr18Iw1BB1pBFTxbC/6
	Hri6EUJGtqNA5hauWpzVIbDsAjWKuLiokHLgNYWY=
Received: by mx.zohomail.com with SMTPS id 1769003192738497.97478706047036;
	Wed, 21 Jan 2026 05:46:32 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 21 Jan 2026 14:45:31 +0100
Subject: [PATCH v6 05/21] drm/display: hdmi-state-helper: Act on color
 format DRM property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-color-format-v6-5-7b81a771cd0b@collabora.com>
References: <20260121-color-format-v6-0-7b81a771cd0b@collabora.com>
In-Reply-To: <20260121-color-format-v6-0-7b81a771cd0b@collabora.com>
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
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_054707_029767_51D2034A 
X-CRM114-Status: GOOD (  13.11  )
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

With the introduction of the "color format" DRM property, which allows
userspace to request a specific color format, the HDMI state helper
should implement this.

Implement it by checking whether the property is set and set to
something other than auto. If so, pass the requested color format, and
otherwise set RGB.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a1d16762ac7a..1ea3b9c93aa5 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -649,11 +649,21 @@ hdmi_compute_config(const struct drm_connector *connector,
 	unsigned int max_bpc = clamp_t(unsigned int,
 				       conn_state->max_bpc,
 				       8, connector->max_bpc);
+	enum hdmi_colorspace hdmi_colorspace =
+		drm_color_format_to_hdmi_colorspace(conn_state->color_format);
 	int ret;
 
 	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
-				      HDMI_COLORSPACE_RGB);
+				      hdmi_colorspace);
 	if (ret) {
+		/* If a color format was explicitly requested, don't fall back */
+		if (conn_state->color_format) {
+			drm_dbg_kms(connector->dev,
+				    "Explicitly set color format '%s' doesn't work.\n",
+				    drm_get_color_format_name(conn_state->color_format));
+			return ret;
+		}
+
 		if (connector->ycbcr_420_allowed) {
 			ret = hdmi_compute_format_bpc(connector, conn_state,
 						      mode, max_bpc,

-- 
2.52.0


