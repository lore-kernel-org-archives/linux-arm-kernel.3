Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822A1C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2IwAg1Ivs0tNJenOGMkx5wL8OPqHxhsdFS8bHuFaN0=; b=bR1TTtMitAhuZV2ziNkettX8BS
	RW2NJDhAkWR29Hzo/SYjDwc+YuwtkBCHQ0eJnhpZipzd8z9HEGlMHsrcE0vM+5Uu14ICtjibQ6/Sj
	TgGgkBJEbxLK45ZW8XqzhGDBdl/ch8aEWAq0LgRu4x9Em/9SjWc+USe/VYDsFCjkwVz3nq7dX/tZU
	hEtlOPK+C47YtYIjT5Vbnqwpe7WG3k/EHPd7Ho8uo//soGyn7oAsdTg/CUqcQOwMOaaKkdDsz/WQc
	qsZOBZHmBgpmUQSenlF/eSw2/ffjAYW6cS9YW//blfhZH4vfqwK0Gn5QWA9xNAHqrjaEhtj8c2NlM
	c4m4tPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcin-0000000C2dF-0Nb8;
	Tue, 14 Jul 2026 12:58:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcii-0000000C2ZX-2HJR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:58:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F35726132C;
	Tue, 14 Jul 2026 12:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FFB1F00A3D;
	Tue, 14 Jul 2026 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033923;
	bh=a2IwAg1Ivs0tNJenOGMkx5wL8OPqHxhsdFS8bHuFaN0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Te6t8uf7PC6T6N+S9KNECueljtlE72BKh9gfSOaWXZZdqTBUZq5hS4h8Iwb0aDYEV
	 j1A/Jd/cU1BB0LcBg4B7hs54MwxSjpXWVjc+qWgvOryKtZovvOzNFFUOwnxvUjLc+B
	 vIvZoXefLMOmMWsyMFhCE6rHgUZ/zFxqNQT0guhNnY2DCTVyP2znmPVbPHRPFpuL9m
	 Jf24KW9Gc4xjyzVkqhojyFmz6kX7ESmHzIoaaD206AKdBvU4fIylSZCTBd3rXtQhsR
	 N74aJrbB/QkfB+kA5UBEFzv1Swrr8HBwsFG06UzCaeUxHWZG8Jg+NryFnjQPAN3guR
	 mk9B97jD7zOuQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:25 +0100
Subject: [PATCH v6 06/16] firmware: arm_scmi: Avoid IDR updates while
 cleaning channels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-6-3afe499d46e3@kernel.org>
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
index 6ee2152f6b01..d17559c897a9 100644
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


