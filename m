Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26108D3A66D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wUI2EgouiczlM5cewx/Ii0IPdQLDMcjLBd/9N0Xba3M=; b=dw/EBcCdJcRGveKwB9Uot+YGOG
	qmJJc8+cG15GVdK8EfGaidlrQexb7BuHhjlErXPyoJp3Om6tL9zSMgTud1Vy7KPmG23w+NFC7mD0a
	ehg0DHLXpi+WsJvsiKffBCBBLmS+MIXxnlU3qKV39ypw07T0IIMPuIZt5Fe3Aq0TMCf2K9RYTdOKG
	+xIOdEV9vl4oG19xi3anQxyyfHZLKykylvXn6ID26fCOJ+MGKLDlixe9wZBiBcs3VHIXN+sZwuLUk
	hnn39bQaAFRk6uiWr135geunGUTr3Jd1V2g/HNV4CPVIg4NxTI7nlv5RvvLlSTD/t1+XjSn9OW0Ou
	ltjTu1KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oPr-0000000Eycb-0ZHw;
	Tue, 29 Oct 2024 15:45:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5o5E-0000000EuZ8-2a1a
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 15:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=wUI2EgouiczlM5cewx/Ii0IPdQLDMcjLBd/9N0Xba3M=; b=K6YOOcrDEH2qcVgt6FIk5uWlZi
	0SbUFGOIefjw8KfKs0BbIPZHT2xE9yHVs4dDkd7qHgZkO1OYveJk9q/nEWZFyIsnMXQUHVn2edlWS
	HHeXzyvnEHsHBds7HnAlXEbLWw/sKaRJijaKKcue5M4TfIEhsxQ3c5wsT/3I2Q7956tISF9c0os9R
	6ZEBwPTw8IBVtqCQDz7X8BcBX5023Uhlm8YuooKfRhcBW/HGdevR81n9f02Q+F+Pgyovygtngy81n
	f9EoeLqOQrxrvLFYIN8bsGQTAThqRhVaKn8HnJGZp319orRRaucm6rwAS3BDabyOJr8lsApZsRwGC
	qm9LYGPQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5o58-00000009vUC-3HOI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:24:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 40AAD5C5C96;
	Tue, 29 Oct 2024 15:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB7AC4CECD;
	Tue, 29 Oct 2024 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730215466;
	bh=spcximgZNTI7A3REOTjN2rTIRSPY/oytt/Et/v2KFhk=;
	h=From:To:Cc:Subject:Date:From;
	b=KYi7QgVZ7iM9DT2mApS+ZpXXGvwTMMzs8Pyiqw83P3gVcYiJ2XpnSwvkOwF24qOcJ
	 kzs2iIMAG0i5EDM8bF6nKPTSb04FfUkJmSaFCtiuGq9vF6IyM25qVr5lx4HYgPwpps
	 LIxGILcAxquZC1zd5vW3xxJvia2Uv/iZOBDkmwCuYXXwIIt3wHq40JeWWnbxIg179k
	 yT1FLfIK+so0lHdNxhyRMP7QfF8rR2Rr0DI7YTxhfiq8wWfpLSA+dW5z7gf4PlNVEM
	 XOA0RxSK7uAATKO55j/wpWZlDWwpq7/NVU6uRDHAvTGWWFo5dJL169Y1fcPFm/UX11
	 3t3n6nlVwBu3Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] perf/arm_pmuv3: fix building on 32-bit
Date: Tue, 29 Oct 2024 15:24:10 +0000
Message-Id: <20241029152420.3251097-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_152433_897827_AE003C2E 
X-CRM114-Status: GOOD (  13.71  )
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

From: Arnd Bergmann <arnd@arndb.de>

The write_pmuacr() function is only defined on arm64, so building the
driver on 32-bit arm now fails:

drivers/perf/arm_pmuv3.c: In function 'armv8pmu_enable_user_access':
drivers/perf/arm_pmuv3.c:784:17: error: implicit declaration of function 'write_pmuacr'; did you mean 'write_pmcr'? [-Wimplicit-function-declaration]

Add a compile-time check around the newly added code, as it is never
needed on arm32.

Fixes: 0bbff9ed8165 ("perf/arm_pmuv3: Add PMUv3.9 per counter EL0 access control")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/perf/arm_pmuv3.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index b6315ce71f19..e67918e0bbda 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -775,6 +775,7 @@ static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
 	int i;
 	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
 
+#ifdef CONFIG_ARM64
 	if (is_pmuv3p9(cpu_pmu->pmuver)) {
 		u64 mask = 0;
 		for_each_set_bit(i, cpuc->used_mask, ARMPMU_MAX_HWEVENTS) {
@@ -782,7 +783,9 @@ static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
 				mask |= BIT(i);
 		}
 		write_pmuacr(mask);
-	} else {
+	} else
+#endif
+	{
 		/* Clear any unused counters to avoid leaking their contents */
 		for_each_andnot_bit(i, cpu_pmu->cntr_mask, cpuc->used_mask,
 				    ARMPMU_MAX_HWEVENTS) {
-- 
2.39.5


