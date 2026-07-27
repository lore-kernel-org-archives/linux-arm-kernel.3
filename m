Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51482C54F4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 15:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ege+sKJf2mgRs8jm58Qsbm/wxb1PRT2Fb/Td0betCA=; b=2Y1cqpGkFaeAlsZ+qxogn9CQY0
	fQp45NKQ+6d9qnl5zY1DssMtvhZ1EJDdiJiYKVFZubFMJK4hGl9kcOPAuR8M4lX2jYM1cLo5vhnpf
	GKj2SaiOcPR4a6Iq6saQpKb4x0XFX/tow7AWLZJZ8t6qKsgVks0eNU0HSinmzIscuYwFqBmnvDlGL
	uyyEZYG9wzrRWD7bYAX4RLcr4sh/oMvLNOkQTi3EZjoKRorb2fcbh8X3FY62KcK0Dz/6hvaOkVluU
	vL+B/yh/eJtQ3iZlbfJhgr6ottLTeyeY4egkxsPk582QU614Vs/sw9+vsX3UL9tt7/+kRbBTcQRCV
	dTghETKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNiN-00000003Erv-2gUu;
	Mon, 27 Jul 2026 15:58:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNiI-00000003EqH-3yuJ;
	Mon, 27 Jul 2026 15:57:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 49FA2600B0;
	Mon, 27 Jul 2026 15:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831651F000E9;
	Mon, 27 Jul 2026 15:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785167878;
	bh=7ege+sKJf2mgRs8jm58Qsbm/wxb1PRT2Fb/Td0betCA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZGgsa3tD9tcD26jgZQhWpNCNokSk0UEAXgUiLg5iD5vOkzDfyhcg/qy82gqqZf0y5
	 86XZMiw3mApU58K5d/NEwYVileGvzrHRRIg3S3WQvTGn+V+xjw5SELmKWS+Yszxagx
	 icoJOCHZ7h+nY4RzLN8NcRSygc6tXSty7+uRkC84=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 27 Jul 2026 17:57:33 +0200
Subject: [PATCH 2/3] Bluetooth: btmtk: Fix short read errors in
 btmtk_usb_reg_read()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-bt-ctrl-v1-2-2e8650e9df01@linuxfoundation.org>
References: <20260727-bt-ctrl-v1-0-2e8650e9df01@linuxfoundation.org>
In-Reply-To: <20260727-bt-ctrl-v1-0-2e8650e9df01@linuxfoundation.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>
X-Mailer: b4 0.16-dev-401aa
X-Developer-Signature: v=1; a=openpgp-sha256; l=3078;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=RfSGy3SFZrNvKfzOWBIBrPmFWR8ue5Jmkzn/tto97KA=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFnp9V9Krs2yONUZsa3/ffQHrbeSy620WvRrz6/6bH9DS
 q/+6MrYjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZjITH2GeTqn9/IIKs9U13w1
 eVP9424u/g3bTBgWTJrtYZurc/383pZIFon1DKtjm7/tAAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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

If btmtk_usb_reg_read() gets a "short" read from a device, it will
accidentally treat that as a "real" read and populate the returned value
with some unknown and probably totally invalid data.

Fix this logic error up by calling usb_control_msg_recv() which
guarantees a "full" read happens, and then simplify the error checking
for when btmtk_usb_reg_read() is called (it's really just
btmtk_usb_id_get() that calls btmtk_usb_reg_read(), so fix up those
return sites.

Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/bluetooth/btmtk.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 6f060e4433db..66b346761043 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -827,27 +827,21 @@ static int btmtk_usb_uhw_reg_read(struct hci_dev *hdev, u32 reg, u32 *val)
 static int btmtk_usb_reg_read(struct hci_dev *hdev, u32 reg, u32 *val)
 {
 	struct btmtk_data *data = hci_get_priv(hdev);
-	int pipe, err, size = sizeof(u32);
-	void *buf;
+	u8 buf[sizeof(u32)];
+	int err;
 
-	buf = kzalloc(size, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	pipe = usb_rcvctrlpipe(data->udev, 0);
-	err = usb_control_msg(data->udev, pipe, 0x63,
-			      USB_TYPE_VENDOR | USB_DIR_IN,
-			      reg >> 16, reg & 0xffff,
-			      buf, size, USB_CTRL_GET_TIMEOUT);
+	*val = 0;
+	err = usb_control_msg_recv(data->udev, 0, 0x63,
+				   USB_TYPE_VENDOR | USB_DIR_IN,
+				   reg >> 16, reg & 0xffff,
+				   buf, sizeof(buf), USB_CTRL_GET_TIMEOUT,
+				   GFP_KERNEL);
 	if (err < 0)
-		goto err_free_buf;
+		return err;
 
 	*val = get_unaligned_le32(buf);
 
-err_free_buf:
-	kfree(buf);
-
-	return err;
+	return 0;
 }
 
 static int btmtk_usb_id_get(struct hci_dev *hdev, u32 reg, u32 *id)
@@ -974,7 +968,7 @@ int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 	}
 
 	err = btmtk_usb_id_get(hdev, 0x70010200, &val);
-	if (err < 0 || (!val && dev_id != 0x6639))
+	if (err || (!val && dev_id != 0x6639))
 		bt_dev_err(hdev, "Can't get device id, subsys reset fail.");
 
 	return err;
@@ -1318,24 +1312,24 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 	calltime = ktime_get();
 
 	err = btmtk_usb_id_get(hdev, 0x80000008, &dev_id);
-	if (err < 0) {
+	if (err) {
 		bt_dev_err(hdev, "Failed to get device id (%d)", err);
 		return err;
 	}
 
 	if (!dev_id || dev_id != 0x7663) {
 		err = btmtk_usb_id_get(hdev, 0x70010200, &dev_id);
-		if (err < 0) {
+		if (err) {
 			bt_dev_err(hdev, "Failed to get device id (%d)", err);
 			return err;
 		}
 		err = btmtk_usb_id_get(hdev, 0x80021004, &fw_version);
-		if (err < 0) {
+		if (err) {
 			bt_dev_err(hdev, "Failed to get fw version (%d)", err);
 			return err;
 		}
 		err = btmtk_usb_id_get(hdev, 0x70010020, &fw_flavor);
-		if (err < 0) {
+		if (err) {
 			bt_dev_err(hdev, "Failed to get fw flavor (%d)", err);
 			return err;
 		}

-- 
2.55.0


