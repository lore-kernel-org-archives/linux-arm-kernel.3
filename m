Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0A6C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mocmJXDJEKnfV7oFOGPo60ihQF2vJnZdfE+jaX3B1Hc=; b=nKvFWrbveS+aSsy/xHNmV/zgRZ
	Ob8MLsY0Pfy0rjpEvjy2qlSsufpFa0mUMkgZwmD9dw59NVAZm9BM8fh6Dq7U2yVfJacocsUz7oFaz
	oX8dOxRp+xNghcpZbpfiRdl5ZZJsbgVFLx7cEOXCzrusUNZhcE1zUx3cZsIa7Inv/hJ6qNdvARICx
	iAddjH/MSsEtYtshtRikJ3LYkB05snHVaDcHVXjJF44LoaYvmBK84sVl6GnMVTFtZyAgU5RqxWSwu
	wzJN+dwdxsHTwYaSaj8Hi37JTv+UL1GUW3LSHjuafA9vL9J4Wx24xHd/GeAJh88Mp8sSri4AHFmgO
	eSdFmDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkWz-00000001eq4-2wmi;
	Thu, 09 Jul 2026 08:54:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkVD-00000001aXZ-3wcS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:53:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 648256136B;
	Thu,  9 Jul 2026 08:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A6A21F00A3F;
	Thu,  9 Jul 2026 08:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587183;
	bh=mocmJXDJEKnfV7oFOGPo60ihQF2vJnZdfE+jaX3B1Hc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eXJP+kPI4CtBJw/qTVOgUW5IvmoxqP4mJLKlN+E/plyEFVhwtoBYf6rrdZT2s1eOS
	 YMvF8cO3Br/fZWAFuvjOg65zfO3KvlyyLElV3rsmwzUV8UpfdKREhqsy8LZC/TJiiD
	 nDJUX8/zTVsy/S2yFVHb+znuvBXXVuIZtNQlTI9RQY3CLV0ruwPsHJye8DMoefK3Gj
	 VEFB0ujBlmJwz9p0fJc4GJrbg8YXkBytszKoeTNQbKVcQuNm9wvA+E4URSAWfgWkz1
	 5oDUzWMR9Pe9NekkQddigOYio5wAFP4I4xM1+zNbarHLXOdvBnWrAYAu+8jxsQLkLM
	 GT1s/GGgvQ+mQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:28 +0100
Subject: [PATCH v5 04/16] firmware: arm_scmi: Free transport channel on IDR
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-4-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
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
index ef41b377d3de..29c89aa4710b 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2808,6 +2808,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 			"unable to allocate SCMI idr slot err %d\n", ret);
 		/* Destroy channel and device only if created by this call. */
 		if (tdev) {
+			info->desc->ops->chan_free(prot_id, cinfo, idr);
 			of_node_put(of_node);
 			scmi_device_destroy(info->dev, prot_id, name);
 			devm_kfree(info->dev, cinfo);

-- 
2.43.0


