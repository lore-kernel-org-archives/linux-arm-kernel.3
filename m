Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817C2C02182
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 07:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHn5rroylHzuQrtAoY3TXyS5Zv+3P1p2kiq3JFX8d1Q=; b=QfF+yGu9XasaPOMAB3ElBdBDtx
	woLR+gdZd78xPmE4My9FD4r7Wnev2uClPaQJYagirsFcHzULDs4gBuIvmtex5MEvc1wpyw1fNxaZx
	2/CzmcRtY8vsJgIlXqSyqAgZiflMquBTokE7sF7Ol9K6R3QS67UteNQ4rs0mMapBDguJXU7OH+Y6X
	tNFksdd2Qg2H2E5peDzozOn4LKqWCKRKy+tEBVwvUC181Zf2PNqWgskUaiHHKItIZoPpSVx5VJiFr
	K02NhsR8L3bdWF8clbjf8YK1iZkatK7aQ9xNzefmJoEKZ9CJsJXRLWlaHvDTMCeMrKXEkhFiidlCK
	F7u8Ptzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbaIc-0000000GC1t-1V0A;
	Sat, 25 Jan 2025 07:09:46 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbaEV-0000000GBgg-35hy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 07:05:32 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id D338B11400E6;
	Sat, 25 Jan 2025 02:05:30 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 25 Jan 2025 02:05:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1737788730; x=
	1737875130; bh=vHn5rroylHzuQrtAoY3TXyS5Zv+3P1p2kiq3JFX8d1Q=; b=g
	0izeiBcvSriI/RABTmoXVPr9G7V8F3p0wb1QvxZwYZZaKAgGYfIjxvJnrgoltrqE
	GGtjHMmZvjx4641+nekNM73TR4wfnr/GyJX7caaI+ebp80lNllWKQo4BR/LUihn3
	xPCe4shmYGPdvvwHLycz+ymwTJf+qUwc5pCPIde3kY4wrLye3Stb0FwaGw3Sj7iZ
	iwIKWPFbjpObjoIL3W4z14flMduTslDpcZwZo2YgVRrflx/Ut+AFanKZlnCYy6sQ
	LcVqJ2Do/Wcv6TncS32kb6D8Pj+1/51rhWh6FF7gmPrwf6x2wkm3EOLw5VQjDxjZ
	uECqF+B4QTqm/gtnaskhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1737788730; x=1737875130; bh=v
	Hn5rroylHzuQrtAoY3TXyS5Zv+3P1p2kiq3JFX8d1Q=; b=ErDzVATwQcnagJtxc
	StmGAA5CJEl55iGGGMM4M9zbSNuAt466EiI0QD6LUAroHxiAEkeHP5GZkBvZlk92
	8WLMJHdJl3/xxWevKudh8NqCwnMWBy0012NVdN7B+QsfLIb1khI70ADThvHwqNJf
	3a7pWOMs2DAJCUdSf/2yjimOSwmgFjtu1+M+tLSBN6bWlYYsDL7LRxZn1Kqc3ero
	TIpVR2WV7vb57Xd/BUeUDnncfXLF1eHFXaXKOIdMC2K4PMjeXbnwriMgMK5aymMk
	Etf8ds9dA6E1on25rNlkUfJECfbJTfNZZDPuqia97D0bitEgHC4w5e6zOiSf/Kii
	Cl7ig==
X-ME-Sender: <xms:Oo2UZyg5mBt8-vLyPqUk6XTbJ7hqACnY5OzaLwhK8lEt-_c0FMgs9Q>
    <xme:Oo2UZzBiACzCctWh5ATiB-nuWRQzYcIzKcohMQat_8bcEy1plv6VvMUI_iZG6lCL-
    qmAMLtNpjE4bucOaw>
X-ME-Received: <xmr:Oo2UZ6FGATAUGmSObVpyNg81hXQmuJFKYiJ7-k-oJJGkNFZuLD8Rfhdbl1J7fF7Tu5KLNT-Y1eXiHNgkviyGOyEKufipJEE4pk_Nc7bt-zuZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgieejhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:Oo2UZ7QkT5XcEM914r8FMsU3EPx_gL8kesYyPPw3YX4cREIxKCNtPA>
    <xmx:Oo2UZ_wc4NfRNmMmS0fyx7CN4lmJhcHUNqo4OuvQWU9X61b9E_vvbA>
    <xmx:Oo2UZ55brQWKqrjPXsE-FvV10QhIQSZJf8unlF2O6mEhn1w165GqWQ>
    <xmx:Oo2UZ8yHZRcID_7BsCfUsU4mdBFXLfT1mfUZ-Ca3lIbjj6_O3O0Uvw>
    <xmx:Oo2UZ3hg0G39QCbuFMkEoia0nLkmkET7c3q8dQB1iEhkMqFK4rzIP-Hx>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jan 2025 02:05:26 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 2/5] ASoC: sun4i-codec: correct dapm widgets and controls for h616
Date: Sat, 25 Jan 2025 20:00:12 +1300
Message-ID: <20250125070458.13822-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125070458.13822-1-ryan@testtoast.com>
References: <20250125070458.13822-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_230531_835539_8ED5C564 
X-CRM114-Status: GOOD (  14.45  )
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

From: Chris Morgan <macromorgan@hotmail.com>

The previous H616 support patch added a single LINEOUT DAPM pin switch
to the card controls. As the codec in this SoC only has a single route,
this seemed reasonable at the time, however is redundant given the
existing DAPM codec widget definitions controlling the digital and
analog sides of the codec.

It is also insufficient to describe the scenario where separate
components (muxes, jack detection etc) are used to modify the audio
route external to the SoC. For example the Anbernic RG(##)XX series of
devices uses a headphone jack detection switch, GPIO-controlled speaker
amplifier and a passive external mux chip to route audio.

The LINEOUT route remains defined as the final common endpoint
for the codec's output, and is referenced by device trees.

Remove the redundant LINEOUT card control, and add a Speaker pin switch
control and Headphone DAPM widget to allow control of the above
hardware.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- Separate DAPM changes into separate patch and add/elaborate rationale.
---
 sound/soc/sunxi/sun4i-codec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 886b3fa537d26..f24bbefeb3923 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1916,10 +1916,11 @@ static const struct snd_soc_component_driver sun50i_h616_codec_codec = {
 };
 
 static const struct snd_kcontrol_new sun50i_h616_card_controls[] = {
-	SOC_DAPM_PIN_SWITCH("LINEOUT"),
+	SOC_DAPM_PIN_SWITCH("Speaker"),
 };
 
 static const struct snd_soc_dapm_widget sun50i_h616_codec_card_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_LINE("Line Out", NULL),
 	SND_SOC_DAPM_SPK("Speaker", sun4i_codec_spk_event),
 };
-- 
2.48.1


