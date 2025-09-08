Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4FBCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 19:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abhUxFE37CkRKL79X7XIupKed2ogkGUWwOCD2ZhTfuw=; b=Kn2S2O3FG/D3LkxJGTEMdjJN+p
	BNRSe+u+N6X4iZyBGbYDxZZt+Eb8AJogrQECAO0QWvDs6IKKMfjFFiSaZP75MhUZYkvrEABsc/Odh
	qTa876RtdXDdhmB/fi2T8HdP8X4FKIqswJ+aBb0QndbG0EfBYYoc0u0szFJo/tms1ZhBnurQjXg3W
	C6HDHXYViXYdSAPEoAFwsAq0OgcZVZQ494WSSLZuj66iERBDT3hK/RDPfkIHOFrR+qzTCx1N8RVHA
	PbeEEh8jrtI4LKwLxQBwnKyCcA7AGPXIRJAqcHfikuGvxSncgwEpQG9l2Ub6y+VYipu3LNMsZI8is
	p0+mZ1kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhzu-000000022Ta-32ja;
	Mon, 08 Sep 2025 19:57:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvemX-00000000lPv-26wW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:31:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6858644A35;
	Mon,  8 Sep 2025 16:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C024C4CEF5;
	Mon,  8 Sep 2025 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757349113;
	bh=cD24s1uQR7hSRj6QtBcBYKfVWIxSnzm+C5Yja2jxp7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qlEhDJ4YAXGuC8EFmcfFBAjs9NdaOGJZqIfnRCty4WPY7LHj8weCszBSl4zMA76UH
	 NFBQePEMrtcI4jjwb8i58GZ7/dFpoV3Ck9/srAuwI+dtDWZLLG8Y7ooGatlvx3mwiX
	 JQikxaKLfmCSpSZvNy6/BR+jflouvdrujfERNKcRBXcWJSYO4PGfdNlXrBmp0xBeuw
	 n3nPnr4kPbPNcnj2QkY49FowVHQ9goETcI4M6k9VaTM8tikDIFcxn1qxzNqvhGwB28
	 mNoNUo7aUQ/6mqYEHpq48A9eGCFMNGKD6pKscum0w5j/bqY/BQ21MTTC21vOQ2R0LS
	 ATC7oGHV8hgng==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uvemV-00000004NTm-2IEJ;
	Mon, 08 Sep 2025 16:31:51 +0000
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
Subject: [PATCH 22/25] irqchip/apple-aic: Drop support for custom PMU irq partitions
Date: Mon,  8 Sep 2025 17:31:24 +0100
Message-Id: <20250908163127.2462948-23-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250908_093153_596691_34E49744 
X-CRM114-Status: GOOD (  15.76  )
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

Similarly to what has been done for GICv3, drop the irq partitioning
support from the AIC driver, effectively merging the two per-cpu
interrupts for the PMU.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-apple-aic.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index dd89e50a72e83..5688411f9f0b8 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -578,16 +578,9 @@ static void __exception_irq_entry aic_handle_fiq(struct pt_regs *regs)
 	}
 
 	if ((read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) & (PMCR0_IMODE | PMCR0_IACT)) ==
-			(FIELD_PREP(PMCR0_IMODE, PMCR0_IMODE_FIQ) | PMCR0_IACT)) {
-		int irq;
-		if (cpumask_test_cpu(smp_processor_id(),
-				     &aic_irqc->fiq_aff[AIC_CPU_PMU_P]->aff))
-			irq = AIC_CPU_PMU_P;
-		else
-			irq = AIC_CPU_PMU_E;
+			(FIELD_PREP(PMCR0_IMODE, PMCR0_IMODE_FIQ) | PMCR0_IACT))
 		generic_handle_domain_irq(aic_irqc->hw_domain,
-					  AIC_FIQ_HWIRQ(irq));
-	}
+					  AIC_FIQ_HWIRQ(AIC_CPU_PMU_P));
 
 	if (static_branch_likely(&use_fast_ipi) &&
 	    (FIELD_GET(UPMCR0_IMODE, read_sysreg_s(SYS_IMP_APL_UPMCR0_EL1)) == UPMCR0_IMODE_FIQ) &&
@@ -632,18 +625,7 @@ static int aic_irq_domain_map(struct irq_domain *id, unsigned int irq,
 				    handle_fasteoi_irq, NULL, NULL);
 		irqd_set_single_target(irq_desc_get_irq_data(irq_to_desc(irq)));
 	} else {
-		int fiq = FIELD_GET(AIC_EVENT_NUM, hw);
-
-		switch (fiq) {
-		case AIC_CPU_PMU_P:
-		case AIC_CPU_PMU_E:
-			irq_set_percpu_devid_partition(irq, &ic->fiq_aff[fiq]->aff);
-			break;
-		default:
-			irq_set_percpu_devid(irq);
-			break;
-		}
-
+		irq_set_percpu_devid(irq);
 		irq_domain_set_info(id, irq, hw, &fiq_chip, id->host_data,
 				    handle_percpu_devid_irq, NULL, NULL);
 	}
@@ -735,6 +717,10 @@ static int aic_irq_domain_translate(struct irq_domain *id,
 				break;
 			}
 		}
+
+		/* Merge the two PMUs on a single interrupt */
+		if (*hwirq == AIC_CPU_PMU_E)
+			*hwirq = AIC_CPU_PMU_P;
 		break;
 	default:
 		return -EINVAL;
-- 
2.39.2


