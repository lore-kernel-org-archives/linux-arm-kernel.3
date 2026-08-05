Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD00C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 15:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K7C5bX9yrteFlRiHmbAJKSV1MNI7QdrKD956BMaNNmc=; b=onsXSOc7k6sATiGeqXKB0MNFq6
	KTjSr39UGbBu30dTYFCGrhUNdok3NNFRyaJO7OAYPXzsQh5VhFMvlMVByL+UhJpsfedvjCTrP6Gyp
	7jRo5mDz4+PhKFGp9utScT9Z8XGAYLTUSalPc6vu3vS8Zlz19N+fUi3lsWek3XWBGPbxPMmpWkqQs
	/x87oan+OrhkiOnWuqFsF18Y0XaghubEJIMQ2+0o2LXH/5kpQUIleyaMDwxUVIeF8GrciCAmyA3Nv
	R5PZTnjcRUClqKZL2QciiBAR691ok7Bw+LauXqBxDOYzoEBeOdmd5i5e/ZkJg7UfbDLD0b6EyUeq9
	QPj3DkZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrddy-00000004C48-0Kas;
	Wed, 05 Aug 2026 15:34:58 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrddv-00000004C38-0jSv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 15:34:57 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-496c5280812so341865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 08:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785944093; x=1786548893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K7C5bX9yrteFlRiHmbAJKSV1MNI7QdrKD956BMaNNmc=;
        b=TXdvKVH0cSrgISWqm0uZ2eRGybu5K0P9GSaLHv796HH33MLYnk/IX9v/uLLmF3yP7R
         woOcY3Wi4bQhyx8/JI2lNH3ZLAavbIuPe6Vr22I7fw2Jy1lxTxuunQiexfs8jWvJ6r56
         3ZNOsPBo2NqKXeYd37gpJ9nYTwXL2lgN0/SHfqRxcU3ALggGCK9GxCqLUSJy+FyC6f4w
         yEggiL/4gCAIYu0F5SMRv/TkpejS6W18OSIvq6MSZlsDKQoW7V3fwqT2QJmkmfYBqWaT
         ft8Jt5ON/RymlEBIaeobma9UGgoAokDFPlL4YZidrSKWkfYzlbvuNgUKzZGWm8qH4S8v
         xYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785944093; x=1786548893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7C5bX9yrteFlRiHmbAJKSV1MNI7QdrKD956BMaNNmc=;
        b=aCvvyBEN2OHzRSxl8WhMV1o5S0KAXONyRqXxiMNAV8Aa2vjaPv6K5c1FoNH7WBIcz7
         oEbI3RR2/gKDikn/+JBYVcaiMuw5u9Jqqc2CUVKUrnjPZRSh7Ep+LDOegPYBjWkGsb+6
         AA6bEo1grAAupKQAbmW9QN+PuD4sD3luclkP2G37PnwQr2wdpdth/WgroJihj8/YMd9H
         JNyIlhRL05i/nlMB715n010hvWRlrad8aid9rnnwBGiT/t8SySySRW4p3EdHV+xe+6So
         URwTNdPVmCiBLJpHmShHTo8JHjf7R+Ufk5Ft5e8l8OuSugeikrxiAqRsFqCWPUQyFWH7
         TtEg==
X-Forwarded-Encrypted: i=1; AHgh+RoUMAKpS48jE6KcH0aavjT2FvR0t4q2tDbf3RUDIYgxToKfkT3Ss5XQY30ony863UMnYkkoQ/uaEVqMKnkz1dj5@lists.infradead.org
X-Gm-Message-State: AOJu0YzjZIWt4FmfOJ7Xy+hOixtmN5qcGCRbPydek2HFLT4jV4iHQxoN
	lCXZGBihQpsYD36KI47vuhzFQZkBFfAXNT62jFfLt5blL1Y1WoYGEWNi
X-Gm-Gg: AR+sD12mor1gX31udt5PDWr0MA73k2rTaaDFu4XN7t4ah+s9PKNzmEtd88nxZKcqOuN
	C/WkQPVAj4jl07ZgjomeWfPGCRVozHsPTYBOsg6VURJUHcx3bhj4p93il4e5txRD4iC9WI3PPQ8
	B1+gnmG5vGz2zIv9rBww/7bVBxcaUTcYpIRybSJJ1sjuUmJJGzH0LeggGBs4sOOWH8x1EptCYfq
	ie+A1yBXsttqmCHvycb1Ls0q2xqCHboFRNdDXgEuhT6EzmBo2o6PbPrg8eBqadb2TCjOblzE8us
	fYA0xXEPus63UGq3wjR449uQUTbGHXX3gGhT2aiXwHc8z7Mfls7rwQqqWR5u1yCImNotNk17RSz
	SDK1vsiGygxNMYecuYBph7lkWuYRBeG9bYmGDn5abjXJom9lujmz/TxyEckHxodu0ip/jv3nLZv
	GrY95qnFRGHvsmKQG5hcA8jPMNqbndkHKF4rKleP1sIKnhP29AhOF4kI6Mf/L1fz+XhPtVNWKp2
	g4WQT0MsXgm5dtAVl3CgMWM4qujr0mogj1roH3JI0Z7MMVpLHHgoFQbex+Dw0XTw5Hc
X-Received: by 2002:a05:600c:1549:b0:498:1371:660c with SMTP id 5b1f17b1804b1-4994e704bd5mr50927585e9.0.1785944093070;
        Wed, 05 Aug 2026 08:34:53 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B86F10001BE789C6EE938EE.dsl.pool.telekom.hu. [2001:4c4e:1b86:f100:1be:789c:6ee9:38ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfda6afsm9047223f8f.3.2026.08.05.08.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:34:52 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2] drm/rockchip: dw_hdmi_qp: attach the HDMI Colorspace connector property
Date: Wed,  5 Aug 2026 17:33:55 +0200
Message-ID: <20260805153416.8459-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_083455_262633_863DF7BA 
X-CRM114-Status: GOOD (  18.30  )
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

The RK3588 HDMI QP output never exposes the "Colorspace" connector
property, so userspace has no way to request BT.2020 colorimetry.

Everything needed to signal it is already in place. The connector comes
from drm_bridge_connector_init(), which calls drmm_connector_hdmi_init()
and attaches "max bpc", "HDR_OUTPUT_METADATA" and the output color
format, and the HDMI state helper feeds conn_state->colorspace into the
AVI infoframe colorimetry bits via hdmi_generate_avi_infoframe() and
drm_hdmi_avi_infoframe_colorimetry(). dw-hdmi-qp then emits the
infoframe through its hdmi_write_avi_infoframe hook. Only the property
itself is missing, so conn_state->colorspace stays at its default and
the AVI infoframe always reports "no colorimetry data".

The user-visible effect is that HDR is unavailable on every RK3588 HDMI
output. KWin (Plasma 6.x) requires "Colorspace" alongside
"HDR_OUTPUT_METADATA" and "max bpc" before it treats an output as
wide-gamut capable, so it never offers the HDR toggle.

Create and attach the property right after the bridge connector is
initialised, as vc4_hdmi already does. Passing 0 to
drm_mode_create_hdmi_colorspace_property() selects the full HDMI
colorspace set defined by the core.

Tested on an Orange Pi 5 Plus driving a Samsung Odyssey G70B: KWin now
offers the HDR toggle, the connector property switches to BT2020_RGB
once HDR is enabled, and the output runs 4K@144 at 10 bpc.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Changes in v2:
- Regenerated with git format-patch. v1 was a hand-assembled diff: it
  carried no "diff --git" header, no diffstat, and no function context on
  the @@ hunk header. That is the most likely reason it never showed up in
  patchwork and got no review in three weeks.
- Rebased onto drm-misc-next (97c03b32b28a), the right tree for this
  change. The hunk is unchanged apart from its new offset and the function
  context that format-patch adds.
- Reworded the commit message to lead with the user-visible effect and to
  name the exact core path that consumes conn_state->colorspace.
- Trimmed the in-code comment to a single line; the reasoning now lives in
  the commit message instead. No functional change from v1: the two API
  calls and their placement are the same.
- An automated review of v1 flagged that returning an error from
  dw_hdmi_qp_rockchip_bind() leaves hdmi->hpd_work queued. That gap
  pre-dates this patch and is shared by every existing error path in
  bind() (drmm_encoder_init(), dw_hdmi_qp_bind(),
  drm_bridge_connector_init()), since cancel_delayed_work_sync() runs only
  in dw_hdmi_qp_rockchip_unbind(), which the component framework does not
  call for a failed bind(). It is already being addressed in the HDMI 2.0
  series below ("Cancel pending HPD work on suspend", 30/69, and "Control
  the HPD IRQ line via the bridge HPD ops", 37/69), so this patch adds
  nothing for it.

v1: https://lore.kernel.org/all/20260714202850.40999-1-royalnet026@gmail.com/
HDMI 2.0 series: https://lore.kernel.org/all/20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com/

 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 9c4cf68d79d5..35d04680d011 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -695,6 +695,13 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return dev_err_probe(hdmi->dev, PTR_ERR(connector),
 				     "Failed to init bridge connector\n");
 
+	/* Passing 0 selects the full HDMI colorspace set defined by the core. */
+	ret = drm_mode_create_hdmi_colorspace_property(connector, 0);
+	if (ret)
+		return ret;
+
+	drm_connector_attach_colorspace_property(connector);
+
 	return 0;
 }
 

base-commit: 97c03b32b28a9f7f13f768f2b06e1eaafe850e66
-- 
2.43.0


