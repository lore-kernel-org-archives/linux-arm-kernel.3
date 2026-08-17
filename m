Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4456FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 12:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmMwzgYICEZgaUQS0J4MmV5SSQYrGmVvWfDuKpV65fM=; b=nHn1iSgv+3Ujw1oy/BsynHOlo6
	3CJZTuHpSm3tG96gA4FKcYVJV4RIH4N4YGAacmDAJQivcJN/21BrNacrV688yaayA/Nrd2/BsjN7Q
	F4XI0U2E3shl9cGISfw5/AwAbsQ9tpMVkSXF0IGvqJ81ls4rahLgBnl5H5mfwRV/KyZRJdGaRxKwh
	B7kv0BLfi5hehw8sMTm/q3gJGDrUBbDlv5Sqigst1LzpzxOeUhL+/2HcMVgMpOAp2Vw0civPrgWA5
	CxPDwL22q8A6IOfMEhiPtiSvGmVyXf/FPc9zDnQp87rS746e5gIfLXch0TdQ2mGvHXYpRVQE7Ubf9
	pAHL//ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvweP-000000068oE-3kLx;
	Mon, 17 Aug 2026 12:41:13 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvweN-000000068nc-2edA;
	Mon, 17 Aug 2026 12:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786970472; x=1818506472;
  h=from:to:subject:in-reply-to:references:date:message-id:
   mime-version;
  bh=7X4st2dfy1l8lT+fjQAQC0tAfIF/QQdIXAwtTks4e/k=;
  b=l5Dql8h1HXRzchklrehTNqunH3+GhqE0rFF1m74/uOEqA9da6yX7K9n9
   rOew1wZQqPRXmYEDPD9STNPWRHjmWfjb/+fTdHYuEsSjC/YBZgFIyf2En
   iwDHXzmz7PBbYF/zFM7t5qTLorISeLW37iVPXHNfOGHAen/H0OeIZTv55
   XkYnuZEJzTGjeW+GQfKpVS72gttYP3k23sJLGVCu97Fx0YJ04ggHg+VqM
   OSsC5bu1OinHuTOqLN8c6ERheDgx9yG+MXAJH5U8DSoG3JEf0UyELUqst
   q1ncTxPI1MgJ4+xSeHNiMjNYwohx3EDC36sqs24uw8XN9xroIs99yBboe
   A==;
X-CSE-ConnectionGUID: o9NQZOBlSTyAp+L7Gwsw9g==
X-CSE-MsgGUID: IUIDPVVcTvS1wbxt/b8e0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98598089"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="98598089"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 05:41:10 -0700
X-CSE-ConnectionGUID: kO9/n7EERguTo2l7wfOCtw==
X-CSE-MsgGUID: 7ox5dl61Tw6To4e/rrOiGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="266887598"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.110])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 05:41:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 imx@lists.linux.dev
Subject: Re: [PATCH 0/5] drm/vblank: Enforce all-or-nothing vblank support
In-Reply-To: <20260814203542.1405135-1-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260814203542.1405135-1-lyude@redhat.com>
Date: Mon, 17 Aug 2026 15:41:02 +0300
Message-ID: <5f06e91a5ff0e5bb887b72e4ff9077c45cd9216e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_054111_712234_B8292BA6 
X-CRM114-Status: GOOD (  20.70  )
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

On Fri, 14 Aug 2026, Lyude Paul <lyude@redhat.com> wrote:
> One of the oddities with DRM that is leftover from the old days is how
> vblank support is implemented by drivers. This has caused some minor
> issues for the rust bindings for KMS which could be worked around.
> However, it seems like a much better idea to fix this on the C side.
> Those oddities are mainly:
>
> * There's nothing in the vblank core that actually ensures that all
>   CRTCs implement vblank support if one of them do. On Rust's side, we
>   can't have this and have to ensure either the whole device has vblank
>   support or not - otherwise it would be quite painful ensuring we don't
>   expose vblank methods to drivers that can't use them.
>   This additionally means such a situation would lead to UB.
> * There is a second variable for keeping track of the number of CRTCs
>   and it's kind of broken and confusing. Even worse, we currently allow
>   the vblank API to allow a driver to specify a different number of
>   CRTCs then it actually has.
>
> So, let's just go ahead and fix this across the whole tree, and enforce
> that a driver must either implement hardware vblank support for all
> CRTCs or no CRTCs.

For i915, the relevant init order is currently:

- drm_vblank_init()
- drm_mode_config_init()
- drm_crtc_init_with_planes() for each CRTC

For the patch series to work, drm_vblank_init() would have to happen
after mode config and CRTC init. Off-hand, I couldn't say if there are
dependencies that make this change difficult.

I'd be surprised if i915 were the only driver like this.


BR,
Jani.

>
> Lyude Paul (5):
>   drm/vblank: Add drm_device.has_hw_vblank
>   drm/vblank: Remove drm->num_crtcs
>   drm/vblank: Remove num_crtcs argument from drm_vblank_init()
>   drm/vblank: Use drm_for_each_crtc() in drm_vblank_init()
>   drm/vblank: Require all CRTCs implement vblank support in
>     drm_vblank_init()
>
>  drivers/gpu/drm/adp/adp_drv.c                 |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  2 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  2 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  2 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
>  .../gpu/drm/arm/display/komeda/komeda_kms.c   |  2 +-
>  drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
>  drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
>  drivers/gpu/drm/armada/armada_drv.c           |  2 +-
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  2 +-
>  drivers/gpu/drm/drm_vblank.c                  | 60 ++++++++++++-------
>  drivers/gpu/drm/exynos/exynos_drm_drv.c       |  2 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
>  drivers/gpu/drm/gma500/psb_drv.c              |  2 +-
>  drivers/gpu/drm/gma500/psb_irq.c              |  4 +-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |  2 +-
>  .../drm/i915/display/intel_display_driver.c   |  3 +-
>  drivers/gpu/drm/imx/dc/dc-kms.c               |  2 +-
>  drivers/gpu/drm/imx/dcss/dcss-kms.c           |  2 +-
>  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c      |  2 +-
>  drivers/gpu/drm/imx/lcdc/imx-lcdc.c           |  2 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  2 +-
>  drivers/gpu/drm/kmb/kmb_drv.c                 |  2 +-
>  drivers/gpu/drm/logicvc/logicvc_mode.c        |  2 +-
>  drivers/gpu/drm/loongson/lsdc_drv.c           |  2 +-
>  drivers/gpu/drm/mcde/mcde_drv.c               |  2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +-
>  drivers/gpu/drm/meson/meson_drv.c             |  2 +-
>  drivers/gpu/drm/msm/msm_kms.c                 |  2 +-
>  drivers/gpu/drm/mxsfb/lcdif_drv.c             |  2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_display.c     |  2 +-
>  drivers/gpu/drm/omapdrm/omap_drv.c            |  2 +-
>  drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
>  drivers/gpu/drm/qxl/qxl_display.c             |  2 +-
>  drivers/gpu/drm/radeon/atombios_crtc.c        |  4 +-
>  drivers/gpu/drm/radeon/radeon_irq_kms.c       |  2 +-
>  drivers/gpu/drm/radeon/radeon_legacy_crtc.c   |  4 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  2 +-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |  2 +-
>  .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  2 +-
>  drivers/gpu/drm/sprd/sprd_drm.c               |  2 +-
>  drivers/gpu/drm/sti/sti_compositor.c          |  2 +-
>  drivers/gpu/drm/stm/ltdc.c                    |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
>  drivers/gpu/drm/tegra/drm.c                   |  2 +-
>  drivers/gpu/drm/tidss/tidss_kms.c             |  2 +-
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  2 +-
>  drivers/gpu/drm/tiny/bochs.c                  |  2 +-
>  drivers/gpu/drm/tiny/cirrus-qemu.c            |  2 +-
>  drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
>  drivers/gpu/drm/vc4/vc4_kms.c                 |  6 +-
>  drivers/gpu/drm/verisilicon/vs_drm.c          |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_display.c      |  2 +-
>  drivers/gpu/drm/vkms/vkms_drv.c               |  3 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c          |  2 +-
>  drivers/gpu/drm/xlnx/zynqmp_kms.c             |  2 +-
>  include/drm/drm_device.h                      | 10 +++-
>  include/drm/drm_vblank.h                      |  2 +-
>  64 files changed, 114 insertions(+), 92 deletions(-)
>
>
> base-commit: 568d4cb5dcc5ec4e22975699b6ea67a30806884c

-- 
Jani Nikula, Intel

