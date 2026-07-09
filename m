Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DB5C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CaWv6aAi4jiT0MTmbU1YEAqS49LieLHHaU1Yxzg9URw=; b=UU6DNgScjpnehz3QePSQsp/ccj
	ButnPHHJjE5bW6eRrhtVhVmdhnKj2CraVUclWa6TnHY4fUaUxUoq/eoSZhoCvnLgM9xcnCWUki1A9
	+q+kQTxDiSMGfWtPMhgnWVr9T+sg/DPoRANQM5jL0u/yO6f6f5ddvWqmSOhIbGL1oYOQDvHNIJpwK
	+RetKPkQklKcngqBbZmfz6WYMeWJ//SzZXuPcptysZ6ff1gVmPxNhjUFJJ6MkpwzroG5yxc9uEwyB
	TLfmDcTrkELs8U9D050LwmyxumF7EqrJSr2woIC5gSiqX3OiRbr45uy6/WzKXm6C71Waf47222lQV
	va6jxLGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndo-00000002KRq-05ba;
	Thu, 09 Jul 2026 12:14:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whndj-00000002KNM-1tb6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 525F73594;
	Thu,  9 Jul 2026 05:13:57 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9CE753F66F;
	Thu,  9 Jul 2026 05:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599241; bh=GTHKb8xwbosBlRIj5oSLK8Hm5y56orXz3lxFgcRvr54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U95FB9lpNO7/m9IZKbpC2GgCIeuvqX5EytwvfAlVMPRpvBaXbF+dBMEGgcjmMf6km
	 f39WoypJaFtqq2ha+Lw4eckuUSktyxhuO4HVeC0mY+j/EuiQT0pU3sP572mthhNqY2
	 b8nN9vkv13xBWbmdb/SbFRGzQAlc3DhYZdMBVV7E=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com
Subject: [RFC PATCH 05/36] arm64: suspend: Initialize PMR on resume
Date: Thu,  9 Jul 2026 13:13:02 +0100
Message-Id: <20260709121333.23507-6-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051403_535289_AC6DF4EE 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

When we resume from cpu_suspend() context tracking, specially,
ct_idle_exit() performs IRQ save/restore sequence. It doesn't cause
any functional issues since we have masked all exceptions prior
suspend and have not restored them. However, in case of pseudo-NMI PMR
can be set by firmware to arbitrary value, thus IRQ save/restore
routines manipulates this arbitrary value. Again, it doesn't cause any
issues since PMR variant of IRQ save helper carries a
__pmr_irqs_disabled_flags() guard.

Going forward __pmr_irqs_disabled_flags() guard will be gone and we
will call __pmr_local_irq_disable() unconditionally - that would cause
warning in case CONFIG_ARM64_DEBUG_PRIORITY_MASKING is set.

Initialize PMR to a value known to Linux on resume until the normal
exception restore path restores the saved DAIF and PMR state.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/mm/proc.S | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 22866b49be37..06c8bc9a85d6 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -169,6 +169,13 @@ alternative_if ARM64_HAS_RAS_EXTN
 	msr_s	SYS_DISR_EL1, xzr
 alternative_else_nop_endif
 
+#ifdef CONFIG_ARM64_PSEUDO_NMI
+alternative_if ARM64_HAS_GIC_PRIO_MASKING
+	mov	x1, #GIC_PRIO_IRQON
+	msr_s	SYS_ICC_PMR_EL1, x1
+alternative_else_nop_endif
+#endif
+
 	ptrauth_keys_install_kernel_nosync x14, x1, x2, x3
 	isb
 	ret
-- 
2.34.1


