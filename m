Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B65EC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 20:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+X8jHZ+UCc+Ohu0KXssevYJirrp4bJDPnKlrWI5bAVg=; b=Ks+B5HaRLZxDIHoHZBw7FmECpj
	kOl5cP/RIQYBcZvqj52iVASiqpOfEnefrqTNLqjPA4uPFfzv969mytJFWRA5yDEIcHDa4Aw5SUko9
	4GOHFEBBX2mhQnME0VG78XX5B/eZe+md8nlrDvdYXpEvIdjMXcNFFF7kpAr1Yepqx2KlaVOEKvxiM
	PHZ88eI0yUD9azS4CYusCOo1I1UVpi8ggaaN+T9G3uydnkik4TM/gs6zAqYUybSPcv3i7HZc8iRey
	ct9mGMId4gd+dvzXIWLnKDC2KbyDxNxv+vD8WAFEbQxA8mFMj1+EJv3nt+NNfstz/517GfTYvMXwX
	vO6CITnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uClC3-0000000GfDX-17Qn;
	Wed, 07 May 2025 20:16:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uClA5-0000000GeuL-2xxw;
	Wed, 07 May 2025 20:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746648874;
	bh=1wYB6g3HZmLcMhDaWBOpHrS4E4d1M7S0hY8EqdNaB7Y=;
	h=From:Date:Subject:To:Cc:From;
	b=JEH0XLuos0G9N9R/Vnss9oT0gjwD78a9Zvy7mAlh49Se033+o/gsmgiu1sPhxpemC
	 uw5xzDT4GBOS6u+JyKdAivFSP++gi0f7VTtBSzlXXQKfsOBy2Y+RAaV2C4/N4sY6Tf
	 mB/hPIwR7bf2wN+LZjkpA+8sz1Tmxd8bmtiDJMFMEmX77sL801A4/a2rAn0gLN5WT3
	 7Xy/3ZvWz6r/qAzkpd5cBMN06NzXB/3hfPYh6csVKN/IJSUXVGwLNT56LByTVgPWoE
	 z0OInyp/DFrYK6q35hbjVD7i4hnBI8TJ1UmKm0S2stwd29wdSIa8H0M+SS61Sv7bdY
	 xhcn9e/JIUdfA==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 37A0717E0707;
	Wed,  7 May 2025 22:14:32 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 07 May 2025 16:14:14 -0400
Subject: [PATCH] ASoC: mediatek: mt8188-mt6359: Depend on MT6359_ACCDET set
 or disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250507-mt8188-mt6359-accdet-depend-v1-1-aad70ce62964@collabora.com>
X-B4-Tracking: v=1; b=H4sIABW/G2gC/x3MQQqDMBBG4avIrB2I0WjqVYqLNPPbzsJUEikF8
 e4NXT2+zTupICsKzc1JGR8t+k4VXdtQfIX0BKtUkzXWGWcm3g7feV8z9u7GIUbBwYIdSXgI0di
 HwyAIVA97xqrf//2+XNcPhNQ/VG0AAAA=
X-Change-ID: 20250507-mt8188-mt6359-accdet-depend-4ac02b5e4dea
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Zoran Zhan <zoran.zhan@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_131437_892127_27BF0029 
X-CRM114-Status: GOOD (  13.59  )
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

Commit 0116a7d84b32 ("ASoC: mediatek: mt6359: Add stub for
mt6359_accdet_enable_jack_detect") added a stub for
mt6359_accdet_enable_jack_detect() in order to allow the mt8188-mt6359
driver to be enabled without requiring the mt6359-accdet to also be
enabled, since it is not always needed.

However, in the case that CONFIG_SND_SOC_MT8188_MT6359=y and
CONFIG_SND_SOC_MT6359_ACCDET=m, a link error will happen, which commit
b19fa45715ce ("ASoC: mediatek: mt8188-mt6359: select
CONFIG_SND_SOC_MT6359_ACCDET") solved by selecting
CONFIG_SND_SOC_MT6359_ACCDET.

In order to not require CONFIG_SND_SOC_MT6359_ACCDET as originally
intended, but also prevent the link error, depend on ACCDET being
enabled or disabled (which will force MT8188_MT6359=m if
MT6359_ACCDET=m).

Fixes: f35d834d67ad ("ASoC: mediatek: mt8188-mt6359: Add accdet headset jack detect support")
Fixes: b19fa45715ce ("ASoC: mediatek: mt8188-mt6359: select CONFIG_SND_SOC_MT6359_ACCDET")
Suggested-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index e148d4d9416011252ddbc37111c3e7b9d59082f9..90e367586493d7a413efade6a8586c4770c459ab 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -228,8 +228,8 @@ config SND_SOC_MT8188
 config SND_SOC_MT8188_MT6359
 	tristate "ASoC Audio driver for MT8188 with MT6359 and I2S codecs"
 	depends on SND_SOC_MT8188 && MTK_PMIC_WRAP
+	depends on SND_SOC_MT6359_ACCDET || !SND_SOC_MT6359_ACCDET
 	depends on I2C
-	select SND_SOC_MT6359_ACCDET
 	select SND_SOC_MT6359
 	select SND_SOC_HDMI_CODEC
 	select SND_SOC_DMIC

---
base-commit: b19fa45715ce9cfcc597ed140df31115e969b39d
change-id: 20250507-mt8188-mt6359-accdet-depend-4ac02b5e4dea

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


