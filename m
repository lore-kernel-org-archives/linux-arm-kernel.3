Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2A9C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/GKX3IjH5uKDq/8w06PcQUyEeksBuMAx7kcby96yrI=; b=yJmihXMWu/2mq8fqzxyhxtsxK4
	n4RFVlcl3G45t6OiyPVeUyBzFQquR80wjKkR4EUaotW4dk9iqfhcTdf6Wn/M6AwI7l3sR/MkhjPMD
	ZHJSNmBbqiNqKEBcrTzZyjx4xcYaFlv8P485nOtD9I7vMjX02W5wkW5rOrC9Krr6ky1KTdCld/rxu
	60YCskGDAOQ9pLn6x7eVVgQ3jSDu41ChJycb+mmKVH3xf99yxtxy9xADzShXJM/0Fv9QsBVzu8ooA
	g1tgiU1QdqvFpgGm56ZYpJkkD84mxIbfv+4cD3riNDZqYjFRHABop7iPX4ubYQfJ5S7Wxvgtw/Sqc
	sTQT86ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3Mp-00000007u6X-0l0K;
	Wed, 29 Jul 2026 12:26:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3Mb-00000007ttD-0mK8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:26:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83E05168F;
	Wed, 29 Jul 2026 05:26:15 -0700 (PDT)
Received: from a085714.blr.arm.com (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0B5153FA1F;
	Wed, 29 Jul 2026 05:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785327979; bh=M2ps/0zfUAQBr8mTpjkLtUW0+CfbGBqydB+0Or/9/Lg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s67r0/xD72kclPDh9SmJEMUoTLUiZAEmItMV562/z0Xu6NVG5VAPo/wXYLoVJga2o
	 k7OoO5MI3U2AaN4WbbcMkqk/uBph/b4pkZOms7lF02ZRkW/M3cdJ0N/kjt6ej3Sz21
	 TAQqFCE6T6YgK7P17Zf0WP8D7nHkPyHeqn3zxT5w=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/17] arm64/mm: Make ARM64_D128 selectable
Date: Wed, 29 Jul 2026 17:54:52 +0530
Message-ID: <20260729122452.3797443-18-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729122452.3797443-1-anshuman.khandual@arm.com>
References: <20260729122452.3797443-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_052621_270016_F3B4985E 
X-CRM114-Status: GOOD (  11.81  )
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
 arch/arm64/Kconfig | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 8459d43afd45..6c88906d48ec 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -275,6 +275,10 @@ config GCC_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS
 	def_bool CC_IS_GCC
 	depends on $(cc-option,-fpatchable-function-entry=2)
 
+config CC_SUPPORTS_LSE128
+	def_bool CC_IS_GCC
+	depends on $(cc-option, -march=armv8.1-a+lse128)
+
 config 64BIT
 	def_bool y
 
@@ -2249,8 +2253,18 @@ endmenu # "ARMv8.9 architectural features"
 
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
+	depends on !KASAN
+	depends on !UNMAP_KERNEL_AT_EL0
 	default n
 	help
 	  ARMv9.3 introduces FEAT_D128, which provides a 128 bit page
-- 
2.43.0


