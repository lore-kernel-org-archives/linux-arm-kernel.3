Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D3CCE8D4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+rh68F6qIk8dmJcuumlbFYbQzaNSQnA82XXmbEOvIE=; b=nW/ISGoKussvu7y06OktKYzeFQ
	JmE0c7E+ATEdr4Lr+2ZWq84CpVtq56gsFL/uC511lLuThEdXFhgOm7qS2Apner03H23iOyMTBzdz2
	wpDgshRBH5o1MYISTOGs1cevJOg5mJ+HCqgwKPP11QvAtgHYVQhNYENdTizR6/nz/ow6wontXC9yx
	xzrt4Byr33sBsWAfTRRIZubWphGIqAqNx52/msGrU/LUN3lsvEHsQSddvkiu8BZh1b9PSIiE2+XHF
	+QfuMf3pz+D9ITcJHeTFcGWDIByB3pjmMiPjv8V0Ml70/eXzBvzXf0zC+Rlo+Ab9QNO70UBowt/cI
	VNpojBFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLM-0000000CfM7-2lEJ;
	Fri, 14 Nov 2025 16:08:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLH-0000000CfGh-2lX4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:08:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F96619F6;
	Fri, 14 Nov 2025 08:07:59 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 112363F5A1;
	Fri, 14 Nov 2025 08:08:04 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 13/35] perf: arm_spe_pmu: Add PMBIDR_EL1 to struct arm_spe_pmu
Date: Fri, 14 Nov 2025 16:06:54 +0000
Message-ID: <20251114160717.163230-14-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_080807_773121_7504EF3C 
X-CRM114-Status: GOOD (  10.08  )
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

Add the read-only register PMBIDR_EL1 to struct arm_spe_pmu, as KVM will
need it to virtualize SPE and it saves KVM having to read the hardware
register each time a guest accesses it.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 drivers/perf/arm_spe_pmu.c       | 1 +
 include/linux/perf/arm_spe_pmu.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 66ae36d4d32e..2ca3377538aa 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -1056,6 +1056,7 @@ static void __arm_spe_pmu_dev_probe(void *info)
 			"profiling buffer owned by higher exception level\n");
 		return;
 	}
+	spe_pmu->pmbidr_el1 = reg;
 
 	/* Minimum alignment. If it's out-of-range, then fail the probe */
 	fld = FIELD_GET(PMBIDR_EL1_ALIGN, reg);
diff --git a/include/linux/perf/arm_spe_pmu.h b/include/linux/perf/arm_spe_pmu.h
index 8a2db0e03e45..25425249c193 100644
--- a/include/linux/perf/arm_spe_pmu.h
+++ b/include/linux/perf/arm_spe_pmu.h
@@ -21,6 +21,7 @@ struct arm_spe_pmu {
 	cpumask_t				supported_cpus;
 	struct hlist_node			hotplug_node;
 
+	u64					pmbidr_el1;
 	int					irq; /* PPI */
 	u16					pmsver;
 	u16					min_period;
-- 
2.51.2


