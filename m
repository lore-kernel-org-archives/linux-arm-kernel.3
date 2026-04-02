Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FAAD3942C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QxNJ4Qn0m51y6tu8fH++pdqnAyQxy0JIYUU81rpg0b8=; b=YZksbNhmr8egSt3nhbS0fZ1Cz7
	zE1CTyGPFmWTOU8281fSYpVSJJf1CVjmBdaopWedEOG3L4FJj2Bj5g5nxistupL3r9gXEQXRMUqzy
	MolIOOe143BKgYQZt6GVsww5VuE4YreBCiiFmtgIWB0pg9UJEl53ITZHROul63dpmelhjZa4eyk1G
	kpjEfJiSearNsaU8CC9R/PSo8USwsCHec0tkQe0iewpdAnGMstP5eESuHb6rpexdGv6SBVuRMWXhj
	ooguM/VaRFx2wyRN1yZdXvwW3olJ6iLcOPBj8Fv+Li9T7kzSHN0YeVgagxPQfU3IHKV/Jt0d/Baro
	uZUDHNSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ilc-00000000Fwh-10MZ;
	Thu, 02 Apr 2026 14:11:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ila-00000000FwQ-3TGc;
	Thu, 02 Apr 2026 14:11:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CE1160008;
	Thu,  2 Apr 2026 14:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F12C116C6;
	Thu,  2 Apr 2026 14:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775139085;
	bh=+6ca/Obmn4va08+h17L1/nNzv5x2583fM9j2PQdNcdI=;
	h=From:To:Cc:Subject:Date:From;
	b=nL7/F0qQVtHVQ5aSo/IlwVnjKBud5//OsJER78W5GUNtxUyrEMG3wa3DXrM2ngv+G
	 Y5ogpABSGhDHj3vvctyVf2JBUEk1bZiedX0VFsTkbQNgAKC2TSybaK9UUxc9hmalX0
	 +vE2Y9VwoU2CVhgt8xHaICwNbaYhKzMD8039r3c75iwm+PcM+981rkBHb9lZjqtn6+
	 M9Uff64uESOrSszNRM32HZP1lgVVzvAzYXfwRN4JFzutdsewPembNz6PAcrwarnnAz
	 W/GTYU8N9/HfARegpokJ0iPA0plitzQ4WwBgVXsMXF9kc9m0MySjd6Usvk9miklIED
	 FkGvCZqzJZPzg==
From: Arnd Bergmann <arnd@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Javier Tia <floss@jetm.me>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Chris Lu <chris.lu@mediatek.com>,
	Kees Cook <kees@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Jiande Lu <jiande.lu@mediatek.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Bluetooth: btmtk: hide unused  btmtk_mt6639_devs[] array
Date: Thu,  2 Apr 2026 16:11:15 +0200
Message-Id: <20260402141119.2732591-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

When USB support is disabled, the array is not referenced anywhere,
causing a warning:

drivers/bluetooth/btmtk.c:35:3: error: 'btmtk_mt6639_devs' defined but not used [-Werror=unused-const-variable=]
   35 | } btmtk_mt6639_devs[] = {
      |   ^~~~~~~~~~~~~~~~~

Move it into the #ifdef block.

Fixes: 4cdd001ff03f ("Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/bluetooth/btmtk.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 099188bf772e..6fb6ca274808 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -25,22 +25,6 @@
 /* It is for mt79xx iso data transmission setting */
 #define MTK_ISO_THRESHOLD	264
 
-/* Known MT6639 (MT7927) Bluetooth USB devices.
- * Used to scope the zero-CHIPID workaround to real MT6639 hardware,
- * since some boards return 0x0000 from the MMIO chip ID register.
- */
-static const struct {
-	u16 vendor;
-	u16 product;
-} btmtk_mt6639_devs[] = {
-	{ 0x0489, 0xe13a },	/* ASUS ROG Crosshair X870E Hero */
-	{ 0x0489, 0xe0fa },	/* Lenovo Legion Pro 7 16ARX9 */
-	{ 0x0489, 0xe10f },	/* Gigabyte Z790 AORUS MASTER X */
-	{ 0x0489, 0xe110 },	/* MSI X870E Ace Max */
-	{ 0x0489, 0xe116 },	/* TP-Link Archer TBE550E */
-	{ 0x13d3, 0x3588 },	/* ASUS ROG STRIX X870E-E */
-};
-
 struct btmtk_patch_header {
 	u8 datetime[16];
 	u8 platform[4];
@@ -483,6 +467,22 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
 EXPORT_SYMBOL_GPL(btmtk_process_coredump);
 
 #if IS_ENABLED(CONFIG_BT_HCIBTUSB_MTK)
+/* Known MT6639 (MT7927) Bluetooth USB devices.
+ * Used to scope the zero-CHIPID workaround to real MT6639 hardware,
+ * since some boards return 0x0000 from the MMIO chip ID register.
+ */
+static const struct {
+	u16 vendor;
+	u16 product;
+} btmtk_mt6639_devs[] = {
+	{ 0x0489, 0xe13a },	/* ASUS ROG Crosshair X870E Hero */
+	{ 0x0489, 0xe0fa },	/* Lenovo Legion Pro 7 16ARX9 */
+	{ 0x0489, 0xe10f },	/* Gigabyte Z790 AORUS MASTER X */
+	{ 0x0489, 0xe110 },	/* MSI X870E Ace Max */
+	{ 0x0489, 0xe116 },	/* TP-Link Archer TBE550E */
+	{ 0x13d3, 0x3588 },	/* ASUS ROG STRIX X870E-E */
+};
+
 static void btmtk_usb_wmt_recv(struct urb *urb)
 {
 	struct hci_dev *hdev = urb->context;
-- 
2.39.5


