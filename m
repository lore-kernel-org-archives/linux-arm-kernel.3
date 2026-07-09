Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77459C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkqNnr0T3z7Jq2hW5XWOIGYqU/BxLx95+f4ctMovvEk=; b=pETxwfDeruHAN6v6reTjOn7mG2
	ZQculfdzsx0LRv58VnTvtmy2mPhRAZDkt2DC7EtBtQI61ndKCtAJm2b+gmygGMUDzQbOgZT/dGqJy
	9QtDW4C2MliuEVnMwr9lWNyIOHp3G0qEo/uG06bpAfJ3MMBUUMTlM/p4FX8r8oJntJs4vFP8UEBPn
	C5dDTdSkT5FY2X6BlYbb3gIZ7yhNCt0hYTcv7uNk1WukqMODfSXYO8SJ0IH85JkDeXzoKw+wVq6yc
	999VRK7xS7c3JEsh1Rknu7JGOlIq3/Wo6xwXP9Ng0erD3BS1O3u1IZe9ZQdbfzZmIjXFQxlZQA+cy
	6Wf4fI2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkX0-00000001esJ-2E8v;
	Thu, 09 Jul 2026 08:54:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkVE-00000001aXl-1ahh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:53:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 28C4E43F84;
	Thu,  9 Jul 2026 08:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAFB1F00AC4;
	Thu,  9 Jul 2026 08:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587184;
	bh=NkqNnr0T3z7Jq2hW5XWOIGYqU/BxLx95+f4ctMovvEk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=V89KoyTVOjn8yfXGh2bi/jAZRX2vebTJatg0elXgibCNyH102Rk4PGc+TjsU0VdOF
	 U3eqp2pEbyLhICO7AZ/0OUYFqHvGGfAqUlrTRVfGBIpxdUx15fXAsI+nvPnnbnnvYN
	 vFFER5n0/x5lqxNe05LpBLyT9926GVkaZMzX4qcnYS1cnB1l+le9Pyu38egcxTgNaT
	 CJu1zQ9GAU6pVxeHkaGLIrN+uP0JDApt3qTAqcWi3UumS5Au3WYYdMXkr6x81hEBrl
	 LJZLBtIH7kyhIuEO/RzMqE8U7G/+6vEfK4/scswN53GTYatoiPLyTcQ61mkKgRnNRB
	 ocNSjXAZhamGA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:29 +0100
Subject: [PATCH v5 05/16] firmware: arm_scmi: Avoid IDR updates while
 cleaning channels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-5-bea6a3024f05@kernel.org>
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

scmi_cleanup_channels() walks the TX/RX channel IDRs with
idr_for_each() to free transport resources and destroy the dedicated
transport devices before calling idr_destroy().

The destroy callback removed each entry from the same IDR being walked.
That is not needed for this cleanup path, and it is unsafe because
idr_for_each() has not advanced its radix-tree iterator while the
callback is running. Removing the current entry from the callback can
invalidate the iterator state. The callback also cannot be protected by
rcu_read_lock(), because scmi_device_destroy() may sleep.

Leave IDR teardown to the following idr_destroy() call and keep the
callback limited to device destruction.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 29c89aa4710b..ad4587d75a08 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2885,7 +2885,7 @@ static int scmi_channels_setup(struct scmi_info *info)
 	return 0;
 }
 
-static int scmi_chan_destroy(int id, void *p, void *idr)
+static int scmi_chan_destroy(int id, void *p, void *data)
 {
 	struct scmi_chan_info *cinfo = p;
 
@@ -2898,8 +2898,6 @@ static int scmi_chan_destroy(int id, void *p, void *idr)
 		cinfo->dev = NULL;
 	}
 
-	idr_remove(idr, id);
-
 	return 0;
 }
 

-- 
2.43.0


