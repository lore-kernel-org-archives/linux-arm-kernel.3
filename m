Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E051DC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AKdLH/ahCIG1Rgwopv/LsqMKS0D1H45YTiRnWEh9qx4=; b=2Caa9SdkCdC3DEJcsxsDf5v/YJ
	PzudnsIbA3CP2va93EsEhJXSrgpNWuuHHZUxDRTf1Vf90UboDrrHs8iMqYREJgRad0mjyPUEdnyjI
	2YxTKQKh6FZO9DGGadmJBpZveKKshfy0JGBAqtiFNkM30N6M3KDjXLMwQ1IjEgTXYDN4IDj6iU9X8
	MLETu0jQa9hoeZsn0nzHtDlK8fzrd49tWP2Hx7eTvxYylGmuelHAwSPz3P+ApjrZRion91GHpHCBM
	8OljQ8n/r6WqSUK3z3CgsWGb8R3ZpCrREXaIrK78W4fpgTdTq2p0mE5oq02e+jPEzEmSQ/a3ywLgQ
	1Damdglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OuG-00000001KYk-1t2n;
	Fri, 04 Sep 2026 08:04:16 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OuD-00000001KXS-3Why;
	Fri, 04 Sep 2026 08:04:15 +0000
X-UUID: 2f23fddca83711f19a56ed5b684f684d-20260904
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:cd519ada-3f50-4216-9336-b35712992ab9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:e562e21d508100021ebce5939b8fd2cd,BulkI
	D:nil,BulkQuantity:0,SF:102|136|865|898,TC:nil,Content:0|15|50|99,EDM:-3|-
	100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2f23fddca83711f19a56ed5b684f684d-20260904
X-User: liujiajia@kylinos.cn
Received: from nature.lan [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liujiajia@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1921575205; Fri, 04 Sep 2026 16:03:59 +0800
From: Jiajia Liu <liujiajia@kylinos.cn>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Ying Hsu <yinghsu@chromium.org>,
	Archie Pusaka <apusaka@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jing Cai <jing.cai@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Chris Lu <chris.lu@mediatek.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jiajia Liu <liujiajia@kylinos.cn>
Subject: [PATCH v5 1/2] Bluetooth: btusb: mediatek: Fix leaked runtime PM reference in reset
Date: Fri,  4 Sep 2026 16:03:50 +0800
Message-ID: <dac8ddf07cb1bb79c70d5a516f0ff7baf41eb462.1788507854.git.liujiajia@kylinos.cn>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_010414_176832_BD3CF0D1 
X-CRM114-Status: GOOD (  18.87  )
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

MT7925 on HP Pro Mini 260 sometimes timed out during reloading driver
and reset usb device. btusb_suspend is not called again after closing
bluetooth interface.

 usbcore: registered new interface driver btusb
 Bluetooth: hci0: HW/SW Version: 0x00000000, Build Time: 20260605184935
 Bluetooth: hci0: Execution of wmt command timed out
 Bluetooth: hci0: Failed to send wmt patch dwnld (-110)
 Bluetooth: hci0: Failed to set up firmware (-110)
 usb 3-10: reset high-speed USB device number 4 using xhci_hcd
 Bluetooth: hci0: HW/SW Version: 0x00000000, Build Time: 20260605184935
 Bluetooth: hci0: Device setup in 1856545 usecs
 Bluetooth: hci0: AOSP extensions version v1.00
 Bluetooth: hci0: AOSP quality report is supported
 Bluetooth: MGMT ver 1.23

btusb_mtk_reset calls usb_autopm_get_interface to resume the device
before driving the hardware reset, but never calls the matching
usb_autopm_put_interface. Every hardware reset therefore leaks a PM
usage reference of the interface, preventing the device from being
runtime suspended again until it is unbound.

Add the BTUSB_RESET flag. It is set before usb_queue_reset_device
and is cleared in btusb_disconnect, which drops the reference as well.
If the flag is already set when a new reset is requested, drop one
reference.

Also clear BTMTK_HW_RESET_ACTIVE if usb_autopm_get_interface fails,
otherwise no further reset could ever be attempted.

Fixes: 25b6d7593a3a ("Bluetooth: btmtk: introduce btmtk reset work")
Assisted-by: Claude:qwen3.8-max
Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
---

Changes in v5:
- set BTUSB_RESET to 19 since BTUSB_WAKEUP_BROKEN (18) is introduced.

Changes in v4:
- do not return if BTUSB_RESET is set in case the first reset failed.
  move test_and_set_bit right before usb_queue_reset_device (sashiko)

Changes in v3:
- rename BTUSB_USB_RESET_ACTIVE to BTUSB_RESET (Luiz)

- test_and_clear_bit BTUSB_RESET in btusb_disconnect (Luiz)

- handle multiple reset requests int btusb_mtk_reset (sashiko)
  set BTUSB_RESET if no reset_gpio after usb_autopm_get_interface.
  If the flag is already set, add log and drop newly acquired reference
  and return.

- clear BTMTK_HW_RESET_ACTIVE if usb_autopm_get_interface fails and add
  error log. (sashiko)

Changes in v2:
- Fix the race window (sashiko)
  Add and set BTUSB_USB_RESET_ACTIVE flag before usb_queue_reset_device.
  Release PM reference in btusb_disconnect if this flag is set.

Changes in v1:
- add usb_autopm_put_interface after usb_queue_reset_device

---
 drivers/bluetooth/btusb.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index dfefb43fb792..6f7946709266 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -988,6 +988,7 @@ struct btqca_data {
 #define BTUSB_ALT6_CONTINUOUS_TX	16
 #define BTUSB_HW_SSR_ACTIVE	17
 #define BTUSB_WAKEUP_BROKEN	18
+#define BTUSB_RESET		19
 
 #define BTUSB_PROTO_LEGACY	0x00
 #define BTUSB_PROTO_H4		0x01
@@ -3024,8 +3025,11 @@ static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
 	}
 
 	err = usb_autopm_get_interface(data->intf);
-	if (err < 0)
+	if (err < 0) {
+		bt_dev_err(hdev, "Failed usb_autopm_get_interface: %d", err);
+		clear_bit(BTMTK_HW_RESET_ACTIVE, &btmtk_data->flags);
 		return err;
+	}
 
 	/* Release MediaTek ISO data interface */
 	btusb_mtk_release_iso_intf(hdev);
@@ -3047,6 +3051,11 @@ static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
 
 	err = btmtk_usb_subsys_reset(hdev, btmtk_data->dev_id);
 
+	if (test_and_set_bit(BTUSB_RESET, &data->flags)) {
+		bt_dev_err(hdev, "last usb reset failed? Resetting again");
+		usb_autopm_put_interface_no_suspend(data->intf);
+	}
+
 	usb_queue_reset_device(data->intf);
 	clear_bit(BTMTK_HW_RESET_ACTIVE, &btmtk_data->flags);
 
@@ -4729,6 +4738,9 @@ static void btusb_disconnect(struct usb_interface *intf)
 	if (data->reset_gpio)
 		gpiod_put(data->reset_gpio);
 
+	if (test_and_clear_bit(BTUSB_RESET, &data->flags))
+		usb_autopm_put_interface_no_suspend(data->intf);
+
 	if (intf == data->intf) {
 		if (data->isoc)
 			usb_driver_release_interface(&btusb_driver, data->isoc);
-- 
2.55.0


