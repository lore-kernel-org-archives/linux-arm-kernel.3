Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18EDC44520
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 11:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nrmn9JnAUSFb3FQ2ARJKUpkkcIgVFhmL+iD3YNZEr6g=; b=YupIpJ0GwdrOUaaQTFE7S+peOb
	6ZBpQDm6YVBV6XyJrlMp8M3WJAMNUZSBnEjlmTPM79icjn/9dyldanQcaBqZmrJwFYXvy6eo9az73
	AYrGXGWKGcbQm0ggVFOqSFX54JygPoM2UsKOwRXc0waKfm3IxZ+aADZTkUiQr47Zipy01dux57cIP
	AQlNsIX2VY1DS8jYMhnlOvxW7jurbpYTMNsQiNLFSQfICvSl2eTQ5bpfljMYQznBfZkKb709El5rp
	NeSNOhCn9Xmu3LDh522G/gQqOwsFCazCnUfM68ax/frWgQtVy2fw5ORhoG502h/7bb4pzVxhv+rqY
	q7Famdyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl33P-000000042jd-47hw;
	Sat, 18 Jul 2026 11:17:59 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl33M-000000042i0-3U6n
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 11:17:58 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mieulab.com; s=key1;
	t=1784373463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nrmn9JnAUSFb3FQ2ARJKUpkkcIgVFhmL+iD3YNZEr6g=;
	b=bBR39izvKO+1yCIHI/DvLs3Nh+aEIWvJlMDVAER4IbmPudR0PefsHliyiPErIo+a9zrPk3
	taHU+rmseiz2i8FSXpcBfqRgnJVPf+T7CJevJHjaiFUqakU/AXQw/DZiC9xWBWxUhW2ZLl
	AklqRQiONX++pp+v4au/OY9Plqqngy7tCliJUBjreTUfFV580ZppJGEJ/f4qvZr4c3+x20
	G/vNVT4THw8+c41G7w3wGC67rBwI29J1wYICaNSAcBPfmrLK/OZ8lVaFRP6n25+j0PkS5n
	exQmVqVoyZzCub3qCzGaJnB3MJSkM5YTuxwthQ5hB/91baUL/NGB9c16d7zfYw==
From: Zinan Zhou <zinan@mieulab.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Zinan Zhou <zinan@mieulab.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] drm/meson: add HDMI support for GXLX2
Date: Sat, 18 Jul 2026 20:15:25 +0900
Message-ID: <20260718111527.119231-1-zinan@mieulab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_041757_013074_0D866532 
X-CRM114-Status: GOOD (  14.90  )
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

This RFC adds HDMI transmitter support for the Amlogic GXLX2 family,
observed as an S905L3 (CPU major ID 0x2a) in a FiberHome HG680-LC set-top
box.

GXLX2 is unusual in that the display pipeline, clocks and HDMI PHY follow
the older GXL path, while the HDMI controller register interface is
directly mapped: DWC registers are byte-addressed from 0xda800000 and TOP
registers are 32-bit registers at 0xda808000 + index * 4. The existing
G12A access callbacks implement this layout, but using all G12A match data
would select the wrong PHY initialization for GXLX2.

Patch 1 proposes a dedicated amlogic,meson-gxlx2-dw-hdmi compatible
without a meson-gx-dw-hdmi fallback. Patch 2 adds dedicated match data
combining direct register callbacks with GXL PHY behavior. It also handles
the GXLX2 value for the 297 MHz PHY bucket and adds the compatible to the
Meson DRM component match list.

This RFC depends on the separately posted common Meson DW-HDMI regmap fix:

  drm/meson: constrain the DW-HDMI regmap range
  https://lore.kernel.org/all/20260718090710.70534-1-zinan@mieulab.com/

That formal bug-fix patch bounds register iteration below the directly
mapped TOP block and prevents the legacy 16-bit indirect interface from
wrapping. It is intentionally not part of this RFC so it can be reviewed
and merged without waiting for agreement on the GXLX2 DT ABI.

I would particularly appreciate feedback on two DT ABI questions:

1. Is amlogic,meson-gxlx2-dw-hdmi the appropriate block compatible name?
2. Should the DWC and TOP windows be represented as one contiguous MMIO
   resource, as in this RFC, or as two named resources?

Evidence and disclosure:

- The GXLX2 addresses and 297 MHz value are factual results of analysis of
  the HG680-LC vendor kernel. Firmware SHA-256 and focused behavioral
  evidence can be supplied if useful, but no firmware, kallsyms dump or
  disassembly is part of this submission.
- Public Amlogic-derived GPL source documents the ordinary GXL 2.97 Gbps
  values and public GPL-2.0+/MIT source documents the same direct DWC/TOP
  access mechanism used on later SoCs. The implementation here does not
  copy a vendor function body.

Testing:

- An equivalent Linux 6.6.18 implementation boots from eMMC on the
  HG680-LC.
- 1920x1080 HDMI video was physically verified on an LG 27GL850.
- Two-channel HDMI LPCM through the display and analog stereo audio were
  physically verified.
- The downstream 6.12 port boots from eMMC with working Ethernet/SSH and
  has physically verified 1920x1080@60 video and HDMI LPCM.
- With the generic Meson non-CEA mode-range change already present in
  current mainline, 2560x1440@59.95 video and HDMI LPCM were physically
  verified on the display's native timing.
- The RFC port builds on arm64 and its binding passes dt_binding_check.
- 3840x2160 at 30 Hz has not yet been physically tested. That test is
  required before a non-RFC PATCH v1 because it exercises the
  GXLX2-specific 297 MHz branch. It is not a blocker for the verified
  1080p/1440p use case.
- No other GXLX2 board has been tested yet.

The initial RFC intentionally contains no board DTS. A downstream-only
HG680-LC DTS is being kept as DO NOT MERGE until the compatible and resource
model have received initial feedback.

Assisted-by: Codex:gpt-5.6-sol

Zinan Zhou (2):
  dt-bindings: display: meson-dw-hdmi: add GXLX2 compatible
  drm/meson: add GXLX2 HDMI register support

 .../display/amlogic,meson-dw-hdmi.yaml        |  7 ++--
 drivers/gpu/drm/meson/meson_drv.c             |  1 +
 drivers/gpu/drm/meson/meson_dw_hdmi.c         | 33 ++++++++++++++++---
 3 files changed, 34 insertions(+), 7 deletions(-)


base-commit: b0a652436b892eb9a036a031b33099dca036faaa
prerequisite-patch-id: 0a689485bbc3c1d77d52aeee0b81e4943d1e904a
-- 
2.43.0

