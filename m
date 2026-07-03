Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B69C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HX1nHvlk3c1+dgVJ4v3uKemvU735Z6kr6zZ67avlLqY=; b=InQvmnU4TSVlKbYjWOACiej7E1
	Qzf6T1fhdlYTXxA4/JqjkW6OrsI9NQ3lMN6KzR2dhaYA7zqor8SHLly731i8Qr7Y5MlniT3tNHPz0
	wlAh1Q7gfohLr4yeIoDKLxfKmK16g7t9AG30heYNIYin1/P2ZQdlF+7KW6Iypy+eSHGmLQFq4Vj24
	lNanQbLwhpvmpQf0lSre57cU8qmL4jnExukJHvfx6/Bbrxgn+cugBYVdNdCf0xkBHKvkX4ug4DFmA
	49MSX8ItoFHFA8PRMHCTbEENppDeA8WffgIzZa5yKH/hm+2zlPccZFFkfC2y+yG+N2DlX4zf/H5Y+
	iOTSUVOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkS9-00000007qNy-3O3p;
	Fri, 03 Jul 2026 20:25:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkS6-00000007qM6-2nYo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:25:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EC9F600AF;
	Fri,  3 Jul 2026 20:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E0D1F00A3A;
	Fri,  3 Jul 2026 20:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110333;
	bh=HX1nHvlk3c1+dgVJ4v3uKemvU735Z6kr6zZ67avlLqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KWsOwBw+LnsGFKHwadeAKj7CbGjZ2esIZyKZRtrS7xRZ7yzQwbpmcadipOTCbJd9O
	 AWGoAn1L9v9w94fLjjEaNgPHB8n8lx+4/RJNXu5rtPaRtXMPo//SeDvkklS1xrOiny
	 wT6f35Ds25Hrl4b8C2vFknflRNJtKZo+RM/It09y52I1mhqrJRHAYIaTM4sbgxdhQQ
	 4QSJhzmQL/koeSPkY0E/Wlw3/KBZzsXMw/SL4s30CkfRxapW1Y/2k4pZu617pfTuMi
	 6i+cvRWo2qT+B5iVTPzoD6MNYx7cPX3mMCD9A8CYsLtPZN2cPc1ebZMHeLtEcJy7Wl
	 lPWcbPUpAuGdw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:42 +0100
Subject: [PATCH v3 06/17] firmware: arm_scmi: Unregister device notifier
 before IDR teardown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-6-5bae9766abfc@kernel.org>
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

The requested-devices notifier looks up protocol fwnodes from the
active_protocols IDR. During remove, unregister the notifier before
releasing and destroying active_protocols so no notifier callback can race
with the IDR teardown.

Keep the bus notifier registered until after the protocol state is torn
down, matching the existing remove ordering for SCMI bus users.

Fixes: 53b8c25df708 ("firmware: arm_scmi: Add common notifier helpers")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 4b369b003003..6df0fe055d64 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3402,6 +3402,9 @@ static void scmi_remove(struct platform_device *pdev)
 
 	scmi_notification_exit(&info->handle);
 
+	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
+					   &info->dev_req_nb);
+
 	mutex_lock(&info->protocols_mtx);
 	idr_destroy(&info->protocols);
 	mutex_unlock(&info->protocols_mtx);
@@ -3410,8 +3413,6 @@ static void scmi_remove(struct platform_device *pdev)
 		of_node_put(child);
 	idr_destroy(&info->active_protocols);
 
-	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
-					   &info->dev_req_nb);
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
 	/* Safe to free channels since no more users */

-- 
2.43.0


