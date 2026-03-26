Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89E010AB82A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 21:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgdC5kt5k6hG8v7cip1AuvGjq20kUgYnV+A5Mrl16mo=; b=Z0LAt4k+NfROxapHa+0I7Xkrqt
	0nyMcaPZG7Jh28mE2qPkkLZZ8sbJJE82Uqpruts9DTAdN5yuwN2jt/JgCtT5O77rNWB1Uc4pPWjc2
	+jLaP3C58LI2gFKZEqF/sI07f1iF+gtQlBo91Ds6B2FRUzUYAau+1epzdBo2ygNAyYR7g5A+DnvuN
	GPECrbdK1ukdCzG4GPO0k4i0VImRjM0GuyRT2tYTFdF7P45ydYSZcuYOY61as7Sxf7pVf/xp7kbRU
	C4RX6BsNDUoSdXU/pO4QhxtdAm2f4hlb8Ro5vTWseo8CeF8e1vNFFACRkkzPGhhxqq8mHx98i+4PV
	UUFjnpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5s1D-00000006DYj-0JEO;
	Thu, 26 Mar 2026 21:13:31 +0000
Received: from flow-a1-smtp.messagingengine.com ([103.168.172.136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5s0P-00000006DAV-1BBA;
	Thu, 26 Mar 2026 21:12:42 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 6DC181380154;
	Thu, 26 Mar 2026 17:12:40 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 26 Mar 2026 17:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774559560;
	 x=1774566760; bh=RgdC5kt5k6hG8v7cip1AuvGjq20kUgYnV+A5Mrl16mo=; b=
	nHtzQb+ooL6CWejvDDqx+gMjZ7gaZIARUwpZX0b5zJDfPUnk8DhGCnhg3nYGjTbT
	GtytB/lJaadoKFMvi/SmTsK1WDDHUvI0FA/JwH2kYLG/Laj5m1Rz+pm3X1oWD+1g
	KEYgOuS+w7s009kD9X5Yhm9rs/SvO9YudDO+yRd+eQpbzS3SQiw+HQgvLjc4q0fW
	aDnuGv2mmD6xTH+2pSje98gwT53INzlVrMqYlLKoGuJK8/nZ9YgVwZp9FdnJTc8E
	IGUIV5hokug0z2hT2Pj91XGiZmAk4nfCvqe7HXFZ7NMjy5sDW/co9pF9LeiV8NGt
	5kV4Ym6xAW2txysrflMeQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774559560; x=
	1774566760; bh=RgdC5kt5k6hG8v7cip1AuvGjq20kUgYnV+A5Mrl16mo=; b=j
	YR2QCkVO3zUSylGhmtgtgZ6LouyXz5oNuejKqROiKPZHjiHyso5TUX3B09t6viYO
	D78XqhOShsvgASMwytj2vHPUDJ0ANZQsKCxzWoVBPhX/9WINcSht5nHrQWC0evnT
	IPLNGBhXGkefyGmLieYXIjplawxEkmt7CgJRrhRf8hjC3k8eF/hRMww6iqRH9vx4
	+phIDKXjZt7utwucnGWnuODVrbHPBIiOcLAG4EZzfz3Xytt1sUat039mbPAg6OE7
	tVG0sShIBl2OWlgY21VxmZaESEta8s8GfvEhOdrT6B04fwaOOUQZBHp+CBGGwdHx
	Uo2EpOiRwiPl3qtLVZ4/g==
X-ME-Sender: <xms:SKHFaaH0ifUPcWRPOh5Dy0b5QZ36KQfWH08PWpge9BPfkIRqFctAUg>
    <xme:SKHFaWKigHvuVZDH0DS9OBgfe0p3xrixSXkwxNeaxpteg-BDboaqIwarw-BN89uB3
    yp2Ss3M6jjkhpEgt7y5ygdhqUYO_B-EzEYeuT38_Svtmi0kgiHZNill>
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
X-ME-Proxy: <xmx:SKHFaSUwpWvr3Bu4zA_YTcVwVDIu8pMwc34qZKJx1p0YZ1d2Bu1uRA>
    <xmx:SKHFabwU68w8jlrSmVBkOX8ObPKrZAYOr74ppD4w_6w7osmU8AUMGQ>
    <xmx:SKHFaa40wJEtop3CNAqSz0yIJN3ImWYnhhU-35emn3Cmf7h-m3GU0A>
    <xmx:SKHFaVjJW0jAzTmrUCTAf-Y4_Wk-Of9HTb3SdZg1x1u62scq0MWXyQ>
    <xmx:SKHFaTXcNB1KkuTHDKypgqFV5FXrk44J8le3IaZ6fbpN5qbR3WXhZHg5>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 44B311EA006B; Thu, 26 Mar 2026 17:12:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Thu, 26 Mar 2026 15:12:31 -0600
Subject: [PATCH v4 7/9] wifi: mt76: mt7925: add MT7927 firmware paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260326-mt7927-wifi-support-v4-v4-7-8ab465addcfe@jetm.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3298; i=floss@jetm.me;
 h=from:subject:message-id; bh=nWa4qRu3K/oLEzDqawtOQqtIO8UuGhdZfXRs4iLq41o=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxaE4Z4QGjHWFpDUbkgYQcX+KCxtMF0VbBGt7Q
 OBpnDkyhduJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacWhOAAKCRC17sMLqGd3
 H7r2C/97PZa1x2s1vJCzuJAqPYMEQADPRD5bdDsISGBDBaDCngYb6quYte2x1TSRqtUNpFn9M98
 J3zE3/9vUXy7pwJ/QsNN4++VanUrKHnBqs04YjHJmAhauwRTKIN38XhzUoVtZQ/0RH2b6xZyOxk
 A1VYj8kyFjzLeZbb5JrkNUzFtLVx4hbY7xZkBDpkmo9VsJm5v06cXMyEtn0xuqKHx8PeQV1Y8bV
 buniosAx9JyB811CVCuBvD6Piiz1C0Qb7oy7m+nBC3Mg7jqQP3M9Bj6bN87fb8epOUuJ6fm+QDg
 bNpyt8vSoEapBdwvJb86MZ5Zy01O1VNDGbHzlho3FDh4kJOWdH9jKrs4QGXxkJHQqa4uFCjAZqQ
 qfKsZVXZYPAgnNhnBbuNHrRa2QLIEixWu/3LB+98svERyqJLW4Bq1qn2Uif1f/LKUz65m5Sljlu
 SIqMkvhL2xW7rQJ+tokSb7NyP/Drp4X3eSN8j/y+SQ4ydKm4l1Nt5rIHnnE2OsHUvC9qw=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260326-mt7927-wifi-support-v4-v4-0-8ab465addcfe@jetm.me>
References: <20260326-mt7927-wifi-support-v4-v4-0-8ab465addcfe@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_141241_380326_3B87AE18 
X-CRM114-Status: UNSURE (   9.04  )
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

Add firmware path definitions for MT7927 WiFi firmware (WIFI_RAM_CODE
and PATCH_MCU) and the corresponding MODULE_FIRMWARE declarations. Add
MT7927 cases to mt792x_ram_name() and mt792x_patch_name() so the driver
loads the correct firmware for the 0x7927 chip ID.

PCI device table entries are deferred to a later patch to allow
infrastructure setup before device enablement.

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
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 2 ++
 drivers/net/wireless/mediatek/mt76/mt792x.h     | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index c4161754c01d..f820d5aeb723 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -633,6 +633,8 @@ module_pci_driver(mt7925_pci_driver);
 MODULE_DEVICE_TABLE(pci, mt7925_pci_device_table);
 MODULE_FIRMWARE(MT7925_FIRMWARE_WM);
 MODULE_FIRMWARE(MT7925_ROM_PATCH);
+MODULE_FIRMWARE(MT7927_FIRMWARE_WM);
+MODULE_FIRMWARE(MT7927_ROM_PATCH);
 MODULE_AUTHOR("Deren Wu <deren.wu@mediatek.com>");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_DESCRIPTION("MediaTek MT7925E (PCIe) wireless driver");
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 8388638ed550..38790ef83e51 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -45,11 +45,13 @@
 #define MT7921_FIRMWARE_WM	"mediatek/WIFI_RAM_CODE_MT7961_1.bin"
 #define MT7922_FIRMWARE_WM	"mediatek/WIFI_RAM_CODE_MT7922_1.bin"
 #define MT7925_FIRMWARE_WM	"mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin"
+#define MT7927_FIRMWARE_WM	"mediatek/mt7927/WIFI_RAM_CODE_MT6639_2_1.bin"
 
 #define MT7920_ROM_PATCH	"mediatek/WIFI_MT7961_patch_mcu_1a_2_hdr.bin"
 #define MT7921_ROM_PATCH	"mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin"
 #define MT7922_ROM_PATCH	"mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin"
 #define MT7925_ROM_PATCH	"mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin"
+#define MT7927_ROM_PATCH	"mediatek/mt7927/WIFI_MT6639_PATCH_MCU_2_1_hdr.bin"
 
 #define MT792x_SDIO_HDR_TX_BYTES	GENMASK(15, 0)
 #define MT792x_SDIO_HDR_PKT_TYPE	GENMASK(17, 16)
@@ -454,6 +456,8 @@ static inline char *mt792x_ram_name(struct mt792x_dev *dev)
 		return MT7922_FIRMWARE_WM;
 	case 0x7925:
 		return MT7925_FIRMWARE_WM;
+	case 0x7927:
+		return MT7927_FIRMWARE_WM;
 	default:
 		return MT7921_FIRMWARE_WM;
 	}
@@ -468,6 +472,8 @@ static inline char *mt792x_patch_name(struct mt792x_dev *dev)
 		return MT7922_ROM_PATCH;
 	case 0x7925:
 		return MT7925_ROM_PATCH;
+	case 0x7927:
+		return MT7927_ROM_PATCH;
 	default:
 		return MT7921_ROM_PATCH;
 	}

-- 
2.53.0


