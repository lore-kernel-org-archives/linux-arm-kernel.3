Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C561C3ABC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 22:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtBj4ksJAEh9stsMJvHbM3KC4eHtBLU8mIu7zGC0L1Y=; b=ziKQH93EnlFprkU+xSJhyCbbgU
	AeVqjNXMW7rdN4fG1xiEPYqjrANrb4fL/OFNFGzCm8ihTM8hTDCJUhpmlghuFRf6cRrwrvPi7JeLh
	3QQZceVgIv/F1bkf2z+6X7DZFCO3QCIf6CLfUr58qXGqr85/kFgDHJu2ySd84Vs19pfMR89Upwnjs
	wEjzJORocbtGGx7EBO10iCkoH7wE9LMaTiRVy/LaPXXJ+TYq3YfI+OwZXTuHVvgRE4lWsYN2koWEj
	GgI3/10PRXRwc4S4f7OsnLePcRj5HND9efl1JbXVMe+jYLmLMBX1YBSoHPkENv9VttHcQvRHnMtxb
	iBV3Q3Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4jE-00000008uP1-0opf;
	Mon, 05 May 2025 22:56:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Az-00000008j7u-3VsR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:20:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 801A5A4CCBD;
	Mon,  5 May 2025 22:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13E1C4CEF2;
	Mon,  5 May 2025 22:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483640;
	bh=i8k4kAuOA12gAeUKPjXuKQ3wEZQVKFo+gD7Ede6jyUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e7OXpQu/mxri18axqEyS8ARu47K1cUkWysOY8d1oLUG/99Z4HGzplDHaBCSNVj12L
	 ikEfQfDPobeI3ZqDOm3mopMTk4JofZwcSxlsrbzYMr7LAR1O2V64GBr3NqesOvAXiR
	 0FsxyuxkN1AWUIpFnQBunmeaP0lLJ/GtrkRIKxbyogc7AUksXaOa3CsDg8h5CxH0+D
	 3DrkCvhn33D4Ma2MA4tchk38tEWeea8/5PSpg/KONIXmncWOFIYgqyA8T/qbDowYNa
	 tZHUg3nVOwgLQau6FrmAx5wfYPYfRnVWmE9iXmv/iTKYejcTCgrrdG41Glxnd/6dv4
	 IDrNB1WiSJ67g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ryan Walklin <ryan@testtoast.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	csokas.bence@prolan.hu,
	andre.przywara@arm.com,
	mesihkilinc@gmail.com,
	codekipper@gmail.com,
	jbrunet@baylibre.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH AUTOSEL 6.14 154/642] ASoC: sun4i-codec: correct dapm widgets and controls for h616
Date: Mon,  5 May 2025 18:06:10 -0400
Message-Id: <20250505221419.2672473-154-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_152041_955567_6D724AF0 
X-CRM114-Status: GOOD (  13.47  )
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

From: Ryan Walklin <ryan@testtoast.com>

[ Upstream commit ae5f76d4044d1580849316c49290678605e0889d ]

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
Tested-by: Philippe Simons <simons.philippe@gmail.com>
Link: https://patch.msgid.link/20250214220247.10810-3-ryan@testtoast.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sunxi/sun4i-codec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 06e85b34fdf68..3701f56c72756 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1962,10 +1962,11 @@ static const struct snd_soc_component_driver sun50i_h616_codec_codec = {
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
2.39.5


