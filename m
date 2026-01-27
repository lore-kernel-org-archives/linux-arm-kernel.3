Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64DBD3409E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAL/8Nu7blTVwPvTbqISEfmU6k9m4qLRTzA0cZUl580=; b=jztJTIYcqW/l2ziWhmyI22b14p
	bhIeS6C15v6XO6TLCx4zxWwXHtxfe8NEu7qQE+0f3zOPo/709D0sbugOHRCf9kL73rWc6sXsqumWL
	/WDfV6TzAMo1SyruO0a4EDQChdGsFARBhbAs5AM//K9m5GqPzNc5/1DN6tLsMhp3XxCByqILX3wVr
	pwh5/yOXNWbdiGgl5BsTRpm3qWzz9CpU62W+ChToRT5lPvvlB7KeRw4MlzqWN2KJW7yw6UYYA1cZk
	lI1ryNH1XTV8/rmFVClGQ1ZRoMBwbfhNxh4ax/EGXZacNOwamOlGyFKOamTNbZYO1j+VBAwWP+GX1
	J/+28Qww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklcn-0000000Ec7L-36qG;
	Tue, 27 Jan 2026 16:09:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklca-0000000Ebyo-37T0;
	Tue, 27 Jan 2026 16:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769530129;
	bh=0x70eJ6LqWibam6/8d2HJYajJ9736pFY/SKkVLmceOE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kU0YycuarDUL9LR/LyCP0fcxNKJshbllia2LgRX9fMXY1vFgTj1u/sTn2wxlyLi8o
	 6ue4JuOnBk0hcVtRe/ybsPX0o2At9II+86aT46FDOOFsnBOJ+K/2tqw9FTZ2Mkn3QX
	 P6N4wbr4q1k2UQru2twaYykAeLQau6nRk3U5qMhf+TlOcnEywLmeARH34Dp/qqigJS
	 vPlNZfBjq8bCtezI9Ap+jMGJmwdvx+7av0PJZI48v5T6JAFAJ3QKP7Pf3GvpZot8k3
	 8taIYb6j26zD/9Bq2GxXm+UEt1g05hXsFy9L4booybu29VU/+tKlbxAxxkbe10CUWx
	 DoEAIzHQoLDVw==
Received: from jupiter.universe (dyndsl-091-248-210-071.ewe-ip-backbone.de [91.248.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDCC317E1513;
	Tue, 27 Jan 2026 17:08:49 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 38B4E480062; Tue, 27 Jan 2026 17:08:49 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 27 Jan 2026 17:08:25 +0100
Subject: [PATCH 05/10] ASoC: rockchip: spdif: Improve sample rate support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-5-a7c547072bbb@collabora.com>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=++BAbGfCLnkoMQgDrhj78qjcxu4mge2TSu9sa0rSBY4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGl44xA4AU5OXfJcnO+2idQXFt9WnWkoUNOW1
 g2vZ7Fq7VsjFYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpeOMQAAoJENju1/PI
 O/qaNdcP/A1J+kjKpHlQwmp306nFDFNDrban4AhVnqoISWIwsPRF6YPtXHmczfa+tAGEtJ5PcZg
 Svz/vP13gQy/L2D5QtrQ85mCCcK3NjlPsofxPvvvG16b23c17r/7n63DrFUDIn4CigALnuuCUam
 J+rOygdve/iCme2a1sbHPvIOkIQxGGVRiU9ygg+E8imQVSxYQaZQCvtnuqvpvy8UqSvQ89/84NL
 EKOh3HeJ3Wsp1tLdSQlF3zsRR8ZQgolL4i3Wi3NtnHnYl07p0ZmXJvQtDEeEF4XiznXl7SB4UO0
 XIAIAGw4sC2qRMhFra2l5eKy4auGUc9TIV4d1hqHEr98/JagjBC+hwKIF5XRmskn1E97AwFgrgx
 q/in7pHxmDInh2WSdvuZw9R7uIWFXkA4eNP4lz8aBPWvOnCyF8kZAxQHpbSVsZ6M4wTBu+kA8dB
 NmM5yJmMHyT/D24DKBFrXAVqtolR3AkayzkqwT6JVozLyFTbjWIXn2CNsfLWVwQRYV1SUIPHvhO
 /NPv5UTXXFdMl6CSoZl+lXb0lqXEk7nzVz9tRI9jCqo6lGJsEroSkTfy+9c5qlbt8EvO2l6OVwX
 p2H3BMypkE7ddXbcWa3xmTgwuJJhpqx63jn0drUvLX1qbXQ7+LYSELO/8EikwcTFv9nwLdHAh0B
 orWg/BdWKeT2Wb+G48TEzeA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_080852_966478_683DBEFD 
X-CRM114-Status: GOOD (  11.12  )
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

From: Sugar Zhang <sugar.zhang@rock-chips.com>

The hardware supports all typical sample rates from 8000 - 19200.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 20ed64c1fa42..80fd8f53bb2b 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -188,11 +188,7 @@ static struct snd_soc_dai_driver rk_spdif_dai = {
 		.stream_name = "Playback",
 		.channels_min = 2,
 		.channels_max = 2,
-		.rates = (SNDRV_PCM_RATE_32000 |
-			  SNDRV_PCM_RATE_44100 |
-			  SNDRV_PCM_RATE_48000 |
-			  SNDRV_PCM_RATE_96000 |
-			  SNDRV_PCM_RATE_192000),
+		.rates = SNDRV_PCM_RATE_8000_192000,
 		.formats = (SNDRV_PCM_FMTBIT_S16_LE |
 			    SNDRV_PCM_FMTBIT_S20_3LE |
 			    SNDRV_PCM_FMTBIT_S24_LE),

-- 
2.51.0


