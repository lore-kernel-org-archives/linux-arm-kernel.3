Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BB2C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 18:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RrQzZfpCxDhDTUvmU/xu7QQkz7XyK4yJ3OjwJ8LYZqY=; b=A/5FPRQ/ENN3fuEeE0UXDtBn9j
	oyrDzIazITRAzp4e2wooN6UHuaajKa9VoLvwb5mM/D8L2N/pxQ/x0jimKsEQBRFfp5j1mefnw/QA/
	HsJgiurC5QR1FQgu7VPsucD5SUu7C4BwtoBQTQAQ8PwHXG+16r2lFUhPXF5hbLpPq4TiLEqS4sIso
	e5XWHPdcAlJqzKwrHEtroQppxMC5kdMA8CzNvR7b38a/rk4lCKfvzIalPfWnoYJqTfY6UgsBJ+vcp
	vIfEeOO9p7jCWipzYiJMUqNvKX4ngw2ReUzGEepyKdgsZQGdANXvR0g4oOcvwfGhppGWA+XtzYRXp
	ir1gPt7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjVw-00000002Lkd-2xGi;
	Sun, 16 Feb 2025 18:37:12 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjUT-00000002Lap-1S5t
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 18:35:43 +0000
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 45DA31140114;
	Sun, 16 Feb 2025 13:35:39 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Sun, 16 Feb 2025 13:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1739730939; x=1739817339; bh=RrQzZfpCxD
	hDTUvmU/xu7QQkz7XyK4yJ3OjwJ8LYZqY=; b=fQrHNQwav+ZiZUMpX5X25uHEoB
	o81/6m/uKNue6Z1qVMJaWXz6E6hwiSiH4zh04WECU6iz2EanCh/Seg2UYRXYlYxo
	FZU8CAVRdray/7wObe2Di8ba7sXseNNX7dRvYLZRVv4wq8BX8vsoECXF0m+p2Jd0
	grmtBBSmTq2+1M9P/UfHITC/QggjfaUKVyWS5Pc6IPsp4ULA9mJMqu9M53HpKfHO
	vodGN8zjloFQYwgmV6TLlyUGKW5eRes3g8ELQzCMmY75xbLEGKOdA0DcUzLcJ+vv
	aMncolqKHWK0pIrYCSWuFnr6exdfuncfOA62Gl27dVJkCWDZ+ruG5gsP0d7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739730939; x=1739817339; bh=RrQzZfpCxDhDTUvmU/xu7QQkz7XyK4yJ3Oj
	wJ8LYZqY=; b=JvfzEr1NnCtkC7PXzf6cVmPKsYtEtpIg7HGD3O9WdVH+ldOcvvN
	bTseaOQNRu5iQcdxlLg+kdxwgxBeSGdKFQwCcMKCMkBf/r58n2GN4C63zHBGnYqW
	Er5WQOZG6WRWHB5aIdDOa0S3QFZu6n7OLgyb6emuXr3ZCoPMVuhKX7BjmLB+LfQl
	JQ+j8+F1A/see+/FQ2C5GzXDnLLyc9UZgJYSVQgRVyLvWx0OjTtAVrMtKksiguOy
	gIORGCvJLE7koeHRKSZvQM1cVa7/oor9ObQ7Fg7y1Gal5iRNdkAZ9WYF/XJVWbzd
	kxqq9J0lNK6N75+l2nfDyuOMfUp2IiR/F4A==
X-ME-Sender: <xms:-S-yZ_DNO8-7wcw1RfCl0w3NxROVrD_ESyojm8T1ueCSrUz2wVkjQA>
    <xme:-S-yZ1hrsjjm3QpR8VQNNU5KkUon9oVHLdIOjnykJhj4ylkN8pz8Kv8nEF8eG1CYj
    tj8FuLav0mL2vuXAg>
X-ME-Received: <xmr:-S-yZ6kc6azSpFjoAegk4TkQAGwBjj0wQa9aLSMTGPI8qdVo1pzucNbZHPndATtMry8uBpjqb-fsGGOFGMyMmA-dsGzb0hfUiRWi8fwrPPAl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecu
    hfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtg
    homheqnecuggftrfgrthhtvghrnhepuddvueduueegtdeuffetveevgeehhedvhfefuddu
    veekgffgfedtheegtefhhfffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphht
    thhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrugeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgtphht
    thhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtoh
    hmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthho
    pegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlsehffh
    iflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdr
    tghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpth
    htoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-i-yZxx2sE34LJyYlTKv2CpdTCJvFtdnHeeeRkXuGrKzcar3agRyxA>
    <xmx:-i-yZ0Q2UwR6yDbhEsA-YP0rzTz9dkhtM1WLL3HjO-73VoPZXsgslA>
    <xmx:-i-yZ0bPxRlH65yPaSYaB4avIOkbVWVDafYGqNpMan2MlUOBn8TNMg>
    <xmx:-i-yZ1S2l-yywbgTyhDbtyy3w4LG40Ndpkt2uPkG9MSGPdOLvqykrw>
    <xmx:-y-yZ1CHEIJdhbTKjvPJzJ9PnHNvNm9z7hXoPJ0Kgs6jDLHt5sWbhVUE>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:35:31 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v7 00/27] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Mon, 17 Feb 2025 07:31:59 +1300
Message-ID: <20250216183524.12095-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_103541_870821_103AAD27 
X-CRM114-Status: GOOD (  19.15  )
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

Hi All,

v7 of this patch adding support for the Allwinner DE33 display engine, used in the H616 family of SoCs. Apologies for the short interval between versions but a compile error due to a missed helper function in patch 11 snuck by me. v7 only differs from v6 in adding this back.

v6 includes some small fixes to the device tree documentation, improves naming of an enum type, moves colorspace configuration from the sunxi engine object to the mixer object, and a handful of very small style and whitespace changes. All comments/tags from previous versions addressed. No functional change from v5. 

A v1 patch to enable LCD output for the Anbernic RGnnXX family of devices which use this SoC with an RGB LCD will be submitted shortly.

Thanks to those who have reviewed and tested previous versions, and to Jernej for the initial patch.

Original blurb below:

There is existing mainline support for the DE2 and DE3 AllWinner display pipeline IP blocks, used in the A64 and H6 among others, however the H700 (as well as the H616/H618 and the T507 automotive SoC) have a newer version of the Display Engine (v3.3/DE33) which adds additional high-resolution support as well as YUV colour formats and AFBC compression support.

This patch set adds DE33 support, following up from the previous RFC [1], with significant rework to break down the previous relatively complex set into more logical steps, detailed below.

1. Refactor the existing DE2/DE3 code in readiness to support YUV colour formats in the DE3 engine (patches 1-4).
2. Add YUV420 colour format support in the DE3 driver (patches 5-13).
3. Replace the is_de3 mixer flag with an enum to support multiple DE versions (patch 14).
4. Refactor the mixer, vi_scaler and some register code to merge common init code and more easily support multiple DE versions (patches 15-18).
5. Add Arm Frame Buffer Compression (AFBC) compressed buffer support to the DE3 driver. This is currently only supported for VI layers (for HW-decoded video output) but is well integrated into these changes and a subsequent patchset to enable the Video Engine is planned. (patch 19).
6. Add DT bindings for the DE33 engine. (patches 20-22).
7. Extend the DE2/3 driver for the DE33, comprising clock, mixer, vi_scaler, fmt and csc module support (patches 23-27).

Further patchsets are planned to support HDMI and the LCD timing controller present in these SoCs.

Regards,

Ryan

Jernej Skrabec (21):
  drm: sun4i: de2/de3: Change CSC argument
  drm: sun4i: de2/de3: Merge CSC functions into one
  drm: sun4i: de2/de3: call csc setup also for UI layer
  drm: sun4i: de2: Initialize layer fields earlier
  drm: sun4i: de3: Add YUV formatter module
  drm: sun4i: de3: add format enumeration function to engine
  drm: sun4i: de3: add formatter flag to mixer config
  drm: sun4i: de3: add YUV support to the DE3 mixer
  drm: sun4i: de3: pass mixer reference to ccsc setup function
  drm: sun4i: de3: add YUV support to the color space correction module
  drm: sun4i: de3: add YUV support to the TCON
  drm: sun4i: support YUV formats in VI scaler
  drm: sun4i: de2/de3: add mixer version enum
  drm: sun4i: de2/de3: refactor mixer initialisation
  drm: sun4i: vi_scaler refactor vi_scaler enablement
  drm: sun4i: de2/de3: add generic blender register reference function
  drm: sun4i: de2/de3: use generic register reference function for layer
    configuration
  drm: sun4i: de3: Implement AFBC support
  drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: fmt: add Display Engine 3.3 (DE33) support

Ryan Walklin (6):
  drm: sun4i: de3: refactor YUV formatter module setup
  dt-bindings: allwinner: add H616 DE33 bus binding
  dt-bindings: allwinner: add H616 DE33 clock binding
  dt-bindings: allwinner: add H616 DE33 mixer binding
  clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: csc: add Display Engine 3.3 (DE33) support

 .../bus/allwinner,sun50i-a64-de2.yaml         |   7 +-
 .../clock/allwinner,sun8i-a83t-de2-clk.yaml   |   1 +
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  21 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  25 ++
 drivers/gpu/drm/sun4i/Makefile                |   3 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |  28 +-
 drivers/gpu/drm/sun4i/sun50i_afbc.c           | 250 +++++++++++++
 drivers/gpu/drm/sun4i/sun50i_afbc.h           |  87 +++++
 drivers/gpu/drm/sun4i/sun50i_fmt.c            | 100 +++++
 drivers/gpu/drm/sun4i/sun50i_fmt.h            |  32 ++
 drivers/gpu/drm/sun4i/sun8i_csc.c             | 345 +++++++++++++++---
 drivers/gpu/drm/sun4i/sun8i_csc.h             |  20 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 226 +++++++++---
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  53 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  41 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        | 133 +++++--
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       | 115 ++++--
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h       |   2 +-
 drivers/gpu/drm/sun4i/sunxi_engine.h          |  29 ++
 20 files changed, 1306 insertions(+), 214 deletions(-)
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.h
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.h

-- 
2.48.1


