Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF6DC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hByeAPTTDSWVBEWZGIgDKybgSHPVwxLDnYc0n8Mj04=; b=QzM4weFnXbpB1bFxDhiIBmNiGs
	3Y8/6KTBwiRuQmZVfpyga5wLR/SAyzJyVLwDFFXw73LLfiiuqy83zSgxayj+aV0NLhGAODmD41T7N
	01/78iAht6q6r2T3XxzT2hZMYACbOGH0iEn6P21DMapX4sYuVuAwr9J3xx16YQBITzGFFY2hksq1d
	Sl1Qegvj5dIdK6OOYgmXGx7MJ/NLJiLJ6QyCfBDoN8Jjcj/QWkxLQBzt3uxGlKYwzvuXfM00jiqMV
	/sA/t24/xlOq95IquaGQoZISxuArQXSXKwmiX5dsz0Y34PFiNRuSds92ibaDuRQyJzNsQ00FRmFL4
	x838Q4Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLW7-0000000Exks-1b3P;
	Fri, 24 Jan 2025 15:22:43 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLSH-0000000EwxL-2vyJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 15:18:47 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YfhHK3Rkjz6M4MZ;
	Fri, 24 Jan 2025 23:16:45 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 33EDD140119;
	Fri, 24 Jan 2025 23:18:44 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 Jan 2025 16:18:35 +0100
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <kvmarm@lists.linux.dev>, <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<cohuck@redhat.com>, <eric.auger@redhat.com>, <sebott@redhat.com>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
	<jonathan.cameron@huawei.com>, <anthony.jebson@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>
Subject: [PATCH v5 2/4] KVM: arm64: Introduce hypercall support for retrieving target implementations
Date: Fri, 24 Jan 2025 15:17:30 +0000
Message-ID: <20250124151732.6072-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com>
References: <20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_071846_048444_E79E653C 
X-CRM114-Status: GOOD (  10.59  )
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

If the Guest requires migration to multiple targets, these hypercalls
will provide a way to retrieve the target CPU implementations from
the user space VMM.

Subsequent patch will use this to enable the associated errata.

Suggested-by: Oliver Upton <oliver.upton@linux.dev>
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 Documentation/virt/kvm/arm/hypercalls.rst | 59 +++++++++++++++++++++++
 include/linux/arm-smccc.h                 | 15 ++++++
 2 files changed, 74 insertions(+)

diff --git a/Documentation/virt/kvm/arm/hypercalls.rst b/Documentation/virt/kvm/arm/hypercalls.rst
index af7bc2c2e0cb..718725cbf6c7 100644
--- a/Documentation/virt/kvm/arm/hypercalls.rst
+++ b/Documentation/virt/kvm/arm/hypercalls.rst
@@ -142,3 +142,62 @@ region is equal to the memory protection granule advertised by
 |                     |          |    +---------------------------------------------+
 |                     |          |    | ``INVALID_PARAMETER (-3)``                  |
 +---------------------+----------+----+---------------------------------------------+
+
+``ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_VER_FUNC_ID``
+-------------------------------------------------------
+Request the target CPU implementation version information and the number of target
+implementations for the Guest VM.
+
++---------------------+-------------------------------------------------------------+
+| Presence:           | Optional;  KVM/ARM64 Guests only                            |
++---------------------+-------------------------------------------------------------+
+| Calling convention: | HVC64                                                       |
++---------------------+----------+--------------------------------------------------+
+| Function ID:        | (uint32) | 0xC6000040                                       |
++---------------------+----------+--------------------------------------------------+
+| Arguments:          | None                                                        |
++---------------------+----------+----+---------------------------------------------+
+| Return Values:      | (int64)  | R0 | ``SUCCESS (0)``                             |
+|                     |          |    +---------------------------------------------+
+|                     |          |    | ``NOT_SUPPORTED (-1)``                      |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R1 | Bit[63] Must be zero                        |
+|                     |          |    +---------------------------------------------+
+|                     |          |    | Bits [62:32] Major version                  |
+|                     |          |    +---------------------------------------------+
+|                     |          |    | Bits [31:0] Minor version                   |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R2 | Number of target implementations            |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R3 | Reserved / Must be zero                     |
++---------------------+----------+----+---------------------------------------------+
+
+``ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_CPUS_FUNC_ID``
+-------------------------------------------------------
+
+Request the target CPU implementation information for the Guest VM. The Guest kernel
+will use this information to enable the associated errata.
+
++---------------------+-------------------------------------------------------------+
+| Presence:           | Optional;  KVM/ARM64 Guests only                            |
++---------------------+-------------------------------------------------------------+
+| Calling convention: | HVC64                                                       |
++---------------------+----------+--------------------------------------------------+
+| Function ID:        | (uint32) | 0xC6000041                                       |
++---------------------+----------+----+---------------------------------------------+
+| Arguments:          | (uint64) | R1 | selected implementation index               |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R2 | Reserved / Must be zero                     |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R3 | Reserved / Must be zero                     |
++---------------------+----------+----+---------------------------------------------+
+| Return Values:      | (int64)  | R0 | ``SUCCESS (0)``                             |
+|                     |          |    +---------------------------------------------+
+|                     |          |    | ``INVALID_PARAMETER (-3)``                  |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R1 | MIDR_EL1 of the selected implementation     |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R2 | REVIDR_EL1 of the selected implementation   |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R3 | AIDR_EL1  of the selected implementation    |
++---------------------+----------+----+---------------------------------------------+
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 67f6fdf2e7cd..f19be5754090 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -179,6 +179,9 @@
 #define ARM_SMCCC_KVM_FUNC_PKVM_RESV_62		62
 #define ARM_SMCCC_KVM_FUNC_PKVM_RESV_63		63
 /* End of pKVM hypercall range */
+#define ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_VER	64
+#define ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_CPUS	65
+
 #define ARM_SMCCC_KVM_FUNC_FEATURES_2		127
 #define ARM_SMCCC_KVM_NUM_FUNCS			128
 
@@ -225,6 +228,18 @@
 			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
 			   ARM_SMCCC_KVM_FUNC_MMIO_GUARD)
 
+#define ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_VER_FUNC_ID		\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
+			   ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_VER)
+
+#define ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_CPUS_FUNC_ID		\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
+			   ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_CPUS)
+
 /* ptp_kvm counter type ID */
 #define KVM_PTP_VIRT_COUNTER			0
 #define KVM_PTP_PHYS_COUNTER			1
-- 
2.47.0


