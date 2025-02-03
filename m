Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C29C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 00:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhkcUWuEBU3IBQUOoF1bj+n1SFWehybaCkKSRSr7/JE=; b=P1Kzps9ezUXh3sRToJWtYvglMH
	jHI7fPpEduEq0oG91uQfGrEg1uEFtV9ANO8//r0HCGGZUXd9HOtnM8dhAZLa/5UX3UobcOIgpmpbC
	PeCjscSdMWCNo57z6GTrpHA+GhDx/P28HRC+9rIw05CBXOcXp+0V43Mi1TKbiV3MmboqLrHvKW79F
	O+xPP0z2WfJPLYVaMadMAaqfP/3aGg7+7GqYr4MGZa/mnJsvL6MMmD2eJ2XmIXL8jnIfCtfpDJz0v
	lR1NPamiL5Oij1Vr0qYfdjmIao5783HDf0H5JSOahWyqEg8REa1dRI8gTL2fxciuNBt+kHruLMeR7
	HAHQeeZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tekiw-0000000EMcZ-07rN;
	Mon, 03 Feb 2025 00:54:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tekYi-0000000ELLx-1H3F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 00:43:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A2F65C621F;
	Mon,  3 Feb 2025 00:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B930FC4CED1;
	Mon,  3 Feb 2025 00:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738543407;
	bh=YMoiz1IwW30xuvS/3gbiYu27fbDSzCf+Hk+27MpZh5k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dqILbKnX9RcTtbghAlRcQhrJ00+LHmmLHnq0/inKrExKlyxXPoBKKT+HV/rTQu4he
	 z5mlKFr/eCAlN7di3QorUcd3Ob9Hgsu9rmG2bQmMvmkdY1+91muZz2lo9bNxiQOZUI
	 gJj+zuVyCqJZJUYTdzGWUufs1eXPNkakE0kyX6gmfpwPOHbAjmH+sSxFklkbsFPO+f
	 /Z6BmQr76S2OCFaANBwT6yoRpaCI8N3Dzeac172BMPuVwjTDi00oDDW8OeZL/y7wD0
	 UD3y2MS7CxHcc/d1pvX60pMfkkWc3lX3zUeEMIGBtfj9lOq+xEuGJlg9SOglpugQiJ
	 rnl7ridn+FQyw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Sun, 02 Feb 2025 18:43:01 -0600
Subject: [PATCH v19 07/11] perf: arm_pmu: Move PMUv3-specific data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-arm-brbe-v19-v19-7-1c1300802385@kernel.org>
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
In-Reply-To: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_164328_431894_5BE912DB 
X-CRM114-Status: GOOD (  13.58  )
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


