Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1079109192C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 22:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5QLbR8nQwufqPNpMgHuGuZt5CzJuoJvqK1picXhn/k=; b=UspbVf242um0zcmAMjjxGEJaWj
	ouDl7vBnqfnIWlvYb7+VSBFB8xfQ1kOO3oOATU2F6ruzRC0pW84YIp3uGqY/6tQ0zKJh0NghIoLxw
	/QlTiOvfNpp1RgpVvsJ0TMpIsnkir1AN6FpvOdiLZKG8g67Tqv8Wx1DPXnATw/TiRzPj0rCow5IuW
	2feYydMlS2oLgcDPv7j0iSitDGHiPm5gWfWd5IwlmRvugl59uvlNfx1e3hj3sbNLQEOrq7Zw/pcmu
	ZbBf8h50Bi6G7LGo3IykduiMvKGP55ylTkFm61pabqI9tlBcWKmI/jH54Ky699wDnfnQW5f8yo05c
	cFP2s+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LnH-0000000BdW2-0UCH;
	Thu, 19 Mar 2026 22:24:43 +0000
Received: from flow-b3-smtp.messagingengine.com ([202.12.124.138])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ln2-0000000BdMR-3HPQ;
	Thu, 19 Mar 2026 22:24:29 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id ABA3913000A0;
	Thu, 19 Mar 2026 18:24:27 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 19 Mar 2026 18:24:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773959067;
	 x=1773966267; bh=e5QLbR8nQwufqPNpMgHuGuZt5CzJuoJvqK1picXhn/k=; b=
	lDjETvmgR+vTWuZSCVwy8YODs/KyHMd7kxvGJf4QokyGGtde+JaLW7/Ko/Tu/Ci5
	7j2xV2P9QGVGJ6D+eNDuJCMbSdUBsHT+pQt8DqxjTJyHwBx/SfLuiMBb9XcXXA4+
	PdkWOQu9EifrXB+RUqQ+jF128C9iCIEJkXuXTwdDPl/pORW82EnoRsODIMW1pO4Y
	6CirWftK/Z14yyiiP/NuKEvWnsxaCPR+pL8WfroZiPC1epkAp17h2e6FGCk6II/S
	NVaZOhDtvOXDDV8mjIVaHAWGj6sKSAbZNs3h6hWz35ITtTf8ZKf+TaUrS4BCQmnN
	7plNy7cs4sLeH9Okeerepw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773959067; x=
	1773966267; bh=e5QLbR8nQwufqPNpMgHuGuZt5CzJuoJvqK1picXhn/k=; b=u
	EzHl3zIjVZwtNsQraNRc3Nk7ne1teFsNY3TA2NIoGR258ktly7rRFIDl7EPmQxBu
	M57DpMp39hO8jUhPkg/vvTlLAYhYfSVZvCzxRcY/BKXwWkD1p2gTIvXnBYMSWuEx
	gXHgce/wIpH0uLHtXJl+baoE2vBPjEN1tUVkP7WqI+ulcckP1Xv8E9+A1ahF9Iqi
	zUsqxtQuP1aib1j5QuvIRm+phmJK/ZzE7TLGh8a9QzUMG+jRFbZu3DiV7MC00H/+
	RSdhhRsdMH/XtJ4JbbnGefrsA7zM3j59gMAqtto+uLeTCpYSC3t7y0bi4CGgHOf+
	gY6i7D1A38vv9PLHCXG4w==
X-ME-Sender: <xms:m3e8ab8XoSwitPi6qUUyzz4K0tiY7HjNuKfI7MPnabnCi25AG-yxjA>
    <xme:m3e8aSiKjx2LFubVRE-PM3eVX8bLgSnIcq5buxLqnehjz2VWiAC7Sv1pYvea2n3E4
    lFYL6s5bAsuxh171L36xaGaWU18YKcxFxBeuHnMMMZ03Ey1Vc35HIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdekvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjh
    gvthhmrdhmvgdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhonhhgrddtgidttdesghhmrghilhdrtghomhdprhgtphhtthhope
    grrhhivghlrdhrohhsvghnfhgvlhgurdejhedtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheptghhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehgih
    hoshgrlheltdesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghg
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehrrgguohhirdgthhhrihhssehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshgrmhhurdhtohhljhgrmhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:m3e8aRP-pwOUr_2ugZnyT2XzTxq6MO_ZGBUdUBDeTxuXSKpb8yg9zA>
    <xmx:m3e8aRKXiEaWFHpFU_3re-RnS3-_q4M-0OUYKF84W-L6JX4jT6Y8fg>
    <xmx:m3e8aUz3MZiP8o5nD53X2npti5qYQPZXJIIpJ0ikfIl9WiUyflFHQA>
    <xmx:m3e8aZ6aTam6lN-MuNg11GWZBcXHCbUSxsf1bbauZf78aIGmt00xNA>
    <xmx:m3e8abPdWdEgViE_s1zipd5cjZu5TkdTuOSkJXz495bbR1IvuwYdS4de>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5B41F1EA006B; Thu, 19 Mar 2026 18:24:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Thu, 19 Mar 2026 16:24:19 -0600
Subject: [PATCH v2 03/13] wifi: mt76: mt7925: handle 320MHz bandwidth in
 RXV and TXS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260319-mt7927-wifi-support-v2-v2-3-d627a7fad70d@jetm.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=floss@jetm.me;
 h=from:subject:message-id; bh=BZB4eayi5CQeKoa7X5LI8ihvLOiSO2F3JQGoBG3iu4g=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpvHeQWnFuapW0bydN/UBfu/FXVsG+kZyIG0VcK
 5p4Wpq2uHmJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCabx3kAAKCRC17sMLqGd3
 H/29C/49kH7Nj3n3Sv2PdlYuGKDDxtiZnPFShBCT9R+V39ez1E1rriegYkPJrjHFsl5uaE4Pt31
 u6Ek+dfe964al2meFioGSb0Dy2KPQNkzqcBxxAIs4uPLTTV0w6Zqvn98UOgoejxG0RW6ptGhKFj
 Z3RXnje7YVdqfzC64pCucTRCeExSHmgmNJSw3eYY6X3c+AB1D+vm1sRYCc6FQ6LzVWMfl+u2vq1
 hcpTEfl3bqRk5KV98urL5TSUHbxoBKj1mNtBQ83sVjwTqQqBL+w8KwHSjveO3uha23T9ykN2V8c
 aE4zU1NosBFD0vrUlp0OTSOD9+glulxoBAou3v4KCd3pPXH4PRprGP1PFl8vb5IHgPAHhcqv0tM
 mY0kxILKxbKpC38w76vHtPbdUF0iYcVqhNnoXQik27kO0rArhxSztxhqcn57GnJUlj7x/va5YTK
 JeV7C8d2j8O9KJt7D1TE8WvsKOgbdelsSuAUhRTB+5yikJq5ZneYa5Cmxgu0V061x/8uI=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me>
References: <20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_152428_864637_8BE6540F 
X-CRM114-Status: UNSURE (   7.90  )
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


