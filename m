Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090BFCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 21:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2GtJHBzDcmYlbHghwmtxMILKeFIMO+Ff8lGch7jV0Q=; b=1wJFd/gSKtP3TIYgWNckh60n1p
	ymPvE7s93iDl010t2jwSO8D57VkqJHPvgzIL6VHp7nR2lSbvfia9n1Bo18cpbdbx/ZkMxYa2AlSio
	FGPEG+6KRQceJH2OG7QdqHqZ8RVNlYnz3/rUEp8seQtHsriGM/Zj+vjmNmIHUS366p+LAZhhdGHyG
	jv/zM4IvBSv/FziCtb+2Z0Qow+RFbby2x8n5gGqOtoTwyGspBKxrJIhF81/idjU4/mXcAlGueRdkg
	MMH1ZM/e+wR/Mn+8Yxb3DBTJREuZ5mKbLicbTpPSGujs7vV6qJiGxSK/cnQpz88vmgcfloL4RJRY5
	ZhoSr7xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xClHS-0000000CZCM-1cOT;
	Fri, 02 Oct 2026 21:59:02 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xClHM-0000000CZ9A-2K9j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 21:58:57 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2431820B7169;
	Fri,  2 Oct 2026 14:58:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2431820B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1790978281;
	bh=b2GtJHBzDcmYlbHghwmtxMILKeFIMO+Ff8lGch7jV0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bY/eCuPtmV+/cl9lGxAHg9mVkeIqewu+FwiHuWbNU6TkRDLg0RCJPMYgsbXZb9yZp
	 4roTg0N7pVxP5vzT5OM13fXad3Pj7EXUahyzKsH3VP8hc1VmmzPBaK+5db670FZy4p
	 uPnx5WAkoFJIQIqLQPRQcDCGh4OYDFxdfbF01FHU=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	mhklinux@outlook.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	arnd@arndb.de,
	thuth@redhat.com,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v5 3/6] arm64: hyperv: Add per-CPU RSI host call infrastructure for CCA Realms
Date: Fri,  2 Oct 2026 14:57:22 -0700
Message-ID: <20261002215725.2015959-4-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261002215725.2015959-1-kameroncarr@linux.microsoft.com>
References: <20261002215725.2015959-1-kameroncarr@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_145856_613684_93D9BB0E 
X-CRM114-Status: GOOD (  15.35  )
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

Arm CCA Realms cannot issue Hyper-V hypercalls via HVC; the guest must
route them through the RSI_HOST_CALL interface, which takes the IPA of a
per-CPU rsi_host_call structure as its argument.

Add hv_hostcall_array as a per-CPU struct array and allocate it during
hyperv_init(). The allocation is gated on is_realm_world() so non-Realm
arm64 Hyper-V guests pay no memory cost.

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
---
 arch/arm64/hyperv/mshyperv.c      | 28 ++++++++++++++++++++++++++--
 arch/arm64/include/asm/mshyperv.h |  4 ++++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 4fdc26a..b1657cf 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -11,14 +11,19 @@
 
 #include <linux/types.h>
 #include <linux/acpi.h>
+#include <linux/arm-rsi-cmds.h>
 #include <linux/export.h>
 #include <linux/errno.h>
+#include <linux/slab.h>
 #include <linux/version.h>
 #include <linux/cpuhotplug.h>
 #include <asm/mshyperv.h>
 
 static bool hyperv_initialized;
 
+struct rsi_host_call *hv_hostcall_array;
+EXPORT_SYMBOL_GPL(hv_hostcall_array);
+
 int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
 {
 	hv_get_vpreg_128(HV_REGISTER_HYPERVISOR_VERSION,
@@ -85,6 +90,20 @@ static int __init hyperv_init(void)
 	if (!hyperv_detect_via_acpi() && !hyperv_detect_via_smccc())
 		return 0;
 
+	/*
+	 * The RSI host-call buffers are only ever used when
+	 * is_realm_world() is true. Skip the allocation on non-Realm
+	 * guests. A single contiguous array of nr_cpu_ids entries is
+	 * allocated; each CPU indexes into it by its processor ID.
+	 */
+	if (is_realm_world()) {
+		hv_hostcall_array = kcalloc(nr_cpu_ids,
+					    sizeof(struct rsi_host_call),
+					    GFP_KERNEL);
+		if (!hv_hostcall_array)
+			return -ENOMEM;
+	}
+
 	/* Setup the guest ID */
 	guest_id = hv_generate_guest_id(LINUX_VERSION_CODE);
 	hv_set_vpreg(HV_REGISTER_GUEST_OS_ID, guest_id);
@@ -106,13 +125,13 @@ static int __init hyperv_init(void)
 
 	ret = hv_common_init();
 	if (ret)
-		return ret;
+		goto free_hostcall_mem;
 
 	ret = cpuhp_setup_state(CPUHP_AP_HYPERV_ONLINE, "arm64/hyperv_init:online",
 				hv_common_cpu_init, hv_common_cpu_die);
 	if (ret < 0) {
 		hv_common_free();
-		return ret;
+		goto free_hostcall_mem;
 	}
 
 	if (ms_hyperv.priv_high & HV_ACCESS_PARTITION_ID)
@@ -125,6 +144,11 @@ static int __init hyperv_init(void)
 
 	hyperv_initialized = true;
 	return 0;
+
+free_hostcall_mem:
+	kfree(hv_hostcall_array);
+	hv_hostcall_array = NULL;
+	return ret;
 }
 
 early_initcall(hyperv_init);
diff --git a/arch/arm64/include/asm/mshyperv.h b/arch/arm64/include/asm/mshyperv.h
index b721d31..aed0aa5 100644
--- a/arch/arm64/include/asm/mshyperv.h
+++ b/arch/arm64/include/asm/mshyperv.h
@@ -61,6 +61,10 @@ static inline u64 hv_get_non_nested_msr(unsigned int reg)
 				ARM_SMCCC_OWNER_VENDOR_HYP,	\
 				HV_SMCCC_FUNC_NUMBER)
 
+/* Per-CPU-indexed RSI host call structures for CCA Realms */
+struct rsi_host_call;
+extern struct rsi_host_call *hv_hostcall_array;
+
 #include <asm-generic/mshyperv.h>
 
 #endif
-- 
2.45.4


