Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71156C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B109+8NZEbMQJ0pDHwjFopml2ryZkezn+CpF9BZP+m0=; b=hXB1c189aCEFD1OTaIQvf9zQ0R
	bJjPuSTv7e5VdtW6XYZGZUXy6z7DD8M1szvLkh0B+gm2IhXvHCBq+ZUYZWQsp4mEE5QM7yTDmw2AJ
	gQh1g8MWRb79xWl4IRWu/sUci/jYBsFKzwwZc24O92YK2VQbGe/oHBCKAMwzvrgD0oy0jf82nKmpq
	hCO1PPBkWD0Xy3ssu+pRjjK+3K6ON+74uy9pdd0lZqT7MWyd6Rq3Q1R4OC/MdefCFmxlWUOsTqpqq
	zTdpk52UCBXCKBKg0HKjkSV20y6D6D7k4veAbm9KcbCrlABBV4A5S0hj5fzb4tBBWp2Q7WzGVoY3J
	aBGfIYKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDuV-0000000F4Ot-00vr;
	Mon, 29 Jun 2026 15:28:35 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDuQ-0000000F4Nz-0i24;
	Mon, 29 Jun 2026 15:28:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1782746898; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CtlubN3O8T/gOMm2+m+XcDWQpAq/BF9WpPC0tSjP56mWXesZRObtNEcYXZYMIccoIM6KuKEyuvtUbqiQbNfU0YtNnsJUwgt06RWGc0JuQ/eFQ8/+fO59Pct8dxTlJS2ATyz5m51Ccd9da7ZSZDw2BTZ13CwiPeBPO9ma114LxC0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1782746898; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=B109+8NZEbMQJ0pDHwjFopml2ryZkezn+CpF9BZP+m0=; 
	b=ELdEe6YWSjqJAjZD0z59BviM+eT8nv6Ozqmym+B89mTnXL/jmw4FTUGhYilNzPADzovGObCJfyvmPco4sSvEz/GMYoaY6eb0D97bMKmpUlpBSm35oobkkppKGJGRwKDe3MZA98PuDtPLIM14Z9hQ9p/HIw+uDsxGCyeCo31scjo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782746898;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=B109+8NZEbMQJ0pDHwjFopml2ryZkezn+CpF9BZP+m0=;
	b=bJxMcgTrrMris7kfCVoAGhygrhOqnwMpXzMvmEwDUVbgywJC1hkMN1TX+Me7XnZS
	/KqoNmgwLx6k5DMntK9sz3RgTobK54hh0u+DYD+NHOge/ZzwBKlR6RJcgEODwIO/q/t
	d1HaoV8yBNXBNaFUiuYOHmYUDl4kVVQem/Z3wz8eNfr1QDrWusFWYMJbb45RKNNCfQF
	vuVFDh7fxiOdDygrjxv/1D4Viwgg4YerGoysO2Qu3mdFcV8WSgdQ+yyeAFSm5zTCL84
	7hwNPUV0soR2hqACk2qMqjy/VHYK1lZBFrQ0pEeB5J5S6Kz9QoT6G99esv6MIB+ijUP
	X3lAdYdQRg==
Received: by mx.zohomail.com with SMTPS id 1782746895981162.6356666501132;
	Mon, 29 Jun 2026 08:28:15 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 29 Jun 2026 23:27:58 +0800
Subject: [PATCH] Bluetooth: Properly disable remote wakeup for
 MT7922/MT7925 on Ryzen platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-btmtk-ryzen-remote-wakeup-v1-1-1d2f1cee6d22@rong.moe>
X-B4-Tracking: v=1; b=H4sIAP2OQmoC/yXMyw6CMBBG4Vchs3aSiqLoqxAXbf3RkVDItHgjv
 LtVl9/inJkiVBDpWMykuEuUIWSsVwX5qw0XsJyzqdwYZ2t/YJf61LG+3gis6IcEftgO08imquz
 W7Hd1iZZyPypaef7ezenvOLkbfPoOaVk+2uGS530AAAA=
X-Change-ID: 230ba8c9-btmtk-ryzen-remote-wakeup-055a407682ef
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 =?utf-8?q?Chris_Lu_=28=E9=99=B8=E7=A8=9A=E6=B3=93=29?= <Chris.Lu@mediatek.com>, 
 =?utf-8?q?Will-CY_Lee_=28=E6=9D=8E=E6=94=BF=E7=A9=8E=29?= <Will-CY.Lee@mediatek.com>, 
 =?utf-8?q?SS_Wu_=28=E5=B7=AB=E6=86=B2=E6=AC=A3=29?= <ss.wu@mediatek.com>, 
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_082830_250435_B39A6640 
X-CRM114-Status: GOOD (  22.47  )
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

It is reported that a remote wakeup could cause MT7922/MT7925's btusb
interface completely unresponsive. Resetting the xHCI root hub doesn't
help at all, and recovering from such a state needs a power cycle.

All reports seen to be relevant to Ryzen-based laptops. These NICs are
usually used as OEM components thanks to some sort of reference designs.

Their popularity on other platforms is unclear. While there is still a
chance that the quirk may exist on other platforms, be cautious and only
apply the quirk on AMD platforms for the time being.

Meanwhile, though device_set_wakeup_capable(false) is the correct fix
for other NICs with fake remote wakeup capabilities, doing so for
MT7922/MT7925 effectively prevents it from being used as wakeup
sources as per userspace requests. Hence, return -EBUSY on runtime
suspend to prevent the interface from being autosuspended while it's
still opened, which has the same effect as
device_set_wakeup_capable(false), since disabling remote wakeup simply
causes the USB core to gate runtime autosuspend as well due to
needs_remote_wakeup == 1. The interface can be safely autosuspended as
long as remote wakeup is disabled, i.e., after closing the HCI device.

Specifically, the interface may still take the advantage of remote
wakeup in order to wake up the system from sleep if userspace has
enabled it as a wakeup source.

Fixes: e31d761628ad ("Bluetooth: btmtk: Disable remote wakeup for MT7922/MT7925")
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/bluetooth/btmtk.c | 10 ---------
 drivers/bluetooth/btusb.c | 57 +++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 53 insertions(+), 14 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 02a96342e964..4614434dd57b 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1381,16 +1381,6 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 		break;
 	case 0x7922:
 	case 0x7925:
-		/*
-		 * A remote wakeup could cause the device completely unresponsive, and
-		 * recovering from such a state needs a power cycle.
-		 *
-		 * Since the remote wakeup capability is super broken, just disable it
-		 * to get rid of the troubles. The device can still be autosuspended
-		 * when the bluetooth interface is closed.
-		 */
-		device_set_wakeup_capable(&btmtk_data->udev->dev, false);
-		fallthrough;
 	case 0x7961:
 	case 0x7902:
 	case 0x6639:
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 08c0a99a62c5..023ae782f41a 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -6,6 +6,7 @@
  *  Copyright (C) 2005-2008  Marcel Holtmann <marcel@holtmann.org>
  */
 
+#include <linux/cpufeature.h>
 #include <linux/dmi.h>
 #include <linux/module.h>
 #include <linux/usb.h>
@@ -957,6 +958,7 @@ struct qca_dump_info {
 #define BTUSB_USE_ALT3_FOR_WBS	15
 #define BTUSB_ALT6_CONTINUOUS_TX	16
 #define BTUSB_HW_SSR_ACTIVE	17
+#define BTUSB_WAKEUP_BROKEN	18
 
 struct btusb_data {
 	struct hci_dev       *hdev;
@@ -2936,10 +2938,20 @@ static int btusb_send_frame_mtk(struct hci_dev *hdev, struct sk_buff *skb)
 	}
 }
 
+static inline bool platform_is_ryzen(void)
+{
+#ifdef CONFIG_X86
+	return boot_cpu_has(X86_FEATURE_ZEN);
+#else
+	return false;
+#endif
+}
+
 static int btusb_mtk_setup(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
 	struct btmtk_data *btmtk_data = hci_get_priv(hdev);
+	int err;
 
 	/* MediaTek WMT vendor cmd requiring below USB resources to
 	 * complete the handshake.
@@ -2956,7 +2968,29 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 		btusb_mtk_claim_iso_intf(data);
 	}
 
-	return btmtk_usb_setup(hdev);
+	err = btmtk_usb_setup(hdev);
+	if (err)
+		return err;
+
+	switch (btmtk_data->dev_id) {
+	case 0x7922:
+	case 0x7925:
+		/*
+		 * All reports seen to be relevant to Ryzen-based laptops. These
+		 * NICs are usually used as OEM components thanks to some sort
+		 * of reference designs.
+		 *
+		 * Their popularity on other platforms is unclear. While there
+		 * is still a chance that the quirk may exist on other
+		 * platforms, be cautious and only apply the quirk on AMD
+		 * platforms for the time being.
+		 */
+		if (platform_is_ryzen())
+			set_bit(BTUSB_WAKEUP_BROKEN, &data->flags);
+		break;
+	}
+
+	return 0;
 }
 
 static int btusb_mtk_shutdown(struct hci_dev *hdev)
@@ -4532,11 +4566,26 @@ static int btusb_suspend(struct usb_interface *intf, pm_message_t message)
 
 	BT_DBG("intf %p", intf);
 
-	/* Don't auto-suspend if there are connections or discovery in
-	 * progress; external suspend calls shall never fail.
+	/*
+	 * It is reported that remote wakeup events could sometimes cause some
+	 * adapters completely unresponsive. Resetting the xHCI root hub doesn't
+	 * help at all, and recovering from such a state needs a power cycle.
+	 * Since disabling remote wakeup simply causes the USB core to gate
+	 * runtime autosuspend as well due to needs_remote_wakeup == 1, let's do
+	 * this ourselves to make our life easier. The interface can be safely
+	 * autosuspended as long as remote wakeup is disabled, i.e., after
+	 * closing the HCI device.
+	 *
+	 * Don't auto-suspend if there are connections or discovery in progress.
+	 *
+	 * External suspend calls shall never fail. Specifically, a device with
+	 * broken remote wakeup may still take the advantage of remote wakeup in
+	 * order to wake up the system from sleep if userspace has enabled it as
+	 * a wakeup source.
 	 */
 	if (PMSG_IS_AUTO(message) &&
-	    (hci_conn_count(data->hdev) || hci_discovery_active(data->hdev)))
+	    ((test_bit(BTUSB_WAKEUP_BROKEN, &data->flags) && data->intf->needs_remote_wakeup) ||
+	     hci_conn_count(data->hdev) || hci_discovery_active(data->hdev)))
 		return -EBUSY;
 
 	if (data->suspend_count++)

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 230ba8c9-btmtk-ryzen-remote-wakeup-055a407682ef

Thanks,
Rong


