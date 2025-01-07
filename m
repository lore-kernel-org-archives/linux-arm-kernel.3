Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BA4E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 18:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCVvBc/q46uXPhJ4U6mLtaG15DnUSJRSqJD6EcromvU=; b=tY5ApAnBW96bYbuOpwHDzc+PUf
	B/pcX1IHTrnta4PhHUU5gxuKRd9w8STN/fcCibFseEKk/BSknvTPqV4SJXSC0vKJ1GwJacEiTzFIO
	qfUoOCnpBQk1mZYq9eo0jNkLw6Ler4VbWv5T0/DNEdjA33p5MZRpym0avpnq//dzQjKhu6CkZyGw/
	g7KH3nrYchKAhs9Svb4rUZwpxusS269lNP/bePPGMVEnpmG2shUUhuHxQQSC3dnG4BmgeZN7860oh
	z2Ev9b4e+a13OMvnnBdHPN5h1r1uKnFFQ+e3ntrZbKVHJt7a6EUfCWMRiwSf3uN98AsKDqM5QoVap
	2iPO1RYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDzm-00000005xfW-1wxx;
	Tue, 07 Jan 2025 18:08:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDqA-00000005vtO-1VhN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 17:58:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C66F95C5B5B;
	Tue,  7 Jan 2025 17:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F76C4CEDD;
	Tue,  7 Jan 2025 17:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736272685;
	bh=Xg0HoZ+XSp8w6IMRK8GIJFRMyzdy5hLO5u4gC+4TkYs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o8M8/kRQGcpF0+IVRy8JCTN1s+ST4iPUbVn+Jd2f96tKgqeQdgThP9TH7Yo9KdIl9
	 EBTAbUQk3UUb0MryJM6s5bnVAbtGHBMFEFkcDIUZ1vkh8gzOpiLO59yYwJy3jxmZ2r
	 vOK1NPtz+5heBV/k3kfTuoOZfW3fAqJILky3A6/7THaTaykzIWLIqf0WE04KF3HqgG
	 U2VLiz7Xcb7gOKHoUAFceLmg3dPP4ULD+0qMglw6iypwEQWrXAt07/G3UJ9tFCRrIP
	 zESCb1OgbRj7HrGWdi2JoCHAcQO+I0ICGInsHYe8gL5T37Q1No21wFihW3fee6hpnn
	 CiaqFKfPl4Z7Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 07 Jan 2025 11:57:25 -0600
Subject: [PATCH 7/7] perf: arm_pmu: Move PMUv3-specific data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-pmu-cleanups-v1-v1-7-313951346a25@kernel.org>
References: <20250107-arm-pmu-cleanups-v1-v1-0-313951346a25@kernel.org>
In-Reply-To: <20250107-arm-pmu-cleanups-v1-v1-0-313951346a25@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_095806_448431_D7E33837 
X-CRM114-Status: GOOD (  13.30  )
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

From: Mark Rutland <mark.rutland@arm.com>

A few fields in struct arm_pmu are only used with PMUv3, and soon we
will need to add more for BRBE. Group the fields together so that we
have a logical place to add more data in future.

At the same time, remove the comment for reg_pmmir as it doesn't convey
anything useful.

There should be no functional change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/linux/perf/arm_pmu.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 4b5b83677e3f28b578c1d63a5f89b5f248e06876..c70d528594f26a39a74e00ec353824a484cb55e8 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -84,7 +84,6 @@ struct arm_pmu {
 	struct pmu	pmu;
 	cpumask_t	supported_cpus;
 	char		*name;
-	int		pmuver;
 	irqreturn_t	(*handle_irq)(struct arm_pmu *pmu);
 	void		(*enable)(struct perf_event *event);
 	void		(*disable)(struct perf_event *event);
@@ -102,18 +101,20 @@ struct arm_pmu {
 	int		(*map_event)(struct perf_event *event);
 	DECLARE_BITMAP(cntr_mask, ARMPMU_MAX_HWEVENTS);
 	bool		secure_access; /* 32-bit ARM only */
-#define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40
-	DECLARE_BITMAP(pmceid_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
-#define ARMV8_PMUV3_EXT_COMMON_EVENT_BASE	0x4000
-	DECLARE_BITMAP(pmceid_ext_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
 	struct platform_device	*plat_device;
 	struct pmu_hw_events	__percpu *hw_events;
 	struct hlist_node	node;
 	struct notifier_block	cpu_pm_nb;
 	/* the attr_groups array must be NULL-terminated */
 	const struct attribute_group *attr_groups[ARMPMU_NR_ATTR_GROUPS + 1];
-	/* store the PMMIR_EL1 to expose slots */
+
+	/* PMUv3 only */
+	int		pmuver;
 	u64		reg_pmmir;
+#define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40
+	DECLARE_BITMAP(pmceid_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
+#define ARMV8_PMUV3_EXT_COMMON_EVENT_BASE	0x4000
+	DECLARE_BITMAP(pmceid_ext_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
 
 	/* Only to be used by ACPI probing code */
 	unsigned long acpi_cpuid;

-- 
2.45.2


