Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14EDC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AK6ue9y8FH14ZJTzyvgswqfKNkYbj4sdoEJSBYwYWqU=; b=1wU7Yu0q27wRyoLmkopowV1kBS
	7amYQdgcFqhfJnudC/1srmKjqewwJc4VEfrLwvqiTHhQj1WBGqBYNQYQLh3zGWgMUxllintmZh9Vp
	xq83rB+Ovk7msX/xgiuvzVewAWOLgjgYrB5EqyFgkLe68beaqIWW5QFByhiMh/5xPnwSIcndvGIWU
	yBF0pYtX4nwF+zP36UhfKNvrCSzngxzhD1v94FVG4rYn8G4djInCMbA29ymmkRbKgQHfRncd8VN05
	yGrcX0UXPWCPXUjHtjiFVAhwkcNZHIlz7+opWY8BEDKydGHVi7zJsepT0Z6G9ICTgu/ANaH+3XtbK
	QSitq6SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNW9-0000000HYWT-0zFi;
	Thu, 16 Jul 2026 14:56:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNW6-0000000HYUo-0GgX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:56:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EB591477;
	Thu, 16 Jul 2026 07:56:44 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BD62F3F7B4;
	Thu, 16 Jul 2026 07:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784213808; bh=+tWSPMNl++zmEGYUXZGGH56Zm7suUculQiOYKCm7jOc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KPbYxsUV+ED5imRMD3J7hhcXdyfSb/P1NnGY1JqS5gQsm3ANpWUyaM3LpIbA38sVB
	 FGk4uP9QXRNcvm3ealVMuhiI8wayx3kGiCve4+xgQmhz6+xwCCO7FOEoxxNm4uTj7Y
	 dgj+GRItxYNR1IZY0r6qnfhDNrEvpU2HE9+2t5XM=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	catalin.marinas@arm.com
Cc: ilkka@os.amperecomputing.com,
	bwicaksono@nvidia.com,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH v2 2/4] perf/arm_cspmu: Improve APMT-based PMU naming
Date: Thu, 16 Jul 2026 15:56:35 +0100
Message-ID: <8f260d150da4fd8acbe0a070033c9b9e045fced2.1784213435.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1784213435.git.robin.murphy@arm.com>
References: <cover.1784213435.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_075650_195771_FD03E600 
X-CRM114-Status: GOOD (  13.25  )
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

On ACPI systems, it has not actually been possible for userspace to
reliably tell which PMU corresponds to which APMT entry for types
other than "ACPI device" - the evidence trail only leads from the
arbitrarily-numbered PMU device to its arbitrarily-numbered parent
platform device that has no distinguishing features either.

While we've now improved the platform device creation to associate the
actual APMT unique ID, we may as well also tweak the PMU devices to
substitute the arbitrary number with a different arbitrary number that
might be more directly meaningful based on the APMT definitions.

We don't have an equivalent for Devicetree, but in that case the
platform devices are at least identifiable via their sysfs-visible
of_node.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>

---
v2: Actually use the instance-based ID where different from node->id
---
 drivers/perf/arm_cspmu/arm_cspmu.c | 35 +++++++++++++++++-------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 80fb314d5135..8c2dda17d73e 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -250,38 +250,43 @@ static const char *arm_cspmu_get_name(const struct arm_cspmu *cspmu)
 	struct device *dev;
 	struct acpi_apmt_node *apmt_node;
 	u8 pmu_type;
-	char *name;
 	char acpi_hid_string[ACPI_ID_LEN] = { 0 };
-	static atomic_t pmu_idx[ACPI_APMT_NODE_TYPE_COUNT] = { 0 };
+	static atomic_t pmu_idx;
+	u32 id;
 
 	dev = cspmu->dev;
 	apmt_node = arm_cspmu_apmt_node(dev);
 	if (!apmt_node)
 		return devm_kasprintf(dev, GFP_KERNEL, PMUNAME "_%u",
-				      atomic_fetch_inc(&pmu_idx[0]));
+				      atomic_fetch_inc(&pmu_idx));
 
 	pmu_type = apmt_node->type;
-
-	if (pmu_type >= ACPI_APMT_NODE_TYPE_COUNT) {
+	switch (pmu_type) {
+	default:
 		dev_err(dev, "unsupported PMU type-%u\n", pmu_type);
 		return NULL;
-	}
-
-	if (pmu_type == ACPI_APMT_NODE_TYPE_ACPI) {
+	case ACPI_APMT_NODE_TYPE_ACPI:
 		memcpy(acpi_hid_string,
 			&apmt_node->inst_primary,
 			sizeof(apmt_node->inst_primary));
-		name = devm_kasprintf(dev, GFP_KERNEL, "%s_%s_%s_%u", PMUNAME,
+		return devm_kasprintf(dev, GFP_KERNEL, "%s_%s_%s_%u", PMUNAME,
 				      arm_cspmu_type_str[pmu_type],
 				      acpi_hid_string,
 				      apmt_node->inst_secondary);
-	} else {
-		name = devm_kasprintf(dev, GFP_KERNEL, "%s_%s_%d", PMUNAME,
-				      arm_cspmu_type_str[pmu_type],
-				      atomic_fetch_inc(&pmu_idx[pmu_type]));
-	}
+	case ACPI_APMT_NODE_TYPE_MC:
+		id = apmt_node->id;
+		break;
+	case ACPI_APMT_NODE_TYPE_SMMU:
+	case ACPI_APMT_NODE_TYPE_PCIE_ROOT:
+		id = apmt_node->inst_primary;
+		break;
+	case ACPI_APMT_NODE_TYPE_CACHE:
+		id = apmt_node->inst_secondary;
+		break;
+	};
 
-	return name;
+	return devm_kasprintf(dev, GFP_KERNEL, "%s_%s_%u", PMUNAME,
+			      arm_cspmu_type_str[pmu_type], id);
 }
 
 static ssize_t arm_cspmu_cpumask_show(struct device *dev,
-- 
2.54.0.dirty


