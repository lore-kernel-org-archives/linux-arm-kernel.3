Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75596E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 16:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OIJFoUYMrnQYs4gQhHSJl8k+kEWX9zqRN3F0yA2p/io=; b=vyKUgGueG0OaCePrv1RcK+YaQ/
	fX4a99zEaBq4GRDC67+x5Jcv2Pfz2+WW8uiXdDetm4d/ytmiVgR1GgckZp1bSLOll0QX5w66vpaNi
	pOENNIHw6tGOx6EBAHznbW5OVzzvd3OslCh83QFFNF9ODKdmbyYZyxcyiU4dlwpK+P56lDMBirzEq
	g3X19bL5nn0KLe5+1i1pxo2EqJH6LZMXpWGaiF9QqGETFRo91eTs/tQBhuAEXCixouGYgoLJWyGae
	VWs6e1szsfV6DJJZXr8Qd8cAzs1HyrW1eS8XAL23ssgRh3y4AAgZJkVr7Kbi2Ve58TT7nXt1lGfhG
	9x9mpydA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgC1-00000008TWH-28t4;
	Mon, 09 Dec 2024 16:01:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgAx-00000008T9G-0iA7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 16:00:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27C2C113E;
	Mon,  9 Dec 2024 08:00:22 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5D4113F5A1;
	Mon,  9 Dec 2024 07:59:53 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	will@kernel.org
Subject: [PATCH] arm64: cpufeature: Add HAFT to cpucap_is_possible()
Date: Mon,  9 Dec 2024 15:59:48 +0000
Message-Id: <20241209155948.2124393-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_075959_252817_41655E51 
X-CRM114-Status: UNSURE (   9.64  )
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

For consistency with other cpucaps, handle the configuration check for
ARM64_HAFT in cpucap_is_possible() rather than this being explicit in
system_supports_haft(). The configuration check will now happen
implicitly as cpus_have_final_cap() uses cpucap_is_possible() via
alternative_has_cap_unlikely().

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
---
 arch/arm64/include/asm/cpucaps.h    | 2 ++
 arch/arm64/include/asm/cpufeature.h | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

This is a cleanup as with the recent GCS cpucap:

  https://lore.kernel.org/linux-arm-kernel/Z1G3Z9C9efBkVKjR@J2N7QTR9R3/

Mark.

diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index cbbf70e0f2048..0b5ca6e0eb093 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -46,6 +46,8 @@ cpucap_is_possible(const unsigned int cap)
 		return IS_ENABLED(CONFIG_ARM64_POE);
 	case ARM64_HAS_GCS:
 		return IS_ENABLED(CONFIG_ARM64_GCS);
+	case ARM64_HAFT:
+		return IS_ENABLED(CONFIG_ARM64_HAFT);
 	case ARM64_UNMAP_KERNEL_AT_EL0:
 		return IS_ENABLED(CONFIG_UNMAP_KERNEL_AT_EL0);
 	case ARM64_WORKAROUND_843419:
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 8b4e5a3cd24c8..a4d0b77a68d95 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -852,8 +852,7 @@ static inline bool system_supports_gcs(void)
 
 static inline bool system_supports_haft(void)
 {
-	return IS_ENABLED(CONFIG_ARM64_HAFT) &&
-		cpus_have_final_cap(ARM64_HAFT);
+	return cpus_have_final_cap(ARM64_HAFT);
 }
 
 static __always_inline bool system_supports_mpam(void)
-- 
2.30.2


