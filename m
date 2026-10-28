Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4AD606A338
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bu3M3ke8;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ekheVcs7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zPK9LILFjexdlBU3mSIOr4yYqwU8LVdHM+h1yrkhU1c=; b=Bu3M3ke8/XovrFk0qGK2S7LBFt
	sM5uYy3eagdpcflJNiDkHwl07bxC2X8sWZBYKF/2A1x93VyqNRy8xSQgYheIBTzeICnJ/xmbyKUll
	5HC2BepGqtU5MKjfT+vAncjGSAqAnAtvKwbKQBDktN7oYBOlIIvjSyPTBteJGGXkX27TYKfPhwEGd
	aPrrd6AOchVMOnefXxppjKmQtm4TqUAF/vXlvBpErJ4NEhkcvbKSscDzjucLsXkNMeC7vrDL5iK8w
	hULeyUcpl6SOrFpKGy3AWnMwzbKdrigmInjwhlEU4UG8EZxgJVnlyWm+IIx10yPCRLqFi+728wBAm
	OTv4lU1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5dJ-00000007Oew-3YIM;
	Wed, 28 Oct 2026 15:32:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5dH-00000007Odk-4C7p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 15:32:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F26C43A2C;
	Wed, 28 Oct 2026 15:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528F81F031E0;
	Wed, 28 Oct 2026 15:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793201527;
	bh=zPK9LILFjexdlBU3mSIOr4yYqwU8LVdHM+h1yrkhU1c=;
	h=From:To:Cc:Subject:Date;
	b=ekheVcs7bw78LgWdCQwxnl1nbpH7CZ5C7bAOCNHoIPezAN9z60XZ1U7IjtEGMYmn/
	 hHm5rnXk8GGrtwgqWZ8YpSgVKYwdjRpqY4nnzQ6As/GqiV1+vGANs5jlbMMf5z7kPt
	 jcJNeMYtOm6LlQCbu4fMBSA1Hemj8qe66Iw1Wm9z27xkJkLFTTeE9Npe1X0UvYaytn
	 fUDvQRqWAxSMZgjwcfHWCCnCxdVyTI3qIFrQpaBLN3OJ9MEUc3CwsIqoHClZFDdokF
	 7l5RdXIRdGodPvkACkqCRd2XSIjiWGHM9BtTsArBwf+A4OdxDyT/XHy982JjTNvtHx
	 gG28OkqBj6ZQg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] firmware: arm_scmi: Free mailbox state on mapping failure
Date: Wed, 28 Oct 2026 15:32:03 +0000
Message-ID: <20261028153203.3305067-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

mailbox_chan_setup() allocates its private state from the SCMI base
device before mapping the shared-memory area. If mapping fails while
setting up an optional RX channel, the core ignores the RX failure and
keeps the base device bound, retaining that devres allocation.

Release the private mailbox state before returning the mapping error.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-fda9bcb5-8255-4157-bbf7-d720bbd86605
Fixes: 1ebc28e9357c ("firmware: arm_scmi: Introduce setup_shmem_iomap")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/transports/mailbox.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index 56af2cb0f424..49c472e2ba27 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -206,8 +206,11 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 
 	smbox->shmem = core->shmem->setup_iomap(cinfo, dev, tx, NULL,
 						&smbox->io_ops);
-	if (IS_ERR(smbox->shmem))
-		return PTR_ERR(smbox->shmem);
+	if (IS_ERR(smbox->shmem)) {
+		ret = PTR_ERR(smbox->shmem);
+		devm_kfree(dev, smbox);
+		return ret;
+	}
 
 	cl = &smbox->cl;
 	cl->dev = cdev;
-- 
2.43.0


