Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BC510AB827
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 21:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOxwP/LFDi9G4GG/ESf696AKYCs6uY6IFgrUHF+9MxA=; b=sGwk54tIQb0E5Fg1s2XlsxA87f
	vh8zuSnXzcQcTwqQ/YZBAUPbOxSpNrem2xnWeUo/cgbDLXr5KlPiavPlk7TqLDcyNC/gOTv4IX/pk
	lq4rcVE6mH1LbV17DIzVBgxNuCKj/TJE5gZdleth5OThp/3BmU2+92CKfxd+cDGTqGX4TCNHvlXj6
	YNwHN1tPxf8neOrw1x8V3z8e3UPQ9uuzw9dTsoypzO2Wu8Z+mRJSZ3+AX9NrOFs+NVCIWYBl5mF5V
	4F1V4DdUt5+ETx5+VxgcxpOvFqeT7ywE55f+Vhe0nT3qRMqCVhk+194iqxdKLyhZGx5xYR7/7Dj4M
	EOJnnwEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5s0c-00000006DFi-11Ao;
	Thu, 26 Mar 2026 21:12:54 +0000
Received: from flow-a1-smtp.messagingengine.com ([103.168.172.136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5s0G-00000006D4K-3Ns4;
	Thu, 26 Mar 2026 21:12:36 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 0E13C138014F;
	Thu, 26 Mar 2026 17:12:32 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 26 Mar 2026 17:12:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774559552;
	 x=1774566752; bh=HOxwP/LFDi9G4GG/ESf696AKYCs6uY6IFgrUHF+9MxA=; b=
	N/Td8TvWPrRBCT4UmRikJVm4u4hjXJujVyRbfmqewYl9zBJ68HcqJzPK/3u+c2XQ
	QVLtmwMX+UhxAijbn+IrwwUqV4eHR80YfbBng/6m7T7un237Wgr0/qfLBZtBbjHy
	Nc5NguTGEg8sefV5gKO9UWvjXJqq5V46KVRitAvFLIu8dcfomSd+N3zyYDBrVlvA
	tiIPOKnFzIoEiiuwP0t3ZBn8oYesLNDfmRvzOZk3CnlRjfegu6V2JxC1Y3Nsoi1I
	Q3u3KCrRNgLdyQcvYp+mffYID/dUYakPG0VQBs6RO0m7z6l1Br54uVq/6cCs93jc
	0Vj4+wsh/ziSTu1JjXRhIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774559552; x=
	1774566752; bh=HOxwP/LFDi9G4GG/ESf696AKYCs6uY6IFgrUHF+9MxA=; b=c
	NJFHR97oPOnHRwW9Lo+Ieivv8qr3rkPXYy0zXV9+wKENw+W18W9OzQ9B1ZGSS7V7
	WpAijZtjzGp8Yrd5eokaxaoEGCUi2Dah2YDeLXICZzxNuFGfaKAZl9JQWWIq0Wsm
	Z5gIS5BGCVJHCIFzR8dCTpstu0FSZu7Y3Dh0tUVkCSWt+MloSpIY6CNXCleCYzfc
	Vod8VgLOgXj4uTc9E1DungcRGRBP9ZRYPOJv9zhL1JKjW06d/ywMo1Nj+jxVd6iL
	kPxnEv3ev3mNrFN6xFKzMtNUGdinB42Tnrs1aUnbLX5B5d1nnRf5O4yZa9YokqUy
	7UCLxGdooWjx4JlcrvNmQ==
X-ME-Sender: <xms:P6HFafE8nsQPgCofhSzD5mDssTLPNtVXYt7nAE6yjYoYBZgU0IKVUg>
    <xme:P6HFaXJM2-kHO6i4TTk7txxWgetKomNLZgHH0XjVMrs7gbhBmo_SldmPSqV-mXKiN
    p96i190fvAd3lOSdIbTr1RL35mCkh5S3VLxCi7wmKs9piJHW-Y21eA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdekgedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepue
    dttdfggfdufeeiueetffegveefffevjeehvdelfeevhffhteekgfegveeuiefhnecuffho
    mhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehflhhoshhssehjvghtmhdrmhgvpdhnsggprhgtphhtthho
    pedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnghgvlhhoghhiohgrtg
    gthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthho
    peefudelfeeifedusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoohhnghdrtdigtd
    dtsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrihgvlhdrrhhoshgvnhhfvghlugdr
    jeehtdesghhmrghilhdrtghomhdprhgtphhtthhopegthhgrphhuihhsuggrrhhiohegse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepghhiohhsrghlledtsehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpth
    htoheprhgrughoihdrtghhrhhishesghhmrghilhdrtghomhdprhgtphhtthhopehsrghm
    uhdrthholhhjrghmohesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:P6HFafU_oTocZuk9Wy5EbfEf41M0_u3pIlPlrlHNxRfn99ME3-IF0Q>
    <xmx:P6HFaUywMljqKR8P2oVw_uPDbfCZSBvSE6zTse1SyDoSEkIz_Et1EA>
    <xmx:P6HFaf7QwH0iRVD-4COUSY6HhdZwVoxKgz4Zvkb_Jkjid1WjFknVag>
    <xmx:P6HFaWg3zsqP9xJS-8KNyAHHbukNelnYaU8B7UvZA3Vh8GHAgmgplA>
    <xmx:QKHFaYV1B2ENikZnDZQvMK-2L-Wuw6SjoFqCYIbwEfqYzQpzWCgON-oJ>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DBCD51EA006B; Thu, 26 Mar 2026 17:12:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Thu, 26 Mar 2026 15:12:26 -0600
Subject: [PATCH v4 2/9] wifi: mt76: mt7925: add 320MHz bandwidth to
 bss_rlm_tlv
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260326-mt7927-wifi-support-v4-v4-2-8ab465addcfe@jetm.me>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
 Deren Wu <deren.wu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?utf-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
 Marcin FM <marcin@lgic.pl>, Cristian-Florin Radoi <radoi.chris@gmail.com>,
 George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>,
 Samu Toljamo <samu.toljamo@gmail.com>,
 Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
 Chapuis Dario <chapuisdario4@gmail.com>,
 =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1913; i=floss@jetm.me;
 h=from:subject:message-id; bh=oL0xrbX2LUVp9Q4JBTD78nnciF3VWT3fiWIhBG52oaU=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxaE45JhSnc/J5oCpgtFJJoPpHiK6vkch8y345
 yuAeH5aXU6JAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacWhOAAKCRC17sMLqGd3
 Hx9iC/43Gcu5nDAXTOrqictzohkwauPGpa+JwvfObi2x5ike6vlLV/iG5bAkArKYCcF6JInqYA0
 MJhVlVFZvddy81x0f3wU94Jg2QPZ2cE3HQ2y7ZZd9wpqEUYD+RWnpub8ixGijPmP9acnfTlsCea
 b8rEiCU4klmZSnlIbLHMli77J3rowsriAUPo3u0zq+hdCGxX47jVGQvdOUkD6lUEG8lhlejjljL
 lfICcqhDvTTb4ZtDk0ZvXHoU31fvBXvkcecq1nsHuzAYkOp2rKBJ6AWrYfU8DeS5qFcC2MoYShW
 htjoMZgmciqWKgifVqOBAqxKNBOBHMu1T+VoFB9uAkNy/9qDkk/nLpMHn70TgkF+o2TUAjVhqYE
 /gURfXt/6eA5Bd73gI1B9pvWTLBPdK4PsERZE8lJSwvex4RECZ9pVqk6U4d71BuTvy0ZvZyuFEM
 mB2UmABwv+6DH+mKnkWeXww+hUfGY8QOl0Ue/Dnx6bWnOOF52VA430SqnPTv70d6cNxtc=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260326-mt7927-wifi-support-v4-v4-0-8ab465addcfe@jetm.me>
References: <20260326-mt7927-wifi-support-v4-v4-0-8ab465addcfe@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_141232_930475_D4818322 
X-CRM114-Status: UNSURE (   8.43  )
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

bss_rlm_tlv() in mt7925_mcu_bss_rlm_tlv() has no case for
NL80211_CHAN_WIDTH_320. When associated to a 320MHz BSS, the switch
falls through to default and sends bw=0 (CMD_CBW_20MHZ) to firmware
via BSS_RLM TLV. Firmware then configures the RX radio for 20MHz
and cannot decode the AP's 320MHz frames, resulting in complete data
path failure at 320MHz.

Add the missing NL80211_CHAN_WIDTH_320 case with CMD_CBW_320MHZ and
center_chan2.

Tested on ASUS RT-BE92U: 320MHz throughput goes from 0 Mbps to
841 Mbps (iperf3 -t30 -P8), PHY 4803 Mbps EHT-MCS11.

Reported-by: 张旭涵 <Loong.0x00@gmail.com>
Closes: https://github.com/openwrt/mt76/issues/927
Tested-by: 张旭涵 <Loong.0x00@gmail.com>
Tested-by: Marcin FM <marcin@lgic.pl>
Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
Tested-by: George Salukvadze <giosal90@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Thibaut François <tibo@humeurlibre.fr>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index cf0fdea45cf7..dd5ecb07947b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2331,6 +2331,10 @@ void mt7925_mcu_bss_rlm_tlv(struct sk_buff *skb, struct mt76_phy *phy,
 	case NL80211_CHAN_WIDTH_160:
 		req->bw = CMD_CBW_160MHZ;
 		break;
+	case NL80211_CHAN_WIDTH_320:
+		req->bw = CMD_CBW_320MHZ;
+		req->center_chan2 = ieee80211_frequency_to_channel(freq2);
+		break;
 	case NL80211_CHAN_WIDTH_5:
 		req->bw = CMD_CBW_5MHZ;
 		break;

-- 
2.53.0


