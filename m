Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58553C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 06:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hj+8VWgZyMRjquqn0hwzE+KmeYgvePWRgg9FPuxuQU0=; b=n4am6GvI0o1pOP8xgMcDrfh0L+
	ZogzooRHzZjC/aZ5bEj0PGW6WZ/7CVCQ0m/O4y5Ty69+OSuk9hK4KA1hsee5s6XJ6/5AMVtyJM2Of
	wuvSX1xJ8DYZ22zHawy+9PJPERpsmwSbTFhkW9WzElqyl0V3zKsUd75u3eYW/TEqgrAJsC6GxkFW1
	shJZKDVvA6ZuM4qTkBTaLOLeK6/vVPTVqjD7zC4A0S2vjShkBSgJ8o9iB9wK7z82nvIEzSWQ4puq1
	ooM3BDnlmbo/+b5OC0drz5Q89z6KVKwmh9LhKPCYkVtGsB9rghFjjKXs92Ql4A/e+2E84Ah5JUCXS
	7MjYZWEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2ER-0000000Df9c-1jd5;
	Fri, 27 Jun 2025 06:06:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV28p-0000000DeQg-3vc0;
	Fri, 27 Jun 2025 06:00:53 +0000
X-UUID: 110423ca531c11f09eb0dd999d3936bf-20250626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Hj+8VWgZyMRjquqn0hwzE+KmeYgvePWRgg9FPuxuQU0=;
	b=lTROLruvzuICWuOPThlfEE+1w0KzMwOianO8yIXyk/WtO0nWGrb7m0Nm1PWzRW+AJmSWuPOGiEVccM6LdD3X4M3q3mQ1eWGDgSivdrGPnDWecY9Z5+P76T97ipxiWJuFwnDz0UnaBDq9ZwkwmAS6wLbvXGQc2Ird0WbeL9fZS8k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:b682b13a-0c4b-4e1a-98d3-3245a13281c9,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:89ef9f73-15a7-4ae6-ad4b-94c27b45c266,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 110423ca531c11f09eb0dd999d3936bf-20250626
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ot_zhangchao.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1886083959; Thu, 26 Jun 2025 23:00:45 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 27 Jun 2025 14:00:41 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 27 Jun 2025 14:00:40 +0800
From: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk=dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Jiande Lu <jiande.lu@mediatek.com>,
	Deren Wu <deren.Wu@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, Hao Qin
	<Hao.qin@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, devicetree
	<devicetree@vger.kernel.org>, Zhangchao Zhang
	<ot_zhangchao.zhang@mediatek.com>
Subject: [PATCH v5 1/2] Bluetooth: mediatek: add gpio pin to reset bt
Date: Fri, 27 Jun 2025 13:59:23 +0800
Message-ID: <20250627055924.7716-2-ot_zhangchao.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250627055924.7716-1-ot_zhangchao.zhang@mediatek.com>
References: <20250627055924.7716-1-ot_zhangchao.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_230051_989856_6871C1F3 
X-CRM114-Status: GOOD (  21.35  )
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

Makes the platform Bluetooth to be reset by hardware pin,
it provides two methods to do it for mediatek controller,
and it has been tested locally many times and can reset normally.

When an exception occurs, resetting Bluetooth by hardware pin
is more stable than resetting Bluetooth by software.
If the corresponding pin is not found in dts,
bluetooth can also be reset successfully.

Co-developed: Hao Qin <hao.qin@mediatek.com>
Co-developed: Chris Lu <chris.lu@mediatek.com>
Co-developed: Jiande Lu <jiande.lu@mediatek.com>
Signed-off-by: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 69 +++++++++++++++++++++++++++++++++++++++
 drivers/bluetooth/btmtk.h |  5 +++
 2 files changed, 74 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 4390fd571dbd..4f677f86af1e 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -6,6 +6,8 @@
 #include <linux/firmware.h>
 #include <linux/usb.h>
 #include <linux/iopoll.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
 #include <linux/unaligned.h>
 
 #include <net/bluetooth/bluetooth.h>
@@ -109,6 +111,65 @@ static void btmtk_coredump_notify(struct hci_dev *hdev, int state)
 	}
 }
 
+static void btmtk_reset_by_gpio_work(struct work_struct *work)
+{
+	struct btmtk_reset_gpio *reset_gpio_data =
+			container_of(work, struct btmtk_reset_gpio, reset_work.work);
+
+	gpio_direction_output(reset_gpio_data->gpio_number, 1);
+	kfree(reset_gpio_data);
+}
+
+static int btmtk_reset_by_gpio(struct hci_dev *hdev)
+{
+	struct btmtk_data *data = hci_get_priv(hdev);
+	struct btmtk_reset_gpio *reset_gpio_data;
+	struct device_node *node;
+	int reset_gpio_number;
+
+	node = of_find_compatible_node(NULL, NULL, "mediatek,usb-bluetooth");
+	if (node) {
+		reset_gpio_number = of_get_named_gpio(node, "reset-gpios", 0);
+		if (!gpio_is_valid(reset_gpio_number)) {
+			bt_dev_warn(hdev, "invalid reset GPIO, use software reset");
+			return -EINVAL;
+		}
+	} else {
+		bt_dev_warn(hdev, "no reset GPIO, use software reset");
+		return -ENODEV;
+	}
+
+	/* Toggle the hard reset line. The Mediatek device is going to
+	 * yank itself off the USB and then replug. The cleanup is handled
+	 * correctly on the way out (standard USB disconnect), and the new
+	 * device is detected cleanly and bound to the driver again like
+	 * it should be.
+	 */
+
+	if (test_and_set_bit(BTMTK_HW_RESET_ACTIVE, &data->flags)) {
+		bt_dev_err(hdev, "last reset failed? Not resetting again");
+		return 0;
+	}
+
+	reset_gpio_data = kzalloc(sizeof(*reset_gpio_data), GFP_KERNEL);
+	if (!reset_gpio_data)
+		return -ENOMEM;
+
+	INIT_DELAYED_WORK(&reset_gpio_data->reset_work, btmtk_reset_by_gpio_work);
+	reset_gpio_data->gpio_number = reset_gpio_number;
+
+	gpio_direction_output(reset_gpio_number, 0);
+
+	/* It requires 200ms for mtk bt chip to do reset,
+	 * although Schedule_delayed_work is asynchronous,
+	 * it is risk-free. If it is not completed in 200ms,
+	 * it will only postpone the next probe, which will
+	 * only make the probe run later. There is no other risk.
+	 */
+	schedule_delayed_work(&reset_gpio_data->reset_work, msecs_to_jiffies(200));
+	return 0;
+}
+
 void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ver,
 			   u32 fw_flavor)
 {
@@ -364,6 +425,14 @@ void btmtk_reset_sync(struct hci_dev *hdev)
 	struct btmtk_data *reset_work = hci_get_priv(hdev);
 	int err;
 
+	/* Toggle reset gpio if the platform provides one,
+	 * if the compatibility field or pin cannot be found
+	 * in the dts files, it can still reset bluetooth using
+	 * software reset.
+	 */
+	err = btmtk_reset_by_gpio(hdev);
+	if (!err)
+		return;
 	hci_dev_lock(hdev);
 
 	err = hci_cmd_sync_queue(hdev, reset_work->reset_sync, NULL, NULL);
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 5df7c3296624..8a265ce367d1 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -179,6 +179,11 @@ struct btmtk_data {
 	spinlock_t isorxlock;
 };
 
+struct btmtk_reset_gpio {
+	struct delayed_work reset_work;
+	int gpio_number;
+};
+
 typedef int (*wmt_cmd_sync_func_t)(struct hci_dev *,
 				   struct btmtk_hci_wmt_params *);
 
-- 
2.46.0


