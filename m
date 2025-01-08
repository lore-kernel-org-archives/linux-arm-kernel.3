Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCACE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nf5n3fvOdCFzPePcys9PQIDnTcq3K0L56wNYb00CE7g=; b=lX2yyfw3Ij5iWt/Ch13tz/TLc2
	c0gcujO7C3TJuRLytpayWjNYHgEQ42ROvukAzCFe7Tolat7lry1QswFaXEAIfVPf8/vHKc0U32ZNs
	5ZAFPi+vyHXp8arLr9UKjTKOgGMXFdc0raF8/sh/TlUQmxi5E+vGM0ZuR+vSyNwbKNDXtNzJ/005d
	7HNw7s4QW11eqDuHQHsiPMsGE/s/Or1kUevrnQ+0eXq5b+5LW6ahoZ+9r9fINt4O5cxubQRDlu45L
	YsRr13IZ3R+tTdAnjoOZ3G9IpCY00MR5f7J9lUtOw+b0ypqLx969BatJ0zN0TqGI7rs20CfqWa9L1
	z8easz2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTmg-000000086ZL-1C4w;
	Wed, 08 Jan 2025 10:59:34 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTc3-000000083Kv-3Ynd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 10:48:37 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2163a2a1ec2so49786435ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 02:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736333314; x=1736938114; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nf5n3fvOdCFzPePcys9PQIDnTcq3K0L56wNYb00CE7g=;
        b=CJDnn/AMSVod+KVFxv0uNNIwhE/KK175W0ad5XEBiWEt0fS8XH39JEdxFK9NFpcH/L
         1KLuJndj2c+nUJGrRrnXsVScJC8bXtG/JbKaz85iw1cs6Bq0Apoge+4kv8WiLiYursYF
         aYV4LWwBGQXsmMD1IBtENTvuMmCC5E3zbIolcpE9PlT6Ig2kIOOtycf0Xdhemk6h/Bvr
         PWpGf8GXqCx/rbD9RZ/LTk2LXcqt32P+DH2kMGOVQb/HTgE//aRwW7Q6/2b+ftqeEjjD
         CNyOVo6S73LzxCE34rRABnRjlEvB9yTbNg9iiyLyg336ztVRyuSNP9PI4RRtzBAwM4jt
         n8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736333314; x=1736938114;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nf5n3fvOdCFzPePcys9PQIDnTcq3K0L56wNYb00CE7g=;
        b=mLVN+FZwajDRdKfKC2PvQ5Zm+tALaurmcahaqAcqVCNZwGTW8C1WspuvM52t/LASe5
         GWCk1Ih30kJNIHLIeJ6jJvvLkauIJLF8Y9kAkto1UYbpemxZ2LlEc7NAxysUkk0REcIb
         jiGewVFKZ20f1HFYrGDam1OitXZjnCTIE/wo3sXMVs0zt1kmLcUSMEWuDH5Xa27t4G5L
         zqxX2qkXpfLLCZetxBRpL7mH13iqlEFe5YNn5/MrODQGPkqFQQb9C5ImC6D6H6MBgKpf
         77RCOCunF5B7VUKV5I7eJ0VRAIf1P+GK61m3jUAqOf7u6BbNgUCW912wrQ6gGsj93iIN
         BiNw==
X-Forwarded-Encrypted: i=1; AJvYcCU8UgqfutwN/IkmqteE36n4lHmB5A1Zj0PVjLCiTNfGkfx+2aV0emmhsdJO89HUe6+xwEmDnp7kT0xCTQ0Zcr43@lists.infradead.org
X-Gm-Message-State: AOJu0YzuxNCm2qaaGEyurEFPcvy65tCFPgrq6x6igUDm9rRARrWL0fjX
	6rUD3sx/zP8/kKAhiOxCax/ji0qOY6YkOEueeknk7EAR+BMZ4LFryckjMenRJBBXdbcqeyUJFKE
	4GsMdhg==
X-Google-Smtp-Source: AGHT+IEpZFlHqKumrq0hCJ2Zb7jCn4vyAtOz66XaXruH3R4KORwpFkEongE7FqoB8phFgSrUYPseeLW610sx
X-Received: from pglr12.prod.google.com ([2002:a63:514c:0:b0:7fd:4c8f:e6a1])
 (user=chharry job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c89b:b0:1e1:aef4:9cd0
 with SMTP id adf61e73a8af0-1e88d139b44mr4156324637.3.1736333314283; Wed, 08
 Jan 2025 02:48:34 -0800 (PST)
Date: Wed,  8 Jan 2025 18:48:12 +0800
In-Reply-To: <20250108184811.v2.1.I66a83f84dce50455c9f7cc7b7ba8fc9d1d465db9@changeid>
Mime-Version: 1.0
References: <20250108184811.v2.1.I66a83f84dce50455c9f7cc7b7ba8fc9d1d465db9@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250108184811.v2.2.Icd16ca64a5d7e212c2801b3b39f65a895fb3e9b4@changeid>
Subject: [PATCH v2 2/3] Bluetooth: Get rid of cmd_timeout and use the reset callback
From: Hsin-chen Chuang <chharry@google.com>
To: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Cc: chromeos-bluetooth-upstreaming@chromium.org, 
	Hsin-chen Chuang <chharry@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_024835_911227_CA155A1E 
X-CRM114-Status: GOOD (  17.98  )
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

From: Hsin-chen Chuang <chharry@chromium.org>

The hdev->reset is never used now and the hdev->cmd_timeout actually
does reset. This patch changes the call path from
  hdev->cmd_timeout -> vendor_cmd_timeout -> btusb_reset -> hdev->reset
, to
  hdev->reset -> vendor_reset -> btusb_reset
Which makes it clear when we export the hdev->reset to a wider usage
e.g. allowing reset from sysfs.

This patch doesn't introduce any behavior change.

Signed-off-by: Hsin-chen Chuang <chharry@chromium.org>
---

(no changes since v1)

 drivers/bluetooth/btmtksdio.c    |  4 ++--
 drivers/bluetooth/btusb.c        | 16 ++++++++--------
 drivers/bluetooth/hci_qca.c      |  6 +++---
 include/net/bluetooth/hci_core.h |  1 -
 net/bluetooth/hci_core.c         |  4 ++--
 5 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index a1dfcfe43d3a..bd5464bde174 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1249,7 +1249,7 @@ static int btmtksdio_send_frame(struct hci_dev *hdev, struct sk_buff *skb)
 	return 0;
 }
 
-static void btmtksdio_cmd_timeout(struct hci_dev *hdev)
+static void btmtksdio_reset(struct hci_dev *hdev)
 {
 	struct btmtksdio_dev *bdev = hci_get_drvdata(hdev);
 	u32 status;
@@ -1360,7 +1360,7 @@ static int btmtksdio_probe(struct sdio_func *func,
 
 	hdev->open     = btmtksdio_open;
 	hdev->close    = btmtksdio_close;
-	hdev->cmd_timeout = btmtksdio_cmd_timeout;
+	hdev->reset    = btmtksdio_reset;
 	hdev->flush    = btmtksdio_flush;
 	hdev->setup    = btmtksdio_setup;
 	hdev->shutdown = btmtksdio_shutdown;
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 916e9ec7bc85..b53d0099a1cb 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -907,7 +907,7 @@ static void btusb_reset(struct hci_dev *hdev)
 	usb_queue_reset_device(data->intf);
 }
 
-static void btusb_intel_cmd_timeout(struct hci_dev *hdev)
+static void btusb_intel_reset(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
 	struct gpio_desc *reset_gpio = data->reset_gpio;
@@ -985,7 +985,7 @@ static inline void btusb_rtl_alloc_devcoredump(struct hci_dev *hdev,
 	}
 }
 
-static void btusb_rtl_cmd_timeout(struct hci_dev *hdev)
+static void btusb_rtl_reset(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
 	struct gpio_desc *reset_gpio = data->reset_gpio;
@@ -1029,13 +1029,13 @@ static void btusb_rtl_hw_error(struct hci_dev *hdev, u8 code)
 	btusb_rtl_alloc_devcoredump(hdev, &hdr, NULL, 0);
 }
 
-static void btusb_qca_cmd_timeout(struct hci_dev *hdev)
+static void btusb_qca_reset(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
 	struct gpio_desc *reset_gpio = data->reset_gpio;
 
 	if (test_bit(BTUSB_HW_SSR_ACTIVE, &data->flags)) {
-		bt_dev_info(hdev, "Ramdump in progress, defer cmd_timeout");
+		bt_dev_info(hdev, "Ramdump in progress, defer reset");
 		return;
 	}
 
@@ -3859,7 +3859,7 @@ static int btusb_probe(struct usb_interface *intf,
 
 		/* Transport specific configuration */
 		hdev->send = btusb_send_frame_intel;
-		hdev->cmd_timeout = btusb_intel_cmd_timeout;
+		hdev->cmd_timeout = btusb_intel_reset;
 
 		if (id->driver_info & BTUSB_INTEL_NO_WBS_SUPPORT)
 			btintel_set_flag(hdev, INTEL_ROM_LEGACY_NO_WBS_SUPPORT);
@@ -3911,7 +3911,7 @@ static int btusb_probe(struct usb_interface *intf,
 		data->setup_on_usb = btusb_setup_qca;
 		hdev->shutdown = btusb_shutdown_qca;
 		hdev->set_bdaddr = btusb_set_bdaddr_ath3012;
-		hdev->cmd_timeout = btusb_qca_cmd_timeout;
+		hdev->cmd_timeout = btusb_qca_reset;
 		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
 		btusb_check_needs_reset_resume(intf);
 	}
@@ -3925,7 +3925,7 @@ static int btusb_probe(struct usb_interface *intf,
 		data->setup_on_usb = btusb_setup_qca;
 		hdev->shutdown = btusb_shutdown_qca;
 		hdev->set_bdaddr = btusb_set_bdaddr_wcn6855;
-		hdev->cmd_timeout = btusb_qca_cmd_timeout;
+		hdev->cmd_timeout = btusb_qca_reset;
 		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
 		hci_set_msft_opcode(hdev, 0xFD70);
 	}
@@ -3944,7 +3944,7 @@ static int btusb_probe(struct usb_interface *intf,
 		btrtl_set_driver_name(hdev, btusb_driver.name);
 		hdev->setup = btusb_setup_realtek;
 		hdev->shutdown = btrtl_shutdown_realtek;
-		hdev->cmd_timeout = btusb_rtl_cmd_timeout;
+		hdev->cmd_timeout = btusb_rtl_reset;
 		hdev->hw_error = btusb_rtl_hw_error;
 
 		/* Realtek devices need to set remote wakeup on auto-suspend */
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 37129e6cb0eb..c7ef38fd5e8e 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1638,7 +1638,7 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
 }
 
-static void qca_cmd_timeout(struct hci_dev *hdev)
+static void qca_reset(struct hci_dev *hdev)
 {
 	struct hci_uart *hu = hci_get_drvdata(hdev);
 	struct qca_data *qca = hu->priv;
@@ -1968,7 +1968,7 @@ static int qca_setup(struct hci_uart *hu)
 		clear_bit(QCA_IBS_DISABLED, &qca->flags);
 		qca_debugfs_init(hdev);
 		hu->hdev->hw_error = qca_hw_error;
-		hu->hdev->cmd_timeout = qca_cmd_timeout;
+		hu->hdev->reset = qca_reset;
 		if (hu->serdev) {
 			if (device_can_wakeup(hu->serdev->ctrl->dev.parent))
 				hu->hdev->wakeup = qca_wakeup;
@@ -2202,7 +2202,7 @@ static int qca_power_off(struct hci_dev *hdev)
 	enum qca_btsoc_type soc_type = qca_soc_type(hu);
 
 	hu->hdev->hw_error = NULL;
-	hu->hdev->cmd_timeout = NULL;
+	hu->hdev->reset = NULL;
 
 	del_timer_sync(&qca->wake_retrans_timer);
 	del_timer_sync(&qca->tx_idle_timer);
diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 84b522a10019..f756fac95488 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -633,7 +633,6 @@ struct hci_dev {
 	int (*post_init)(struct hci_dev *hdev);
 	int (*set_diag)(struct hci_dev *hdev, bool enable);
 	int (*set_bdaddr)(struct hci_dev *hdev, const bdaddr_t *bdaddr);
-	void (*cmd_timeout)(struct hci_dev *hdev);
 	void (*reset)(struct hci_dev *hdev);
 	bool (*wakeup)(struct hci_dev *hdev);
 	int (*set_quality_report)(struct hci_dev *hdev, bool enable);
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 899b6f81966a..67032d21540c 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -1457,8 +1457,8 @@ static void hci_cmd_timeout(struct work_struct *work)
 		bt_dev_err(hdev, "command tx timeout");
 	}
 
-	if (hdev->cmd_timeout)
-		hdev->cmd_timeout(hdev);
+	if (hdev->reset)
+		hdev->reset(hdev);
 
 	atomic_set(&hdev->cmd_cnt, 1);
 	queue_work(hdev->workqueue, &hdev->cmd_work);
-- 
2.47.1.613.gc27f4b7a9f-goog


