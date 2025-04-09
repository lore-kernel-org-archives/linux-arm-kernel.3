Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37326C36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 00:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sg3mxreQaraq/1ciAx/jhCP/Bmu4VLiaIgfdf0GaDc8=; b=sC6iLE96EhOcsT8ht0/VMVdYmu
	XRO8hOWCib3pnWUvfuFyOk3SZP69iKAUOqGeaPI6WpdFOc1gucUPzdefKUVAQPCVvPTnSNRWbHQaR
	B0kAbnRWTrKEHShp0aImV7w480G2TDBqlusg2zbcTTxpeZAQgxw71ajIMBZ1mRSnFz60olFcbQ+6/
	ftYA5eX5rvW4QWZTdR9mBpFeIIux7czKofSI3PvyvOI9fZSRr8EKezIgwOonsBBI8nXpJmxbYRMn7
	u86oJJerQQXQ2gzl+RWf75KZAkRL7aidHwBgYErawq6cS/VLEIy+8ARH30s1xUz/hUF5kNjmBGkCC
	KDC5sekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2J4w-00000005l4W-3PXE;
	Wed, 09 Apr 2025 00:14:06 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Izg-00000005kBF-1d0q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 00:08:42 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id DB55B2113E9A;
	Tue,  8 Apr 2025 17:08:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DB55B2113E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744157319;
	bh=Sg3mxreQaraq/1ciAx/jhCP/Bmu4VLiaIgfdf0GaDc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iDjCyAcdNbtLj7uwkih4ucfZviBCOPhMRJni3A2gBEGdAzqiBG9+Z045qKKz4haZo
	 M+wg8LJ1F/RcW9TIpph1TemnfMJKPAVhHFbRUPRWMeSznV+HOQqS5bCe10gHFqiNLq
	 kWbG3kEoYK/oYBnSVN3185sYekG5BnB01Osmt+sg=
From: Roman Kisel <romank@linux.microsoft.com>
To: aleksander.lobakin@intel.com,
	andriy.shevchenko@linux.intel.com,
	arnd@arndb.de,
	bp@alien8.de,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	dakr@kernel.org,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	gregkh@linuxfoundation.org,
	haiyangz@microsoft.com,
	hch@lst.de,
	hpa@zytor.com,
	James.Bottomley@HansenPartnership.com,
	Jonathan.Cameron@huawei.com,
	kys@microsoft.com,
	leon@kernel.org,
	lukas@wunner.de,
	luto@kernel.org,
	m.szyprowski@samsung.com,
	martin.petersen@oracle.com,
	mingo@redhat.com,
	peterz@infradead.org,
	quic_zijuhu@quicinc.com,
	robin.murphy@arm.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	x86@kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next 3/6] arch: hyperv: Get/set SynIC synth.registers via paravisor
Date: Tue,  8 Apr 2025 17:08:32 -0700
Message-ID: <20250409000835.285105-4-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409000835.285105-1-romank@linux.microsoft.com>
References: <20250409000835.285105-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_170840_472344_776A26A2 
X-CRM114-Status: GOOD (  11.05  )
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

The confidential VMBus is built on the guest talking to the
paravisor only.

Provide functions that allow manipulating the SynIC registers
via paravisor.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
---
 arch/arm64/hyperv/mshyperv.c      | 19 +++++++++++++++++++
 arch/arm64/include/asm/mshyperv.h |  3 +++
 arch/x86/include/asm/mshyperv.h   |  3 +++
 arch/x86/kernel/cpu/mshyperv.c    | 28 ++++++++++++++++++++++++++++
 4 files changed, 53 insertions(+)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 4e27cc29c79e..1647a57a3379 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -91,3 +91,22 @@ bool hv_is_hyperv_initialized(void)
 	return hyperv_initialized;
 }
 EXPORT_SYMBOL_GPL(hv_is_hyperv_initialized);
+
+/*
+ * Not supported yet.
+ */
+u64 hv_pv_get_synic_register(unsigned int reg, int *err)
+{
+	*err = -ENODEV;
+	return !0ULL;
+}
+EXPORT_SYMBOL_GPL(hv_pv_get_synic_register);
+
+/*
+ * Not supported yet.
+ */
+int hv_pv_set_synic_register(unsigned int reg, u64 val)
+{
+	return -ENODEV;
+}
+EXPORT_SYMBOL_GPL(hv_pv_set_synic_register);
diff --git a/arch/arm64/include/asm/mshyperv.h b/arch/arm64/include/asm/mshyperv.h
index b721d3134ab6..bce37a58dff0 100644
--- a/arch/arm64/include/asm/mshyperv.h
+++ b/arch/arm64/include/asm/mshyperv.h
@@ -53,6 +53,9 @@ static inline u64 hv_get_non_nested_msr(unsigned int reg)
 	return hv_get_msr(reg);
 }
 
+u64 hv_pv_get_synic_register(unsigned int reg, int *err);
+int hv_pv_set_synic_register(unsigned int reg, u64 val);
+
 /* SMCCC hypercall parameters */
 #define HV_SMCCC_FUNC_NUMBER	1
 #define HV_FUNC_ID	ARM_SMCCC_CALL_VAL(			\
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index 07aadf0e839f..5650a16cc5e8 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -307,6 +307,9 @@ static __always_inline u64 hv_raw_get_msr(unsigned int reg)
 	return __rdmsr(reg);
 }
 
+u64 hv_pv_get_synic_register(unsigned int reg, int *err);
+int hv_pv_set_synic_register(unsigned int reg, u64 val);
+
 #else /* CONFIG_HYPERV */
 static inline void hyperv_init(void) {}
 static inline void hyperv_setup_mmu_ops(void) {}
diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 3e2533954675..4f6e3d02f730 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -89,6 +89,34 @@ void hv_set_non_nested_msr(unsigned int reg, u64 value)
 }
 EXPORT_SYMBOL_GPL(hv_set_non_nested_msr);
 
+/*
+ * Not every paravisor supports getting SynIC registers, and
+ * this function may fail. The caller has to make sure that this function
+ * runs on the CPU of interest.
+ */
+u64 hv_pv_get_synic_register(unsigned int reg, int *err)
+{
+	if (!hv_is_synic_msr(reg)) {
+		*err = -ENODEV;
+		return !0ULL;
+	}
+	return native_read_msr_safe(reg, err);
+}
+EXPORT_SYMBOL_GPL(hv_pv_get_synic_register);
+
+/*
+ * Not every paravisor supports setting SynIC registers, and
+ * this function may fail. The caller has to make sure that this function
+ * runs on the CPU of interest.
+ */
+int hv_pv_set_synic_register(unsigned int reg, u64 val)
+{
+	if (!hv_is_synic_msr(reg))
+		return -ENODEV;
+	return wrmsrl_safe(reg, val);
+}
+EXPORT_SYMBOL_GPL(hv_pv_set_synic_register);
+
 u64 hv_get_msr(unsigned int reg)
 {
 	if (hv_nested)
-- 
2.43.0


