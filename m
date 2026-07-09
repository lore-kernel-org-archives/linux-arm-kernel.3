Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68688C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaQ8rCcJLdRZseKLXXiMOJ/HPW7WDuU0WyPWOnfMZ1g=; b=MIdl0T8rhbc+2Mh+M1wSxGvZ/V
	yfmEWVPESooJ7/sR/jtvDoLhJyEaZM33qk+vj2aCbQXvvf4Db2bBvJsSIW7jWsl7pwOivr0igOHgD
	OF+00sx5LgpPR5rrw5yGBeXU+dlj0SdgKP4CXEI6i5xqQBWco7bEmZPg+UsF0Keq7h9F/zuGA2CCM
	3Hww63ES9kIE+9zUckFPAmxz+4K6elKqtQF5OPagSAKiuNYweTXuuY0pGiM8x/2fpLiVYWeKYZMJw
	gu5gs2w/59Pyk2tjz8u1ont7ChrS8ftJwTSDN0p1Mzdi9aRik7JQet2SPxSExyxD5baApDAMI72N+
	IsChkY7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkX1-00000001euJ-1EzX;
	Thu, 09 Jul 2026 08:54:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkVG-00000001aYA-3A5X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:53:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3535A6001A;
	Thu,  9 Jul 2026 08:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6B71F00A3A;
	Thu,  9 Jul 2026 08:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587185;
	bh=BaQ8rCcJLdRZseKLXXiMOJ/HPW7WDuU0WyPWOnfMZ1g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TQKQMizUYYdVaaFTQ6owHTMD/gxwGYzRdwo7dFj44PHi9mqIAjslAmcDYrqOoNh2e
	 cRB/yxN16KVaxyYj26mNmYdlDtRsTS8RpO5VR0+g2eb9klfWsg+Delp9khY4ckp1Eo
	 radFqalYDofwgx1K+QT95gbo3XZv5M0zepGHWgXU3aoU8YAGMFEu8Ok975bMVERedA
	 16uSHU1C/l38KHFpHV7U3GYSPcO18A6fWrbxsrBbWcXjtZR/ZVjpnNjMpixe2+Mv0m
	 /bYcKgHH6ZIkxQ4ce2pwmi/wIbbBer3rnI/ZYN6HNzRZNMqpaOVSNqf52LRz4oYZEl
	 Fg5IWaoBt/1iA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:31 +0100
Subject: [PATCH v5 07/16] firmware: arm_scmi: Use channel ID for transport
 teardown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-7-bea6a3024f05@kernel.org>
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
index 81939309ce7e..0d93ea3ef4d5 100644
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


