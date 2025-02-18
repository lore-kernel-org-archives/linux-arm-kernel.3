Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDFCC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 21:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6KziNg60qeJWhKAu9lzrdjCG2VDy62JAV7/I8iekXU=; b=RbyA7M43oBztoJ8fM/xI5IzZqg
	RVFSLwBKmtN5eyq6Vqdmg6CgtX2VLqXKYhPrztpAMuTqayq1OpFqTeBWMW3D1hEoaUjHK5pZUefkW
	2B7k/31p9z/zbN5qmsFZe1qs+EkdKCP9Yp6oE816aOdo02UbQ+KAphA1EBvE+1LYOes1cQSwa94xg
	6k/TgIUgGg0rpG5lZOjGiIOlwu1s5s5mIuOKWNj1q9TvHsyqv1M+fkOduQCQFY/YWGpJwQy1dFmQd
	/Nf9m4+BoRNRbSvhbAjKYORo4pmapqkgDnM/KjN7gwXc95WYDWzlOkAfBl1QpBGDoin6+hsIwCbdD
	S5QQL1hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUjj-00000009un9-35OM;
	Tue, 18 Feb 2025 21:02:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUOT-00000009odT-3ExG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 20:40:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E206A41B00;
	Tue, 18 Feb 2025 20:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84015C4CEE2;
	Tue, 18 Feb 2025 20:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739911236;
	bh=2Jk2ywPW1km/VJ9+Y88YkoBT2vTs0W+V15cPnxKdj14=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n3ttOiTgS8RpPSUIV38aLtqXbVgOCiMU4MWMndweh9S963Fj6ha+k10xyhpo8e5BT
	 U9N6eZesWmmHGB7Yj+shOxo/ZcIN6r/ERxZyDQf5tevL8+r/QIQjbSqYqNi063ANnd
	 eBziIh5/+ZSoAGJm5CxaqPeE7HHA64S1biSgN0Zjw87mLITMNqcgOUQ6sLS2GbB8cY
	 tvXYQedEQuSD07yNo6leHkMSksH6S8Ua9TV28iKHKCV+AXKao+6YIbjs6a0tt79IUc
	 oZtFG3RUjUHh0+7ZLAi+Ol89rxWtJCNfLd/40G6tDkQkn17Www/4Ph8t3luMObJ8GH
	 afdwbizJFV/0A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 18 Feb 2025 14:39:56 -0600
Subject: [PATCH v20 01/11] perf: arm_pmuv3: Call kvm_vcpu_pmu_resync_el0()
 before enabling counters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-arm-brbe-v19-v20-1-4e9922fc2e8e@kernel.org>
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
X-CRM114-CacheID: sfid-20250218_124037_878263_4C9AB6C6 
X-CRM114-Status: GOOD (  10.73  )
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

Counting events related to setup of the PMU is not desired, but
kvm_vcpu_pmu_resync_el0() is called just after the PMU counters have
been enabled. Move the call to before enabling the counters.

Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 drivers/perf/arm_pmuv3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 0e360feb3432..9ebc950559c0 100644
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
2.47.2


