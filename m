Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA39CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 19:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCnEyKz3SjgomA9/It1DOL93Gcx73EfL0YqiMI6o4W8=; b=f05iYcfIpYWYIYgombFu4So1mb
	yykmyKqYmca6AmMGvXBIKqr5U1jWTYQqnct1i8gaB20utl2mTamvN4pumLuA54uuhDEMGp8Irqiti
	3+/vEGEBZnGgmOiJpzHuQZ5e/BfElVgda/0Ah7sl7YEpmMLF+xkQRKcQnzNmX/+Fjc9dIB5tK4Dji
	vrHtFlWFC0DGGElIsK0oqO/Y5hXNCmZILEJ83TTHYALvHrsVFGPSCzD/IhZ12gHR6JS65aOMsMVP1
	fTTIsgyT7vX9sXRPoH7lcP5a1zqC2zp6IF/3FE2YZh/UPJloqObLvnipqJl6/isv4730sG7tNf7J+
	I3ggbetg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhmT-00000001yGN-3UIP;
	Mon, 08 Sep 2025 19:44:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvemW-00000000lOR-0WlY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:31:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1147E44A1A;
	Mon,  8 Sep 2025 16:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA470C4CEF7;
	Mon,  8 Sep 2025 16:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757349112;
	bh=BheY/4Tjx4s0jW8mBSJJ3tgbkDMxPNLTTZYFhhqSOcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EqFRbLKdD5duE5VlTat2zDtmpG9tuOra0yPYcPrKx3AD7lQNnCdqzVLhy4ZfypfKe
	 /DhkH7nW3Xn+jNtljL339pZmySnOB6ElNQ92+PuumUl5q7QB4tZsXPdhSU74CKSjEn
	 KulEOfgTDqG7HCVEJFQzg9ZMQ+flubWCucMv1Mab8uMRSkXPfoWjnu70AJuPanMpYn
	 Au8M4q0cKvUQcfQAumx6HCwvgdYXPA6ahQ+HtPLMeMT0zvILXfMffONOiAqnLaSeht
	 qMfGmtxOFoC6hiWSVHUs0Reolinw8PUZHY4ujlSKdBJSxCqgLGVVhnMBZmfbArCN6t
	 ndNeNIcGMnfig==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uvemU-00000004NTm-0VTl;
	Mon, 08 Sep 2025 16:31:50 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>
Subject: [PATCH 17/25] perf: arm_pmu: Use a backend-specific pointer for percpu interrupt request
Date: Mon,  8 Sep 2025 17:31:19 +0100
Message-Id: <20250908163127.2462948-18-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250908163127.2462948-1-maz@kernel.org>
References: <20250908163127.2462948-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_093152_212077_A2415928 
X-CRM114-Status: GOOD (  16.88  )
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

From: Will Deacon <will@kernel.org>

DT and ACPI significantly differ in the way the PMU probing is
conducted, resulting in different data being available at different
times.

Work around this by providing a per-cpu 'struct arm_pmu *' as
a parameter, instead of sampling it from a per-cpu variable.

Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/perf/arm_pmu.c          | 10 +++++-----
 drivers/perf/arm_pmu_acpi.c     |  2 +-
 drivers/perf/arm_pmu_platform.c |  4 ++--
 include/linux/perf/arm_pmu.h    |  4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index d1f738eb77f1e..044c9c6296997 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -628,20 +628,20 @@ static const struct pmu_irq_ops *armpmu_find_irq_ops(int this_cpu, int irq)
 	return ops;
 }
 
-void armpmu_free_irq(int irq, int cpu)
+void armpmu_free_irq(struct arm_pmu * __percpu *armpmu, int irq, int cpu)
 {
 	if (per_cpu(cpu_irq, cpu) == 0)
 		return;
 	if (WARN_ON(irq != per_cpu(cpu_irq, cpu)))
 		return;
 
-	per_cpu(cpu_irq_ops, cpu)->free_pmuirq(irq, cpu, &cpu_armpmu);
+	per_cpu(cpu_irq_ops, cpu)->free_pmuirq(irq, cpu, armpmu);
 
 	per_cpu(cpu_irq, cpu) = 0;
 	per_cpu(cpu_irq_ops, cpu) = NULL;
 }
 
-int armpmu_request_irq(int irq, int cpu)
+int armpmu_request_irq(struct arm_pmu * __percpu *armpmu, int irq, int cpu)
 {
 	int err = 0;
 	const irq_handler_t handler = armpmu_dispatch_irq;
@@ -666,12 +666,12 @@ int armpmu_request_irq(int irq, int cpu)
 			    IRQF_NO_THREAD;
 
 		err = request_nmi(irq, handler, irq_flags, "arm-pmu",
-				  per_cpu_ptr(&cpu_armpmu, cpu));
+				  per_cpu_ptr(armpmu, cpu));
 
 		/* If cannot get an NMI, get a normal interrupt */
 		if (err) {
 			err = request_irq(irq, handler, irq_flags, "arm-pmu",
-					  per_cpu_ptr(&cpu_armpmu, cpu));
+					  per_cpu_ptr(armpmu, cpu));
 			irq_ops = &pmuirq_ops;
 		} else {
 			has_nmi = true;
diff --git a/drivers/perf/arm_pmu_acpi.c b/drivers/perf/arm_pmu_acpi.c
index a5956fa728070..a28352e2bff0a 100644
--- a/drivers/perf/arm_pmu_acpi.c
+++ b/drivers/perf/arm_pmu_acpi.c
@@ -223,7 +223,7 @@ static int arm_pmu_acpi_parse_irqs(void)
 		 * them with their PMUs.
 		 */
 		per_cpu(pmu_irqs, cpu) = irq;
-		err = armpmu_request_irq(irq, cpu);
+		err = armpmu_request_irq(&probed_pmus, irq, cpu);
 		if (err)
 			goto out_err;
 	}
diff --git a/drivers/perf/arm_pmu_platform.c b/drivers/perf/arm_pmu_platform.c
index 0c7d5065e9074..d9b0e8f6debf2 100644
--- a/drivers/perf/arm_pmu_platform.c
+++ b/drivers/perf/arm_pmu_platform.c
@@ -169,7 +169,7 @@ static int armpmu_request_irqs(struct arm_pmu *armpmu)
 		if (!irq)
 			continue;
 
-		err = armpmu_request_irq(irq, cpu);
+		err = armpmu_request_irq(&hw_events->percpu_pmu, irq, cpu);
 		if (err)
 			break;
 	}
@@ -185,7 +185,7 @@ static void armpmu_free_irqs(struct arm_pmu *armpmu)
 	for_each_cpu(cpu, &armpmu->supported_cpus) {
 		int irq = per_cpu(hw_events->irq, cpu);
 
-		armpmu_free_irq(irq, cpu);
+		armpmu_free_irq(&hw_events->percpu_pmu, irq, cpu);
 	}
 }
 
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 7bf548678b288..395d03c282e8c 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -191,8 +191,8 @@ bool arm_pmu_irq_is_nmi(void);
 struct arm_pmu *armpmu_alloc(void);
 void armpmu_free(struct arm_pmu *pmu);
 int armpmu_register(struct arm_pmu *pmu);
-int armpmu_request_irq(int irq, int cpu);
-void armpmu_free_irq(int irq, int cpu);
+int armpmu_request_irq(struct arm_pmu * __percpu *armpmu, int irq, int cpu);
+void armpmu_free_irq(struct arm_pmu * __percpu *armpmu, int irq, int cpu);
 
 #define ARMV8_PMU_PDEV_NAME "armv8-pmu"
 
-- 
2.39.2


