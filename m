Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CFBEBFD34
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 10:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+F2WuEiqCUVykRB3XRC/Bxq6Gy1eCIr0ZWhVWJ26imU=; b=tNU01rbtL4wWCbFZ6x372r4kXq
	AvnS73QJfokEzh+wqyQ8s5KMZyaoG5TIDXNmeBfDlK0kAoiVe0tFbL2ToA4dC2DTgrEvFIs1jF4fj
	VVJ4F+uZ2B1mL0Rf373wO21ssl25cFJ9fpuLUvy02ebIwXvThOZ5zlwy1FgZz7NHAQ0/72Y4YIX/7
	wT+tKbgnwxOV4lZF+z/S0Ll152h6bm+TF4iL4xCgeisv7rk/Beb6hY9RHnM/vq/lbskZ4cSgulGG3
	qC2crtygYqHr3OAgbZtfNvREJ9pFCzQXUsJc2VeYln2GNlnKC9UX0eA5bXCVlAullNMutjRpQzVOL
	O8D/5lDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEFy-0000000FRlX-33VE;
	Mon, 13 Apr 2026 10:11:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEFw-0000000FRjE-47tU;
	Mon, 13 Apr 2026 10:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+F2WuEiqCUVykRB3XRC/Bxq6Gy1eCIr0ZWhVWJ26imU=; b=VpubgPa4DxyKYgiUhNnJoccxqn
	8/mm/4CGdv/WTDR0FRREGN27VrCgHUdzJAw96K4LuhbATQF/ZTP5jMDLuDBjNAzA1q5x28LDGVqB0
	xIJ8walWhawGdxDDavghWk5HpSY/owV7eAH7Cm086pQUMtQyTeCvBk5jgS0zjW0L1zfxp5Z4rAfjv
	o0kXSU6OZL6pjpLQLidpFwHqkaBn+Y+TLUpze57C6T6WgRl+ItcT/s/ULlkh+Tm9T2K6arp7ikYjS
	YlX9Sca8vjoQ0De3/73gpxo3Z6I/r/QmyGg49SwphUk+Rs8E1SeTzlTWWoBncVixi167fTMFcI886
	qO/N4eGQ==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEFt-0000000GYzq-3wz3;
	Mon, 13 Apr 2026 10:10:59 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1776075021; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SWgG4dkMV1vO8gYvVBR9m/1IPoZwhBbTNpJ5SWgGlocTx6eV8sRy+EvjBpRwchuOaT9Fp/p8wrmA1xEJnEeHQgZHEjvLML9BrhLMV7Ff9GZ3W4i0GSGIANVOLqW5EpVl48a9Irq3zUS9UQOokPVWpu2e76N2bJNWSBzndGOWSfg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776075021; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+F2WuEiqCUVykRB3XRC/Bxq6Gy1eCIr0ZWhVWJ26imU=; 
	b=LvPcsJZ0q5V6HBS196+ZPK3AzOBEeaeEGwmLtMQjRyVaQm/HaY8Ws5p6Fi0kwFnQb+KAMMAhqTTJdaFuzn4WTdAhicqqetTJxRZwMgQYk03RApn1XrjpJhHT96urlyMrxuLK3H8pXBAus+ZvLaCKHpQAGgOOYUmD4evM6+W7CtE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776075021;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=+F2WuEiqCUVykRB3XRC/Bxq6Gy1eCIr0ZWhVWJ26imU=;
	b=FWu/Fj7ESc75rLeVnbStmpSKRmJY0gxT81KpIvgIUkJ9oD1G/yZJ1yKVR4gVNjVz
	FsSBKc/EvVJoH5g+As6IZPhMgXhUiOxdpH8+06QQ/E9hNp34p57Qt4dGzJWwp3k0FPm
	rcOXRaol6vf5DtHOn+dMHEplOSq+v7HR+yHSgSnY=
Received: by mx.zohomail.com with SMTPS id 1776075021006776.3877738797408;
	Mon, 13 Apr 2026 03:10:21 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 13 Apr 2026 12:07:32 +0200
Subject: [PATCH v13 18/27] drm/bridge: dw-hdmi-qp: Use common HDMI output
 bus fmts helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-color-format-v13-18-ab37d4dfba48@collabora.com>
References: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
In-Reply-To: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
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
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_111058_340502_4082A2F9 
X-CRM114-Status: UNSURE (   9.28  )
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

Make use of the common drm_bridge_funcs.atomic_get_output_bus_fmts
helper for HDMI bridge connectors.

This allows dw-hdmi-qp HDMI bridges to participate in recursive bus
format selection in a meaningful way.

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index d649a1cf07f5..5380aa7d82a8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1192,6 +1192,7 @@ static int dw_hdmi_qp_cec_transmit(struct drm_bridge *bridge, u8 attempts,
 #endif /* CONFIG_DRM_DW_HDMI_QP_CEC */
 
 static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
+	.atomic_get_output_bus_fmts = drm_atomic_helper_bridge_get_hdmi_output_bus_fmts,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.53.0


