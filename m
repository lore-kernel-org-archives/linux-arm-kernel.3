Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F2DC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 22:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBo1D+ypIezhxBJBde429l6jcaheYkWXJHpid6jSvDE=; b=fwzG60UacGV0dQWmhpx2OcGGlx
	QujfRmTY4kmA3jdVbmvzoggwa85NIwlbwla3S57byeyqut0MvM8jiI3Gt5tVDouq61jvcKY1IWzw6
	wob73tcMDrp4b1YZxGQo82By6qNDmj2x2kEh1pDT2My9JrOe6WA1l/+i+DppWyIpM1NblLSHNmEoY
	A3rT9/vNm5DvJzEcn0bBwageQU7j5udww5SYLxYzNFV3/U6AVNQ0GkH9L8NZBTyaReDcmQn026JTM
	mXhDeGm+9vR20/css/m14awu7zLEsbfIgNqa0184Lq8AoMaPGJdIC+yfiEe+Wu7bm83bEFlmvLyF6
	+beP/Biw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqfGM-00000009rZp-3u70;
	Mon, 25 Aug 2025 22:02:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqfDa-00000009qkJ-2m6C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 21:59:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CB3B5C6520;
	Mon, 25 Aug 2025 21:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92693C19424;
	Mon, 25 Aug 2025 21:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756159150;
	bh=WTYVyZ9oXXL3OkEIh8FU85gicYzUVhRGADikTVKoQWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MkTQh8iLOcGMarD1IO2rFhG55bd4yw2kyQOB1wSuP6ANLvv4L25FWtkfdcjRhnChY
	 hklmBQQhp54UPNIOaZz40/gK+Vgrn+Q98Xw5bJAcWr6Ypr6Lq/X8A+OV+5R5YC26C2
	 YWT3tAQV6bpj5pGFNunHGccpu9AG0mh/EiTOLbdvIwSg99TndYRmeqlg8s1oigiHBc
	 rigLdQMT2REnhjDMtaAejlBgaKosLJ3y4qDeZQtGqQv9NwH+vNsv8q5Cl3X6B2Gb67
	 hOBfuNSsPigMAzUllzNPEAtSm2Ow/hPNPJbdmuB1hAWy0/BcJ1gy1Ex1pGPD/+YEFE
	 E6VegRLmkEjew==
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-perf-users@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/11] tools headers: Sync arm64 headers with the kernel source
Date: Mon, 25 Aug 2025 14:58:57 -0700
Message-ID: <20250825215904.2594216-6-namhyung@kernel.org>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
In-Reply-To: <20250825215904.2594216-1-namhyung@kernel.org>
References: <20250825215904.2594216-1-namhyung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_145910_793526_605ED13B 
X-CRM114-Status: GOOD (  14.08  )
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

To pick up the changes in this cset:

  efe676a1a7554219 arm64: proton-pack: Add new CPUs 'k' values for branch mitigation
  e18c09b204e81702 arm64: Add support for HIP09 Spectre-BHB mitigation
  a9b5bd81b294d30a arm64: cputype: Add MIDR_CORTEX_A76AE
  53a52a0ec7680287 arm64: cputype: Add comments about Qualcomm Kryo 5XX and 6XX cores
  401c3333bb2396aa arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
  86edf6bdcf0571c0 smccc/kvm_guest: Enable errata based on implementation CPUs
  0bc9a9e85fcf4ffb KVM: arm64: Work around x1e's CNTVOFF_EL2 bogosity

This addresses these perf build warnings:

  Warning: Kernel ABI header differences:
    diff -u tools/arch/arm64/include/asm/cputype.h arch/arm64/include/asm/cputype.h

But the following two changes cannot be applied since they introduced
new build errors in util/arm-spe.c.  So it still has the warning after
this change.

  c8c2647e69bedf80 arm64: Make  _midr_in_range_list() an exported function
  e3121298c7fcaf48 arm64: Modify _midr_range() functions to read MIDR/REVIDR internally

Please see tools/include/uapi/README for further details.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Namhyung Kim <namhyung@kernel.org>

perf build: [WIP] Fix arm-spe build errors

Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/arch/arm64/include/asm/cputype.h | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tools/arch/arm64/include/asm/cputype.h b/tools/arch/arm64/include/asm/cputype.h
index 9a5d85cfd1fba6ee..139d5e87dc959313 100644
--- a/tools/arch/arm64/include/asm/cputype.h
+++ b/tools/arch/arm64/include/asm/cputype.h
@@ -75,11 +75,13 @@
 #define ARM_CPU_PART_CORTEX_A76		0xD0B
 #define ARM_CPU_PART_NEOVERSE_N1	0xD0C
 #define ARM_CPU_PART_CORTEX_A77		0xD0D
+#define ARM_CPU_PART_CORTEX_A76AE	0xD0E
 #define ARM_CPU_PART_NEOVERSE_V1	0xD40
 #define ARM_CPU_PART_CORTEX_A78		0xD41
 #define ARM_CPU_PART_CORTEX_A78AE	0xD42
 #define ARM_CPU_PART_CORTEX_X1		0xD44
 #define ARM_CPU_PART_CORTEX_A510	0xD46
+#define ARM_CPU_PART_CORTEX_X1C		0xD4C
 #define ARM_CPU_PART_CORTEX_A520	0xD80
 #define ARM_CPU_PART_CORTEX_A710	0xD47
 #define ARM_CPU_PART_CORTEX_A715	0xD4D
@@ -119,9 +121,11 @@
 #define QCOM_CPU_PART_KRYO		0x200
 #define QCOM_CPU_PART_KRYO_2XX_GOLD	0x800
 #define QCOM_CPU_PART_KRYO_2XX_SILVER	0x801
+#define QCOM_CPU_PART_KRYO_3XX_GOLD	0x802
 #define QCOM_CPU_PART_KRYO_3XX_SILVER	0x803
 #define QCOM_CPU_PART_KRYO_4XX_GOLD	0x804
 #define QCOM_CPU_PART_KRYO_4XX_SILVER	0x805
+#define QCOM_CPU_PART_ORYON_X1		0x001
 
 #define NVIDIA_CPU_PART_DENVER		0x003
 #define NVIDIA_CPU_PART_CARMEL		0x004
@@ -129,6 +133,7 @@
 #define FUJITSU_CPU_PART_A64FX		0x001
 
 #define HISI_CPU_PART_TSV110		0xD01
+#define HISI_CPU_PART_HIP09			0xD02
 #define HISI_CPU_PART_HIP12		0xD06
 
 #define APPLE_CPU_PART_M1_ICESTORM	0x022
@@ -159,11 +164,13 @@
 #define MIDR_CORTEX_A76	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A76)
 #define MIDR_NEOVERSE_N1 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N1)
 #define MIDR_CORTEX_A77	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A77)
+#define MIDR_CORTEX_A76AE	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A76AE)
 #define MIDR_NEOVERSE_V1	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V1)
 #define MIDR_CORTEX_A78	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A78)
 #define MIDR_CORTEX_A78AE	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A78AE)
 #define MIDR_CORTEX_X1	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X1)
 #define MIDR_CORTEX_A510 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A510)
+#define MIDR_CORTEX_X1C MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X1C)
 #define MIDR_CORTEX_A520 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A520)
 #define MIDR_CORTEX_A710 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A710)
 #define MIDR_CORTEX_A715 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A715)
@@ -196,13 +203,26 @@
 #define MIDR_QCOM_KRYO MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO)
 #define MIDR_QCOM_KRYO_2XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_2XX_GOLD)
 #define MIDR_QCOM_KRYO_2XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_2XX_SILVER)
+#define MIDR_QCOM_KRYO_3XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_GOLD)
 #define MIDR_QCOM_KRYO_3XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_3XX_SILVER)
 #define MIDR_QCOM_KRYO_4XX_GOLD MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_GOLD)
 #define MIDR_QCOM_KRYO_4XX_SILVER MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_KRYO_4XX_SILVER)
+#define MIDR_QCOM_ORYON_X1 MIDR_CPU_MODEL(ARM_CPU_IMP_QCOM, QCOM_CPU_PART_ORYON_X1)
+
+/*
+ * NOTES:
+ * - Qualcomm Kryo 5XX Prime / Gold ID themselves as MIDR_CORTEX_A77
+ * - Qualcomm Kryo 5XX Silver IDs itself as MIDR_QCOM_KRYO_4XX_SILVER
+ * - Qualcomm Kryo 6XX Prime IDs itself as MIDR_CORTEX_X1
+ * - Qualcomm Kryo 6XX Gold IDs itself as ARM_CPU_PART_CORTEX_A78
+ * - Qualcomm Kryo 6XX Silver IDs itself as MIDR_CORTEX_A55
+ */
+
 #define MIDR_NVIDIA_DENVER MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_DENVER)
 #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
 #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
 #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
+#define MIDR_HISI_HIP09 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP09)
 #define MIDR_HISI_HIP12 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP12)
 #define MIDR_APPLE_M1_ICESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM)
 #define MIDR_APPLE_M1_FIRESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_FIRESTORM)
@@ -291,6 +311,14 @@ static inline u32 __attribute_const__ read_cpuid_id(void)
 	return read_cpuid(MIDR_EL1);
 }
 
+struct target_impl_cpu {
+	u64 midr;
+	u64 revidr;
+	u64 aidr;
+};
+
+bool cpu_errata_set_target_impl(u64 num, void *impl_cpus);
+
 static inline u64 __attribute_const__ read_cpuid_mpidr(void)
 {
 	return read_cpuid(MPIDR_EL1);
-- 
2.51.0.261.g7ce5a0a67e-goog


