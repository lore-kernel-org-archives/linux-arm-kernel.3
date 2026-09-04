Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F71AC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOvbMkTzydFknS4iiHuLQpioDhMp+4T6jEUvQZ9DkZ0=; b=n7tOoThH7UNnUudXo6IOz3KGFS
	33laGW/d1XT3aQ5J+MjpGFENHdeENcKugtobGvJDD8gccE773YY4uckqL+erBxrDIruKcBj+fiT/W
	8wV8O6UnbiRXne6S+FB7jAC/rIrXtF7719JGFRYNpv/J0qn7AO/rUjskC7ZrQm2LpruGOHt5od9Xf
	T8rENd2Jw2qTzrMizS5RQ6vXi9k44Ys9vqyVPCkqLGY+WLKyoVhzJJHXTfWGzDxQM9/B4+zAuU8iu
	6aK3xz0Ll94tnw+PFzmJW0DZ/WaXAHjjfzZgAvhhSs00vIYo9DUu8UfE2pyQnmkheVcGZ4+i/ctKF
	ItddDgxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WKp-00000002drb-2fQC;
	Fri, 04 Sep 2026 16:00:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WKU-00000002d4y-3fj5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:59:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0AB60601FB;
	Fri,  4 Sep 2026 15:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0691F00AC4;
	Fri,  4 Sep 2026 15:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537589;
	bh=SOvbMkTzydFknS4iiHuLQpioDhMp+4T6jEUvQZ9DkZ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Jkm5HAkqM4BaGePoxSsfteNzLegcHEA9zs7nKEAWjTfTph/p8LlRvDGNqReDoU0TE
	 zyXxaK6GDzNO8vpvwee9Nj0qoPTZ9nMY8oNCQBXC2+SLnBG3Y4id2VbfN+vEro677+
	 ySeqyAIWty8BQDoH5BRrqR1LQmq2FeWcNA3balnLE+PBM2SBwIgj0I8oCmtJVnQK21
	 zOBq1yeJx8fsCRfXISw80LmWGN1icw+oM0f5NYsx9ULCrQf7oCmumEOKmqktiTySSq
	 524iK2lMkubnPXodg9lWn8ZBKRfONkVkbfo/MzVVqOdXucEvzTmbqlnRVo0XlRti/Q
	 aHRNKTfdYfp5g==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 04 Sep 2026 16:58:04 +0100
Subject: [PATCH v4 9/9] firmware: arm_scmi: Validate PCC shared memory
 signature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi_scmi_pcc-v4-9-6ebe9755606e@kernel.org>
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

Validate the PCC shared memory signature when setting up an SCMI PCC
channel.

Reject channels whose shared memory signature does not encode
PCC_SIGNATURE combined with the PCC subspace ID, so misconfigured
firmware is caught before the transport starts using the shared memory
region.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/transports/pcc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/pcc.c b/drivers/firmware/arm_scmi/transports/pcc.c
index b7501f980d0b..86d4a097d8ec 100644
--- a/drivers/firmware/arm_scmi/transports/pcc.c
+++ b/drivers/firmware/arm_scmi/transports/pcc.c
@@ -698,8 +698,11 @@ static void rx_callback(struct mbox_client *cl, void *m)
 }
 
 static int pcc_chan_validate_shmem(struct scmi_chan_info *cinfo,
-				   struct scmi_pcc *smbox)
+				   struct scmi_pcc *smbox, int ss_id)
 {
+	struct pcc_shared_mem __iomem *shmem = smbox->pchan->shmem;
+	u32 valid_signature = ss_id + PCC_SIGNATURE;
+
 	if (smbox->pchan->shmem_size < SCMI_PCC_SHMEM_OVERHEAD ||
 	    smbox->pchan->shmem_size - SCMI_PCC_SHMEM_OVERHEAD <
 	    cinfo->max_msg_size) {
@@ -707,6 +710,11 @@ static int pcc_chan_validate_shmem(struct scmi_chan_info *cinfo,
 		return -ENOSPC;
 	}
 
+	if (ioread32(&shmem->header.signature) != valid_signature) {
+		dev_err(cinfo->dev, "invalid PCC shared memory signature\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -742,7 +750,7 @@ static int pcc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		return ret;
 	}
 
-	ret = pcc_chan_validate_shmem(cinfo, smbox);
+	ret = pcc_chan_validate_shmem(cinfo, smbox, ss_id);
 	if (ret) {
 		pcc_mbox_free_channel(smbox->pchan);
 		return ret;

-- 
2.43.0


