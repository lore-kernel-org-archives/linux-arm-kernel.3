Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD09E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 03:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUZspnxInoGy784xhYR1q47914Jrd+G34f1ewTVp/qQ=; b=kSGYW3bDYbTtb2c3fT3pR0g/Tv
	r7dXNtmH3Qxqtgp/Up/rTBwT9z0Eq+9l+27kbh8M6BUywslwazujhbOD5A+SIHAc7+tkcck35foe6
	fItztiM1xbbiEqKWcT1b/lQuFli4RA9eKN0OdLH1K/GanVxydVfvC07mYWhjXtqJTBxZNoPCe2luT
	D8ZpQHojzSx3rK10c3Eucv5spkMd6mnH5HnQ4pLZZ4EROvjjiiBeYD9W4roK+h0AL6uSiTPJDnb2v
	C5CHKRoduogDIpeqI1ROktxwflfgqlLUIET4uO12dEuSH0KbRao721WB/t38VB+4AjRQB5e37dotZ
	g8vvLFPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS6nK-00000004Szk-2p38;
	Mon, 30 Dec 2024 03:50:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tS6jq-00000004SV4-1yqa;
	Mon, 30 Dec 2024 03:46:43 +0000
X-UUID: ab9a32a6c66011ef9048ed6ed365623b-20241229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mUZspnxInoGy784xhYR1q47914Jrd+G34f1ewTVp/qQ=;
	b=DmABF2KUtJ8rni4TaFPSxDogW4sg+oVv7fdSLNCzYkRrFJaX085BcnS4kEQoe8AtthL1GjNJ16tAZaRd3w0kmDowiHKnDod79VJx/BC5HRA1Sww+ak/c6ayt6r0OBOc56ZZKPu70fIxUFa4egPx/kohIllpMG1pi8jcvjscHAVY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:735fad44-463e-4cf9-9a92-0c6b15a8faa1,IP:0,U
	RL:0,TC:0,Content:33,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:8
X-CID-META: VersionHash:60aa074,CLOUDID:6df26125-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:3|50,EDM:1,
	IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ab9a32a6c66011ef9048ed6ed365623b-20241229
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <karl.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1670579879; Sun, 29 Dec 2024 20:46:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Dec 2024 11:46:33 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Dec 2024 11:46:33 +0800
From: Karl.Li <karl.li@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Karl Li <Karl.Li@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Chungying Lu <chungying.lu@mediatek.com>, Chien-Chih Tseng
	<Chien-Chih.Tseng@mediatek.com>, Andy Teng <Andy.Teng@mediatek.com>, "Chen-Yu
 Tsai" <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Karl Li
	<karl.li@mediatek.com>
Subject: [PATCH v2 2/3] mailbox: add support for bottom half received data
Date: Mon, 30 Dec 2024 11:43:36 +0800
Message-ID: <20241230034446.1195728-3-karl.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241230034446.1195728-1-karl.li@mediatek.com>
References: <20241230034446.1195728-1-karl.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_194642_517542_EEB6A9BC 
X-CRM114-Status: GOOD (  21.46  )
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

From: Karl Li <karl.li@mediatek.com>

Within the MediaTek APU subsystem, a message passing mechanism
is constructed on top of the mailbox system.

The mailbox only has limited space for each message. The MTK APU firmware
expects the message header from the mailbox, while the message body
is passed through some fixed shared memory.

The mailbox interrupt also serves as a mutex for the shared memory.
Thus the interrupt may only be cleared after the message is handled.

To be specific, the MTK APU firmware fills the message body into a
fixed shared memory, while passing the message header via a mailbox.

 ---------------        ---------------        ---------
| Kernel Buffer |  <-  | Shared Memory |  <-  | MTK APU |
 ---------------        ---------------        ---------

The top-half handler first copies the data from the shared memory to the
kernel buffer. Subsequently, the bottom-half handler uses the data
in the kernel buffer for specific processing tasks.

However, it is possible for the MTK APU to send a new message while
the kernel is still processing the previous one. In such cases,
the top-half handler may overwrite the kernel buffer while the data is
still needed, leading to a race condition.

Additionally, due to performance considerations, we cannot allocate a new
kernel buffer for each message.

To prevent this, we need a mechanism to protect the kernel buffer from
such race conditions. Since we cannot use locks to protect the kernel
buffer in an atomic context, we use the mailbox interrupt as a mutex for
the shared memory to further protect our kernel buffer. Therefore,
we clear the interrupt only after the message is handled.

Since the bottom half callback might need to go to sleep, we require a
sleepable callback for mailbox clients.

This patch adds a new sleepable RX callback for mailbox clients for cases
where handling the incoming message requires sleeping.

Signed-off-by: Karl Li <karl.li@mediatek.com>
---
 drivers/mailbox/mailbox.c          | 16 ++++++++++++++++
 include/linux/mailbox_client.h     |  2 ++
 include/linux/mailbox_controller.h |  1 +
 3 files changed, 19 insertions(+)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index d3d26a2c9895..d58a77fcf804 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -164,6 +164,22 @@ void mbox_chan_received_data(struct mbox_chan *chan, void *mssg)
 }
 EXPORT_SYMBOL_GPL(mbox_chan_received_data);
 
+/**
+ * mbox_chan_received_data_bh - A way for controller driver to push data
+ *				received from remote to the upper layer.
+ * @chan: Pointer to the mailbox channel on which RX happened.
+ * @mssg: Client specific message typecasted as void *
+ *
+ * For the operations which is not atomic can be called from
+ * mbox_chan_received_data_bh().
+ */
+void mbox_chan_received_data_bh(struct mbox_chan *chan, void *mssg)
+{
+	if (chan->cl->rx_callback_bh)
+		chan->cl->rx_callback_bh(chan->cl, mssg);
+}
+EXPORT_SYMBOL_GPL(mbox_chan_received_data_bh);
+
 /**
  * mbox_chan_txdone - A way for controller driver to notify the
  *			framework that the last TX has completed.
diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
index 734694912ef7..2cc6fa4e1bf9 100644
--- a/include/linux/mailbox_client.h
+++ b/include/linux/mailbox_client.h
@@ -22,6 +22,7 @@ struct mbox_chan;
  *			if the client receives some ACK packet for transmission.
  *			Unused if the controller already has TX_Done/RTR IRQ.
  * @rx_callback:	Atomic callback to provide client the data received
+ * @rx_callback_bh:	Non-atomic callback to provide client the data received
  * @tx_prepare: 	Atomic callback to ask client to prepare the payload
  *			before initiating the transmission if required.
  * @tx_done:		Atomic callback to tell client of data transmission
@@ -33,6 +34,7 @@ struct mbox_client {
 	bool knows_txdone;
 
 	void (*rx_callback)(struct mbox_client *cl, void *mssg);
+	void (*rx_callback_bh)(struct mbox_client *cl, void *mssg);
 	void (*tx_prepare)(struct mbox_client *cl, void *mssg);
 	void (*tx_done)(struct mbox_client *cl, void *mssg, int r);
 };
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 6fee33cb52f5..74c6a31cd313 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -130,6 +130,7 @@ struct mbox_chan {
 int mbox_controller_register(struct mbox_controller *mbox); /* can sleep */
 void mbox_controller_unregister(struct mbox_controller *mbox); /* can sleep */
 void mbox_chan_received_data(struct mbox_chan *chan, void *data); /* atomic */
+void mbox_chan_received_data_bh(struct mbox_chan *chan, void *data); /* can sleep */
 void mbox_chan_txdone(struct mbox_chan *chan, int r); /* atomic */
 
 int devm_mbox_controller_register(struct device *dev,
-- 
2.18.0


