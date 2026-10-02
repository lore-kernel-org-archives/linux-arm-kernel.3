Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3226CCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 06:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CO4kAXIR6KQb0yRHkDei8XGizxLbHmuSVZ1fobiBQs=; b=e/2Tf66iRw/TR33EU8bfAqsqfy
	RHb8En6nJbv2D5oawv+Xc3H9uqlSml+mjWQgCRdVVwy9rzAbXo6ldiG2/uTFkRp4rUIWmXqx9Q96q
	XZl4kieOFL9agKuIWN2Dzu+fdJ+FyvOpDnKCNXs8ymBxDMKVMFiqj73wPpudUQi8K8Cx35o7Jrw9e
	pri/fpCKaxvkbBLqTDtYnUnZA5mi2UYlj9G1IEPxjvTt/bGivDBqCkVgatEBKiuK9odO6gHzRvaoJ
	mV+ttdcjErZiH1dcSUshkNZQJAdrqHMG2A2Ic766YGN6vEh84njdvCHAU7oyT/SqEI8Cd/zGwnoa+
	6g3jcW6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWYu-0000000AhSh-18JQ;
	Fri, 02 Oct 2026 06:16:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWYr-0000000AhPv-1aIk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 06:16:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57188169C;
	Thu,  1 Oct 2026 23:15:57 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9EF963F763;
	Thu,  1 Oct 2026 23:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790921760; bh=n2F3ScOdCk4J5EcEF98ICSkibYoMkmmvKMdyQDe7dVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ORIcdL5tuE/H3yLMf1awoEeIaYAtuq3bPffTslRCyFDlHEyIyMGg8PAM/SZlTxdM6
	 UUkgNj0e8USjKNQg8GIuiZbHKsUBt63MfmtRF21gxv0wH7uT5XPbyA/Uf25rWaBJRd
	 SqwZLTtbCXIi/BvIHE9uFZFRyaiVqJ1XT+z7FS3Q=
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
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-pm@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v22 07/10] kernel: hibernate: Add an arch hook for preventing hiberation
Date: Fri,  2 Oct 2026 07:15:03 +0100
Message-ID: <20261002061507.1600269-8-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002061507.1600269-1-suzuki.poulose@arm.com>
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_231601_531024_7A65B694 
X-CRM114-Status: GOOD (  11.78  )
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

Add a hook to allow arch code disable hibernation. On arm64, with an RMM active,
there could be pages that are delegated to the "Realm" security state. Any
access to them are fatal (e.g., hibernate save image or restoring an image to
a delegated page). pKVM host also has its restrictions on enabling hibernation.

Add a weak arch hook to let the architectures have a say.

Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>
Cc: linux-pm@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 include/linux/suspend.h  | 1 +
 kernel/power/hibernate.c | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/linux/suspend.h b/include/linux/suspend.h
index b02876f1ae38a..a3815027773c5 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -401,6 +401,7 @@ int hibernate_quiet_exec(int (*func)(void *data), void *data);
 int hibernate_resume_nonboot_cpu_disable(void);
 int arch_hibernation_header_save(void *addr, unsigned int max_size);
 int arch_hibernation_header_restore(void *addr);
+bool arch_hibernation_available(void);
 
 #else /* CONFIG_HIBERNATION */
 static inline void register_nosave_region(unsigned long b, unsigned long e) {}
diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index d2479c69d71a4..9d9d53828542f 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -106,11 +106,17 @@ bool hibernation_in_progress(void)
 	return !atomic_read(&hibernate_atomic);
 }
 
+__weak bool arch_hibernation_available(void)
+{
+	return true;
+}
+
 bool hibernation_available(void)
 {
 	return nohibernate == 0 &&
 		!security_locked_down(LOCKDOWN_HIBERNATION) &&
-		!secretmem_active() && !cxl_mem_active();
+		!secretmem_active() && !cxl_mem_active() &&
+		arch_hibernation_available();
 }
 
 /**
-- 
2.43.0


