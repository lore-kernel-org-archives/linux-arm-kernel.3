Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C92FC9EC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 00:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVDAyuRFOXHy/wcoICXEPnLxH/n67+H+2S/lHmQXGE8=; b=ruM3EOZtKo3kfuVbP9fxl2oTF+
	sObHhkx1M3fmL0uJSySmJu1U0gmdHtY929fT97xC+km43mMu5HS6F7j5N1AO7qFTVoGT5clyK74lI
	wgPJHtF7F7vK98X04m3f2lfTnHQ0tfzI5HyVCuqLRbmOcEOUVqYOTuRBRZPp+Xvib3kUQrSDWdy0y
	6SsUd0lJ/DrGxVzKBiNbD6kjKfi9Z9eqJccZzZ3brEZOro0/HvMLVhjsBIG3H74N7o8DtgMF8Q+SE
	JNiNLtl8r7voj9J0PrGcZnxCQ7D9AVMEH7y92r4jHeh581TXDPjWUyu1FWTv81L3wiERiqKNqJNG2
	YXbyK1oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfcJ-00000004in3-1AOi;
	Sat, 07 Mar 2026 00:34:03 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfcF-00000004igw-2LuL;
	Sat, 07 Mar 2026 00:34:00 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 6EF2A1380A7F;
	Fri,  6 Mar 2026 19:33:58 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Fri, 06 Mar 2026 19:33:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772843638;
	 x=1772850838; bh=jVDAyuRFOXHy/wcoICXEPnLxH/n67+H+2S/lHmQXGE8=; b=
	YJmsZqDlBdsrPcyqTgWGTXoWd6pJL0C24MaQVEJWdw4tNqByEvrf2ecgq4NAt9MX
	GchhHNR4gN2JSFBsw2Nu+IihLjC1PN3YmWj4Wpe4DDSkEizqTknu5qmtqfgrtaVO
	Occs3g6FoJjHxc5c7ob8+WfmXXZDc+3WVb6ssgC37HY2KLAVF0EyDZBUibsR3lQH
	L5MrfiAc/PG2SlSYs7zO7eeTWvi9EA+c6fA3u88UZb3tNfkzqy6RRZoGdXoB5cTW
	/ewYN2zAMZ5KskldG58Vg8v8+05YQId94Ykv1IzqJGdiglzG1piKKpdY+LQndVsa
	JD2gIQDnane0Rn759K7yVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772843638; x=
	1772850838; bh=jVDAyuRFOXHy/wcoICXEPnLxH/n67+H+2S/lHmQXGE8=; b=J
	dQesv7L489j+4BJyAMheP/NocKPc9zu9bZNNyJmSY/3fqk/uwCUkH7o1E3nh/N5P
	yNkVwFtLy+vQFWeSZWXGtLfMLL6JgT3HSSPjn7JrajeYqLvslCN7LoUUtUHYFrnt
	WXGSfm8fblWqqdKlp42xMfAz+tu0DZpP8iVLK5pCSMdHdxEJT6STjrTGxw8UtCON
	38/b5h95e7rnd1uHiRr3ETZfolnRR64EmfggT8G8rrBTYDDJMKwk1LlAnyiKkfSS
	rUvoYRLZFGCJTQd7F89VhMKMMP1b0pIwMciK2SpKSgDxZFlTMcrubn6Im9bSDKgV
	XY5CP/X8Zn7MV0AKeQwQQ==
X-ME-Sender: <xms:dnKraTIGnYN2QcIUb4lIMkoD29trKupTJWPbkBQWfG--igmeiyD05g>
    <xme:dnKraR9jEwtP-JFXvuygXivT95EVhFufgFuHMwjygoFIiosIHvTFgsSFs05SwWUok
    ZtwhE-rJHck2ltx9YOcPwQ0zWMaajqiHsnIxaDbwYaNnSNEXQtJmHM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjedtjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgepkeenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjh
    gvthhmrdhmvgdpnhgspghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhonhhgrddtgidttdesghhmrghilhdrtghomhdprhgtphhtthhope
    grrhhivghlrdhrohhsvghnfhgvlhgurdejhedtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheptghhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehgih
    hoshgrlheltdesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghg
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehrrgguohhirdgthhhrihhssehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshgrmhhurdhtohhljhgrmhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:dnKrabKViEW9ddauD9cKxMpFSLQbbnnrlpDk89Is5v-cUntjBioLcg>
    <xmx:dnKraUCcDrAPUfiAXcT52xv0ZaV4l-7s8eiYViMnjVpYA6vejEuFBg>
    <xmx:dnKraRQYxvnsJ9JNH-F6JtsW-GuNEfxiLsePaD0CL6fI3tP-7Qd4sA>
    <xmx:dnKraWcIDepTnUgkULbmmS4RN3JeZafPvAg5_w3PaMpEDRH92LcaFQ>
    <xmx:dnKrabWEA4s02oTP7yESgUhCvrgMb8_pAMUx5CzPqZ3T_BtWn4_cW3Ax>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 42DBE1EA006B; Fri,  6 Mar 2026 19:33:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Fri, 06 Mar 2026 18:33:29 -0600
Subject: [PATCH 10/18] wifi: mt76: mt7925: enable MT7927 runtime power
 management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-mt7927-wifi-support-v1-10-c77e7445511d@jetm.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5179; i=floss@jetm.me;
 h=from:subject:message-id; bh=fCY3DSE95mUoabPrkuKHGr3zz66X2jRynD0TiW/Z0BY=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpq3JP0hl2X2uf/k196xdtgmlRlzuJ7V5ef/Y4+
 offmO7WouyJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCaatyTwAKCRC17sMLqGd3
 H21nDACHHqC4EVt/a2mb/2XiH5bItCkASCDZQpTI0AvtRajZW+uzwxxjb4j0rhE2yPnXhJJWHj5
 qOAU01Mspi6l5UNuCus4GyiuX1MEcCtcikdTd7HLo1vbB+3Jv9xvxHKk1cLODub1Eh0m65soe4w
 al/qqfzd73PzPtAs5+n2iVchz37niO+Ma1JI6+1LVg56lh/qqSOLCYIhZJkE5daIl6nXI+zZEkP
 FzX52RVHcBKi19+o2eLsP/wX1tkYQVoAVYgg0JII9K1JZisOckmjYPZ9DSNmOGQy+DFovaco1Pu
 sU9D86Bz6M3AUIBn6oBGiI47wz4JHVGg31sPBEs6Vexf8ItnAl7jOYx8SIqTeBMfvu2h/1X4Gq4
 /Go8mFu4q6BiCMGeBbbttWB0D1LFtLHlS0VGn6X8bWCh9SM7x/8fipBanImeCOi1moeiy7pJM0i
 GmvdnrfBXFuc9+x9uX5t2/1AmGmwgOAXE7vUIoGMrd0kTo0IWnYBlUu+mMHsm0rdW5lJE=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
References: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_163359_733196_589AEBC8 
X-CRM114-Status: GOOD (  12.19  )
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

Add MT7927-specific GLO_CFG register programming to mt792x_dma_enable()
so that ADDR_EXT_EN and CSR_LBK_RX_Q_SEL_EN are correctly configured
after every WPDMA reinitialization triggered by CLR_OWN during power
management transitions.

On MT7927, every CLR_OWN causes the ROM to reinitialize WFDMA, which
resets the DMA configuration. The PM wake path already handles ring
reprogramming (mt76_queue_reset restores ring base addresses from
stored desc_dma) and prefetch configuration (mt792x_dma_prefetch has
an is_mt7927 branch), but two GLO_CFG bits were missing from
mt792x_dma_enable:

  - BIT(26) ADDR_EXT_EN: extended DMA addressing, required for
    MT7927's host memory access
  - BIT(20) CSR_LBK_RX_Q_SEL_EN: loopback RX queue select, must
    be cleared for normal DMA operation

Also define proper macros for these bits and use them in
mt7927_dma_init() to replace bare BIT() values.

With the DMA recovery path now fully MT7927-aware, remove the
is_mt7927() guard that disabled runtime PM and deep sleep. Let the
standard mt792x power management work for MT7927 hardware.

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
 drivers/net/wireless/mediatek/mt76/mt7925/init.c | 5 +----
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c  | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt792x_dma.c  | 7 +++++++
 drivers/net/wireless/mediatek/mt76/mt792x_regs.h | 2 ++
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 1e9eadca3988..84af52a0176d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -242,10 +242,7 @@ int mt7925_register_device(struct mt792x_dev *dev)
 	dev->pm.idle_timeout = MT792x_PM_TIMEOUT;
 	dev->pm.stats.last_wake_event = jiffies;
 	dev->pm.stats.last_doze_event = jiffies;
-	/* MT7927: disable power management. Every CLR_OWN triggers the
-	 * ROM to reinitialize WFDMA, destroying DMA ring configuration.
-	 * Keep the device awake until the PM wake path handles MT7927. */
-	if (!mt76_is_usb(&dev->mt76) && !is_mt7927(&dev->mt76)) {
+	if (!mt76_is_usb(&dev->mt76)) {
 		dev->pm.enable_user = true;
 		dev->pm.enable = true;
 		dev->pm.ds_enable_user = true;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 0dec25b320f8..0f76d9197230 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -416,8 +416,8 @@ static int mt7927_dma_init(struct mt792x_dev *dev)
 	napi_enable(&dev->mt76.tx_napi);
 
 	/* MT7927-specific GLO_CFG bits before DMA enable */
-	mt76_set(dev, MT_WFDMA0_GLO_CFG, BIT(26));   /* ADDR_EXT_EN */
-	mt76_clear(dev, MT_WFDMA0_GLO_CFG, BIT(20)); /* CSR_LBK_RX_Q_SEL_EN */
+	mt76_set(dev, MT_WFDMA0_GLO_CFG, MT_WFDMA0_GLO_CFG_ADDR_EXT_EN);
+	mt76_clear(dev, MT_WFDMA0_GLO_CFG, MT_WFDMA0_GLO_CFG_CSR_LBK_RX_Q_SEL_EN);
 	mt76_set(dev, MT_WFDMA0_GLO_CFG_EXT1, BIT(28));
 	mt76_set(dev, MT_WFDMA0_GLO_CFG,
 		 MT_WFDMA0_GLO_CFG_FW_DWLD_BYPASS_DMASHDL);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index 3177c6cc6eb5..32364f19007d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -166,6 +166,13 @@ int mt792x_dma_enable(struct mt792x_dev *dev)
 	mt76_set(dev, MT_WFDMA0_GLO_CFG,
 		 MT_WFDMA0_GLO_CFG_TX_DMA_EN | MT_WFDMA0_GLO_CFG_RX_DMA_EN);
 
+	if (is_mt7927(&dev->mt76)) {
+		mt76_set(dev, MT_WFDMA0_GLO_CFG,
+			 MT_WFDMA0_GLO_CFG_ADDR_EXT_EN);
+		mt76_clear(dev, MT_WFDMA0_GLO_CFG,
+			   MT_WFDMA0_GLO_CFG_CSR_LBK_RX_Q_SEL_EN);
+	}
+
 	if (is_mt7925(&dev->mt76)) {
 		mt76_rmw(dev, MT_UWFDMA0_GLO_CFG_EXT1, BIT(28), BIT(28));
 		mt76_set(dev, MT_WFDMA0_INT_RX_PRI, 0x0F00);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
index 5497cfaab8d7..b364d0038653 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
@@ -299,7 +299,9 @@
 #define MT_WFDMA0_GLO_CFG_FIFO_LITTLE_ENDIAN	BIT(12)
 #define MT_WFDMA0_GLO_CFG_RX_WB_DDONE	BIT(13)
 #define MT_WFDMA0_GLO_CFG_CSR_DISP_BASE_PTR_CHAIN_EN BIT(15)
+#define MT_WFDMA0_GLO_CFG_CSR_LBK_RX_Q_SEL_EN	BIT(20)
 #define MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2	BIT(21)
+#define MT_WFDMA0_GLO_CFG_ADDR_EXT_EN		BIT(26)
 #define MT_WFDMA0_GLO_CFG_OMIT_RX_INFO	BIT(27)
 #define MT_WFDMA0_GLO_CFG_OMIT_TX_INFO	BIT(28)
 #define MT_WFDMA0_GLO_CFG_CLK_GAT_DIS	BIT(30)

-- 
2.53.0


