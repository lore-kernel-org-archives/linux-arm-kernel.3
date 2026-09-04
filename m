Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA25C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOuPtlCd89VDcYAZchLHFwi0Vkb7iBMZhE1KD8wjzZQ=; b=4BEQUf44LOrvghM1q4qnWVB+P4
	xX48DzRSMSUTaNowXJJFA2n4Vm74G2QjV4RacXyQ5HyhVjoeiB5DVl5xZ0eIiTmeB0McmeqsopKg8
	/mW9MEn96+p1RyT+B6eyFq8RNy5PKCfRne/K2qIjvaMrzW+8hbOgi37tAY0bSs37bHL6E1SZD1iUF
	xV8IjIo3H6LKh4nyY6S30AtLaDZbQbAMpye6DY7kCIymps/NjCO1A9T7xwD3UYz2SZmU2AckAjCxD
	9Fcf3NXCm2PdNLUsa0BxZT1rsL6uPM4yn5ZhtM+sxF7PYYJGFwWF7q0GuZeKC2QX8LoQN8JUPg8N4
	jqUIvoQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WKY-00000002dHv-3BRx;
	Fri, 04 Sep 2026 15:59:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WKP-00000002cqp-0b0z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:59:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A7A6342DB2;
	Fri,  4 Sep 2026 15:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B5841F00ADE;
	Fri,  4 Sep 2026 15:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537584;
	bh=YOuPtlCd89VDcYAZchLHFwi0Vkb7iBMZhE1KD8wjzZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cHzqbtu2oKa8xTV2illmQ1NwPdajzlpSOZWYJ7gb0ys0ewAN0+NyibgAYWvXIzr7+
	 ADVxK8KKXQlHhXJs0i7mL1TpJYCdwIyC+uDhygvIhVQXf/UxO/lYIK9+Fk+66ZhO8R
	 ffy7FhIJwl313SdfoBvoJGNrvfongszzGYUMXvpgSMnmmnLdXAxU9uLiz3X/KjeysE
	 Al5sKhPsoes065PBfdu/T1UKRc9Dc3RoftfFnFajSCrNEpdnFZaJXZCJ1hHG+GR8Lc
	 hcTEPKICjDFu1RCprlr9itkx/dZ/MiVMPg8TRf8KaoyOL7kNJZCHss4iv7aHRQVEga
	 iC8aa9pfxxKEw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 04 Sep 2026 16:58:00 +0100
Subject: [PATCH v4 5/9] firmware: arm_scmi: Pass protocol ID to transport
 chan_available()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi_scmi_pcc-v4-5-6ebe9755606e@kernel.org>
References: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
In-Reply-To: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
X-Mailer: b4 0.16.0
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

Pass the protocol ID to the transport chan_available() callback so a
transport can distinguish channels associated with different protocols
when they share the same firmware node. This is required by the ACPI PCC
transport to resolve protocol-exclusive PCC subspaces.

Update all transport implementations for the new callback signature.
Existing transports ignore the protocol ID, so there is no functional
change.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/common.h             | 3 ++-
 drivers/firmware/arm_scmi/driver.c             | 2 +-
 drivers/firmware/arm_scmi/transports/mailbox.c | 3 ++-
 drivers/firmware/arm_scmi/transports/optee.c   | 3 ++-
 drivers/firmware/arm_scmi/transports/smc.c     | 3 ++-
 drivers/firmware/arm_scmi/transports/virtio.c  | 3 ++-
 6 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index fdc591880c68..7fc9560dc4ea 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -207,7 +207,8 @@ struct scmi_chan_info {
  * @poll_done: Callback to poll transfer status
  */
 struct scmi_transport_ops {
-	bool (*chan_available)(struct fwnode_handle *fwnode, int idx);
+	bool (*chan_available)(struct fwnode_handle *fwnode, int prot_id,
+			       int idx);
 	int (*chan_setup)(struct scmi_chan_info *cinfo, struct device *dev,
 			  bool tx);
 	int (*chan_free)(int id, void *p, void *data);
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 51829550636f..4fbedd9be852 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2768,7 +2768,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct fwnode_handle *fwnode,
 	if (idr_find(idr, prot_id))
 		return -EEXIST;
 
-	if (!info->desc->ops->chan_available(fwnode, idx)) {
+	if (!info->desc->ops->chan_available(fwnode, prot_id, idx)) {
 		cinfo = idr_find(idr, SCMI_PROTOCOL_BASE);
 		if (unlikely(!cinfo)) /* Possible only if platform has no Rx */
 			return -EINVAL;
diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index b692cae4ff25..56af2cb0f424 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -77,7 +77,8 @@ static void rx_callback(struct mbox_client *cl, void *m)
 		      core->shmem->read_header(smbox->shmem), NULL);
 }
 
-static bool mailbox_chan_available(struct fwnode_handle *fwnode, int idx)
+static bool
+mailbox_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
 {
 	int num_mb;
 	struct device_node *of_node = to_of_node(fwnode);
diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
index 07d3affa0964..6022f74d28f3 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -314,7 +314,8 @@ static int invoke_process_msg_channel(struct scmi_optee_channel *channel, size_t
 	return 0;
 }
 
-static bool scmi_optee_chan_available(struct fwnode_handle *fwnode, int idx)
+static bool
+scmi_optee_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
 {
 	u32 channel_id;
 	struct device_node *of_node = to_of_node(fwnode);
diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm_scmi/transports/smc.c
index 4a4caeb4be31..7fb2736247a3 100644
--- a/drivers/firmware/arm_scmi/transports/smc.c
+++ b/drivers/firmware/arm_scmi/transports/smc.c
@@ -84,7 +84,8 @@ static irqreturn_t smc_msg_done_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static bool smc_chan_available(struct fwnode_handle *fwnode, int idx)
+static bool
+smc_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
 {
 	struct device_node *of_node = to_of_node(fwnode);
 
diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
index 6b060d61e0ca..3d608c8c4fe8 100644
--- a/drivers/firmware/arm_scmi/transports/virtio.c
+++ b/drivers/firmware/arm_scmi/transports/virtio.c
@@ -375,7 +375,8 @@ static unsigned int virtio_get_max_msg(struct scmi_chan_info *base_cinfo)
 	return vioch->max_msg;
 }
 
-static bool virtio_chan_available(struct fwnode_handle *fwnode, int idx)
+static bool
+virtio_chan_available(struct fwnode_handle *fwnode, int prot_id, int idx)
 {
 	struct scmi_vio_channel *channels, *vioch = NULL;
 

-- 
2.43.0


