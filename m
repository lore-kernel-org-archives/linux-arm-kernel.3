Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D50C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFFulc+Le0ou7IB7lFets28c0DyVwRTFWSDm7SBac8M=; b=ueIKT3P+Ncap8+37JlRgvc1d6i
	xoQSMd/CXP91WsnIaV4i1504PaIn0j3hLEpIXyhDOABrNQNfy6CWeOblDvgN4GUheGUfFVeYyJYOe
	dsk7MhLHZdO3nyTU8+7/hw8y4p3qGtVIdOyBqmWHVJg2FUrcoEs7e+47qHBJZnDeN+8UxXMdA6R/U
	dSXpFSkD3+gNildtkMn8xlcx0Bh6EJmvGlIiEej/uAVTejFdJG0y6Ly6e3wfBWVLV2fYoais4/qRD
	QFT6nW4ilmprad88u3Td6BMbPOx305OGVgAr/bqs37A2WesIRqDZJmO7iY29N12xFOFXo2uE1rWix
	SGyae7yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkWz-00000001epB-1vsy;
	Thu, 09 Jul 2026 08:54:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkVC-00000001aXL-29GC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:53:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4812043610;
	Thu,  9 Jul 2026 08:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3241F00A3E;
	Thu,  9 Jul 2026 08:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587182;
	bh=yFFulc+Le0ou7IB7lFets28c0DyVwRTFWSDm7SBac8M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H0WBp+EFZ5AFr+A0M5wUOR9aSoEABalbTW4St07665pLbXGikc1FeLbmjBSsBDUMU
	 W9zxiGDQZ95q46Qw68LSnkikb3DCDOE899QyYZ9eNiE+aA0V2LacDPAX+8jRAox1Kw
	 Yy1oIXz7g7C2M56rDv6mrwPAFyW3qjh28gHpmweiFdEF4tXksv/QTAn3vAkpkZVsFt
	 DP7l3tSGI0CG9B0CESYwT20h8XPe+ilqmKq2rotahVPhmyNe660jlT2HkuB6cs3c3H
	 IhuxSnnLi8Mddma/y/sU8bHtmtgE6wwmCvhMUzAbY/ZKCMEu0HIk8f3L09R4P0BRa3
	 vmBNfBHzoeoBA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:27 +0100
Subject: [PATCH v5 03/16] firmware: arm_scmi: Clean up channels on setup
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-3-bea6a3024f05@kernel.org>
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

scmi_channels_setup() can fail after the common BASE channel or earlier
protocol channels have already been registered in the TX/RX IDRs.

Route this failure through the existing channel cleanup label so the
transport channels, transport devices and IDR state created before the
failure are released before the probe error path frees the SCMI instance
ID.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1354de59ea84..ef41b377d3de 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3263,7 +3263,7 @@ static int scmi_probe(struct platform_device *pdev)
 	ret = scmi_channels_setup(info);
 	if (ret) {
 		err_str = "failed to setup channels\n";
-		goto clear_ida;
+		goto clear_txrx_setup;
 	}
 
 	ret = bus_register_notifier(&scmi_bus_type, &info->bus_nb);
@@ -3379,7 +3379,6 @@ static int scmi_probe(struct platform_device *pdev)
 	scmi_notification_quiesce(&info->handle);
 	scmi_cleanup_txrx_channels(info);
 	scmi_notification_exit(&info->handle);
-clear_ida:
 	ida_free(&scmi_id, info->id);
 
 out_err:

-- 
2.43.0


