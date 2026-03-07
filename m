Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BF2FC9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 00:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oRXSofd2xMKwzx8uK/FRX4Ajp5i0R+uMPSyB8kKtlI=; b=JWSBaG62lmPfEu9fQhsTb625lH
	ysRRp6Uq4wjwySyspmUfBYeYNaXde8whaOifqXO0Z5w6xy6J8VV//+dxCzyrgBSc/raX+U/X4PcD/
	5eVVTPsT4RqaU/5tH0fmDQoH+8LDNIzNIyNJ4xPWCb31kZglGBG/7ZodOmBpqfCwOFvWz3wNx/hnH
	vCaMmLD5Fv3IRMQdaiwBm3ze5RUaWcFzgGsfuXxXo0uniE69DY913jlkALtifwKhDuBq3bVW2ZdL+
	R6Ylu1UrSyRN5c1eaWjWPBpj80XTdI2uuSWfX12MD9qf2+SmjBy0jNxSmTUwW/r6sGiQp3Px7gnPf
	I82Wxqhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfc6-00000004iVH-1VJF;
	Sat, 07 Mar 2026 00:33:50 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfc3-00000004iQ7-0TiT;
	Sat, 07 Mar 2026 00:33:48 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 58FB31380A42;
	Fri,  6 Mar 2026 19:33:46 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Fri, 06 Mar 2026 19:33:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772843626;
	 x=1772850826; bh=3oRXSofd2xMKwzx8uK/FRX4Ajp5i0R+uMPSyB8kKtlI=; b=
	dWAfE8Wln/4/TWN2vTjTxkbM+BuqOcH8d1bYrbzS45QdZ3l8FC9UM16sN1CyUiTM
	LHptVoUFMWgxnz9qGwY0H6SHVa1Co99ahqgFq9A3LiGyFF9w87aeznKJ4wBENBkK
	i+G3Kp3iuSQi7O9WCAtVjrsOvs3Pg37v30G2LzO5AC834aK3oOllv+iLtuU8a6am
	18f8yKX/6NUMhKZBeLfdS5C0NZP6Z892BNK8v6ZJCcbPgtq6dWPlWlV8Dvj/YIp4
	w7X/VmewyBAJn+Dw+PM066+s5FfLga+AT4SRfdCNufRs6hwnVmdOukwCUd9/FEx9
	PiincwleEIRoHOdaZfj5vA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772843626; x=
	1772850826; bh=3oRXSofd2xMKwzx8uK/FRX4Ajp5i0R+uMPSyB8kKtlI=; b=l
	QZdCs02+8pGaYPL4LLi6NF1IL0PAiHi/iv566gG1Hr5RaKDk2XjYk3gmH3zq3Cfb
	itsZgO5qKcPZaj0B8PupqtLQuFexl7j+T1BOHi94FGsISbb4uAPNtM6SjQC0EeHi
	Lzyh/ewAsOLokQ+jX+PpJTGHTqhwSX/eWCUZReG3JSeMJVBcFgTB0HAxBH9f/M5O
	/ZAAzfleGh+xEH1sTMQmipnWCiY2LWLCALon5ZWHeThII9a/cQGZDlkdVehp9Jxk
	aGYZxqfZVCiMKwojSM2qMTsIWZSTd71Pz0bgfxz4RnHiY0fHFpu9lZJEKrZdO+RO
	S2PQT2wkwx9+67hRfB/hA==
X-ME-Sender: <xms:anKraWgJt4S78iLPxU8Sk3KXeXM-zWn_Fl_8kzjymHAJXemCX0HDXQ>
    <xme:anKraR1F0avceSEiP-z2lCYBjqVM35-rQWa0E4FJnsUXeoS9nIAWV_vbP_5NW9Gl3
    VYLjKc6r6XW1xU2X2Gii3HEP3Pr-MkBJBx998QHwBl4J9Ic_yCvaJc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjedtjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjh
    gvthhmrdhmvgdpnhgspghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhonhhgrddtgidttdesghhmrghilhdrtghomhdprhgtphhtthhope
    grrhhivghlrdhrohhsvghnfhgvlhgurdejhedtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheptghhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehgih
    hoshgrlheltdesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghg
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehrrgguohhirdgthhhrihhssehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshgrmhhurdhtohhljhgrmhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:anKracgz-TiPVnH9546JWUwMgdPOI--ocQ9qUsMZzkpEingVyw_-6Q>
    <xmx:anKraZ6vUVV1KC24K-6m7MFyN5Jh0FCkAiIsQpWCmy7cuklzE4fXpQ>
    <xmx:anKraRrLY_kgWvC-Ymt0DMnVqF2bEKfrcfv9EtfNMfiGzvzqqcqk0w>
    <xmx:anKrafWlkawRPzkFnDKd7TKHoyWtx0iU5Uu4hyB_f84KpEW9LdbDPw>
    <xmx:anKracO8BZPHiGqaU7CZ946sL_NjfQMy5-1io4JbHUM6gKkkSpR0U0b6>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 327251EA006B; Fri,  6 Mar 2026 19:33:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Fri, 06 Mar 2026 18:33:26 -0600
Subject: [PATCH 07/18] wifi: mt76: mt7925: use irq_map fields instead of
 MT_INT_RX_DONE_ALL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-mt7927-wifi-support-v1-7-c77e7445511d@jetm.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2571; i=floss@jetm.me;
 h=from:subject:message-id; bh=fh8xuA/UcnCiI2pt4y9B5bOwUECz0KpoSZwkpRJvLHQ=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpq3JPKHrsOJzA8wN2GMFvjDypIHO67m5syOjsD
 ACZU/PlUAKJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCaatyTwAKCRC17sMLqGd3
 HzjzC/9JYr/GjJIy2ewR1UB9eduPA4Z1Z5s7QcX99yWtr493idUXTtwBSLCr66G1zWURB9gIZsQ
 C6pvBKy6L81Dbh8OcBM9Djh8kR4KfGxfdgQMcTjxWRJtKSdLGUNNXlliQOilds74yY5N36FNPZf
 h48fqvXfsr/EJu/LQ5spP5IkYbOmLgcBguApfd0Bx1aCW5nZyjYtRm1+a4CX1Mxhp1LrDubiS4C
 IGe4fOMYHWkjkz637QD9Y0QF6r3CV2RNTuMCjS3u6Cxl82kyeksXWVPuVE7HwcIjzyo5Fe3qcG/
 1JuwzqU8Y77qAPiemU9qi37YSI9zEjhQcRPUox9ZHXuX+an+oOGMevsrRaayNXuG5jqSlEwhjtC
 2pF+am8nqW58V3JG26Vz2dBJxW1p2hPJ4YE4uNOFlFmWe2/XsFeVrcsRijXnbJwWKUUi2vl7Klz
 cCjT2XB9Z6SngsNmz06oNUH1PVF5fv3jNzvTpUIlVvBfChYjgfsFQ9cJiPUGH6HJKbUZM=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
References: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_163347_224181_BFC64AA3 
X-CRM114-Status: GOOD (  10.07  )
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

The mac_reset and resume paths use the hardcoded MT_INT_RX_DONE_ALL
constant (bits 0-2) to re-enable RX interrupts. This is correct for
MT7925 (RX rings 0, 1, 2) but wrong for MT7927 which uses RX rings 4, 6,
7 (bits 12, 14, 15).

Replace with the per-chip irq_map fields so the correct interrupt bits
are enabled regardless of the chip variant.

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
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c     | 5 ++++-
 drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index dce9f30b68d7..0dec25b320f8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -766,7 +766,10 @@ static int _mt7925_pci_resume(struct device *device, bool restore)
 	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
 	mt76_connac_irq_enable(&dev->mt76,
 			       dev->irq_map->tx.all_complete_mask |
-			       MT_INT_RX_DONE_ALL | MT_INT_MCU_CMD);
+			       dev->irq_map->rx.data_complete_mask |
+			       dev->irq_map->rx.wm_complete_mask |
+			       dev->irq_map->rx.wm2_complete_mask |
+			       MT_INT_MCU_CMD);
 	mt76_set(dev, MT_MCU2HOST_SW_INT_ENA, MT_MCU_CMD_WAKE_RX_PCIE);
 
 	/* put dma enabled */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index 3072850c2752..1626a3684082 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -118,7 +118,10 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
 
 	mt76_wr(dev, dev->irq_map->host_irq_enable,
 		dev->irq_map->tx.all_complete_mask |
-		MT_INT_RX_DONE_ALL | MT_INT_MCU_CMD);
+		dev->irq_map->rx.data_complete_mask |
+		dev->irq_map->rx.wm_complete_mask |
+		dev->irq_map->rx.wm2_complete_mask |
+		MT_INT_MCU_CMD);
 	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
 
 	err = mt792xe_mcu_fw_pmctrl(dev);

-- 
2.53.0


