Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2320AC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=to6Pu2KAD5gTZPlYqFZvunXHqvdeANoe/tpYRC1I4fc=; b=xrZl1CYx3DlisQ
	OqNz4vKXZyY90NkEKstBQzGQ3dgPDalgi0OULga9cLX8x7XLLYHKparpgIFubfTCYzFuYu5pQhFOX
	EcxtIy4z7VllWFkKjJCVFGlVsONSUnYlbYEXYaDCfo62Efh9S93HH63cJoZ4zjNlwOktoeuzrIT6z
	Gera6PRm6CeenxMHCqaQRO36isLy5x1/8FInqdW9Z2Hgz+GA97GVcxwTAhdS5tgHzQI2OmPWB/xen
	qaJn7WmDVn0zDNq9rKLqX2wYFbOEXC+79/q4Nj/xi1abLc4v47DqG5hbESuccGOWgNDr8HowHHTMO
	RfSPa/QytDfrHanDDNNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh6S-00000005Gbh-1int;
	Tue, 28 Jul 2026 12:40:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh6A-00000005GSH-2ScI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:39:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0F0C175D;
	Tue, 28 Jul 2026 05:39:49 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 396E93F86F;
	Tue, 28 Jul 2026 05:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785242394; bh=uoFKcLbZS4KHZXEKTdLsc0hmo8Yp+pZmDr8NaV3E3oA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E3u8BIcPvUfELlx3Jlj8HFnVZDFQ9+5quDkR/d3NUExpVISKG+Tbf2MMJ59eIa51Z
	 D2BqlBHkDzgX72qE83cpP/LfPYnYsdDr0sFSuhKe5nnsN14yuI+RvaaDBMjhWKTXIn
	 NzB8htZSvLnM0wfjv/iKpK32m4gV4ZDYnH3VQyPw=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 05/13] arm64: gpr-num: Add wxN aliases for wN registers
Date: Tue, 28 Jul 2026 13:38:51 +0100
Message-Id: <20260728123859.2911495-6-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260728123859.2911495-1-mark.rutland@arm.com>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_053954_662730_57E0816E 
X-CRM114-Status: GOOD (  10.61  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, hca@linux.ibm.com, linux-kernel@vger.kernel.org, ruanjinjie@huawei.com, yang@os.amperecomputing.com, maz@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Some A64 instructions require a W register name for specific register
arguments, and will not accept an X register name. For example:

	STRH <Wt>, [<Xn|SP>, (<Wm>|<Xm>){, <extend> {<amount>}}]

This is painful when writing macros for inline assembly, especially
where a single register is used as both an X register and a W register.

We solve this for plain assembly by adding a wxN alias for each xN
register in commit:

  4c4dcd3541f83d21 ("arm64: assembler: introduce wxN aliases for wN registers")

Add the same facility for inline assembly, with a new
__DEFINE_ASM_GPR_ALIASES macro.

As with the other macros in gpr-num.h, different escaping is necessary
for inline vs non-inline assembly, so we can't share a single definition
that we stringify().

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/gpr-num.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/include/asm/gpr-num.h b/arch/arm64/include/asm/gpr-num.h
index a114e4f8209b0..240cd25d55c5a 100644
--- a/arch/arm64/include/asm/gpr-num.h
+++ b/arch/arm64/include/asm/gpr-num.h
@@ -21,6 +21,11 @@
 "	.equ	.L__gpr_num_xzr, 31\n"				\
 "	.equ	.L__gpr_num_wzr, 31\n"
 
+#define __DEFINE_ASM_GPR_ALIASES									\
+"	.irp	n,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n"	\
+"	wx\\n	.req	w\\n\n"										\
+"	.endr\n"
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* __ASM_GPR_NUM_H */
-- 
2.30.2


