Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A4FC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 23:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5i9pjyK+SZ5f2Seaijb8hbpR6KXLbhqZQ8PXcxY0fA=; b=unhZBtSLenexhOkWUErYyTpcRw
	0QE7+wwW9nS2MKmPADkdi3huE6Yglrdm5zhZLfCdiaZ+QQHiPUZs5r222SUOGrPMG35B3xDUCKpdx
	RUZrwjik1DTZo6PIjAtYnRkhEqIZH05yqU2373ECMUZE0rGExm4IsafJnfe0FVFpqleBJS4Y5TLWX
	3MotcCQIGMnWH+ByAIqNn7te8j9PA0YVkJxDl0GnTxNXiPKQ9TqKjhqvGhmSAyUup/Xy9zpe9PaQs
	2z1yRdeGFVKR4heb2xJceqDkU8t3D0L22It8DS7ZW2Qeb0Mx22Kj226/htMFrc2nQOf7z+rXrXKjO
	eHHyaz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5Mg-000000095yV-0Can;
	Mon, 05 May 2025 23:36:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4G4-00000008kqy-3u1t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:25:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 240D05C5ACC;
	Mon,  5 May 2025 22:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD45C4CEE4;
	Mon,  5 May 2025 22:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483956;
	bh=lA11mi3pVZ3Zgt4Qb1dPLIWEf000WMWrP3zmD8x6dCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CSMkfTKeCL/Ym0f0lRDWsCDqgm+BVhWCqQqWabxDbrIW3FQpvXrqNfABh5BiN8Oaa
	 C4pfI8uQGyyAxCQcqO4MzCrAJjIYARmmoNyZPRzQMEqBXt6fg0M1zw+kQ8g8GUAC8r
	 wnm4HHsFTf1R8yKX/xQM3+H5h8uB1r+74wKABORXJvcO+4EwlqQzxD+cY/Kmht4nYm
	 4ap05AtnbhCkWow4S1WjH5Glmeak6m9c9rr3wjlo2799plR8mg5A+e+y8T3VBq/Rjh
	 CeuntQsGbywOXPkAwF6Ls28GRzrXVny9EbytwEJUug4X2W3PFGFUjimAynwIhKlkHi
	 azzd1dS2kLQFg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 289/642] perf: arm_pmuv3: Call kvm_vcpu_pmu_resync_el0() before enabling counters
Date: Mon,  5 May 2025 18:08:25 -0400
Message-Id: <20250505221419.2672473-289-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_152557_037686_B1225F70 
X-CRM114-Status: GOOD (  10.87  )
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

From: "Rob Herring (Arm)" <robh@kernel.org>

[ Upstream commit 04bd15c4cbc3f7bd2399d1baab958c5e738dbfc9 ]

Counting events related to setup of the PMU is not desired, but
kvm_vcpu_pmu_resync_el0() is called just after the PMU counters have
been enabled. Move the call to before enabling the counters.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Tested-by: James Clark <james.clark@linaro.org>
Link: https://lore.kernel.org/r/20250218-arm-brbe-v19-v20-1-4e9922fc2e8e@kernel.org
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/perf/arm_pmuv3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 0e360feb3432e..9ebc950559c0a 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -825,10 +825,10 @@ static void armv8pmu_start(struct arm_pmu *cpu_pmu)
 	else
 		armv8pmu_disable_user_access();
 
+	kvm_vcpu_pmu_resync_el0();
+
 	/* Enable all counters */
 	armv8pmu_pmcr_write(armv8pmu_pmcr_read() | ARMV8_PMU_PMCR_E);
-
-	kvm_vcpu_pmu_resync_el0();
 }
 
 static void armv8pmu_stop(struct arm_pmu *cpu_pmu)
-- 
2.39.5


