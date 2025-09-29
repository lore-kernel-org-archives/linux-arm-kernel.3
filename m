Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8065DCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 12:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kc1aln7O6Klwy7V6249j4vaMIKKG3rs2LpAcPtA4y6Q=; b=eNQqUPK4pnTDJn+8CCrQVe3dgC
	UzUx5zPzOAd+lwt24D1xAzt77iuuAyngy5EtxwxNdWA6V/n7hj4ncBaWKzhG0uS6Xj0mLtLy38n4c
	m4BS0+LSBwCWEBHTfJRDHwHatH5udSh3SLlQpnQRgnn49tc9f/bM+Zb/uc1cMym7s76rPT5ePYK/W
	zQoEGMRiqcbaaGSDqdJiXZCo54uT8k5lp3G2K7y1QG9CzMAIqjs32Q8FzB79j7eXkOPPgMvWD9U5K
	y7jtJo8YGe1QQZ5yZf6jxfNmh2VPdhaoWrMfvDe2vgFzJnT4TqTnrabfKr2hh8NkTBXX+dAW2gxL/
	SdXC3krQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CeQ-00000002QhC-2UXk;
	Mon, 29 Sep 2025 12:06:42 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CeO-00000002Qfp-02up;
	Mon, 29 Sep 2025 12:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Kc1aln7O6Klwy7V6249j4vaMIKKG3rs2LpAcPtA4y6Q=; b=Pj/0eqJ/2S7dT2RilNqu2UU2en
	gSL409zLBZqK5ReMvaYAR8ySZwvmWR5VWZ/8/DSgj1NtkZPn6thrmribxiZ08P/18vxRWoaIZ/q77
	Ha4ExYs0ILQ6p6o0BKVON0PuyoNmjeD4hfL5QDEt7eZYWuAcTiANzICAcFyie6eDItCqhHPgK3fGw
	BgYuh+jOZcuQwpON+xR/U4bZI6UdxngBza/DHl6wahXCRtEtT0GD1BUu78fXIQdYH+q1Jbzotbs/g
	vdBf/aaHnONir3HjZT0adIHiQXgKfis+MMmwAtjs3cfuYQZynA7r/Kw0xwo0sxQnng7bfhjWRCqR9
	1Rr59igQ==;
Received: from [189.6.12.111] (helo=[192.168.0.55])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1v3CdD-001j7G-Va; Mon, 29 Sep 2025 14:05:28 +0200
Message-ID: <4d4170fc-f91a-4e15-b8a0-317b1af8324e@igalia.com>
Date: Mon, 29 Sep 2025 09:05:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 00/20] Introduce support for post-blend color
 pipeline
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_050640_214160_F7CD97F2 
X-CRM114-Status: GOOD (  22.15  )
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



On 17/09/2025 21:43, Nícolas F. R. A. Prado wrote:
> This series is based on "Color Pipeline API w/ VKMS" [1]. It reuses the
> same concept of a color pipeline API but for the post-blend stage
> instead of pre-blend, by attaching the COLOR_PIPELINE property to the
> CRTC rather than a plane.

Hi all,

I'm confused about the timing of this series being reviewed.
Hadn't we agreed in past hackfest on discussing post-blending color API 
only after we have sorted out pre-blending color properties?
There are still open questions around color_encoding and color_range, 
for example...
How assertive can we be evaluating the post-blending API now?

Best Regards,

Melissa

>
> The patches in the series first implement the necessary changes in the
> DRM core to allow for post-blend color pipelines and expose it through
> the uAPI, and then implement support in both the MediaTek KMS driver and
> in VKMS.
>
> This series has been tested with IGT, with the "Support post-blend color
> pipeline API" series [2] applied, on top of VKMS, as well as with
> Weston, with a WIP branch [3], on a MT8195-Tomato Chromebook, where both
> gamma LUT and CTM color transformations have been simultaneously
> configured in hardware through the API and validated (test commits for
> weston at [4] and for kernel at [5]).
>
> [1] https://lore.kernel.org/all/20250815035047.3319284-1-alex.hung@amd.com/
> [2] https://lore.kernel.org/igt-dev/20250912-post-blend-colorops-v1-0-83fc62420cba@collabora.com/T/#t
> [3] https://gitlab.collabora.com/nfraprado/weston/-/tree/post-blend-colorops?ref_type=heads
> [4] https://gitlab.collabora.com/nfraprado/weston/-/tree/post-blend-color-pipeline-lut-ctm-test?ref_type=tags
> [5] https://gitlab.collabora.com/nfraprado/linux/-/tree/debug-ctm-lut-data-post-blend-colorop?ref_type=tags
>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> Changes in v2:
> - Split core DRM changes for post-blend color pipelines from single
>    commit into smaller changes
> - Added post-blend color pipeline support in VKMS
> - Introduced driver cap, and made client cap depend on it (daniels)
> - Made deprecated color props (GAMMA_LUT, DEGAMMA_LUT, CTM) available as
>    read-only when post-blend color pipelines are enabled (daniels)
> - Created colorop_modeset_lock/unlock to commonize locking pattern for
>    colorops (louis.chauvet)
> - Added helper for post-blend 1D curve colorop creation
> - Link to v1: https://lore.kernel.org/r/20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com
>
> ---
> Nícolas F. R. A. Prado (20):
>        drm/crtc: Add color pipeline to CRTC state
>        drm/colorop: Allow parenting colorop to CRTC
>        drm: Factor out common color_pipeline property initialization code
>        drm/crtc: Add COLOR_PIPELINE property
>        drm: Introduce DRM_CAP_POST_BLEND_COLOR_PIPELINE
>        drm: Introduce DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE
>        drm/atomic: Pass post_blend_color_pipeline client cap to atomic check
>        drm/atomic: Print the color pipeline as part of the CRTC state print
>        drm/colorop: Factor out common paths from colorops helpers
>        drm/colorop: Introduce colorop helpers for crtc
>        drm/colorop: Export drm_colorop_cleanup() so drivers can extend it
>        drm/crtc: Track post-blend color pipeline client cap in drm_crtc_state
>        drm/mediatek: Support post-blend colorops for gamma and ctm
>        drm/mediatek: ccorr: Support post-blend color pipeline API
>        drm/mediatek: gamma: Support post-blend color pipeline API
>        drm/mediatek: Set post-blend color pipeline driver cap
>        drm/vkms: Rename existing color pipeline helpers to contain "pre_blend"
>        drm/vkms: Prepare pre_blend_color_transform() for post-blend pipelines
>        drm/vkms: Introduce support for post-blend color pipeline
>        drm/vkms: Set post-blend color pipeline driver cap
>
>   drivers/gpu/drm/drm_atomic.c              |   9 +-
>   drivers/gpu/drm/drm_atomic_uapi.c         |  65 +++++++-
>   drivers/gpu/drm/drm_colorop.c             | 245 ++++++++++++++++++++++++------
>   drivers/gpu/drm/drm_connector.c           |   1 +
>   drivers/gpu/drm/drm_crtc.c                |  77 ++++++++++
>   drivers/gpu/drm/drm_crtc_internal.h       |   6 +
>   drivers/gpu/drm/drm_ioctl.c               |  12 ++
>   drivers/gpu/drm/drm_mode_object.c         |   9 ++
>   drivers/gpu/drm/drm_plane.c               |  36 +----
>   drivers/gpu/drm/mediatek/mtk_crtc.c       | 208 ++++++++++++++++++++++++-
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |   6 +-
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.h   |   2 +
>   drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 100 ++++++++++--
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h   |   6 +-
>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 107 ++++++++++---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c    |   3 +-
>   drivers/gpu/drm/vkms/vkms_colorop.c       | 106 ++++++++++++-
>   drivers/gpu/drm/vkms/vkms_composer.c      |  13 +-
>   drivers/gpu/drm/vkms/vkms_crtc.c          |   1 +
>   drivers/gpu/drm/vkms/vkms_drv.c           |   3 +-
>   drivers/gpu/drm/vkms/vkms_drv.h           |   3 +-
>   drivers/gpu/drm/vkms/vkms_plane.c         |   2 +-
>   include/drm/drm_atomic.h                  |  20 +++
>   include/drm/drm_atomic_uapi.h             |   2 +
>   include/drm/drm_colorop.h                 |  22 ++-
>   include/drm/drm_crtc.h                    |  27 ++++
>   include/drm/drm_drv.h                     |   6 +
>   include/drm/drm_file.h                    |   7 +
>   include/uapi/drm/drm.h                    |  25 +++
>   29 files changed, 994 insertions(+), 135 deletions(-)
> ---
> base-commit: 342e5ee08797cde0e8af30e6110a5dc1cba61e9c
> change-id: 20250730-mtk-post-blend-color-pipeline-498e1a9cc53e
>
> Best regards,


