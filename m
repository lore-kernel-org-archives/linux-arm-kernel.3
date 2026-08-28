Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8468CC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 11:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNMYt1wMDdq03cJbGE+Bf/mF8uIx6kHEmNjOls9dxEQ=; b=NRRkJMrIJ04cPfobHyAplSEdrT
	4WYaSEWwboNQv7N2dIYvqeTtrGjk8/esVESUi1MC1ouvykGBwYP2CHy0+IJusN1X8XfWjP8bZEcRd
	57Q3V7hw72CS6blU+TatyDVSeTOaQUPLR58GpRwYNOBQXzh1kXrSoSv7mYSg3gRkcxdk6GF9YhLi8
	foDpOPIxo5Tw13+aGSLM2vTdKMTkyT4CShkhwNMRa6P7lPG6TWC56R9QEaA21USZawxHqoMUU1FdC
	IB89Bp5d5VVk2W+vYfWGlJPrPdKhUpTR4YIJFfUaTL6ZUB7rJGpFFJUmN7hSUGXC8g9vMfAPEZFSo
	/j/8XK9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzuqv-00000005egX-3jL7;
	Fri, 28 Aug 2026 11:34:34 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzuqo-00000005ecw-1txB;
	Fri, 28 Aug 2026 11:34:29 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S21;
	Fri, 28 Aug 2026 19:34:22 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 19/20] ASoC: mediatek: mt8186: Unwind runtime resume failures
Date: Fri, 28 Aug 2026 19:34:14 +0800
Message-ID: <20260828113416.47061-20-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
References: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACnfPA6cpFqpPm9Bg--.43118S21
X-Coremail-Antispam: 1UD129KBjvJXoWxZF4fZFW3ZF1kAF15Ww43GFg_yoW5Xryrpr
	n3KFWktrZ7Xa109Fs0yr1UJFyFkryfCF13C345W34kX345JryfuF15Xa4v9FW0qFykG3W3
	Ca4UKa4UCF1YqaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBI
	daVFxhVjvjDU0xZFpf9x0JUhNVPUUUUU=
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_043428_635995_6D44D388 
X-CRM114-Status: GOOD (  11.66  )
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

mt8186_afe_runtime_resume() enables the base clocks and then a range of
clock gates before replaying the register cache.
mt8186_afe_enable_cgs() returns on the first failed gate without
disabling gates from the successful prefix, and runtime resume also
ignores regcache_sync().

Make the gate helper unwind its own partial prefix.  Route gate setup
failure through base-clock cleanup, and on cache replay failure restore
cache-only and dirty state before disabling all gates and base clocks.

The issue was identified via static analysis and manually reviewed.

Fixes: 097e874ad3fc ("ASoC: mediatek: mt8186: add platform driver")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c |  2 ++
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 15 +++++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index daaca36a2d08..a7034aea2678 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -221,6 +221,8 @@ int mt8186_afe_enable_cgs(struct mtk_base_afe *afe)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[i], ret);
+			while (--i >= CLK_I2S1_BCLK)
+				clk_disable_unprepare(afe_priv->clk[i]);
 			return ret;
 		}
 	}
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..2888a49e9db2 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2737,13 +2737,18 @@ static int mt8186_afe_runtime_resume(struct device *dev)
 
 	ret = mt8186_afe_enable_cgs(afe);
 	if (ret)
-		return ret;
+		goto disable_clock;
 
 	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
 		goto skip_regmap;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret) {
+		regcache_cache_only(afe->regmap, true);
+		regcache_mark_dirty(afe->regmap);
+		goto disable_cgs;
+	}
 
 	/* enable audio sys DCM for power saving */
 	regmap_update_bits(afe_priv->infracfg, PERI_BUS_DCM_CTRL, BIT(29), BIT(29));
@@ -2761,6 +2766,12 @@ static int mt8186_afe_runtime_resume(struct device *dev)
 
 skip_regmap:
 	return 0;
+
+disable_cgs:
+	mt8186_afe_disable_cgs(afe);
+disable_clock:
+	mt8186_afe_disable_clock(afe);
+	return ret;
 }
 
 static int mt8186_afe_component_probe(struct snd_soc_component *component)
-- 
2.43.0


