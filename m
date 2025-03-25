Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F506C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 09:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3ngC5yAcCckXsBZZat5MnWrO09LCr8AhRXzN1s8X0lw=; b=uQBN315xZDsqf+OWaWkZG0ofqk
	XmrGizL6Bw0lE5LEcgUeXzTXUipMvykZmMhUNZJtNI6aXNJ6aHGVYmVvAEkZJ5lB8q0p8LpQIgpOE
	OVKCPX/W0E/rI4Plv3LJvSU0UWR9s7gX312uy83j7IwjeQxaswmKn0kcLlbpr4eJqH8eQTolJHyOF
	Cf8iHPtLp5be8L0KezCbDF/PHOCl1cKNMgkruCRMWoQpWBCWIbWTIplfoXZIJi5mEmwSYiDMTpAqG
	1otRlC1wRWuWCwGCTOqwaBJjF3wP8IkUGAdaBtuW5x5L/rwFKgpFdEInJwQy/gqRu3obfXHPuRFCT
	S91jfDOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx0ba-00000005J4O-23th;
	Tue, 25 Mar 2025 09:29:54 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx0Zq-00000005Ix3-3C8C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 09:28:08 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowACn5g4cd+JnPWRMAQ--.6335S2;
	Tue, 25 Mar 2025 17:27:56 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	ckeepax@opensource.cirrus.com,
	u.kleine-koenig@baylibre.com,
	megi@xff.cz
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH v2] ASoC: sun8i-codec: Remove unnecessary NULL check before clk_prepare_enable/clk_disable_unprepare
Date: Tue, 25 Mar 2025 17:26:40 +0800
Message-Id: <20250325092640.996802-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACn5g4cd+JnPWRMAQ--.6335S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrWDWF18XrWDCr45WFWDtwb_yoW8GF15pa
	4fGFWftrWfJ34F9rs3Zr18t3W5KrW29ay3A3yYk3Z5Zwn8GF10qF45Ja4v9FZ0kr98KF47
	Wr1UtasYyFn8GaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUkrcfUUUUU=
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_022807_168357_FD4CEB3F 
X-CRM114-Status: GOOD (  10.51  )
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

clk_prepare_enable() and clk_disable_unprepare() already checked
NULL clock parameter.Remove unneeded NULL check for clk here.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
Changelog:

v1 -> v2:

1. Add clean up for clk_prepare_enable() call.
---
 sound/soc/sunxi/sun8i-codec.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 8b9eb1a202f7..7b3496caa31e 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -248,12 +248,10 @@ static int sun8i_codec_runtime_resume(struct device *dev)
 	struct sun8i_codec *scodec = dev_get_drvdata(dev);
 	int ret;
 
-	if (scodec->clk_bus) {
-		ret = clk_prepare_enable(scodec->clk_bus);
-		if (ret) {
-			dev_err(dev, "Failed to enable the bus clock\n");
-			return ret;
-		}
+	ret = clk_prepare_enable(scodec->clk_bus);
+	if (ret) {
+		dev_err(dev, "Failed to enable the bus clock\n");
+		return ret;
 	}
 
 	regcache_cache_only(scodec->regmap, false);
@@ -274,8 +272,7 @@ static int sun8i_codec_runtime_suspend(struct device *dev)
 	regcache_cache_only(scodec->regmap, true);
 	regcache_mark_dirty(scodec->regmap);
 
-	if (scodec->clk_bus)
-		clk_disable_unprepare(scodec->clk_bus);
+	clk_disable_unprepare(scodec->clk_bus);
 
 	return 0;
 }
-- 
2.25.1


