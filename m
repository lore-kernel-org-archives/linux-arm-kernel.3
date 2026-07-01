Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033CEC43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJ0jOkL1ltEZQTlEuZlzOaSUuaAoYiJSzKQRTPeitxg=; b=rZl0z++/0hOkE/j9FxzQtcfwXb
	Jx2knZO6bkZOsW111Arq9BLGc1BHGEz9gSJo7tIuC6pD/7LA2sbCDipuhrj9Xy/mT3d0eexLzdaCu
	f+wtuxt8dh62wfHHaxbeH19vqjgqzIwlg2XCCB9+TCdQdvNAPE+q5RCQCclNZsFkSmLsDNyO7lSvx
	FXsJmfKxZTUcPI4QDChBrYUzFCNQeT86GnwnEFNJ3rffaqG/+mFz6JMRNJOsIgTJJL4RQw5sksWd5
	DmVuCP3LsqZd/Ak/WotaN441mLaPQQ1qmO1nW4zgJ9oXnnHcQCrUVHimc4dMqjqZQZ5vWjQR2GeSH
	tQ1P/dsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBh-00000002b4u-3Kko;
	Wed, 01 Jul 2026 16:53:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBe-00000002b0a-1JEO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:53:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BE5056001D;
	Wed,  1 Jul 2026 16:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03561F000E9;
	Wed,  1 Jul 2026 16:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924801;
	bh=qJ0jOkL1ltEZQTlEuZlzOaSUuaAoYiJSzKQRTPeitxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OwCeExYiTHlG46qCJDjUJ27Zo4xF69kGm8hR8p5/vnNF2uWsG1SGzEm9ifjCUBwhX
	 mNvqrxLYj614e7yKldV8JDGIRRNeSnPtzR8HsJbtbErjVfKBV3jKh1Hxj1GVe37PiW
	 h2nC39UBAWBD5eZYCY0iP0FOxglNTp1UVwzIZsVCVG0xppkRzTR83kULi8q5tNesgW
	 jWP3DCoHQQIly+bjrt9o95kT6wdlorepxNogH11VptLL2TjP/vOtJDZxFkra/CIo0y
	 Jf4/hLumB5cUcmdPQP/n0jsHEoNZyF+r71j28qeFwQUpQLA3ibzXo3Xb3/Y+o90MfM
	 tsvLZBnpGEEZw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:26 +0100
Subject: [PATCH v2 05/14] firmware: arm_scmi: Free transport channel on IDR
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-5-1f5e85553f73@kernel.org>
References: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
In-Reply-To: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
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


