Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AC1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJ0jOkL1ltEZQTlEuZlzOaSUuaAoYiJSzKQRTPeitxg=; b=Ns2GB674h6JIUcjin1MwsH/WHJ
	86w+PQ3eHhPlSholoQyU7biHgyrxggAt7qy6Dqx7eKfX30dP9XmFmD+AKCkstEtFgkBCtt+DFVQ/1
	bAm40mIb/tne4Ik8X3GOSCH9mZ57WPGbJrNfrXVj83Z2FXZ1bXhjzwlXWVjf1NYaXuTgK4KSAecSz
	MLtQfCBN5UNJ4qRJ6up011jllRB6W0bs0Y+KuUq1CnoHdBhGWvEIhZe+DQeA0bwIJKTcOMU4XQrN4
	yw4Jey5WvrGY5gFM9GsveYqvMDZU6AwpiIm3KRclajD8LwHC9gdChF3wxYp6UlsOfCVjW8FXdac0a
	GLNAMeCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUQb-0000000GLFl-2drc;
	Tue, 30 Jun 2026 09:06:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUQV-0000000GLDB-3IW7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:06:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 39F9D60008;
	Tue, 30 Jun 2026 09:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E401F00A3D;
	Tue, 30 Jun 2026 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782810402;
	bh=qJ0jOkL1ltEZQTlEuZlzOaSUuaAoYiJSzKQRTPeitxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WGCIw609F1yhPJybhUKjkF98qFrccLPSi3TKVivPgJ8Bg3bUgLEEoFrBrmUBjDY4x
	 Q68cCxV+CaV9DjUPVYM+1E+q16uecAr6ajFLjm5YnjI733qiCNNaXJuY/fsdVNdx9B
	 nAGypQLFBJr5iZ9Pg7EdGhceFeX0e5Pz5kQ0S2b1ZdYscvscb6EXKQIlz5cQ46lojo
	 AuHwgzkuZyjoZmsJhIhs+aWrSNUQnY+iQaWr/9q0XZ8nBlrsCQT4tCXV0VzDdtgn+o
	 SqNvD+QAQX9XkzEy2LMU0sCv6pOB5VNXa4Chn7qql2X584nq42VUBjvgjhtxRY20p/
	 ybBsMpo3z+jHw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 30 Jun 2026 10:06:01 +0100
Subject: [PATCH 5/9] firmware: arm_scmi: Free transport channel on IDR
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-scmi_core_fixes-v1-5-f932c1e51992@kernel.org>
References: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
In-Reply-To: <20260630-scmi_core_fixes-v1-0-f932c1e51992@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Sashiko <sashiko-bot@kernel.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
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

If transport channel setup succeeds but the following IDR insertion fails,
the error path destroys the transport device and frees the channel info
without invoking the transport cleanup callback.

Call chan_free() before destroying the device so transport specific
resources such as IRQs, mailbox channels and mapped shared memory are
released consistently with the normal teardown path.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 861087b2920e..4b369b003003 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2808,6 +2808,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 			"unable to allocate SCMI idr slot err %d\n", ret);
 		/* Destroy channel and device only if created by this call. */
 		if (tdev) {
+			info->desc->ops->chan_free(prot_id, cinfo, idr);
 			scmi_device_destroy(info->dev, prot_id, name);
 			devm_kfree(info->dev, cinfo);
 		}

-- 
2.43.0


