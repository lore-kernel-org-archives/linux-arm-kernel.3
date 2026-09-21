Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA9DC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53MU4wodU5McFdFA8f4erFf1XjxuC7banbaoGYK3RK8=; b=L/ll4lL3ekwlZ0isiTKe0GYYgv
	+bd/g7bEg2WICCht5YXqiWbP6uOpU/iSLKVlB3dMrAUaPWb9NtqxO+SBUqFWq5rxGZPEfsrdYBrDd
	NE8gshTqnGK63Bu7i2XSm9xF+Onf8WfZH2126L5Pg11118utKABOKfoXooepZU8WxL9xbspan7NRO
	PAHmvNKeZsISmCERlSHWRIYwje+cUqVqDp3dhohoII4c0ZeUq0JK2+4V+fecySuSR6dlQSDoNcEbz
	w8AfvEYmS0LqTs4M8zTMVrbiiKm7N1XJ0Skkg4/hbePESzGY9xQU3nPmCtS0ALoeRB9WD7xGf8H3g
	CY+4DbKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gLZ-00000002iew-22e8;
	Mon, 21 Sep 2026 15:54:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gLF-00000002i6i-0eOK;
	Mon, 21 Sep 2026 15:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=53MU4wodU5McFdFA8f4erFf1XjxuC7banbaoGYK3RK8=; b=I6nZTlPgVD6ljZ9js+JvjnkbUA
	PQyCfRMZ+/gYphARWR0UsFO5X2cPWrVM02CNhAYCwlcVtqlenA/ErnOei/r5j8DMGewcFMJ2aHi/6
	fQxUBWvqn5mkuj/jExUBhqLjCir3sNYkxXwHmn/NNFybmk92Q2QrAb2X3RlkP/Y9YpDMqzMYWUYoP
	l5pEfF1t7pg3kUri94HdlGxTOq4AMIMNzuH62yO1JieT1/I1IhG50cbE3ZvjIiaC5KVszcTWfCwRa
	Izc60F5RW0jlMv1E98E3OCESYZEF5KC0ciH0fwylQB/UazN/yRPefq5aLE8aQ8ELOJRY+pbW/WSQo
	i66QyMww==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8gLB-0000000CVXY-2cUg;
	Mon, 21 Sep 2026 15:54:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790006007; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ngcSx7tEb9T4eSKiUPia8xy5VnT8S4gMkwpOI5+/OKpbDFPTx/YwY5JO5tyldcqZjCXry6MhYEddp6UvxdiDznsK70yz4KmeB6jZMjgP4kKJS6ucjl2mtaFG7+cERrw4DfcGV9I7c2KUixhvLqqISWiuDt1SD+f9TMn4MLXTvlE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790006007; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=53MU4wodU5McFdFA8f4erFf1XjxuC7banbaoGYK3RK8=; 
	b=OhC+ygNeEbKIliqfx1Igb0yeYHO1//55xpLvxp6mJkmDEMBmx5Aa/fNuCxXtkmz+qz5La+TzzoaF1+lodk9bR19T4xBJg6UN1mVmiLhMmgI6sxhbvxCa5n9+AuGrA0Ullr3WMcN8xxYufJJuD7P0qlinz2NV1TXHKJgIJWSfm/4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790006007;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=53MU4wodU5McFdFA8f4erFf1XjxuC7banbaoGYK3RK8=;
	b=a3AaHo/UK2z7zkPs7JYtVfyLRknGywm+GDwp4vuHtWfHl2Ilvs9ny5uzGEAlOnCc
	gHTB1XdD2Y9vG7rYo9xkTMg2zIaaOJIP6+eUTtlNM7WSZKQCw1g8QeqQ3GsIITqlqcm
	w+Y6aLF953pelao+OvCTaLu0o5cq23i1+mGcK7xA=
Received: by smtp.zohomail.com with SMTPS id 1790006006273303.45353173764124;
	Mon, 21 Sep 2026 08:53:26 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 21 Sep 2026 17:51:41 +0200
Subject: [PATCH RFC 15/25] drm/edid: Parse QMS flag from HDMI SCDS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vrr-limiter-uapi-v1-15-2fcd7d011646@collabora.com>
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
X-CRM114-CacheID: sfid-20260921_165402_296329_1A9813B3 
X-CRM114-Status: GOOD (  11.72  )
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

Thanks to a GPL'd source code release from a hardware vendor that shall
not be named, which has since been scrubbed off GitHub, it's now public
knowledge how the HDMI Forum EDID extension communicates support for QMS
("Quick Media Switching") on a sink. Bit number 6 indicates support for
QMS in the same byte that also contains the CinemaVRR flag.

Add this definition to the EDID header file, and parse it to a member of
drm_hdmi_info.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_edid.c  | 1 +
 include/drm/drm_connector.h | 3 +++
 include/drm/drm_edid.h      | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index cc6f2ba8c9f4..5a7d3b7e65da 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6318,6 +6318,7 @@ static void drm_parse_vrr_info(struct drm_display_info *info, const u8 *hf_scds)
 		return;
 
 	info->hdmi.cinema_vrr = !!(hf_scds[8] & DRM_EDID_CINEMA_VRR);
+	info->hdmi.qms_capable = !!(hf_scds[8] & DRM_EDID_QMS);
 
 	if (pld_len < 10)
 		return;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index b147b8474f1a..c97cf0625fda 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -386,6 +386,9 @@ struct drm_hdmi_info {
 
 	/** @cinema_vrr: The sink supports "CinemaVRR" */
 	bool cinema_vrr;
+
+	/** @qms_capable: The sink supports Quick Media Switching */
+	bool qms_capable;
 };
 
 /**
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index a2617aa34edf..f1e2052cb08b 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -265,6 +265,7 @@ struct detailed_timing {
 #define DRM_EDID_CNMVRR				(1 << 3)
 #define DRM_EDID_CINEMA_VRR			(1 << 4)
 #define DRM_EDID_MDELTA				(1 << 5)
+#define DRM_EDID_QMS				(1 << 6)
 #define DRM_EDID_VRR_MAX_UPPER_MASK		0xc0
 #define DRM_EDID_VRR_MAX_LOWER_MASK		0xff
 #define DRM_EDID_VRR_MIN_MASK			0x3f

-- 
2.55.0


