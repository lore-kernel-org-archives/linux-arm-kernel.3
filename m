Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CE9E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 18:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fC9wowpZkbWoJuKElyCEJRKR87ZdcOItfjhewpcM14=; b=0rFPakW/5gBDaJ2Kzk6nS/CrSl
	mTh9ne3x8AkhojFQpoBsn71g2A/gshOobvfzGo/mJVNOR59tFhc3/A5p8Xgemgs22ym9IhB5u3Dgy
	1Vre1eR2+5HmBIpQELSjRjFAI8Hz6JuD+q8xWLfBh0tlZO9CYcdeDdb6DeovsUrkHhUix4mZfLxch
	/Ac0+0doC1bD1OPpfYpMLSmxo4eBEanOklUWxgqOmoK85hMduesxEinAbbTD0zLr7MVgBRXnyHgzn
	HdsOlwFTZYBqtUU0/jZ4qihsZNmidYlka6XwjFELSA/n8wCBRzjvdmmT3Nr+rLLhhBiImT1Xh6Ajc
	stpDlEag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDsj-00000005wb3-1rlZ;
	Tue, 07 Jan 2025 18:00:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDq1-00000005vqn-48ot
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 17:57:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E6825C5AB7;
	Tue,  7 Jan 2025 17:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20324C4CEDD;
	Tue,  7 Jan 2025 17:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736272677;
	bh=sshLo3IhsFUalehf2Fn8CgaG+DdU2mxMe+CyT/ZQ0z8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BKPptCII9UGPKfgx5aw/tglKhzECKOn4zgK/od1kd3F7d33q/dGVjWYENrZDAZbFg
	 nTOzZm00lU42nNaliDepUyH/x+vZ3PZ3I8zXVJl+hm0P68pYh+b47CsE70fLoLdkvq
	 A6VFvoiC6X//TYJY/Q6XX1blU5E4WCe8JrwbrF+fzHnWkZ5WkwnjBro/NVleCPNvjp
	 95wwZ0jcrBAqyuNLOCgCX5jqi7sg+pbswAgCwIpfCuxqjhTkEJ+5iNk6/XVddHOh21
	 aMNt3gDjPdJl2bnb7XaHzsCwTegspTFqFoAN08/NwjTZYEjOgT+DgDXCiJYjDOrh20
	 Uuvdt33nDIp9Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 07 Jan 2025 11:57:19 -0600
Subject: [PATCH 1/7] perf: arm_pmuv3: Call kvm_vcpu_pmu_resync_el0() before
 enabling counters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-pmu-cleanups-v1-v1-1-313951346a25@kernel.org>
References: <20250107-arm-pmu-cleanups-v1-v1-0-313951346a25@kernel.org>
In-Reply-To: <20250107-arm-pmu-cleanups-v1-v1-0-313951346a25@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_095758_070527_182880F4 
X-CRM114-Status: GOOD (  10.44  )
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

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/perf/arm_pmuv3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index b5cc11abc962cc80e87afa26688a59f381eea105..dfef8d4669f58eb7f989a9582164b00a823ac60b 100644
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
2.45.2


