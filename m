Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29331C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 08:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gQV59Aievl/LHsII52zjTNCqSuGz5fExZsMExKq04hU=; b=UqoOOuduOqABUUhoGoEifAkzTw
	7xyB0ZUzgXcZZiiIJWK6Lby7xmWjf/J2G8YzAZ8X3nr8rjbClh0lAu9W5fyFypAO7G2d1K/U0M7HK
	EHDLZL9GkB5Fswjp2iB1jHrXXs/4656dzS15yvMVOy/Qi6HSxGhtwvYEDXTClPjEiftf62+9Y7fXC
	NECyYCjMIWkcmA75R1cp/44zTLWFMsjAgqFd3xCOTJ+02Msof1wyULIlIGfycDw2YZ43yd2DgXGwg
	cBGKAYk+e7Rs4Z+R2xcM+M3BlUcpNXfBFt7kNviXf3Vo7n5mfqeOUEgral6nv7/RdgB9RfYFTEAJ2
	lT/fSMNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPnk-0000000F3js-3T2N;
	Sun, 20 Jul 2025 08:53:44 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPlI-0000000F3V1-2Mcm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 08:51:14 +0000
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 058F01D00127;
	Sun, 20 Jul 2025 04:51:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sun, 20 Jul 2025 04:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1753001468; x=1753087868; bh=gQV59Aievl
	/LHsII52zjTNCqSuGz5fExZsMExKq04hU=; b=L6mJtI9u0DIJzIFzES6RUxC6QM
	nOXOwy892BeOgiSBCkNqfsHBWKukdfgnfdkT1EVFc2ZCi41DtWTyJ1aTGIXe/EJe
	n/mTi4JhMAAvxnE4716Tl4enwxvyA0V7XrP9hM2vV0sEiTnLHCpD3wpsJPhnWq4Z
	D9hA+OxZEwEOkNNoLAq+ZTE5paeOKtlTEkTd/2+uPh6odv8iKUP6Ut7SOyV5eNyj
	JLFhN/hrRUvYSdPMmBQdfDNNABgCqx8hhhVdNrmtOuLeFccHvvuZodhrSA+xaVgF
	1Z4FF7Gpya1BGYEhiomDHJDSKvq2qTGIdOVdRc1gZM6DZko8CyKP4Do+wRgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1753001468; x=1753087868; bh=gQV59Aievl/LHsII52zjTNCqSuGz5fExZsM
	ExKq04hU=; b=RbJxu4AjYWHWGO4Xti0Kan6IjgghWZpt5gx/58ZxJg40ok4PHXz
	QgPcpy+D7eCLdrpVIEpknRBLD8YvR1069xlCM3mGkvgOtCbzCPN6QAZ+Qc8eE+BA
	Ce8+Uct8z+eRYvbf3fiLVXe4/rZjj3c1L4W5adxnKt4eCbpsM8N4g2Py4c/EE41Y
	U3UjmgSmpdoCVYd8/ceO78lQ8LUaMFIsEB7SCeYriEMEpby5eAC4/c9Pc5zzdSmJ
	MresWbmCc9CmafExSzDnxdpGtabn8qLpL7shBa0HL/8scbLrWNuwJQMEUCuN8JsS
	swVDCsFXgxx8GZnnsyq7xkol2/55/djxnjA==
X-ME-Sender: <xms:-618aNAwOZt92zal1_CFhaLA1qzd89iBE_WfT7Zo_8Ft96EEEnY42A>
    <xme:-618aMIY2DmpguQqvbYoOzN4asaZ4Yvh8S1biHv_-BGd40b3cY5FLKzHU0jIGgvh4
    1APrvrZWBYNKLlnhw>
X-ME-Received: <xmr:-618aDumqiz37U_wXkz9mL1dksN5UiD28M5bcvXe-S2OmHYe9FhGXEtGf3fh99OJm-gTApSUWnhd6JedgxBHzuLFWDx9aQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggrlhhk
    lhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvghrnh
    epfeejjefhjefhgfeitdellefhueekfeetueektdejvdeuueegudehudffkeevudeunecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehrohgshh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopeifvghnshestghsihgvrdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggs
    vggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnug
    drohhrghdprhgtphhtthhopegrnhgurhgvrdhprhiihiifrghrrgesrghrmhdrtghomhdp
    rhgtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghilhdrtghomhdprhgtphhtth
    hopehkihhkuhgthhgrnhelkeesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:-618aMXTENndXGA_6xrbCkrXOv3WPuZabdw3SfGnJrqDJ31BPnTG3Q>
    <xmx:-618aGKIvE3F3HpGJatCw5N-_DS3ZcBIxP-49rTD8VoIv4IBLSAElw>
    <xmx:-618aJ-ld0ahDCW-UIPPoySWYcnZmtn3M4n8V8J2Aq6v092xt4orRw>
    <xmx:-618aMOc2O_9EoAc2MbWzdlSFG7NEbm24S9oWQWmrnNyJ06_Si4swQ>
    <xmx:_K18aELd15twgm1QngICr-FB1pgniyT_ZH2OxV46XAUzztVOO4y_YRjY>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:03 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 00/12] arm64: dts: allwinner: h616: add LCD timing controller and display engine support
Date: Sun, 20 Jul 2025 20:48:38 +1200
Message-ID: <20250720085047.5340-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_015112_804914_15DAF809 
X-CRM114-Status: GOOD (  14.33  )
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

V2 of this patch adding display engine and timing controller support for the H616 and related SoCs, and enabling LCD output for the RG35XX series of handheld gaming devices using this SoC. V2 updates with feedback and Acks from the previous v1, with changes largely improving consistency of DT compatible and fallback strings, and removing the temporary GPIO switched backlight from v1 in favour of waiting for proper PWM support.

Regards,

Ryan

Original blurb below:

The H616 series of SoCs has an LCD timing controller as part of its display pipeline, capable of outputting to an LCD display, as well as HDMI and (depending on the SoC) composite TV signals. The pins are not exposed on all die variants, but the H700 variant is exposes RGB and LVDS pins. Building on the DE33 display engine patches on the list (https://lore.kernel.org/linux-sunxi/20250216085432.6373-2-ryan@testtoast.com), this patch series:

- adds the required device tree configuration for the display pipeline to the H616 (bus, display engine, mixer and timing controller)
- adds a quirk to the sun4i TCON driver for the Allwinner R40 (compatible with the H616/H618/H700/T507)
- describes the H616 RGB and LVDS GPIO pins
- adds the required pipeline endpoints to the device tree for the Anbernic RG35XX devices featuring this SoC
- adds LCD panel description, and required power supply configuration for the panel, backlight and GPIO pins for the RG35XX

Thanks to Jernej Skrabec for the initial out-of-tree patch for the T507.

Regards,

Ryan

Chris Morgan (1):
  dt-bindings: allwinner: add H616 DE33 bus binding

Jernej Skrabec (1):
  drm/sun4i: tcon: add support for R40

Ryan Walklin (10):
  dt-bindings: allwinner: Add TCON_TOP_LCD clock defines
  dt-bindings: display: sun4i: Add compatible strings for H616 DE
  dt-bindings: display: sun4i: Add compatible strings for H616 TCON TOP
  dt-bindings: display: sun4i: add allwinner R40 and H616 tcon
    compatible strings
  dt-bindings: sram: sunxi-sram: Add H616 SRAM C compatible
  drm: sun4i: add compatible for h616 display engine
  arm64: dts: allwinner: h616: add display engine, bus and mixer nodes
  arm64: dts: allwinner: h616: Add LCD timing controller nodes
  arm64: dts: allwinner: h616: add LCD and LVDS pins
  arm64: dts: allwinner: rg35xx: Enable LCD output

 .../bus/allwinner,sun50i-a64-de2.yaml         |   7 +-
 .../allwinner,sun4i-a10-display-engine.yaml   |   1 +
 .../display/allwinner,sun4i-a10-tcon.yaml     |  10 +
 .../display/allwinner,sun8i-r40-tcon-top.yaml |  13 +-
 .../allwinner,sun4i-a10-system-control.yaml   |   4 +-
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 225 ++++++++++++++++++
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |  56 +++++
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |   9 +
 include/dt-bindings/clock/sun8i-tcon-top.h    |   2 +
 10 files changed, 319 insertions(+), 9 deletions(-)

-- 
2.50.1


