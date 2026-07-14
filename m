Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0332DC4450C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zSo7PrGzCLiYALC1GlMvG5hbJzwSVQTtnSDa8KFyso=; b=JBXnkPTSmCc6KHfq3lPlGt2yWt
	kaNVkm9+sAerOtIjWkTocV+Zwm1LkoteYm/zK5mVGH0ivGTnlIJzniITFXEucSPs8OHxyu1qicEwu
	bPKmkgOU5cv9TocyjCxuwC0XqfmCg/ZZYsyjAIc7lHRy5ioQELnv2MXsLb0FYEwAYDvbdx6RRyX9U
	aA4b9o1BAN6uMlurpJVEQyxhB5JtcSfzJxEq89Jd09jUj3De3vHLhhhbs0M+qY2qIk7GgxWbB3ROg
	lttVRNNBe7rOSgvw35zodF0LchQOepaeKOSrr7DDD22t2ud5XDF8hyqdpom5qiBbZqJA1wdPVcYWQ
	RuU62VBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcim-0000000C2cs-3vJy;
	Tue, 14 Jul 2026 12:58:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcih-0000000C2Yw-4C42
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:58:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BF5060120;
	Tue, 14 Jul 2026 12:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8FC1F00AC4;
	Tue, 14 Jul 2026 12:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033921;
	bh=0zSo7PrGzCLiYALC1GlMvG5hbJzwSVQTtnSDa8KFyso=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VxAv4nIpn96xEEHzoakXffjhsmli/jRG92duGKyY4EGR52wTWmme2TVcY7djlhTHk
	 mR01WFSWYb16OT8Jxe68pR0c78+xwILiEbIUrJ4EXOt6MSs9klq+/wAGYE/8rhNWl8
	 iaqoZFQ72ePFeoyuY2FfR18u++LtUiClry/B6XFZ/LWcJxE2MAnzCgkGESNpp2L8GI
	 vXx/bm9Wqp7T0tqaMw+LY21VluQ6q/9qhWg9Vozad3HjvSrm+AT6WJRYyactukjYsP
	 o8smqc+sihnXNXPqIsYyduodf+8J1+55h64ip88+c8YKVP77CrULoUt/HGR5Aeyoce
	 I+2IUbi0W7F6w==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:23 +0100
Subject: [PATCH v6 04/16] firmware: arm_scmi: Clean up channels on setup
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-4-3afe499d46e3@kernel.org>
References: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
In-Reply-To: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
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
index ec373595f955..d2af47d03b4b 100644
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


