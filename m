Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547C3C624DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yO3X2vpu5wr9k8ExLPWfYXlSEGjPIjQicyirQyzSZt4=; b=JDp4tAMVJGP6/OTpZRiCowatbd
	b2Vfzc3dFz4pL2UEN5C8SWjqVEJgSd66mD+hiKsjxVEQUXg3Oq63ooQIN9TuH9RVBOvsB7r7Jea9s
	1pjWezlH+X3z2KxIlNn9jNlmpK0EWAB/i8lHi5r2jnvYbGxm66BozgOq2Dw5j9U+JXCv/GTOW9EXe
	Jscb8l5poymlPYVFcv8EMPm/DHsg8HF59yFTfMz/rk7d3sQ1l93i/HQfNg6XYGbr3/cotw9cVjDcs
	1J1bjMGbYeacY+ZLVJ1gbzdSpe5qnAV+p0dT8XlPsLCH8omlZynfh0rI1DSRsRsUOZMPaRFXnw5Vw
	zAZa6e/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xh-0000000055d-2DoX;
	Thu, 03 Sep 2026 16:06:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xe-0000000053B-1PBz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:06:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D3501596;
	Thu,  3 Sep 2026 09:06:42 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14BBC3F673;
	Thu,  3 Sep 2026 09:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788451605; bh=D1SNoxNQ49XH9vVUtOiaYFLz5tFeBptGMBLD6AA4NL4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kPEAUmEG3AvDAM9qEfSpylO1EBCElN4tIojMd57cDqlzChLwStpJ9ChIzMUbjEJbU
	 H7kO1p/3TnGBAANnNiFga5gnyxv73nWHucThTEMJVvHi1XLuX6hVfsf77H1nkNlSWQ
	 64ofGs1hKuv5qEF8vlH+Iya4rt/Fc8RpwhYx5nd8=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: [RFC PATCH v7 05/28] perf: arm_spe_pmu: Add PMBIDR_EL1 and PMSIDR_EL1 to struct arm_spe_pmu
Date: Thu,  3 Sep 2026 17:06:00 +0100
Message-ID: <20260903160623.315525-6-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090646_421187_2F90A69E 
X-CRM114-Status: GOOD (  10.64  )
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

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 drivers/perf/arm_spe_pmu.c       | 3 +++
 include/linux/perf/arm_spe_pmu.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 79c571a649d5..42ba0924bd02 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -1095,6 +1095,7 @@ static void __arm_spe_pmu_dev_probe(void *info)
 			"profiling buffer owned by higher exception level\n");
 		return;
 	}
+	spe_pmu->pmbidr_el1 = reg;
 
 	/* Minimum alignment. If it's out-of-range, then fail the probe */
 	fld = FIELD_GET(PMBIDR_EL1_ALIGN, reg);
@@ -1107,6 +1108,8 @@ static void __arm_spe_pmu_dev_probe(void *info)
 
 	/* It's now safe to read PMSIDR and figure out what we've got */
 	reg = read_sysreg_s(SYS_PMSIDR_EL1);
+	spe_pmu->pmsidr_el1 = reg;
+
 	if (FIELD_GET(PMSIDR_EL1_FE, reg))
 		spe_pmu->features |= SPE_PMU_FEAT_FILT_EVT;
 
diff --git a/include/linux/perf/arm_spe_pmu.h b/include/linux/perf/arm_spe_pmu.h
index af86fd184050..97b14e236fcd 100644
--- a/include/linux/perf/arm_spe_pmu.h
+++ b/include/linux/perf/arm_spe_pmu.h
@@ -21,6 +21,8 @@ struct arm_spe_pmu {
 	cpumask_t				supported_cpus;
 	struct hlist_node			hotplug_node;
 
+	u64					pmbidr_el1;
+	u64					pmsidr_el1;
 	int					irq; /* PPI */
 	u16					pmsver;
 	u16					min_period;
-- 
2.43.0


