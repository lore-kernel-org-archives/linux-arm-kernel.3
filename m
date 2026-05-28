Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4030CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 16:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yy2B9Ba4MD0U4ZdQlCNyrWMiILkz4DzD5i4ALEs9fmQ=; b=NKUOghtCw0m0nDYhT2jSp6a0t8
	CsybBXEmxrcOYrmVLcB8SrDWKHF1p6C+l4zSvALn+nvcrQoJeukpeVbgX1u5PG6MTkSqaQg2rp58W
	QFfxz8eakR9LYga5aSYGBO40gQpAAMvq3oFQ1Wp5Pr1VqbGEVzv8qArbUAwSH9YAVgh+wLC0mFiYx
	12/mRgXwd/g0hkqeXc3oB31SXIsEZkdMCjQmaTyFhNfoNCL796qjyyvqv7Vd1V4PML9QOyq306vmh
	SnUKY5fuXaykt3PpZfNIOm0bHzRvMZXBP6GR16zSTjsGxy0bqHT68X6fdvcbZGzIwSH4oWRua37+o
	u9hwBb8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSe1x-000000063GJ-1Nw3;
	Thu, 28 May 2026 16:56:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSe13-000000062NL-0iCo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 16:55:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16E27460D;
	Thu, 28 May 2026 09:55:23 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BAF9E3F905;
	Thu, 28 May 2026 09:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779987328; bh=VV+fwEI2oRDciEKVwmpXCawYRlotLtMhk6b7N6IOyBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CeeJHJBseAMy80yCyls4Rbp17zh7afAIM/0CNbSaQfGMyFkc9fFNT1ruumoWRIoGP
	 9bv7vXPhQQwnejQ8Kruq27014n4l51oXHVEvUp7pSljeZmSJKlyqJw7csnNsRXRE5p
	 3V5BFr3xrquex8r/oaxHnA2gjJkduVwhm5NuD7Q8=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	tabba@google.com,
	vladimir.murzin@arm.com,
	will@kernel.org
Subject: [PATCH v2 18/18] arm64: fpsimd: Remove <asm/fpsimdmacros.h>
Date: Thu, 28 May 2026 17:54:46 +0100
Message-Id: <20260528165446.701944-19-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260528165446.701944-1-mark.rutland@arm.com>
References: <20260528165446.701944-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_095529_271547_21C2C127 
X-CRM114-Status: UNSURE (   7.66  )
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

We no longer need any of the remaining macros in <asm/fpsimdmacros.h>.

Remove all of it.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/fpsimdmacros.h | 64 ---------------------------
 1 file changed, 64 deletions(-)
 delete mode 100644 arch/arm64/include/asm/fpsimdmacros.h

diff --git a/arch/arm64/include/asm/fpsimdmacros.h b/arch/arm64/include/asm/fpsimdmacros.h
deleted file mode 100644
index a763fd03ffef3..0000000000000
--- a/arch/arm64/include/asm/fpsimdmacros.h
+++ /dev/null
@@ -1,64 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * FP/SIMD state saving and restoring macros
- *
- * Copyright (C) 2012 ARM Ltd.
- * Author: Catalin Marinas <catalin.marinas@arm.com>
- */
-
-#include <asm/assembler.h>
-
-/* Sanity-check macros to help avoid encoding garbage instructions */
-
-.macro _check_general_reg nr
-	.if (\nr) < 0 || (\nr) > 30
-		.error "Bad register number \nr."
-	.endif
-.endm
-
-.macro _sve_check_zreg znr
-	.if (\znr) < 0 || (\znr) > 31
-		.error "Bad Scalable Vector Extension vector register number \znr."
-	.endif
-.endm
-
-.macro _sve_check_preg pnr
-	.if (\pnr) < 0 || (\pnr) > 15
-		.error "Bad Scalable Vector Extension predicate register number \pnr."
-	.endif
-.endm
-
-.macro _check_num n, min, max
-	.if (\n) < (\min) || (\n) > (\max)
-		.error "Number \n out of range [\min,\max]"
-	.endif
-.endm
-
-.macro _sme_check_wv v
-	.if (\v) < 12 || (\v) > 15
-		.error "Bad vector select register \v."
-	.endif
-.endm
-
-.macro __for from:req, to:req
-	.if (\from) == (\to)
-		_for__body %\from
-	.else
-		__for %\from, %((\from) + ((\to) - (\from)) / 2)
-		__for %((\from) + ((\to) - (\from)) / 2 + 1), %\to
-	.endif
-.endm
-
-.macro _for var:req, from:req, to:req, insn:vararg
-	.macro _for__body \var:req
-		.noaltmacro
-		\insn
-		.altmacro
-	.endm
-
-	.altmacro
-	__for \from, \to
-	.noaltmacro
-
-	.purgem _for__body
-.endm
-- 
2.30.2


