Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CD1C5AD2B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 09:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IsmdHGBBN2+wKUl5FWJM6Pw9aztZUCcwWWnKCiJWwQo=; b=elPWzm2qlEe3y0ticJeO+uMJyL
	GZU8VZT9OTSSaqE4hd9fVmNcWgecz5nCqzaFevmJqKqhU2FMOMfTXyKcFaARQPmRD5E//MSLvP+bm
	HWOSL+DgHktqf0Peg9+Vhu1aBkyfc4XSOcTNA4OsjFCQldmiW1RWnW6A7BQqPAfhsnZ70G2Dj6v0a
	R/PBGFhgi4L5yEwRyUWTCYfmLEIt81fPzeiwp/Xg6LAawl3qLwd6PqzIk3ikxRXK1eQQf6oYME81L
	zh2i1YBWI8yqfWMuh+j9OALWeZPM/v4cARBJAvpBzWgb+qgDRRo8AJ48GCdynv8MyJwQyYN+ksBVz
	IL98n/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdor-00000009Eys-31La;
	Sat, 08 Aug 2026 09:58:21 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdop-00000009ExU-0Jbd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 09:58:20 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47c2ae992beso20906f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 02:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786183097; x=1786787897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IsmdHGBBN2+wKUl5FWJM6Pw9aztZUCcwWWnKCiJWwQo=;
        b=kjE5eLqmZRphMxMWtetJWUAQJspS3CjosMBZYyGW8Jys4AYJJycU9TVRUTWURdZLMV
         e5qSy9SZxXfCaLfvetDHfDBLtXYoceru+BxBPW40r+yFNWyN4eorBdJEkomtOK1cpbGQ
         L/A40+/AZnuLeiAgYw2718198wpSaWUaX2nfAllGGvY+v0haoWbrZvI9jxFw2ci1TPhL
         aa4SojM75R74wDlFk0rDk2sYgBtMhyZCqHbrmYfDa7R/HnaMGP5RhAkXjA44akbqJa9m
         DtI4gS+R5LLylvijsBnK7WZ/bro3MOVHyT7AOaOFkUsNSB44MJ95iFVFdhf8/+ouWynd
         3hLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786183097; x=1786787897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IsmdHGBBN2+wKUl5FWJM6Pw9aztZUCcwWWnKCiJWwQo=;
        b=K/F4cIeu1Xt9d2HjXir0PqMOK3LlLjRxwSDgGkISlddi1xMz0027oy+n8FkD1q1LrF
         gAz476CEiAGe5BTqX1D7bqO23wk0fBU2o6jpBaSNsTTSoTpVvPOkTwmAupYyzgJfKhHX
         KdVauQQKDgAthVToTX0zBmxyhH7J+MyPKcCdSD0EaOw4d8KGTwrORtlsXsa8n3L1+aej
         AElC1VLLkrxVCEm1I8D4Ep7FWX6iLdQLCG49HolC289apykYrHBvhwwhfgDCMIpoJ6Dv
         gZZnRA+Dn4TClw0lNi8sv3wcZTikiZME3KguEN50O5vqDpCy+j3uGYKfDtwR5WhZ0zCb
         8/7g==
X-Forwarded-Encrypted: i=1; AHgh+RotxGNsAk8wSNYJ9RqxJyPnBcnwMO1PbGLjQ9L8hSX7w4Qy/lc/8Y41Mu5EDkZ/DFaCLkxYbxbzXTTb2yRLIN9V@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0mKiSrcL+bio9TFsCBsgEj/vHZdrEy9T5Jc35jvVpQD2iaVps
	aWWfJ5K99+dbRAh/0/l1Wevd5bRA3TGzCSYv/7x4zre8qt/ALwwuZckj
X-Gm-Gg: AR+sD11b9o0StgqXH6gydmQWJ+ewfRaao5Bipc9km5P7RFYk91ZBIk5yiOu4F8A8Sd5
	QBMkFymm5TRCqP5lc48sYTi1+ljpbE+4dF3SRBql/LWczEoZpcKJvbxpuoHKYAe6gbOp6TTcKUv
	CtUKWH/TDg0kMnsGDldJ6Gnd9X3esYI6qKUM+xas4nB6q4pWFJKpfPOmdPyoptdhKMOYkvTIZEj
	PqugbAi0EZBVlodPRS2P55xj74dNBye/YSTx+rgsDDtlRURNCiOIAoccHGIhGPB+3/J0kxCokqG
	XThIvqH4U8S8VrULjKe83yIf/nM3YGQpriCSaylYvHlBrPKxPhI0Mp6UjY6S30oZSOCt2m9jdI/
	1oWtJRDrMuXR58Jog7I2PDucl21YwbtbiElx5JxDDvvc0HyHv6YC0nNU2dQ7B78Ijy9ILgs/Shs
	rGHBAvX6TYCzVIC6HRO+OW4Pc+YXafFRM2sqbMAosxUaq/tryJ0+2KRQ/lB1eEyNgs0wjbuIYya
	tG8zgVH2cVekCXOozHMRvWLXWbwxMs3j4b45chCSaUsCXaSzRWyPyIgEClaJdz9Z5O2TfJqjDP3
	aYxQ
X-Received: by 2002:a05:6000:1447:b0:47f:921f:397f with SMTP id ffacd0b85a97d-47fec63e5bbmr22556379f8f.4.1786183096888;
        Sat, 08 Aug 2026 02:58:16 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8E20009911270F4BEC2300.dsl.pool.telekom.hu. [2001:4c4e:1b8e:2000:9911:270f:4bec:2300])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480020be8f3sm13255725f8f.0.2026.08.08.02.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:58:16 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
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
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 0/5] drm/bridge: synopsys: dw-dp: Add HDR support
Date: Sat,  8 Aug 2026 11:57:19 +0200
Message-ID: <20260808095749.9428-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_025819_144064_82702F56 
X-CRM114-Status: GOOD (  17.72  )
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

This series teaches the Synopsys DesignWare DisplayPort bridge driver
(dw-dp) to drive HDR sinks: it attaches the "max bpc",
HDR_OUTPUT_METADATA and Colorspace connector properties and transmits
the matching HDR Metadata InfoFrame SDP and BT.2020 VSC SDP
colorimetry on the link. With the series applied, a Wayland compositor
(tested with KWin 6.6.5) recognises the DP output as HDR capable and
can enable HDR with wide color gamut on it.

The series applies on drm-misc-next with Sebastian Reichel's
"Synopsys DisplayPort Controller improvements" v11 [1] applied; the
SDP infrastructure this series builds on (per-slot tracking, locking,
the drm_output_color_format conversion) comes from that series. Happy
to rebase on a future revision.

Patch 1 lifts i915's HDR Metadata InfoFrame SDP packer into
drm_dp_helper.c as drm_dp_hdr_metadata_infoframe_sdp_pack() and
converts i915. Nothing in it is i915 specific.

Patch 2 fixes a latent bridge-connector problem that attaching
"max bpc" would otherwise expose: a connector that attached the
property before drm_mode_config_reset() comes out of that reset with a
freshly zeroed state and nothing restores max_requested_bpc. A driver
that filters formats on conn_state->max_bpc then rejects every format,
and property-naive clients (fbcon in particular) end up with a black
screen. The HDMI bridge-connector path already restores the value from
connector->max_bpc in drm_bridge_connector_create_state(); patch 2
mirrors that on the non-HDMI path. The meson no-regression analysis is
in the commit message.

Patches 3-5 are the dw-dp/Rockchip side: attach "max bpc" with range
(6, 10) - the driver's format table tops out at 10 bpc - then send the
HDR Metadata InfoFrame SDP once per frame while HDR metadata is set,
and signal BT.2020 colorimetry via VSC SDP revision 5, including the
VOP2 CSC selection in the Rockchip glue. BT.2020 requests are rejected
in atomic_check() when the sink's DPCD lacks
DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED, so a userspace TEST_ONLY
probe learns the configuration is impossible; i915 instead silently
omits the VSC SDP in that case (patch 5 has the details).

About the base, so that the test results below are not read too
widely: the runtime testing was done on a rockchip-devel based kernel,
which carries the v9 generation of the dw-dp series, with this series
on top.  The series as posted is rebased onto drm-misc-next + v11,
where it applies without conflicts and the touched objects build
cleanly, but I have not repeated the runtime tests on that base.  I
did test v11 itself on the same board separately [2].

Hardware: Rockchip RK3588 (Orange Pi 5 Plus), Samsung Odyssey G70B
connected over USB-C DP alt mode through a USB-C to HDMI 2.1 protocol
converter (DPCD ext rev 1.4, HBR2 x4, VSC SDP colorimetry supported):

- KWin 6.6.5 flips the output from "HDR: incapable" to HDR capable as
  soon as the properties appear, and enables HDR + wide color gamut:
  the monitor switches to HDR mode and the picture visually matches
  the same panel driven from the board's HDMI output (dw-hdmi-qp) with
  HDR enabled. DRM state while HDR is on: "max bpc" = 10, Colorspace =
  BT2020_RGB, HDR_OUTPUT_METADATA blob with SMPTE ST 2084 EOTF.
- Twelve consecutive HDR off/on cycles (24 modesets): no link or SDP
  errors and no -EBUSY from SDP slot allocation.
- Plain SDR behavior is unchanged. Once the properties exist KWin
  writes Colorspace=Default, a NULL metadata blob and "max bpc" on
  every atomic modeset - verified to be a no-op.
- The board boots to a working display with the properties attached,
  i.e. the boot-time config-reset path that patch 2 protects.

Bandwidth note, for why "max bpc" matters here: on this HBR2 link
4K60 RGB 10-bit does not fit (17.82 Gbit/s payload vs 17.28
available), so 10-bit output needs YCbCr subsampling on this
converter; native HBR3 links have the headroom for 4K60 10-bit RGB.

[1] https://lore.kernel.org/dri-devel/20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com/
[2] https://lore.kernel.org/all/20260808094138.7205-1-royalnet026@gmail.com/

Igor Paunovic (5):
  drm/dp: Add drm_dp_hdr_metadata_infoframe_sdp_pack()
  drm/display: bridge-connector: Preserve max bpc across connector reset
  drm/rockchip: dw_dp: Attach "max bpc" connector property
  drm/bridge: synopsys: dw-dp: Add HDR static metadata support
  drm/bridge: synopsys: dw-dp: Add BT.2020 colorimetry support

 drivers/gpu/drm/bridge/synopsys/dw-dp.c        | 86 ++++++++++++++++++++++---
 drivers/gpu/drm/display/drm_bridge_connector.c |  6 +-
 drivers/gpu/drm/display/drm_dp_helper.c        | 88 ++++++++++++++++++++++++++
 drivers/gpu/drm/drm_connector.c                |  5 ++
 drivers/gpu/drm/i915/display/intel_dp.c        | 84 +-----------------------
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c      | 66 ++++++++++++++++++-
 include/drm/display/drm_dp_helper.h            |  4 ++
 7 files changed, 248 insertions(+), 91 deletions(-)

--
2.43.0

