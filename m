Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0B1C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXSeNRPQkVlVy8DAuJOJGO898fvDtnoZKP7XJxfcRpg=; b=PEkuMcbj2VLortr9qsevzJo22r
	6z7qrNZfbRhTxc6ehZwDBExGYiWAKrN7TSVLG5FN2ZCOc8gbz4wD/t1OSazO7H3eROVaWBbbUl50I
	DHqU8zhO4CBc5093QU+7wtfSj7p/S4rnzpVrp5Fw+7OSFUpPPIKpROtB2NJjbk5tEbbt3Ln+jMluN
	vL2CGcwE39Dx6fAe/+tIaj6SEt9YEccYhNv64bvpV88Z4A8Fv+RrPoitYOPRvdYy0SK+n6LrqOllg
	q3+hDXkdBLrEzzE2ojG6w6jiW1yDE1009WZKWuZ0+9vIvIYPn2VHfmEserCTZVCO9KMLFw+D1zoDK
	Uj2YH9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBk-00000002bAM-2iJq;
	Wed, 01 Jul 2026 16:53:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBi-00000002b6S-2Kcn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:53:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F59B4013E;
	Wed,  1 Jul 2026 16:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9881F00A3A;
	Wed,  1 Jul 2026 16:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924806;
	bh=zXSeNRPQkVlVy8DAuJOJGO898fvDtnoZKP7XJxfcRpg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SPxNs37geuQfOmLcG8lQy+6RBS8REBeuafnTqE/8fDYHDQX8vBMfEkvkYn0UNS5qy
	 djpigZPt3QCY+HS9LXthxztQC6eqxRe1HRKMNXRUgEocz60lCublX5LJpWZSwIGgMU
	 rREF7ZX4JKNOKSZ0JXGxiUXhCP3yKh83luWbU0Prf4FS8192Yj5BOvI6+g8jy/Nwd/
	 ZX58KN3UKVt1V42hYYIwXtUkRRPsVJhdmBndJxckvH8XnH5GgJRvyLgr2GihCibJ00
	 8L4mc1nvkU6SsrOpYUOhvK1FJ71NdJkqzVgXy5SByHPGV0OBQqBSrgUZsgkPdIAEff
	 SpTPdOQEPfubg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:31 +0100
Subject: [PATCH v2 10/14] firmware: arm_scmi: Avoid IDR updates while
 cleaning channels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-10-1f5e85553f73@kernel.org>
References: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
In-Reply-To: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
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
index a575e661f1e2..ae4b7128276b 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2886,7 +2886,7 @@ static int scmi_channels_setup(struct scmi_info *info)
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


