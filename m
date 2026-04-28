Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04CFFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=an++W+yBH2yBifzsBC53Y48eYCFHJa0WH5LPI6KMV4g=; b=VsI5clV2XkjH3WLDXDDhbK0jsg
	vEPcMDhCG43Hgx4je+Eu82mOL+YL4n6Wv6niULsu4mk3ITBkqCUZEmuwYsEtFJG0T211qVowZqwwO
	gjcX9uajZOqGPqhNnKKvlD9VpJsTuR2Au722RccJ/MO3WWvGk82O+16RfRigb4x+zI2ptQV2f7ttc
	7pItp/+5hztnnn1Kofl/TNIvr/q5Vin8imoeNQFWmDkcuqSrSDNspscYeA78RrSPaaXhaxBqUuY/j
	4kXw960YNfgHyEXdT0s7NR8R83+HVtDo+YUHCDH4SWYWMRNZtJvCfZ6P56rNVdcz/mPQfjZ7sJqrb
	/Ztj0YFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnG0-000000025Iq-2EXD;
	Tue, 28 Apr 2026 18:34:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnFq-000000025Dx-29OU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:33:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C11740A2B;
	Tue, 28 Apr 2026 18:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F0BC2BCAF;
	Tue, 28 Apr 2026 18:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777401234;
	bh=yp/1hi9l3obsmLs0Y34XOImio+CPysYrpb/kn/OcNr4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NHzm6RMZuKHquVMwjNHGyeqjIACwQ9hQlVzTTudRUidmD0zGBx3B+98IZMhI0qRQN
	 iUmcO+TRLDbQ1WPeNuWOJJ6w22K9IBQ64f9Fcq/jFZAO2GWoLk8yRp7mipXNLT8Htp
	 jYX6iPIxaDMIFobas4eoWZKqN989QDIpTVm08k81slJVEK3hLA8kfZioBTzrSK65uo
	 9GSHlopQplq28uJyzi6vaKBkcyJ11Obn0LeJhXENXWcVn4P+VQGr8XwbWOHabUz1tx
	 LTIFFofILknuQCvRYe3Cb4wAHUHrnFPn2rzsTTzazBdtmCOT4wj4aC1m++BXfBfXss
	 XhZNkLc0lpLtg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 28 Apr 2026 19:33:28 +0100
Subject: [PATCH v2 04/11] firmware: arm_ffa: Fix per-vcpu self
 notifications handling in workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-ffa_fixes-v2-4-8595ae450034@kernel.org>
References: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
In-Reply-To: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_113354_586727_6427177A 
X-CRM114-Status: GOOD (  11.50  )
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

Per-vcpu notification handling already runs from a per-cpu work item on
the target cpu. Routing that path back through smp_call_function_single()
re-enters the call-function IPI path and executes the notification
handler with interrupts disabled. That makes the framework path unsafe,
since it takes a mutex, allocates memory with GFP_KERNEL, and invokes
client callbacks.

Handle per-vcpu self notifications directly from the existing per-cpu
work item instead. This keeps the per-vcpu path in task context and
avoids the extra IPI hop entirely.

Fixes: 3a3e2b83e805 ("firmware: arm_ffa: Avoid queuing work when running on the worker queue")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 4e66c7325a4e..2241e851f7ae 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1543,7 +1543,7 @@ static void notif_pcpu_irq_work_fn(struct work_struct *work)
 						 notif_pcpu_work);
 	struct ffa_drv_info *info = pcpu->info;
 
-	ffa_self_notif_handle(smp_processor_id(), true, info);
+	notif_get_and_handle(info);
 }
 
 static const struct ffa_info_ops ffa_drv_info_ops = {

-- 
2.43.0


