Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E72FC44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cSGQxcB2p2Gyuq3R/odzpGEXeoQPr+VuqI6gIHS/2M=; b=jjGOIsuNpS7g+WKyCyCcSJfF5T
	/BPv7fdCDhhruY6E7k0bCjywlIJEBshULbDXxyylsDXO19ziGVNIz+UcBoX3FH0NZ0lDIbybmz+5W
	N4jxFHDoP+swero8x7R96RekJegDu7JiGeimXlPMyRpA5k+Cwilh59kslfEKpejE27zDgUuEnVrvD
	+N3njLYBg8G+5cTvaL6/AglV/7SkEO8r+OWd6zWQiqo8nuxZsrZxgdap3H2z6PsqURA+pg35E/34y
	ojzOCyA1C3o3qfI9ul6jEe3or2dWftdsjVxKZMtdq8pRF1L8lBWy+IAbqFAUrORS5q6fmyQzJs9Vb
	X/P5GkRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkS5-00000007qKx-22ec;
	Fri, 03 Jul 2026 20:25:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkS3-00000007qJe-2NlY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:25:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 21BF6416DB;
	Fri,  3 Jul 2026 20:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B671F000E9;
	Fri,  3 Jul 2026 20:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110331;
	bh=/cSGQxcB2p2Gyuq3R/odzpGEXeoQPr+VuqI6gIHS/2M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZLMFsmv8UsURNTp39o4477pZtkcgFZgaNNWx6pbtXoVarEf2QwdaE6jV9g7UiPjgA
	 /vVyMZnA/bA1GfI0xIO3eeSUmthyVEL1mdbyoLQ9HYL61yE7x48sCQ2JogeyHHgBfC
	 V/JaLHEUsnCSHu7wrCyPlNtUc8E1V4oPGBYgfEjxrc7W2XapAMYCGLvGw1KhXQgz5f
	 1T+DXO2vR1msLKYtHjGlXWwOm8BZj9LTUOIqSqMckJ8/ATW8X+t8ijerW7/3h8bm3g
	 eQAo7Yt29PfeyHwLJxiQzmyM/3gsS0GMqCceCJ7pm0V7Y/Lof76WMpk67/CkECU9Jq
	 EMsD4c7Yuwrpw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:39 +0100
Subject: [PATCH v3 03/17] firmware: arm_scmi: Clean up channels on setup
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-3-5bae9766abfc@kernel.org>
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
index b9ba566fc759..861087b2920e 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3262,7 +3262,7 @@ static int scmi_probe(struct platform_device *pdev)
 	ret = scmi_channels_setup(info);
 	if (ret) {
 		err_str = "failed to setup channels\n";
-		goto clear_ida;
+		goto clear_txrx_setup;
 	}
 
 	ret = bus_register_notifier(&scmi_bus_type, &info->bus_nb);
@@ -3377,7 +3377,6 @@ static int scmi_probe(struct platform_device *pdev)
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 clear_txrx_setup:
 	scmi_cleanup_txrx_channels(info);
-clear_ida:
 	ida_free(&scmi_id, info->id);
 
 out_err:

-- 
2.43.0


