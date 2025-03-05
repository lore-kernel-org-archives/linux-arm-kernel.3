Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6851C28B22
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KF/PaATiK0x9qPF++Y8jAW/yXaoAkToj5SY2XZUl4HE=; b=sDKXvF5QNPzyTATPoIf3j6syAB
	0eEZnd7ddQRqOEdu/8CORSPdneDSN7q7OWn2jhzlnByMyv9Jjj7x7du/kBYjeyeTDfchjwz7zoMDp
	Trt/3TQwS4wqGCci62rGe/8sG25BJlzjJLvaoNhCnduWHLGefq2iGK5ZWIQJylCZ7BEij36E+SWJ1
	2bw3+sYDmZZc6jUDx0Z6CuUsPoaaYc2QH0/RY5LpeaGnpRkCIEbKMZQf5CnU/DG4zU7UXHfP79GMv
	xslRT5834n039apRyn3SNwyNatu2OH1I8LN0+TGp5K2w6PW4TyFf/c5vPE26nqmid4jXf96PzXNS0
	YxkGq3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxXi-00000009WRM-3A1N;
	Wed, 05 Mar 2025 22:48:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptyX-000000090L7-070b;
	Wed, 05 Mar 2025 19:00:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741201211;
	bh=25TENqi8q+kBqzrzX/J7Q2+OaNY4swWOeoiOQighkU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mAhx/i5rvlXXoTH4k9hox7FMCKAQo0dnsBU5AwbFnRPsYlJkD81eXnUFpEMjaJrki
	 6BLyhmgw0xYYJcQUIqDsOc9EmKW7Z6PIq5NmOftisqQOoju83COFY3iVNWDelejr0B
	 p4EN8KwYH2tVE5e6Lo/EBvtwR+JNrXAfUKEIXMMqa7/HLGLdz4WE753l8d1MnNDdAu
	 UOslnmAm2sxcvqIUxwoN2wiqePDZ75cTScFXfmVmOE9Uq+YfPsU3jgXzYnxQRhLLWH
	 qdsfD1caxsukbwhwc4QLgkWXWUYXRMiUeNu//+8Q4Xd//D6j07uaGwnBRQU7gT2zR3
	 0FqMvtBUrYsYQ==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 617F317E0343;
	Wed,  5 Mar 2025 20:00:06 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 05 Mar 2025 15:58:24 -0300
Subject: [PATCH v4 09/19] ASoC: mediatek: mt6359-accdet: Drop dead code for
 plugout-debounce
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250305-mt6359-accdet-dts-v4-9-e5ffa5ee9991@collabora.com>
References: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
In-Reply-To: <20250305-mt6359-accdet-dts-v4-0-e5ffa5ee9991@collabora.com>
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
X-CRM114-CacheID: sfid-20250305_110013_246133_22F16B8B 
X-CRM114-Status: GOOD (  10.28  )
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

The mediatek,plugout-debounce property is undocumented in the binding
and unhandled by the driver. Remove it.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 5 -----
 sound/soc/codecs/mt6359-accdet.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 6b0178976d91e37c32540991693ebfd8e29c11f5..d78d7516342a5c2273b1c2962c0346646aa6390f 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -513,11 +513,6 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 	if (ret)
 		priv->data->mic_vol = 8;
 
-	ret = of_property_read_u32(node, "mediatek,plugout-debounce",
-				   &priv->data->plugout_deb);
-	if (ret)
-		priv->data->plugout_deb = 1;
-
 	ret = of_property_read_u32(node, "mediatek,mic-mode",
 				   &priv->data->mic_mode);
 	if (ret)
diff --git a/sound/soc/codecs/mt6359-accdet.h b/sound/soc/codecs/mt6359-accdet.h
index 09e1072b61a4c929bf6b764b4fab3c4b26f7cf4a..54a33a0f0e084f80df33386b3df9bba9525fa880 100644
--- a/sound/soc/codecs/mt6359-accdet.h
+++ b/sound/soc/codecs/mt6359-accdet.h
@@ -72,7 +72,6 @@ struct pwm_deb_settings {
 struct dts_data {
 	unsigned int mic_vol;
 	unsigned int mic_mode;
-	unsigned int plugout_deb;
 	bool hp_eint_high;
 	struct pwm_deb_settings *pwm_deb;
 	unsigned int moisture_detect_enable;

-- 
2.48.1


