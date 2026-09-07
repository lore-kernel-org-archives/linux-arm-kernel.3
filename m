Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6715AC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 03:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAvzBvzg6imid5AikBY1vN1K5IfehJLW5pCyJnTwJvo=; b=Qx3aDxo61kIkqoojME5H05o57g
	OHQ1QhuQk8e0bAfhnt8qNIVVppxNWWlEVT4zLXsimSSAqoNyV0fCpQnOKAuVSZAk28dBAVnS/aw/q
	RAzHXEadJT8/rLS4cGdTO63vrCjmwWQKIy+9RNQQ93dO4YTyiMdXpOijE+sEfs36yQFcZZXkI99pl
	HJEXZMLz1df06W/j5iedk+SwGdO/zJeJhMU2xgfmTcqNxTZhJTjxFavzdo7brXnVV9RivrSDuLynH
	XTBGweVM70pTjQ1hJdZ/agL7L3wInep4U+QJe67M5i55s2exY8V0MckNYzyFq1ks92gFQJoShMedy
	YZ8dSiSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3QQb-00000005p7z-1lPp;
	Mon, 07 Sep 2026 03:53:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3QQZ-00000005p7Y-2uHt
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Sep 2026 03:53:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KAvzBvzg6imid5AikBY1vN1K5IfehJLW5pCyJnTwJvo=; b=SUtl71DJVE9813ErWDoqJWw9Kn
	avzIFC35BnEEzoImAtwqy5E12ixJqTEvaSAWZ9Iph+3RCuEac+8GYo/7/Fa4A+WsMc/0WUBgnzfe4
	CfvbKbKgo8ak9JnNZbZADVBjPWPGU4fjA0R2T2XllWVSr0NjnVGGjLuq7MdZJw8YmS9Bdsu/4rTAo
	KDugyeRIjGoBDXQDD6+En7WoeEXfzoVokkIw9tdjqdd81YeZM9bL6NIZjett6T4hSdlo5UMXJK8YI
	U6EEieEHKyscVSStKpj259IQ0DrwUmMZ5RIr/GlG4TDtAFslnYOAdk4kcj3k2+axQkNFbs6OVEEoY
	SN5fwqbw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3QOL-0000000FmP0-380h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 03:53:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7612D1BC0;
	Sun,  6 Sep 2026 20:51:20 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B7F53F7B4;
	Sun,  6 Sep 2026 20:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788753084; bh=mwPzeOmFdvSni4XKS2FMhb0rbVSwZIBkk8UWH/i+Cdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cf4fVwxI/mmmgyaiTUIT/ejH9+XvsNL/MOGeyLViRVFbSZVWf1T80E/Cg3+gFm2UJ
	 cAIt+R9hrBwm55yxbTxLbtLImTnzRHfdm1A+s2hyROu4uh4fh9RI+VdEgdms7jNlMP
	 AabfhMhqjw06n1wosd7mIREPGtAeez160qFYBaVM=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH V2 13/14] arm64/mm: Make ARM64_D128 selectable
Date: Mon,  7 Sep 2026 09:20:28 +0530
Message-ID: <20260907035030.2839978-14-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907035030.2839978-1-anshuman.khandual@arm.com>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_045139_449616_55633B2D 
X-CRM114-Status: GOOD (  11.78  )
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

All required changes are already in place including the TLBIP instruction
support for enabling D128 translation. Just make this new ARM64_D128 user
selectable, after ensuring necessary tools chain support required for the
new instructions being used for D128.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Changes in V2:

- Dropped !KASAN dependency from ARM64_D128

 arch/arm64/Kconfig | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 306e6c803471..483eb6d75c7a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -276,6 +276,10 @@ config GCC_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS
 	def_bool CC_IS_GCC
 	depends on $(cc-option,-fpatchable-function-entry=2)
 
+config CC_SUPPORTS_LSE128
+	def_bool CC_IS_GCC
+	depends on $(cc-option, -march=armv8.1-a+lse128)
+
 config 64BIT
 	def_bool y
 
@@ -2305,8 +2309,17 @@ endmenu # "ARMv8.9 architectural features"
 
 menu "ARMv9.3 architectural features"
 
+config AS_HAS_ARMV9_3
+	def_bool $(cc-option,-Wa$(comma)-march=armv9.3-a)
+
 config ARM64_D128
-	bool
+	bool "Enable support for 128 bit page table (FEAT_D128)"
+	depends on ARCH_SUPPORTS_INT128
+	depends on CC_SUPPORTS_LSE128
+	depends on AS_HAS_ARMV9_3
+	depends on EXPERT
+	depends on !VIRTUALIZATION
+	depends on !UNMAP_KERNEL_AT_EL0
 	default n
 	help
 	  ARMv9.3 introduces FEAT_D128, which provides a 128 bit page
-- 
2.43.0


