Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76465C5DF80
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 07:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qw8I3l8FMjEeGsAy7bEoWGR8IffbGvi49S9EG9wWBI=; b=ziyhkrWmpmzEdKn9ORb9pk7mOe
	lpTDWB7V1QxzrtkEBjs4ZCG8s4LI0jyE/Qt9KISvsXxwXEUeCpgKZIS1fviVCQFF1Xy14P5u5KW8y
	wgCmMCMx+vXPPWxVUzY14jrNn3toesvXh3nPJfns6lERT654u1x2JNYa87bKCC6M2K/tXXwvt5Fak
	R7RS3zTgJMfrBaebrZPinsMid3T/x4vYTQMyndSuvOKOqHyP/8mkGAYtggMWQkKEW0QziXIgylVET
	/YmlDA5o+1gBZD2oaLQDFEG5m6XDOuSwUny3JmpETYLkMYUIaL6tMS6Jdao/22ajZTo4fMdvKaDCX
	3RcY+kUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEdw-00000007TrX-02eu;
	Tue, 18 Aug 2026 07:53:56 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEds-00000007Tpn-0oVH;
	Tue, 18 Aug 2026 07:53:54 +0000
X-UUID: ee7413409ad911f19a56ed5b684f684d-20260818
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:a50bf361-9e29-44a0-bbd3-f46c1145c02d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:0ed92bd1b7fbfdd9b91affb71a9f2ecc,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|136|865|898,TC:nil,Content:0|15|50,EDM:-
	3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ee7413409ad911f19a56ed5b684f684d-20260818
X-User: liujiajia@kylinos.cn
Received: from nature.lan [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liujiajia@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1742744017; Tue, 18 Aug 2026 15:53:42 +0800
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
Subject: [PATCH 2/2] Bluetooth: btusb: mediatek: Fix leaked runtime PM reference in reset
Date: Tue, 18 Aug 2026 15:52:16 +0800
Message-ID: <013a815ce33958ded954c9c1aef95f962a9b2480.1787039123.git.liujiajia@kylinos.cn>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <781dc2cd5ab0533fff9ee7fdcb92fff573431f18.1787039123.git.liujiajia@kylinos.cn>
References: <781dc2cd5ab0533fff9ee7fdcb92fff573431f18.1787039123.git.liujiajia@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_005352_541507_3F7C30D9 
X-CRM114-Status: GOOD (  11.64  )
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

btusb_mtk_reset() calls usb_autopm_get_interface() to resume the
device before driving the hardware reset, but never calls the matching
usb_autopm_put_interface(). Every hardware reset therefore leaks a PM
usage reference of the interface, preventing the device from being
runtime suspended again until it is unbound.

Add the missing usb_autopm_put_interface() at the end of the function.
The reset_gpio path is left untouched on purpose: there the device
yanks itself off the USB and replugs, so the interface is destroyed
and its PM state goes away with it.

Fixes: 25b6d7593a3a ("Bluetooth: btmtk: introduce btmtk reset work")
Assisted-by: Claude:qwen3.8-max
Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
---
 drivers/bluetooth/btusb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index cc19828893c6..c3cc70ca28dc 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2945,6 +2945,7 @@ static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
 
 	usb_queue_reset_device(data->intf);
 	clear_bit(BTMTK_HW_RESET_ACTIVE, &btmtk_data->flags);
+	usb_autopm_put_interface(data->intf);
 
 	return err;
 }
-- 
2.55.0


