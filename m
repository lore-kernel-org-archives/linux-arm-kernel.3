Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55821C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2R7MMcV3mmk0nBdIgoUyC/wqlhfh+hr+iLk2fd0g8uI=; b=13e3hTPhjnTlClN4hDFz+NMjAz
	B57c2rivARW3S9ercxwVg5QcfnpwcVKmSgdpScpg8758ZDqay6Its0sOUd9iOdfZCnzHMpNqqVrmb
	eO6X6NKxT51hsP+4OdvScrcRjZV6/2QkpZrBCjVF15Wi1Q2fGLd/ZKrp+RrleH7nXQMXC+atBjWwX
	pvhbgxeGJlOWEhXqfxOxqdQR4ZOmbQE0oiEauZ3jbFgmofq3fnjPsuRbkNX2XTkWxQTUkxnocxEX/
	XUQwUulBNnauCvk1qg8AF342IrvrawXRbCcq9ntVmpovFnfcbgqSVC+ITly5HHC9+XYbVEvXdBzB/
	R5JFyonQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUQc-0000000GLIm-3n3n;
	Tue, 30 Jun 2026 09:06:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUQa-0000000GLF8-1C0L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:06:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 026FA43B9C;
	Tue, 30 Jun 2026 09:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A23C1F00A3D;
	Tue, 30 Jun 2026 09:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782810407;
	bh=2R7MMcV3mmk0nBdIgoUyC/wqlhfh+hr+iLk2fd0g8uI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KehSzWwztNFdYmmy7LLAAsUJ66s11dvMePZ21Ttdq1F0e/liwU7zxhVZgFVmadluW
	 25K+qEvTZEl2+9DyxIif5F3wDqZdH6wMwsle9EDZeboF/z81Yhwy9qnDr17/YYVUTN
	 qM9FyzoFXNYttGvJoNIceRphQ7Uaxed+uysPzOMmBK5pmsq9oy3M+Hzw7rqQ1Gxv1r
	 S8JJpZxUq2CC7JqriOpFJ3//wUqYE4wT/IDycX9YAN1yFzR18HDcHyfjM8WDkOYmfv
	 T/5t57DOxk0vQ7szrrAjfoa5kIxw0npp5KqPEvtJFhHo/Oc3XNvSNoWI3SU+xRb/p8
	 oUs1FgW3PefLw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 30 Jun 2026 10:06:05 +0100
Subject: [PATCH 9/9] firmware: arm_scmi: Protect device request lookup with
 RCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-scmi_core_fixes-v1-9-f932c1e51992@kernel.org>
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

The SCMI device request notifier looks up protocol OF nodes from the
active_protocols IDR. The IDR lookup can run concurrently with protocol
activation while probe is still registering protocols and creating their
SCMI devices.

Wrap the lookup in an RCU read-side critical section as required by the
IDR API for lockless readers.

Fixes: 53b8c25df708 ("firmware: arm_scmi: Add common notifier helpers")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 6df0fe055d64..a575e661f1e2 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -33,6 +33,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/processor.h>
+#include <linux/rcupdate.h>
 #include <linux/refcount.h>
 #include <linux/slab.h>
 #include <linux/xarray.h>
@@ -2957,7 +2958,9 @@ static int scmi_device_request_notifier(struct notifier_block *nb,
 	struct scmi_device_id *id_table = data;
 	struct scmi_info *info = req_nb_to_scmi_info(nb);
 
+	rcu_read_lock();
 	np = idr_find(&info->active_protocols, id_table->protocol_id);
+	rcu_read_unlock();
 	if (!np)
 		return NOTIFY_DONE;
 

-- 
2.43.0


