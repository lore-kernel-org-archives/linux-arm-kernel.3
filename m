Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC9FD2E02D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=elHpuajvwiyNA9OK8x4fvj9BtjIaAO6sLsdUEmQFU98=; b=SzeUG/mNVvHgTTayvwP5OIVA02
	qz1P4dKU0+OISknRCy41KaUIwIo7V6/MbhKvTbW8xhxl3CsoeBctRUYAESLu45MVd4EgCocZ13wLG
	ujRcbywIOhnLVT1YLXNFoMOGEHfwMUaCfiGk3WCAaV/+C26O++HVzKLuFbPGniHM47RRqQ7m4icNI
	7naRy63KDWNOYEgDw9mOsKxaxMDSdVKKzDKlPRLkpaLZA5NlYPbEDmJoFoB6l2IwVHbd4daq07vVL
	nKHMwSFXJxpEcXq0fguKu9SzLd+fGJWo6BzH+QrR74h55fqqD/fZ1ix2ZkmM/WBGXGQsZAuH9rOzF
	HXqYBZfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XT2-0000000DkP0-2fW9;
	Wed, 23 Oct 2024 09:15:48 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WHG-0000000DTgA-1htw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 07:59:36 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 33E51114018D;
	Wed, 23 Oct 2024 03:59:31 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 23 Oct 2024 03:59:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1729670371; x=1729756771; bh=elHpuajvwi
	yNA9OK8x4fvj9BtjIaAO6sLsdUEmQFU98=; b=H7xCsreudOiEYguWOLp1R2Sj/D
	WyWe2YygznB/gn24le3RjwDCwf7EHrIrGo+E9bJgmQsjGOSERfMvyD0yhMbUcZDA
	HVhQYabxYBrMXk0eV3Auvo3WfiNVMzEwVxWUHU+ApIpD2xPH8R9iZ1uM3xd7SdPN
	wlYYHE8O2TeItYGaf+8wLjBKN6RjYO9zCKxqtoxYil00oeumFNuq8AjDAFrtnIIX
	o6fb7jlw6Fj+qtku3M+/F2DR4jN71796FjTn75VD72WPz/4WpLGWqGEAx66hExgs
	WNLTzIzqH+QvFu8Uy+BRfh40Jm9dQnOXHmJVI+Q+/Po4ZTrJsz3isy/ZSocw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1729670371; x=1729756771; bh=elHpuajvwiyNA9OK8x4fvj9BtjIa
	AO6sLsdUEmQFU98=; b=Q2tKGxnVMxIQa65c+wFeGTQX6ITSsvo+JF/WYL+A4TWV
	piraClaqQ2kL28TWtzfvNGGCgRpwmBp0puNKPOpkFFA6Wrj7Gh+C5IRiI4EFfShE
	sOKuhiCHmMDmtApH+t7nuPB48vNQXeJ+6M3qjOzwkkt/SM5NrB/zVgAzRmV0mMy/
	ttU2sr8jBs6X8C+QKtbStAh6e56A5RehJ6Mk3XOuME5kMRLtCze8jmFKreenGWa7
	bq9Zj+hAQGS6WJlWoMyrzAWmJTgYt9u8L9SDAqR58U4HGbAIrjFtqYJkGgsu31Sv
	yRwJINBz1hlD7QN+3Nf74OJ9OQu/HSeyPQbY6Hu+BQ==
X-ME-Sender: <xms:4qwYZwDk2SV1wvgH2mbnVpZs475ySYiUTvk5pIiyq849nde6IrbkHw>
    <xme:4qwYZygwlFgO73vhkR-CwSBcJHV_RzYpa8BGWmcwfFSX5SRcNPdI5aQD0_sNSE_oc
    NyO0PDtzDfM932PpA>
X-ME-Received: <xmr:4qwYZznJnOZIaJolnFyUKfbyXFJ3fAp5Dy8uaVYZq_yxAB2xX7S7cTSkH4Lv1oQCH54JynFduJq1Cc_pxOuk9AWQS7g1bYeH1-s_eSoA3Ri1XJBJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeiiedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecu
    hfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtg
    homheqnecuggftrfgrthhtvghrnhepuddvueduueegtdeuffetveevgeehhedvhfefuddu
    veekgffgfedtheegtefhhfffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphht
    thhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifohhoug
    esghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtihifrg
    hisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehmrggtrhhorghl
    phhhrgekvdesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnshdrphhhihhlih
    hpphgvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:4qwYZ2xP-kAcrAhI2aATOxRvbzHFbJceIaQxRUz-r-8mEWDTy1MeEQ>
    <xmx:4qwYZ1SdwqndmNEZfjSud9FwtGJvxiGzvab-RJNB9mSkwtovextclA>
    <xmx:4qwYZxYRjYNYakZsZZz9T5rL9gs7WKrh4EO1s4fdfUuvJZaJ_7pkYg>
    <xmx:4qwYZ-SbTwfFe4CGkGkFHJOK0PetXn3Y5lngiyDeZ-TzoVQ6az5lqA>
    <xmx:46wYZ-jIyJQxzc9SqZWKEWc4LRrwhyyJCm-9MpkmEj2N4j4Pqexf26ZJ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Oct 2024 03:59:26 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macroalpha82@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v3 0/7] ASoC: add Allwinner H616 audio codec support
Date: Wed, 23 Oct 2024 20:56:56 +1300
Message-ID: <20241023075917.186835-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_005934_706287_ED42A6DF 
X-CRM114-Status: GOOD (  16.56  )
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

V3 of this patch adding support for the Allwinner H616 (and variant)'s audio codec. Some clarification of comments, particularly regarding the clock driver changes, and a small fix for the device tree binding (apologies I forgot to re-run dt_binding_check on V2). Review comments otherwise addressed and reviews noted.

Changelog v1..v2:
- Reordered patches to group ASoC changes
- Corrected PLL_AUDIO clock dividers to match values from manual and vendor SDK.
- Remove PLL_AUDIO_4X clock from the device tree binding (not used in the driver).
- Restrict TX-only DMA changes to the H616.
- Change the codec name to fit into the 16 char limit.
- Move the codec (and spdif) blocks in the H616 DTSI to restore address-order.
- Add board enablement (and power/GPIO changes for RG35XX to support speaker amp).

Changelog v2..v3:
- Update clock driver patch commit message and inline comments to more accurately describe SDM changes.
- Fix missing "-" in H616 conditional binding as reported by dt_binding_check
- Add additional clarification of internal playback_only quirk in sun4i-codec driver
- Add short driver_name to H616 codec driver and restore descriptive name.
- Remove leading 0 from codec node's address in H616 device tree to match other blocks.

Original blurb below:

Hi,

The Allwinner H616 has a playback-only audio codec, with a single stereo or differential-mono line output.

This patch adds support for the H616 (and H313/H618/H700/T507) SoC. Based on the  Allwinner kernel SDK driver, and tested on the H700.

Regards,

Ryan

Marcus Cooper (2):
  ASoC: sun4i-codec: Add support for different DAC FIFOC addresses to
    quirks
  ASoC: sun4i-codec: Add playback only flag to quirks

Ryan Walklin (5):
  clk: sunxi-ng: h616: Add sigma-delta modulation settings for audio PLL
  dt-bindings: allwinner: add H616 sun4i audio codec binding
  ASoC: sun4i-codec: support allwinner H616 codec
  arm64: dts: allwinner: h616: Add audio codec node
  arm64: dts: allwinner: h313/h616/h618/h700: Enable audio codec for all
    supported boards

 .../sound/allwinner,sun4i-a10-codec.yaml      |  53 +++-
 .../dts/allwinner/sun50i-h313-tanix-tx1.dts   |   5 +
 .../allwinner/sun50i-h616-orangepi-zero.dtsi  |   5 +
 .../dts/allwinner/sun50i-h616-x96-mate.dts    |   5 +
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  44 ++-
 .../allwinner/sun50i-h618-orangepi-zero2w.dts |   5 +
 .../sun50i-h618-transpeed-8k618-t.dts         |   5 +
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |  13 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c        |  46 ++-
 sound/soc/sunxi/sun4i-codec.c                 | 298 +++++++++++++++---
 10 files changed, 404 insertions(+), 75 deletions(-)

-- 
2.47.0


