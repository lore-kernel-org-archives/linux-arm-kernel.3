Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B65109E528
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 22:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5QLbR8nQwufqPNpMgHuGuZt5CzJuoJvqK1picXhn/k=; b=FxkBA2PRzf4jFUy9u1HzhsyHdN
	nQri3EoOaAhH64XKjigneYSot/6oPdqC3kXkcr9tpo0xNsZsmgQ737OydXyk0MmeW7X3tBPnxaHnf
	GKqFcr9qi6yS9hCRZhmwFCwQhJzEn57BFm08eSzuR/gI66b2DbIfrYIXtQ8EwXbhPmBmUq6DvagFu
	d6sKDw+QIy2HwkaWvR/VRzOTLLKdKsSl/8RtOggQoVFde/VCFx+FKGPGkqQVm/akYse55j9Q6GIDX
	ONW+B/5S/NK8Nn4lIxm8bIDeAhPfllLpCR/XT+SaWWpPjr66XejviBShWcI3Oo8PFSjfnXF3DOtVF
	bcBZXdMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WRM-00000004JqC-17eD;
	Wed, 25 Mar 2026 22:11:04 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WRH-00000004JnZ-31NQ;
	Wed, 25 Mar 2026 22:11:01 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 9D62A1300515;
	Wed, 25 Mar 2026 18:10:58 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Wed, 25 Mar 2026 18:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774476658;
	 x=1774483858; bh=e5QLbR8nQwufqPNpMgHuGuZt5CzJuoJvqK1picXhn/k=; b=
	OQsGv0aLIs+JY7ipXM0S7ALef1RpUvGYzUpV5gJvtZu0LS482WTtPwMIkri0fcY/
	1H+EfCRvXEIfb07qKlXOsTB+oQSovETzPOfcQfuIBszRJ7ThJHW2gk8Yso5am6Dr
	7Z/8uWzQ0SD+5p3MUJV5boCe4thDl4zbEmh2wWzx19EP5xGx0BlK9QYO1HmIygOx
	INM9uFV395rTygUvdHw2zVLN9umTnGkq2N7DYCV8LnodqKx0vxWY3AaBhcT1t8Q7
	tunFGlZWNok466qMiTrij20G10bWoX8vfxcB/S5KqCei03OoBNiCJz6KMIvMr8TG
	/tE8hIOimbfaMl4Bt4NAjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774476658; x=
	1774483858; bh=e5QLbR8nQwufqPNpMgHuGuZt5CzJuoJvqK1picXhn/k=; b=k
	7oo8hWg29ExIIr477Ucy4gov44CjbnB2/2RbqTCjmomAyzZBaIP4F+KvLDBNdlg1
	Eglm4Bw+1/OZTX2QNSi6ULIMcKk5W8TVI7p9KIFoY0TOIzRgdDSqm5PDr/vqXLhw
	7MOEjQkQfDJHgUD7C5ohp4u4u13wKoC1f3JCkSeEH8Lm21x1HJx4zUz/1H36M8GE
	mTAmWQOM87dlG4Ur1NLwpR4ycu/O3zYWfL2RMa5mFfk9JUxk0WoLuN3J/FJjRxNx
	Unx6GPj0m/HUPu7AHnwte60WUCcCmNIrqF3Ydw7ZlckQGOuKVtzaFwYMIn7sJZ9h
	dw7MzpRh9/gUaU6QSA7uw==
X-ME-Sender: <xms:cl3EadF7_AUSWDng8Qc54wUlkbwJCN7gzHG0y-KJJqlxWsN65fGwIg>
    <xme:cl3EadJR-aHYk5vmMigJFhRq-6N__frQOMEjjMJBa9jRTjaZxHpwBjtrtCMbi_a54
    4k4RlK_5Ce0Y_wcb8rzeKT9SsAqyX4_0xDFTSoPbG1Su-im-XGl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdehiedvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:cl3EadVja6eEtisrXwr7ruzQJwIKYpJWDN9y1DQ-YGL6jCoG9AxSow>
    <xmx:cl3Eaaw2_5g4xmqS6ea7Yza_muiKyD5nMUdkGnCtZN8hZVV2Hewc8Q>
    <xmx:cl3Ead5HEPbDwGEC3-fFA8GPRD86vVJE1DsRv1PbfzjG98cv7ZVPFw>
    <xmx:cl3EacgU8T-3VlFkrM5q13yAZNoCHn19x0kqw8RB68pxTFMx_YunUA>
    <xmx:cl3EaWUq7yW8zW9hiZOPzyo3Timc5559XYWioxv2BACs8m2whwBK5Xrs>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4F9BD1EA006B; Wed, 25 Mar 2026 18:10:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Wed, 25 Mar 2026 16:10:52 -0600
Subject: [PATCH v3 03/13] wifi: mt76: mt7925: handle 320MHz bandwidth in
 RXV and TXS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-mt7927-wifi-support-v2-v3-3-5ca66c97a755@jetm.me>
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
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxF1pAqM0OjgRKzZzz+COTIrszcH61TvR7Y4ZW
 XxTxDBRh8aJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacRdaQAKCRC17sMLqGd3
 H4G4DACeGc4oF99VE9s4IYS1SQfwXsrwfwBwdh2hDlI/myXA0dY78kxUJ69KyH2VWzP7erQZf55
 sqxPgO0xxxXhSdVQ7hKIYiqKdRPaN1yhCyQPSmD0N4Tiwc6/abo4X1eF/xWLtKqL3+yM+MqZFrr
 JpA5I1CeZZZ/jYKLabF9lLx3QfhT+TUa5HHMPW+UBxddI8/BmwShC6iAvXV0g1JLXP0gAWm+Qjh
 yHU2XzUAvMHtDdSvY7Lnn5eApiR0YYK9LJoyZCPOOoSxWKbgI1ahEl0DKciIyHseC62T7MB2JMu
 Gujss3PCCvihB3ogPskLF00fSg1C9wMwLdmKR07CWFNn8gimwTVMhGxlvFIk3Ht8B41LHrnAdGZ
 bdMADJWUnbbsHrkvakvFCyK5EIfHIvD46dvWgRyNoyyuUNyxFsPk1THhbPoS3dHbiVhj+VxmUhm
 KGo4LHca/OiJ0UMLyYClUyHSSYp7ewIMdR+d76KwlFlA15e7LfcM1O3HW+ELHiq6Bshko=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me>
References: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_151100_256044_9FD8FE8E 
X-CRM114-Status: UNSURE (   8.64  )
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


