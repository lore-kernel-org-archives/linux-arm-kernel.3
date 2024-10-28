Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDB7D1359D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNSrP49ZH8ytm8NHDPfyYi/0pmdfxKvl6lwV271NMrY=; b=I3y5MInAChRaqKvnth10LE7HVH
	wo2zPmDuTYnac9aUJEEyZT2jKkQOz4c0MCWfr1PQ8JCNAjeOWTZbxnBOS3IlSc6bINIHnKZtmcd8m
	vwuhlKIS1SgHSkmqLBjtnvcfWhF7c2vBr8lEuwF66z72BLdP7wlK8cywfF40utxDXBrhRHs1CoFZs
	IJAMUpx17z3A2F1Q4KxT3/9qEXl+5XEE9HHQ4XJW7Jlfyr+y+x3sIpEgqtIYq2T8CfW5q5tfx7joM
	IJCWFUDr+ToXLYoOn/+xzP+zlJhTvfg4EwNPtFUkF4aaGcY0UFDLJ5LA4f1JU7PpHEdqZTvTapU4A
	yrARORVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5OWd-0000000AgHl-2L9N;
	Mon, 28 Oct 2024 12:07:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ORn-0000000Af0W-1QOz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 12:02:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB79B1691;
	Mon, 28 Oct 2024 05:02:40 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 190AB3F73B;
	Mon, 28 Oct 2024 05:02:08 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	quic_nkela@quicinc.com,
	dan.carpenter@linaro.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [PATCH v3 2/7] firmware: arm_scmi: Calculate virtio PDU max size dynamically
Date: Mon, 28 Oct 2024 12:01:46 +0000
Message-ID: <20241028120151.1301177-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028120151.1301177-1-cristian.marussi@arm.com>
References: <20241028120151.1301177-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_050211_493232_380328BC 
X-CRM114-Status: GOOD (  12.94  )
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

SCMI virtio transport maximum PDU size is currently hardcoded at build
time; this will not play well with the possibile retrieval of a different
size at run-time.

Make the virtio transport derive the maximum PDU size from the max_msg_size
provided by the SCMI core.

No functional change.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/transports/virtio.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
index d349766bc0b2..41aea33776a9 100644
--- a/drivers/firmware/arm_scmi/transports/virtio.c
+++ b/drivers/firmware/arm_scmi/transports/virtio.c
@@ -32,8 +32,8 @@
 
 #define VIRTIO_MAX_RX_TIMEOUT_MS	60000
 #define VIRTIO_SCMI_MAX_MSG_SIZE 128 /* Value may be increased. */
-#define VIRTIO_SCMI_MAX_PDU_SIZE \
-	(VIRTIO_SCMI_MAX_MSG_SIZE + SCMI_MSG_MAX_PROT_OVERHEAD)
+#define VIRTIO_SCMI_MAX_PDU_SIZE(ci) \
+	((ci)->max_msg_size + SCMI_MSG_MAX_PROT_OVERHEAD)
 #define DESCRIPTORS_PER_TX_MSG 2
 
 /**
@@ -90,6 +90,7 @@ enum poll_states {
  * @input: SDU used for (delayed) responses and notifications
  * @list: List which scmi_vio_msg may be part of
  * @rx_len: Input SDU size in bytes, once input has been received
+ * @max_len: Maximumm allowed SDU size in bytes
  * @poll_idx: Last used index registered for polling purposes if this message
  *	      transaction reply was configured for polling.
  * @poll_status: Polling state for this message.
@@ -102,6 +103,7 @@ struct scmi_vio_msg {
 	struct scmi_msg_payld *input;
 	struct list_head list;
 	unsigned int rx_len;
+	unsigned int max_len;
 	unsigned int poll_idx;
 	enum poll_states poll_status;
 	/* Lock to protect access to poll_status */
@@ -234,7 +236,7 @@ static int scmi_vio_feed_vq_rx(struct scmi_vio_channel *vioch,
 	unsigned long flags;
 	struct device *dev = &vioch->vqueue->vdev->dev;
 
-	sg_init_one(&sg_in, msg->input, VIRTIO_SCMI_MAX_PDU_SIZE);
+	sg_init_one(&sg_in, msg->input, msg->max_len);
 
 	spin_lock_irqsave(&vioch->lock, flags);
 
@@ -439,9 +441,9 @@ static int virtio_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		if (!msg)
 			return -ENOMEM;
 
+		msg->max_len = VIRTIO_SCMI_MAX_PDU_SIZE(cinfo);
 		if (tx) {
-			msg->request = devm_kzalloc(dev,
-						    VIRTIO_SCMI_MAX_PDU_SIZE,
+			msg->request = devm_kzalloc(dev, msg->max_len,
 						    GFP_KERNEL);
 			if (!msg->request)
 				return -ENOMEM;
@@ -449,8 +451,7 @@ static int virtio_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 			refcount_set(&msg->users, 1);
 		}
 
-		msg->input = devm_kzalloc(dev, VIRTIO_SCMI_MAX_PDU_SIZE,
-					  GFP_KERNEL);
+		msg->input = devm_kzalloc(dev, msg->max_len, GFP_KERNEL);
 		if (!msg->input)
 			return -ENOMEM;
 
-- 
2.47.0


