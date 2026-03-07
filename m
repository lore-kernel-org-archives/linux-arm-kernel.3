Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297AAFC9EC4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 00:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/FZ8St7B3QoQV6NVViBDN3fl77WhO5At5mZqNI+Gtw=; b=zgyAE9IVMyDfkK/RxG1RFMnyJD
	zJl97rl98gTpX0wdSsMgVq2bTgFnSoa7jzDlQjcDyOP7YxZTCgjRefUzidzuQ1GdtYNJHQVFA3Xhm
	HO/Dog7qSNqckv0R2ijshMZYEVd+caJm7IWPLUUKaycx/6uR2TpmiHBoe8LHvamp4anL7KCPhAX4M
	1w+xQ32EA3LwhVstUShXmUIF4CivHwvW/LoshMFtt5DKCwZJTgwi01Ng4/sReU/EAQdRcn5cGyXg9
	8fUvMD1DnAA3PNs/qR93jXexCit5A/yTPQh0TJ+NYpEC2UBmH1ZJplGER8qYbG1xya3hywnfLtoUD
	7KT/549Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfcF-00000004ihT-1OE8;
	Sat, 07 Mar 2026 00:33:59 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfcB-00000004ibi-3f6z;
	Sat, 07 Mar 2026 00:33:57 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 222EC1380A43;
	Fri,  6 Mar 2026 19:33:54 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Fri, 06 Mar 2026 19:33:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772843634;
	 x=1772850834; bh=O/FZ8St7B3QoQV6NVViBDN3fl77WhO5At5mZqNI+Gtw=; b=
	i5tfdGs/brz/xneND5XXws9E40wAj4trx/plR4iFCF9TXO4Hs1BEopFNjxBSYX7M
	S//EgeOusPKyqmwVAxiRap/BYKTmrudk7AMyxtsm+yLlBzF9l/OWzGFUu6TKG77g
	2GmQ8J+U2gwZ3Va7sud6SOd4YevhuKvDlroKt2etm103NNLs0krF2B4C22J2RnXh
	6vJtxiiGbKEMYUKBZUXtVQkKPqJb4XS3XLxtqqaEBm8cqAtLmsUmmQEZYhmR5bqB
	b3N3I4+0b0bxW9OrcG8j22Fh22DVwA8voJdfCS0wtFILQgSZIvZ1CEbk5+yj4B+a
	91tzPzFrIg46e9TVmR50nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772843634; x=
	1772850834; bh=O/FZ8St7B3QoQV6NVViBDN3fl77WhO5At5mZqNI+Gtw=; b=2
	z2NEk7RFfyGiKyGHkkN0h0KTccbTc5+p5lABrEPgJaAcvUCmixPkAfHwTxX32596
	g9cvw9ksWHZHllfGxjwVfXF7k1z4QnEO0poFkjbJa39TwzJAJM+lmor+gl7AIfSH
	GerLMGX/ixcvD1hsO/HHk7jBCn19e7GJDOvSrRjzzzi67YtNj6EwOOvsaZKyRt90
	Pyqs1aYlKmO9TBXSt9ZfJIhs6vMTzQ3VDh6MZ3AN6cG0fu17Y72ekPi59FM9la4V
	ydG4GLqvtybCeXSCVLPvS4ThHJ8cGL3QB5p5Tzwbr0j309ppeZwNEdQtnfgu8n85
	moiiR00w42YNn66LvoLzA==
X-ME-Sender: <xms:cnKraYYyl3MZflsv_GMzKArQ4EH64Uml7FnvDp5r3qCQEKLriI4eJw>
    <xme:cnKraeO627GjbpkUHF86jhsEGpfNyH2RTyNEHttmbtF4JrWDInOECmoHw-V3FL1il
    K6yOELbi_AT0kiLAONxGV4aO1WotPo71DG5Ynvwg8do0B6cF9j6xZM>
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
X-ME-Proxy: <xmx:cnKraUR9K4vGF_jNq_eJC83xeG69tC2YDu77bweSipFv04S8ligwEw>
    <xmx:cnKrach-6x6GbilOHmD80NpT7-LzpbZ2-BSGXaN8ZOURj5uN1MbymQ>
    <xmx:cnKraQt7LxvcSrh5_kMVwF19dwPdZS2bFLCC2Cd2bMeiAeokWpNHIA>
    <xmx:cnKraeyeL9BEcuQAihGyJ5UzoB9sGeQZSBWL5NvGq-W4y5fOd8jS0w>
    <xmx:cnKraUmLj7UEVzd2q8ztdQEsokF_aWVeFsn-Ot4JmJbn2aTRdNU03uW1>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EF95B1EA006B; Fri,  6 Mar 2026 19:33:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Fri, 06 Mar 2026 18:33:28 -0600
Subject: [PATCH 09/18] wifi: mt76: mt7925: populate EHT 320MHz MCS map in
 sta_rec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-mt7927-wifi-support-v1-9-c77e7445511d@jetm.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751; i=floss@jetm.me;
 h=from:subject:message-id; bh=0y1/cfyMHHVKeRaAcDWZr6+p8GqZVWD4BkhOC6GENCE=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpq3JPaqv7C247DGQfPMY5Ss9FIiRnQ8rMHoxoe
 ZPvocWSMSGJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCaatyTwAKCRC17sMLqGd3
 HyDWDACh91WMXw+HeP56hkbaGH6qbFdptP25eSsiGWa8JJ4jj78edEiA8CAJnNkY+h1ZAIiRcGL
 mb0U3K3DSbowj/BpZTDZP74zLqOtVlOVdlU5j/MAbPE0xg+1eGJl12eGhYyu2AfTwuwAHafWogZ
 0uxJgGi0aSa87YN4LRUKhAZ2ATEIpTaCXPn7h9CbwKGvooQGV7AB3+FAXz95kx7/ZYxrjav6dvi
 FcP4v6edIgpUqz2zPnY8aZxu6DijZl4pRSd/ccIHASfR9ME1EhNshgZrMhk7gb2b1Ov2PxQo+W+
 +SDA7jt838Wk/PaPk65+QYxGoGZcuUvk+uMt+Z/lS4me+1NwnxpTiI/eVucUbre1rErktZKtV4+
 9zlkaQD8WJnfER+o4sn7sJCeu0y4o2SayVWNmZUkxVIPDrdGDr5StgaRrVTPLHpawORLbzeMkxf
 S52QxKzg1MmlHjU43jTOctXW+u2rb3qMkkkwi+Ikhpx8EcC89BDXcGSOKmqDlXVE/D/sE=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
References: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_163356_027448_A68E13E9 
X-CRM114-Status: UNSURE (   7.55  )
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

The sta_rec_eht structure has a mcs_map_bw320 field, and the channel
width mapping includes NL80211_CHAN_WIDTH_320, but the 320MHz MCS/NSS
map was never copied from the station's EHT capabilities to the MCU TLV.
This prevents negotiation of 320MHz channel width even when both the
hardware and firmware advertise support for it.

Add the missing memcpy for the 320MHz MCS map, matching the existing
pattern for BW20, BW80, and BW160.

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
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index cf0fdea45cf7..8b5ffb240d52 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1683,6 +1683,7 @@ mt7925_mcu_sta_eht_tlv(struct sk_buff *skb, struct ieee80211_link_sta *link_sta)
 		memcpy(eht->mcs_map_bw20, &mcs_map->only_20mhz, sizeof(eht->mcs_map_bw20));
 	memcpy(eht->mcs_map_bw80, &mcs_map->bw._80, sizeof(eht->mcs_map_bw80));
 	memcpy(eht->mcs_map_bw160, &mcs_map->bw._160, sizeof(eht->mcs_map_bw160));
+	memcpy(eht->mcs_map_bw320, &mcs_map->bw._320, sizeof(eht->mcs_map_bw320));
 }
 
 static void

-- 
2.53.0


