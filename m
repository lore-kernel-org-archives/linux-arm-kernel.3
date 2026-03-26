Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CFD10AB827
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 21:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Jm/52oKcoIIFQozJ/h7Muhk36ukRaDKMKe1v8oJZSc=; b=esLMBtnwPbnpD0Z4IVmHpBmw5W
	oMwLd6opsqvTAz1lWy8KzPkho963A0IzDWKRRuW9HaNIvmBF4rPvEQuoj7SJd+tHUv26LI0NQN/NJ
	eVtYdlvkBgfk/coooNHB7oJ+LmDzJEr0qRKgzewWnjQbNPGQDjxsFgD0k64k2BKMrbrYUk5ntFNnQ
	9ha6doln6/2V4y2Ba+UEtAXh6A6ih/EZb70fxDEeEJbiYwfrIXIY0rHWYTzI5Dd+DCGEivzvHRZXy
	pY6VFChL2C14oyrwDcgqaMe3iBTRDPeUOEmaH0NQRWJnPj+340xyfTYYtbHnQzb0GPONtx+W3LprP
	oiBKLbwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5s1x-00000006Dtf-3izT;
	Thu, 26 Mar 2026 21:14:17 +0000
Received: from flow-a1-smtp.messagingengine.com ([103.168.172.136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5s0N-00000006D97-2LJg;
	Thu, 26 Mar 2026 21:12:41 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id C1FCB1380179;
	Thu, 26 Mar 2026 17:12:38 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 26 Mar 2026 17:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774559558;
	 x=1774566758; bh=6Jm/52oKcoIIFQozJ/h7Muhk36ukRaDKMKe1v8oJZSc=; b=
	LrZvBOJFtWtyMLrRnpySZa23FcZF+/iNhYX/F1dhvhUNYz/JeyyODJmirUf2xTI+
	K5mfHxuddq64XqSOE45xjSBlzanZ4E4xodbjnYrjDsB1CdEo5EyfH9ZSgO9Oqrmg
	lRVX4MMSAUGn6Vw7Uf1PJ9O5kugV/GKMwxtAnGCs8G01kuZsLjeu6oI/nvUQzJb5
	tNbKrdJl6tUfqBt79w0E+/YDAlD76rem0vU/PpCJbUxpbDXqBe6G8Q/GNpwG78SE
	S4tLfpjFZePJmCZIEeDlQM57Lc45/DiZmjaReW5oeQIsCO+4NmNURy7s/l97iZ3Y
	3ZrJ8wDHtSQrAphkAIEswQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774559558; x=
	1774566758; bh=6Jm/52oKcoIIFQozJ/h7Muhk36ukRaDKMKe1v8oJZSc=; b=I
	bXpuAMs8LrNRj9QxfVjDeCFRN8G7cVkhaHx8KfzrHy+3gS3tjlrPJCx/58clhShH
	yfpn2wHpDeAzDWk3IwaxaIzAvWSSH+aesKmOuIT9w3V2WWMC+QC5WFbYpO7nE099
	gJR58MJqM0Aoz/afjNQso6PFmCXHTmXCep8rLvknmHWbaHH1/4y28MKVwDY4YnwA
	H+uqMu6xn9bIUDR1gyOaQC+uXZ0DoI2klWmPnIEJdSMH9pCGYHBhK42zIMRYZfqt
	voQGq+KFMNul1ru1iTnokg6KlTS/0CwM2M3+bpYddqxNuHySFPd/qJqKvtIUjqIa
	2k5+FlRMzZ6zX7soja76A==
X-ME-Sender: <xms:RqHFaUhFfzvVYbmE_q4x7cEcqwMK6jEPW4DngYDJpvCu98xr8wJwQQ>
    <xme:RqHFaX0DXterFkPVMxT3crSknTYk7CjCyu0vLdYcbPmmcjU8y1KCTYkWMSC2km9kg
    I-3O-NV9lbRPwem8DqKvEjnNvt-WdbK7O4Z8sR-ZZyr4iku_I72OHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdekgeefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:RqHFaXTAne4m2jrN5GLgRoOg6bTYqCojy5rkDW2KKqxjF6gmOhDqjA>
    <xmx:RqHFaV-AO20_x-5X6Ri-YNkBxPsOQcKjvuCIYF294Q7eBB4x19BN3Q>
    <xmx:RqHFaRV79qiziZ1PQNHbjOlzAHeKeG76DiEtOksUoCzKBnHm4PrBtw>
    <xmx:RqHFaTNNrCa9fMsmORopKU1aFSuaoTkQ2-Go-PJHLRfyT8qXzIGafg>
    <xmx:RqHFaYzXkgZyFedSpWLNn9ISFEypouPamMTTSprI5pNyW2cp3g1PSEkC>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 95BE71EA006B; Thu, 26 Mar 2026 17:12:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Thu, 26 Mar 2026 15:12:30 -0600
Subject: [PATCH v4 6/9] wifi: mt76: mt7925: add MT7927 chip ID helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260326-mt7927-wifi-support-v4-v4-6-8ab465addcfe@jetm.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819; i=floss@jetm.me;
 h=from:subject:message-id; bh=9vX1+HCKHr0k2DqRknzuHVDKBxcMWdBFaonJ+C4rfPk=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxaE4csdi7NGlGkgmzmbvvy5NLIyk+EFk7ZBMJ
 Luxur9lt1SJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacWhOAAKCRC17sMLqGd3
 HyaZDACX+4UlGmEHINO9tW7mBzz3mq4T+pI8ONBRbjYvL/BaOjge29LD7smG1+CyHq295gBGmi5
 /2klrLLSuMT4JPcppRL+Zom/10oeUgLij997Ib4RYAxLJJD4LO+fWkPg0YBusuHbUc/Q9mZE4kk
 CDDjzwcOtVifQIW8Y7D6YkzE52SziV1o6EDNHYpfPgGq01JNaOa8x7bmlnsMPQs0pQeCR+LIyqE
 OnMLZt9YM6xIp4xEJsGvNXHOjCfjJGX2ebhI5kLq6oeDSD2OD8zxXXJvxfby5YvM/yMQQUwpKRG
 hwA38+hoPGpzZKbxReV3lbjJAbZj9PC4i5ln0jqhTNPLRNbdRoyqF8uz3caKUCb93FVsiJq44MK
 gAeQDhfahu901gQnX+16dyZqPeS/ic3WWL3m4m0h4/MvyEHd9vLggjXsyjFMdndkrIGs+swlh5X
 oeovBln4LmR7i3p6O05dA9VpDCCLf7KwpjlSV13W5yOMB6RNvvDTQekuh3s1BI/0LmCNQ=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260326-mt7927-wifi-support-v4-v4-0-8ab465addcfe@jetm.me>
References: <20260326-mt7927-wifi-support-v4-v4-0-8ab465addcfe@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_141239_664381_D7B9353D 
X-CRM114-Status: UNSURE (   8.80  )
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

The MediaTek MT7927 (Filogic 380) combo chip uses MT7927 WiFi silicon
that is architecturally compatible with MT7925. Extend is_mt7925() to
match chip ID 0x7927, and add is_mt7927() for code paths that need
MT7927-specific handling.

Also add 0x7927 to is_mt76_fw_txp() to match MT7925's TXP format.

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
 drivers/net/wireless/mediatek/mt76/mt76_connac.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 393a7952f86b..4a63ef4e5c34 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -174,7 +174,12 @@ extern const struct wiphy_wowlan_support mt76_connac_wowlan_support;
 
 static inline bool is_mt7925(struct mt76_dev *dev)
 {
-	return mt76_chip(dev) == 0x7925;
+	return mt76_chip(dev) == 0x7925 || mt76_chip(dev) == 0x7927;
+}
+
+static inline bool is_mt7927(struct mt76_dev *dev)
+{
+	return mt76_chip(dev) == 0x7927;
 }
 
 static inline bool is_320mhz_supported(struct mt76_dev *dev)
@@ -277,6 +282,7 @@ static inline bool is_mt76_fw_txp(struct mt76_dev *dev)
 	case 0x7920:
 	case 0x7922:
 	case 0x7925:
+	case 0x7927:
 	case 0x7663:
 	case 0x7622:
 		return false;

-- 
2.53.0


