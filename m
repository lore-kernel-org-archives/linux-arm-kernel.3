Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4FBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzz8rWL0mdW9lQvi1HZxDJvbw+htYzyRplE+7oDEJDA=; b=0HhwY5pTOpeQW18+6LxVXShRcO
	QYNfZd0C88hN1UUZPJFvaqbZDS//xDuZEZO4R2IYMopWS7VrFAfG5E8g4tocUuhOSlaWFf7KAEJ0N
	Bx8PCdLtECNBJwtj0l2D9JlIv1ttWj7HH4wsNd9akEPWWcAu2zSW+BHadmIx6HxiiYVv1ogWTY7UZ
	xv4RNIfxqZgk1sWPDMsvtulI5iWr7bnMfAGPEYwGjuT6KoZyOTgn+TgXZLfVXUwMhOe9V6SyAdZki
	p9gjiLPAWQiYXT6OZMGXy0wAjfX2Lh4jJYHFYHJsbLwt5CajUUypWk6WmWO0JupaWRPnQi+sEaCvB
	OBiAd2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpvD-00000002nny-06RW;
	Thu, 09 Jul 2026 14:40:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpv9-00000002nlX-2K7D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:40:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FCB13592;
	Thu,  9 Jul 2026 07:40:06 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 41ABB3F66F;
	Thu,  9 Jul 2026 07:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783608010; bh=V3sMm0L+kYA0kO/W8HpyQQpXVAmZaSSe6vOOLFZ3WjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SJ5ecuaD0n7lD1pEavMpxpoIWP25Ltb0ZgXAPOiTXKW+sb7KJ5EH3ZYNuu3nWmo82
	 yNQ0jlWKyppXanCexjcz1ipc44FfnjFVsySCqM4jnriiV3EzmdhglDwF4+pE1DMBwP
	 cyFji2GD0TC3ttqVD3V1CxX/lBkWHkJVeCt6e0EM=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	catalin.marinas@arm.com
Cc: ilkka@os.amperecomputing.com,
	bwicaksono@nvidia.com,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 2/4] perf/arm_cspmu: Improve APMT-based PMU naming
Date: Thu,  9 Jul 2026 15:39:54 +0100
Message-ID: <74b46977582689be3ec7ba456809db89aad92bfe.1783605641.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1783605641.git.robin.murphy@arm.com>
References: <cover.1783605641.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_074011_718171_AFB17593 
X-CRM114-Status: GOOD (  12.84  )
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
 drivers/perf/arm_cspmu/arm_cspmu.c | 36 +++++++++++++++++-------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 80fb314d5135..0570be74d11f 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -250,38 +250,44 @@ static const char *arm_cspmu_get_name(const struct arm_cspmu *cspmu)
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
+			      arm_cspmu_type_str[pmu_type],
+			      apmt_node->id);
 }
 
 static ssize_t arm_cspmu_cpumask_show(struct device *dev,
-- 
2.54.0.dirty


