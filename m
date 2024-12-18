Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3504CE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 12:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msThw48itXlU4qwJcJXvnA7E9mIJ568BNL4jgDEORz8=; b=hc7DPIHozBIOSIluVP84P3ZIVM
	tUQE3tVvXaZge2gAur6ZriKGyuS5JdfDAVmW11vYvxwrJiriB2kKTNliwscLnIT1MGPgNOfTwQh8s
	48xF8QPQI6V/Un1ikeBCurqcsfxinjoDF3YudFf4WpRIWHF5esvavvBld1Hod+kPPpIaQMWfXQvjZ
	bR39Kaa4RNCvZBO+SgFN/+7BiXaDwz0/FuwOmXQjVJKIl+RoUmd4iwGbSbDdis2LbhYttnaElwBuL
	t9YRkV04s7zyJl9CrErdsER18X1e4WWg67aUGIYl2iO3F5pjiKoDJunBMaHqZXlbycWJH6KysBb/7
	XdXzQNTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNssT-0000000GYJA-229a;
	Wed, 18 Dec 2024 12:10:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrhW-0000000GLOq-2klL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Dec 2024 10:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=msThw48itXlU4qwJcJXvnA7E9mIJ568BNL4jgDEORz8=; b=N5OhIXFoEDA5JpWMbC9jyHGn4Q
	rQqwRnj4PAPXEJH0/2Bkc6oy3928wusny9qDEe7QFdAjMvf5UovTU6IlVvBd+/l+QE74QoqLIU55J
	ntCEXJ7eScm8aBCgOGpyVyShIXBWunxolepv6Wa96iEpVMsYeu/ua5R75Tx6EjHeQeOQtQZZqNrYb
	deAJ5RR+Ot/oWLbNJzqWEX8RZaxd+g582c+Gr6BUSoSg1j2WLI8Vqj9zKPzhjBk6Yl+tqIDCXAH4x
	jEvPwIVLYMJAjS3DffLrgk7R1oM2Rl9pyV1FCwyjxaQLNiTSHRERkY1aa55Iz3evuZyhpraZkb0vO
	U2fBVu4g==;
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrhT-00000005FGw-0hHJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 10:54:45 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YCr7h4mBCz6K99B;
	Wed, 18 Dec 2024 18:50:56 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 20793140B3C;
	Wed, 18 Dec 2024 18:54:32 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.195.247.46) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Dec 2024 11:54:23 +0100
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <kvmarm@lists.linux.dev>, <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<cohuck@redhat.com>, <eric.auger@redhat.com>, <sebott@redhat.com>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
	<jonathan.cameron@huawei.com>, <anthony.jebson@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>
Subject: [PATCH v4 2/3] KVM: arm64: Introduce hypercall support for retrieving target implementations
Date: Wed, 18 Dec 2024 10:53:44 +0000
Message-ID: <20241218105345.73472-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20241218105345.73472-1-shameerali.kolothum.thodi@huawei.com>
References: <20241218105345.73472-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.195.247.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_105443_401612_AB019456 
X-CRM114-Status: GOOD (  10.97  )
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

If the Guest requires migration to multiple targets, this hypercall
will provide a way to retrieve the target CPU implementations from
the user space VMM.

Subsequent patch will use this to enable the associated errata.

Suggested-by: Oliver Upton <oliver.upton@linux.dev>
Reviewed-by: Sebastian Ott <sebott@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 Documentation/virt/kvm/arm/hypercalls.rst | 30 +++++++++++++++++++++++
 include/linux/arm-smccc.h                 |  7 ++++++
 2 files changed, 37 insertions(+)

diff --git a/Documentation/virt/kvm/arm/hypercalls.rst b/Documentation/virt/kvm/arm/hypercalls.rst
index af7bc2c2e0cb..16b4c02cf9d9 100644
--- a/Documentation/virt/kvm/arm/hypercalls.rst
+++ b/Documentation/virt/kvm/arm/hypercalls.rst
@@ -142,3 +142,33 @@ region is equal to the memory protection granule advertised by
 |                     |          |    +---------------------------------------------+
 |                     |          |    | ``INVALID_PARAMETER (-3)``                  |
 +---------------------+----------+----+---------------------------------------------+
+
+``ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_CPUS_FUNC_ID``
+-------------------------------------------------------
+
+Request the target CPU implementation information for the Guest VM. This hypercall
+must be handled by the userspace VMM. The Guest kernel will use this information to
+enable the associated errata. A maximum of 64 implementations is supported.
+
++---------------------+-------------------------------------------------------------+
+| Presence:           | Optional;  KVM/ARM64 Guests only                            |
++---------------------+-------------------------------------------------------------+
+| Calling convention: | HVC64                                                       |
++---------------------+----------+--------------------------------------------------+
+| Function ID:        | (uint32) | 0xC600007E                                       |
++---------------------+----------+----+---------------------------------------------+
+| Arguments:          | (uint64) | R1 | selected implementation index               |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R2 | Reserved / Must be zero                     |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R3 | Reserved / Must be zero                     |
++---------------------+----------+----+---------------------------------------------+
+| Return Values:      | (int64)  | R0 | -1 on error else the maximum required CPU   |
+|                     |          |    | implementation index.                       |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R1 | MIDR_EL1 of the selected implementation     |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R2 | REVIDR_EL1 of the selected implementation   |
+|                     +----------+----+---------------------------------------------+
+|                     | (uint64) | R3 | Reserved / Must be zero                     |
++---------------------+----------+----+---------------------------------------------+
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 67f6fdf2e7cd..6c080fa9d345 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -179,6 +179,7 @@
 #define ARM_SMCCC_KVM_FUNC_PKVM_RESV_62		62
 #define ARM_SMCCC_KVM_FUNC_PKVM_RESV_63		63
 /* End of pKVM hypercall range */
+#define ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_CPUS	126
 #define ARM_SMCCC_KVM_FUNC_FEATURES_2		127
 #define ARM_SMCCC_KVM_NUM_FUNCS			128
 
@@ -225,6 +226,12 @@
 			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
 			   ARM_SMCCC_KVM_FUNC_MMIO_GUARD)
 
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


