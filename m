Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0F4C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 22:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qPwN79Uv5GTOoN5qb6sqVr1UhzN0N8IbfXzXbZmDIA=; b=YlYS1pXfTOFXCvpMlP9zDP8sme
	iDOnDOLQgiUkbnNlZp2l/NLOxX8H9CEbMC7+a8rod5ruRLakcZKVsM4YaP0qZa6oBETO9uBMH+NeX
	mK48BacjUQYoq3/B5mcRPhwXyyLXfIBd551ufoKjlB4ZCi6l0d/y2cTuxinB3tEclI+kTLyQEP4rm
	mmhvWOWAfaYWXR94EkfAcNhXbBvysVPsub5XIAlc1UTVFcV2Xj1hRTfOOQOfhXp3kYrNRrGjGKfBT
	KcTG36k7QNM9wVVBHWngba801ZdnCCiz/FTiorme6UqYN8WhmUz5IAKYWGjYZBldN8VkOwzBfIVIa
	Sf9NyuWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3qJ-0000000GLXo-16Sg;
	Fri, 14 Feb 2025 22:07:27 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3mE-0000000GKtF-09Yc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 22:03:15 +0000
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1E3C9254016F;
	Fri, 14 Feb 2025 17:03:13 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 14 Feb 2025 17:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739570592; x=
	1739656992; bh=2qPwN79Uv5GTOoN5qb6sqVr1UhzN0N8IbfXzXbZmDIA=; b=c
	886sJFT/RjaBVsHLukqf80E+EOUHuPCaZlscq5oC15FNYxMFckdHZoaR6YWjC7AE
	dKp/6gbygQLQFYFj44kdgPjZ0DpI5IAj3Rl6A49fvc2YaXlXYQV3glY1s8AkTqVt
	5FILu2dT4m1hW51o1CFXYsOXVRTdehGD+v86V1W/HHwq87ycJ1A08ZMTcn2Gv+zI
	XX1DO+u3p/N+5omVhMaVsgp4p6XsrSY5EHWu4AfE9fXsnWJbPFk6467U1lQX2QGG
	L352DuNwSEMjbbuGlXCbW2or63NWtMkg3MqYRy+C4/qNpIWsqj5MESHgpozPT/ab
	WlwSuiM9Uer5NttycYL+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739570592; x=1739656992; bh=2
	qPwN79Uv5GTOoN5qb6sqVr1UhzN0N8IbfXzXbZmDIA=; b=G6E8P8L5upXF33CVQ
	eGKvVP/YRRB99+Q+6hQZUAtm9Rzp+RaNSQidTHce4HlCmRY/fwEXqFznSr5H/5fu
	hsUVwn90Vunr0BGQq0RhRSImQaRh1wxD8kPE3992t2VrU6oHzqGAWUYU+EN5TYe3
	55IPZx89ZqjTV0skchdu5z7EgADsT5pvjdr/94BzBVdagfF8pwlY7I7OuGWQc8T8
	keDNQrn41icPlIbCHl1pD6Xy7nmw7iz7mXgK0IvoyJ6pLpKhfP37w44yZoWmQkpw
	ovOX/0M4p92DUsOaTQd9wG2JplLLmacVjNP8yfJ0IOVVKgmIS3QYW7UJuRREC3Bo
	lwQpA==
X-ME-Sender: <xms:oL2vZ0jNIWSxA90tBoCBhsrSp5VdBZrL5QRtRZd1QENdcBnHi7N-iw>
    <xme:oL2vZ9AzKffXAcavpA-9xXAakxhRtTJLEPBOYbX8TETQ6gzlvXK133-YD6ozFuv2C
    WVXSaOylE100qMuRA>
X-ME-Received: <xmr:oL2vZ8FHOFyDtVNlnY-cBQF829_YLMwS5Fkabxp6tZ5W5fBC1HZQY_FoMzIQ1ERwDE6ZlQburkToGzCIp5bEaN-qFLh4SBYKYu5ReQdWPRm3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtdektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtih
    ifrghisehsuhhsvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:oL2vZ1RfPZ0ZwtsQ9HqDv1AcJLwtT1uI2GrnaUxZ992SiPnoND7XzQ>
    <xmx:oL2vZxzTegw3oasttG5vjBKmSzV_yYusUl7K2-wtnreanxMEq6k8rA>
    <xmx:oL2vZz6nrRCrDOPKDtRc9NjHPJyJreV5EC3D7rLoFYKRrEwwNeR8Jw>
    <xmx:oL2vZ-x694HVI7gWm--sEtiHVMY645sUIz7sbijHedPxRmzBQniHEA>
    <xmx:oL2vZ5ATAfXC9T4hxVycHX249nw_1UUtFd-h_43WG-jCVsqKsbUKC3_a>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Feb 2025 17:03:07 -0500 (EST)
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
	Rob Herring <robh@kernel.org>,
	Philippe Simons <simons.philippe@gmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v3 2/5] ASoC: sun4i-codec: correct dapm widgets and controls for h616
Date: Sat, 15 Feb 2025 11:02:24 +1300
Message-ID: <20250214220247.10810-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214220247.10810-1-ryan@testtoast.com>
References: <20250214220247.10810-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_140314_130905_FC3CA1E8 
X-CRM114-Status: GOOD (  13.23  )
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

Remove the redundant LINEOUT card control, and add a Speaker pin switch
control and Headphone DAPM widget to allow control of the above
hardware.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
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


