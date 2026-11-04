Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8094606EE9C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 15:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EoR2iJnw;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=X/HdE4h3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nnBZYqOf+KME/Sp46pI5WW+OtBO4bG0EElZeJz4UPYY=; b=EoR2iJnweCtpYd
	kA4X6PMKHvKNwZlCI2GvO3742HjFT51mLFQPLDxM2idmeb6wU6J60vNvtPEGgune74h97mM/WxSw4
	rmlBWRvxDwPCkLsQyRpHTp+bMCbNZ9ljDpHG8BlZLCgFS4CK9uuThQB2rhS7jPsZXlYxcEnbERmIz
	ayf3uD9y6OoLw4D5qNJ1Q71Z14QLgASZ4zRy+5sBLMo8hkKCViVBetWlVSBNRffz79LSqaeOLIPXM
	T56a9OkZ22lMsPlqlSCMALcqYwRiHgdCGkp9ljJBC85whHCgHS4EbbXIbry9DmyF1F7tgQCOisOfX
	wALFmqrGxwjhar6HIGDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcio-00000005k4O-09Io;
	Wed, 04 Nov 2026 15:16:18 +0000
Received: from bulk0.mail-out.lima-city.de ([91.216.248.212])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcij-00000005jz9-0VR9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 15:16:14 +0000
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793805371;
	bh=mWsgDh7OF28rOrP2S6q/TxC8rHRQKih+umd7HIeD2es=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X/HdE4h3xHSTIPkQxV4pCg/0dQjJigN3HU/s8cHXEk9r1kNm3WqnxUkxC3GGPPb/C
	 1L3ek/ETzIlBv7wtxvFtDYa7KgUkBta/JzXPT5GCd8N/1uJ0+iUDvFhVYPvZEdmbGi
	 10mbKCCVLSCWmXi9W/DGu9jwSQMOY9B+db5H4pfL8zfQ5sP76hEIc8LCriNDIAfL0u
	 JEjHuAdmYrqo0dRSBlLL8Zo0wCJH1BLQddW4ntEFXryqgqhSW+7y6HWMk8uVM2oKrz
	 7kfP6WnN0+DAqf+4hsjo+pJDkYs3d/79esuxvYzPc4pbw+/CViWc4PNF11IPXIajT7
	 0ORe2XzUtAfzA==
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sven@kernel.org,
	j@jannau.net,
	neal@gompa.dev,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	66ton99@gmail.com,
	josemiguelo.ochoa@gmail.com,
	aditya.garg@linux.dev,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: [PATCH 2/4] Bluetooth: btbcm: clear vendor bits in LE advertising report types
Date: Wed,  4 Nov 2026 16:15:59 +0100
Message-ID: <20261104151601.70493-3-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104151601.70493-1-dev@deq.rocks>
References: <20261104151601.70493-1-dev@deq.rocks>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_071613_514983_E9772BBE 
X-CRM114-Status: GOOD (  16.54  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The BCM4364B0 of the MacBookPro15,1 (UART) and the BCM4377 of the
MacBookAir9,1 (PCIe) set bits 4, 5 and 7 of the event type in LE
Advertising Report events. btmon on the 15,1 shows types 0x10, 0x13,
0x14, 0x20, 0x23, 0x24, 0x93 and 0xa0 next to plain 0x00, 0x03 and 0x04,
the same advertiser shows up as 0x13, 0x23 and 0x03. The kernel log of
the 9,1 lists 0x10 to 0x24 and 0x80, 0x83, 0x90, 0x93, 0xa0, 0xa3.
process_adv_report() drops every type above 0x04 with "Unknown
advertising packet type", so most advertisements never reach the host.
An AirDrop sender was reported as 0x23, 0x23 and 0x13 and only the
fourth report, 0x03, reached BlueZ 32 s after the first one.

Add btbcm_fixup_le_adv_report(), which clears the bits above the type,
and call it from hci_bcm on Apple machines and from hci_bcm4377 before
the event goes to the core.

Suggested-by: Jose Miguel Ochoa <josemiguelo.ochoa@gmail.com>
Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Tested-by: Aditya Garg <aditya.garg@linux.dev>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/bluetooth/btbcm.c       | 30 ++++++++++++++++++++++++++++++
 drivers/bluetooth/btbcm.h       |  5 +++++
 drivers/bluetooth/hci_bcm.c     |  5 +++++
 drivers/bluetooth/hci_bcm4377.c |  1 +
 4 files changed, 41 insertions(+)

diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
index 0facfe62333..527a5c75fd6 100644
--- a/drivers/bluetooth/btbcm.c
+++ b/drivers/bluetooth/btbcm.c
@@ -282,6 +282,36 @@ void btbcm_set_acl_priority_on_connect(struct hci_dev *hdev, struct sk_buff *skb
 }
 EXPORT_SYMBOL_GPL(btbcm_set_acl_priority_on_connect);
 
+/* The BCM4364 and BCM4377 of the T2 Macs set bits above the event type of LE
+ * Advertising Reports, 0x13 and 0x23 for ADV_NONCONN_IND for example. The
+ * core drops reports of unknown types, so clear them.
+ */
+void btbcm_fixup_le_adv_report(struct sk_buff *skb)
+{
+	struct hci_event_hdr *hdr = (void *)skb->data;
+	struct hci_ev_le_advertising_info *info;
+	u8 *p, *end;
+	u8 num;
+
+	if (hci_skb_pkt_type(skb) != HCI_EVENT_PKT ||
+	    skb->len < HCI_EVENT_HDR_SIZE + 2 || hdr->evt != HCI_EV_LE_META)
+		return;
+
+	p = skb->data + HCI_EVENT_HDR_SIZE;
+	if (p[0] != HCI_EV_LE_ADVERTISING_REPORT)
+		return;
+
+	num = p[1];
+	p += 2;
+	end = skb->data + skb->len;
+	while (num-- && p + sizeof(*info) + 1 <= end) {
+		info = (void *)p;
+		info->type &= 0x0f;
+		p += sizeof(*info) + info->length + 1;
+	}
+}
+EXPORT_SYMBOL_GPL(btbcm_fixup_le_adv_report);
+
 int btbcm_patchram(struct hci_dev *hdev, const struct firmware *fw)
 {
 	const struct hci_command_hdr *cmd;
diff --git a/drivers/bluetooth/btbcm.h b/drivers/bluetooth/btbcm.h
index a4d47b242e9..56936e64b5f 100644
--- a/drivers/bluetooth/btbcm.h
+++ b/drivers/bluetooth/btbcm.h
@@ -60,6 +60,7 @@ int btbcm_write_pcm_int_params(struct hci_dev *hdev,
 			       const struct bcm_set_pcm_int_params *params);
 
 void btbcm_set_acl_priority_on_connect(struct hci_dev *hdev, struct sk_buff *skb);
+void btbcm_fixup_le_adv_report(struct sk_buff *skb);
 
 int btbcm_setup_patchram(struct hci_dev *hdev);
 int btbcm_setup_apple(struct hci_dev *hdev);
@@ -101,6 +102,10 @@ static inline void btbcm_set_acl_priority_on_connect(struct hci_dev *hdev,
 {
 }
 
+static inline void btbcm_fixup_le_adv_report(struct sk_buff *skb)
+{
+}
+
 static inline int btbcm_setup_patchram(struct hci_dev *hdev)
 {
 	return 0;
diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index cf4f1455cf9..1ae9619ee1e 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -148,6 +148,7 @@ struct bcm_device {
 	bool			no_uart_clock_set;
 	bool			use_autobaud_mode;
 	bool			acl_priority;
+	bool			adv_type_fixup;
 	u8			pcm_int_params[5];
 	u32			max_autobaud_speed;
 };
@@ -686,6 +687,9 @@ static int bcm_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 	struct hci_uart *hu = hci_get_drvdata(hdev);
 	struct bcm_data *bcm = hu->priv;
 
+	if (bcm->dev && bcm->dev->adv_type_fixup)
+		btbcm_fixup_le_adv_report(skb);
+
 	if (bcm->dev && bcm->dev->acl_priority)
 		btbcm_set_acl_priority_on_connect(hdev, skb);
 
@@ -1100,6 +1104,7 @@ static int bcm_get_resources(struct bcm_device *dev)
 
 	if (x86_apple_machine && !bcm_apple_get_resources(dev)) {
 		dev->acl_priority = true;
+		dev->adv_type_fixup = true;
 		return 0;
 	}
 
diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 30fcadfae3f..8d99a7a8f76 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -691,6 +691,7 @@ static void bcm4377_handle_event(struct bcm4377_data *bcm4377,
 
 	memcpy(skb_put(skb, len), payload, len);
 	hci_skb_pkt_type(skb) = type;
+	btbcm_fixup_le_adv_report(skb);
 	btbcm_set_acl_priority_on_connect(bcm4377->hdev, skb);
 	hci_recv_frame(bcm4377->hdev, skb);
 

