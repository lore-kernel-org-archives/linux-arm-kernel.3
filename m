Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F3EFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zQtXPWfaj/y1MPtvLjo2XLYCzjtWJDsGqyYITUn2XY=; b=KQEs9FrObaAUFKh+8KUUyDToa5
	kfLKAbFboPljEaGiU/XnswsG+pQBruAM5lk3UziCdELg0Sq+5S3pF1X35orhwVAfNJO9g6x20gy22
	d9q4Mi9hRzZx4FfN2FwE0XDl2YXvYaTWKpHM1ES/YryCs8ZjJcf+Yfajqax4Z3vvMr7UDkyjmebES
	w5ku588h5MWATeI6icQfBjZzmrUPKFBEbtmAUi95CLFUYM0JfHQqo6lL2Og8oD/x9BDNGz+TZZFFC
	svg4xr7A/hs3KUQ98jK3eoNzs9zjgpbFMLHf2TNTKgGQLNGu8xXpnAoVd6FLIOoAVnOFwGhl0tXJD
	cMn+speg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnGQ-000000025hg-3Vn7;
	Tue, 28 Apr 2026 18:34:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnFy-000000025Hs-1laj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:34:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 27AEA4427A;
	Tue, 28 Apr 2026 18:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56222C2BCB3;
	Tue, 28 Apr 2026 18:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777401242;
	bh=C+4w7EMpQKOpxtLgrnXYA5pSlXeRslLcugB75oDKjPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bn3VpF3J1jinjnSX1CFpVa7iHxLyRW6wR+pwi2XsaBQUoQs1vMrk7iTc3NrDBw2+a
	 CVpmuQ+maQLwD0488fA8mr7fZ+MPU5UnQZJfpjNYNPCJ7O2S90MpK20WadiA+SUL+K
	 CYCU+2p2X7g/TEq9i2Y/qQYt8pOvYG7q0MROAAcULsYBBfB83jFwaQUPW/G/cr1s7v
	 54QJ+6pXZftz3A60sWGA+EE03joBcfS5D3yjinPWJFIgc+sJjRjyiZ2vF9DPOQ67Pr
	 y1T6U97hJZWQinJUWuhqSh3GXkAcI+fWR1aOJOrERomP6hY4KKRPA0n1BnMGmokJuS
	 SQxtEAMmUHepw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 28 Apr 2026 19:33:35 +0100
Subject: [PATCH v2 11/11] firmware: arm_ffa: Fix sched-recv callback
 partition lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-ffa_fixes-v2-11-8595ae450034@kernel.org>
References: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
In-Reply-To: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_113402_498039_6BBED773 
X-CRM114-Status: GOOD (  12.27  )
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

ffa_sched_recv_cb_update() used list_for_each_entry_safe() to search for
a matching partition and then tested the iterator against NULL. That is
not a valid end-of-list check for circular lists and can fall through
with an invalid pointer. Use a normal iterator and detect the not-found
case correctly before touching the partition state.

Fixes: be61da938576 ("firmware: arm_ffa: Allow multiple UUIDs per partition to register SRI callback")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 2e9820395162..7bf8555c09da 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1209,7 +1209,7 @@ static int
 ffa_sched_recv_cb_update(struct ffa_device *dev, ffa_sched_recv_cb callback,
 			 void *cb_data, bool is_registration)
 {
-	struct ffa_dev_part_info *partition = NULL, *tmp;
+	struct ffa_dev_part_info *partition = NULL;
 	struct list_head *phead;
 	bool cb_valid;
 
@@ -1222,11 +1222,11 @@ ffa_sched_recv_cb_update(struct ffa_device *dev, ffa_sched_recv_cb callback,
 		return -EINVAL;
 	}
 
-	list_for_each_entry_safe(partition, tmp, phead, node)
+	list_for_each_entry(partition, phead, node)
 		if (partition->dev == dev)
 			break;
 
-	if (!partition) {
+	if (&partition->node == phead) {
 		pr_err("%s: No such partition ID 0x%x\n", __func__, dev->vm_id);
 		return -EINVAL;
 	}

-- 
2.43.0


