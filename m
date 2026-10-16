Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA2ECCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5esaWPxMUGK7t0EWOjFX9TzIxcPZqzOYkch8s/dvl0=; b=y22euE0JgrwC+K8U3C5k/BPiXM
	DygftaMqUtl9iOyFQ17y4J0Zg7s4Z+p1zIX59K8UP6aaUT8Tj1SLeSwlju8IWfmKY5I8odIOVHcbT
	SZ7VNd9xyf0K3c4eHr2V77cKKWDvP1krPmLZ8njmdrefSVDLvLM3Ag1vt56gUkv4R278AbkmsjueQ
	546Y2y6kktU6ov3cWnW8PeS3kf5HYSjKYwtHagatSqttbc1qOTFyAVHeShernfZz9ER7sfWqF38FX
	6kKu9YpqZ2L8CBwccppmRRDXj/JIKJe9N8KOnWAEikpmFKqUN1v6N8bPomceuMSgn8HCWM7U89a06
	UV3NLssw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHd5J-00000002Ivw-0XBa;
	Fri, 16 Oct 2026 08:14:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHd5C-00000002Isg-3tRb;
	Fri, 16 Oct 2026 08:14:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2256B601F0;
	Fri, 16 Oct 2026 08:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3B5EC2BCF5;
	Fri, 16 Oct 2026 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792138469;
	bh=QfV/FfI0HFrMwE+wPOrU8KzDic6Baj5DsowHTCH1FjY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AgMq8VDncSrFU6NyWjV3WevYLz7faBi/TJguBSpO2GMnj+l0OKrALgSrtqj3yGUPg
	 0iFMIqkZyLgYHCmaFzqJ0A527IJfcH7QH8qzgEQyqjSMKwGZ0/U/wmRwt9ETo7cffj
	 SPi6N3O1FZm5wY7n7I0I0rMdwNdVTndyBE3pCTnZ2yxucu5d4Pqn8RtUaQXYoQP8Cu
	 W+ykdRI9+4XN2Vsw89r+x+U9q0SmHvKfCYDNUb5et2CW78wADcswo/SVPiWdmnvFlA
	 igfcLid9FSAjIJzoUSYYGVjyV0jpABc+tvUkZq0IWuXxfPCkUwk0Ek0EibRoHtv86a
	 j4fSt0tv59oeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F70CC6B38;
	Fri, 16 Oct 2026 08:14:29 +0000 (UTC)
From: HuskerMinion via B4 Relay <devnull+mocker-mug-unwoven.duck.com@kernel.org>
Date: Fri, 16 Oct 2026 02:14:01 -0600
Subject: [PATCH 1/2] ASoC: mediatek: mt8183: Leave cache-only mode before
 enabling clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mt8183-afe-fixes-v1-1-f0db51e0c073@duck.com>
References: <20261016-mt8183-afe-fixes-v1-0-f0db51e0c073@duck.com>
In-Reply-To: <20261016-mt8183-afe-fixes-v1-0-f0db51e0c073@duck.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, HuskerMinion <mocker-mug-unwoven@duck.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792138468; l=2642;
 i=mocker-mug-unwoven@duck.com; s=20261016; h=from:subject:message-id;
 bh=zfpo94JkGvQ2yQUBuXqzym/mB6mYvui+lp17sFP9VUg=;
 b=SHKWVz3Ac5OanWSlHksMbUBv4Otf/d62j9t1248uqxkqmUt08CThxbFzD1ksClZrJ7WQGwJuZ
 eZxRoSbAYFSAj41XHL/f8/m7MMh+vZ77DBTQK/zRLF7Qm7pbrb3Dtjt
X-Developer-Key: i=mocker-mug-unwoven@duck.com; a=ed25519;
 pk=Q7l9BnP4XnFimCK28K+NVowcECqTaJNXicdBAInot0k=
X-Endpoint-Received: by B4 Relay for mocker-mug-unwoven@duck.com/20261016
 with auth_id=1206
X-Original-From: HuskerMinion <mocker-mug-unwoven@duck.com>
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
Reply-To: mocker-mug-unwoven@duck.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: HuskerMinion <mocker-mug-unwoven@duck.com>

The audiosys clock gates are bits in AUDIO_TOP_CON0 and AUDIO_TOP_CON1.
The clock driver writes them through the audiosys syscon regmap, which
is the same regmap the AFE driver uses. The AFE marks both registers
volatile, so while the regmap is cache-only, regmap_update_bits() on
them returns -EBUSY and nothing reaches the hardware. The MediaTek gate
clock ops ignore that error.

mt8183_afe_runtime_resume() calls mt8183_afe_enable_clock() first and
only then takes the regmap out of cache-only mode. After probe the
regmap is always cache-only at that point, so the gate enables are
dropped. The clock framework then counts the AFE and I2S gates as
enabled while they are still closed in hardware.

On the Amazon Echo Show 8 (2nd gen) the bootloader leaves these gates
closed. Playback and capture never start: the memif current pointer
stays at 0, no AFE interrupt fires and aplay fails with an I/O error.
clk_summary lists aud_afe and aud_i2s1 as enabled, but with hardware
enable N, and their power-down bits in AUDIO_TOP_CON0 are still set.

Leave cache-only mode before enabling the clocks, and go back to
cache-only mode if enabling them fails. The bypass case used during
probe is unchanged.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Cc: stable@vger.kernel.org
Signed-off-by: HuskerMinion <mocker-mug-unwoven@duck.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index d8938542b..d6175da3b 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -706,16 +706,26 @@ static int mt8183_afe_runtime_resume(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
 	struct mt8183_afe_private *afe_priv = afe->platform_priv;
+	bool reg_ctl = afe->regmap && !afe_priv->pm_runtime_bypass_reg_ctl;
 	int ret;
 
+	/*
+	 * The audiosys clock gates are written through this same regmap and
+	 * are volatile, so their writes are dropped while it is cache-only.
+	 */
+	if (reg_ctl)
+		regcache_cache_only(afe->regmap, false);
+
 	ret = mt8183_afe_enable_clock(afe);
-	if (ret)
+	if (ret) {
+		if (reg_ctl)
+			regcache_cache_only(afe->regmap, true);
 		return ret;
+	}
 
-	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
+	if (!reg_ctl)
 		goto skip_regmap;
 
-	regcache_cache_only(afe->regmap, false);
 	regcache_sync(afe->regmap);
 
 	/* enable audio sys DCM for power saving */

-- 
2.43.0



