Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BA8C44501
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 06:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=55SlABL8sC4/v91Mc2l87z9dg40TyXcYAN1WaabwtgA=; b=3EBtov8xAH2pPcCnUZQ5IWJfAL
	5jJNs7BP93O5JshnchHzYWIxs7PUW+61RUKBoMSU1Aq1oSZMjYqJDcRMOFK5TH1bmL75qSi1WxU1k
	k66rlxLkg3y80K2f86UN+EDMizwbQUvcT0s1dg6DynfB+vz/5isdXk7kKoBw4HztZdvPG/snrTci7
	o0E1TzqX952ldrBzzmfFAze6aR/64lFcFlXQ/3rvxAaJ/iITEnCLimY7zGPj2K2OJoo83Cn8Tpsoa
	ZrFN95yOAlxw186rgaorL/w0jFMFykP8ul6vmoLsaMJwXJdr1z1cOLSsRvR6i5uCU0Nl+2NQl5MV5
	0bvt4xAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiQnZ-00000006EnQ-0m4k;
	Sat, 11 Jul 2026 06:02:49 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiQnP-00000006Eg9-44dF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 06:02:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783749726; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=R1xy+vjV5qGJrZp3bx10t+TOSl93Iw/vG76b8g20LekJuqGlCtnQVAs6vaKz1vBe9G
    vs7zukbaccMv3BIwll4TDG6SEbJBmv1Shaz/Q1Y9jEgXbLMGeVCHhdPXRrHtlk3At0xR
    D6hvmhEjziT3ND82R4Fr8Fyhrw66VHWAUXb+jiDdFVjcq0Mfcu/OL/O1jVW2uR8q8F29
    cOEMBGHY4f0WQkTjfjlqsr5iNfuNJfK7gfCBJFcC2Wb4WgeLDZ9Wf1c39bT0XxtChp8u
    hCM2brIcZyCdO2iyfc5kAr63e2/fhYHy4qKFbg2LDOq/LFh0L0xy8VWCnD2hCkf1pOt/
    Bgtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1783749726;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=55SlABL8sC4/v91Mc2l87z9dg40TyXcYAN1WaabwtgA=;
    b=QoYeJb9+wBLMRfWj+jYkjq7jsoxyOht91kWkbtZKkPLRwYozYvc8mrS19LOxdMAGW6
    6du5JmRGvMyrN6cPg+MvWC9o+c12+ie5ZyxfmUOdPosQimyGVV3+8AiI/+zI/l5pZ0JB
    swZnhbntxVIqpF7wgKvIceCcuZzObRlPI8sNzb35mG7OhALO1bQAaqUK7hbrxohWeAZM
    syWX/ry7fLJnE2tOoPPYHlHe58NwP0QkIrCmfhjiBtUqYuirx5kQJ9kn05mByJyA2/iE
    42s8GFhSCGCg/dANzUnhz4kmVnDpfZ96aCTvrEqkbgFxndovBSXirQ3L63urQ9u0JBhi
    +/FA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1783749726;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=55SlABL8sC4/v91Mc2l87z9dg40TyXcYAN1WaabwtgA=;
    b=Jv/FjH7QzkuyigtT8XXK2dwQ2vGQcHzBu9aWuIeAgyAcdv6gxMxDSqiY6pwaSNJSzw
    wD2mal/H8htwmWvXrBI45troLrwAstuv3kZz1eJxIVeItPL+Vvm97abhVZm5INH+QShk
    S0fUmJbprZy/3RkBB3MkiZRQ34wLkfGTrf8xfj7rXfWb43fT4pOIHl52srVxlFM8t34Q
    VV/NNaa61kBSf932uC+GrazstytyFbgtDINJPqWbK34DWd6P48uJ545YS5eMNhFk/pfP
    bTcZ7nqqj5AfKnM421S/6MOaLGGPxfuOEtxHmEG65+SquAM8oT8yTEJk1VmDvnKKmCwY
    qBFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1783749726;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=55SlABL8sC4/v91Mc2l87z9dg40TyXcYAN1WaabwtgA=;
    b=VQOxmGicLvbfDiAUwz97zqTfaoLdmVuKV/V2cinZ5idzgW5WRVnp5mS1n7P6/55AvT
    Yge9NQzSyXvQXRFfSHDA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrT35oLmciNszeF4HOToVDOd6S1gdjuILE2MKVd"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id Q4b76426B624Ghk
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 11 Jul 2026 08:02:04 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Grond <grond66@riseup.net>,
	Stefan Leichter <sle85276@gmx.de>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Grazvydas Ignotas <notasas@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andreas Kemnade <andreas@kemnade.info>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sen Wang <sen@ti.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Niranjan H Y <niranjan.hy@ti.com>
Cc: letux-kernel@openphoenux.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	kernel@pyra-handheld.com,
	mfd@lists.linux.dev
Subject: [PATCH 00/16] ARM: omap3: pandora: Modernize audio and backlight to Device Tree to finally remove pdata-quirks
Date: Sat, 11 Jul 2026 08:01:47 +0200
Message-ID: <cover.1783749722.git.hns@goldelico.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_230240_300369_5A2DB114 
X-CRM114-Status: GOOD (  20.15  )
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

PATCH V1 2026-07-11 08:02:02:
This series modernizes the OpenPandora handheld support by converting the 
sound subsystem and backlight control to proper platform drivers and Device 
Tree definitions.

The primary goal is the complete removal of omap3_pandora_legacy_init() 
and the elimination of the last remaining user of machine_is_omap3_pandora().

History and Context
===================
The necessity of this cleanup was highlighted in several recent discussions:

1. Tony Lindgren noted that machine_is_omap3_pandora() checks never succeed 
   on Device Tree-booted machines, leaving the audio subsystem functionally 
   broken since the DT conversion years ago:
   https://marc.info/?l=alsa-devel&m=165632351319716&w=2

2. Ethan Nelson-Moore submitted a patch to replace the macro with DT 
   compatibility checks (accepted as commit 45efb8fbdae3 in v7.2-rc1):
   https://marc.info/?l=linux-omap&m=177841578110704&w=2

3. Sascha Hauer pointed out that the entire omap3pandora driver fundamentally 
   depended on this broken machine ID check:
   https://marc.info/?l=linux-omap&m=178048982272252&w=2

Design Choices and Implementation
=================================
Based on these discussions and a long-standing and working out-of-tree solution,
we initially attempted a migration to generic frameworks like simple-audio-card 
or audio-graph-card. However, the hardware routing peculiarities of the 
OpenPandora introduced too many functional gaps. Replacing omap3pandora.c 
entirely with pure DT definitions proved unfeasible. 

Therefore, we opted to base a new proposal on the out-of-tree rewrite of
the old-style sound board file kernel driver (sound/soc/ti/omap3pandora.c)
into a proper platform driver that cleanly fetches its resources from the
Device Tree, while adding specific handling for the twl4030-regen output
and adapting the pandora device tree files.

Series Structure
================
* Patches 01–06 (Preparation): Move highly specific legacy code to its proper 
  infrastructure (TWL4030 regulator regeneration and codec handling).
* Patch 07-08 (New Driver): Introduce a dedicated platform driver for the 
  PCM1773 audio DAC.
* Patches 09-14 (Audio Core): Rewrite the omap3pandora ASoC fabric driver 
  and update the respective Device Tree nodes.
* Patches 14–15 (Backlight): Remove the custom, legacy Pandora backlight driver,
  convert it to generic Device Tree nodes
* Patch 16: (Cleanup) safely delete the obsolete omap3_pandora_legacy_init().

Notes & Testing
===============
* Testing: This series has been tested on real OpenPandora hardware.

Credits
=======
This work is a collaborative effort by multiple authors over several years:
* Grond <grond66@riseup.net>
* Stefan Leichter <sle85276@gmx.de>
* H. Nikolaus Schaller <hns@goldelico.com>


Grond (8):
  dt-bindings: twl-regulator: Add bindings for exposing ti,twl4030-regen
  regulator: twl: Expose the TWL4030's REGEN signal as a regulator
  arm: dts: twl4030: add twl4030-regen child
  arm: dts: omap3pandora: Populate DT data for the TWL4030's REGEN
    regulator
  arm: dts: omap3pandora: Don't use DMA channels for unused SPI masters
  ASoC: twl4030-codec: Allow setting APLL rate through the .set_sysclk()
    interface
  ASoC: pcm1773-codec: write a driver for the PCM1773 chip from TI
  arm: dts: omap3pandora: Add device node for PCM1773 codec

H. Nikolaus Schaller (5):
  ASoC: dt-bindings: add TI PCM1773
  ASoC: dt-bindings: add OpenPandora Sound Card
  arm: dts: omap3-pandora-common: backlight: switch to twl4030 pwm and
    pwm_bl
  backlight: remove pandora_bl
  arm: omap2: remove remaining pdata-quirks for pandora legacy devices

Stefan Leichter (3):
  ASoC: omap3pandora: Rewrite sound card driver as a platform driver
    with DT
  ARM: dts: omap3-pandora-common: Enable audio in/out (mcbsp4/2)
  arm: dts: omap3pandora: create new DT node for the sound card

 .../devicetree/bindings/mfd/ti,twl.yaml       |   1 +
 .../sound/openpandora,omap3pandora-sound.yaml |  94 ++++
 .../devicetree/bindings/sound/pcm1773.yaml    |  32 ++
 .../dts/ti/omap/omap3-pandora-common.dtsi     |  84 ++++
 arch/arm/boot/dts/ti/omap/twl4030.dtsi        |  14 +
 arch/arm/mach-omap2/pdata-quirks.c            |  23 -
 drivers/regulator/twl-regulator.c             |  52 ++
 drivers/video/backlight/Kconfig               |   7 -
 drivers/video/backlight/Makefile              |   1 -
 drivers/video/backlight/pandora_bl.c          | 159 ------
 include/linux/mfd/twl.h                       |   3 +
 include/linux/mfd/twl4030-audio.h             |   3 +
 sound/soc/codecs/Kconfig                      |   5 +
 sound/soc/codecs/pcm1773.c                    | 149 ++++++
 sound/soc/codecs/twl4030.c                    | 140 ++++--
 sound/soc/ti/omap3pandora.c                   | 454 ++++++++++++------
 16 files changed, 855 insertions(+), 366 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/pcm1773.yaml
 delete mode 100644 drivers/video/backlight/pandora_bl.c
 create mode 100644 sound/soc/codecs/pcm1773.c

-- 
2.50.1 (Apple Git-155)


