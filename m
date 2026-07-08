Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D16C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JaB0WB569Mzor3NPRy78URi25bnDtlJxO5Le7z0tLes=; b=0aqgoiR0yKKU/JqBdCMHoT7pxS
	H/0ot2e9LbF2vqHNR+LID+Ixd5Tg3yU/m4LhHBnqKMr96OadvQwotKq9vXm1L90RYk3ZO9iTQZxZV
	wR4xCAlLLRfHMJMMkedx+/5a0DWFSAHyxnEPtPDZabNOSTmI4Xn54DsDP2kuL9XhXXbg9QAbh+9vY
	Apdts86guni0TNpDTzY4TV5ooeVc5HZOrl4ApkR02jrWmaYGOyBpOFUqY/sW6u3gktiKq0qOE6dkQ
	fj9NHvLEfOVycNZiazVpNOsfsMSKdIHPP53CU6ed9FxEh9I1upe2J7BvC9T/fNy1u5tns7OHRJFVg
	hlad2a4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO8y-0000000Gg0B-1l8e;
	Wed, 08 Jul 2026 09:00:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO8v-0000000GfxI-23aI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 09:00:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED2336001A;
	Wed,  8 Jul 2026 09:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2541F00A3A;
	Wed,  8 Jul 2026 09:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501232;
	bh=JaB0WB569Mzor3NPRy78URi25bnDtlJxO5Le7z0tLes=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IkxvWSBD4zRa1grARNJZshA001gYN4+80gyDXPByL1iCOIgdw2k8Pwmm0/6uM+Bzq
	 q26PSMcJgUqbHnPclvlMiM2P8GzTJwQypEWsz2yqNAfdtwKsyks7UaaRgm+FYueogG
	 Ugu1DgEEBPTFQlB+ADwb0yRu71DNB3VL1usP1J0Aqtlh93v76oW4n8RN+eVwAQVkzO
	 ICt+b36wrhzgsZFBZQT2e7k6DPpDa76gSOdJXVZBqKPZnNBZC47V1Y4cxy36rgmTzT
	 sf0eNK3HuzRX4/yevCdgkyGH51wY6dR7TaXxLb1gCTBC2MEXhPgmmJctKBZc1YvFuw
	 8GGYTfah8MC7Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:04 +0100
Subject: [PATCH v4 08/16] firmware: arm_scmi: Unregister device notifier
 before IDR teardown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-8-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
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
index 41f1b2c49521..67267507ea1d 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3403,6 +3403,9 @@ static void scmi_remove(struct platform_device *pdev)
 	list_del(&info->node);
 	mutex_unlock(&scmi_list_mutex);
 
+	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
+					   &info->dev_req_nb);
+
 	/* Stop transport callbacks before tearing down notifications. */
 	scmi_cleanup_txrx_channels(info);
 	scmi_notification_exit(&info->handle);
@@ -3415,8 +3418,6 @@ static void scmi_remove(struct platform_device *pdev)
 		of_node_put(child);
 	idr_destroy(&info->active_protocols);
 
-	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
-					   &info->dev_req_nb);
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
 	ida_free(&scmi_id, info->id);

-- 
2.43.0


