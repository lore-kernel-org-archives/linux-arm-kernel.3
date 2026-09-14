Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCD6C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7I7KC46TFOZ2PjPIGhbIMipNRyFQPnMt5m7ik3L7CDU=; b=igXtihz92Yp55KDmQ8531S0M1l
	JIoCKMOaWRIma8kgJWY7GMMmnmz7o4CbmvX5F0pd/JgjYnKh12vg3YCUkonzm5MOkRRt/uoV/WRpf
	aYXAC0a1bp+g/NAoqdC4/OLctOtqkjo38zUQcr3GcNT9pMegiu6dvE6OtSv47oYtDRpX1QchWuvnp
	7iIbGxVOo0j+Sg/FpZweZc88Rd0tyvXoHbUGgyNZhJlfSO2Y714KGkKXlAseY2tFWkxfebI4lLylo
	uFuqytdY22qRsrVWKKKAJKGg5WtA0Tm4Bvm2OUHSaqiPCV6w0mXpzt35V9wjs7d2wz+GLw9IU5zwK
	aDhywp3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pS-0000000364d-2oMp;
	Mon, 14 Sep 2026 10:22:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63on-000000035J1-1o0d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:21:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BDEE1576;
	Mon, 14 Sep 2026 03:21:41 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E63083F7B4;
	Mon, 14 Sep 2026 03:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381305; bh=xXalxtF53QhL0XkcmRFoWvxMKn0r+KWZw6FOpFrouWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OMJCAD9I6sQoG60bNbUkJu1l1Us3qHhXGemW5ChNQ6qQXWM6r3VJ3lCDp71OPYNqA
	 2fohY6dXB1l0Zks7ItislVlSAIyhVBgjdTTMOij7tAjEXGTSbX4HlJxuDbM+diEtD8
	 La3ySBfZGHA1gXtYmA9BuVW1tF/2jvJsU81y7YSU=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 12/38] arm64: gicv3: remove GIC_PRIO_PSR_I_SET
Date: Mon, 14 Sep 2026 11:20:36 +0100
Message-Id: <20260914102102.68597-13-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032145_519590_0D66D8B4 
X-CRM114-Status: GOOD (  12.53  )
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

From: Ada Couprie Diaz <ada.coupriediaz@arm.com>

`GIC_PRIO_PSR_I_SET` was used to keep track of sections of the kernel
where interrupts always need to reach the CPU and could not be masked
via interrupt priorities, or DAIF bypassed the status of the PMR.

This flag unmasked IRQs when OR'd to GIC_PRIO_IRQON and ensured that
that IRQs were seen as disabled by the `local_irqs_...` functions,
as they would only check the PMR if pseudo-NMIs were enabled.

This is not needed anymore as our IRQ masking APIs now know how to handle
interrupt priorities properly and in parallel with DAIF : remove it.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/ptrace.h         | 2 --
 include/linux/irqchip/arm-gic-v3-prio.h | 8 --------
 2 files changed, 10 deletions(-)

diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index e4c7e6bafa3d..cf7e51b8ef0b 100644
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


