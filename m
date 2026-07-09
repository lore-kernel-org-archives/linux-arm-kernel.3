Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F2DC44503
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMcYgtRtfXBQNFN5/3iu571np71fY7h4XjMrs9Ne+MQ=; b=qwNaONr55boB7FP6qKdV+dKrmZ
	20SquIU5Z/a6vVurXZSCk6oZ/VUjrP1/jNUmL0Pb01OEoWb68UTgDXRUuQCWRCWDUtQB8El3kQ2FL
	gSJkIaotHCD0fKz08frw5lQi29vxYIfCuN7wBiZrXlx/dzDo9LyFI8uHBgyZLtSXFUhtlttxQrGfC
	5euu34xicdlRYlpkLD5l0Jh73uxNwUT9/i7L42YxnWsSgd30XoqM8Q3wt3K28uPavLORrgcH3GQXs
	2EWvBkQVoZIAxkr5JIMslLhSQsxtDCwPe5irjKT33QcgezHPL0f/oAnMfZGn2tug6qziYlVRQEfzx
	KkEEDKVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkX1-00000001evH-2kSR;
	Thu, 09 Jul 2026 08:54:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkVH-00000001aYJ-0lGV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:53:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ECF3343610;
	Thu,  9 Jul 2026 08:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B31A1F00A3D;
	Thu,  9 Jul 2026 08:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587186;
	bh=BMcYgtRtfXBQNFN5/3iu571np71fY7h4XjMrs9Ne+MQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lqX9SMmaxNzxCfwktIGjZJnw7VVmd4wmbcLGdbt6Pqlo+599OKnS7TpPlJbgDV8Hj
	 r+Xl05ucZhwJohJp47HxTdmQYYfxAp6zsIN2vi2MZ3xzTSEe8cz3LLFbTolbxJeWV8
	 cWJ+f1UcDa1Xjg+m29A204iuasW+sScOSg4uND77MxOLM3EhLwj/2s3HAv00xKiNlW
	 7xXuaIRsFZdsB/RY3gVfWSj4GCe0ypf/ZFnXENI1qlaJnopqluVOZzD4Y2DhePeCSf
	 oD29AZ2H3RzElQ1gYef6CIH1NS6A2YCTOG6Ey1kKhirl+0wMQCidgMwP3T6kvK5lVu
	 asGk1S3lTFDuw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:32 +0100
Subject: [PATCH v5 08/16] firmware: arm_scmi: Unregister device notifier
 before IDR teardown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-8-bea6a3024f05@kernel.org>
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
index 0d93ea3ef4d5..f607557c04ad 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3404,6 +3404,9 @@ static void scmi_remove(struct platform_device *pdev)
 	list_del(&info->node);
 	mutex_unlock(&scmi_list_mutex);
 
+	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
+					   &info->dev_req_nb);
+
 	/* Stop transport callbacks before tearing down notifications. */
 	scmi_notification_quiesce(&info->handle);
 	scmi_cleanup_txrx_channels(info);
@@ -3417,8 +3420,6 @@ static void scmi_remove(struct platform_device *pdev)
 		of_node_put(child);
 	idr_destroy(&info->active_protocols);
 
-	blocking_notifier_chain_unregister(&scmi_requested_devices_nh,
-					   &info->dev_req_nb);
 	bus_unregister_notifier(&scmi_bus_type, &info->bus_nb);
 
 	ida_free(&scmi_id, info->id);

-- 
2.43.0


