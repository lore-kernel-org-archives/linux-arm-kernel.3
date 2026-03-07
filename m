Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527D9FC9EC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 00:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrwffRQEagabaef6ha34lgm0oUqiXx0dwX24YtMs0QQ=; b=nDX/Uvh+tDPeKoTKtaxi64sxIO
	uPR3u6BW5ZylaoV8jseBSoiotZOjGgdzfF0e78Pa8GLBR8qQsQY4sNW9N8zfaEpDrANSxckZZI5bU
	PEIeu2LJjNkULRVk8x75WjcfMlhQe/KgGpnTmSF0chwlvHjH2O95fCvkMETzLpQTPpfo+gJ7dVNv9
	fiAW67ShWCEoaoQeXnKJpkWYCsbyDgzXo7tU1pSXeklWXEPt03c/du1ZR7ITPL6SGkErEsaYcFWNd
	0zw7NkuQQ5ryRPV+Xd0VXODB46oM3Gq6p7dEADHasvd3vaL0azEyzLVvtrcOQdfVQmzS/bdwSU9WQ
	nHrQEVJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfcZ-00000004jAu-3iN2;
	Sat, 07 Mar 2026 00:34:19 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfcU-00000004j0i-0yrX;
	Sat, 07 Mar 2026 00:34:15 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 550E31380AB8;
	Fri,  6 Mar 2026 19:34:13 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Fri, 06 Mar 2026 19:34:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772843653;
	 x=1772850853; bh=jrwffRQEagabaef6ha34lgm0oUqiXx0dwX24YtMs0QQ=; b=
	hE5XLWzEJob8lOH24guqZhSyPHQXFukRTWr5Litr0CDS5rbqFco1UabpHo8Acjp5
	6YtitUb2RslU8SRxY9wvguVEsFRzqupJmquzFF/nLtGqRte5A7GhZjb7gnNuWizN
	18WRwgFKfdNtkPgEuz3CILaovgs43VQviXXT407lQTOo86zRqjZSNRpMPN4FNuvi
	UcxkTt0ZFRZzaONEbUCIltTc07P3ntK6JEAdXPh3VZgSZqCqTP0ZJGxzQGq3CdRe
	v1ZYdTUx60DzCu8f3RZ8jZShI5SvhmiPUbohz/Dex55xKcPwz25br21PvfrXKc0Y
	WERjtf0ZphIBrZ7anxWt7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772843653; x=
	1772850853; bh=jrwffRQEagabaef6ha34lgm0oUqiXx0dwX24YtMs0QQ=; b=j
	/7ZatfuOus2L4xDhhH0/VTRCWNfhVvZRKAZi2t29+nCa9bBAWwQFqerxNcv3T0Zi
	CeBgZi+K8ZFjOgbY1S8epwh7SEAeNHl1UogRFBUIyE6dHO1Z8O1y1cFTFr4GiEXn
	JdaKGu0TLM/jejJgyo++mi6xHpdMt4545Ao/eEUEZhjN300qksdARXO2bHABQ6mT
	exoxDHsTIMkovnUV55tYgGe1W0347+o2Jhv/5zOigpFoZBgMGcfcOB6tQ2MeXww+
	sf57o6w1XRCwhhBZ1ii24l6Dqo4PNNGW5Vne7ySeSajI+Om6ixlP4rPV5R3Iorbi
	6RUk+EOXuwTwYQu/HoIGQ==
X-ME-Sender: <xms:hXKraVcf1UlD6M1rnlRcc_KFSLtREdiqEE8awuJnYt5JF_v_drycgg>
    <xme:hXKraeBVqRu6T8a16Kp3FPMc63jluy9oSkAKfLPd2PXSqRbhL_4Vp7BJMmz7elAtt
    Z9dvYlUcW9VDd5ou277yOCYnaCZ0RmTGsZHSkxcuLkMrr8PqQ7mXgs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjedtjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgepudefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehflhhoshhsse
    hjvghtmhdrmhgvpdhnsggprhgtphhtthhopedvfedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholh
    hlrggsohhrrgdrtghomhdprhgtphhtthhopeefudelfeeifedusehgmhgrihhlrdgtohhm
    pdhrtghpthhtoheplhhoohhnghdrtdigtddtsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    eprghrihgvlhdrrhhoshgvnhhfvghlugdrjeehtdesghhmrghilhdrtghomhdprhgtphht
    thhopegthhgrphhuihhsuggrrhhiohegsehgmhgrihhlrdgtohhmpdhrtghpthhtohepgh
    hiohhsrghlledtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrthhthhhirghsrdgs
    ghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhgrughoihdrtghhrhhishesghhmrg
    hilhdrtghomhdprhgtphhtthhopehsrghmuhdrthholhhjrghmohesghhmrghilhdrtgho
    mh
X-ME-Proxy: <xmx:hXKraVFi98mWrsSHy86WdIZxLr9VXAUkEECAwj5rYxMA6I3fbt3gCA>
    <xmx:hXKraVGzgXlG3bZ96See-RO3TYjNDBcxT9R0ktZ7XYuh37ROulICaQ>
    <xmx:hXKraWDvotwF_XO96h_q3p4vKtW20_IGufiOOsqrvDTKSyvkAOCZUQ>
    <xmx:hXKraR2FON1fQhj8-3cMAo14pPp5QIxCT0AnwFV94-dp729FN4BvQw>
    <xmx:hXKraToeNZ4vogZqG-Q9zBVXPGSJKalgkx8rNIETvJP1omBulAcDzC5q>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 266991EA006B; Fri,  6 Mar 2026 19:34:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Fri, 06 Mar 2026 18:33:34 -0600
Subject: [PATCH 15/18] wifi: mt76: mt7925: handle 320MHz bandwidth in RXV
 and TXS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-mt7927-wifi-support-v1-15-c77e7445511d@jetm.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3297; i=floss@jetm.me;
 h=from:subject:message-id; bh=hxcSincyd2o6Rc2OyiPCHchQlCqvcUsPEmPLVBDCKXE=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpq3JQ/Ph/XMOIcOJHhpdhqnQYFcO+ygQ2fifzz
 k7b0bVNX3mJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCaatyUAAKCRC17sMLqGd3
 H7gxC/44MsaOxJ/kqaZrTDzGw6xnYAnjWHd3TdlejOUE7JkXNufE/PbJsbO4xUyS+S39GUCscOL
 wHrmBBEPZDmbqZjuHseYSI1FsGZQ82LT1hyD58b6PO7yEeIiIE+dywkDdpp/H9vROQobIqBYIQl
 GifNXuyTQldbFnLTih9Vl2bqgSURZgcdBwnnjN3QyOyV71JLoGWwaa8juFV5fEejCk1JOLc0k6M
 UdX1fpAFo01WCZfEjyXXwF4E8B2+HBiWQvsQxRYXW8Upplkb6D7MZ8VinlXJfvjeYnv8v82qlf2
 0ITDEKCZzd06gxcqBV6mADN34o4//4lAH2NIf3Roa0hPfMHqNelvCCDv6BN9zwEvtEo+J2NdfBJ
 ODAlU33sZicIq5FAhYZwUEyIQ9b2RQTrGCtm5ic/jjVpJNk0iwf6aZHGXLXxOhFHS/v5EA9RmW3
 acfdbD5tTcexs6VU1rT68S8iv268vtprMrSEyjA8IYYe8AvuhCJjyH9q5ePQpbvk8qayE=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
References: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_163414_419243_620FEF7F 
X-CRM114-Status: UNSURE (   9.41  )
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

The RX vector (RXV) and TX status (TXS) parsing in mac.c lack handling
for 320MHz channel width. When the hardware reports 320MHz in the
bandwidth field, mt7925_mac_fill_rx_rate() returns -EINVAL and
mt7925_mac_add_txs_skb() records no bandwidth stats.

Add IEEE80211_STA_RX_BW_320 cases to both functions. The RXV parser
also handles BW_320+1 since the hardware can report 320MHz in two
adjacent encoding positions.

Also fix whitespace alignment in mt792x_regs.h defines.

Assisted-by: Claude Code <noreply@anthropic.com> (claude-opus-4-6)
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
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  | 9 +++++++++
 drivers/net/wireless/mediatek/mt76/mt792x_regs.h | 6 +++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index caaf71c31480..ad03fc554b69 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -339,6 +339,11 @@ mt7925_mac_fill_rx_rate(struct mt792x_dev *dev,
 	case IEEE80211_STA_RX_BW_160:
 		status->bw = RATE_INFO_BW_160;
 		break;
+	/* RXV can report 320 in two positions */
+	case IEEE80211_STA_RX_BW_320:
+	case IEEE80211_STA_RX_BW_320 + 1:
+		status->bw = RATE_INFO_BW_320;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -992,6 +997,10 @@ mt7925_mac_add_txs_skb(struct mt792x_dev *dev, struct mt76_wcid *wcid,
 	stats->tx_mode[mode]++;
 
 	switch (FIELD_GET(MT_TXS0_BW, txs)) {
+	case IEEE80211_STA_RX_BW_320:
+		rate.bw = RATE_INFO_BW_320;
+		stats->tx_bw[4]++;
+		break;
 	case IEEE80211_STA_RX_BW_160:
 		rate.bw = RATE_INFO_BW_160;
 		stats->tx_bw[3]++;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
index b364d0038653..a2ce6872559e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
@@ -301,9 +301,9 @@
 #define MT_WFDMA0_GLO_CFG_CSR_DISP_BASE_PTR_CHAIN_EN BIT(15)
 #define MT_WFDMA0_GLO_CFG_CSR_LBK_RX_Q_SEL_EN	BIT(20)
 #define MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2	BIT(21)
-#define MT_WFDMA0_GLO_CFG_ADDR_EXT_EN		BIT(26)
 #define MT_WFDMA0_GLO_CFG_OMIT_RX_INFO	BIT(27)
 #define MT_WFDMA0_GLO_CFG_OMIT_TX_INFO	BIT(28)
+#define MT_WFDMA0_GLO_CFG_ADDR_EXT_EN		BIT(26)
 #define MT_WFDMA0_GLO_CFG_CLK_GAT_DIS	BIT(30)
 
 #define HOST_RX_DONE_INT_ENA0		BIT(0)
@@ -509,8 +509,8 @@
 #define MT_MCIF_REMAP_WF_1_BA		0xd1034
 
 /* CBInfra CBTOP remap values */
-#define MT_CBINFRA_REMAP_WF_VAL	0x74037001
-#define MT_CBINFRA_REMAP_BT_VAL	0x70007000
+#define MT_CBINFRA_REMAP_WF_VAL		0x74037001
+#define MT_CBINFRA_REMAP_BT_VAL		0x70007000
 
 #define MT_MCIF_REMAP_WF_1_BA_VAL	0x18051803
 

-- 
2.53.0


