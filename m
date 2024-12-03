Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDF8E74AC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 19:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wdn9WBlyNdiY0kjsvpz6XjzAktzFSzWhI4fjS6MrMsM=; b=nw5D4VO5IgVnnbPAfvgf1jS7E1
	+SZ99mNfffu9+w5gO85wqPvoTlC+ekyv7bPgFpx5GAKVHTOGAcnbGakFcRozYW+vDjYiyNd/PJBrq
	RZPiB8uestMMeA6K4Ws+r/JWh4bNrBLWxMCEcTmdbRVxJ/tn9WpdtP6QEVcByzzSu1DfUdGNfafEp
	9CK+t+d53/aCy1QFjI4Fd+zpw4HsWKFCqpFutp2KrbG/TImI7vvdkRB2w4DW3zksW+jOAlXf+ZOPt
	tzPtp79slGt91lLhBYpg3scuWYuM24+ojGr/hQoIBZqD5CcQsk78xbr3wOEci+Mx8IV34YPxScWt2
	4Dyt5TfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIYTL-0000000AT2X-0dnS;
	Tue, 03 Dec 2024 19:22:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIYSK-0000000ASuv-1kUa;
	Tue, 03 Dec 2024 19:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733253665;
	bh=me674ysn4T+xkyXkjVxxdq0efYr8UjvgzBFk7LZAd70=;
	h=From:Date:Subject:To:Cc:From;
	b=T+cfWrQHcK7y+GOW+utyX+YR65qTl5gxPICvVGkewfy97+N38ZlGuIA4ujurN7R71
	 vQNewctBhMLcDCSitu9XlfMOWf+qP1lPnWN3N43bBdR9JN9kIRsM6h2sCJWucMstJ3
	 kgg4HNgVn6xVIOGnxsfu1pU8MpIkY6gYEpsgf6wn1SX319Gh5rU3k+0M3ligHz61Z2
	 ikr28pZMIlHc6V5ZmvzrrrkBwXLUmVUcuBfNPRghHORCiH/oZrmyZqNDyyEANJ8+p6
	 fVVAB9jGZlr2ZmdS0dVRp+ecmlUiZ/m6yPpKAw+uvO70ya74rcawN1VzqWRYLRhvc2
	 nO9AwAN/JcSaQ==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1005])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A715017E1036;
	Tue,  3 Dec 2024 20:21:02 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 03 Dec 2024 16:20:58 -0300
Subject: [PATCH] ASoC: mediatek: mt8188-mt6359: Remove hardcoded dmic codec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
X-B4-Tracking: v=1; b=H4sIABlaT2cC/x3MSw5AMBAA0KvIrE2irU+5ilhUO5iFkhaRiLtrL
 N/mPRApMEXosgcCXRx58wkiz8Auxs+E7JJBFrIUslC4HlpojbWqWjz9YoKzmyN0K1scTVOX7aR
 NI0dIwx5o4vvf++F9P0HiRgRtAAAA
X-Change-ID: 20241203-mt8188-6359-unhardcode-dmic-ba7649f8a72b
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_112108_640179_187843A9 
X-CRM114-Status: GOOD (  10.56  )
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

Remove hardcoded dmic codec from the UL_SRC dai link to avoid requiring
a dmic codec to be present for the driver to probe, as not every
MT8188-based platform might need a dmic codec. The codec can be assigned
to the dai link through the dai-link property in Devicetree on the
platforms where it is needed.

No Devicetree currently relies on it so it is safe to remove without
worrying about backward compatibility.

Fixes: 9f08dcbddeb3 ("ASoC: mediatek: mt8188-mt6359: support new board with nau88255")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 08ae962afeb92965109b303439419bc6e7c2a896..1550e56ab57d54b179ebe5cbd60db1660bb0bd2c 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -188,9 +188,7 @@ SND_SOC_DAILINK_DEFS(pcm1,
 SND_SOC_DAILINK_DEFS(ul_src,
 		     DAILINK_COMP_ARRAY(COMP_CPU("UL_SRC")),
 		     DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
-						   "mt6359-snd-codec-aif1"),
-					COMP_CODEC("dmic-codec",
-						   "dmic-hifi")),
+						   "mt6359-snd-codec-aif1")),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(AFE_SOF_DL2,

---
base-commit: b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
change-id: 20241203-mt8188-6359-unhardcode-dmic-ba7649f8a72b

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


