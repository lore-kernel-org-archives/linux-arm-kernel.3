Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97679CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rpd99AIfen8rWG+UPKOfHkTFca1MdKE/O0Nq5tdqzEM=; b=Patj3nJqLBfw2z8PoYj4cUutfh
	X/CRxfjp0ACTCheeyy3RfzDHgFMXRboymPXh3VESzYCiROR8i0MCP07MnXtmrQY6GRhyxsxxObMVN
	+gI+MbyYfKWBhanhdSypdvXGsusmOeXUanhhL3bJh9vgY/yQ9q6Ehtp74VqDQjcPFLOYj7Ke1dV2X
	ziWPzkJo9CTlBPun5eTJEWaL9ut6DEBulGpKvzNwgNkR0/Cpthj35ppzSlX/ivMteE1PxMOsfM0xp
	fhgv1pX6I80QmNF/Aq715JbBayJ2OdNZU44RyV7KHaBZjbWQwo1Yq29vYOI3cudcRKZ8iepLdocD4
	sdjX4kjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGEp-00000007Oyt-3jr4;
	Wed, 10 Jun 2026 10:32:47 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGEn-00000007OyM-0knj;
	Wed, 10 Jun 2026 10:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781087565; x=1812623565;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=4QR48FPX6NW6pWd+A0RB2168FFt8Kbmy8OacTeDGsas=;
  b=d2Sl/xuCjggBt/MFuBegjAfDfwMICbKitjxK53xm9FUe+ABEVfobWE+L
   npnf4MCxWciKfzOcxu28OB7lcPau/l9eFkTZ3Wu8MoAUikdTdlLJwXk7b
   I1yvF1uiQaPQwBFl6j5ghX6Ag/9/x8sWVi0xzvvvAA4+4DkGRdiA0fZW5
   YlqRVuU4Za1vy1GAyhCidgIpBcRRKaXe+XkiIrvcGzgUiQ0bKwBhlt8c1
   b74MiEcB6Kfw2wqbSZKjhMZdXGpv5m1lGgh9uGQ/2L1ABQ+u8GnM4LYQW
   KGI11GD+bbCTVKTtRAuc2aBRi2sHkWi5Nx6/A0EzspsOXpCgHlO5I4KtR
   w==;
X-CSE-ConnectionGUID: XZGkcOCNQR+RPSZ5PAHTuw==
X-CSE-MsgGUID: +KCtw5L0QgCvn/PbeiX1cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85721112"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="85721112"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:32:43 -0700
X-CSE-ConnectionGUID: 7vHeeByYR6mbP2vHMrx5EQ==
X-CSE-MsgGUID: HeuP8FBRTDSW4l3PyZ1Pfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="250415777"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.3])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:32:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan
 <andy.yan@rock-chips.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Daniel Stone
 <daniel@fooishbar.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, Nicolas
 Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v17 21/28] drm/tests: bridge: Add KUnit tests for bridge
 chain format selection
In-Reply-To: <20260609-color-format-v17-21-35739b5782cc@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
 <20260609-color-format-v17-21-35739b5782cc@collabora.com>
Date: Wed, 10 Jun 2026 13:32:29 +0300
Message-ID: <04ff70850213ae0f75486b1a27a7edb6fb4e71c3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_033245_278100_49F09A6D 
X-CRM114-Status: GOOD (  16.06  )
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

On Tue, 09 Jun 2026, Nicolas Frattaroli <nicolas.frattaroli@collabora.com> =
wrote:
> diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/te=
sts/drm_bridge_test.c
> index 64b665580a88..92f142ca6695 100644
> --- a/drivers/gpu/drm/tests/drm_bridge_test.c
> +++ b/drivers/gpu/drm/tests/drm_bridge_test.c
> @@ -2,15 +2,23 @@
>  /*
>   * Kunit test for drm_bridge functions
>   */
> +#include <linux/cleanup.h>
> +#include <linux/media-bus-format.h>
> +
>  #include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_bridge_connector.h>
>  #include <drm/drm_bridge_helper.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_kunit_helpers.h>
> +#include <drm/drm_managed.h>
>=20=20
>  #include <kunit/device.h>
>  #include <kunit/test.h>
>=20=20
> +#include "drm_kunit_edid.h"

So here's the problem with adding *any* arrays into headers: every
compilation unit that includes them duplicates all the arrays. It's only
really okay for single use.

And, in this case, most of the included arrays are unused, leading to
build failures:

  CC [M]  drivers/gpu/drm/tests/drm_bridge_test.o
In file included from ../drivers/gpu/drm/tests/drm_bridge_test.c:21:
../drivers/gpu/drm/tests/drm_kunit_edid.h:958:28: error: =E2=80=98test_edid=
_hdmi_4k_rgb_yuv420_dc_max_340mhz=E2=80=99 defined but not used [-Werror=3D=
unused-const-variable=3D]
  958 | static const unsigned char test_edid_hdmi_4k_rgb_yuv420_dc_max_340m=
hz[] =3D {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:726:28: error: =E2=80=98test_edid=
_hdmi_1080p_rgb_yuv_dc_max_340mhz=E2=80=99 defined but not used [-Werror=3D=
unused-const-variable=3D]
  726 | static const unsigned char test_edid_hdmi_1080p_rgb_yuv_dc_max_340m=
hz[] =3D {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:612:28: error: =E2=80=98test_edid=
_hdmi_1080p_rgb_yuv_dc_max_200mhz=E2=80=99 defined but not used [-Werror=3D=
unused-const-variable=3D]
  612 | static const unsigned char test_edid_hdmi_1080p_rgb_yuv_dc_max_200m=
hz[] =3D {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:498:28: error: =E2=80=98test_edid=
_hdmi_1080p_rgb_max_340mhz=E2=80=99 defined but not used [-Werror=3Dunused-=
const-variable=3D]
  498 | static const unsigned char test_edid_hdmi_1080p_rgb_max_340mhz[] =
=3D {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:390:28: error: =E2=80=98test_edid=
_hdmi_1080p_rgb_max_200mhz_hdr=E2=80=99 defined but not used [-Werror=3Dunu=
sed-const-variable=3D]
  390 | static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz_hdr[=
] =3D {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:271:28: error: =E2=80=98test_edid=
_hdmi_1080p_rgb_max_200mhz=E2=80=99 defined but not used [-Werror=3Dunused-=
const-variable=3D]
  271 | static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz[] =
=3D {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:163:28: error: =E2=80=98test_edid=
_hdmi_1080p_rgb_max_100mhz=E2=80=99 defined but not used [-Werror=3Dunused-=
const-variable=3D]
  163 | static const unsigned char test_edid_hdmi_1080p_rgb_max_100mhz[] =
=3D {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:57:28: error: =E2=80=98test_edid_=
dvi_1080p=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
   57 | static const unsigned char test_edid_dvi_1080p[] =3D {
      |                            ^~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

This breaks the build for me, I don't know how it didn't for any of you.

Reverting these two fixes it:

ce1d0139adac ("drm/tests: bridge: Add test for HDMI output bus formats help=
er")
082fbc179c01 ("drm/tests: bridge: Add KUnit tests for bridge chain format s=
election")

I think the proper fix would be to move the arrays into a .c file, and
only have declarations in the headers. But that needs to happen real
soon or the commits need to be reverted.


BR,
Jani.


--=20
Jani Nikula, Intel

