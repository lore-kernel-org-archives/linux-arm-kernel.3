Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A5AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktj08HwZWDlq7QXhBXMDnAVn5XN6gSbDlXpuqM7y2m0=; b=xo7yi9uWVLYTyErWQVd6ffWKjF
	cqexhppPgJq39cgr7gpojP+SH/Gegne7rEqsBbVzljS/PIDCu+/2HlWnMt183zxCrghSULdoXxdA9
	f+mAupzahGF/2HCVMZiTh1Qm2GLlh9Ik2WTahzsi2ka8cdjrJemAtW44zCL3/Z1zp1viCqP9wWFLU
	9VechLnYn7pce+4jtJ7QYdZ/RN0FDlFb8U4BKsUqjkhHzgy2vddgS0bhmirZe4JiWjWkZJkSCXkMd
	2SBT2lN7V7F5YsIiT7Y5rMYsKFzQ3EanL3cZcqGHB0vTkkb3xmvKYRy2ZPCpO6pnSbS9lARygGei/
	9ewL6k+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7xE-00000002E77-2xz1;
	Mon, 17 Mar 2025 10:44:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7lG-00000002AW7-2WJm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 10:31:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF31213D5;
	Mon, 17 Mar 2025 03:32:06 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 505DB3F673;
	Mon, 17 Mar 2025 03:31:57 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Mar 2025 10:31:25 +0000
Subject: [PATCH v2 5/5] firmware: arm_scmi: Exclude transport devices from
 bus matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-b4-scmi_minor_cleanup-v2-5-f4be99bd9864@arm.com>
References: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
In-Reply-To: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2251; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=+0Mtk2eBncY1WYJIQ+eI2xyXGHa8QgJ27kWhxHLl+WI=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn1/oXALW1n2ivxHeilduro5z69613W2Hqp+07J
 mNXudCgjA2JAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9f6FwAKCRAAQbq8MX7i
 mId1D/0YKECS/00M0g5dqAooVvQLpBQeZBw13JMvcgLmYOPdGDU40hANEjQWoUVwuQEh1/ErpJ3
 6GvuVuQl9+rjRp8l4E84rejwzedl7gveG0Vi2UMwobEPR8fVIZlmbOJcwmeiszSv7f/aQygG79O
 BSHAVXRmm2uvMqOqgiB1jx96uwLmjx/uJh73T/oFsHc1dsdBlYl28C5nPIcWhTQck1nhvh8kogt
 VqIzM5ylytyIW8euWA3PChiegAcfFmABMPMOrEFTMhV/H8RYOYVmH4+gh/hIX5jWnuws2Nnv1ZQ
 6JLhvXOZ3W48SKzvRIUd03yxSy9ANKuCHp80/7ncHDoh5pdVhRW7DUPjvA5YkSJmu1p3gA16Nna
 X0N85SkPqqgxN10wNeLc865lAKbQahnLm/CEnNezzC5Yf9LZGMs5RAX7lVOaEsLmm1YOjbVuVBv
 HgCwNQvHOa4FeUJUcw1T+cNU+jBMUspTp5l+Bp8xgGM6prol+4kmjL1PPmbc0pscBTK34IXMrov
 em01vHrF1Z3HuPpHtJPq2L3LbNu2TkzErQvD+CBH42dSgqJ438wxkugr3cHi9hSnoEK5Imvnk5u
 J7awQq/5MiIb6ZL1RfPfPt9gZARP+PE73rnvI1lYcsmMRT4+TktHijWtP2jz+LYlKacVqsOcXn4
 roshAtm/2hhktGg==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_033158_779726_CAEAD6C4 
X-CRM114-Status: GOOD (  10.83  )
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

Transport devices are currently being unintentionally matched to
drivers with the same name, allowing their probe function to be
invoked. However, the bus notifier prevents them from setting up
handles, rendering them unable to utilize SCMI core functionality.

Instead of relying on the bus notifier which can't prevent bus matching
even if it returns early or error, move the check into the bus matching
logic itself. This change ensures that transport devices are entirely
excluded from driver matching, preventing any unintended probe attempts.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/bus.c    | 2 ++
 drivers/firmware/arm_scmi/driver.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 493e2c63b107fd9063f11034b71d65f567bb0778..17b0e6e2cb0a65d88079346b3da319ce6356b42b 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -212,8 +212,10 @@ static int scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
 	if (!id_table || !id_table->name)
 		return 0;
 
+	/* Always skip transport devices from matching */
 	for (; id_table->protocol_id && id_table->name; id_table++)
 		if (id_table->protocol_id == scmi_dev->protocol_id &&
+		    strncmp(scmi_dev->name, "__scmi_transport_device", 23) &&
 		    !strcmp(id_table->name, scmi_dev->name))
 			return 1;
 	return 0;
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index b80c574cb3bb2f12b2980fc844ea3da10abdc9f1..2b567f29c83493487b8b0998886dcf75827017ef 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2829,9 +2829,8 @@ static int scmi_bus_notifier(struct notifier_block *nb,
 	struct scmi_info *info = bus_nb_to_scmi_info(nb);
 	struct scmi_device *sdev = to_scmi_dev(data);
 
-	/* Skip transport devices and devices of different SCMI instances */
-	if (!strncmp(sdev->name, "__scmi_transport_device", 23) ||
-	    sdev->dev.parent != info->dev)
+	/* Skip devices of different SCMI instances */
+	if (sdev->dev.parent != info->dev)
 		return NOTIFY_DONE;
 
 	switch (action) {

-- 
2.34.1


