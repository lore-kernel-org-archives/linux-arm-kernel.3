Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9146010AB829
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 21:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5QLbR8nQwufqPNpMgHuGuZt5CzJuoJvqK1picXhn/k=; b=M5HSpsAVeuS9w59D/4YN2bi9eT
	c3GectnXO0soD3ib34GhtdOsC4g5RMFXw4lCbbv/WIMLNPh/mBWTG8FfD8oP3k884bn3rJIirSiPG
	+D7c3dOiETHq8mFRbhgoOl/6MeDO+bIKg23PipnaH4zcZ4pD70gDHPUFGDnUZZdVPMVKuN3fz/T2V
	93PIQOgnyx3p5vdQlcgvKjVMyWJzxg7SFV+sjZzCTR3uvsDToYX9JOeui2uf5PqMQddpYXl1epl97
	gr4wetmqAKZsT2JirAFUG0zwzl/amsUAxFRgN2c2UJ4TTJyf8tN5FrqmFYbJSiwTCe5sMCV4VR0KY
	48OGJ9IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5s0c-00000006DG1-2H88;
	Thu, 26 Mar 2026 21:12:54 +0000
Received: from flow-a1-smtp.messagingengine.com ([103.168.172.136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5s0I-00000006D4y-2P9V;
	Thu, 26 Mar 2026 21:12:36 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id CA3CE1380150;
	Thu, 26 Mar 2026 17:12:33 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 26 Mar 2026 17:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774559553;
	 x=1774566753; bh=e5QLbR8nQwufqPNpMgHuGuZt5CzJuoJvqK1picXhn/k=; b=
	DqzaVL3ebYJKfqA99kI8FaxmJt1Jc1FzHmdK6II0AhTb/kOcy0RVARlAk92n4i6A
	JoDJsnxjGvmuy/oJBheQXah1SdP0H943RBj9iEgOlyvRkbheAAgMzIKr2PHyCvI2
	AqOPu0nwA0sv8nfMz2QZxgpZecs8W7hyBila8PdrkbERyhBVcYxyuuPWmWeOyhrR
	adYRdntXEacnO1lr5KwqMCDFiYr4eCN8oF0wXKny41EBcfxdXvIwq+HG2nBdSNHo
	vUW0EYXWvf493/cxBwEH9gDuF8gi9FJXTv+i9JUsUdO/0QsrrFLjnE+eTw8eRufF
	b4ykESWznU/7WD2GuE5ZJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774559553; x=
	1774566753; bh=e5QLbR8nQwufqPNpMgHuGuZt5CzJuoJvqK1picXhn/k=; b=X
	gdbsf+mYBF5okhDjs0D5YLjPLBjAlV+6+OVV9t8poZ1UYqt8Scklsjm0aWm3yYJo
	k8yeEeRXaDlMJmwk94ED6LspVzgg/BdGkVPGh4inkpRtu8UsBIDkIdPJdEkNN1ru
	NAm1U/lcwKKgnHzUhnc/+oZ0INoH6wemkJPhdZwlTYaZM55+HmDs8kcLlMQrj5TO
	C0VSWL8SHhSdzc+LZ8N7NZkpbay439coOZ1hOlmYFZI8dl6NIrtNgPD5ytzi6u0r
	PmMkKIGmLF/cazVJE+WqHL/C/BA05sURDozn6Bl6UFfU6B3zOEsGkVG2G8Gu4uoQ
	aDRdREWBvySyL2zbUBVIA==
X-ME-Sender: <xms:QaHFaSfDFAuCnN_OTrYr3q2ugqyuCBNL0oY1AgqzWdho3ZxtL1liag>
    <xme:QaHFaXD1rvQBY3oRjNkhbpd7h1tzHkdm7723c_ihQ8OGqWkoBbak4Cx9qkvGPip-p
    qrzG5YYOqVWS-wkRN-0wvP6-ki_5HUrWIh4A2NM0zQaECesb3hePu4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdekgedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjh
    gvthhmrdhmvgdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhonhhgrddtgidttdesghhmrghilhdrtghomhdprhgtphhtthhope
    grrhhivghlrdhrohhsvghnfhgvlhgurdejhedtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheptghhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehgih
    hoshgrlheltdesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghg
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehrrgguohhirdgthhhrihhssehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshgrmhhurdhtohhljhgrmhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:QaHFaTs72IpV7KQ22AjvPYDirNxr1ODP_CcardvLoSXqzEml6N1D1A>
    <xmx:QaHFaRqR5D3mHamGmNqW2ptzuokQO_PGW6o2EpE0lCxuT7knMcdNcg>
    <xmx:QaHFabScXvxmUxoZUfep5ZYLGwUKSMkLC6cDdtbcDBudVbH5fZpAig>
    <xmx:QaHFaeZ3yxjhmMzGn79qgS8SWdC2EKFCBqelSy4QmsXrFROHMc6gxQ>
    <xmx:QaHFaZvVtpUQVgb8ve6w42B2W31uSkvtDKqFP-urmbo0BWsMgFfuPBt0>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A16B91EA006B; Thu, 26 Mar 2026 17:12:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Thu, 26 Mar 2026 15:12:27 -0600
Subject: [PATCH v4 3/9] wifi: mt76: mt7925: handle 320MHz bandwidth in RXV
 and TXS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260326-mt7927-wifi-support-v4-v4-3-8ab465addcfe@jetm.me>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
 Deren Wu <deren.wu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Marcin FM <marcin@lgic.pl>, Cristian-Florin Radoi <radoi.chris@gmail.com>,
 George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>,
 Samu Toljamo <samu.toljamo@gmail.com>,
 Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
 Chapuis Dario <chapuisdario4@gmail.com>,
 =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
 =?utf-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=floss@jetm.me;
 h=from:subject:message-id; bh=BZB4eayi5CQeKoa7X5LI8ihvLOiSO2F3JQGoBG3iu4g=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxaE43mYqYvjLKfFiKw/xDraf9On4ZhVZC9zX5
 CgZ/PlCnY+JAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacWhOAAKCRC17sMLqGd3
 H/4LDACtHZzKRKfSiDyTKRDfgF+YxZdhtWscYyilTOCuhcyrdfCpsXzL0zeqfThofcrcuCFq254
 mQh5V+OJ334wEm1fZmpwLBjj7VGK9f1OcwJ2LDgLC0oEXsgtyWz5LvKKrucY3SWlXt8tl0GKnC3
 nA5TdRnE8YRAzuUTRalXX6tp2J1IWM+ffOi9BMpkFdWl5Fsl/NMlsFwGLdulf3cA3BCySgGxmaI
 k+2VzoFfZlUXQjx2mpzBOh2hmQ3Jwi6PnhcHllvKwTmdqIhaqYc7Up8E7nti3yA1rk/Wrg+Kcip
 Af8tJSu8hcX8yaTPBXNGUg5IpvRqhpFz/eNepR9a7KHHgspXieXv7UNhmbNsaiw4az2bHI0nhip
 FeieLZgSZYCUS3qIBJm60tnSEB1JQuG05P6/X+jQBoqcHJTy7pcpSsuaE9XZZrMhhX+9MD/C0HK
 YZstmB5ppRWjlQAXQj3X7D/q6y9b5v5dvwevmKz8eTi6UFFOcITNto9+xac9QIhWJ0Ubk=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260326-mt7927-wifi-support-v4-v4-0-8ab465addcfe@jetm.me>
References: <20260326-mt7927-wifi-support-v4-v4-0-8ab465addcfe@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_141234_671788_1A168AF6 
X-CRM114-Status: UNSURE (   7.65  )
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
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 9 +++++++++
 1 file changed, 9 insertions(+)

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

-- 
2.53.0


