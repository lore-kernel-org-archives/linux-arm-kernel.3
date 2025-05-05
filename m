Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1C9C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 01:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISdSg1Rm1wj3ZHTskC+ANqIQb46tilpU2eTv6SfrJFI=; b=rtx7Ne+gpssz5kDbUtmyGvi4tb
	u70hIHPUYRK+dRP5BX0c7or+/4oy/KVyRx1sLmfZ7OX4+WckIbaTbLIFrA/yyF8x8mY7UYJetqwsj
	FEJ98x/5CP1Ko1kXZU2BcgM3hGiYExJ5FGe/A5kxpCpZ8qY10+83iJfhnwtfFfgavnL3sIDjF9M/D
	hIdx2e9xiOchbgn3DHn4ngV9cBCOSn4pFi7NgggpVJrbkL2zRH9mLN/wumOwUZkcDYeT9ngMe4Jk/
	YaR4Obc4Ep3QK5ouleNENUHmdfrgbSzWrH9UXMiuFPC2ZsUfmvyONmb2F5kZp0oY5ladM7JVZ90RU
	yMDx5qSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7H9-00000009Ymp-3ND5;
	Tue, 06 May 2025 01:39:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4al-00000008rVK-2QGY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:47:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4308EA4CF97;
	Mon,  5 May 2025 22:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706D3C4CEED;
	Mon,  5 May 2025 22:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485238;
	bh=Q6mzvyxCFKn0LYzphUXFPUR4b1GinHCbmTPxZGgDFAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sFl7pGS3Mp5yRD+wJVWyy5C9CQkpAiJMR1VWSc0LlOQ3TbIDRcGrETxSru5A2JRvf
	 DB7ribZ42Nzyx4evfGdH9LGZzNm3USUiwQWz4LdDmOhLXE5B7DtXyW0yi0m6gRpHgv
	 EulKpVDBs43q95u/uOR9Gr1Ioa0xwga1X0iWuKnKGOK1eh8fTYJusb+0AD3h076zoU
	 LvU12QS7pKzvPPb2oGOmohpTrSM618oXGuxuKx4pI+ANdpCbWslheqyBHUO1RboLOr
	 t/4MQ929kGsVxqbLjtdNRXtbji2aKTAPGJ2e7Junf+Gt1s94FW4/6dqYLudZv5orfV
	 xGy5cl0/GdQew==
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
Subject: [PATCH AUTOSEL 6.12 228/486] perf: arm_pmuv3: Call kvm_vcpu_pmu_resync_el0() before enabling counters
Date: Mon,  5 May 2025 18:35:04 -0400
Message-Id: <20250505223922.2682012-228-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_154719_681910_75A7F3AF 
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
index 0afe02f879b45..d9b56f0f90942 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -816,10 +816,10 @@ static void armv8pmu_start(struct arm_pmu *cpu_pmu)
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


