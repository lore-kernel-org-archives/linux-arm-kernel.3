Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18809C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2htw98TlVcP+RIDb3b8KEcHym617Hw0Z8IMjX67kKx8=; b=Ml3WnGIZV/bq/ty//a3wpIEXjO
	73PSQ3H6wTkXE36xLOf8lWfXr89GsrKr48xH9uA9DvtA2mr3L3JVSZUpNhItVxXduYaE6QC0GiAx3
	fxc1Vug24Qvljalo92ElA5UAm+TAW41rhkpURRYq5epjJ4qOPx6+TyAa7csGrlkxLSILKv8xW+6QX
	l6Tt+cruRM8YViBC/zdb8tlOg1ntl4KyDLlIZMoi68+7GBIWfXlOEzQq70/tJwA2ykwrVPEUCXYxt
	i8h2+tcVc3epl8iQfS1b5VHLMfvCH9SGEApwUFk25otpzMm6DXpMgca9VIyUhmF2+Sm+6vAwrXMNS
	Nw1jFRCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6We-0000000FwXa-3eQ1;
	Wed, 12 Aug 2026 10:49:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6Wc-0000000FwWr-2TDh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 10:49:36 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4954b3c5cbeso718385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 03:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786531773; x=1787136573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2htw98TlVcP+RIDb3b8KEcHym617Hw0Z8IMjX67kKx8=;
        b=CPFCx+CIIdqlq5506b5f72RMiY08voajQJ3dF8nRoISHEQaHeF4hxA2McohDZ2+EiW
         EjLO0uHQd2RFv3YlPSDVFD7nRek86jm1IxY28DF9vMkE+AHuF7KiNE/xkz9kh0S0uARU
         9ttDXIbUz2dJoNSlVK6rhHsSaO2S9UE/oZp5vwCXEba+Wuw9LM9OIH8W5tCYrYmwvlN1
         4t1sfM9/Ye6W+LeyfH6duf4I9b/6/ja+O8dDToMB/oSJFMChPZqKrzlt5AHGt+JZeViM
         S57/KWYMv5X+pfUH/uTVmvymW/crU+oiVnq2UBFtAFk6/QD/l9SUjAmnhx3GXc+OnGaq
         M0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786531773; x=1787136573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2htw98TlVcP+RIDb3b8KEcHym617Hw0Z8IMjX67kKx8=;
        b=blgIDvkJu3eezXeIbuHwk08/VMOTW99zIYUKVgWCQIZfEv1IFPJWylGuQfRT97k1Je
         EK/bYnVBiGyhzgXrMx28SWkwaQGbKSxhir70+UM3mzB4FagQgxgcCluy6YnTl6QeAlEl
         U7aTkgJULwCKM0ElGOGTllhhey+LOM+fSPN5Sms7IVaGsRDxxcChTSWDQXKKpiDIG06M
         wLOMTjWUqFW1465ZKGA7IlIdq+oMSqSnZB0YqVaH9ZoIm+/I9BMhdAnd2DPhDEgBDIjg
         O7Qq3+w9B/Wu6OCxqKwJoBrjP84dtcQEiDxdvjMUnM+7iz/ZvLqIkVE7HQ/fqs8x3k/z
         RegA==
X-Forwarded-Encrypted: i=1; AHgh+RoAY5qsb85Hk8EKzRzKWc7/l5CoCqhud6xax1tloiUZGkLANlK482m3LvxX2HcbCkRc6xPWYcwjrA+mOnOmTmeU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1QNhbqPKe7AIGIawLvvRvXVzNuBWoGIiSdrIgtDjOra5m1PrF
	rX2ZkxOXJEGsknjLDyxHx6xifAdem6nq8V6ee1kofPHVGakvctpS6EIq
X-Gm-Gg: AR+sD115OWdMY5aNmxvV+L4vIF9VqX5+qB9Pmn8R4A+WdirEV7mufaMHzi3rvS3UrQE
	YXB6eUxQoJygOiH7uc/X8Bg70JJ9FXum1t/1GLY596DoFNTj9hEah2vLB5knzOKre/JDKFf6IdG
	fkCLJWJtl8AsnY3YJf881lwPHXAWPCyTgBLz+CHjEdoru+yLXkvgAFbufoAGAlC2LywaMeSYBUf
	j36rNfGvlW6uc50B6gK3wAmUS13hIBMoWxzjROplk2VeD1tU19LLWVdHxHMdVSGw5xYc6zIfy0D
	1otehn1WQpqnm5IVv3w45wzBt/dF/GXcS3tJf0mDHNhsj1MAJyGDf+o1LmViQQbloKpmcRc2w5J
	PduJxzUTe6GS0wNgMhVnJlVP4F397pG9rS8Sav5zZrYjgPCjtPWl6eOKKLtLSLk1Om9RVICLudw
	jjmu1HBVHXl23HGjAK7wXm9Olb5g3ZpDJQwXdB1bFHLsYhGoncLCB64l5z9/zq5/NplnV4CaT61
	FVfO2HMkKK3iLfNhaJ29juzKDxYUiE4EXJaqHGrYtKncVPY1eOLHTz3ut2OiZxZeVDrsNa2/t99
	sLK4
X-Received: by 2002:a05:600c:1d02:b0:493:f42e:1b3f with SMTP id 5b1f17b1804b1-4997c1412a8mr27209975e9.3.1786531772439;
        Wed, 12 Aug 2026 03:49:32 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B84A600F9E120266BE3CC9B.dsl.pool.telekom.hu. [2001:4c4e:1b84:a600:f9e1:2026:6be3:cc9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997abf94c1sm60999775e9.14.2026.08.12.03.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:49:31 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: vop2: Scale the AXI clock to the bandwidth the mode needs
Date: Wed, 12 Aug 2026 12:49:04 +0200
Message-ID: <20260812104909.6390-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_034934_707420_C796635A 
X-CRM114-Status: GOOD (  31.08  )
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

VOP2 fetches the scanout data for all of its video ports over a single
AXI clock.  On RK3588 that clock is pinned to 500 MHz by the device tree
and nothing ever raises it, so a mode whose pixel rate outruns what the
AXI clock can deliver underruns the internal scanout FIFO.  The hardware
reports this as POST_BUF_EMPTY and the picture is corrupted.

3840x2160@120 over DisplayPort is such a mode.  Measured on an Orange Pi
5 Plus by moving the rate at runtime while the mode was up, with dclk
unchanged at 594 MHz throughout, so that the AXI rate was the only
variable:

  500 MHz: ~594000 suppressed vop2_isr callbacks per 5 s, corrupted
  750 MHz: no POST_BUF_EMPTY at all for the 42 s the phase lasted, clean
  500 MHz: ~607000 suppressed callbacks per 5 s, corrupted again

Both transitions are immediate.  Heiko Stuebner reports the same
starvation on different hardware [1].

The requirement follows each port's pixel rate rather than its interface
clock, and it is per port rather than aggregate.  Two measurements at
500 MHz pin that down:

  - a single port scanning out 3840x2160@120 underruns, while the same
    composed pixel rate spread over three ports - 3840x2160@60 on one
    and 3840x2160@30 on two others - is clean for a minute with no
    underrun on any of them.  The totals are equal to the pixel:
    3840*2160*120 == 3840*2160*(60+30+30).

  - 3840x2160@60 is clean where 3840x2160@120 is not, although both run
    dclk at 594 MHz on this board: the 120 Hz link is YCbCr 4:2:0, which
    halves dclk without halving the rate at which the port consumes
    pixels.

So the condition belongs on each video port's own crtc_clock.  Summing
across ports would be wrong, and keying on dclk would miss 4:2:0
entirely.  The threshold sits between the measured points: 3840x2160@60
(594000 kHz) and 2560x1440@144 (about 586000 kHz) are both clean at the
default rate, 3840x2160@120 (1188000 kHz) is not.

Take the maximum over the video ports that are scanning out rather than
counting them, so that disabling one port cannot drop the rate below
what a port that is still scanning needs.  The rate the platform set up
is used as the lower bound, so a board that already configures a higher
rate keeps it.

Tested on the same board on drm-misc-next plus the dw-dp and Rockchip
USBDP PHY series, which DisplayPort Alt Mode needs in order to come up
at all: 3840x2160@120 selects 750 MHz and runs with no underrun,
dropping to 3840x2160@60 returns the clock to 500 MHz and stays clean,
and going back raises it again.  On that same kernel without this patch
the output shows no picture at any mode.

Link: https://lore.kernel.org/all/20260808104240.13776-1-royalnet026@gmail.com/
Link: https://lore.kernel.org/all/20767137.geO5KgaWL5@diego/ [1]
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Cristian, this overlaps with your ACLK work: the condition here is not
FRL-specific, so it also covers the HDMI FRL case that 7e580d1cc3aa
handles in the rockchip-3588 branch.  I did not want to queue this
behind a series that is itself blocked, but I am equally happy to rebase
on top of yours, or to drop this if you would rather carry it.  Whatever
shape it takes should keep the FRL case working rather than replace it.

Chaoyi, thank you for the FIFO description and the downstream decision
flow - the per-port measurement above came directly out of that.

Based on drm-misc-next at c8d3d795dd40.  Tested on an Orange Pi 5 Plus;
DisplayPort Alt Mode there additionally needs the dw-dp series and the
Rockchip USBDP PHY series, neither of which is merged yet, so the test
kernel carried both.
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 46 ++++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  2 +
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 4cce3e336f5b..5dda1fc1c8a1 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -104,6 +104,20 @@ enum vop2_afbc_format {
 
 #define VOP2_MAX_DCLK_RATE		600000000UL
 
+/*
+ * All video ports fetch their scanout data over a single AXI clock.  The
+ * hardware buffers that data in an internal FIFO which is drained at the
+ * pixel rate, so a mode whose pixel rate outruns the fill rate underruns the
+ * FIFO, which the hardware reports as POST_BUF_EMPTY and which shows up as a
+ * corrupted image.  Raise the AXI clock for modes that need it.
+ *
+ * The requirement follows the pixel rate rather than the interface clock: a
+ * YCbCr 4:2:0 link halves dclk but not the rate at which the video port
+ * consumes pixels.
+ */
+#define VOP2_ACLK_RATE_HIGH		750000000UL
+#define VOP2_HIGH_BW_PIXCLK_KHZ		1000000
+
 /*
  * bus-format types.
  */
@@ -1008,6 +1022,32 @@ static bool vop2_gamma_lut_in_use(struct vop2 *vop2, struct vop2_video_port *vp)
 	return gamma_en_vp_id != nr_vps && gamma_en_vp_id != vp->id;
 }
 
+/*
+ * Pick the AXI clock rate that satisfies every video port that is scanning
+ * out.  Taking the maximum over the active ports rather than counting them
+ * means a port being disabled can never drop the rate below what a port that
+ * is still scanning needs.
+ */
+static void vop2_update_aclk_rate(struct vop2 *vop2)
+{
+	unsigned long rate = vop2->aclk_rate_normal;
+	struct drm_crtc *crtc;
+
+	if (vop2->version != VOP_VERSION_RK3588)
+		return;
+
+	drm_for_each_crtc(crtc, vop2->drm) {
+		if (!crtc->state->active)
+			continue;
+
+		if (crtc->state->adjusted_mode.crtc_clock > VOP2_HIGH_BW_PIXCLK_KHZ &&
+		    rate < VOP2_ACLK_RATE_HIGH)
+			rate = VOP2_ACLK_RATE_HIGH;
+	}
+
+	clk_set_rate(vop2->aclk, rate);
+}
+
 static void vop2_crtc_atomic_disable(struct drm_crtc *crtc,
 				     struct drm_atomic_commit *state)
 {
@@ -1053,6 +1093,8 @@ static void vop2_crtc_atomic_disable(struct drm_crtc *crtc,
 	if (!vop2->enable_count)
 		vop2_disable(vop2);
 
+	vop2_update_aclk_rate(vop2);
+
 	vop2_unlock(vop2);
 
 	if (crtc->state->event && !crtc->state->active) {
@@ -1780,6 +1822,8 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	vop2_lock(vop2);
 
+	vop2_update_aclk_rate(vop2);
+
 	ret = clk_prepare_enable(vp->dclk);
 	if (ret < 0) {
 		drm_err(vop2->drm, "failed to enable dclk for video port%d - %d\n",
@@ -2875,6 +2919,8 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 		return dev_err_probe(drm->dev, PTR_ERR(vop2->aclk),
 				     "failed to get aclk source\n");
 
+	vop2->aclk_rate_normal = clk_get_rate(vop2->aclk);
+
 	vop2->pclk = devm_clk_get_optional(vop2->dev, "pclk_vop");
 	if (IS_ERR(vop2->pclk))
 		return dev_err_probe(drm->dev, PTR_ERR(vop2->pclk),
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index ffcb39c130aa..50a3513c89ab 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -326,6 +326,8 @@ struct vop2 {
 	unsigned int enable_count;
 	struct clk *hclk;
 	struct clk *aclk;
+	/* AXI clock rate set up by the platform, used as the lower bound. */
+	unsigned long aclk_rate_normal;
 	struct clk *pclk;
 	struct clk *pll_hdmiphy0;
 	struct clk *pll_hdmiphy1;
-- 
2.43.0


