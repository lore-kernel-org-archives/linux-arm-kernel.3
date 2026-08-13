Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FB5C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 03:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A6rIb5RlVBObbBBPRDRyiQRuarDMM+7NmHEFpV/nkL0=; b=dZyC8MZ7d/reaS5ekkl5IjmBaW
	ei4cNHLhQCaRmrtgrdZSslOjmM/NLDDVW+iDtAG/pH0mk+wfCbYQPqJf/fxQ4Kh5XbHZQ+QXXBtS2
	YZYHvsAh+EJvzFdQW5O7LGmDKTsuwsQKtlO8wwKmTW0Rx68uZsiKhbLAB9hsp5h4VfGPOsRaCXA9O
	KiJSe7dYoGp8GiPJ4MTLqZ8Wp5pMAgrWR+zmsw7WhHB6h96AYpCkcNB7HN/H1OpI27NedDTbGujVJ
	C7EgSkeKkxFTzggYlWJ5c4904RWeleXuQQ5DQaw5mj9T9ZC65o+gVkhbFiOzyC+aLuABuWOFJUIul
	1lHNqsFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuMCg-0000000HK3s-23LO;
	Thu, 13 Aug 2026 03:34:02 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuMCd-0000000HK3J-1aHg;
	Thu, 13 Aug 2026 03:34:00 +0000
X-UUID: ca9f14d096c711f1aa26b74ffac11d73-20260813
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b62de0c4-7218-47b1-88b7-d6ec9577c968,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:a88ee5ec89d770e9a1f874af51a1efb3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|865|898,TC:nil,Content:0|15|50,E
	DM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ca9f14d096c711f1aa26b74ffac11d73-20260813
X-User: liujiajia@kylinos.cn
Received: from nature.lan [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liujiajia@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 681806574; Thu, 13 Aug 2026 11:33:46 +0800
From: Jiajia Liu <liujiajia@kylinos.cn>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jiajia Liu <liujiajia@kylinos.cn>
Subject: [PATCH] Bluetooth: btmtk: improve error logs of MT79xx WMT operations
Date: Thu, 13 Aug 2026 11:33:17 +0800
Message-ID: <20260813033317.23914-1-liujiajia@kylinos.cn>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_203359_710478_1D44D258 
X-CRM114-Status: UNSURE (   8.89  )
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

There are some identical error logs, making it difficult to distinguish
which step has the error. Improve them based on BTMTK_WMT_FUNC_CTRL and
BTMTK_WMT_PATCH_DWNLD calls and comments.

Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
---
 drivers/bluetooth/btmtk.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 02a96342e964..bbd0ac41fdb7 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -198,7 +198,7 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 
 				err = wmt_cmd_sync(hdev, &wmt_params);
 				if (err < 0) {
-					bt_dev_err(hdev, "Failed to send wmt patch dwnld (%d)",
+					bt_dev_err(hdev, "Failed to get wmt patch status (%d)",
 						   err);
 					goto err_release_fw;
 				}
@@ -251,7 +251,7 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 					err = -EIO;
 					goto err_release_fw;
 				} else if (err < 0) {
-					bt_dev_err(hdev, "Failed to send wmt patch dwnld (%d)",
+					bt_dev_err(hdev, "Failed to send wmt patch data (%d)",
 						   err);
 					goto err_release_fw;
 				}
@@ -1424,7 +1424,7 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 
 		err = btmtk_usb_hci_wmt_sync(hdev, &wmt_params);
 		if (err < 0) {
-			bt_dev_err(hdev, "Failed to send wmt func ctrl (%d)", err);
+			bt_dev_err(hdev, "Failed to enable protocol (%d)", err);
 			return err;
 		}
 
@@ -1550,7 +1550,7 @@ int btmtk_usb_shutdown(struct hci_dev *hdev)
 
 	err = btmtk_usb_hci_wmt_sync(hdev, &wmt_params);
 	if (err < 0) {
-		bt_dev_err(hdev, "Failed to send wmt func ctrl (%d)", err);
+		bt_dev_err(hdev, "Failed to disable device (%d)", err);
 		usb_autopm_put_interface(data->intf);
 		return err;
 	}
-- 
2.55.0


