Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC22C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PvwGmo7/Njo2yNt/pF/MC/w+psXZgyvgwLxIt3GSmoQ=; b=W2Stpl+O4yWVUmZR7wbpPAd/X4
	bLCMTKiAGO7GO6t/lHlN2MJUZj/Wqaa4tGPVXTDU3GsdF+tf74v2uTcKlA4b+jG6KncCMraMdS4ap
	n8FmxsPhH8HEwie06K7zVVjYXdkO87xehcEKkpCLvrtCB6wvvUYlCFLa5rb82Lri3Sw12EnUwEymm
	UwfpOeBm7/TIbwVGKsjmf3n7t9QkBnn7yDhby4CY8xqQbMXM452gco76UMa8x/1yz74jgTqjN5m3z
	VP0NuNh8GbX8Z+48fF6ED+St+ESC9AwOBxpE7BFz5t0hR9Qc1g7xmYPJ01sHfgHNQ4ew06TOhZYR3
	iukzR3OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3c2-00000004BOn-2uc4;
	Fri, 10 Jul 2026 05:17:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3c1-00000004BOU-1QzO;
	Fri, 10 Jul 2026 05:17:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA411600C3;
	Fri, 10 Jul 2026 05:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1717C2BCB8;
	Fri, 10 Jul 2026 05:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783660639;
	bh=v8h8OTDsfts+f8xQcfwy8E0kUDGKuTg/aSKZicK6s+c=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=X3QWO8xSaSIynshnunmMhWmjYM7riIuCR7wTpFcddWi3GeoSaiZ2gBk8WTHmyw/hV
	 EnsLZvuPSailE8iOboYfSFdIL473q/1aTmmjLOZu8KI/EslOiI4bKZGy40kJ2ntXPu
	 kqoLOIzaUfkdyHtQbj7tcS+axg1vXvT/Mz1X/VONTAz6tW7v6BmHTyVq7YPNHVKHfR
	 1SEiCwtdnXFjTFHP0EnhS7nx5h/VhGwHVqj4YAPx4pP8bZfeCHS/d6wrZZJI88PAVv
	 nTWAG2e9IMOzBd5kvr3YscHGFh1hk3DV+McvzW1X6/MFAv5oOrpBzvTlivBrZ/Nyp3
	 PDUudFUCcr6Zg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB15C43458;
	Fri, 10 Jul 2026 05:17:19 +0000 (UTC)
From: Miles Krause via B4 Relay <devnull+mileskrause5200.gmail.com@kernel.org>
Date: Fri, 10 Jul 2026 01:17:18 -0400
Subject: [PATCH] Bluetooth: btmtk: use bool for first_block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-btmtk-first-block-bool-v1-1-e6ac61d918e4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAF2AUGoC/yXMwQrCMAyA4VcZORtIi6zqq4iHpcs0bq7SVBHG3
 n1Vj9/h/xcwySoGp2aBLG81TXOF2zUQb918FdS+Gjz5loIj5PIoIw6arSBPKY7IKU3IPe0DHwM
 dvIMaP7MM+vmNz5e/7cV3ieV7g3XdALQwKO56AAAA
X-Change-ID: 20260710-btmtk-first-block-bool-bd047b970821
To: Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miles Krause <mileskrause5200@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783660640; l=2026;
 i=mileskrause5200@gmail.com; s=20260710; h=from:subject:message-id;
 bh=w0GMxlpAuvW9E5EoNTZ+r/cb96pIyUjH4Ud4DEGtoUM=;
 b=vYIwok7n0yB2vPf94Ve+SG+QU4JJSO3a1IJ7WltBPX0AqnfPkHP0R5xxqJ7W21A084yFGQG1v
 wCfGgNfnDrCAaLZ4XoWKi0oVnpEF//C8dsVM/JVzQoGMZxHUK1t+lW9
X-Developer-Key: i=mileskrause5200@gmail.com; a=ed25519;
 pk=QNhNjcQarqig3ColJBIEr3DYfWM1PHpP7z+6thxWXaU=
X-Endpoint-Received: by B4 Relay for mileskrause5200@gmail.com/20260710
 with auth_id=861
X-Original-From: Miles Krause <mileskrause5200@gmail.com>
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
Reply-To: mileskrause5200@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Miles Krause <mileskrause5200@gmail.com>

first_block is reset for each firmware section and is never used outside
the section loop. Declare it as a bool inside the loop to limit its scope
and make its two-state purpose explicit.

No functional change.

Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
---
Compile-tested on x86_64 with:

  make O=out allmodconfig
  make O=out W=1 drivers/bluetooth/btmtk.o

Sparse-tested with:

  make O=out-sparse allmodconfig
  make O=out-sparse C=1 CHECK=sparse drivers/bluetooth/btmtk.o
---
 drivers/bluetooth/btmtk.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 809762d64fc6..b809eb82fc73 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -63,7 +63,7 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 	const u8 *fw_ptr;
 	const u8 *fw_bin_ptr;
 	int err, dlen, i, status;
-	u8 flag, first_block, retry;
+	u8 flag, retry;
 	u32 section_num, dl_size, section_offset;
 	u8 cmd[64];
 
@@ -79,7 +79,7 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 	section_num = le32_to_cpu(globaldesc->section_num);
 
 	for (i = 0; i < section_num; i++) {
-		first_block = 1;
+		bool first_block = true;
 		fw_ptr = fw_bin_ptr;
 		sectionmap = (struct btmtk_section_map *)(fw_ptr + MTK_FW_ROM_PATCH_HEADER_SIZE +
 			      MTK_FW_ROM_PATCH_GD_SIZE + MTK_FW_ROM_PATCH_SEC_MAP_SIZE * i);
@@ -132,9 +132,9 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 
 			while (dl_size > 0) {
 				dlen = min_t(int, 250, dl_size);
-				if (first_block == 1) {
+				if (first_block) {
 					flag = 1;
-					first_block = 0;
+					first_block = false;
 				} else if (dl_size - dlen <= 0) {
 					flag = 3;
 				} else {

---
base-commit: 64b5c4c8e79c131fe8f135bab5e5dfaa245c5776
change-id: 20260710-btmtk-first-block-bool-bd047b970821

Best regards,
--  
Miles Krause <mileskrause5200@gmail.com>



