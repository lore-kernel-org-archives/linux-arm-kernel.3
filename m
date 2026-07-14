Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC05DC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sh7Lj/mj9CpIhYE/wABVucKdXgjNm8rvsICwa1CRDgY=; b=jSNfM0b24Y33xNpuJXUsC/NsZ5
	UPBvuUJW9vV3nVSHxe8xv4iYDkQvxz/Td3lSKqrAyRC/oJ0Wbm9tLQ5KaMSd1jrGJqDsB0KaihgvO
	/wrBZH+3z+vLV16FHRfW9RP9dFuOyCIRzNVXH0hz/Gh1IupN37D+Ad9dfO3Wgx3yKkE0gO/vG4KCs
	hZTfgpL5D2A+bHZneOr3gmWWY2VmXNdMqvVnj5RTdSVwBk/NroeKKGbSs2pkbtsmn+Ayscx24I0IE
	XGblmBmf5+WSk9QFAY0YvvAEPJe9s8RgIs5zjuF1zEfjOpHuUXcKtOv2vNxoZOynqykD1EPiXpH8c
	tLlg2cqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcim-0000000C2bq-2PBd;
	Tue, 14 Jul 2026 12:58:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcie-0000000C2X6-13TA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:58:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0980A404E7;
	Tue, 14 Jul 2026 12:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABF81F00AC4;
	Tue, 14 Jul 2026 12:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033919;
	bh=sh7Lj/mj9CpIhYE/wABVucKdXgjNm8rvsICwa1CRDgY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dxrzkx/eEbJ2CkWvlZGNUBvxtoGrf5PM6DZh/8MDliqj9L5aUG2MeH7zhq7nkaTXu
	 NdcyfdLm3CYhkORRgYpyk/jYNwXRJz6SBYh313lohKopxZwr/d5zQZY64gNQUiL8tl
	 IP9cnjuovB023m3Bz2/gzJDRCvMoYskaK+zor2kLD9gfzEUh24rS4Gkwp2f+tUa2an
	 TtcJhi7t2nTvTyLhkoJ6SxyL+DP84EXqNOSub9kw7+6VpAIDPKQe/c1s3qZCbkb7ua
	 F0pLs2f48ps3FzAW1ZgJ6Fh5YiDPM6XhOpHrTbIlVN8p27MglZ69hWL61wGtxhBOqC
	 0BrsUGcKUXkLw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:21 +0100
Subject: [PATCH v6 02/16] firmware: arm_scmi: Unregister device notifier
 before IDR teardown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-2-3afe499d46e3@kernel.org>
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
index 1d1f5d25d773..52aff3aded4c 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3401,6 +3401,9 @@ static void scmi_remove(struct platform_device *pdev)
 	list_del(&info->node);
 	mutex_unlock(&scmi_list_mutex);
 
+	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
+					   &info->dev_req_nb);
+
 	scmi_notification_exit(&info->handle);
 
 	mutex_lock(&info->protocols_mtx);
@@ -3411,8 +3414,6 @@ static void scmi_remove(struct platform_device *pdev)
 		of_node_put(child);
 	idr_destroy(&info->active_protocols);
 
-	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
-					   &info->dev_req_nb);
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
 	/* Safe to free channels since no more users */

-- 
2.43.0


