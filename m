Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB97AC44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/7EUxOp1Rp5nNa6XSHuUC0PLSSoDYH2XwSQzLt6MQc=; b=yXHyGZxo1GB0PgYUI/t0/qCT8d
	hn61u37deJqCtYfAjUfNwnEBjeyj374JlJ+aA9AUYQJwgShErdWWce4pZlV5aP1GYVDWvPnmyMDrK
	CT+676FH/71d06IznFYZA3EG3Y2ZQSQPOncOZrxOkLeIBp+KmdxvZM/4U5lHMX4SbwQk+Dj2+GSqm
	k8a/kpfEC60/dSVhnZKyC9l7a4XnWpag4sZgL2onbws7S6IMdtw7M40kVe+TXNPmohLz/gIlO4s1v
	avBNRW7NUbr0WixJ2re96ud5uwJtaVbm5D88WFcM9YWU5q9mgoFA1wx6LeWVSpiqaNJbV63tESdd7
	ExX7f0xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkSM-00000007qi8-0gzw;
	Fri, 03 Jul 2026 20:25:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkSE-00000007qU9-2Q8H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:25:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 58FDD42D80;
	Fri,  3 Jul 2026 20:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7F71F00A3A;
	Fri,  3 Jul 2026 20:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783110342;
	bh=d/7EUxOp1Rp5nNa6XSHuUC0PLSSoDYH2XwSQzLt6MQc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HJQMr2E1M+u9PGGay5bjx/kyp1vAgTs2MFwGi6yQM+vDYQYSPHmwDSYdbhNwFLgYw
	 ySLuB68TkxLZt/FYF3EV8pxDe8S3sLMgWmpdVWaSpJNwhCMp0Enyte80LPgIREHeSb
	 wFOeJTWyhCriAN2GhZvZUMIpj9V2KUKp8TZKKm9rt9ONayLiVveGu8juAAMs9HNJY9
	 44EeSJTdg1vDn8HMUF164uFgvg+2Nqyx6ueOdkojKZ+QDxNxiYGEjDvoaQI67iQAhk
	 A2Jb1fTEHBZrnE25qCv8ghKIkQB2XYvYqJDkfolA4YVSY4i/X8kZkkbfx+/bylwpwk
	 NuqljgsBPd2Cw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 03 Jul 2026 21:22:51 +0100
Subject: [PATCH v3 15/17] firmware: arm_scmi: Use channel ID for transport
 teardown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-scmi_core_fixes-v3-15-5bae9766abfc@kernel.org>
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

SCMI protocols can share the BASE transport channel when firmware does
not describe a dedicated channel for the protocol. In that case multiple
IDR entries can point at the same scmi_chan_info, whose owning transport
device was created with cinfo->id.

scmi_chan_destroy() used the IDR iterator key when destroying the
transport device. If an alias entry is visited before the owning channel
entry, the lookup can miss the device because the iterator key does not
match the protocol ID used when the transport device was created. The
code then clears cinfo->dev, so the later owning entry skips teardown and
leaks the transport device.

Destroy the transport device using cinfo->id, which is the protocol ID
that owns the channel and was used when creating the transport device.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index df574961875c..12ebf32aa4da 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2896,7 +2896,7 @@ static int scmi_chan_destroy(int id, void *p, void *data)
 		struct scmi_info *info = handle_to_scmi_info(cinfo->handle);
 		struct scmi_device *sdev = to_scmi_dev(cinfo->dev);
 
-		scmi_device_destroy(info->dev, id, sdev->name);
+		scmi_device_destroy(info->dev, cinfo->id, sdev->name);
 		cinfo->dev = NULL;
 	}
 

-- 
2.43.0


