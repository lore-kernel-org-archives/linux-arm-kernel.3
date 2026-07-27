Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4524C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 08:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8jS9h+vX086H8hKAq4Sq55zkPJffIxr/tNQL00XmPA=; b=o4i2wBQ7kWakJgMHKN7Ts/NMMi
	1mzxnBGFfbUkHEwi7wITfLo87mL+UGhC/0L2uEp4CzAUlh6dPqPLWCStOd84ZdaODIt0xg71ct3HG
	tTcUlFtMORe1Qhh41Mt0SarBr454f15nkNjAg342WKQ28ADG5RLeubrD0kzD83/1MCSPtXL+e4h+s
	a2dVB0X6GGucfIuaste38KOp/ls9Plq14DL27m0X8QJ683ajcONxZLmszNu9L0KuFW5VDGkCU822L
	rJcYC4c+jFFUVhoxhhY7XfeDOv25q67wZQmSKJ80s3lFz6IrVbjctgcuTBFC49ejwuhTAUv21xPFL
	v3xUO7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGo8-00000002FDE-1gf9;
	Mon, 27 Jul 2026 08:35:32 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGo5-00000002FCm-1HeY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 08:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785141329; x=1816677329;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=AagNZZeLpUJy3yCNbUma7ioLiTvnZVOQqLBTVfstLPY=;
  b=CArQl2/5f/zYqEfnMDl1/9y0QIEBdsLng5aghag1pNfcCXx+2CunAdy5
   Fi7MuwC22wnOkzxEvsK/+Ku8wR0NFWEFzYuFGIw2IBOJXJ3T3gY7tB5n7
   ZaZ/FWoEzeXMVIf3iO/2blFitZIIl2e9taB8uqEAWNz7poQUe86Ktoku1
   faq9qE7AR2p14GQ5dz+a200dwxhEdCIRTgWf74NP0hRxzObxkn0cROYsM
   sKamqx3dlvfp1D+YIhoKK1WiTC8xEvJZErpvsDJMjE7GuyK/8+W2EUe50
   AqUlklsZ9rEpFB2IshaavWXc40Ryj83lZNYDftfty555u7B7qLYD/B73E
   Q==;
X-CSE-ConnectionGUID: hP9jsS+3TwitHTeJ4OuEKg==
X-CSE-MsgGUID: 04r++j+7QDCY8HZ6izFLFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="85554028"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="85554028"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 01:35:28 -0700
X-CSE-ConnectionGUID: H1d0mwGaRgGHiD31dj3Hjg==
X-CSE-MsgGUID: KQowNBkQTCCoO5gmlo98Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="263137679"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.197])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 01:35:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Daniel Stone <daniel@fooishbar.org>, Hans Verkuil
 <hverkuil+cisco@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Samuel
 Holland <samuel@sholland.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v9 0/5] Add SCDC information to connector debugfs
In-Reply-To: <20260724-scdc-link-health-v9-0-bdda406d016d@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260724-scdc-link-health-v9-0-bdda406d016d@collabora.com>
Date: Mon, 27 Jul 2026 11:35:15 +0300
Message-ID: <1c9d3a50341129188242b1b2758fcee5eab243db@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_013529_388822_0528A41F 
X-CRM114-Status: GOOD (  31.62  )
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

On Fri, 24 Jul 2026, Nicolas Frattaroli <nicolas.frattaroli@collabora.com> =
wrote:
> HDMI uses the DDC I2C bus for communicating various bits of link status
> out of band with the actual HDMI video signal. This information can be
> useful for debugging issues like questionable cables sabotaged by feline
> teeth, Enthusiast Grade cables made of cow fencing wire, and other such
> problems that ruin one's media viewing plans.
>
> Consequently, this series exposes various bits of pertinent information
> from the SCDC protocol in an HDMI connector's debugfs. To continually
> poll the link status, userspace can poll the debugfs file.

Is there a reason we can't add a character device node for this similar
to DP AUX? See config DRM_DISPLAY_DP_AUX_CHARDEV.

It's ultimately more generic than deciphering everything in kernel.


BR,
Jani.





>
> ---
> Changes in v9:
> - Unlock mode_config.mutex on disconnected connector early exit
> - Calculate and print Reed-Solomon error corrections counter on !=3D 4
>   lane FRL as well. Technically a functional change to an already
>   reviewed patch, but I kept the R-b because it's so minor.
> - Link to v8: https://patch.msgid.link/20260722-scdc-link-health-v8-0-cd1=
dacbb85d9@collabora.com
>
> Changes in v8:
> - Acquire mode_config mutex in an interruptible way during
>   scdc_status_show to avoid racing connector state
> - Remove scdc_debugfs_priv, use connector as debugfs entry priv instead
> - Allocate and free state in scdc_status_show, since it doesn't need to
>   persist across debugfs reads
> - Check for NULL ddc in drm_scdc_read_state in the unlikely event an
>   EDID with the SCDC flag was forced on a connector with no DDC
> - Note: drm_connector_get() is omitted from drm_scdc_debugfs_init
>   because drm_scdc_debugfs_init is called on connector construction and
>   the debugfs is removed on connector destruction. Adding a redundant
>   reference increase here would necessitate introducing a destruction
>   callback to mirror the debugfs_init connector op for the sole purpose
>   of decreasing the counter again.
> - Link to v7: https://patch.msgid.link/20260721-scdc-link-health-v7-0-92d=
f1b6ad5fc@collabora.com
>
> Changes in v7:
> - Move HDMI debugfs registration to new state helper, fix up all users
>   (sun4i, vc4, bridge)
> - Register scdc debugfs in new hdmi debugfs helper
> - Link to v6: https://patch.msgid.link/20260611-scdc-link-health-v6-0-630=
7875a6b5e@collabora.com
>
> Changes in v6:
> - Fix off-by-one error in drm_scdc_read_state
> - Link to v5: https://patch.msgid.link/20260604-scdc-link-health-v5-0-111=
73b0ac3de@collabora.com
>
> Changes in v5:
> - Read all SCDC data regardless of update flags
> - Dump SCDC data as hex before the human-readable output. It's separated
>   with "\n----------------\n\n".
> - No longer write 0 to read-only registers
> - Add Reed-Solomon Corrections counter parsing
> - Parsing has been kept. A desire was expressed to get this data without
>   any external userspace tooling, and the kernel will need to parse it
>   eventually anyway to set the link status.
> - Functions have been made static as of right now, since external users
>   may do another pass over the function signatures anyway.
> - Link to v4: https://patch.msgid.link/20260527-scdc-link-health-v4-0-622=
ea40a1f59@collabora.com
>
> Changes in v4:
> - Don't use C struct bitfields for parsing status flags. Switch to
>   bitwise AND for boolean flags, and FIELD_GET for multi-bit values.
> - Drop the superfluous !! and parens
> - Drop the __pure attributes on static functions
> - Initialise stack local arrays with {}, not { 0 }.
> - I've kept the print macros and %-30s format. Reason being that I don't
>   want to repeat the format specifier and str_yes_no(foo) a bunch, and I
>   like the %-30s format because it means all values are aligned with the
>   value of the longest field, which is 30 chars long.
> - Link to v3: https://patch.msgid.link/20260526-scdc-link-health-v3-0-59e=
4a4aaead1@collabora.com
>
> Changes in v3:
> - Add patch to change return type of drm_scdc_read/write.
> - Rework error counter reading to duplicate less code.
> - Also check lane 3 counter valid flag when reading its error counter.
> - Use memset to clear buf for error counters, rather than doing it in
>   the loop.
> - Make read_error_counters not accept 0 as num_lanes; fix it up in the
>   caller instead.
> - Link to v2: https://patch.msgid.link/20260520-scdc-link-health-v2-0-511=
af18cd64b@collabora.com
>
> Changes in v2:
> - Add HDMI 2.1 SCDC status reporting
> - Link to v1: https://patch.msgid.link/20260415-scdc-link-health-v1-0-8e7=
31e88eaf0@collabora.com
>
> To: Jani Nikula <jani.nikula@linux.intel.com>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Andrzej Hajda <andrzej.hajda@intel.com>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Robert Foss <rfoss@kernel.org>
> To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> To: Jonas Karlman <jonas@kwiboo.se>
> To: Jernej Skrabec <jernej.skrabec@gmail.com>
> To: Luca Ceresoli <luca.ceresoli@bootlin.com>
> To: Daniel Stone <daniel@fooishbar.org>
> To: Hans Verkuil <hverkuil+cisco@kernel.org>
> To: Chen-Yu Tsai <wens@kernel.org>
> To: Samuel Holland <samuel@sholland.org>
> To: Dave Stevenson <dave.stevenson@raspberrypi.com>
> To: Ma=C3=ADra Canal <mcanal@igalia.com>
> To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kernel@collabora.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>
> ---
> Nicolas Frattaroli (5):
>       drm/scdc-helper: Don't use ssize_t return type for scdc_read/write
>       drm/scdc-helper: Add scdc_status debugfs entry
>       drm/scdc-helper: Implement parsing and printing HDMI 2.1 fields
>       drm/debugfs: Move HDMI debugfs registration to state helper
>       drm/display: hdmi-state-helper: Init SCDC debugfs for HDMI
>
>  drivers/gpu/drm/display/drm_bridge_connector.c  |   3 +
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 156 +++++++++++++
>  drivers/gpu/drm/display/drm_scdc_helper.c       | 289 ++++++++++++++++++=
+++++-
>  drivers/gpu/drm/drm_debugfs.c                   | 157 -------------
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c          |   1 +
>  drivers/gpu/drm/vc4/vc4_hdmi.c                  |   1 +
>  include/drm/display/drm_hdmi_state_helper.h     |   3 +
>  include/drm/display/drm_scdc.h                  |  21 +-
>  include/drm/display/drm_scdc_helper.h           | 103 ++++++++-
>  9 files changed, 568 insertions(+), 166 deletions(-)
> ---
> base-commit: b747a63003130bef1a3d5d6ba97c94d0cee36f55
> change-id: 20260413-scdc-link-health-89326013d96c
>
> Best regards,
> --=20=20
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>

--=20
Jani Nikula, Intel

