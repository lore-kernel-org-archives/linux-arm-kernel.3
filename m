Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A22CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4plg/CCnAHmMhU7oNaxdOrf7OwTGoSq+OW/a8bsz8Q=; b=Cdcdjz8livwmAJdpRBT3u7kFXH
	6tDOz+0SxdmwxDNoh9XJOmFQc1cxxgHdzuWO6AYVpznjk5xr0EqK1YbDykjwgSxb7BiZ94pokzKAB
	tmKHIXHgtDexxE/nuf1NuR/kpc3O4cHtOmHi7Be8jmT/bkIuX4by7kxM2dc/r/K85WEk3BAS2zYp+
	lzAmctucpSRyj93evMePnBMYWWqyJ9kqWAwGGqfUIezNwIUQVs8ZrK1It4sU2OKkTXl63uQ/61gZ1
	LDjzY8rw+K49/5yndwzwpx/OP4P5CzXdqMOjOGw62B4J/sWsDgXckkbb5q8N9qkyXeywBCgoA42kA
	1v5Mzvrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcnyz-00000009YWX-13nA;
	Thu, 25 Jun 2026 17:35:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcnyt-00000009YRW-3Gp2
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 25 Jun 2026 17:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Q4plg/CCnAHmMhU7oNaxdOrf7OwTGoSq+OW/a8bsz8Q=; b=pIC8Lwzx5UJhryNyT28hXpHB4N
	PIroDh49w9lV6RfMjuRbtg4kgAE4Z+y91LOzO0xueXRSc5rg8B660nu37tfuICwIl7dTh1vAUnvPO
	HB0mQyExIiNIyeNKsHBfbxj+SJMCRtXzTlS75j47jCloBnzzLhr0RC3KjEQB/tspj5pbRdXyExXwi
	tgkRia/yLb4WeGuNZC1kd5Vjq0AKitAjLzVb9aEh/GfSP30Q5rxUqkAg4TTnhp+yo4PQsZNGerd2z
	cfTWwbB3WMEbxH5tsWzmtWrOO8qik2HRICoKSzwJWjf9XnNX0ViTkWg1qB6n5C5f1nWl19xgLlsUn
	4OzqZUwQ==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wcnyo-00000003v6G-3ooq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 17:35:14 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 07CF620B716B;
	Thu, 25 Jun 2026 10:35:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 07CF620B716B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1782408902;
	bh=Q4plg/CCnAHmMhU7oNaxdOrf7OwTGoSq+OW/a8bsz8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RxwPVkXf0/SDnnz5NPRshY33e6dlHY9NkBHoDkJwEez7QIZ6ZxOw63ocj1nyj/bhH
	 aPTVfGqXryVUrhoHVuTe8vZfMKGW0HYLF7XtIoWAG8ke4EnPo1aX2OV0EhOQP85hCP
	 wcc3DR2olTd01we6nLCQsYhZVPDljacrdal/pAtc=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com
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
	linux-arch@vger.kernel.org,
	mhklinux@outlook.com
Subject: [PATCH v2 3/6] arm64: hyperv: Add per-CPU RSI host call infrastructure for CCA Realms
Date: Thu, 25 Jun 2026 10:34:57 -0700
Message-ID: <20260625173500.1995481-4-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260625173500.1995481-1-kameroncarr@linux.microsoft.com>
References: <20260625173500.1995481-1-kameroncarr@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_183511_122849_03D94032 
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

Arm CCA Realms cannot issue Hyper-V hypercalls via HVC; the guest must
route them through the RSI_HOST_CALL interface, which takes the IPA of a
per-CPU rsi_host_call structure as its argument.

Add hv_hostcall_array as a per-CPU struct array and allocate it during
hyperv_init(). The allocation is gated on is_realm_world() so non-Realm
arm64 Hyper-V guests pay no memory cost.

Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
---
 arch/arm64/hyperv/mshyperv.c      | 32 ++++++++++++++++++++++++++++++-
 arch/arm64/include/asm/mshyperv.h |  4 ++++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 4fdc26ade1d74..7d536d7fb557e 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -15,10 +15,15 @@
 #include <linux/errno.h>
 #include <linux/version.h>
 #include <linux/cpuhotplug.h>
+#include <linux/slab.h>
 #include <asm/mshyperv.h>
+#include <asm/rsi.h>
 
 static bool hyperv_initialized;
 
+struct rsi_host_call *hv_hostcall_array;
+EXPORT_SYMBOL_GPL(hv_hostcall_array);
+
 int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
 {
 	hv_get_vpreg_128(HV_REGISTER_HYPERVISOR_VERSION,
@@ -60,6 +65,12 @@ static bool __init hyperv_detect_via_acpi(void)
 
 #endif
 
+static void hv_hostcall_free(void)
+{
+	kfree(hv_hostcall_array);
+	hv_hostcall_array = NULL;
+}
+
 static bool __init hyperv_detect_via_smccc(void)
 {
 	uuid_t hyperv_uuid = UUID_INIT(
@@ -85,6 +96,20 @@ static int __init hyperv_init(void)
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
@@ -106,12 +131,13 @@ static int __init hyperv_init(void)
 
 	ret = hv_common_init();
 	if (ret)
-		return ret;
+		goto free_hostcall_mem;
 
 	ret = cpuhp_setup_state(CPUHP_AP_HYPERV_ONLINE, "arm64/hyperv_init:online",
 				hv_common_cpu_init, hv_common_cpu_die);
 	if (ret < 0) {
 		hv_common_free();
+		hv_hostcall_free();
 		return ret;
 	}
 
@@ -125,6 +151,10 @@ static int __init hyperv_init(void)
 
 	hyperv_initialized = true;
 	return 0;
+
+free_hostcall_mem:
+	hv_hostcall_free();
+	return ret;
 }
 
 early_initcall(hyperv_init);
diff --git a/arch/arm64/include/asm/mshyperv.h b/arch/arm64/include/asm/mshyperv.h
index b721d3134ab66..c207a3f79b99b 100644
--- a/arch/arm64/include/asm/mshyperv.h
+++ b/arch/arm64/include/asm/mshyperv.h
@@ -63,4 +63,8 @@ static inline u64 hv_get_non_nested_msr(unsigned int reg)
 
 #include <asm-generic/mshyperv.h>
 
+/* Per-CPU-indexed RSI host call structures for CCA Realms */
+struct rsi_host_call;
+extern struct rsi_host_call *hv_hostcall_array;
+
 #endif
-- 
2.45.4


