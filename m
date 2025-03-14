Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E352C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 19:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQpDXagoqiBnz1ULF4xuJAkhLPjv+oLVEWalqIw1Byo=; b=SdnCmt4wCK5DxnmTmgXWqlf3U2
	WZgxUeN2HSHYSgUFnRpE4Rx1UkFXsj2dKWaEE0BO1nKsgy7NjdDpo1/AMl1M8d9L7RocYpwsexUQg
	zJ1WYTYLdK+EAbr3ZlzLLzhYPPgec3T4PGJ+xduDhnBZIK39KX1e6J3li33gNWnodFHQ7VYzZNvyE
	WnbWDhPGjQIGAaArW8lpjt2zx7u8jj0BEZn3ha18NBADaTXODhc/R2kJBQclFVLTdEivHwIKyY1ia
	BDxOja/x4iU5aPjvW/DheqjQ+coEwAZXyUBeCmFJVEsUm7jYTcKx7ue+ZirR9NXK7e46CxJzY2gid
	URh3ITMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAni-0000000F8KJ-3HsU;
	Fri, 14 Mar 2025 19:34:34 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAij-0000000F74b-2Ave
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 19:29:27 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5DAC22033459;
	Fri, 14 Mar 2025 12:29:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5DAC22033459
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741980564;
	bh=kQpDXagoqiBnz1ULF4xuJAkhLPjv+oLVEWalqIw1Byo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QgsX3nal9IDsR2TJGB/RRIgqwXlA1XJAcEFtFir/jWdb0FV+lxfTqCBlPUIFANd3e
	 Vc6uZgDGxORP3rIneNmC1gyNtfyTIg+OL8ArNcTFcoLWqp//OtwVhCq7tPae3e10I1
	 oGTCxEimeV33kN0de0MCS5Snl2CS0w1KGYaSPRZI=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	mhklinux@outlook.com,
	ltykernel@gmail.com,
	stanislav.kinsburskiy@gmail.com,
	linux-acpi@vger.kernel.org,
	eahariha@linux.microsoft.com,
	jeff.johnson@oss.qualcomm.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	daniel.lezcano@linaro.org,
	joro@8bytes.org,
	robin.murphy@arm.com,
	arnd@arndb.de,
	jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	ssengar@linux.microsoft.com,
	apais@linux.microsoft.com,
	gregkh@linuxfoundation.org,
	vkuznets@redhat.com,
	prapal@linux.microsoft.com,
	anrayabh@linux.microsoft.com,
	rafael@kernel.org,
	lenb@kernel.org,
	corbet@lwn.net
Subject: [PATCH v6 03/10] arm64/hyperv: Add some missing functions to arm64
Date: Fri, 14 Mar 2025 12:28:49 -0700
Message-Id: <1741980536-3865-4-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_122925_600691_77032970 
X-CRM114-Status: GOOD (  12.82  )
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

These non-nested msr and fast hypercall functions are present in x86,
but they must be available in both architectures for the root partition
driver code.

While at it, remove the redundant 'extern' keywords from the
hv_do_hypercall() variants in asm-generic/mshyperv.h.

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Reviewed-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Reviewed-by: Roman Kisel <romank@linux.microsoft.com>
---
 arch/arm64/hyperv/hv_core.c       | 17 +++++++++++++++++
 arch/arm64/include/asm/mshyperv.h | 13 +++++++++++++
 include/asm-generic/mshyperv.h    |  6 ++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/hyperv/hv_core.c b/arch/arm64/hyperv/hv_core.c
index 69004f619c57..e33a9e3c366a 100644
--- a/arch/arm64/hyperv/hv_core.c
+++ b/arch/arm64/hyperv/hv_core.c
@@ -53,6 +53,23 @@ u64 hv_do_fast_hypercall8(u16 code, u64 input)
 }
 EXPORT_SYMBOL_GPL(hv_do_fast_hypercall8);
 
+/*
+ * hv_do_fast_hypercall16 -- Invoke the specified hypercall
+ * with arguments in registers instead of physical memory.
+ * Avoids the overhead of virt_to_phys for simple hypercalls.
+ */
+u64 hv_do_fast_hypercall16(u16 code, u64 input1, u64 input2)
+{
+	struct arm_smccc_res	res;
+	u64			control;
+
+	control = (u64)code | HV_HYPERCALL_FAST_BIT;
+
+	arm_smccc_1_1_hvc(HV_FUNC_ID, control, input1, input2, &res);
+	return res.a0;
+}
+EXPORT_SYMBOL_GPL(hv_do_fast_hypercall16);
+
 /*
  * Set a single VP register to a 64-bit value.
  */
diff --git a/arch/arm64/include/asm/mshyperv.h b/arch/arm64/include/asm/mshyperv.h
index 2e2f83bafcfb..b721d3134ab6 100644
--- a/arch/arm64/include/asm/mshyperv.h
+++ b/arch/arm64/include/asm/mshyperv.h
@@ -40,6 +40,19 @@ static inline u64 hv_get_msr(unsigned int reg)
 	return hv_get_vpreg(reg);
 }
 
+/*
+ * Nested is not supported on arm64
+ */
+static inline void hv_set_non_nested_msr(unsigned int reg, u64 value)
+{
+	hv_set_msr(reg, value);
+}
+
+static inline u64 hv_get_non_nested_msr(unsigned int reg)
+{
+	return hv_get_msr(reg);
+}
+
 /* SMCCC hypercall parameters */
 #define HV_SMCCC_FUNC_NUMBER	1
 #define HV_FUNC_ID	ARM_SMCCC_CALL_VAL(			\
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index c8043efabf5a..c3697bc0598d 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -70,8 +70,10 @@ extern enum hv_partition_type hv_curr_partition_type;
 extern void * __percpu *hyperv_pcpu_input_arg;
 extern void * __percpu *hyperv_pcpu_output_arg;
 
-extern u64 hv_do_hypercall(u64 control, void *inputaddr, void *outputaddr);
-extern u64 hv_do_fast_hypercall8(u16 control, u64 input8);
+u64 hv_do_hypercall(u64 control, void *inputaddr, void *outputaddr);
+u64 hv_do_fast_hypercall8(u16 control, u64 input8);
+u64 hv_do_fast_hypercall16(u16 control, u64 input1, u64 input2);
+
 bool hv_isolation_type_snp(void);
 bool hv_isolation_type_tdx(void);
 
-- 
2.34.1


