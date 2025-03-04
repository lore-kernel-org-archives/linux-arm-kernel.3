Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD13C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wavfi03VLFzkRgSXBDNQjxdQA6kIqOjOjbG1Py1RCSQ=; b=H5FsNuYTu/aZiLgN2p6ROga4W5
	1Ol8Ux3ChXiIYs3l5EfH+xW27wCFAbyOYamHNoLPgxu9jmfbeopDnN5JIp1zdDXe4xmYqHX2hrWid
	1S7mHYicHoCyd2+sVRPYEAa2QQ8b3B0wimqZ4KoIwzqeFyk3T5hwFr/8CVpeCAYxiUlIUAsb3Zkgw
	FiABLHzAa3uO1WLwq2H3/cEwEKcFTc/7IPKn/CMkNFCQcNJC0sIgEJhi9HzU9bF0sZ8X7lybvtns4
	22ieqTAFlga/mQ5PsTvH4D+4X6uDoJqVSI+qA+WLuG2NqM/wTti2VJrnFe1OZgllDBDaHANHw7aAJ
	SuyZAJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVcO-00000005Wdf-3aYW;
	Tue, 04 Mar 2025 16:59:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpU0a-00000005AB6-3NDl;
	Tue, 04 Mar 2025 15:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741101395;
	bh=lix1WOppoHxLTu8lRo8ZOELVqyyGO52750g+3jKAaYw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OO9EtD2g1+gDTN7zq1pI7ZmmL1rmiwr4G2eSWrlba3qmjchuSjdaCnyaBlV6bqmxE
	 cLkcjbfvSnOay+RSdYI+Yv7J4IYs8zrET73ZJhoD+V7z+a7GsC+x1+Jg8rHrO7pjd5
	 4I0SQgLEFjTgWYVsDo6RVuXwg5EzQo+7G5vHFc9QdKGJ5ieLjOCh9EjQomyxoKv+xY
	 WYnRcNwdjeY3pv19s7EQWQTlvibww0n7MDiRUXqWjBDHTPaqZwwrCXgBEP4tNtpQ7h
	 2fJWVW1MDLuiwzy9gYvCNe//zPN9Olg33R2VrFd+8kYFk07VQ2sti7yGK0G7mu4JwN
	 g4Sjt2lepycdQ==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7991D17E07F8;
	Tue,  4 Mar 2025 16:16:30 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 04 Mar 2025 12:15:46 -0300
Subject: [PATCH v3 05/20] ASoC: mediatek: mt6359-accdet: Handle
 hp-eint-high property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-mt6359-accdet-dts-v3-5-5b0eafc29f5b@collabora.com>
References: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
In-Reply-To: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_071636_984439_719FEBBF 
X-CRM114-Status: GOOD (  11.81  )
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

Now that the dt-binding was introduced, the property that governs the
eint polarity is a boolean called mediatek,hp-eint-high, while the
current code handles a u32 property called mediatek,eint-level-pol.
Update the driver handling accordingly.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 5 +----
 sound/soc/codecs/mt6359-accdet.h | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 9bbd4497e8d481ee125693be2fc576b439574b39..ca3be59d2d0ecaadccd9ba399649ba93f20490c4 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -578,10 +578,7 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 	if (!ret)
 		memcpy(priv->data->pwm_deb, pwm_deb, sizeof(pwm_deb));
 
-	ret = of_property_read_u32(node, "mediatek,eint-level-pol",
-				   &priv->data->eint_pol);
-	if (ret)
-		priv->data->eint_pol = 8;
+	priv->data->hp_eint_high = of_property_read_bool(node, "mediatek,hp-eint-high");
 
 	ret = of_property_read_u32(node, "mediatek,eint-use-ap", &tmp);
 	if (ret)
diff --git a/sound/soc/codecs/mt6359-accdet.h b/sound/soc/codecs/mt6359-accdet.h
index c234f2f4276a12853a6fe0b13c4198dfc551b6b4..a54a328bdf3797ce642da446c0cc6792f72ec939 100644
--- a/sound/soc/codecs/mt6359-accdet.h
+++ b/sound/soc/codecs/mt6359-accdet.h
@@ -86,7 +86,7 @@ struct dts_data {
 	unsigned int mic_vol;
 	unsigned int mic_mode;
 	unsigned int plugout_deb;
-	unsigned int eint_pol;
+	bool hp_eint_high;
 	struct pwm_deb_settings *pwm_deb;
 	struct three_key_threshold three_key;
 	struct four_key_threshold four_key;

-- 
2.48.1


