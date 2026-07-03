Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B61C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJ0jOkL1ltEZQTlEuZlzOaSUuaAoYiJSzKQRTPeitxg=; b=dcFuzVVkkvEHk312KWdwCmwaTu
	q2onberiNukEOL24MSHBhW+GgOSNG0MvAcbxPPTI7sIwVrX4kjOthoeNT+oErEBg08P4HWrobN0DR
	UH/BFFznI/fPcArWbTCJf5LK0esZ7vJHPmZPx3lGZE/HV5N1x49EnvZYedimNqDSP14Vhf+qTtuBQ
	fOclPkUPZrw3k4TLawhbchwK8QJZ3RkjQK7uaZxNK5BxcR6/TRGWrBD5hoaYaGHhxAkAP2UbRkAB5
	lhbl53dmq2p/Dcm+ULNSRBuA4BoRj013OmlUExZiNmKMjOs0uLkYxZ4pSPz/rDyeME1xjPs1friB7
	cRRgj+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkS9-00000007qNp-32Hr;
	Fri, 03 Jul 2026 20:25:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkS5-00000007qKh-3CC7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:25:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E6D6600C8;
	Fri,  3 Jul 2026 20:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54BB91F000E9;
	Fri,  3 Jul 2026 20:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110332;
	bh=qJ0jOkL1ltEZQTlEuZlzOaSUuaAoYiJSzKQRTPeitxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oikmJylNHZM9npSI/21eAwlIDSrN0vyCz+r9aBWUu34hOS/DKu4LB1Ofr9AYvhBtd
	 EHqJ6GbKTqAm3mg3hSauSStx9u5hKKq9A9cjESBRIFS6NgQrQ1+dOVLinL8KJjGKZi
	 dVi9IQxws1pHSyILHB+kUdyIJW29d64tEutDlrfaefrYsp45BjYSqcUel+0E9zlIzZ
	 C3L6PFeyTY8giPr+prxvfWWmeUol+Rsx5izIOLIpfAp+AYImoP5g/HNLACO3nczH5j
	 REgNvehPBB98jXAJzNyQ2HYUTdNEetXR+efsQ2rJVc/DGj4PhTmJMA3eTT8uEIp/PH
	 dBuCgTGgyVJZg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:41 +0100
Subject: [PATCH v3 05/17] firmware: arm_scmi: Free transport channel on IDR
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-5-5bae9766abfc@kernel.org>
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


