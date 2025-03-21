Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35A4C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 11:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ILBWEdqrO0+LRk10+uqtIDOkq7BoV/nAKP+p3b+nyI=; b=2vw9zMPgH0TOot2NpsNw452A0Q
	dSEON1TiiSdep/DXOoOGJeyXTtCT5NLTsHTo4pCahQganF9f7LRdCJzeCIxvdF0J1xXp3TEGxwvbr
	IrZWOCv30K8fr0I1taOLH1yxCInGqMQFY+XvOZfxmttSebhaI6M8oC8B+ZVxRzG0EVJ4Rq/qkHrZz
	M13rHfuXlcvHQIEsyt62AzzRky5AIWjjbiOfNt3c41PzAWg9gRS5t4ywoMvFq/OmK3G93tGD4bNVc
	UmkswHa4QJxKcCFFoZELdwc7Wqjhcxmdd5RGFyVJUEORQyzDNL9lVUEajCe845qM/H5e5aCn81PTm
	1Tq/Mh2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvb1X-0000000Ei1W-0XYP;
	Fri, 21 Mar 2025 11:58:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvazr-0000000Ehyo-0SSS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 11:57:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0747106F;
	Fri, 21 Mar 2025 04:57:13 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 98D0D3F694;
	Fri, 21 Mar 2025 04:57:05 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH] firmware: arm_ffa: Skip Rx buffer ownership release if not acquired
Date: Fri, 21 Mar 2025 11:57:00 +0000
Message-Id: <20250321115700.3525197-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_045707_191670_13EA870C 
X-CRM114-Status: GOOD (  11.03  )
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

Completion of the FFA_PARTITION_INFO_GET ABI transfers the ownership of
the caller’s Rx buffer from the producer(typically partition mnager) to
the consumer(this driver/OS). FFA_RX_RELEASE transfers the ownership
from the consumer back to the producer.

However, when we set the flag to just return the count of partitions
deployed in the system corresponding to the specified UUID while
invoking FFA_PARTITION_INFO_GET, the Rx buffer ownership shouldn't be
transferred to this driver. We must be able to skip transferring back
the ownership to the partition manager when we request just to get the
count of the partitions as the buffers are not acquired in this case.

Firmware may return FFA_RET_DENIED or other error for the ffa_rx_release()
in such cases.

Fixes: bb1be7498500 ("firmware: arm_ffa: Add v1.1 get_partition_info support")
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 2c2ec3c35f15..dce448687e28 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -280,7 +280,8 @@ __ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 			memcpy(buffer + idx, drv_info->rx_buffer + idx * sz,
 			       buf_sz);
 
-	ffa_rx_release();
+	if (!(flags & PARTITION_INFO_GET_RETURN_COUNT_ONLY))
+		ffa_rx_release();
 
 	mutex_unlock(&drv_info->rx_lock);
 
-- 
2.34.1


