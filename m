Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B51C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 16:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cm1PiUFCUPpCxBS25c6wkCpdKneSmBoH/ghdR1H4yGc=; b=auMKS0QwChOqBfeBYyS2ta4db9
	J1aXMM/tQYn9OOK3kTErKZWk0EjS5f0+i5Q2N/RJBf3uQHulnlMmm3rkT4l9TCRU4ZHLWl3gsluTl
	a0l5+VVdnlg94EJLxWvjlBHkXffE6L6QpDfEmbV6GdonU7nQoo+acKLOd0lSGHkndPoH7rY5HypbC
	zKTNYMTI0X62hHMDzBU57e6+vVOkCRpq8RUSEvStvT3lzwvb6z5kIfUdmMm7LfFO1zVmLnk90LxY2
	j7SFp+GUp4Td7i3IAkMhXl403/mHMjSo7E/FCaRHRTO8ePBUgKFO/4ua77WI4cgp59VUav9BgxAek
	k/fltbgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tomMk-0000000GMCx-17Oe;
	Sun, 02 Mar 2025 16:40:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tomDv-0000000GKMO-2BDE;
	Sun, 02 Mar 2025 16:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740933086;
	bh=Tgw0vGvYn1aDa8wojLhwcCN01faBqA4xTfz6ljblzSs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZkC4Q8DArJsElX5mVKrRXBBfLaT1irlAZQArADcVPCGPL+Ab6BcqyMyf4C4bQIrit
	 yOoh9dihrQyq7UITc0Vh1EG4Gy6GsoernpZ1J7SyJInzaJQPTLZpuk2En8SN7/mCRx
	 YkpFxcQ8auzlrHsjsEKb2Ev5PgAbJ5orQX2TREHxUfIzJvkrxq5FBdz5FLVk3rb4lY
	 wb8ZWbANx1e3vm/bW7owmq0FU/67OHRr7z/6mexlE0hZreNvShz7qW0TRBm2w55GjH
	 W6h3OqOkShx/qeXQEQjJ1zktT3TeAu+kcXYjLfmnCL3h4ei9Dg114+P9PegISFaclW
	 E77dMXu/Afd0A==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1002])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0406F17E023F;
	Sun,  2 Mar 2025 17:31:20 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Sun, 02 Mar 2025 13:30:44 -0300
Subject: [PATCH v2 05/20] ASoC: mediatek: mt6359-accdet: Handle
 hp-eint-high property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250302-mt6359-accdet-dts-v2-5-5bd633ee0d47@collabora.com>
References: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
In-Reply-To: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
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
X-CRM114-CacheID: sfid-20250302_083127_700481_7A9EE6AB 
X-CRM114-Status: GOOD (  11.58  )
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


