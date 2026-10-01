Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E37CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 22:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycRoSo6v9no6J86a0wkCKWwmTEzLea9rGkXyDkVfbNE=; b=Jr7Osah9DwJDRPrcIYjhu36CHe
	Uo1Zd3NK+z503hTwrJcqufGiuXsUxLd6r0Su2wkhzD9Ie+GxFJ9CAFm43Ej2XPSY4b4sxiRxFJSOD
	ubBmzh+MB/TnXalYvNuW1Hlc3PwuEIleQKniFVkzKoMIe053hyVbI1wPu2QExQ2nxRwpBsLvzvEQM
	6OPVRIvZf4olHpPqC99BHygvATMK2czStJWH0T0PE2lOeRR8JaFaxoAQOt+y34XHiru6MWbUCfTLv
	UNqGG8Z5WVSPiKV5HGXQqyQH7rvSKSWX54k8QQJzLG3cacAvkjSwE8bW1DZFD6/obWxsP4uc0dvrn
	Y/J+EptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCOvi-0000000AK9B-2zEO;
	Thu, 01 Oct 2026 22:07:06 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCOve-0000000AK6h-2nNH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 22:07:03 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id F0EC620B716A;
	Thu,  1 Oct 2026 15:06:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com F0EC620B716A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1790892368;
	bh=ycRoSo6v9no6J86a0wkCKWwmTEzLea9rGkXyDkVfbNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E0YGiyuU3h0cEbGV/eE6I8JQorXtnwZw83pV8LGt1PkHYNn4303Mmz69XFtkJbYYI
	 bmsDvy+Gy4CR+mAEJvF1CS44/waKyzKGWgpL0IrsiB1PRNXbStxuJyLItil8D9ldfR
	 BQdbF0qC7JKF+g2/7oJAoV3dwgZ+eV+ShfVPbtug=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
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
Subject: [PATCH v4 4/6] Drivers: hv: Mark shared memory as decrypted for CCA Realms
Date: Thu,  1 Oct 2026 15:05:50 -0700
Message-ID: <20261001220552.1793471-5-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261001220552.1793471-1-kameroncarr@linux.microsoft.com>
References: <20261001220552.1793471-1-kameroncarr@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_150702_730746_947932EC 
X-CRM114-Status: GOOD (  12.52  )
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

In hv_common_cpu_init(), the per-CPU hypercall input/output pages need
to be marked as decrypted (shared) for confidential VM isolation types.
This is already done for SNP and TDX isolation; extend the same handling
to Arm CCA Realm guests so that the host hypervisor can access the
shared hypercall buffers.

is_realm_world() is only declared in arch/arm64/include/asm/rsi.h, so
using it directly in the arch-neutral drivers/hv/hv_common.c would
break the x86 build. Introduce a Hyper-V-specific helper following the
established hv_isolation_type_snp() / hv_isolation_type_tdx() pattern.

On architectures other than arm64 the weak default keeps the existing
behaviour.

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
---
 arch/arm64/hyperv/mshyperv.c   |  5 +++++
 drivers/hv/hv_common.c         | 17 +++++++++++++----
 include/asm-generic/mshyperv.h |  1 +
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index b1657cf..45ca8e2 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -158,3 +158,8 @@ bool hv_is_hyperv_initialized(void)
 	return hyperv_initialized;
 }
 EXPORT_SYMBOL_GPL(hv_is_hyperv_initialized);
+
+bool hv_isolation_type_cca(void)
+{
+	return is_realm_world();
+}
diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index 31256cb..a60c92c 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -476,6 +476,7 @@ int hv_common_cpu_init(unsigned int cpu)
 	u64 msr_vp_index;
 	gfp_t flags;
 	const int pgcount = hv_output_page_exists() ? 2 : 1;
+	const size_t alloc_size = ALIGN((size_t)pgcount * HV_HYP_PAGE_SIZE, PAGE_SIZE);
 	void *mem;
 	int ret = 0;
 
@@ -489,7 +490,7 @@ int hv_common_cpu_init(unsigned int cpu)
 	 * online and then taken offline
 	 */
 	if (!*inputarg) {
-		mem = kmalloc_array(pgcount, HV_HYP_PAGE_SIZE, flags);
+		mem = kmalloc(alloc_size, flags);
 		if (!mem)
 			return -ENOMEM;
 
@@ -499,14 +500,16 @@ int hv_common_cpu_init(unsigned int cpu)
 		}
 
 		if (!ms_hyperv.paravisor_present &&
-		    (hv_isolation_type_snp() || hv_isolation_type_tdx())) {
-			ret = set_memory_decrypted((unsigned long)mem, pgcount);
+		    (hv_isolation_type_snp() || hv_isolation_type_tdx() ||
+		     hv_isolation_type_cca())) {
+			ret = set_memory_decrypted((unsigned long)mem,
+						   alloc_size >> PAGE_SHIFT);
 			if (ret) {
 				/* It may be unsafe to free 'mem' */
 				return ret;
 			}
 
-			memset(mem, 0x00, pgcount * HV_HYP_PAGE_SIZE);
+			memset(mem, 0x00, alloc_size);
 		}
 
 		/*
@@ -666,6 +669,12 @@ bool __weak hv_isolation_type_tdx(void)
 }
 EXPORT_SYMBOL_GPL(hv_isolation_type_tdx);
 
+bool __weak hv_isolation_type_cca(void)
+{
+	return false;
+}
+EXPORT_SYMBOL_GPL(hv_isolation_type_cca);
+
 void __weak hv_setup_vmbus_handler(void (*handler)(void))
 {
 }
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index bf601d6..1fa79ab 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -79,6 +79,7 @@ u64 hv_do_fast_hypercall16(u16 control, u64 input1, u64 input2);
 
 bool hv_isolation_type_snp(void);
 bool hv_isolation_type_tdx(void);
+bool hv_isolation_type_cca(void);
 
 /*
  * On architectures where Hyper-V doesn't support AEOI (e.g., ARM64),
-- 
2.45.4


