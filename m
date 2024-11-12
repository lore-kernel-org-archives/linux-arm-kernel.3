Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458E7D32D8F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 10:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YKWIe9MnX22iPbV9XTdcAuMqsg4dFZZTfBp9xq4V2A=; b=RI3Rg2f39SYF8YAsns8ZFOiqFu
	IsMWTewyQnSaWEa8q/6S5qMnXsHC6GKMchYlEgdPDgrE6xtsnRoaLl3gRKbxwyfGq2TPvNmsYB+Z5
	PH2aNIRIpMwRodg3/ft9QA0dvMRfwc3dz2HhpWZt1gRDvl+91Cg3+JFkvQ83u9D4+ipb6a14taEzC
	gDCaL5mMGt214HxWiOuA/YezcF/QM++Kc2QNkRcpfKVibYbdwwlSkg5JNXXsNXSyh+TNbp+GPqcO3
	jrMxs5PMbZXJibVu3JYrcionmvIwGfO0d1s0W3ochhornMcWJyFoEpvmYbKQsP0eWVcWRtg1Yh6fe
	UZeja+fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoaH-000000038SW-3SqG;
	Tue, 12 Nov 2024 10:57:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoGO-000000034IU-1m0O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:36:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D783A4192F;
	Tue, 12 Nov 2024 10:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE54EC4CED4;
	Tue, 12 Nov 2024 10:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407807;
	bh=hUbS/ZJ6YPF2GQ/J2PZx9O/TNmMSuETAVHSQTSDP0Ac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dEgtbRK+PdcO7US83LifW/8L57tLy1LeXxuKxhxvcMpNgRg5yKldqdons/4FNh3Nu
	 afgzj5slCXwleXKnYl+4EzYyNbvOk0e2zp5In/XuaqdoGi7YsxTGGqWKKyPzQ1Q5tO
	 JUgj5tcZwA10j8PlSvc5KKH1QVzAkwer6UVV0fIp2K829bROUCHaBI1f83ZcJcEN7e
	 0tvi8bq//+0D0t5qdoSlkN76WZaO9tb33bvHfKt+cZjoSO6yuskUN0g+7my4fwIZM5
	 43yaFmzzif/opmw7RBBd5WNoKthNLNqhM1PqhNOZT0EiJH4m8nFxGU9nW+xk2PF+ww
	 EU6K/fxjF9KgA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 02/15] firmware: arm_scmi: Reject clear channel request on A2P
Date: Tue, 12 Nov 2024 05:36:23 -0500
Message-ID: <20241112103643.1653381-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112103643.1653381-1-sashal@kernel.org>
References: <20241112103643.1653381-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.60
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_023648_718214_01931602 
X-CRM114-Status: GOOD (  14.08  )
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

From: Cristian Marussi <cristian.marussi@arm.com>

[ Upstream commit a0a18e91eb3a6ef75a6de69dc00f206b913e3848 ]

The clear channel transport operation is supposed to be called exclusively
on the P2A channel from the agent, since it relinquishes the ownership of
the channel to the platform, after this latter has initiated some sort of
P2A communication.

Make sure that, if it is ever called on a A2P, is logged and ignored.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Message-Id: <20241021171544.2579551-1-cristian.marussi@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/firmware/arm_scmi/common.h | 2 ++
 drivers/firmware/arm_scmi/driver.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 00b165d1f502d..039f686f4580d 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -163,6 +163,7 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id);
  *      used to initialize this channel
  * @dev: Reference to device in the SCMI hierarchy corresponding to this
  *	 channel
+ * @is_p2a: A flag to identify a channel as P2A (RX)
  * @rx_timeout_ms: The configured RX timeout in milliseconds.
  * @handle: Pointer to SCMI entity handle
  * @no_completion_irq: Flag to indicate that this channel has no completion
@@ -174,6 +175,7 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id);
 struct scmi_chan_info {
 	int id;
 	struct device *dev;
+	bool is_p2a;
 	unsigned int rx_timeout_ms;
 	struct scmi_handle *handle;
 	bool no_completion_irq;
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3962683e2af9d..efa9698c876a0 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -855,6 +855,11 @@ static inline void scmi_xfer_command_release(struct scmi_info *info,
 static inline void scmi_clear_channel(struct scmi_info *info,
 				      struct scmi_chan_info *cinfo)
 {
+	if (!cinfo->is_p2a) {
+		dev_warn(cinfo->dev, "Invalid clear on A2P channel !\n");
+		return;
+	}
+
 	if (info->desc->ops->clear_channel)
 		info->desc->ops->clear_channel(cinfo);
 }
@@ -2319,6 +2324,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 	if (!cinfo)
 		return -ENOMEM;
 
+	cinfo->is_p2a = !tx;
 	cinfo->rx_timeout_ms = info->desc->max_rx_timeout_ms;
 
 	/* Create a unique name for this transport device */
-- 
2.43.0


