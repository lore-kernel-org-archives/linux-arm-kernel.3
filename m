Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250D4C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 00:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMCqNnE4gxdAe6R1pabZG8tPzv7IP5DZP0Hq7+nY2b8=; b=1BGTfJDX/b7+i6/B5FNmDdGwci
	p1MjMKf274vGUWHxGXETtXSQjidoLabWOBLXVm2NxqkbnVUYVjpHZKz/54U8oryNS2BmD4MyOHgTU
	ml14allm6Vkvlr56HWdRo44DyF0plt+NKZgsagkdxaoaeZDzdcNqBO40CfMQrT1a9s4IPy0n770cS
	Bn2L6vN4taiduVxEvONsSxgafhBKzKbBgz5BGUJsurWICX5dksOBLT0FKJmDwAK0iuAdoCMONGO2E
	3db2CXWmzHqfMBsBclDERSL+gG78DFQtTzL+xlXIoexPXOeA45SNO/FwoSAbWK8RK29WR+Cq62Dhv
	w/7VRJkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5u4-00000009DlB-0RCh;
	Tue, 06 May 2025 00:11:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Km-00000008mQP-36GX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:30:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0AE045C53C3;
	Mon,  5 May 2025 22:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309E5C4CEEE;
	Mon,  5 May 2025 22:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484247;
	bh=7hdEuE2KD3dDhGOix5o8Un11LfpTnYgXsJqdKHqbTm0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YRTDC86wwmhVPBPUnvOqnC8V4+jUxD1WFnH6mCKFHGQ+b09jaACy7iDuCa6VqrYwg
	 NK0R2MJdsCJB0bgdXZMlDDMljifPBzXys/euV6xv/wUSYJPgEGE49+adu5iHFfR/z1
	 7u9ejod6cxqKQBAnV9C5EnNdKu9yFdesD3HmMQ4CdQ0gybizzPZYfrBzK1gQsuFQvr
	 9ZeBYh3IzCg700deS8Uw1V/hlAtIyP2rN4g78qoJe2CRncDTPLEFpQy5sG3Wq/wF5X
	 K0MUccp/KAIa9DDcUSjuPL1PaVmk+/cds4wokJ7x4IiLa2gUDCx7f2kxqrP5Wp5wNZ
	 GuwhXaKYWH0hA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 410/642] firmware: arm_ffa: Handle the presence of host partition in the partition info
Date: Mon,  5 May 2025 18:10:26 -0400
Message-Id: <20250505221419.2672473-410-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_153048_822690_8EB6F657 
X-CRM114-Status: GOOD (  15.41  )
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

From: Sudeep Holla <sudeep.holla@arm.com>

[ Upstream commit 2f622a8b0722d332a2a149794a3add47bc9bdcf3 ]

Currently it is assumed that the firmware doesn't present the host
partition in the list of partitions presented as part of the response
to PARTITION_INFO_GET from the firmware. However, there are few
platforms that prefer to present the same in the list of partitions.
It is not manadatory but not restricted as well.

So handle the same by making sure to check the presence of the host
VM ID in the XArray partition information maintained/managed in the
driver before attempting to add it.

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>
Message-Id: <20250217-ffa_updates-v3-7-bd1d9de615e7@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index f14aedde365bd..640d214f9594d 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1457,6 +1457,10 @@ static int ffa_setup_partitions(void)
 
 	kfree(pbuf);
 
+	/* Check if the host is already added as part of partition info */
+	if (xa_load(&drv_info->partition_info, drv_info->vm_id))
+		return 0;
+
 	/* Allocate for the host */
 	ret = ffa_xa_add_partition_info(drv_info->vm_id);
 	if (ret)
-- 
2.39.5


