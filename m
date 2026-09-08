Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D797C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OaUU92Dn2FGDK8buM/Lh5FiKpTpF3RIMSQx9zRLVeME=; b=YQKjoxziFjmfSj
	ySulvVBQU3dvbw3IiKhG9vYSDJ5e5Vu8NBuBUw4o1Ag4j/GX0dza3XQVyQCjIWoFopVDImk7eTZaQ
	b//NyH69foRmSY8YpC9ataFjdxLxlXgKm4ftcmaeVw51Cr2igK+YBSC3sDdDFgeGlnDLvJb0VXYCw
	/bwAzDTkJmx7nMcW+mJ9CBCrDmkix3xt0qIyFKyWmUo3Nd3E2UZ+0br0ePS2yxvjPIftb8DVbpb9g
	jLrB2875RHr3ujamshmZLbUjCdRjDdFze/xPRJrW/fPPQoTweOUN5Q7Pw5PbB030WYpL4AFpTErpK
	G3RNRvFaPM5lvbqo/FYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xeE-00000009Sel-0pK7;
	Tue, 08 Sep 2026 15:22:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xeA-00000009Sdh-0lFj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:22:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C00B91C14;
	Tue,  8 Sep 2026 08:22:01 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ACDDC3F7B4;
	Tue,  8 Sep 2026 08:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788880925; bh=ki0awHv7wA0mCQKhq+F9Yw0sopN8F9mV84WGSkZrsjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qxf0H1yD3qENk6YokROYVjrFkjFMAtaAJ3/ocjaOZsepJmz2Mc9L/QjP7J6AvqXvy
	 9s/2CjUWg6xeLS5ewh3Arxp+9jXzAlsD2Sl2Kct05HsNT6j5Jy6BvzXys4Rg4AgG60
	 Vnv38tuDt4FMqEDbb0BaOFxbCFrwMluQ0D3hNAOs=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 11/21] arm64: gpr-num: add __GPR_NUM() helper
Date: Tue,  8 Sep 2026 16:17:31 +0100
Message-Id: <20260908151741.394589-12-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260908151741.394589-1-mark.rutland@arm.com>
References: <20260908151741.394589-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_082207_625661_AA0722CC 
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The gpr-num infrastructure requires users to concatenate the register
name with a long prefix in order to get a symbol that evaluates to a
compile-time constant. Doing this manually is error-prone and painful to
read.

Add a new __GPR_NUM() helper which wraps the concatenation.

For the moment I've left existing open-coded concatenation as-is. In
particular, the DEFINE_MRS_S() and DEFINE_MSR_S() macros have awkward
stringification requirements and would require invasive changes that
outweigh the benefit. I have plans to rework those in the near future to
remove the need to use gpr-num values.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/gpr-num.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/include/asm/gpr-num.h b/arch/arm64/include/asm/gpr-num.h
index 240cd25d55c5a..30fb8a67b19f0 100644
--- a/arch/arm64/include/asm/gpr-num.h
+++ b/arch/arm64/include/asm/gpr-num.h
@@ -11,6 +11,8 @@
 	.equ	.L__gpr_num_xzr, 31
 	.equ	.L__gpr_num_wzr, 31
 
+#define __GPR_NUM(gpr)		(.L__gpr_num_##gpr)
+
 #else /* __ASSEMBLER__ */
 
 #define __DEFINE_ASM_GPR_NUMS					\
@@ -26,6 +28,8 @@
 "	wx\\n	.req	w\\n\n"										\
 "	.endr\n"
 
+#define __GPR_NUM(gpr)		"(.L__gpr_num_" gpr ")"
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* __ASM_GPR_NUM_H */
-- 
2.30.2


