Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50161F31E42
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 15:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6mnIoMwQGSuHjHjLVfRnXnzAB6xS7ZmlkuOJOt+Ckg=; b=DcC7buLJDHO9ymEaNFfcMWeqiq
	bktq1ETo5gAXVR4XghcMzoTCzvJ8yA1pm7ZKAPT7ABX32LPgDB+tqGU9s35q1fknyqCit5NnDZU1y
	NszY3OBACCOha99vuZGDykyIpkPTTiuJb77PRdMjxQCp1jupYmdw3LRTD9R2xQIxA/a0Jpfp8YirR
	brgCYvcbKFuj6wGHJH/ZtbQroP2EERUoZdVgdJENQlCLYkJjtByhHOXq5qCm0zMTApKuhdkCBrmi+
	WDbVCV8yz74H0/1Yyji0bsFxOTfvZqLVynGPhR5gGHXf/Bwi3WtchTQ7N3ItCszit+aunxCjT7Qv0
	Bn/ykhEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArbN-0000000Apxj-048x;
	Thu, 09 Apr 2026 15:47:29 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArbK-0000000Aput-3ybp;
	Thu, 09 Apr 2026 15:47:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1775749612; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k5wsHZqs8L+oKRgVRkY8cPiIOySNMwHwWkx4c0922ZaauxvbHMFPU9pbeeexvl/BIofV5KA+Y04brvzxKTwE3ZaZqutVb8m3QyN5ik0ziYMZS9m8ATlDGEVLgZC4yxQWLaPjghi12txbQfcjFzJEx/5aRii+kfmO6H1E7gZf/5A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775749612; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=I6mnIoMwQGSuHjHjLVfRnXnzAB6xS7ZmlkuOJOt+Ckg=; 
	b=bw7dZk18klANxrdlYQ33B1dnq81pbOWKx4zFCQYROK8pacU4JMvvd5vXGLGZeBM1sSF+l7jhHRyIIXt9zxLqvoNkcacBP1cMbImwoOrBN4jRUvdCqrU4cfqSH90meCZLBwKq1rB14m5fdEToBItnyVnzzDzrK991zcXNB3tVy5g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775749612;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=I6mnIoMwQGSuHjHjLVfRnXnzAB6xS7ZmlkuOJOt+Ckg=;
	b=i/Ob1r1CUogmn8cyQXldTZMcHG0YKvmwzRswzISCIRtBwWqPUsfEXewpEU01egsQ
	Ji1xsGGKx7C/y0BUI5glB8BTeVgYAeRoJNdflFEjO4ILvHAwrW6KY57I2IHCBwQR3va
	BwdqafmrcL2OH/e+vt00GjR4qhiE5fuLEH+D/kaw=
Received: by mx.zohomail.com with SMTPS id 1775749611020224.4611688699132;
	Thu, 9 Apr 2026 08:46:51 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 09 Apr 2026 17:45:02 +0200
Subject: [PATCH v12 12/25] drm/rockchip: Add YUV422 output mode constants
 for VOP2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-color-format-v12-12-ce84e1817a27@collabora.com>
References: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
In-Reply-To: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
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
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Andy Yan <andyshrk@163.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_084727_049470_666AAFDB 
X-CRM114-Status: UNSURE (   9.57  )
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

The Rockchip display controller has a general YUV422 output mode, and
some SoC-specific connector-specific output modes for RK3576.

Add them, based on the values in downstream and the TRM (dsp_out_mode in
RK3576 TRM Part 2, register POST*_CTRL_POST_DSP_CTRL).

Reviewed-by: Andy Yan <andyshrk@163.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
index 2e86ad00979c..4705dc6b8bd7 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -30,10 +30,14 @@
 #define ROCKCHIP_OUT_MODE_P565		2
 #define ROCKCHIP_OUT_MODE_BT656		5
 #define ROCKCHIP_OUT_MODE_S888		8
+#define ROCKCHIP_OUT_MODE_YUV422	9
 #define ROCKCHIP_OUT_MODE_S888_DUMMY	12
 #define ROCKCHIP_OUT_MODE_YUV420	14
 /* for use special outface */
 #define ROCKCHIP_OUT_MODE_AAAA		15
+/* SoC specific output modes */
+#define ROCKCHIP_OUT_MODE_YUV422_RK3576_DP	12
+#define ROCKCHIP_OUT_MODE_YUV422_RK3576_HDMI	13
 
 /* output flags */
 #define ROCKCHIP_OUTPUT_DSI_DUAL	BIT(0)

-- 
2.53.0


