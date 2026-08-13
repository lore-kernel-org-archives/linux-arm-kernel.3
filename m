Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD25C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 11:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+zdQDNzy9XwsWlPqks3FdQJfc35rE02ceOkdYN/X4E=; b=wwycurXd6IKQjU/+ZcewFBqrg7
	5vMoaYy/jtCtK12VFr3MAnuQkNCgXIQcyVSHxks56qhCrK24TIB9UoSEtmZj/X6B35ulG0uBC4mod
	AW4zOq+2lIaTAFGmnXi1njCoNzU9D/+navvaVC6DMOOJMPc1dVtSbJk1wnP2AzfufBz3Xcs0t/3Uf
	yiq8vDVKwX5ty2vGSkwv3rTCOQH/oIVsOJmOo4BfKFZ/x2mAvBF6Y5UEV1SRpB9XLijYR9D7SjSwE
	pu34VzlO6NAa2T8nU6uWh/rVLtzzCRzFqrTMSuZfDBiaiOfA23388tehavgyjG7nNZ/5DOYrUqnva
	KQp/FRUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTgx-00000000YaI-39dq;
	Thu, 13 Aug 2026 11:33:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTgs-00000000YVo-201F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 11:33:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E60A6600AD;
	Thu, 13 Aug 2026 11:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09BF1F00A3A;
	Thu, 13 Aug 2026 11:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786620821;
	bh=y+zdQDNzy9XwsWlPqks3FdQJfc35rE02ceOkdYN/X4E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SRCSlI7P53oA4cwNrU5q0zW+NinY5tBKh8OsuWfm1M9+LWos/Yvr2AY1X4VA7QPEa
	 LqX4BSwLKfTXaqf49rlQXDN/E+Pbf5+hVvDTbqy4kgy3TfHe0MN0eUbp807bRmPbRB
	 AJuFeOdC6uhedFYYZf2xFdqsNgyAibiTc6pzqKMmzd3er3PJSfQjVLWG8eme5iHW33
	 Ay/AQJhV9USx2DHAsqZTepw2AFGqFXaDwgP6ifMGNYdbMe9V7VDYPFCpSRFTGZusfA
	 As60PyduvXobDk4R6yg20vo2RgxUTZZHQMSVIRScobzdzSuZbDMRJcFePpljfYw5Ux
	 wZBQ6LbgmsFhg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 13 Aug 2026 12:33:04 +0100
Subject: [PATCH v3 9/9] firmware: arm_scmi: Validate PCC shared memory
 signature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-acpi_scmi_pcc-v3-9-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15.2
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

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/transports/pcc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/pcc.c b/drivers/firmware/arm_scmi/transports/pcc.c
index 337d551e3ad8..0ead0ec77162 100644
--- a/drivers/firmware/arm_scmi/transports/pcc.c
+++ b/drivers/firmware/arm_scmi/transports/pcc.c
@@ -623,8 +623,11 @@ static void rx_callback(struct mbox_client *cl, void *m)
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
@@ -632,6 +635,11 @@ static int pcc_chan_validate_shmem(struct scmi_chan_info *cinfo,
 		return -ENOSPC;
 	}
 
+	if (ioread32(&shmem->header.signature) != valid_signature) {
+		dev_err(cinfo->dev, "invalid PCC shared memory signature\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -667,7 +675,7 @@ static int pcc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		return ret;
 	}
 
-	ret = pcc_chan_validate_shmem(cinfo, smbox);
+	ret = pcc_chan_validate_shmem(cinfo, smbox, ss_id);
 	if (ret) {
 		pcc_mbox_free_channel(smbox->pchan);
 		return ret;

-- 
2.43.0


