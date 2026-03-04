Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83C2EB7ECF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 12:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+j1Law2aW5O4pYiMr+tnXQRe8aFFxy+w5uWmrZKbP3M=; b=AgX3PN/73tDs846FceFefP/CCt
	bsDAN4bz6UlnMYZuLLJxKY1YnT7dQSre5FEKfNLZC5rfN8erNmQzUAZIoe4g5Ci7FxlmxdDDVMtIG
	isk/30WsrYtK905TUVt//ki8PTReDxppzWADxnmTSLUV2q7xPDH+b9TqCPkQnv4EEzZ8U30MtB66k
	g8k0IwnjgGOFs1n0KJrdkE8qH9r9uocsLj39+X6zRolfiZPp3rdhpUml13VKupSjntqlKyvhSzJi6
	z4/2h7sjvqpwJFDArV4WO4YAYBDJSSbM1UmEMYb0v0x1hKLv1q/orxQx9yV+Ir7q+1vrkR5PynYZf
	8uAoNykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxl3D-0000000H9lT-33wH;
	Wed, 04 Mar 2026 12:10:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxl3B-0000000H9jk-1CgA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 12:10:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B93A8339;
	Wed,  4 Mar 2026 04:09:51 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 295E33F836;
	Wed,  4 Mar 2026 04:09:57 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH] firmware: arm_ffa: remove vm_id argument in ffa_rxtx_unmap()
Date: Wed,  4 Mar 2026 12:09:53 +0000
Message-Id: <20260304120953.847671-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_041001_372118_B99E93C5 
X-CRM114-Status: GOOD (  10.88  )
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

According to the FF-A specification [0], section 13.7 (FFA_RXTX_UNMAP),
w1 must be zero when called from a guest:

  - w1: ID of the VM that allocated the RX/TX buffer. Only valid
        in the Non-secure physical FF-A instance. MBZ otherwise.

The w1 field is only meaningful when FFA_RXTX_UNMAP is invoked
from the hypervisor.

In the case of a Non-secure physical partition, the partition ID
is always 0. In the case of a VM, w1 must also be zero. Therefore,
there is no need to pass a vm_id (partition id) to ffa_rxtx_unmap();
doing so would result in FFA_INVALID_PARAMETER when vm_id > 0.

To address this, remove the vm_id argument from ffa_rxtx_unmap().

Fixes: 3bbfe9871005 ("firmware: arm_ffa: Add initial Arm FFA driver support")
Link: https://developer.arm.com/documentation/den0077/latest [0]
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 12a625387d6e..f2f94d4d533e 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -205,12 +205,12 @@ static int ffa_rxtx_map(phys_addr_t tx_buf, phys_addr_t rx_buf, u32 pg_cnt)
 	return 0;
 }

-static int ffa_rxtx_unmap(u16 vm_id)
+static int ffa_rxtx_unmap(void)
 {
 	ffa_value_t ret;

 	invoke_ffa_fn((ffa_value_t){
-		      .a0 = FFA_RXTX_UNMAP, .a1 = PACK_TARGET_INFO(vm_id, 0),
+		      .a0 = FFA_RXTX_UNMAP,
 		      }, &ret);

 	if (ret.a0 == FFA_ERROR)
@@ -2097,7 +2097,7 @@ static int __init ffa_init(void)

 	pr_err("failed to setup partitions\n");
 	ffa_notifications_cleanup();
-	ffa_rxtx_unmap(drv_info->vm_id);
+	ffa_rxtx_unmap();
 free_pages:
 	if (drv_info->tx_buffer)
 		free_pages_exact(drv_info->tx_buffer, rxtx_bufsz);
@@ -2112,7 +2112,7 @@ static void __exit ffa_exit(void)
 {
 	ffa_notifications_cleanup();
 	ffa_partitions_cleanup();
-	ffa_rxtx_unmap(drv_info->vm_id);
+	ffa_rxtx_unmap();
 	free_pages_exact(drv_info->tx_buffer, drv_info->rxtx_bufsz);
 	free_pages_exact(drv_info->rx_buffer, drv_info->rxtx_bufsz);
 	kfree(drv_info);
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


