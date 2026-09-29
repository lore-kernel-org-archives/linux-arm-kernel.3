Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64FCCA5FAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 22:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gS6cA2ELPzbQU90TjGNN8M+hTe51rZqdAi73cLn7frs=; b=3qF4xG4dVi3npEtDmc0GW1MCj+
	GU6yis5ruwUH114pibzqxFYYx9aau943MTe/mZyu1pLAF/fAETX6WKDVVUOvLTwLpYXdJCF0K1Izt
	oMG17pR0dkCRcRZyGHDw0hWgiRg1+KF6/HFJ2I/kjd6tutywvueCYr0dP9cALDfRMjx1PQN9wnTHf
	map66YBRFnK422xQaZRPLUvXIMxdLaZLQlaTLkuuALE11+0LL3g4xTyMzBhaqjWdHdatEX4YzIG5u
	F7zKsunLPv/CXNjN/9ypBaB7gKfcStLLARf7Z2gD9fViOGAB8e4GiWfaKgYRnyb/fQoq1+/sR9hdf
	wBglMjJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBg8X-00000004gKS-1a5Q;
	Tue, 29 Sep 2026 22:17:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBg8I-00000004gET-2scM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 22:17:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCDD41516;
	Tue, 29 Sep 2026 15:17:01 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9CDEE3F85F;
	Tue, 29 Sep 2026 15:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790720225; bh=bOPfrjZC9H0ZdpIC5yzFK/KuR63sWAw36xeTjbxYxb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BUJoILqN3MexnXVDG7eeaKD0yQYeZvc3vwl2HbjB5GMinIoytwhW1vHWq7FU++A2Q
	 o8URuWuBf1xW5Yz+NtSqt0ERv/pWm0TTqURBK3ChlxKETM1S7ZMlIgCoYrsnGEJGCa
	 QJPKxxJpk9bxqStQtA1vY503C6CQfSmatHAjX1rY=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v20 7/9] arm64: Block hibernate and kexec while RMM is active
Date: Tue, 29 Sep 2026 23:16:21 +0100
Message-ID: <20260929221623.1342076-8-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929221623.1342076-1-suzuki.poulose@arm.com>
References: <20260929221623.1342076-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_151706_836516_F662FB5E 
X-CRM114-Status: GOOD (  15.43  )
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

RMM can be deactivated only after all delegated granules have been
reclaimed. If a new kernel is entered while any granules remain in the
Realm PAS, accesses to that memory can raise a Granule Protection Fault
and be fatal to the new kernel.

Crash kexec/kdump needs separate handling. It can be supported only once
the crash kernel can tolerate delegated memory inherited from the primary
kernel. i.e., be able to read the pages safely and fixup the GPF. Until
then disable the kexec completely.

Hibernate has a similar problem. The image cannot be safely saved for
delegated pages, as the RMM doesn't support exporting the pages.

Disable both kexec and hiberation while the RMM is active.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v19:
 - New patch to disable kexec and hibernation with RMM
---
 arch/arm64/kernel/hibernate.c     |  6 ++++++
 arch/arm64/kernel/machine_kexec.c | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 7bf1174277772..d02f01c17febf 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -10,6 +10,7 @@
  * Copyright (C) 2006 Rafael J. Wysocki <rjw@sisk.pl>
  */
 #define pr_fmt(x) "hibernate: " x
+#include <linux/arm-rmi-cmds.h>
 #include <linux/cpu.h>
 #include <linux/kvm_host.h>
 #include <linux/pm.h>
@@ -341,6 +342,11 @@ int swsusp_arch_suspend(void)
 		return -EBUSY;
 	}
 
+	if (is_rmm_active()) {
+		pr_err("Can't hibernate: RMM is active.\n");
+		return -EBUSY;
+	}
+
 	flags = local_daif_save();
 
 	if (__cpu_suspend_enter(&state)) {
diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
index 8f9bc2327dc85..48f343704cb54 100644
--- a/arch/arm64/kernel/machine_kexec.c
+++ b/arch/arm64/kernel/machine_kexec.c
@@ -6,6 +6,7 @@
  * Copyright (C) Huawei Futurewei Technologies.
  */
 
+#include <linux/arm-rmi-cmds.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
@@ -59,6 +60,16 @@ int machine_kexec_prepare(struct kimage *kimage)
 		return -EBUSY;
 	}
 
+	/*
+	 * We will be able to allow kdump to proceed, once we have the support
+	 * for handling GPF from vmcore accesses to delegated pages. Until then
+	 * block kexec completely.
+	 */
+	if (is_rmm_active()) {
+		pr_err("Can't kexec: RMM is active.\n");
+		return -EBUSY;
+	}
+
 	return 0;
 }
 
-- 
2.43.0


