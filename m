Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6006FCDDE69
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 09:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NdpS8KYb5vkQR/DhNm39yYmYhHQB5WvzfR+2/DyAb/c=; b=t6/htYM8pE3YPncPLJcp+BWqwj
	4ssQKrJSVxM76C1HFK6OQxHzkDnos/xU4bCVYxEelM7ExwWEtBPMOm5s/rKcRsejhD7NfclWV6QwV
	Wja3CfSvh5lC+Tfr+Pe41GOnF9/NO63sf9TLFdIV1broyVuAG/kV4TebksT/WJ4EnObyHUnKnup7K
	EVQCe3fNNBxVVs7NVu4BMomSA5XI5OEYCwj3/K+K8pEDNDHaYWM2AQ4pdJaIzVtuOe8fwXgqBmdIz
	s4jTjUVTFqCxezuZcRNyxLHIsmHChqD2ciayuL2UEs/B3qdBmPeMhJJsgy1l2z3l0EZKJsKfuwECW
	ROlKfjsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uZ2-0000000HZFI-0Sxb;
	Thu, 24 Oct 2024 09:55:32 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uKh-0000000HVrc-17uR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 09:40:46 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XZ17b5vC3z6K5yF;
	Thu, 24 Oct 2024 17:38:35 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id E3AB9140D1A;
	Thu, 24 Oct 2024 17:40:41 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 11:40:35 +0200
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <kvmarm@lists.linux.dev>, <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<cohuck@redhat.com>, <eric.auger@redhat.com>, <yuzenghui@huawei.com>,
	<wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
	<jonathan.cameron@huawei.com>, <anthony.jebson@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>
Subject: [RFC PATCH v2 1/3] KVM: arm64: Add hypercall support for retrieving migration targets
Date: Thu, 24 Oct 2024 10:40:10 +0100
Message-ID: <20241024094012.29452-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20241024094012.29452-1-shameerali.kolothum.thodi@huawei.com>
References: <20241024094012.29452-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_024043_876137_85C7668A 
X-CRM114-Status: GOOD (  13.87  )
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

If the VM requires migration to multiple targets, these hypercalls
will provide a way to inform the Guest kernel about those targets.
These hypercalls must be handled by userspace VMM to provide the
required details. In subsequent patches Guest kernel will use
these hypercalls to retrieve the target CPU information.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 Documentation/virt/kvm/arm/hypercalls.rst | 77 +++++++++++++++++++++++
 include/linux/arm-smccc.h                 | 13 ++++
 2 files changed, 90 insertions(+)

diff --git a/Documentation/virt/kvm/arm/hypercalls.rst b/Documentation/virt/kvm/arm/hypercalls.rst
index af7bc2c2e0cb..ebd59fb72567 100644
--- a/Documentation/virt/kvm/arm/hypercalls.rst
+++ b/Documentation/virt/kvm/arm/hypercalls.rst
@@ -142,3 +142,80 @@ region is equal to the memory protection granule advertised by
 |                     |          |    +---------------------------------------------+
 |                     |          |    | ``INVALID_PARAMETER (-3)``                  |
 +---------------------+----------+----+---------------------------------------------+
+
+``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_NUM_FUNC_ID``
+------------------------------------------------------
+
+Query total number of migration target CPUs the Guest VM will be running during its
+lifetime and version information applicable to the data format used for
+``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_CPUS_FUNC_ID``. The maximum number of targets
+supported is 64. Also the version number supported currently is 1.0. This hypercall
+must be handled by the userspace VMM.
+
++---------------------+-------------------------------------------------------------+
+| Presence:           | Optional; KVM/ARM64 Guests only                             |
++---------------------+-------------------------------------------------------------+
+| Calling convention: | HVC64                                                       |
++---------------------+----------+--------------------------------------------------+
+| Function ID:        | (uint32) | 0xC600007D                                       |
++---------------------+----------+--------------------------------------------------+
+| Arguments:          | None                                                        |
++---------------------+----------+----+---------------------------------------------+
+| Return Values:      | (int64)  | R0 | ``NOT_SUPPORTED (-1)`` on error, else       |
+|                     |          |    | [0-31] total migration targets              |
+|                     |          |    | [32-63] version number                      |
++---------------------+----------+----+---------------------------------------------+
+|                     | (uint64) | R1 | Reserved / Must be zero                     |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R2 | Reserved / Must be zero                     |
++---------------------+----------+----+---------------------------------------------+
+|                     | (uint64) | R3 | Reserved / Must be zero                     |
++---------------------+----------+----+---------------------------------------------+
+
+
+``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_CPUS_FUNC_ID``
+-------------------------------------------------------
+
+Request migration target CPU information for the Guest VM. The information must be
+provided as per the format described by the version info in
+``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_NUM_FUNC_ID``. At present, we only support
+the below format which corresponds to version 1.0. This hypercall will always be
+preceded by ``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_NUM_FUNC_ID`` and may be
+invoked multiple times to retrieve the total number of target CPUs information
+advertised. This hypercall must be handled by the userspace VMM.
+
+A typical userspace usage scenario will be like below:
+
+1. Receives ``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_NUM_FUNC_ID``
+
+   * Returns total number of migration targets and version number
+   * Reset current target index to zero
+2. Receives ``ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_CPUS_FUNC_ID``
+
+   * Returns MIDR/REVIDR info in return register fields. Can return up to 4
+   * Update current target index based on returned target info
+   * If there are remaining register fields, return zero to indicate the end
+   * Repeat step 2 until current target index == total number of migration targets
+
++---------------------+-------------------------------------------------------------+
+| Presence:           | Optional; KVM/ARM64 Guests only                             |
++---------------------+-------------------------------------------------------------+
+| Calling convention: | HVC64                                                       |
++---------------------+----------+--------------------------------------------------+
+| Function ID:        | (uint32) | 0xC600007E                                       |
++---------------------+----------+----+---------------------------------------------+
+| Arguments:          | None                                                        |
++---------------------+----------+----+---------------------------------------------+
+| Return Values:      | (int64)  | R0 | ``NOT_SUPPORTED (-1)`` on error, else       |
+|                     |          |    | [0-31] MIDR, [31-63] REVIDR, else           |
+|                     |          |    | [0-63] Zero to mark end.                    |
++---------------------+----------+----+---------------------------------------------+
+|                     | (uint64) | R1 | [0-31] MIDR, [32-63] REVIDR, else           |
+|                     |          |    | [0-63] Zero to mark end.                    |
++---------------------+----------+----+---------------------------------------------+
+|                     | (uint64) | R2 | [0-31] MIDR, [32-63] REVIDR, else           |
+|                     |          |    | [0-63] Zero to mark end.                    |
++---------------------+----------+----+---------------------------------------------+
+|                     | (uint64) | R3 | [0-31] MIDR, [32-63] REVIDR, else           |
+|                     |          |    | [0-63] Zero to mark end.                    |
++---------------------+----------+----+---------------------------------------------+
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index f59099a213d0..df87ce48ae9e 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -179,6 +179,8 @@
 #define ARM_SMCCC_KVM_FUNC_PKVM_RESV_62		62
 #define ARM_SMCCC_KVM_FUNC_PKVM_RESV_63		63
 /* End of pKVM hypercall range */
+#define ARM_SMCCC_KVM_FUNC_MIGRN_TARGET_NUM	125
+#define ARM_SMCCC_KVM_FUNC_MIGRN_TARGET_CPUS	126
 #define ARM_SMCCC_KVM_FUNC_FEATURES_2		127
 #define ARM_SMCCC_KVM_NUM_FUNCS			128
 
@@ -225,6 +227,17 @@
 			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
 			   ARM_SMCCC_KVM_FUNC_MMIO_GUARD)
 
+#define ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_NUM_FUNC_ID	\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\
+			   ARM_SMCCC_SMC_64,			\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,		\
+			   ARM_SMCCC_KVM_FUNC_MIGRN_TARGET_NUM)
+
+#define ARM_SMCCC_VENDOR_HYP_KVM_MIGRN_TARGET_CPUS_FUNC_ID	\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\
+			   ARM_SMCCC_SMC_64,			\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,		\
+			   ARM_SMCCC_KVM_FUNC_MIGRN_TARGET_CPUS)
 /* ptp_kvm counter type ID */
 #define KVM_PTP_VIRT_COUNTER			0
 #define KVM_PTP_PHYS_COUNTER			1
-- 
2.45.2


