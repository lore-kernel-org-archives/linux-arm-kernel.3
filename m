Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D225CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1jJD/B2orXtx6F21CDLKijO/wahwc9827iYGz2gr70=; b=SwwBm1Ye+LKsEg
	W5fcsKkXb6wvjcMHJUNwqydDo7h1iEV6R2Q5g/aAbpjmMzel2WUt50bndeyFYrJayLirpXH7m9+wb
	mi5V9b4REhCIYr+IxaNyC3ogzp2Vru7CPdH5S5ShWifLl4sYAQBoHOa/FqHjJCd8yZe/HPh/hSW9G
	0cfPHqCacLEwQxqOhl94BIhqU2GeKdCG9DnDPJn2bCQn7R33hr3PqmW/qreyK1z9ONhx1yqFp9L+U
	jv2/i2155hBCQM1k2UWUCi3VuFdR0R1R7wJpqoGX9GT93zfvcZ4UpXXwaMxPy2+JnGRQfXqLnFbp7
	wb5FrdBKLm8zIFhgvDSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneM-00000002LIT-2EMV;
	Thu, 09 Jul 2026 12:14:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whne1-00000002Kan-0IWc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30D383569;
	Thu,  9 Jul 2026 05:14:16 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 58E4B3F66F;
	Thu,  9 Jul 2026 05:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599260; bh=oSq4WIHDEZ77X20l5D2Nh39FwJFCD2x6zX6PUTdHNcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oo/4NmsA+eKdE4lpw1MDMiqWeKgpXMceey+Ef6xcQ86vazM5ghEl1kTsemk0/NrPm
	 1XDQPjaXLwe6fphzvviL0xfXdRaZsl2tLEVIX1QL8mLW02lbxmDxsRQsYwHo73Wdnm
	 quqOYaDCnd1R2qJE0eFRjquba7l6r9qlhc2o4gxY=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 18/36] arm64: gicv3: remove GIC_PRIO_PSR_I_SET
Date: Thu,  9 Jul 2026 13:13:15 +0100
Message-Id: <20260709121333.23507-19-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051421_179434_59E87C5E 
X-CRM114-Status: GOOD (  12.44  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, ruanjinjie@huawei.com, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ada Couprie Diaz <ada.coupriediaz@arm.com>

`GIC_PRIO_PSR_I_SET` was used to keep track of sections of the kernel
where interrupts always need to reach the CPU and could not be masked
via interrupt priorities, or DAIF bypassed the status of the PMR.

This flag unmasked IRQs when OR'd to GIC_PRIO_IRQOFF and ensured that
that IRQs were seen as disabled by the `local_irqs_...` functions,
as they would only check the PMR if pseudo-NMIs were enabled.

This is not needed anymore as our IRQ masking APIs now know how to handle
interrupt priorities properly and in parallel with DAIF : remove it.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/ptrace.h         | 2 --
 include/linux/irqchip/arm-gic-v3-prio.h | 8 --------
 2 files changed, 10 deletions(-)

diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index 192eb97cd50b..c630165882e8 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -24,8 +24,6 @@
 #define GIC_PRIO_IRQON		GICV3_PRIO_UNMASKED
 #define GIC_PRIO_IRQOFF		GICV3_PRIO_IRQ
 
-#define GIC_PRIO_PSR_I_SET	GICV3_PRIO_PSR_I_SET
-
 /* Additional SPSR bits not exposed in the UABI */
 #define PSR_MODE_THREAD_BIT	(1 << 0)
 #define PSR_IL_BIT		(1 << 20)
diff --git a/include/linux/irqchip/arm-gic-v3-prio.h b/include/linux/irqchip/arm-gic-v3-prio.h
index 44157c9abb78..464bf1d29453 100644
--- a/include/linux/irqchip/arm-gic-v3-prio.h
+++ b/include/linux/irqchip/arm-gic-v3-prio.h
@@ -20,17 +20,11 @@
  * GICV3_PRIO_NMI is the PMR view of the priority of pseudo-NMIs. This can be
  * written to the PMR to mask pseudo-NMIs.
  *
- * On arm64 some code sections either automatically switch back to PSR.I or
- * explicitly require to not use priority masking. If bit GICV3_PRIO_PSR_I_SET
- * is included in the priority mask, it indicates that PSR.I should be set and
- * interrupt disabling temporarily does not rely on IRQ priorities.
  */
 #define GICV3_PRIO_UNMASKED	0xe0
 #define GICV3_PRIO_IRQ		0xc0
 #define GICV3_PRIO_NMI		0x80
 
-#define GICV3_PRIO_PSR_I_SET	(1 << 4)
-
 #ifndef __ASSEMBLER__
 
 #define __gicv3_prio_to_ns(p)	(0xff & ((p) << 1))
@@ -45,8 +39,6 @@ static_assert(__gicv3_prio_valid_ns(GICV3_PRIO_IRQ));
 static_assert(GICV3_PRIO_NMI < GICV3_PRIO_IRQ);
 static_assert(GICV3_PRIO_IRQ < GICV3_PRIO_UNMASKED);
 
-static_assert(GICV3_PRIO_IRQ < (GICV3_PRIO_IRQ | GICV3_PRIO_PSR_I_SET));
-
 #endif /* __ASSEMBLER */
 
 #endif /* __LINUX_IRQCHIP_ARM_GIC_V3_PRIO_H */
-- 
2.34.1


