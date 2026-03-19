Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BAF109192C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 22:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgdC5kt5k6hG8v7cip1AuvGjq20kUgYnV+A5Mrl16mo=; b=JOrIMkhvJcVJvtZDw/hpe8EGAu
	2Zks84eRv7dE27uNA/u+PuaP+mkF75yYPBW0HlRHAA/o0veP8lXwjrW1m9ZBUAI7uN5DmJlx5czG8
	3p7mAq46O4Y07FxcSoWOBki4xpADLSRO3YTDh8Ye/MIBmyxU0/gCbTC4Md7a8J2oyG0CmkqKq83ub
	yh5dOF3J9LGfddFszyNMnYFczuB+HtXtlHzrmK3xLadUB9yQ9/xf8ctC0OvB1tijMw0bR4MUxXwFu
	l6ktqWhnw3oZFq6yGC+HeDwUOmzMAYXdapu0IvAJlNkEEj5pW4P1aKpeY6rUJ3DTkXiQtrZfLkL1C
	RGopW3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LnJ-0000000Bdb4-3rgC;
	Thu, 19 Mar 2026 22:24:45 +0000
Received: from flow-b3-smtp.messagingengine.com ([202.12.124.138])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LnA-0000000BdQv-2EdW;
	Thu, 19 Mar 2026 22:24:37 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 6E4F413000AF;
	Thu, 19 Mar 2026 18:24:35 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 19 Mar 2026 18:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773959075;
	 x=1773966275; bh=RgdC5kt5k6hG8v7cip1AuvGjq20kUgYnV+A5Mrl16mo=; b=
	YCpsKInLl5s+SlMdN27VqGt2hLNF+V0ATVyPgZRy5H6rG8HskvlScNvhP0uZFA7h
	CyKhTvFxbV+iXtyYeHgWkeH87DmWY+xGnIwdnX/3x3jHZKh5vcYULysQXSHStGZz
	ecogBODzZMmulU5wr0UFkVatp1NZLcl/+MYdLJxw8cZSaK7vL0/JPypoY3sfX6Qk
	UyB5wVnochwv4WZ+dhCjMjx0nZZStDK5KyVENuj7PVnJ8MyH0PIwV2vlNyDQS3H0
	emi8WWWG8scbmGk0mMreYj7UhLz2qxA9dMYtmXJ/2SlV5SzwK8nbfaiNVMC1yWgO
	Wnydvc8THr4seax6zmAuVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773959075; x=
	1773966275; bh=RgdC5kt5k6hG8v7cip1AuvGjq20kUgYnV+A5Mrl16mo=; b=T
	vZgRamwNp5YKzbfzmLxMj1Sper0zY0HsuFFetXtIDBiqUtTR76AuBxgMP5dEo3rx
	dQjofqmZvaczH91JbmTP4do4aXGf9Vl5tuCj3QncffgTwrS3NN80dbA7V+zdiw2k
	8te2/B3u/denb+IuChavkJ1QutEhVbLFMMQ/XHe8b4nB1j2E64AW8cI1oWob2ft+
	sqxzqV1i1/svpl3EudobXsrJib6kRSGDnOD05Z5iTww3l+nt07G7e3+DKYq0TjBj
	7MNp78lBlpEchyDtlDdTt6hlYKLg3N3gF6RDdE/pFii191PfpN9pz0hYgCvQI6Vc
	74FgFxGbG6HGRORnqX+cA==
X-ME-Sender: <xms:o3e8aVEOSLxo51d82sJlhIiBmWjT83tZHC1TocsFcPptD5q-yIPoUw>
    <xme:o3e8aVKyxTOhAVo-vWlW_EhlXIQFbo37nYTA_F0RXSePf90mYQZazBsmzrMcj5EBz
    5_BPZ4M8VciT2r5EytpC2QqV3sDjbspXMjzmsc4mfeAm_yodNCYeGzm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdekvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjh
    gvthhmrdhmvgdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhonhhgrddtgidttdesghhmrghilhdrtghomhdprhgtphhtthhope
    grrhhivghlrdhrohhsvghnfhgvlhgurdejhedtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheptghhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehgih
    hoshgrlheltdesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghg
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehrrgguohhirdgthhhrihhssehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshgrmhhurdhtohhljhgrmhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:o3e8aVWy1PXZgeHkl9JSxXqJBFgrTlrpcwM4E2zmVRUXKUNiP1vu3Q>
    <xmx:o3e8aSyjXPYpyBiPWoiqyfyfOar3ZlLeyiZqgeYSxvqLhtbmYhG5QQ>
    <xmx:o3e8aV56UqyKuxvKYavm5VScsJQUKt8qf8H7QSwNGqEJ7vtLYuuamw>
    <xmx:o3e8aUiVf-EFqJ59v7xF0j0N1K2U6dCYQcsb6cgTDRrlNTL3y8cyWA>
    <xmx:o3e8aeVETuS3ACYcVbBaoHPQAlQORGvWL27zMkWjxFWHdcldcDbRG3l3>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 208151EA006B; Thu, 19 Mar 2026 18:24:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Thu, 19 Mar 2026 16:24:23 -0600
Subject: [PATCH v2 07/13] wifi: mt76: mt7925: add MT7927 firmware paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260319-mt7927-wifi-support-v2-v2-7-d627a7fad70d@jetm.me>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3298; i=floss@jetm.me;
 h=from:subject:message-id; bh=nWa4qRu3K/oLEzDqawtOQqtIO8UuGhdZfXRs4iLq41o=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpvHeRzBNtGW8RWeXjc+kyJAjGlVZpig0eZwJfG
 x5fAkt0ZbCJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCabx3kQAKCRC17sMLqGd3
 H6RYC/4rv0746kbaLnif7DmAPF0ovJ/qrbyEJWEIJ/XWmzJjyJ1MO0fcaT/Sj3WH/W25bP+5RB/
 k0Iz/iqhqj9h/HlktaGUWIGJto9YEb7L7RRH27z+A85Yfchl7XkArLIKaxOwQnk8CmkMTtL+PVG
 T2+XGtEel+x2FsESBBFw9pKdelzZ60fCe8zl8WkBtkUYHy/AdR0gMq9jbQXrHc28K0y+LDmXkwo
 wp5kY7oiqkEpOkVCEL5+zJBupFwhxXgdbMSGKvK83NJcztVpKyZsC1SP5GDV9B93rWbTOPndE4l
 sCIypqDJ+TtP35FSEyJeAogES2x02Ncf7ijLkcQYDlz5vFybVdmXPiMIAzz59ePtmLXdl2/HLMS
 I3Sv3njuExPECLbGkn3/EcyieU8RZfZQHZbOmH6MvsTtRRq1b5xI5wY/h077ko/coaly8M8piQf
 N36NMsZF9micsKCwUbvfoD/3IKyKR/Wb+DYtmgkdkIlivI3dOErc5mqbwiwLO9+AaLsUo=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me>
References: <20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_152436_610484_53704A72 
X-CRM114-Status: UNSURE (   9.39  )
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


