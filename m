Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D166E109E522
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 22:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmXZ9AWojJY1aMvgCUXzZGGkyVWJ2/d5Ccx43mIJnaI=; b=Mk7tP1hMFBobKSmHG2cnmA5RuE
	oG6PquM4MrmcggvfL6G2+/YUMuxW8oyy8ycSqk/AQR2f3h6o3XsLyL1Xy6YjMrdedfmelB0vI+nmS
	zMVSMXRr9dpnk3rBSifjNPomOu2wlXQ3TR6nWAVlQptOplEOdo5FjuHJv2GEDZPK9WhWdOgvIeNx6
	Kct3yO2xjU0EUB6VkKJE1OE8Qkxukzh9qLDPPcHEI0+KIQ/Y3j4jWc/SISa2IIxdW0Bf0blDgeo+0
	XynvkHJyTSTZFt2frj14dsxl5rn2UfHFrwcesmysGXVAQgM3izxL/8IB3Q696ati4hP0ZjUDc2ice
	ndv9D7PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WS8-00000004Kd0-2pZv;
	Wed, 25 Mar 2026 22:11:52 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5WRX-00000004K2i-17NX;
	Wed, 25 Mar 2026 22:11:16 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 29D491300539;
	Wed, 25 Mar 2026 18:11:14 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Wed, 25 Mar 2026 18:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774476674;
	 x=1774483874; bh=FmXZ9AWojJY1aMvgCUXzZGGkyVWJ2/d5Ccx43mIJnaI=; b=
	DyjAdIgrwduIDCfKcbgBjBhu+gBQOJH+nGEAk7LXhcnv8wNDs+0kII87RRFzu8YZ
	HhV9KdXy0k29JvUw6G/9vcf2T/xk2PbiRQ0/ZMZMO2Ui5JKRJBBeuhiDoa8+ZHty
	n6MnV5hGHjeQtyNbvew73XMIjR4g/oDAfC+2QtsxHRlwCeywUywJmRt1n9J6Idwg
	BK8n1vjaX+isdVZ5M82P8XcoTaAkPohJfWagsUmDisemUS96KVMm8fjyhGQeSaMA
	dQ9rk/iJ9W+4lNOKn9QbaSWhyR7wcvSq+iwsCQDCGA6enWMtcVnjNZY4hxEIwf3v
	NUvnZt0+hBgucpGzP9z76A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774476674; x=
	1774483874; bh=FmXZ9AWojJY1aMvgCUXzZGGkyVWJ2/d5Ccx43mIJnaI=; b=m
	zJmQjb4Xm2oLheQ6iAyVluxYnUdgG3av19wVw9bFnn6lXrrWiFTqQazF9WwaoGwP
	hGDZ0tjq+RiRd+X5uycFcOGH7EL5F/EA72Gp0czkuoxHrgjRF0PF51sW90Jz+q94
	uD29AZYHZJhUGcW6rbLzqnXPuu24HQDC0ZGyK3V/9I93p/EHHoiuyU25XwD2A8yL
	WDCSlcs8IOywwEEAVT6jfMxOFkxh4AL2UiBMiFcHjC5jGELpSRQJNBXhe50Dug35
	QVCuMJykVgBaQ5AnudwytP/FpZs5kqcSvbyXNaV+pwyqqIC1I1CXc3k21XXnvyXx
	oExQeDSC0HTsj10sLS1CA==
X-ME-Sender: <xms:gV3EaVCqhfAFoeVxqS_GnUdtsagLojOK3iNG9TRCOJECqeSoUPk5xQ>
    <xme:gV3EaeU3PL2Xo3wOcGL97AuHmikjSHANNNIEti7vakglyheCxTWTKKNZCP8mn_0dh
    9pI6OWsrtJDYp03LpUejCUp4lWlak7JA_wIFGy5c3dCVDKBygYy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdehiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepue
    dttdfggfdufeeiueetffegveefffevjeehvdelfeevhffhteekgfegveeuiefhnecuffho
    mhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedunecurfgrrh
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
X-ME-Proxy: <xmx:gV3EaTwedJscLU82FNKxjuT7hEn0bZqVJspSqyzp4gIHnx8YBB2c2A>
    <xmx:gV3EaYceI4E07cCZaoqj83pk0AZyWNuULMuE6-4B2meoBDlWeQeXTg>
    <xmx:gV3EaR3CjLeJ9cQp3Ujpy4cW9a0Y68meOPhx3YgX_yx0K-dtts_UTg>
    <xmx:gV3EaZu72ctqSDCeq0hRu1V2uQRH8XmbQXLJggoY7h5I3AkRlg2D9w>
    <xmx:gl3EaRR7LZpqAu6Shi2pkV4O34i0kO_L9rtjEovJYdJaRWKNPQHfOZZL>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CB5F81EA006B; Wed, 25 Mar 2026 18:11:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Wed, 25 Mar 2026 16:10:59 -0600
Subject: [PATCH v3 10/13] wifi: mt76: mt7925: add MT7927 hardware
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-mt7927-wifi-support-v2-v3-10-5ca66c97a755@jetm.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10527; i=floss@jetm.me;
 h=from:subject:message-id; bh=/gjiel5869rYGCVjZwRZFG03XJXO8FEsTHwufAYf8os=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxF1qs9yQw3NVJCVv4lBbWGRQdIDwUKV7vUTGw
 /C3wVhBJY2JAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacRdagAKCRC17sMLqGd3
 H2D/DACJYfuxgVuo9H7W5iQHmSE3gG7mYQHgQp+b1VK+YWRip2plPxSYF6sWAI1ITggFjRu24AD
 WkD8w/moDvzAZIRGCf027Oxkr7QXAsBac+KyBtOZ5pLwRPBThD44Ykutty5/6vaCnZu1d836CvQ
 BiOOMBoiuELN2IkJKgEk6Z+ZlKtq7rESIG341vgbAVZWOo8DwS6SVUUAeGFiG/MHiGSRLDK4YTl
 KwF4Biemfng4EHo7nZMbtkRwcAMOI6Sj/nv4Px/SZ2lOWwyZoAK/+nh26fMrt+clNgn5kftQq4/
 pbYlIXk+1rNJkd1goFVSv67eqoP0411cRzCSIXrfe2qHplmsail0aaCD4G3oz7GeS2MvUayG51K
 5Z/yisPuRkfDjO5VLhJbSOLKOmCpi+rbhcC1eR6iqEje9xy8ezIwTjj9SJ9MpOGwgTxQ8Gnc3AZ
 qlpatMiFNUKcqtYKii896W6pa3EdrKLq1GRAVnyUwGFHnNI1UyRLffKcoQhL2tTA2/RVQ=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me>
References: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_151115_395009_F02EFC95 
X-CRM114-Status: GOOD (  22.64  )
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

Add MT7927-specific hardware initialization for the Filogic 380 combo
chip, which has an additional CBInfra (ConnectaBus Infrastructure) bus
fabric between PCIe and the WiFi subsystem.

CBTOP remap: configure PCIe address mapping so MMIO reads to WiFi
registers return valid data instead of zero.

Chip initialization sequence:
  1. WF subsystem reset via CBInfra RGU
  2. MCU ownership acquisition
  3. Poll ROMCODE_INDEX for MCU idle (0x1D1E)
  4. MCIF remap for host DMA
  5. PCIe sleep disable

Probe flow changes for MT7927:
  - Skip early CLR_OWN (CBTOP not yet configured)
  - Force chip ID if CHIPID register returns stale value
  - Replace wfsys_reset with mt7927_chip_init

CLR_OWN skip in mt7925e_mcu_init(): every CLR_OWN triggers the ROM to
reinitialize WFDMA, destroying ring configuration set up by DMA init.
The controlled SET_OWN/CLR_OWN is already handled in the DMA pre-ring
setup hook.

DBDC enable: MT7927 firmware defaults to single-band (2.4GHz only).
Send explicit SET_DBDC_PARMS to enable dual-band operation.

CNM force: MT7927 firmware lacks the connac2 feature trailer, causing
channel context ops to be replaced with stubs. Force the CNM flag at
probe to preserve ROC support needed for authentication.

mac_reset guard: return -EOPNOTSUPP for MT7927 since the reset path
performs CLR_OWN and logic reset that destroy DMA configuration. Full
reset recovery is follow-up work.

Register values derived from Loong0x00's reverse-engineered MT7927
driver.

Reported-by: 张旭涵 <Loong.0x00@gmail.com>
Closes: https://github.com/openwrt/mt76/issues/927
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
 drivers/net/wireless/mediatek/mt76/mt7925/init.c   |  13 +++
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c    | 103 +++++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7925/pci_mac.c    |   9 ++
 .../net/wireless/mediatek/mt76/mt7925/pci_mcu.c    |  20 ++--
 drivers/net/wireless/mediatek/mt76/mt792x_regs.h   |  18 ++++
 5 files changed, 149 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 3ce5d6fcc69d..c4c99380f5b5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -115,6 +115,19 @@ static int __mt7925_init_hardware(struct mt792x_dev *dev)
 	if (ret)
 		goto out;
 
+	/* MT7927: Enable DBDC (dual-band) mode. Without this, firmware
+	 * defaults to 2.4GHz only and ignores 5GHz scan requests.
+	 * MT7925 firmware handles DBDC automatically.
+	 */
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
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 415194a440f8..393d9f408b84 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -400,6 +400,64 @@ static const struct mt792x_irq_map mt7927_irq_map = {
 		.wm2_complete_mask = MT7927_RX_DONE_INT_ENA7,
 	},
 };
+
+static int mt7927_chip_init(struct mt792x_dev *dev)
+{
+	struct mt76_dev *mdev = &dev->mt76;
+	u32 val;
+
+	/* EMI sleep protect */
+	mt76_rmw_field(dev, MT_HW_EMI_CTL, MT_HW_EMI_CTL_SLPPROT_EN, 1);
+
+	/* WF subsystem reset via CBInfra RGU */
+	mt76_set(dev, MT7927_CBINFRA_RGU_WF_RST,
+		 MT7927_CBINFRA_RGU_WF_RST_WF_SUBSYS);
+	msleep(1);
+	mt76_clear(dev, MT7927_CBINFRA_RGU_WF_RST,
+		   MT7927_CBINFRA_RGU_WF_RST_WF_SUBSYS);
+	msleep(5);
+
+	/* MCU ownership */
+	mt76_wr(dev, MT7927_CBINFRA_MCU_OWN_SET, BIT(0));
+
+	/* Poll ROMCODE_INDEX for MCU idle */
+	if (!__mt76_poll_msec(mdev, MT7927_ROMCODE_INDEX,
+			      0xffff, MT7927_MCU_IDLE_VALUE, 2000)) {
+		val = mt76_rr(dev, MT7927_ROMCODE_INDEX);
+		dev_err(mdev->dev,
+			"MT7927 MCU idle timeout (ROMCODE_INDEX=0x%04x)\n",
+			val & 0xffff);
+		return -ETIMEDOUT;
+	}
+
+	/* MCIF remap - MCU needs this to DMA to host memory */
+	mt76_wr(dev, MT7927_MCIF_REMAP_WF_1_BA,
+		MT7927_MCIF_REMAP_WF_1_BA_VAL);
+
+	/* Disable PCIe sleep */
+	mt76_wr(dev, MT7927_CBINFRA_SLP_CTRL, 0xffffffff);
+
+	/* Clear CONNINFRA wakeup */
+	mt76_wr(dev, MT7927_CBINFRA_WAKEPU_TOP, 0x0);
+
+	return 0;
+}
+
+static void mt7927_cbtop_remap(struct mt792x_dev *dev)
+{
+	/* CONNINFRA wakeup - required before CBInfra register access */
+	mt76_wr(dev, MT7927_CBINFRA_WAKEPU_TOP, 0x1);
+	usleep_range(1000, 2000);
+
+	/* Configure CBTOP PCIe address remap for WF and BT */
+	mt76_wr(dev, MT7927_CBINFRA_MISC0_REMAP_WF,
+		MT7927_CBINFRA_REMAP_WF_VAL);
+	mt76_wr(dev, MT7927_CBINFRA_MISC0_REMAP_BT,
+		MT7927_CBINFRA_REMAP_BT_VAL);
+
+	/* Readback to push writes */
+	mt76_rr(dev, MT7927_CBINFRA_MISC0_REMAP_WF);
+}
 static int mt7925_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *id)
 {
@@ -482,6 +540,17 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 		goto err_free_pci_vec;
 	}
 
+	/* MT7927 firmware lacks the connac2 feature trailer, so
+	 * mt792x_get_mac80211_ops() can't detect CNM support and
+	 * replaces chanctx/ROC/mgd_prepare_tx ops with stubs.
+	 * Force CNM and restore the original mt7925 ops.
+	 */
+	if ((pdev->device == 0x6639 || pdev->device == 0x7927) &&
+	    !(features & MT792x_FW_CAP_CNM)) {
+		features |= MT792x_FW_CAP_CNM;
+		memcpy(ops, &mt7925_ops, sizeof(*ops));
+	}
+
 	mdev = mt76_alloc_device(&pdev->dev, sizeof(*dev), ops, &drv_ops);
 	if (!mdev) {
 		ret = -ENOMEM;
@@ -517,25 +586,43 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 
 	if (!mt7925_disable_aspm && mt76_pci_aspm_supported(pdev))
 		dev->aspm_supported = true;
-
 	ret = __mt792x_mcu_fw_pmctrl(dev);
 	if (ret)
 		goto err_free_dev;
 
-	ret = __mt792xe_mcu_drv_pmctrl(dev);
-	if (ret)
-		goto err_free_dev;
+	if (!is_mt7927_hw) {
+		ret = __mt792xe_mcu_drv_pmctrl(dev);
+		if (ret)
+			goto err_free_dev;
+	}
+
+	if (is_mt7927_hw)
+		mt7927_cbtop_remap(dev);
 
 	mdev->rev = (mt76_rr(dev, MT_HW_CHIPID) << 16) |
 		    (mt76_rr(dev, MT_HW_REV) & 0xff);
 
 	dev_info(mdev->dev, "ASIC revision: %04x\n", mdev->rev);
 
-	mt76_rmw_field(dev, MT_HW_EMI_CTL, MT_HW_EMI_CTL_SLPPROT_EN, 1);
+	/* Force chip ID for MT7927 hardware if CHIPID read returns garbage */
+	if (is_mt7927_hw && (mdev->rev >> 16) != 0x7927) {
+		dev_info(mdev->dev,
+			 "MT7927 raw CHIPID=0x%04x, forcing chip=0x7927\n",
+			 (u16)(mdev->rev >> 16));
+		mdev->rev = (0x7927 << 16) | (mdev->rev & 0xff);
+	}
 
-	ret = mt792x_wfsys_reset(dev);
-	if (ret)
-		goto err_free_dev;
+	if (is_mt7927_hw) {
+		ret = mt7927_chip_init(dev);
+		if (ret)
+			goto err_free_dev;
+	} else {
+		mt76_rmw_field(dev, MT_HW_EMI_CTL,
+			       MT_HW_EMI_CTL_SLPPROT_EN, 1);
+		ret = mt792x_wfsys_reset(dev);
+		if (ret)
+			goto err_free_dev;
+	}
 
 	mt76_wr(dev, irq_map.host_irq_enable, 0);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index 1626a3684082..9b3eeb1328f6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -72,6 +72,15 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
 	const struct mt792x_irq_map *irq_map = dev->irq_map;
 	int i, err;
 
+	/* MT7927: CLR_OWN and WPDMA reset destroy DMA ring configuration.
+	 * A full reset requires re-running mt7927_dma_init() which is not
+	 * yet implemented in the recovery path.
+	 */
+	if (is_mt7927(&dev->mt76)) {
+		dev_warn(dev->mt76.dev, "MT7927 mac_reset not supported, reload module to recover\n");
+		return -EOPNOTSUPP;
+	}
+
 	mt792xe_mcu_drv_pmctrl(dev);
 
 	mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c
index 6cceff88c656..1f50d1ef6fb6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mcu.c
@@ -35,13 +35,21 @@ int mt7925e_mcu_init(struct mt792x_dev *dev)
 
 	dev->mt76.mcu_ops = &mt7925_mcu_ops;
 
-	err = mt792xe_mcu_fw_pmctrl(dev);
-	if (err)
-		return err;
+	if (is_mt7927(&dev->mt76)) {
+		/* MT7927: CLR_OWN was already done in mt7927_dma_init().
+		 * The ROM re-initializes WFDMA on every CLR_OWN, wiping
+		 * ring and prefetch config. Skip SET_OWN/CLR_OWN here
+		 * to preserve DMA state.
+		 */
+	} else {
+		err = mt792xe_mcu_fw_pmctrl(dev);
+		if (err)
+			return err;
 
-	err = __mt792xe_mcu_drv_pmctrl(dev);
-	if (err)
-		return err;
+		err = __mt792xe_mcu_drv_pmctrl(dev);
+		if (err)
+			return err;
+	}
 
 	mt76_rmw_field(dev, MT_PCIE_MAC_PM, MT_PCIE_MAC_PM_L0S_DIS, 1);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
index 1b9b51d43f79..9c4bbbe898f3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
@@ -499,4 +499,22 @@
 #define WFSYS_SW_RST_B			BIT(0)
 #define WFSYS_SW_INIT_DONE		BIT(4)
 
+/* CBInfra registers - MT7927 combo chip */
+#define MT7927_CBINFRA_WAKEPU_TOP		0xe01a0
+#define MT7927_CBINFRA_MISC0_REMAP_WF		0x1f6554
+#define MT7927_CBINFRA_MISC0_REMAP_BT		0x1f6558
+#define MT7927_CBINFRA_RGU_WF_RST		0x1f8600
+#define MT7927_CBINFRA_RGU_WF_RST_WF_SUBSYS	BIT(4)
+#define MT7927_CBINFRA_MCU_OWN_SET		0x1f5034
+#define MT7927_CBINFRA_SLP_CTRL			0x1f5018
+#define MT7927_ROMCODE_INDEX			0xc1604
+#define MT7927_MCU_IDLE_VALUE			0x1d1e
+#define MT7927_MCIF_REMAP_WF_1_BA		0xd1034
+
+/* CBInfra CBTOP remap values */
+#define MT7927_CBINFRA_REMAP_WF_VAL		0x74037001
+#define MT7927_CBINFRA_REMAP_BT_VAL		0x70007000
+
+#define MT7927_MCIF_REMAP_WF_1_BA_VAL		0x18051803
+
 #endif /* __MT792X_REGS_H */

-- 
2.53.0


