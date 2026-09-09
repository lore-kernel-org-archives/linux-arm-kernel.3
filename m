Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D53C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 16:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yG+S01jgDNF6gG2aUjEkOKkHDiymuefIawG26yDnYyI=; b=eoThTkTdAZAhBteb0LuO2ZgrNa
	hQIIehnXGhZnr1wvDsaUb5ICgyFQNscPeCU7odgzQgvJiqv/GC93OmeqBKxCbhYG3HGfzf2DYIggk
	5Qcq26vy3OkOUyN/oh0hDHMJ+FgIw3DULDFU3eP5Dosgrs88df3S3Gw3gMdBWjQMT1BN3Px/LgyPo
	bY28oT2nwavnOT2FhkOj4LKapcODrHdydeUTb7ivt0xhS7Zj9M5ET68qMWwTv/HtMsHlPvJuEHNZJ
	r9uExt9NuaRkdnTZsNS7rDtAnzxUhoSRYe7ThXot9sRRPWGUMbvKyCAc3wH+A1dM7rompqsa/sd4i
	Kc0j7MVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LDu-0000000CKOv-01xN;
	Wed, 09 Sep 2026 16:32:34 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LDr-0000000CKMu-1CJs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 16:32:32 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49d1331ce1bso1432475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 09:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971549; x=1789576349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yG+S01jgDNF6gG2aUjEkOKkHDiymuefIawG26yDnYyI=;
        b=J0EAgTxeJUVolvsmjPKDrkCjqokcn63gyT/i2NJrofeMUDsneT4rsEqONhYRuMQYwE
         VxmKx6URM13XOInMWUBVqDlMyHrfZte+6zwqzRk/IvzQPCFYDFDz6M3dpvN8S9ZAa9jz
         cJbSb8+cpXrcJ/MbsNknbDYwqE+JLs6MmfwVEO1FBTSLt0sfxO4UIBWYBFoxuGHAdJGr
         a94oflf8a4BoDAUMpDeY2AWoZ/AlruTVUlsR6iZXKhPvENk2pPPXRmsklV2opdREULIB
         QGsg/++rpu12K5t7fl1Uzj8ddaQS7U0DpAdLpTENwHEWSlZ5cHEjc5wIcUVDCa0eyfF+
         fO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971549; x=1789576349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yG+S01jgDNF6gG2aUjEkOKkHDiymuefIawG26yDnYyI=;
        b=ALmJ+xO3rTTFXnqn+2MZBWgruod7ARpzUarxxAhaUE2SM1Ya/drf5fZ6Ey78YU2blg
         5nvO54wvr1/TFbrqPPRuVxKF8wgmIDhGDow//P/dEvQi+/aOKXyhLVtNVZoWJTCW6qxt
         qJsGqmaITwYcZZBABa+A8lBMZFd/cOh2vXPbDe4TldPvZRM0fgZoJVDQILCpeTYbsSH3
         zoWfgREGZlJNbLqdDM0y96Ii/b0tT6t9IjdCdQvkV0hyYrHQXsBSHMEfodRbT98uS5uU
         JI3SI8l/AVhl8cQoWWNV78JwsRVCdH0RAb2tj8+gdC0m+N5g5gEwT8LhJoeawkvAqpGO
         9fXw==
X-Forwarded-Encrypted: i=1; AKwUvBx/hB6I/SxfauPfIx4jHcVVnwM6+23BLlf3Nx/ZPHQFfuffR1Mh7yTCGzO0lvQlSXWo68d7i2E+AGvU774vfZZE@lists.infradead.org
X-Gm-Message-State: AFuF++k5o6eV6V4SS1ZxMs5R86QCeFl3OMl2xBQO/HIU38eN9myFrjkF
	MKPXZdwLu37XJCJLyoJEtz4rHo8UpXz30dZkB7b3nSDboIEGl2HxkdU8
X-Gm-Gg: AYBFou1miTV5cRp40LX0RGNdR/OZK3SQ6A99/+9R7sjkY27zkgvXLTb1F+kqyRoUzx7
	Vs1UhPRqYGwe7KvrdVEcM72hWvMpaGzbd4Ad61XokYZ6NOmpUU6Z3Z+0stwcXIN1QlD6BE9NlCL
	HjFYSOZAJMXeAnnJsfMGaJWn1Gw6OrdCGFiGFghgLFSDv91Y8cX4Kwj2A5zqOGbi/LdJxFkOrcX
	i+sdRrjjG5DFBcMYEn9UJDTRGjcFszWIQYSUbbhQ26PyDrgZxLN1ynorudxouOWAhiQ/DeBtn/T
	1Dulomo2xbXw6+NXCCsmUy68aVyCEjbiAAGtVbIy3j7IAzBRz++pS0lXoQL6RkCkmJpp6hkCGiK
	S4RzpI7Q/ifOxPd2dS6Ewkdh5gtf7zTdvVUQGl/ebbN/8vb9sI3L5iOx63tCueDdrW0Bn1xLXKh
	nidG5jNs+G1ojWVhvRIvBu9fNseCORPg2N31A6yUT8sTqwQyce0/gezbuscE9P1V58c60jrQ3JW
	0TqvLF/1nhmxhLWwKsDWNYKJhw4CCQA26CUqUCHOuhXJcKTTKl1Zm52+lsecwpcbyYiGpzAurhy
	Z3rc
X-Received: by 2002:a05:600c:620f:b0:49c:eac2:ddad with SMTP id 5b1f17b1804b1-49d2570acaemr21422495e9.1.1788971549021;
        Wed, 09 Sep 2026 09:32:29 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B836900E58FC5516AABB3E4.dsl.pool.telekom.hu. [2001:4c4e:1b83:6900:e58f:c551:6aab:b3e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bf332esm2604635e9.8.2026.09.09.09.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:32:28 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Igor Paunovic <royalnet026@gmail.com>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 0/3] drm/dp: shared HDR metadata SDP helper, and max bpc for dw-dp
Date: Wed,  9 Sep 2026 18:31:58 +0200
Message-ID: <20260909163206.36409-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093231_363527_FE33A4A2 
X-CRM114-Status: GOOD (  21.73  )
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

This is v2 of "drm/bridge: synopsys: dw-dp: Add HDR support" [1], resent
as three patches instead of five.

The two patches that actually enabled HDR output on dw-dp are not here.
They were written on top of Sebastian's "Synopsys DisplayPort Controller
improvements for RK3588" series, and that series has not landed. I
checked rather than assumed: against drm-misc-next they no longer apply,
and every failing hunk sits on context that only exists in that series -
vsc_sdp_nr, audio_sdp_nr, dw_dp_clear_sdp(), the runtime PM conversion
and dw_dp_rockchip_hpd_sw_cfg(). None of those symbols are in mainline.
Holding the rest hostage to that seemed wrong when the first three
patches stand on their own, so they go alone and I will resend the other
two once the dw-dp work is in.

What is left is useful without them:

 1/3 moves i915's private HDR metadata SDP packing into a shared DP
     helper and converts i915 to use it. No functional change; the
     second user follows later. Jani's Ack from v1 is carried over.

 2/3 fixes a real bug: the bridge connector loses its max bpc value on
     connector reset, so a driver that attaches the property gets it
     reset behind userspace's back.

 3/3 attaches the "max bpc" property on dw-dp. To be precise about what
     that does: the property is a limit, not an enabler.
     drm_atomic_connector_check() derives max_bpc from the sink's EDID
     and only clamps it against max_requested_bpc when the property
     exists, so the min() can never raise it. dw-dp's format filter
     therefore already lets its 10 bpc entries through on a sink that
     reports 10 bpc, with no property attached. What the property adds
     is userspace control - the ability to ask for less - and a defined
     upper bound of 10, the deepest entry in dw_dp_output_formats[]. It
     is also the case that motivated 2/3, and a prerequisite for the
     HDR patches that follow later.

Changes in v2:
 - Dropped 4/5 and 5/5; they depend on the dw-dp improvements series
   and no longer apply to drm-misc-next.
 - Retitled the series, since it no longer adds HDR support by itself.
 - Rebased onto drm-misc-next bf63a72ea005. No changes to the code.

One thing worth flagging for 2/3 and 3/3: Cristian's HDMI 2.0 series
removes connector->max_bpc in its patch 71. That series is not in
drm-misc-next either, so these two are correct as they stand today, but
if it lands first I will respin them against whatever replaces that
field. Say the word if you would rather I wait for it.

A note on how this was made, since the patches carry Assisted-by tags.
I work in a pair: I run the board, take the measurements and decide what
goes in; an LLM assistant (Claude, by Anthropic) helps me read the
source, draft the changelogs and re-check my claims against the tree
before I send anything.

What I have not done here is boot-test this exact three-patch series on
hardware. The code is unchanged from v1, whose runtime testing was done
on an Orange Pi 5 Plus running a rockchip-devel kernel that carried the
v9 generation of the dw-dp series, with the patches on top; those runtime
tests were never repeated on plain drm-misc-next. That caveat bites
hardest on 3/3: mainline's dw_dp-rockchip.c is not the file I tested
against. For v2 I have only checked that the patches apply and build-
tested nothing. Say so and I will do a full build and boot test before
you take it.

[1] https://lore.kernel.org/all/20260808095749.9428-1-royalnet026@gmail.com/

Igor Paunovic (3):
  drm/dp: Add drm_dp_hdr_metadata_infoframe_sdp_pack()
  drm/display: bridge-connector: Preserve max bpc across connector reset
  drm/rockchip: dw_dp: Attach "max bpc" connector property

 drivers/gpu/drm/display/drm_bridge_connector.c |  6 +-
 drivers/gpu/drm/display/drm_dp_helper.c        | 88 ++++++++++++++++++++++++++
 drivers/gpu/drm/drm_connector.c                |  5 ++
 drivers/gpu/drm/i915/display/intel_dp.c        | 84 +-----------------------
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c      | 26 ++++++++
 include/drm/display/drm_dp_helper.h            |  4 ++
 6 files changed, 131 insertions(+), 82 deletions(-)

base-commit: bf63a72ea005d5e1cc12a9ad5e228c4b44246b0f

