Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D776C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=brppILycK8XCyPmvwDAK27mdv/KOXXmIOAumvCStsEQ=; b=ftzZ9oqa58LAgm
	8pOYB3Qj8aZDwwRa2EfBN7LPcmPdzCSjkXwZt9cEUWfmTKLEi2Tbq7uN1hadRtWvBWIaV5Nopt7ro
	tagxT7ItHgslHAkTwVZ9czgo2KaKhRXDdaVy/OMWN2clxcl6uBBd8bz42uf6g9EH0EXgIn+8W16jI
	j1X4j4cWKPIItWZR6ey/pFlFzWbnV6G/rE5IbgkD4sOReQZ+m4W2IM7oBl1IzR4bC3C1m8bTNmBqD
	JRJTjFyrtftEj16MkGng94X+ubk3u4RYySQUsvQq1ocq8zEUBxEGfDilzpqmxMnW28YAf6YFZBmmP
	cq2SZxtH8PZLpyp7DJuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIaX-00000002QFR-3AWx;
	Tue, 04 Aug 2026 17:06:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIaU-00000002QBd-1gj5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:06:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C76F01684;
	Tue,  4 Aug 2026 10:05:53 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F9323F632;
	Tue,  4 Aug 2026 10:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785863157; bh=YzD7+HPBTAQSY9PfPJMGymfBg5La+P63n6Hj+NlyMeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rrgk9AnV7LxAb5EF/5/NRLyqnW1I9w7Xw25iV3FTEWX9st5hae8leuGEi29TgK4Su
	 Pl3yhDCXhn+c3jtSCzn8LyhmBlaMEjvhVESM/BhMns3pvqPL3PA/THo25wT+s94fgA
	 g9qyllyxHJ/G2NvHss2DGH+A1J1yHNW86WUVHDlw=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 10/20] arm64: gpr-num: add __GPR_NUM() helper
Date: Tue,  4 Aug 2026 18:04:53 +0100
Message-Id: <20260804170503.3513916-11-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260804170503.3513916-1-mark.rutland@arm.com>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_100558_485575_A8C9BCC9 
X-CRM114-Status: GOOD (  10.68  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
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


