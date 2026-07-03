Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3F7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXSeNRPQkVlVy8DAuJOJGO898fvDtnoZKP7XJxfcRpg=; b=t6QAs8zwSOPM0caMjONMARqK/J
	UwCEgtASsX1TWSTJuQTQghOTNHHz2wGYvPpF6bOBQbFXQh/CemXRzHg0EnM5Qx18o369FO7jxmOzb
	hQUNE3DACEHuB2oM72ob+0KKdgUM9pK1mlMLyqRBKgLUIwxwvIKSHZfkxhEsJcjKrd9xfE3LD1u3W
	rg4DQzctQCWvd0lHaBdjP+1GApmsXVn8fF4TQaE4oJoc8HX9LrquNIs1jNAKjBgjo39V+6CORk8tE
	lZdjqQuiIUfQQFLsanhy0wVGYjHkNkp9pPYck3ak5BVAihbjrTe+TlVRaaTzykIdXpB6GTTxru6Y5
	VI0u1GDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkSF-00000007qVJ-1kJY;
	Fri, 03 Jul 2026 20:25:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkS9-00000007qNr-3rRM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:25:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A91BD41470;
	Fri,  3 Jul 2026 20:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062DA1F000E9;
	Fri,  3 Jul 2026 20:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110337;
	bh=zXSeNRPQkVlVy8DAuJOJGO898fvDtnoZKP7XJxfcRpg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TJRTCMAWLhIR1wrTquysX7nfDb4cXXlQp/0sj67KDjgDnU4sTeOB2XRa2wzoYw6mI
	 Z7H1gw/cCSk+55vfkoEaQafIshw6avgaYl/8xHIeL/CVtaadhhVk5dw40NcNTdFYBz
	 fA0ghqDt3zO0GBjXMBeDc6z8AyxzBvIs+MzGMTUUIu+3UQdBxHJH7ClErNTjtze6C/
	 Dd7mChDUnmKczlKEm2/t3QynSSKJ2GMnXW80+LWIbto+mPIXqeNKGr3YV3KXy3ZYUJ
	 FSjLZf59dOtv7v70MjXv0SlM19mA+Y2q0tTAOyTjKDb/jDeLMpVi4jJ4KhwgzuI3/1
	 ieIeu/TLd+ElA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:46 +0100
Subject: [PATCH v3 10/17] firmware: arm_scmi: Avoid IDR updates while
 cleaning channels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-10-5bae9766abfc@kernel.org>
References: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
In-Reply-To: <20260703-scmi_core_fixes-v3-0-5bae9766abfc@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
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

scmi_cleanup_channels() walks the TX/RX channel IDRs with
idr_for_each() to free transport resources and destroy the dedicated
transport devices before calling idr_destroy().

The destroy callback removed each entry from the same IDR being walked.
That is not needed for this cleanup path, and it is unsafe because
idr_for_each() has not advanced its radix-tree iterator while the
callback is running. Removing the current entry from the callback can
invalidate the iterator state. The callback also cannot be protected by
rcu_read_lock(), because scmi_device_destroy() may sleep.

Leave IDR teardown to the following idr_destroy() call and keep the
callback limited to device destruction.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index a575e661f1e2..ae4b7128276b 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2886,7 +2886,7 @@ static int scmi_channels_setup(struct scmi_info *info)
 	return 0;
 }
 
-static int scmi_chan_destroy(int id, void *p, void *idr)
+static int scmi_chan_destroy(int id, void *p, void *data)
 {
 	struct scmi_chan_info *cinfo = p;
 
@@ -2898,8 +2898,6 @@ static int scmi_chan_destroy(int id, void *p, void *idr)
 		cinfo->dev = NULL;
 	}
 
-	idr_remove(idr, id);
-
 	return 0;
 }
 

-- 
2.43.0


