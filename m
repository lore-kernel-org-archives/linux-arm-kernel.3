Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DCDC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4syFSSdIh/X6qNOMvvCrMCiq03HH2vb0marr6x2b8U=; b=JRG1Cr6aCQEOD9feV07dC15Twb
	bpOIK356cqPuAKNgdPgGbM52g48tuZJGTyt6u/Ntvc0+Gbav2BP3XvlzGbdb9tex8+A+aLquTIRs9
	jcqJj2mrqjKfwc8FG7w/jiCPUC3sAJ7+WdTbUeCAQ3/kC6x3QThH/rmvr5QaPmoABpVlgntSIGNLY
	sfOMjqaUZkbc8Tn883w1WN8onvu7YvkJRtqRQnywKxj2kIN7KsscUhFgVYguJYeUGKqYFHuOvP4tu
	FvWhsNEiNZ9r5QJgINMJfhZAzwA0AO8Nn8OwbvlM4bIGJf9wWZE99VeUg4K72M3mRqzv1WbsPVaXe
	P/IsJlTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNW9-0000000HYWB-0cpZ;
	Thu, 16 Jul 2026 14:56:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNW4-0000000HYU4-0Et8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:56:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4215C1476;
	Thu, 16 Jul 2026 07:56:43 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2493D3F7B4;
	Thu, 16 Jul 2026 07:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784213807; bh=C2NrelLAf7T0hDmpoK1ldrpKNiVV7avpeh8FEhGRPdA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MEvstiCppWCM1GVxxnI8f1FPJa0cfbbVzjTbX7AS+vnAat4BLCnsog6st1/6QQNkI
	 y+Om5xhnkD9A/d0/MsEWJcRckV0KLm/5Q5f2i7f18plOiwUW3SPf6XwKMGVc+MXmT0
	 +XE6enJ0QxsmoucAm6M3mgttxCx+rei7nVBQ1+gA=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	catalin.marinas@arm.com
Cc: ilkka@os.amperecomputing.com,
	bwicaksono@nvidia.com,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v2 1/4] ACPI/APMT: Use stable device ID
Date: Thu, 16 Jul 2026 15:56:34 +0100
Message-ID: <f7eb9a4cfea4cd6f8d87f3c2501438d484807d27.1784213435.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1784213435.git.robin.murphy@arm.com>
References: <cover.1784213435.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_075648_152472_29DFE990 
X-CRM114-Status: GOOD (  12.00  )
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

The APMT node format includes a unique identifier, so we can use this as
the platform device ID to give userspace stable and identifiable device
names, rather than auto numbering dependent on how the table is parsed.

Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Hanjun Guo <guohanjun@huawei.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>

---
v2: Handle and warn about unexpected signed overflow
---
 drivers/acpi/arm64/apmt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/arm64/apmt.c b/drivers/acpi/arm64/apmt.c
index bb010f6164e5..91fcdd289e63 100644
--- a/drivers/acpi/arm64/apmt.c
+++ b/drivers/acpi/arm64/apmt.c
@@ -76,10 +76,12 @@ static int __init apmt_add_platform_device(struct acpi_apmt_node *node,
 					   struct fwnode_handle *fwnode)
 {
 	struct platform_device *pdev;
-	int ret, count;
+	int ret, count, uid = node->id & INT_MAX;
 	struct resource res[DEV_MAX_RESOURCE_COUNT];
 
-	pdev = platform_device_alloc(DEV_NAME, PLATFORM_DEVID_AUTO);
+	if (uid != node->id)
+		pr_warn("Unexpectedly large UID 0x%x, truncated to 0x%x\n", node->id, uid);
+	pdev = platform_device_alloc(DEV_NAME, uid);
 	if (!pdev)
 		return -ENOMEM;
 
-- 
2.54.0.dirty


