Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E73FDEE43
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 19:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2O+6hWqat3vHvvpJQfgGLUYsjv/ArmH9e/e7Vz/G5I=; b=ng2gSELS5u++VKVlri0DpfOBKj
	JJIXz8owxdOA5G9BAl05dFGF5e5+qrLYYKZv9PI3Ub3bpgQ5f8DYUcXk733d/5Z0QppHbLWjWKYPI
	cphA1QfRR9PsKJN9utw0ceO568N5RgnUuOzTjVUDU+1Uk8z2GfuNONZDsZY2zY9TytiuhassbQtAq
	Qswz7Ob8gJ/z0s9APVD4Qr48603+9HyLeJPbk9NOjEOwYXnUat7rWa72ndgMGUeHLIAtNFLJ5SEGB
	DnaOhEnGmpveA4fc4OP6Q9mGc6bQUr7AwniLzKn4jPDfIsIORQ48jVh54GyvYCRNpCWGyRlScnOBE
	dt3lIanw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFzNH-0000000CAh6-1iot;
	Thu, 23 Apr 2026 19:06:07 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFzN7-0000000CAZl-2pbK;
	Thu, 23 Apr 2026 19:06:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1776971126; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=luxMYwlJapgNpSTWalXuwaUSLXCZE5rLhijiTaLRDgGTAwWuRzVNKufoheglGh0wue2yB5G/Nb/SQiGQscpPWhSelOHwwZL88GKpkrbec+7bRUyIL6RnQs8TpOSqxylsrojzkwKyYDNTLA0gv31OOSlWaInjki4woYIqL4zZRcA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776971126; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=L2O+6hWqat3vHvvpJQfgGLUYsjv/ArmH9e/e7Vz/G5I=; 
	b=QU7lTUagdleL1ZOonrTMhNcwC1fsYzE8L7ZENxDEQTqMBP20qiMYaBDAMv3WnrqycmATeyk2ue4OKqCOe8eJEcCvQEe4WuI+1DG/svnJInbhlh4y6g87VxSH6Irax2eVDxRcQBTi9j8LrZI4b0bKHekytLxbs/Gl3W97sJt0XmA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776971126;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=L2O+6hWqat3vHvvpJQfgGLUYsjv/ArmH9e/e7Vz/G5I=;
	b=R732dx7uxGMhFECtEbtLe0Z3P/zJV7NuZc9r+To3TgEUQAEFt6lVWLdSkcuQ/yQ/
	2wbUZ3zkrGULHLplaF5krHkdrPMalHMBvqwrVdntiiw88Jr2Ir3u3/K7dm6gmYIzAtU
	Wb4bm0pswOWUqyxV1MB3RmR2hYBLwcqPy1e0HkvY=
Received: by mx.zohomail.com with SMTPS id 1776971125012965.5568652865181;
	Thu, 23 Apr 2026 12:05:25 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Apr 2026 21:03:35 +0200
Subject: [PATCH v14 12/28] drm/i915/dp: Add YCBCR444 handling for sink
 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-color-format-v14-12-449a419ccbd4@collabora.com>
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
X-CRM114-CacheID: sfid-20260423_120557_786650_A5CC9C6E 
X-CRM114-Status: UNSURE (   9.79  )
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

In anticipation of userspace being able to explicitly select supported
sink formats, add handling of the YCBCR444 sink format. The AUTO path
does not choose this format, but with explicit format selection added to
the driver, it becomes a possibility.

Check for both source and sink support of YCBCR444 in
intel_dp_sink_format_valid.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 35b8fb5740aa..299b91d262c3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1344,6 +1344,20 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 					 8, sink_format, true);
 }
 
+static bool
+intel_dp_can_ycbcr444(struct intel_dp *intel_dp)
+{
+	if (source_can_output(intel_dp, INTEL_OUTPUT_FORMAT_YCBCR444) &&
+	    !drm_dp_is_branch(intel_dp->dpcd))
+		return true;
+
+	if (source_can_output(intel_dp, INTEL_OUTPUT_FORMAT_RGB) &&
+	    dfp_can_convert_from_rgb(intel_dp, INTEL_OUTPUT_FORMAT_YCBCR444))
+		return true;
+
+	return false;
+}
+
 static enum drm_mode_status
 intel_dp_sink_format_valid(struct intel_connector *connector,
 			   const struct drm_display_mode *mode,
@@ -1364,6 +1378,13 @@ intel_dp_sink_format_valid(struct intel_connector *connector,
 
 		return MODE_OK;
 	case INTEL_OUTPUT_FORMAT_RGB:
+		return MODE_OK;
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444)))
+			return MODE_BAD;
+		if (!intel_dp_can_ycbcr444(intel_dp))
+			return MODE_BAD;
+
 		return MODE_OK;
 	default:
 		MISSING_CASE(sink_format);

-- 
2.53.0


