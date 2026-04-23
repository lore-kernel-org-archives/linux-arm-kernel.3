Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18047FDEE2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVVujQHO7NIxNTU8LFuebL8cxCc3wkgVoARSL/Bj29o=; b=R4ekp8sFaUr653WdlkzuDhXNk3
	diaFZbSchc/LYUShoG7XQKS3qkUY9F9oSNR3SYt1bub5N+iFAjMFtbM87QSuMEAiScGAyhBZXIV/w
	lp8L41XQPKhKuLo1WVQWM6KdkScPKNPVPz8eWfmXrk5eOflMAV5l6g6r69UzSsLb2QoDQIzMMw765
	Lhw79/GBrNah0JaGep9P7IawlO+myxxr//iCVm1pQDFvkX9BN2V+XrA32GW/H6FNwOiB/iIFKs6Sg
	LyX8BoTgfNYlLnyCIvUg0GgLL3Ixg7MviFfjiMdTHQm5BUoTl1JaQ7YxWg+DrK+zg7To8Wv23o0Kj
	yy5QCd5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxmS-0000000C2QZ-3iCZ;
	Thu, 23 Apr 2026 17:24:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxmP-0000000C2MQ-0F1V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:23:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB43841AB2;
	Thu, 23 Apr 2026 17:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2956EC2BCB6;
	Thu, 23 Apr 2026 17:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776965036;
	bh=V+0omjvHArZDeRZA0oOFMICKk6VUNuVS78dDmsvofzM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LS3egZBgTB5OFnBUaH/MP9/lajAboFFr9M6afpMNDKmj6x3a69rDKhBEL7/KoSppl
	 g1v72wT4F+wWvhc4DcArQ0hL8xbIsdjYFpG8XSJDGsXdEIZ9L/33rexytC2FdKbSSO
	 0/dTAQO5uK3g+aDE3TmC5ufaL4FHw/Z5gS2ZQqMpwkoKNopkbPV5So7M6Dhl8Yo0zt
	 ezGkA6x0DVRZCQvFFueFqVcALjNh4gTyzInxioor+n7z3REJwavyDDnjWpUVT5ymro
	 LTRWaKWtImzTg7+XXQxUG4oK1hmFAPBym/F/5DEkVO0l72KM4ihsYn5RS7dyB1fp4e
	 jcaZzJd6luFYg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 23 Apr 2026 18:22:57 +0100
Subject: [PATCH 7/8] firmware: arm_ffa: Fix sched-recv callback partition
 lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-ffa_fixes-v1-7-61189661affe@kernel.org>
References: <20260423-ffa_fixes-v1-0-61189661affe@kernel.org>
In-Reply-To: <20260423-ffa_fixes-v1-0-61189661affe@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_102357_120720_DD199C36 
X-CRM114-Status: GOOD (  11.64  )
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
index 4edb88079bac..40ade6edcf33 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1190,7 +1190,7 @@ static int
 ffa_sched_recv_cb_update(struct ffa_device *dev, ffa_sched_recv_cb callback,
 			 void *cb_data, bool is_registration)
 {
-	struct ffa_dev_part_info *partition = NULL, *tmp;
+	struct ffa_dev_part_info *partition = NULL;
 	struct list_head *phead;
 	bool cb_valid;
 
@@ -1203,11 +1203,11 @@ ffa_sched_recv_cb_update(struct ffa_device *dev, ffa_sched_recv_cb callback,
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


