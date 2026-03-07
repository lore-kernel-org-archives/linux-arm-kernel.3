Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2964FC9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 00:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEjAv72VHfGiLkHrAlhjKdzunRhjRylRiDm2CPYMkMg=; b=nyQBy+fPMZhIifY66iJ2n6xjLP
	ET9rNxne+1mPThtZcKnoxB1AzR8SDv2VLQMzlozCnbBEVrLsHtMQJVWU7ifSYPZe5+yEJHnQom9S3
	+NB9wkRpblOFOvW2UaHLf58BfzCqpBlAc/XiXKOMmZDUzF9DrhytB5qTrGq9PjBBot1dIr23x/IUO
	LecROq6ebeVGwIB38lzHjRNgOkCzeKrV4eso2ARHpjT4ELmso1MTVpTyLIudmIoOuUAI2LBSclK8d
	haBiyKrPjOcMurH4ALFFH4TOD46es1LG1LZQYORzg6clE12jNj0Fhe52qYbZtxYwCldlI2IoE4hr8
	CynYiM0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfc3-00000004iRe-33iF;
	Sat, 07 Mar 2026 00:33:47 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfc0-00000004iMP-0eY4;
	Sat, 07 Mar 2026 00:33:45 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 61C441380A41;
	Fri,  6 Mar 2026 19:33:43 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Fri, 06 Mar 2026 19:33:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772843623;
	 x=1772850823; bh=xEjAv72VHfGiLkHrAlhjKdzunRhjRylRiDm2CPYMkMg=; b=
	VqUgf8l6NKdxxYY9MfmUdJ6PUlCpH+rPu8/beBLr/Gwt0Z6l4wBEp4UbQ3O4i6SO
	vNH6avfimdjBtmj8MZgHWqxpdFL23V+OR9V01hU1zNbJBpeQ3jrmdtTp4hvr4VES
	MngUCxDjVyD1yBmb+Gx+rdGCo8N4QER/gYccrawCpE6cT14715/eoK6b3guQYGSG
	d3WRsqNEP8kk/C9xA9o7pnDZYMfCtK0RGELWmjW5hJEqPRlELosN3UFyQ0myqd5h
	vce5wo7VkfQyJOn2oR3qgJZ5NOp9KHS2T5YfwM8e1pXiV9scE4Jwykkiwetfef9L
	vEQYXZ2Xnno3YrACM/OFHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772843623; x=
	1772850823; bh=xEjAv72VHfGiLkHrAlhjKdzunRhjRylRiDm2CPYMkMg=; b=P
	xN8a+CZjQJDaBAsvMh45NZDG8oXXJ5t+eYp6462ZKcQvMQxVt7mJ1o9rB5LFFi1w
	WIeKPGvaxZIRIljNS/ke32tR99S1OwAPidWf0D8EIR5DlHIoAGnmRBNaZIZtg3RM
	Wp/EJGE1/sT6CWeHga6zVLq4PCz5cW9C4F6f6Z5CVFFCy8YjH2gCUlGIhXQO6l6W
	Ol+c22YAFmNOL/jsypy+ZtYboCi77o+s2E2He81DVb6uYC9jwNEMbJupXD84nRg3
	Wh3H93/p8KtKYRTM+qKH/OVeYxOhTs3SVjVPWGA8h9XEBn5fb3YXJWEpBKnxC0ay
	WEx7p1Ip5+nLfmex9Zu+g==
X-ME-Sender: <xms:Z3KrabsTnRIICcU1GqYBlqJihm13e7WNtopgNQCvBc7zkoumePh0hQ>
    <xme:Z3KraXQ8jkJ77Tc6yCbKgxAgJrFBhtd0q00GFOO9hVWh635laSsPMLMO9pgT7Ybol
    NY1btsr6EHteqOswwFcPMfcJQAYk0RD9J0KXwIRGwDp_XSDdFfb5nwS>
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
X-ME-Proxy: <xmx:Z3KraQvN4Eb179clXP7UqJzfDZjEI80NGiUZd5XnMy1ZitCbQTVCbg>
    <xmx:Z3KraSUjZLi8UnWiNQic9-cNlBVpC6QVESJy4AYZwvSMvRqupyPUGQ>
    <xmx:Z3KraZVFfk7z8Hgw02swPJLg9KG2A8XU-DctV6O4z7QRGSlxN657jw>
    <xmx:Z3KraVRORkYizhpv5k2rnc2IM5zWfqe61Y-sXzU851cFM70ucwej0A>
    <xmx:Z3KraWIkZQIpFyBA-CzujkSeY_2cvNS1z9ofpqskQ82imAl8MFeoGi68>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 356C81EA006C; Fri,  6 Mar 2026 19:33:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Fri, 06 Mar 2026 18:33:25 -0600
Subject: [PATCH 06/18] wifi: mt76: mt7925: add MT7927 power management,
 DBDC, and CNM fixes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-mt7927-wifi-support-v1-6-c77e7445511d@jetm.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3842; i=floss@jetm.me;
 h=from:subject:message-id; bh=/GuNqbGp0WkGquAlj8TXYsYcaj5pBN2o2/Bv/wZ77ng=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpq3JPuEuIqFx6W1+smCHLJTcMJHCbobukBVeO4
 0RHZ8TnRL6JAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCaatyTwAKCRC17sMLqGd3
 H9K+DACnuG0c74GfHj4EmBIxAGgIJnHfMdAEgsHrir/61rydL2mcGJfkFp13Cu+03E68r9u+qBM
 O/ocHHyE9zMcos/irDOrvSMTbFlt5vTYRsb53VAjLn4mivaJBCtvghRZiA9n242BH/blNqfi4CQ
 zIKn7vrE3ThAOff/fDR5J/TqepkU1+K142oALZfY/0+spChfkzIX2kf1dR8o+S79qApzPqJZGuV
 X/0eBlPQweihFSZ/YIO9MUBcdD5H7hf9EzX3Bky5dnNyxOKyKGib00OFsLQdeidOILzgre8CKCs
 2WIbx06z5K0oxzfah2A8VjSBz4+axjhskQgCzp2tsNlo07A74JVL3YcnS9z6lpmv/onn4J2eMzn
 +VOXDzKV62NnuVE1H490fB5jWxrsF2ty31alL7Qr3n8Kix1cGeeUTGrBai4NdUO2v450F7ikR+i
 J+4f/nzykxSescfXkMkN4RwkqBe9I0b6XCJeFtCUBgYEBeL/Yz0pQ0Qo8MjuQp6b5RdV4=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
References: <20260306-mt7927-wifi-support-v1-0-c77e7445511d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_163344_292619_F99827EA 
X-CRM114-Status: GOOD (  12.64  )
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

Three MT7927-specific fixes for WiFi functionality:

1. Disable runtime PM: Every CLR_OWN triggers the ROM to reinitialize
   WFDMA, destroying DMA ring configuration. Disable PM until the wake
   path properly handles MT7927.

2. Enable DBDC (dual-band): MT7927 firmware defaults to single-band
   (2.4GHz only). MT7925 firmware handles DBDC automatically, but
   MT7927 requires an explicit MCU_UNI_CMD(SET_DBDC_PARMS) with
   mbmc_en=1. Without this, 5GHz scan requests are silently discarded.

3. Force CNM capability: MT7927 firmware lacks the connac2 feature
   trailer, causing mt792x_get_mac80211_ops() to replace channel
   context operations with emulated stubs. This prevents ROC (remain
   on channel) before authentication, causing auth frames to be
   silently dropped. Force the CNM flag and restore mt7925_ops.

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
 drivers/net/wireless/mediatek/mt76/mt7925/init.c | 17 ++++++++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c  | 10 ++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 3ce5d6fcc69d..1e9eadca3988 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -115,6 +115,18 @@ static int __mt7925_init_hardware(struct mt792x_dev *dev)
 	if (ret)
 		goto out;
 
+	/* MT7927: Enable DBDC (dual-band) mode. Without this, firmware
+	 * defaults to 2.4GHz only and ignores 5GHz scan requests.
+	 * MT7925 firmware handles DBDC automatically. */
+	if (is_mt7927(&dev->mt76)) {
+		ret = mt7925_mcu_set_dbdc(&dev->mphy, true);
+		if (ret) {
+			dev_warn(dev->mt76.dev,
+				 "MT7927 DBDC enable failed: %d\n", ret);
+			ret = 0;
+		}
+	}
+
 out:
 	return ret;
 }
@@ -230,7 +242,10 @@ int mt7925_register_device(struct mt792x_dev *dev)
 	dev->pm.idle_timeout = MT792x_PM_TIMEOUT;
 	dev->pm.stats.last_wake_event = jiffies;
 	dev->pm.stats.last_doze_event = jiffies;
-	if (!mt76_is_usb(&dev->mt76)) {
+	/* MT7927: disable power management. Every CLR_OWN triggers the
+	 * ROM to reinitialize WFDMA, destroying DMA ring configuration.
+	 * Keep the device awake until the PM wake path handles MT7927. */
+	if (!mt76_is_usb(&dev->mt76) && !is_mt7927(&dev->mt76)) {
 		dev->pm.enable_user = true;
 		dev->pm.enable = true;
 		dev->pm.ds_enable_user = true;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index ca9ccfe9975c..dce9f30b68d7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -527,6 +527,16 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 		goto err_free_pci_vec;
 	}
 
+	/* MT7927 firmware lacks the connac2 feature trailer, so
+	 * mt792x_get_mac80211_ops() can't detect CNM support and
+	 * replaces chanctx/ROC/mgd_prepare_tx ops with stubs.
+	 * Force CNM and restore the original mt7925 ops. */
+	if ((pdev->device == 0x6639 || pdev->device == 0x7927) &&
+	    !(features & MT792x_FW_CAP_CNM)) {
+		features |= MT792x_FW_CAP_CNM;
+		memcpy(ops, &mt7925_ops, sizeof(*ops));
+	}
+
 	mdev = mt76_alloc_device(&pdev->dev, sizeof(*dev), ops, &drv_ops);
 	if (!mdev) {
 		ret = -ENOMEM;

-- 
2.53.0


