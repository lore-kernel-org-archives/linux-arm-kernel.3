Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4E7C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbfEkMWtNMx20GqPmzRqb3hsZLBMLiH6bWO8FIcCpzg=; b=vdNPqC1RZaMuCKdfu89qg8Ct4S
	hTZtwqevqmrLgdutAOZLhDQxrZoT3X6m6Qda2mz9j+zFS8raqw8nrjEPLhhZPSsej3QpR3jaHkOYO
	FqLx4ab+xCRByFlHf5phF6UDRjkWabflwuLTIVmM05o2fLw5dPkb0GTRjKUGpGnzwY4PYJ0N68P0k
	aB8YoKqX2zHc8OiSQbLgZzyeHBh+Lo0c4dwVDnSHgyRp1T6Pf3OYAtta1UWJG5i3gEinOGfGifqiR
	a9KcSRQvWRsmc161ymrnnR9a7RsoqPcB7FQL4//aZ3KFsjfe6Xsyt5b9DdRdXm2AXsbQksDcx2KCZ
	YKToKs4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29yM-000000006Hf-3sZf;
	Thu, 03 Sep 2026 16:07:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29yF-000000005vU-3aJS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:07:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B055A1F37;
	Thu,  3 Sep 2026 09:07:19 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A74343F673;
	Thu,  3 Sep 2026 09:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788451643; bh=niz3RfvY/d8rpGz6tKQ0HPt0Q34iKw+9wA9OI+1T2WE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Zqa1GL1dezO/KuhlMRK/gjNeNLEyylU+N/sp6G5M4jdHlQ7U3m5MHDjHzAUwHGHHV
	 y1ou2dOoB2yzRlTNiXyVpBOY7GS6JzsdpsbdXfLd+RfruDXG6LG8SWTfvrH4i/eZLR
	 yGO0pTEhqwrVLhXCtkPZ0kx+6EHzddXkMg1MQAmU=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: [RFC PATCH v7 23/28] KVM: arm64: Add kvm-arm.ignore_spe_errata kernel parameter
Date: Thu,  3 Sep 2026 17:06:18 +0100
Message-ID: <20260903160623.315525-24-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090723_958948_26C319DF 
X-CRM114-Status: GOOD (  12.26  )
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

Add a new kernel command line parameter, kvm-arm.ignore_spe_errata with the
effect of ignoring any errata that might inhibit userspace from creating a
SPE enabled virtual machine.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  3 +++
 arch/arm64/kvm/spe.c                            | 10 +++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd2..2d91ce8e8c4b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3299,6 +3299,9 @@ Kernel parameters
 
 			notrap: clear WFI instruction trap
 
+	kvm-arm.ignore_spe_errata=
+			[KVM,ARM] Ignore SPE errata and expose SPE to guests.
+
 	kvm_cma_resv_ratio=n [PPC,EARLY]
 			Reserves given percentage from system memory area for
 			contiguous memory allocation for KVM hash pagetable
diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index ce68789d184b..3e82edc8be85 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -21,8 +21,16 @@ struct spe_pmu_entry {
 	struct arm_spe_pmu *spe_pmu;
 };
 
+static bool ignore_spe_errata;
+
 static void kvm_spe_update_irq_level(struct kvm_vcpu *vcpu, bool level);
 
+static int __init kvm_ignore_spe_errata(char *arg)
+{
+	return kstrtobool(arg, &ignore_spe_errata);
+}
+early_param("kvm-arm.ignore_spe_errata", kvm_ignore_spe_errata);
+
 void kvm_spe_add_instance(struct arm_spe_pmu *spe_pmu)
 {
 	struct spe_pmu_entry *entry;
@@ -290,7 +298,7 @@ static int kvm_spe_set_spe_id(struct kvm_vcpu *vcpu, int spe_id)
 		return 0;
 	}
 
-	if (spe_pmu->has_workaround_3023823)
+	if (spe_pmu->has_workaround_3023823 && !ignore_spe_errata)
 		return -EINVAL;
 
 	if (!try_module_get(spe_pmu->pmu.module))
-- 
2.43.0


