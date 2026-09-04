Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D068C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PB93PjIFbExPYXFb562jtyWeUXbMaTixHyMSrnpUgI=; b=tf0XnC3qR1rQd5
	urhGdPBKJ461Z0aMWiPaccWYg+mPwaw0/9aQb8FllECqKkUum374Od++ovhUBWTaHF45eePaxALYh
	WAHv2OhalRYDkE+he3THhQwNA4y5wF5XiRFfVM556H3RchFq7ugPFUao87Vo+zHt+XkC5bcoDDajw
	mVLeeATynzpzmAf6fkURtmRYFx6tEipnVL6snHRFpXC1B0D/LPwORqpMzS/k2M//VgK9nO7nk/0/g
	GZzeV7xiu3JK/4/8SdswdYrS3bqu2Mm5r5G0KaZNR39Bca91m+F4VYaz72Z5nt/VK2fFqPgfnSbel
	DuiqJh8Z4ijorB2/RgNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wd3-00000002hEe-0kT8;
	Fri, 04 Sep 2026 16:19:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wd0-00000002hCe-2yYr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:18:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B9D61FC4;
	Fri,  4 Sep 2026 09:18:48 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D840B3F8D6;
	Fri,  4 Sep 2026 09:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788538731; bh=w07zAcxGPrwpKNC+UEkyQF6OePGiGiP3sL6U5wQzJsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gM/bDQR0GbHmXFnoDfCIxntg9/jiTMGUld1GSVVhLOI655uh4ePdJjINsHtpR7EYk
	 8/ZBWBG1XkImKS60gBJzKdF9oHS/WsTyjcfb4aOhDMVJyStvGP1H/s/effCLFH0mHf
	 8KA7b6GDkKdN4a7+D7OYdZuJZ4aqp2PLJhh/Qy1I=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 10/21] arm64: gpr-num: Add wxN aliases for wN registers
Date: Fri,  4 Sep 2026 17:17:47 +0100
Message-Id: <20260904161758.376504-11-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260904161758.376504-1-mark.rutland@arm.com>
References: <20260904161758.376504-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_091858_787065_76D93465 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Some A64 instructions require a W register name for specific register
arguments, and will not accept an X register name. For example:

	STRH <Wt>, [<Xn|SP>, (<Wm>|<Xm>){, <extend> {<amount>}}]

This is painful when writing macros for inline assembly, especially
where a single register is used as both an X register and a W register.

We solved this for plain assembly by adding a wxN alias for each xN
register in commit:

  4c4dcd3541f83d21 ("arm64: assembler: introduce wxN aliases for wN registers")

Add the same facility for inline assembly, with a new
__DEFINE_ASM_GPR_ALIASES macro.

As with the other macros in gpr-num.h, different escaping is necessary
for inline vs non-inline assembly, so we can't share a single definition
that we stringify().

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


