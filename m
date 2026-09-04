Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06090C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqKq/r0vY+Wk19k4zRvu8SfzWTm4HeQ1noRZ0RQpjmU=; b=eAjitlaMjcByplB7+CLsUkaOtI
	RI1H6CvLv0B6U+9JLx1HlcKM7nD9k/YZqq+klg2f8K0tTnpeX96XmmgecC/DPXIUgOiVnYePvhlA/
	kxNk/1DMbBYY0Smpm2U6jCfFQLq+d6yCpKyKc+uOJGLUDmXt0s6ACprWLlmbVLcz4O5Xhk57oQ05R
	IdGAzABKLQyg+tvA6aRpXm8OdaQRf+aiGK6Rm8ZqtVWTeSPfkh4VIQKdsVoLS9no2EyPzxAh9CvHr
	eI/Em6+7wESY7yX1EfzR+yWGeF0Q+Y9l9badq52X/Oe7DhHvqTAnWQwMhStrJnARjCUipuQ5YQ32Y
	36PXPRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OuI-00000001Ka5-2XB4;
	Fri, 04 Sep 2026 08:04:18 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OuG-00000001KXt-1E8H;
	Fri, 04 Sep 2026 08:04:17 +0000
X-UUID: 32f62390a83711f19a56ed5b684f684d-20260904
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:3ef42949-9642-4051-8fa6-6c3a7de7a48a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:09d8b407c0411b75a6c74998d47c51e5,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|865|898,TC:nil,Content:0|15|50|99,ED
	M:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 32f62390a83711f19a56ed5b684f684d-20260904
X-User: liujiajia@kylinos.cn
Received: from nature.lan [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liujiajia@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1591112501; Fri, 04 Sep 2026 16:04:05 +0800
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
Subject: [PATCH v5 2/2] Bluetooth: btusb: Fix leaked runtime PM reference in btusb_reset
Date: Fri,  4 Sep 2026 16:03:51 +0800
Message-ID: <dae8ba2edf89e35c44748912aa466f3b9c8df75b.1788507854.git.liujiajia@kylinos.cn>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <dac8ddf07cb1bb79c70d5a516f0ff7baf41eb462.1788507854.git.liujiajia@kylinos.cn>
References: <dac8ddf07cb1bb79c70d5a516f0ff7baf41eb462.1788507854.git.liujiajia@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_010416_662696_ECFDBD7B 
X-CRM114-Status: GOOD (  15.61  )
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

btusb_reset calls usb_autopm_get_interface to resume the device
before queuing a reset of it, but never calls the matching
usb_autopm_put_interface.

usb_queue_reset_device ends up in usb_reset_device(), and since
btusb provides no pre_reset/post_reset callbacks the interface is
merely unbound and rebound: the interface device object survives
this cycle, and so does its PM usage count, which is not cleared
when the driver is unbound.

As a result every reset permanently leaks a PM usage reference,
preventing the interface from being runtime suspended again until
it is unbound.

Set BTUSB_RESET flag before usb_queue_reset_device so that
btusb_disconnect drops the reference. If the flag is already set,
drop one reference.

Fixes: c9209b269afd ("Bluetooth: btusb: Introduce generic USB reset")
Assisted-by: Claude:qwen3.8-max
Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
---

Changes in v5:
- no change

Changes in v4:
- do not return if BTUSB_RESET is set in case the first reset failed.
  (sashiko)

Changes in v3:
- handle multiple reset requests int btusb_reset (sashiko)
  set BTUSB_RESET after usb_autopm_get_interface. If the flag is
  already set, drop newly acquired reference and return.

Changes in v2:
- Fix the race window (sashiko)
  set BTUSB_USB_RESET_ACTIVE flag before usb_queue_reset_device.

Changes in v1:
- add usb_autopm_put_interface after usb_queue_reset_device

---
 drivers/bluetooth/btusb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 6f7946709266..61c18402911a 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -1068,13 +1068,15 @@ static void btusb_reset(struct hci_dev *hdev)
 	int err;
 
 	data = hci_get_drvdata(hdev);
-	/* This is not an unbalanced PM reference since the device will reset */
 	err = usb_autopm_get_interface(data->intf);
 	if (err) {
 		bt_dev_err(hdev, "Failed usb_autopm_get_interface: %d", err);
 		return;
 	}
 
+	if (test_and_set_bit(BTUSB_RESET, &data->flags))
+		usb_autopm_put_interface_no_suspend(data->intf);
+
 	bt_dev_err(hdev, "Resetting usb device.");
 	usb_queue_reset_device(data->intf);
 }
-- 
2.55.0


