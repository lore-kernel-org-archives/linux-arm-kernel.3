Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CE3C4450B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEGMtxrd0vreRs/fTZMYtfAYQrWT8ElE/sKVAVpzQXU=; b=0Nl3C97owIwThC69pmy0Of79y2
	d8YJ/9YizvUwH2v7mGgtlvkq9/4VhnQMsWfK4ZX18Abbg5tPnihiuMYEVOTtoZpeAXn7lRyUf3Ia2
	aFVDHOmxoWM5Rykld3DuCaJQ7TP0qEiuNxVxgkYIu5TZ9chMd+n+BVWuZEJXYOKEWM3kj5RGgopV4
	zWtGowWRLzxks4/qXstLLResFv+QxS8XnTihwkRgThgeD2oyco51Sf2Zy6WQ1FbazEbQOjtKuGpVO
	Rl1pAE+aGOnqtk253DTO9fGK4fscu2q81DSGKslVWM6NGZZMyQidRLJSZmgQVDw9E/1Kt89zg3m2b
	uFmN0IYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcin-0000000C2eB-2MOd;
	Tue, 14 Jul 2026 12:58:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcik-0000000C2aO-1kUk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:58:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D89D760120;
	Tue, 14 Jul 2026 12:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0826F1F00A3D;
	Tue, 14 Jul 2026 12:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033925;
	bh=sEGMtxrd0vreRs/fTZMYtfAYQrWT8ElE/sKVAVpzQXU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TEpz52gDSGyfPGlzZklVynCFzbohJ2+wdZCT4jwwIW3OYfO8ndQIzH/d8a0BREbl3
	 RZVtHsopZon419VcgDaw06qyiU8ZnXxjD5HuHStRJIxcPtb0w0PjZiOn34b2bgECsy
	 4eRXSLPOaFCaa4PgcCyRDf7Tr9gPGYGtWrONixocS/YtC1OivjXULFcO7MbwnqvWoi
	 Z9XlS3p8b85NyIhl4K3EScqoagplVMSIs8bV4+oSx28m9HQt8wS4m8wWj0vf3ttfvw
	 sTvMHDus3kGRfPNBwlpkAJz5p2LK3cnyV3beYwRjh2OqH1FaHBELL2YYGlnqt5+OLD
	 WnqlFEiqrZ44Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:27 +0100
Subject: [PATCH v6 08/16] firmware: arm_scmi: Use channel ID for transport
 teardown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-8-3afe499d46e3@kernel.org>
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
index 0735c6374269..f607557c04ad 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2896,7 +2896,7 @@ static int scmi_chan_destroy(int id, void *p, void *data)
 		struct scmi_device *sdev = to_scmi_dev(cinfo->dev);
 
 		of_node_put(cinfo->dev->of_node);
-		scmi_device_destroy(info->dev, id, sdev->name);
+		scmi_device_destroy(info->dev, cinfo->id, sdev->name);
 		cinfo->dev = NULL;
 	}
 

-- 
2.43.0


