Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D82C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 20:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XmXy8TGZMtUdUflzhbcwpO5PBzlQNsR1Xi5VVFI9N3E=; b=F5SPqIECBkY00l
	rMK98GVOy40kwPkDnda1RVRux0GqYhNrtnnYsGiMiZr68EOf1GlpckK07KoyFJjWDmP4Cps6cr0zq
	RMaqVt+oMEP0y+rujLzpvW/b5AQCGuCwfDtgB1EmuvglU9/l07dOM8JE18dTKJjzO6+3zxJVlnJvO
	1pGhNZOSk27n3m6LxzI41e6XJs3yt4D3pbuX+KAVoaTXcND+noGdJW/ZGInatIU6NY5KXh9hJPVHZ
	qnsMHoh61y5Uet3CajhVb4akyuVoCDaATKVgTVM3Cq7DthABCmU/yxdCN0TqKOEvS8u05KploOBAU
	bJI2IbQcZ76E9kJj4aww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuyfN-000000039tD-3kC5;
	Fri, 14 Aug 2026 20:38:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuyfC-000000039gI-46zw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 20:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786739882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XmXy8TGZMtUdUflzhbcwpO5PBzlQNsR1Xi5VVFI9N3E=;
	b=gmuj0VJNz9v4afooOIAnLD0YrDBK3ujZOFcPY46dJshPFLU16i2ro4fuSmQ7bRAyBaHFQc
	av0RuisWinMTvUehFhhHVq65z6lXukogtfB0/F2S3qK/NZpUztSPcrA86s1nMlMz9R3dhh
	xzmOPQAO4QqG06qItNIcq6b3E0e/aUM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-500-zePa_GbsMtmTsuH5SevbYw-1; Fri,
 14 Aug 2026 16:35:54 -0400
X-MC-Unique: zePa_GbsMtmTsuH5SevbYw-1
X-Mimecast-MFC-AGG-ID: zePa_GbsMtmTsuH5SevbYw_1786739751
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D6B6219560AE;
	Fri, 14 Aug 2026 20:35:49 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.233])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 02CAB197750F;
	Fri, 14 Aug 2026 20:35:44 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	intel-gfx@lists.freedesktop.org,
	linux-aspeed@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	spice-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	imx@lists.linux.dev
Subject: [PATCH 0/5] drm/vblank: Enforce all-or-nothing vblank support
Date: Fri, 14 Aug 2026 16:35:28 -0400
Message-ID: <20260814203542.1405135-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: OiMKm3whe54DgI_EsFOgEW-Wtbov4SpUg7aidE8DVk4_1786739751
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_133803_744752_DA16D169 
X-CRM114-Status: GOOD (  13.39  )
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

One of the oddities with DRM that is leftover from the old days is how
vblank support is implemented by drivers. This has caused some minor
issues for the rust bindings for KMS which could be worked around.
However, it seems like a much better idea to fix this on the C side.
Those oddities are mainly:

* There's nothing in the vblank core that actually ensures that all
  CRTCs implement vblank support if one of them do. On Rust's side, we
  can't have this and have to ensure either the whole device has vblank
  support or not - otherwise it would be quite painful ensuring we don't
  expose vblank methods to drivers that can't use them.
  This additionally means such a situation would lead to UB.
* There is a second variable for keeping track of the number of CRTCs
  and it's kind of broken and confusing. Even worse, we currently allow
  the vblank API to allow a driver to specify a different number of
  CRTCs then it actually has.

So, let's just go ahead and fix this across the whole tree, and enforce
that a driver must either implement hardware vblank support for all
CRTCs or no CRTCs.

Lyude Paul (5):
  drm/vblank: Add drm_device.has_hw_vblank
  drm/vblank: Remove drm->num_crtcs
  drm/vblank: Remove num_crtcs argument from drm_vblank_init()
  drm/vblank: Use drm_for_each_crtc() in drm_vblank_init()
  drm/vblank: Require all CRTCs implement vblank support in
    drm_vblank_init()

 drivers/gpu/drm/adp/adp_drv.c                 |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |  2 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
 drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
 drivers/gpu/drm/armada/armada_drv.c           |  2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  2 +-
 drivers/gpu/drm/drm_vblank.c                  | 60 ++++++++++++-------
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |  2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
 drivers/gpu/drm/gma500/psb_drv.c              |  2 +-
 drivers/gpu/drm/gma500/psb_irq.c              |  4 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |  2 +-
 .../drm/i915/display/intel_display_driver.c   |  3 +-
 drivers/gpu/drm/imx/dc/dc-kms.c               |  2 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c           |  2 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c      |  2 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c           |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  2 +-
 drivers/gpu/drm/kmb/kmb_drv.c                 |  2 +-
 drivers/gpu/drm/logicvc/logicvc_mode.c        |  2 +-
 drivers/gpu/drm/loongson/lsdc_drv.c           |  2 +-
 drivers/gpu/drm/mcde/mcde_drv.c               |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +-
 drivers/gpu/drm/meson/meson_drv.c             |  2 +-
 drivers/gpu/drm/msm/msm_kms.c                 |  2 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c             |  2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     |  2 +-
 drivers/gpu/drm/omapdrm/omap_drv.c            |  2 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
 drivers/gpu/drm/qxl/qxl_display.c             |  2 +-
 drivers/gpu/drm/radeon/atombios_crtc.c        |  4 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c   |  4 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  2 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |  2 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  2 +-
 drivers/gpu/drm/sprd/sprd_drm.c               |  2 +-
 drivers/gpu/drm/sti/sti_compositor.c          |  2 +-
 drivers/gpu/drm/stm/ltdc.c                    |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
 drivers/gpu/drm/tegra/drm.c                   |  2 +-
 drivers/gpu/drm/tidss/tidss_kms.c             |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  2 +-
 drivers/gpu/drm/tiny/bochs.c                  |  2 +-
 drivers/gpu/drm/tiny/cirrus-qemu.c            |  2 +-
 drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
 drivers/gpu/drm/vc4/vc4_kms.c                 |  6 +-
 drivers/gpu/drm/verisilicon/vs_drm.c          |  2 +-
 drivers/gpu/drm/virtio/virtgpu_display.c      |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |  3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c          |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c             |  2 +-
 include/drm/drm_device.h                      | 10 +++-
 include/drm/drm_vblank.h                      |  2 +-
 64 files changed, 114 insertions(+), 92 deletions(-)


base-commit: 568d4cb5dcc5ec4e22975699b6ea67a30806884c
-- 
2.55.0


