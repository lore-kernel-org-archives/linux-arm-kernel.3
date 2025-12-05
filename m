Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEE5D374AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLOxbNNlmSgHSP2J408N57Sx5RZBWQutoPpd4LRFU/o=; b=khunrLgQnk5cuhFTihNKCxNRfs
	RcUv0mS4rpdM6+Lx1GUS1y0AmwZO5UzOvBdmOOZrZIeKqUk3VXq6l9mdlruUd/DG40EU6EA2JtlCv
	7PJdNRKGbjlsiCIBn24rgunDZgvv3Y6I1zbrDABU8q4XbCDQM9LTSYueeQ/uHYGBaPe02J0IQelHg
	/DYVBKapDMP97c6nWmn07NKY+ygNCakAYiQWoplfa+vL0t+09kX40EhSjkOe4yRj7xscR+EtZqj9Z
	0PV05CabFlA3tbtbtTs9anjnfsxmlWiDr46FDnHkStqzzveYldwAiNN+SNkvOGIbkPbinHIqoQWnF
	d+I6mFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdro-0000000A6qS-3DAa;
	Fri, 05 Dec 2025 22:01:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdrl-0000000A6l9-0zSt
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 05 Dec 2025 22:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qLOxbNNlmSgHSP2J408N57Sx5RZBWQutoPpd4LRFU/o=; b=dinQ7D5GsiogZiSsLqDKur8huD
	aZdZUf+0y82WmAsu0mJEPMa8fftEbtYGyD9kf3QXSMuHffNgEtReJ35rQx4+q65P5ILfXLDElHOfR
	bA8TBqv48dIeUctmMuRm3UTb6Q9bkqzkSurQXLvfmKyrk80RYkofqSSkHsPp+/nlSpzxCvX41muIC
	/Fz72ZUrSv0TiRFX0H4ypxgTNECZn6z7omslmN3waLRwLOfZnxLSjSrzooZPgzTfTT5xagupmjeFf
	9heoUu4m2cCUsWVwxXn1wZCQjmT/seJYi9MxG0aLY0Bp9RCrq/ERwWxjADUDvxDlC54Vr7aeGh/b9
	ZQrMs0MQ==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdrg-00000006IoD-0gIp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 22:01:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0104B1AC1;
	Fri,  5 Dec 2025 14:01:15 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 810FE3F740;
	Fri,  5 Dec 2025 14:01:18 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: James Morse <james.morse@arm.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@kernel.org>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Ben Horgan <ben.horgan@arm.com>,
	rohit.mathew@arm.com,
	reinette.chatre@intel.com,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: [RFC PATCH 28/38] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
Date: Fri,  5 Dec 2025 21:58:51 +0000
Message-Id: <20251205215901.17772-29-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_220124_515839_963E3245 
X-CRM114-Status: GOOD (  15.58  )
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

Enough MPAM support is present to enable ARCH_HAS_CPU_RESCTRL.
Let it rip^Wlink!

ARCH_HAS_CPU_RESCTRL indicates resctrl can be enabled. It is enabled
by the arch code sipmly because it has 'arch' in its name.

This removes ARM_CPU_RESCTRL as a mimic of X86_CPU_RESCTRL.
While here, move the ACPI dependency to the driver's Kconfig file.

Signed-off-by: James Morse <james.morse@arm.com>
---
 arch/arm64/Kconfig               | 4 ++--
 arch/arm64/include/asm/resctrl.h | 2 ++
 drivers/resctrl/Kconfig          | 9 ++++++++-
 drivers/resctrl/Makefile         | 2 +-
 4 files changed, 13 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/include/asm/resctrl.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 558baa9e7c08..e67885ac7717 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2025,8 +2025,8 @@ config ARM64_TLB_RANGE
 
 config ARM64_MPAM
 	bool "Enable support for MPAM"
-	select ARM64_MPAM_DRIVER if EXPERT	# does nothing yet
-	select ACPI_MPAM if ACPI
+	select ARM64_MPAM_DRIVER
+	select ARCH_HAS_CPU_RESCTRL
 	help
 	  Memory System Resource Partitioning and Monitoring (MPAM) is an
 	  optional extension to the Arm architecture that allows each
diff --git a/arch/arm64/include/asm/resctrl.h b/arch/arm64/include/asm/resctrl.h
new file mode 100644
index 000000000000..b506e95cf6e3
--- /dev/null
+++ b/arch/arm64/include/asm/resctrl.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/arm_mpam.h>
diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
index c808e0470394..672abea3b03c 100644
--- a/drivers/resctrl/Kconfig
+++ b/drivers/resctrl/Kconfig
@@ -1,6 +1,7 @@
 menuconfig ARM64_MPAM_DRIVER
 	bool "MPAM driver"
-	depends on ARM64 && ARM64_MPAM && EXPERT
+	depends on ARM64 && ARM64_MPAM
+	select ACPI_MPAM if ACPI
 	help
 	  Memory System Resource Partitioning and Monitoring (MPAM) driver for
 	  System IP, e.g. caches and memory controllers.
@@ -22,3 +23,9 @@ config MPAM_KUNIT_TEST
 	  If unsure, say N.
 
 endif
+
+config ARM64_MPAM_RESCTRL_FS
+	bool
+	default y if ARM64_MPAM_DRIVER && RESCTRL_FS
+	select RESCTRL_RMID_DEPENDS_ON_CLOSID
+	select RESCTRL_ASSIGN_FIXED
diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
index 40beaf999582..4f6d0e81f9b8 100644
--- a/drivers/resctrl/Makefile
+++ b/drivers/resctrl/Makefile
@@ -1,5 +1,5 @@
 obj-$(CONFIG_ARM64_MPAM_DRIVER)			+= mpam.o
 mpam-y						+= mpam_devices.o
-mpam-$(CONFIG_ARM_CPU_RESCTRL)			+= mpam_resctrl.o
+mpam-$(CONFIG_ARM64_MPAM_RESCTRL_FS)		+= mpam_resctrl.o
 
 ccflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)	+= -DDEBUG
-- 
2.39.5


