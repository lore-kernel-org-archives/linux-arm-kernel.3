Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9823EBFD36
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 10:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBy494F68r0qLKKEsa3LN0mB+quFxcEwe7H5kFBVbr0=; b=BZr0/ezS5eabxWetYEmLyXpneE
	IMN0qE8qQK0mhmAa4JmWcJ+zkuWnigMIsTpsA5DGj2zbYNRS0PXA8IJi9xc6hozJk+kKIhOSglqjJ
	FBJzx/TyERBZcj2TQd8hN2BjfawP2sdptIDwU2Tg1VwQ94ImY5piJ0Z5flUhs9/lDYRBb+BlChrYO
	KiLhGtKNmfJDXJ3w7yez7r9L7bC+w269JJ0VYsehHL729yT1Iiwb+FfhV+9DNY4f5YZbvC9fLR+kO
	4sEfK7IefoS129Sx3UV8fWH3bjZPuSZgBEcU6YG5+ERqZCTFD6K42kl9zgHYZfE5yjtLY5Rxw493t
	N/5tOLDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEVk-0000000FUNT-3jcA;
	Mon, 13 Apr 2026 10:27:21 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEVi-0000000FUMd-3cGc;
	Mon, 13 Apr 2026 10:27:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1776075995; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h02R6SYWbmcMwoKgTR8LoC3h+o9xXPnlKOZgWDVMAOIfszgmHpI899QpLHBqvwiFWX+RKwwE4nLjDgd2c94afqa1TXauKAQ9elb3Jrzj0iDuxzm3EaLjO/ckhtIDBoYv7kZBBaTJdnOcrVX/5blV/hFS/O6mJLb8Hg1nEXExWIM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776075995; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MBy494F68r0qLKKEsa3LN0mB+quFxcEwe7H5kFBVbr0=; 
	b=Sw/0B9KI3xsgcXQuQvm+LSh3j6xIKGTH2vfNTHYxLh3t0BZNS2a6Z4FSigmlBak0Q/a/hw0toiKTnNNkUHM0uLQFDzPlAEfAbtZ1tlRgfFtjDMhX5OaUV1CfK/Sw3Z5GzltNIVBRoU/BessP6XT2Ou/K/SwtZ15mP9dh771A9Cw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776075995;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=MBy494F68r0qLKKEsa3LN0mB+quFxcEwe7H5kFBVbr0=;
	b=SClcCwRGC3ptzz2W6dz6wheJPXh9BWTnc8EClbxkbu1yo2vIJT9PGcBejDaK6Nhe
	rECltZo9KuLaCQbOPkDfPZlGcwqAk5TatoV/zPjCblwvHcZJ8DSzwR1pcUupkpWRkb9
	0yCeg7taHZbw7dhQ6hUP5rC01qXeRmHCd4WO9fkA=
Received: by mx.zohomail.com with SMTPS id 1776075993436742.8313316176907;
	Mon, 13 Apr 2026 03:26:33 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
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
 linux-doc@vger.kernel.org, Werner Sembach <wse@tuxedocomputers.com>,
 Andri Yngvason <andri@yngvason.is>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Marius Vlad <marius.vlad@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v13 00/27] Add new general DRM property "color format"
Date: Mon, 13 Apr 2026 12:26:22 +0200
Message-ID: <6275841.lOV4Wx5bFT@workhorse>
In-Reply-To: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
References: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_032718_939881_77C5D20C 
X-CRM114-Status: GOOD (  15.95  )
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

On Monday, 13 April 2026 12:07:14 Central European Summer Time Nicolas Frattaroli wrote:
> Hello,
> 
> [snip mucho texto]
> 
> ---
> Nicolas Frattaroli (26):
>       drm/display: hdmi-state-helper: Use default case for unsupported formats
>       drm: Add new general DRM property "color format"
>       drm/connector: Let connectors have a say in their color format
>       drm/display: bridge_connector: Use HDMI color format for HDMI conns
>       drm/bridge: Act on the DRM color format property
>       drm/atomic-helper: Add HDMI bridge output bus formats helper
>       drm/display: hdmi-state-helper: Act on color format DRM property
>       drm/display: hdmi-state-helper: Try subsampling in mode_valid
>       drm/amdgpu: Implement "color format" DRM property
>       drm/i915/hdmi: Add YCBCR444 handling for sink formats
>       drm/i915/dp: Add YCBCR444 handling for sink formats
>       drm/i915: Implement the "color format" DRM property
>       drm/rockchip: Add YUV422 output mode constants for VOP2
>       drm/rockchip: vop2: Add RK3576 to the RG swap special case
>       drm/rockchip: vop2: Recognise 10-bit YUV422 as YUV format
>       drm/rockchip: vop2: Set correct output format for RK3576 YUV422
>       drm/bridge: dw-hdmi-qp: Use common HDMI output bus fmts helper
>       drm/rockchip: dw_hdmi_qp: Implement "color format" DRM property
>       drm/rockchip: dw_hdmi_qp: Set supported_formats platdata
>       drm/connector: Register color format property on HDMI connectors
>       drm/tests: hdmi: Add tests for the color_format property
>       drm/tests: hdmi: Add tests for HDMI helper's mode_valid
>       drm/tests: bridge: Add KUnit tests for bridge chain format selection
>       drm/tests: bridge: Add test for HDMI output bus formats helper
>       drm/bridge: Document bridge chain format selection
>       drm/connector: Update docs of "colorspace" for color format prop
> 
> Werner Sembach (1):
>       drm/amd/display: Remove unnecessary SIGNAL_TYPE_HDMI_TYPE_A check
> 
>  Documentation/gpu/drm-kms-helpers.rst              |   6 +
>  Documentation/gpu/drm-kms.rst                      |   6 +
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  91 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   1 +
>  drivers/gpu/drm/display/drm_bridge_connector.c     |  24 +
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  53 +-
>  drivers/gpu/drm/drm_atomic_helper.c                |  86 ++
>  drivers/gpu/drm/drm_atomic_uapi.c                  |  11 +
>  drivers/gpu/drm/drm_bridge.c                       | 104 ++-
>  drivers/gpu/drm/drm_connector.c                    | 178 +++-
>  drivers/gpu/drm/i915/display/intel_connector.c     |  10 +
>  drivers/gpu/drm/i915/display/intel_connector.h     |   1 +
>  drivers/gpu/drm/i915/display/intel_dp.c            |  43 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c          |  47 +-
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     | 111 ++-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |   4 +
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  21 +-
>  drivers/gpu/drm/tests/drm_bridge_test.c            | 971 +++++++++++++++++++++
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 345 ++++++++
>  include/drm/drm_atomic_helper.h                    |   7 +
>  include/drm/drm_connector.h                        | 120 +++
>  21 files changed, 2203 insertions(+), 37 deletions(-)
> ---
> base-commit: e3dc6072028a594d5e9bfc6476165842602d5307
> change-id: 20251028-color-format-49fd202b7183
> prerequisite-message-id: <20260409101539.22032-1-ville.syrjala@linux.intel.com>
> prerequisite-patch-id: f382aeb5da5f2b8f6e2cb22b88eb47f490f2c724
> prerequisite-patch-id: 20570aeb28e3c31353e6f697b193b23d8b47c47c
> prerequisite-patch-id: 1b7e24034883b22cd82be025a1cf82ae77170fd0
> prerequisite-patch-id: 6ec2dc2c05a75391b67cb12d93168f5e8da8ec55
> prerequisite-patch-id: 32e84581998ef4eef05e1681c7ec36b90f2a6bb7
> prerequisite-patch-id: 99c2187a846b0c9ac2ea1a892c17483120cb7da1
> prerequisite-patch-id: fb41b4668a3b7c8c375c67ffd6b178fa3273e86a
> prerequisite-patch-id: 4c115a36eea0d5f80643dc34310690894ac80e0e
> prerequisite-patch-id: 6fdec0832cd6062de3cc5c2f363c5d624d8a00f9
> 
> Best regards,
> --  
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> 

Oops, forgot to apply the review trailers from last revision. (I did
actually remember, but didn't remember to explicitly confirm applying
them, and it defaults to not doing so.)

So these two:
- drm/atomic-helper: Add HDMI bridge output bus formats helper
- drm/connector: Register color format property on HDMI connectors

Lack Dmitry Baryshkov's R-b, but I assume it'll get picked up
on the next `b4 trailers -u` anyway. Just mentioning it though
to ruin the surprise for any reviewer who feels gaslit otherwise.

Kind regards,
Nicolas Frattaroli



