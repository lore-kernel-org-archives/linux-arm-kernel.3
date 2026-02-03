Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCFEE8784C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QevzsQbWse+C1l+8XJta67f4FItAv3WrAQLidqSWWrU=; b=dZLBOFiNPBRzDreeNQopN5nILZ
	r4mcyJhrV5zk2yL4mltVStYKPWBXfVNtDyTFsXOoI1L0iiyawcjpbC906J7KxwI9b1ycULXYb7QtW
	kaRXnbY8YRymoJJlN8TFyWgvpe/8bETqieZLc3Tj+Gv44Dm28HKt5BrEafiAXwua+0p92ThI9JyeX
	ifVTR46gLliRGn7t+kQ9A1wU3Ljb/SyqcVX+iTdICJhF0gk4uhFda8cpltJRKaKzY6dtwyAy+Iyiy
	oTxmtwZQwFdR26iPkEsVkRPGsIXoycG9c4IjqINCR5gUj6bl3gdvAxQrFk5O4Cavg6kvU9wDY/z2C
	bKTm22lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJYA-00000006y5x-2IIy;
	Tue, 03 Feb 2026 16:46:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJY2-00000006xu3-02ml;
	Tue, 03 Feb 2026 16:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770137195;
	bh=82Au6WbWX/XbCYAat9JgxZ9XoB6C4noOyfxXXw3R4ZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MulHVc3yiKVg7EWuJeNcLS2fBW7s8YZaucy6nKJslCoK0599F5Co2+amb5k6/oCy4
	 q4RHc7+05HH/Y1X0ZENSK/+bcm/X7gFm5LZcLJPYUxngf6LMgcmW2l5gQ+VIidY78Y
	 cbzZkQCyk5tNDOfc4sDjLKQ9Hz1fXNRw5L84CujUsbQgkyIpaS5DbsEmQhNeXGlVvf
	 VVLOe1WwgYBFMcwHh2L+tMu5+s4cts/3gsYfDMqwuVf9qRzmwVCneunRrBcI6WjR+a
	 vcDxMGzYSWnuDcssXDINeKShZ05nqUnMN0t6fqdwwIGJYM0gnjmW82RFrQYZgEqyAN
	 5ft2eUywD9T4w==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0067517E35DC;
	Tue,  3 Feb 2026 17:46:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 16BE348002A; Tue, 03 Feb 2026 17:46:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 17:46:27 +0100
Subject: [PATCH v2 05/10] ASoC: rockchip: spdif: Improve sample rate
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-5-4412016cf577@collabora.com>
References: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
In-Reply-To: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=abFzezjxkX7Ga9S847nmHHXXVGcpC1hL5V81nWEem+0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCJmnlJblPCn7rXthXDQ7QZwe+rXMNzyAun
 gvqdZUa7vwCCIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgiZpAAoJENju1/PI
 O/qarJ0P/2rFxf2AuNxjA3t7xD8breTSS/u56B3jPD15IadbdT1CxmzPE83hpo6vBrPFJZ0yxDO
 4ZtGaquoFQAFjRlqeO2PAh7Z3fuN4PZs8224e0NBPJZ+IYVihU+l37wGstacdJ6/JcX1vAEtlht
 ZlkDbHAkZQbWVAXC9LyTrcoUj1vYJ+dC2cEqQ346W51cbBGnBq9lca1V50v7peQCvaYPXfVpTFm
 Fv6V9Uk5CUxvjyU7E7P7nQnsfxY/0OdLTY4mhMfjRzXqLFTYLcPZcBX+vO7o9Jofu/fDWDzoa9D
 4wZbRWm3GQC+aGBPRSqh+KrUyH1r2jyKqq3643IoVvyJ/NCA6D5uw6O2gA+8dF1Wyq5DkSWDPUp
 kA3jYiWXUpxtvgSJyDGXfTErPFhqRpArwgEYMpUtiemIthu3bEVqJnRGrXNcWoKMGDK8UgS9GrT
 aw7mG2SjagbIcGEkdQwfBjcTF47EwSpoN4QlzAKyDmmH/ZV75yzMC9HUwKrWaNbhDv9YX0kkHle
 ycuLZwsX+rrp4EcRN3uqVhGrPLRo6saUHCbwzIrY7W7UkFiyr2Zc8LfXakX9M5cxqhqFNd7t4Ih
 kI0Zcwl6PzxJi3qtFj9KKjoBnD0zAKI38tBsQiGxe4Z2s1K6OwZe/VeBg1KJV+VzmB35rt3Mon8
 8TKNSldmYQQA5+5rYYjwqaQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_084642_209828_C899B463 
X-CRM114-Status: GOOD (  11.18  )
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

The hardware supports all sample rates up to 19.2kHz.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 1c62fcb0d8d4..55d64fd4c93b 100644
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


