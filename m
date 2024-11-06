Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED639D59F53
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 16:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/if1AiRZaUShOTuAFVIb1uest70Ah2Im5FIfKteFDIk=; b=TwfZKlx07T27MWBU6io6G7sBjU
	zRFPQBNOyN12UUUVfElRdvSzdsCk0v2uWyhE58Slxh6aX1cZRj6qFlxjfG6AzHfFpSIVQ3ul6p+W8
	5+nmG172C19CpHb1XFwAAcZlNHhIDK+ouCSrGMZNllJYgXcJ4k5cvkSvsQFOrLBcoM/JGYR/K2IZi
	1N0gfpmaujTyPMG0sHuzejxBGuPNfBQ007ak2/0nSngXGzBnOZxEJBzguVU4WioAAc8Qo57cIQhIc
	wc5PhOr6ES9sf4EbSopiyPV3wQCUhYOwWxw9DydqPwBQWEIW7Q7nJpEl8ddaUV3sGDUWIN5k5qI0L
	jG8cUTew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8j9W-000000044xJ-1fi8;
	Wed, 06 Nov 2024 16:45:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8j75-000000044RP-0bjx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 16:42:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87D131063;
	Wed,  6 Nov 2024 08:43:04 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9F4673F528;
	Wed,  6 Nov 2024 08:42:33 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	stable@vger.kernel.org,
	will@kernel.org
Subject: [PATCH] arm64: Kconfig: Make SME depend on BROKEN for now
Date: Wed,  6 Nov 2024 16:42:20 +0000
Message-Id: <20241106164220.2789279-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_084235_245105_2FBFCC3D 
X-CRM114-Status: GOOD (  11.36  )
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

Although support for SME was merged in v5.19, we've since uncovered a
number of issues with the implementation, including issues which might
corrupt the FPSIMD/SVE/SME state of arbitrary tasks. While there are
patches to address some of these issues, ongoing review has highlighted
additional functional problems, and more time is necessary to analyse
and fix these.

For now, mark SME as BROKEN in the hope that we can fix things properly
in the near future. As SME is an OPTIONAL part of ARMv9.2+, and there is
very little extant hardware, this should not adversely affect the vast
majority of users.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: <stable@vger.kernel.org> # 5.19
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

Catalin, Will, if we take this, the minimal set of other fixes necessary
for now is:

* "arm64/sve: Discard stale CPU state when handling SVE traps"
  https://lore.kernel.org/linux-arm-kernel/20241030-arm64-fpsimd-foreign-flush-v1-1-bd7bd66905a2@kernel.org/
  https://lore.kernel.org/linux-arm-kernel/ZypuQNhWHKut8mLl@J2N7QTR9R3.cambridge.arm.com/
  (already queued by Will in for-next/fixes)

* "arm64: smccc: Remove broken support for SMCCCv1.3 SVE discard hint"
  https://lore.kernel.org/linux-arm-kernel/20241106160448.2712997-1-mark.rutland@arm.com/

Mark.

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 3e29b44d2d7bd..14cc81e154ee2 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2213,6 +2213,7 @@ config ARM64_SME
 	bool "ARM Scalable Matrix Extension support"
 	default y
 	depends on ARM64_SVE
+	depends on BROKEN
 	help
 	  The Scalable Matrix Extension (SME) is an extension to the AArch64
 	  execution state which utilises a substantial subset of the SVE
-- 
2.30.2


