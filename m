Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11256F8DFFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 17:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBnecfj7pDlfSrC2G8Wk+XN5melsXUI3v8mt7Sj6n3g=; b=TqWAF8alG5vJIApQ3WxBv11gBx
	ZXO9DpCIOzFwVjZb8Ehuv4trKrGh2qHOYzKA+JkLgM3C9wAzDZClKBAMDgTPk7H8pjVKj6PpDAdK7
	UF1GKpwccF8I6513IwJ2H//0rvbhzV4f8pcUOlabVxZpmvRJ77j48YvKF2b2A/KHDR7jvSU5wbq2P
	BIFVZEvWf5hNVocIm/0Fx1uYCZVGWwA55izPlPxqBSmXAc2uTeyzk3AF7ADNcwF0oVrvJuWW7hpUm
	rzHItOMUw4WtuunN+P+QrmdrmjrLl7Ld4IQ6wXXQGCHHHokO/v9bK6o/bhyr05wJ9AWGb/7GgjPiE
	QxJ1Quww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDnSR-00000004LT6-2Nmp;
	Fri, 17 Apr 2026 17:58:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDnSO-00000004LRI-2KiX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 17:58:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B1CE1D70;
	Fri, 17 Apr 2026 10:58:13 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CAEDA3F7D8;
	Fri, 17 Apr 2026 10:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776448699; bh=e3o4nX2FYzFLs1uAJiYhcCfAbWsy9IaHHY4Cf/NSGlU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PAQgiHJflKchkVTf/kQxxIrjzTHGvFJkuV2kwY6XVZZlvHYUbI3Avkufy0FHECdDg
	 0P+g9FWmwfm3CDwAafNIVAFd5MRZvLs98syRr3ZCobKtO8PfJc1iP/boxHqZ8imHPw
	 eybNPYc6+cBCnjNgTj1nJ8zU6CpETaF8idHpaOrA=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	zohar@linux.ibm.com,
	roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	peterhuewe@gmx.de,
	jarkko@kernel.org,
	jgg@ziepe.ca,
	sudeep.holla@kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [RFC PATCH 4/4] firmware: arm_ffa: check pkvm initailised when initailise ffa driver
Date: Fri, 17 Apr 2026 18:57:59 +0100
Message-Id: <20260417175759.3191279-5-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417175759.3191279-1-yeoreum.yun@arm.com>
References: <20260417175759.3191279-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_105820_647067_DFF1B136 
X-CRM114-Status: GOOD (  11.51  )
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

When pKVM is enabled, the FF-A driver must be initialized after pKVM.
Otherwise, pKVM cannot negotiate the FF-A version or
obtain RX/TX buffer information, leading to failures in FF-A calls.

During FF-A driver initialization, check whether pKVM has been initialized.
If not, defer probing of the FF-A driver.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/kvm/arm.c              |  1 +
 drivers/firmware/arm_ffa/driver.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 410ffd41fd73..0f517b1c05cd 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -119,6 +119,7 @@ bool is_kvm_arm_initialised(void)
 {
 	return kvm_arm_initialised;
 }
+EXPORT_SYMBOL(is_kvm_arm_initialised);

 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 {
diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 02c76ac1570b..2647d6554afd 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -42,6 +42,8 @@
 #include <linux/uuid.h>
 #include <linux/xarray.h>

+#include <asm/virt.h>
+
 #include "common.h"

 #define FFA_DRIVER_VERSION	FFA_VERSION_1_2
@@ -2035,6 +2037,16 @@ static int __init ffa_init(void)
 	u32 buf_sz;
 	size_t rxtx_bufsz = SZ_4K;

+	/*
+	 * When pKVM is enabled, the FF-A driver must be initialized
+	 * after pKVM initialization. Otherwise, pKVM cannot negotiate
+	 * the FF-A version or obtain RX/TX buffer information,
+	 * which leads to failures in FF-A calls.
+	 */
+	if (IS_ENABLED(CONFIG_KVM) && is_protected_kvm_enabled() &&
+	    !is_kvm_arm_initialised())
+		return -EPROBE_DEFER;
+
 	ret = ffa_transport_init(&invoke_ffa_fn);
 	if (ret)
 		return ret;
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


