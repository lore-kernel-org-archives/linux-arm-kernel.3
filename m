Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED67C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 21:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHGMqiLEKFpxkw/wbaVPb2pvawfvYFpflUUBlPWnr/A=; b=zER+Mr7fPXZlCGEnO+QFyTmkRb
	uDu+LVfnH4d2njhYJzJZSrAt1NIATrOlyFqhss9+XBGoD2Gbg+G3gKL7EKTix1wNL2pC0df2zKeGT
	4ISGNvz9N1+0I7jfrrlZQC6aPSudpg+MZPHj382T/RVrehMiEgdFr3jP4NvsvabzoXtKr75kA1yvW
	sZlSicrunL5MKOrwiY0qeXSKCjuImzUFq5KJQcY+3fR3/iPynj7ewYQKAZ4+ldlGB9tTMZN2mFKpN
	MAVHL+kahkXQhyoJ1utjUhDP9SK8yahHgfU++7llaWttkvs5n6dRjw5ymbAiaooCzm0sliOo335yd
	YWUAZd1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUqE-00000009w5Y-23Oc;
	Tue, 18 Feb 2025 21:09:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUOe-00000009oj7-3J4j
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 18 Feb 2025 20:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XHGMqiLEKFpxkw/wbaVPb2pvawfvYFpflUUBlPWnr/A=; b=NvNsYHO61laDQslQ7LxEvhFr0h
	BRgV4ncG3SQEwhcsAHHDyheN0DHB/PyqOOHr2e/i4MR/Pbcqu5PJnGebNVfYZ5Gt1XQ9AidN+rzAN
	cX3DqOYFHgxNRgMiviRSuIWK3LtXQ+yvDGkkd+ceTbnNDp4uhDHOoAMOm9Tt//gU6ed3gplUXupzL
	6pNqark05b5BHx/5CTF5FmWANeyK1Gij+SL1p7q+CZsckSvxaPdS9dJC+j5R9HgHbaIXaKSjavNmA
	BNAPtGU+O4LK0iC0fHXsDmXyVsR3kOq04VSJ2I6eoZ0X/77x9ALZSq6a2/nv7CRefG6iKSdTdbiJo
	b+Sy1WMA==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUOa-0000000233t-3zor
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 20:40:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D268DA41327;
	Tue, 18 Feb 2025 20:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D650C4CEE2;
	Tue, 18 Feb 2025 20:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739911244;
	bh=l6TTrVAgzqUCeVudDTOcJhYY3xkL2GqGc4nae9UBVn8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Qf7iMy0vDS+qxidBsKJcljNyFXb88kz5QMvFqbsqT1WD/RiGeUuOZa5Ove2PuESRK
	 mlcYsYog+JhpZXH49tQqxM2++Qsb4s0BU0bLne4Iw7R3mxoinuG0DUvA7CckFaDqu/
	 6MqMARhiOhKpVlED2vF5kJoraRV+KZTdjpIOH70AzJid/MOQNkSIALRoFY8p1PpZLA
	 bJJnnEoTxXO3e27OJv3NtsywrktuZ5M5z/JyvuqKkNmEM3I6aHsOF7oOPQBqlKDtnF
	 YxP+c3fL+6Yy9AWV+rLLTUbBaoFqAVTvRSDAvgzASCW785vtG3qIW4Xpf3p1iTX3Gx
	 CCJ3kjaiPz3Ig==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 18 Feb 2025 14:40:02 -0600
Subject: [PATCH v20 07/11] perf: arm_pmu: Move PMUv3-specific data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-arm-brbe-v19-v20-7-4e9922fc2e8e@kernel.org>
References: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
In-Reply-To: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_204046_248792_C515582F 
X-CRM114-Status: GOOD (  13.46  )
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
Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 include/linux/perf/arm_pmu.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 4b5b83677e3f..c70d528594f2 100644
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
2.47.2


