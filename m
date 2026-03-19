Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF65D109192F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 22:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxJCLr7x83TM4awgiz8RT2JSmXJWiLKIRsJPIkFRlRI=; b=qX7iI6y6l5xvgVRO6qcOoq24An
	KMosrVCDIabLKtPVygTN+RrUJf9anV3Eovu2/zSdpgyCjBgEu+BgMcDRS+Znm0nXgYwIzyMO8xubB
	lYbbu/nY+zyeMgS+yYwnRlm61c/DZrGtcaC3gd9l9HROesSd3YGEKNXiMbv6YCVdRFF7QkG6axr6Z
	Df2csa4fYcIDMw7TxpkkFAlBAxM8LO4psQnMXB3GOuyJ2Yh3cX+hBf+RnXzuo4wIoLZt++FIsF8G6
	Cz7kQ+7XYS8W05q8mCuP+uokXwu8eIpVF27t0t+e5zwGgbixO0r7H1AuNw7v+4Sn78jjI97ggluS0
	WtFd69Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LnI-0000000BdXy-1MUN;
	Thu, 19 Mar 2026 22:24:44 +0000
Received: from flow-b3-smtp.messagingengine.com ([202.12.124.138])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ln7-0000000BdPT-1Xxx;
	Thu, 19 Mar 2026 22:24:34 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 47F1C13000AB;
	Thu, 19 Mar 2026 18:24:32 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 19 Mar 2026 18:24:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773959071;
	 x=1773966271; bh=cxJCLr7x83TM4awgiz8RT2JSmXJWiLKIRsJPIkFRlRI=; b=
	pKi+BpSPAVEBTx7LUQJAjzdQvRTRmP2UnXfwUeNNY12Zd6CV+LA1K5Kld84qLwdF
	KAAJ2LlcqzQ3sANZPOtpKCPTJuMqCVdL0ufOPd6cHz8KqS/Cz+Qdhv5GiOhqbvJ7
	ry115CpzpDHwQPvuZOpd7wDC1w3uNpaHBYOAOtquBwe3wL/WzwDXoxp8MAiOqo6r
	ynrKM5MFmFjOmLlw20dEfeikRpLIsXPkda9hRInwps9vhzF5GoaPPI+LlxVJyL/j
	DS+TsIJ5dBhaTfkKDIz1YkOgP0JwN27jVDjYQPJUlBjl5GAoXllz0C2S89NuCTLO
	Ql3f/KHypNbUWfMG7TPZxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773959071; x=
	1773966271; bh=cxJCLr7x83TM4awgiz8RT2JSmXJWiLKIRsJPIkFRlRI=; b=f
	QkDRwHFMmnIrABgsjgwYQa132GEYXhxlnoAzkcwuHhaENeofbrd2HHFlzNWLNFDU
	1T35rxG24MwaJHXZsLiggQ2P/6Bayy7F5zcg1YyWJOAgc8nvu6kH4OzC98j7Egb9
	Y0G8WdkZoO2lIh84q8N64EVqP8CzKuL6kOWifF5wlhL0RkWFHpw4mY9rLMQo4JDC
	SwVLRQqjpw5dXMsjd9R/7FdKgtt1Zb8FOFkfFbINigp094XEyggNAd5a4eC4ZKLn
	ICc8IK1IxPfsNDH9kKwxTNzPBCnAGtTex/9jV/Jg/A7Dvt9C1hyaFUtuDSgsxpzB
	mDNNfveTMgD6DecgoxV5Q==
X-ME-Sender: <xms:n3e8aQzAMGSqvHHONpR-MohY8Xs37ZU9MRvZr2sCuKRCYX4gyW7RpQ>
    <xme:n3e8afFg68OD4CWHLw7HUIVQLD8Q1v5GjLCBLM3d5xiA2X8PDgqXHkhtYYkO3TPiP
    j_s358JMAEDTdmOWGBafBg0D-vSGBgpk9s_iS2QhdQOqWngH4Vq9ak>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdekvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjh
    gvthhmrdhmvgdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhonhhgrddtgidttdesghhmrghilhdrtghomhdprhgtphhtthhope
    grrhhivghlrdhrohhsvghnfhgvlhgurdejhedtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheptghhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehgih
    hoshgrlheltdesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghg
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehrrgguohhirdgthhhrihhssehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshgrmhhurdhtohhljhgrmhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:n3e8aZj9QWu-yMXtJYkrF55J4iCJLIzl6UImYxiJyL7Z8RCd9E6xzg>
    <xmx:n3e8abPgR6OqcZj0Qn3etd3TP-FNhgol5tC2YbWq9VhXmMGPKho-UA>
    <xmx:n3e8adn2NnCQyObgZmIVhydpvu8UjpGR57on5ZV1tJ1QGX7zoofLkQ>
    <xmx:n3e8aacXA_2FyiKyVBF8RDhGfq99hxtgsX6JJYEHhFmQf14E1XFgiQ>
    <xmx:n3e8aZBl2tpse3EMvU25V4dbCs0bEOJz5Cu2JFR3LkfrmynGLEOrhiC0>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BD8E21EA006B; Thu, 19 Mar 2026 18:24:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Thu, 19 Mar 2026 16:24:21 -0600
Subject: [PATCH v2 05/13] wifi: mt76: mt7925: advertise EHT 320MHz
 capabilities for 6GHz band
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260319-mt7927-wifi-support-v2-v2-5-d627a7fad70d@jetm.me>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Deren Wu <deren.wu@mediatek.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Marcin FM <marcin@lgic.pl>, Cristian-Florin Radoi <radoi.chris@gmail.com>,
 George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>,
 Samu Toljamo <samu.toljamo@gmail.com>,
 Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
 Chapuis Dario <chapuisdario4@gmail.com>,
 =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
 =?utf-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5375; i=floss@jetm.me;
 h=from:subject:message-id; bh=jWvfRpWdnEYpKJDJ/Bf+bOhjtZ1T5Q852eESr9hihqk=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpvHeQHxbYUH5sDg3XnEGlwwxH0gRlfw7XCF6R6
 uYmngTGJFeJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCabx3kAAKCRC17sMLqGd3
 H8MQC/9RDOiR7d4CCTMigUzXgIC0o1u8zkcUCToGjw/DgVoHlpY5qZme3P1By5ILP6PxbpR1y90
 jcaMkhRmKpOW3zbKTh2s8KeyGgKvTJ+46aqaVTHYNGBMIY/Z20bnTTtkOCxKFfPN0fP9bkGZuk5
 RLNPBisk84QB3rTOz/ztSy4XGNQTV53R8zixuuOdpr2CuUec+onDWPtoMiy/+sD6ciK/tTgfbcu
 jgJQBH4woXaPk0/Ac+84FAQzbXTrWoZ5/ErSwSVQI3rJv0OvDMHC8CK+i8rkk2qM/di1BmlwguC
 e2wMkpkmzoWTCWndLst2qE4MdUPaD0IsgMgYWewcEhJ5YvphZzW6Sb0tnjoXkMeJoqBkBr+T/MJ
 oiE2UgYSWOGEQrOmGUVpFT8fmqLxf6KFTO/MvJrgzrwwGRcW2N5nBOHqm8eD2I1Rb3OPyE7vz7V
 sxoSI8xUP075IchcUkShGzUSAIsdFqgY/oVUS6YGob798mDTQSH1Ky/LiJCp8uJwyydd0=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me>
References: <20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_152433_459016_1F488081 
X-CRM114-Status: GOOD (  12.56  )
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

mt7925_init_eht_caps() only populates EHT MCS/NSS maps for BW <= 80
and BW = 160, but never sets BW = 320. This means iw phy shows no
320MHz MCS map entries even though the hardware supports 320MHz
operation in the 6GHz band.

Add the missing 320MHz capability bits for 6GHz, following the same
pattern as mt7996:
  - PHY_CAP0: IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ
  - PHY_CAP1: beamformee SS for 320MHz
  - PHY_CAP2: sounding dimensions for 320MHz
  - PHY_CAP6: MCS15 support for 320MHz width
  - PHY_CAP7: non-OFDMA UL MU-MIMO and MU beamformer for 320MHz
  - MCS/NSS: populate bw._320 maps for 6GHz band

Introduce is_320mhz_supported() as a generic capability check using the
mt7925 family ID. This avoids chip-specific references in common code,
and automatically extends to new chips once they join the
is_mt7925() family via chip ID helpers.

Tested-by: Marcin FM <marcin@lgic.pl>
Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
Tested-by: George Salukvadze <giosal90@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Thibaut François <tibo@humeurlibre.fr>
Tested-by: 张旭涵 <Loong.0x00@gmail.com>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h |  5 +++++
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 28 +++++++++++++++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 813d61bffc2c..554716e01ee6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -177,6 +177,11 @@ static inline bool is_mt7925(struct mt76_dev *dev)
 	return mt76_chip(dev) == 0x7925;
 }
 
+static inline bool is_320mhz_supported(struct mt76_dev *dev)
+{
+	return is_mt7925(dev);
+}
+
 static inline bool is_mt7920(struct mt76_dev *dev)
 {
 	return mt76_chip(dev) == 0x7920;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index f128a198f81d..cd043ac266fb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -183,6 +183,10 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl80211_band band,
 		IEEE80211_EHT_PHY_CAP0_SU_BEAMFORMER |
 		IEEE80211_EHT_PHY_CAP0_SU_BEAMFORMEE;
 
+	if (band == NL80211_BAND_6GHZ && is_320mhz_supported(&phy->dev->mt76))
+		eht_cap_elem->phy_cap_info[0] |=
+			IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
+
 	eht_cap_elem->phy_cap_info[0] |=
 		u8_encode_bits(u8_get_bits(sts - 1, BIT(0)),
 			       IEEE80211_EHT_PHY_CAP0_BEAMFORMEE_SS_80MHZ_MASK);
@@ -193,10 +197,20 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl80211_band band,
 		u8_encode_bits(sts - 1,
 			       IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_160MHZ_MASK);
 
+	if (band == NL80211_BAND_6GHZ && is_320mhz_supported(&phy->dev->mt76))
+		eht_cap_elem->phy_cap_info[1] |=
+			u8_encode_bits(sts - 1,
+				       IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_320MHZ_MASK);
+
 	eht_cap_elem->phy_cap_info[2] =
 		u8_encode_bits(sts - 1, IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_80MHZ_MASK) |
 		u8_encode_bits(sts - 1, IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_160MHZ_MASK);
 
+	if (band == NL80211_BAND_6GHZ && is_320mhz_supported(&phy->dev->mt76))
+		eht_cap_elem->phy_cap_info[2] |=
+			u8_encode_bits(sts - 1,
+				       IEEE80211_EHT_PHY_CAP2_SOUNDING_DIM_320MHZ_MASK);
+
 	eht_cap_elem->phy_cap_info[3] =
 		IEEE80211_EHT_PHY_CAP3_NG_16_SU_FEEDBACK |
 		IEEE80211_EHT_PHY_CAP3_NG_16_MU_FEEDBACK |
@@ -217,7 +231,8 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl80211_band band,
 		u8_encode_bits(u8_get_bits(0x11, GENMASK(1, 0)),
 			       IEEE80211_EHT_PHY_CAP5_MAX_NUM_SUPP_EHT_LTF_MASK);
 
-	val = width == NL80211_CHAN_WIDTH_160 ? 0x7 :
+	val = width == NL80211_CHAN_WIDTH_320 ? 0xf :
+	      width == NL80211_CHAN_WIDTH_160 ? 0x7 :
 	      width == NL80211_CHAN_WIDTH_80 ? 0x3 : 0x1;
 	eht_cap_elem->phy_cap_info[6] =
 		u8_encode_bits(u8_get_bits(0x11, GENMASK(4, 2)),
@@ -230,6 +245,11 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl80211_band band,
 		IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_80MHZ |
 		IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_160MHZ;
 
+	if (band == NL80211_BAND_6GHZ && is_320mhz_supported(&phy->dev->mt76))
+		eht_cap_elem->phy_cap_info[7] |=
+			IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_320MHZ |
+			IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ;
+
 	val = u8_encode_bits(nss, IEEE80211_EHT_MCS_NSS_RX) |
 	      u8_encode_bits(nss, IEEE80211_EHT_MCS_NSS_TX);
 
@@ -239,6 +259,12 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl80211_band band,
 	eht_nss->bw._160.rx_tx_mcs9_max_nss = val;
 	eht_nss->bw._160.rx_tx_mcs11_max_nss = val;
 	eht_nss->bw._160.rx_tx_mcs13_max_nss = val;
+
+	if (band == NL80211_BAND_6GHZ && is_320mhz_supported(&phy->dev->mt76)) {
+		eht_nss->bw._320.rx_tx_mcs9_max_nss = val;
+		eht_nss->bw._320.rx_tx_mcs11_max_nss = val;
+		eht_nss->bw._320.rx_tx_mcs13_max_nss = val;
+	}
 }
 
 int mt7925_init_mlo_caps(struct mt792x_phy *phy)

-- 
2.53.0


