Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E9510AB827
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 21:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JD0LmIz415XLpZYRfQu0zc+Gi+UZQoc1q5KNADfTGZk=; b=AgB2NHgsH4p0I8vgVr4o0OOQjr
	+yYdY/Tby8vHlPA2kPpSVXD9Sj4ik3Qmn81sLFFY38C9CRU3l/JovwV+Sl6Jldns2ApJYuLcYBjxA
	UmmBqzXy1R4+RWXP6wq/kNEE9Ye2pz+L/4FmDq97ZwbyhVczYgjis7B4ab5R6gQVBz1hz6qgGasCS
	aZ5Osv9O8dtcaUV3FyjbX/VDO37TDyDeiDJMXTgQ64LP5Ju+sX1oxDHfCINYCj/1GeByL6W7CPF6D
	JARsnh0oNHQYpEW5AYVP7KXz3jPjn8JcgtvXG6vXIrWe3Sq4qEc4iTZ8tVTK4kc7NlnjY+72rmsgb
	ZMupib/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5s1W-00000006DiZ-1YAv;
	Thu, 26 Mar 2026 21:13:50 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5s0T-00000006DCF-1vH2;
	Thu, 26 Mar 2026 21:12:47 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id BB1A0EC0218;
	Thu, 26 Mar 2026 17:12:43 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 26 Mar 2026 17:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774559563;
	 x=1774645963; bh=JD0LmIz415XLpZYRfQu0zc+Gi+UZQoc1q5KNADfTGZk=; b=
	hnzdRHBIHG1/9WJtKjE6nR9fL+CuiqPH/7Ehd77ZDJkHY2s7UHSnDa/VLqpXXd51
	UTpboA7P+8qX/+wr8vH7TGa/jctnVhDnVzCMV8m+gPEqaK+m9rCMi2cKS8CvCSEV
	Lt4aiestcJpMdGms2VK68OhXJVwq2bb4bvU+iv08vBRa/GNupJPlIZtRP1JQ7uof
	B720PqzFPxhEiMBvB+rPecY2lxoku1K9vaQYMEoGQsAfjRsoHHlJsGwohGKURsmR
	EOSd2LN2JKW5KoCMc5C78i8ErplKaaJZjeFsZpX/t34v928K009QtWtPgXyCBCsF
	E+Kw7bJSiuaQMPG6Jq5XFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774559563; x=
	1774645963; bh=JD0LmIz415XLpZYRfQu0zc+Gi+UZQoc1q5KNADfTGZk=; b=Z
	RCdhSoAuZUUlREC6M7rMNec53ZcIUf9a2vSORueVzo2Eb7tdIXcVf9UqkGcRY+W0
	P766JJjUdAcckzx1V88ZoCj6/cQDypNwl9TP9LapKFdlAzg6rPF8uT5Izw3VFM8F
	cqR+BocczyUGySPrqOGkmqGLkaKRVIOUEJJ3kYRarqbydh58fpEQxGD7FuWkJkSC
	twppcipovYE9MLA10XWIQxmjPWEwCTnzGXVkUJwVnpWqVAatDVTEbZp0hhiKUJfa
	PZhT6YSfukgFKIigBGeijvFBJ7v9lQnqGzT8caZpoJUA/LWYTQRCWMFY74QU3ZRn
	gRxjVpTDp18Z1F9d8srdw==
X-ME-Sender: <xms:S6HFaegF3amXv9HDzCWtcBf1_CYRS20K7z10OyxnWYovcEMACymLVQ>
    <xme:S6HFaZ3H2GOd-4bZeeXARJEJ_yKX6hCfAEbgsNQb_QjeJPXgFXFsinxQ4nN5S2sUh
    F5vIDq4nigKULftcTpFBwbUJJiFMLWBA7BJp-R-kigEz1558BTMfGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdekgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthejredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepvd
    dtjeeiheeijedtveeujeevvdekjeeuveekleeijeekfeejhfefveeiffffvdeinecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjh
    gvthhmrdhmvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepmhgrthhthhhirghsrdgsghhgsehgmhgrihhl
    rdgtohhmpdhrtghpthhtoheplhhorhgvnhiioheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggu
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinh
    hfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvrhgvnhdrfihusehmvgguihgrthgv
    khdrtghomhdprhgtphhtthhopehmihhnghihvghnrdhhshhivghhsehmvgguihgrthgvkh
    drtghomhdprhgtphhtthhopehrhiguvghrrdhlvggvsehmvgguihgrthgvkhdrtghomhdp
    rhgtphhtthhopehsvggrnhdrfigrnhhgsehmvgguihgrthgvkhdrtghomh
X-ME-Proxy: <xmx:S6HFaVe1_kLcMTytOKlxJA0jFPZlT8G3l4tsrGRIhcg_p0LHOMkeiw>
    <xmx:S6HFaYanEyxMNc3zHbgVw4vdqdhbGml2_Er7ObCXIn4VUKpfHnGGCg>
    <xmx:S6HFaR5A0y9OtrW23OjivQKi8NtHN144b4BWR5_a4uwhT0udt3cA1g>
    <xmx:S6HFaed_U-YNwQ-ySdC2tGYCaHfsGndQ4u00Dc-huwLYitvynYTE9g>
    <xmx:S6HFafrKYbRmiLU5xXFsjxxj5EGJJ5yNzANx73qVMMdRsiTYGE7Nmlq7>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8D0811EA006B; Thu, 26 Mar 2026 17:12:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Thu, 26 Mar 2026 15:12:33 -0600
Subject: [PATCH v4 9/9] wifi: mt76: mt7925: disable ASPM and runtime PM for
 MT7927
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-mt7927-wifi-support-v4-v4-9-8ab465addcfe@jetm.me>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
 Deren Wu <deren.wu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2658; i=floss@jetm.me;
 h=from:subject:message-id; bh=EttSMB/87XiHGZhWtMpgNAtlCMJydT4Yjw9bIPiDhNI=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxaE4XROHqnZuTIUqW2OvGZAnfVNg6oApkpJue
 J8Tatn7ChSJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacWhOAAKCRC17sMLqGd3
 H2JRC/wIb29AaG8RxZb+OShZ8cdeLylHN774vajS6QDNxzxJsJ1dK7saQwA2JNCjeaa3sCbB519
 gLAjXEk9BiJ+r+KDX89Awezkobz19vwr9BB+gVt0sTiefzWyGdpQau4OTQOtr5YBIQcs1a4QKq/
 vr/vdqJvm3GdwpM8DEJ/9SIPaAbQ3jLaq3XtWOGIb9lDZwlSqjVRYHRhlg9RdPi3kXbxu7WUqx8
 DnOYGtfJ15g7MDzUsGiZwGxPa+7M0T8EwClgslKsaxebOx2mZR4VKqxTnVfcDXfqbpGsbCmM4K3
 H8puUFKH3VqtqQonPfORsLaYdX2i/yHI4tiUEqkX/I2b1wll/0bIm9ioTEoxdrD4tXOJ4hJuWS0
 9SP3umUsT+d0P6J62C7acUnAhnUM51U3F++RkgahzaUKdu/Grt/jhd37pBAdFNgLiACOih7RXCn
 N8hbJOTygBMxhGQD85nw1R/LBJKF/q2k7yQDRHPPhsKUEicJ2W9mlqjrM1hV78To6AXBI=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260326-mt7927-wifi-support-v4-v4-0-8ab465addcfe@jetm.me>
References: <20260326-mt7927-wifi-support-v4-v4-0-8ab465addcfe@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_141245_567505_E8EAA0B9 
X-CRM114-Status: GOOD (  10.68  )
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

Disable PCIe ASPM unconditionally for MT7927. The CONNINFRA power
domain and WFDMA register access are unreliable with PCIe L1 active,
causing throughput to drop from 1+ Gbps to ~200 Mbps.

Disable runtime PM and deep sleep for MT7927. The combo chip shares
a CONNINFRA power domain between WiFi (PCIe) and BT (USB).
SET_OWN/CLR_OWN transitions on the LPCTL register crash the BT
firmware, requiring a full power cycle to recover. PM enablement will
be addressed in a follow-up once safe power state transitions are
determined.

Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/net/wireless/mediatek/mt76/mt7925/init.c | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c  | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 3ce5d6fcc69d..4766b9343953 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -230,7 +230,8 @@ int mt7925_register_device(struct mt792x_dev *dev)
 	dev->pm.idle_timeout = MT792x_PM_TIMEOUT;
 	dev->pm.stats.last_wake_event = jiffies;
 	dev->pm.stats.last_doze_event = jiffies;
-	if (!mt76_is_usb(&dev->mt76)) {
+	/* MT7927: runtime PM crashes BT firmware on the shared CONNINFRA domain */
+	if (!mt76_is_usb(&dev->mt76) && !is_mt7927(&dev->mt76)) {
 		dev->pm.enable_user = true;
 		dev->pm.enable = true;
 		dev->pm.ds_enable_user = true;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 604c0e9ae7ba..1f05c212be02 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -350,7 +350,10 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free_pci_vec;
 
-	if (mt7925_disable_aspm)
+	is_mt7927_hw = (pdev->device == 0x6639 || pdev->device == 0x7927);
+
+	/* MT7927: ASPM L1 causes unreliable WFDMA register access */
+	if (mt7925_disable_aspm || is_mt7927_hw)
 		mt76_pci_disable_aspm(pdev);
 
 	ops = mt792x_get_mac80211_ops(&pdev->dev, &mt7925_ops,
@@ -371,7 +374,6 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	dev = container_of(mdev, struct mt792x_dev, mt76);
 	dev->fw_features = features;
 	dev->hif_ops = &mt7925_pcie_ops;
-	is_mt7927_hw = (pdev->device == 0x6639 || pdev->device == 0x7927);
 	dev->irq_map = is_mt7927_hw ? &mt7927_irq_map : &irq_map;
 	mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
 	tasklet_init(&mdev->irq_tasklet, mt792x_irq_tasklet, (unsigned long)dev);

-- 
2.53.0


