Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF09C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSgBlPaazMWThLQxRccKboWgimwqe5RrJvSFqr1YUfY=; b=2jP6YBRGHjHogMSUsfMxf/3n/m
	3lXYFGnSR2yoqFVsWx7Cngp5P6t0Nn5CdB1cP3JFyxKzI7fFDW6iLDwTCyK6EHK8MvaTJ8w+4SP4d
	ukAf9yicg2Kdm5rE+WTDlZvGVkC2h4vpfnGIFBKmxv/KkjFsnkcjEH9b5q7oA6LMQbTyCvjf9gVZ2
	h221tDevvkfbTSKq3YTf736T8ViNabHl5U+AG937toRKTywaZMwam3WiAmyRTv+ifJgvt+295Orz2
	Zocbg7fGo0PKWCOvJZu4Ep/S8tRpmOtv1XSM5i3rOsBSR44uJxWoOwsmu2q6OnozsiaNiRDlihLvI
	AilOPDrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gKk-00000002heE-3dlT;
	Mon, 21 Sep 2026 15:53:34 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gKS-00000002hO1-1ZCZ;
	Mon, 21 Sep 2026 15:53:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790005957; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=beMzLIihiAxRjocBPr3aCVxfqMlKF6jkyg4f26p+VvrEUfDJeu2UdaFtUmJASqVy2gNRcF23dS3PRb/77JJllZ2eW+5b1GCI6rmRaY8kXCq9GeFm4E3LdhMaROfHR7WZXjNZ9NZJ8pg/tdnW0TA43zITBnDiMYbP/CCj6jIWXgI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790005957; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NSgBlPaazMWThLQxRccKboWgimwqe5RrJvSFqr1YUfY=; 
	b=LRsoAa6nE5g9sCkL8NKvVS9QE7QDxrbMyERS++oRbtvqhoyxooMTVj6jJ/5ZxQDVQDqoedyoHLNjatcb12V0CX4joAeYij5nQ1BstZFLfLmaQVxc35xJF+hHuCQuyiRdRW77S/3XEzORHIak9w4VNMQt+j6SIDwgDiz1A/Jj9VA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790005957;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=NSgBlPaazMWThLQxRccKboWgimwqe5RrJvSFqr1YUfY=;
	b=AIec5rfwJnUWzqFY3jEIaG9P3LMqSFKgmjeuwplyo8oepFDQZD08gT7UIqDfcjW7
	KfeFWUUQx9/7igjo+Zd0LzVVdc7y3pxTrxQhGkuo7qH2Z91wLTOKLKgzyxqX5g6ubve
	9anHKgesNAf1jdt7QcN+XHzrup9TUTtB5Y8aEhJ0=
Received: by smtp.zohomail.com with SMTPS id 1790005955159213.84382542019796;
	Mon, 21 Sep 2026 08:52:35 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 21 Sep 2026 17:51:32 +0200
Subject: [PATCH RFC 06/25] drm/connector: hdmi: Add VTEM EMP generation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vrr-limiter-uapi-v1-6-2fcd7d011646@collabora.com>
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
X-CRM114-CacheID: sfid-20260921_085316_499498_FE1D61A8 
X-CRM114-Status: GOOD (  12.66  )
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

From: Derek Foreman <derek.foreman@collabora.com>

Add VTEM EMP generation to enable variable refresh rate signalling over
HDMI.

These infoframes are only generated if the sink supports VRR.

Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 60 +++++++++++++++++++++++++
 include/drm/drm_connector.h                     |  5 +++
 2 files changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index d55548399687..33d0c9491643 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -853,6 +853,56 @@ static int hdmi_generate_hdmi_vendor_infoframe(const struct drm_connector *conne
 	return 0;
 }
 
+static int hdmi_generate_emp_infoframe_vtem(const struct drm_connector *connector,
+					    struct drm_connector_state *conn_state)
+{
+	const struct drm_display_info *info = &connector->display_info;
+	const struct drm_crtc_state *crtc_state =
+		drm_atomic_get_crtc_state(conn_state->state, conn_state->crtc);
+	struct drm_connector_hdmi_infoframe *infoframe =
+		&conn_state->hdmi.infoframes.vtem;
+	struct hdmi_emp_infoframe_vtem *vtem =
+		&infoframe->data.vtem;
+	const struct drm_crtc_vrr_state *vrr = &crtc_state->vrr_state;
+	int vfront;
+
+	infoframe->set = false;
+
+	if (!connector->hdmi.funcs->vtem.write_infoframe)
+		return 0;
+
+	if (!info->hdmi.vrr_capable)
+		return 0;
+
+	hdmi_emp_infoframe_vtem_init(vtem);
+	if (!crtc_state->vrr_enabled || vrr->vic) {
+		vtem->base_refresh_rate = 0;
+		vtem->base_vfront = 0;
+	} else {
+		vtem->base_refresh_rate = drm_mode_vrefresh(&crtc_state->mode);
+		vfront = crtc_state->adjusted_mode.crtc_vsync_start -
+			 crtc_state->adjusted_mode.crtc_vdisplay;
+		if (vfront > U8_MAX || vfront < 0)
+			return -EINVAL;
+
+		vtem->base_vfront = vfront;
+	}
+	vtem->fva_factor_m1 = 0;
+	infoframe->set = true;
+
+	if (!crtc_state->vrr_enabled) {
+		vtem->m_const = false;
+		vtem->game_vrr_en = false;
+		return 0;
+	}
+
+	vtem->game_vrr_en = true;
+
+	vtem->m_const = !vrr->dynamic;
+
+	return 0;
+}
+
 static int
 hdmi_generate_infoframes(const struct drm_connector *connector,
 			 struct drm_connector_state *conn_state)
@@ -884,6 +934,10 @@ hdmi_generate_infoframes(const struct drm_connector *connector,
 	if (ret)
 		return ret;
 
+	ret = hdmi_generate_emp_infoframe_vtem(connector, conn_state);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -1494,6 +1548,12 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *con
 			goto out;
 	}
 
+	if (info->hdmi.vrr_capable)
+		ret = write_or_clear_infoframe(connector,
+					&funcs->vtem, "VTEM",
+					&old_conn_state->hdmi.infoframes.vtem,
+					&new_conn_state->hdmi.infoframes.vtem);
+
 out:
 	mutex_unlock(&connector->hdmi.infoframes.lock);
 	return ret;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index e561a444515f..6e431eb81705 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1180,6 +1180,11 @@ struct drm_connector_hdmi_state {
 		 * matching our state.
 		 */
 		struct drm_connector_hdmi_infoframe hdmi;
+
+		/**
+		 * @vtem: VTEM EMP infoframes structure matching our state.
+		 */
+		struct drm_connector_hdmi_infoframe vtem;
 	} infoframes;
 
 	/**

-- 
2.55.0


