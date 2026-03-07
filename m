Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565B4FC9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 00:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SurwNBvAl/bBDja7s6L7R/0E+xLUsx7Ctts0NZBHMOE=; b=Fq61nJIi6c/qdJvzLLq1nJnWMd
	9celKsdQo1/CY4wAPnG+u/ULDCyrx26EdvM9To8g/jPrakWNDS0JQjtX0QHa0eYHDtnhOjC6clRbZ
	0ZbPzTOjzT0f9G/neazL+5Hww6Cn70bSxqcKY0tmx/haBqg3hRbXAZlEv/mKwKnn8ofHh/av1aQEG
	vbMujC/yu9z2DxIBn7uYA1AsSdS0YuTyPPJIOecIQtdfN9msHOKHQYJWepgrwVpVRUQdFUO7+qHZ8
	sPdPvi5eBBl1oJD/s7g5JB/8lCQN63/kGIUBKRaP+H/V3Za/Wsg4jOreQQHreG2YE0GyUDdZ89Th6
	zCXhHBpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfcC-00000004icl-0JEE;
	Sat, 07 Mar 2026 00:33:56 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfc7-00000004iVG-0AAD;
	Sat, 07 Mar 2026 00:33:52 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 368521380A45;
	Fri,  6 Mar 2026 19:33:50 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Fri, 06 Mar 2026 19:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772843630;
	 x=1772850830; bh=SurwNBvAl/bBDja7s6L7R/0E+xLUsx7Ctts0NZBHMOE=; b=
	EU3DA6E7CFuf68QIe1jn6w2D91wclcXrsQYo+dBYcdoqd1OEhHYB7eVV3FWPoAOG
	Eu6nO+/IVAx6heRNdK2b+QaVw4P2LLntkR7kcRRuQM1Y0b7OnyUFfX4IMuGSaTP4
	ZZ9sx5mYVV7DKezfJBiBUEGrFryJKoKB4q/BiMENraMPbozSnxBe2gfqmoxjBPrN
	PvBmYnxlLPilleKZrMz7s37HF5EIi7kTZNK57fcJRHdTS66AKnAd87VYKclsZ2pe
	xbDAsESwO8pFiv8CHQ8Zp/g1EQLDPM90Avy3yATQDb5XPeI4BARozWJL1q8SoldL
	DVHN+dSUjtDymfoCCnpxnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772843630; x=
	1772850830; bh=SurwNBvAl/bBDja7s6L7R/0E+xLUsx7Ctts0NZBHMOE=; b=j
	Zf2cWNzmCBO7Yjt+3pi7ABQOoDuXaAUnEzWIdxY+VCao60UIQLORipLAiFLnPaAS
	RKUnB5SCclQLqJIeVWSJCEsfrNW6C8tWH29sM6IVBAbRXsc8qo+UrulZVhICYHBo
	5Q4wMdxWFpjBnhpmNcvhv24oWBVlcz+gEHBLFbkqjw5p+B3+VViJ3YN/T1qltqVG
	Z37sYQ5LXMEfGqTx+x3abKU/vAcitWbnYNtc1z/CHSssWt0uwCiMqhPBLXMHRqlR
	N6tT5prtsipDXxplYXntbYKHg0NyH08VrXzUVyLMdRgePI+bUF3KX/mOSsdn3ZWY
	yhXpVmtn+Ctqo0bjgWDjQ==
X-ME-Sender: <xms:bnKrabiAuLJkHFCwujgj_Eo0fELS6GUz4ivbd6mrCvazK25AQKs8xw>
    <xme:bnKraS3yYvHpVvaAlJD_GLN-gT9H1lIg2DdHOoB7Q24ZqCzdr-QiFMLyBLnr0gvI7
    sHIIeSoScnVDPQIaQf0PCZbItxnjkhikO-F_L1k-w4dJ9qu_5fBUxU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjedtjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgepjeenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjh
    gvthhmrdhmvgdpnhgspghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhonhhgrddtgidttdesghhmrghilhdrtghomhdprhgtphhtthhope
    grrhhivghlrdhrohhsvghnfhgvlhgurdejhedtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheptghhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehgih
    hoshgrlheltdesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghg
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehrrgguohhirdgthhhrihhssehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshgrmhhurdhtohhljhgrmhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:bnKraRgkauOtahwNqqwCdS8mefe9lnBcmoE8BZAt6YHeNlUjynRCEw>
    <xmx:bnKraa7hD0ky8CMrN6OSho9CkRDZePkFUZVer7mrCjT_gQLBoatsdg>
    <xmx:bnKraep7Gaky93v9SoiS2vpDfVfREqjiL7NCGCwRNZkU-AybtsxEhg>
    <xmx:bnKraYXOiBkPuVioLtsIx4289oQcsaCuuSR97Uddv1OER6BAwLiKfg>
    <xmx:bnKraVPRR5LRgGJPmIiuxVTVNpPlonYaPxH_Kusx8i1AV03kMsdt2V-k>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0B0511EA006C; Fri,  6 Mar 2026 19:33:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Fri, 06 Mar 2026 18:33:27 -0600
Subject: [PATCH 08/18] wifi: mt76: mt7925: guard mac_reset against MT7927
 DMA destruction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-mt7927-wifi-support-v1-8-c77e7445511d@jetm.me>
To: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Deren Wu <deren.wu@mediatek.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Marcin FM <marcin@lgic.pl>,
 Cristian-Florin Radoi <radoi.chris@gmail.com>,
 George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>,
 Samu Toljamo <samu.toljamo@gmail.com>,
 Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
 Chapuis Dario <chapuisdario4@gmail.com>,
 =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
 =?utf-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
 Javier Tia <floss@jetm.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1943; i=floss@jetm.me;
 h=from:subject:message-id; bh=rDGaFfNf7jHAcpr58xKa3I82OUiQC87REEhxcKnu0lU=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpq3JPMXsAEGYKf/FbWGwk6bwEdk8nUJ3cAxMlF
 9a/tR05XCuJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCaatyTwAKCRC17sMLqGd3
 H9SGDACf5zkl3X6UnGRm+ZnMzObtrZtz5CJQp6Dn9jvZ4U7gX8dyGL6rpp1JaYLi4kdHfkjnLuN
 j92iQH9evrsyNDLSKv+KCWE2WC3XBumitMbFjbFQuHPNaQHAgFPUVi+i2+CxyR9HVS1KvH9+gSt
 P79twzIsEBxtVdxUNYYSJaZ1ZrVVGArzQSX2usCnZnXb5WZ/rT9RN7bHeTP2qr4dsYPsvw8RUSm
 bDn7aQA359GY6rr42rZPfJ6x/oBJ4oWGaZW2oUihtsxE6q/GAf7Uw7A8AOHRQYYOy3HHsz9SpLJ
 Y39ST5CbalxxnKERVpRsnlyk88biKENqxCgu9y46ZKwvru23fUc/cHSbEUZ75+XzWw9A8mo6LSK
 Y5J3fzeAVa0CyAF4eW9PEMnqyBEiafaLsECAo3hjKq9FQ8okR1nwcST6KlwB/GY6fcwvrdDb6RY
 hyOkFyTrdZrn0B44aDKw7JGi2n6xFjOYHa3eO8w151qqk9ouBZ30+9bplwCWm9T7gEJJM=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
References: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_163351_192565_6902D75E 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

On MT7927 hardware, the mac_reset path performs CLR_OWN and WPDMA logic
reset, both of which destroy DMA ring configuration. CLR_OWN triggers
the ROM to reinitialize WFDMA, and the logic reset pulse disrupts the
WFDMA state that mt7927_dma_init() carefully configured.

A full MT7927 reset requires re-running the DMA initialization sequence,
which is not yet implemented in the recovery path. Return -EOPNOTSUPP
with a warning so users know to reload the module.

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
 drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index 1626a3684082..cf578a2cdc68 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -72,6 +72,14 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
 	const struct mt792x_irq_map *irq_map = dev->irq_map;
 	int i, err;
 
+	/* MT7927: CLR_OWN and WPDMA reset destroy DMA ring configuration.
+	 * A full reset requires re-running mt7927_dma_init() which is not
+	 * yet implemented in the recovery path. */
+	if (is_mt7927(&dev->mt76)) {
+		dev_warn(dev->mt76.dev, "MT7927 mac_reset not supported, reload module to recover\n");
+		return -EOPNOTSUPP;
+	}
+
 	mt792xe_mcu_drv_pmctrl(dev);
 
 	mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);

-- 
2.53.0


