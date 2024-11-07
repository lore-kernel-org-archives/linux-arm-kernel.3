Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB0BD5D696
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 22:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHc+xQlGELt4En+c+7A/3z04pCZMqJzqUOIthFcFkJE=; b=YUVmqpis8F2/uoaAG2FGI7TC2/
	FLbDYnEx0NT2Z7pgLZn+M8OsNbrXkMfI757zozZr2YAOFxUlY+XSOXYKDbnYaE/tvj/fDu+5Ywc79
	KUpneBvAZFG3C1+ULrKD+keHkITsu93S5MZP1w0uDJkRyLjLgdITG/V1gmRaQUYcn4+jS6DB7Y7iD
	RrdYC7AzNEUR8RqAHdEPrx6eCyCd/07Ezs8FfMobr+R3Wr65642U4gQ063vAEBgmlckXnk3w0XTie
	GYHUGuNLdptfAwbS+om2GpboZC2vJvlvseSwYuy85QkMnjAcHM9CIF+Coi9esor5qVc+LBNgvVzJJ
	Y+JNhkiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9B72-00000008YnM-0JJz;
	Thu, 07 Nov 2024 22:36:24 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9B3I-00000008XgC-34n9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 22:32:34 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id E7B68212D516;
	Thu,  7 Nov 2024 14:32:30 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E7B68212D516
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731018751;
	bh=oHc+xQlGELt4En+c+7A/3z04pCZMqJzqUOIthFcFkJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GL5L+XWBdQN0CU0yQzh/oq0vV6hbhcS/bNEnSQdxzEaESNw65fptL+NJKgM1Gen28
	 c3bykADGMex7+FRS3+DS62C4YYb9jk/FI0g7R/Hr86yKUJuqwQbcSXbVexHGykm8JI
	 t0alQ+hR1JEoU5hMKNS3j4wBN4/qb9DzOk3FwcMo=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	iommu@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	mhklinux@outlook.com,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	luto@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	seanjc@google.com,
	pbonzini@redhat.com,
	peterz@infradead.org,
	daniel.lezcano@linaro.org,
	joro@8bytes.org,
	robin.murphy@arm.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	arnd@arndb.de,
	sgarzare@redhat.com,
	jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com,
	mukeshrathor@microsoft.com,
	vkuznets@redhat.com,
	ssengar@linux.microsoft.com,
	apais@linux.microsoft.com
Subject: [PATCH v2 2/4] hyperv: Clean up unnecessary #includes
Date: Thu,  7 Nov 2024 14:32:24 -0800
Message-Id: <1731018746-25914-3-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731018746-25914-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1731018746-25914-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_143232_851059_FADCA890 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

Remove includes of linux/hyperv.h, mshyperv.h, and hyperv-tlfs.h where
they are not used.

Acked-by: Wei Liu <wei.liu@kernel.org>
Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
---
 arch/arm64/hyperv/hv_core.c     | 1 -
 arch/x86/hyperv/hv_apic.c       | 1 -
 arch/x86/hyperv/hv_init.c       | 1 -
 arch/x86/hyperv/hv_proc.c       | 1 -
 arch/x86/hyperv/ivm.c           | 1 -
 arch/x86/hyperv/mmu.c           | 1 -
 arch/x86/include/asm/kvm_host.h | 1 -
 arch/x86/include/asm/mshyperv.h | 1 -
 arch/x86/mm/pat/set_memory.c    | 2 --
 9 files changed, 10 deletions(-)

diff --git a/arch/arm64/hyperv/hv_core.c b/arch/arm64/hyperv/hv_core.c
index f1ebc025e1df..7a746a5a6b42 100644
--- a/arch/arm64/hyperv/hv_core.c
+++ b/arch/arm64/hyperv/hv_core.c
@@ -11,7 +11,6 @@
 #include <linux/types.h>
 #include <linux/export.h>
 #include <linux/mm.h>
-#include <linux/hyperv.h>
 #include <linux/arm-smccc.h>
 #include <linux/module.h>
 #include <asm-generic/bug.h>
diff --git a/arch/x86/hyperv/hv_apic.c b/arch/x86/hyperv/hv_apic.c
index 0569f579338b..f022d5f64fb6 100644
--- a/arch/x86/hyperv/hv_apic.c
+++ b/arch/x86/hyperv/hv_apic.c
@@ -23,7 +23,6 @@
 #include <linux/vmalloc.h>
 #include <linux/mm.h>
 #include <linux/clockchips.h>
-#include <linux/hyperv.h>
 #include <linux/slab.h>
 #include <linux/cpuhotplug.h>
 #include <asm/hypervisor.h>
diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
index 17a71e92a343..1a6354b3e582 100644
--- a/arch/x86/hyperv/hv_init.c
+++ b/arch/x86/hyperv/hv_init.c
@@ -27,7 +27,6 @@
 #include <linux/version.h>
 #include <linux/vmalloc.h>
 #include <linux/mm.h>
-#include <linux/hyperv.h>
 #include <linux/slab.h>
 #include <linux/kernel.h>
 #include <linux/cpuhotplug.h>
diff --git a/arch/x86/hyperv/hv_proc.c b/arch/x86/hyperv/hv_proc.c
index 3fa1f2ee7b0d..b74c06c04ff1 100644
--- a/arch/x86/hyperv/hv_proc.c
+++ b/arch/x86/hyperv/hv_proc.c
@@ -3,7 +3,6 @@
 #include <linux/vmalloc.h>
 #include <linux/mm.h>
 #include <linux/clockchips.h>
-#include <linux/hyperv.h>
 #include <linux/slab.h>
 #include <linux/cpuhotplug.h>
 #include <linux/minmax.h>
diff --git a/arch/x86/hyperv/ivm.c b/arch/x86/hyperv/ivm.c
index 60fc3ed72830..b56d70612734 100644
--- a/arch/x86/hyperv/ivm.c
+++ b/arch/x86/hyperv/ivm.c
@@ -7,7 +7,6 @@
  */
 
 #include <linux/bitfield.h>
-#include <linux/hyperv.h>
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <asm/svm.h>
diff --git a/arch/x86/hyperv/mmu.c b/arch/x86/hyperv/mmu.c
index 1cc113200ff5..cc8c3bd0e7c2 100644
--- a/arch/x86/hyperv/mmu.c
+++ b/arch/x86/hyperv/mmu.c
@@ -1,6 +1,5 @@
 #define pr_fmt(fmt)  "Hyper-V: " fmt
 
-#include <linux/hyperv.h>
 #include <linux/log2.h>
 #include <linux/slab.h>
 #include <linux/types.h>
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 4a68cb3eba78..3627eab994a3 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -24,7 +24,6 @@
 #include <linux/pvclock_gtod.h>
 #include <linux/clocksource.h>
 #include <linux/irqbypass.h>
-#include <linux/hyperv.h>
 #include <linux/kfifo.h>
 
 #include <asm/apic.h>
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index 390c4d13956d..47ca48062547 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -9,7 +9,6 @@
 #include <asm/hyperv-tlfs.h>
 #include <asm/nospec-branch.h>
 #include <asm/paravirt.h>
-#include <asm/mshyperv.h>
 
 /*
  * Hyper-V always provides a single IO-APIC at this MMIO address.
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 44f7b2ea6a07..85fa0d4509f0 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -32,8 +32,6 @@
 #include <asm/pgalloc.h>
 #include <asm/proto.h>
 #include <asm/memtype.h>
-#include <asm/hyperv-tlfs.h>
-#include <asm/mshyperv.h>
 
 #include "../mm_internal.h"
 
-- 
2.34.1


