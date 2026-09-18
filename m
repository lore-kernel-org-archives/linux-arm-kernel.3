Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB02FC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lbrobJz80vYx6iQgmyTnPoDjm5gh3FY+/PSyqHaMdQM=; b=aoc0kxsF/Xue2Z
	YpETMFY45PYFu882bcIcs862Y+Kpt1AWPuG0mbiu1EgZgaUCvgXQ//5c+fJy07yX7eSWQLMjQTt6L
	D7uT4Wo42HiybhaOV6E+VVUoumH9htnW/T9A14UIXcE8maSPxqcYVdXPco0DrZuDL5YM7uaF97QdQ
	FpMn1H+0y80tJ2JXRDviSofjA/n/mZJWtdTJkO7fy/pAYrDQgHtALRZlS4EAugMzLKPUDprn+G5vp
	jZ/sjbAnU0n8ZbNEpa3mWKDBVMDzFhSTKAOVWSxxujGUhQ+tHVcBx/GffkfpVtJRoovx4E0W/Ih5G
	lrb+qO1wHCD4b74lCUrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEK-0000000Eyrq-3NkJ;
	Fri, 18 Sep 2026 16:14:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEJ-0000000Eyr1-2IGQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:14:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A9C506057A;
	Fri, 18 Sep 2026 16:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3291F0089B;
	Fri, 18 Sep 2026 16:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748066;
	bh=lbrobJz80vYx6iQgmyTnPoDjm5gh3FY+/PSyqHaMdQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LYefk78/b4y9UWbTdqqO/keF41dagr6o96GY1C4WOOV7R67uxQXxrUKS8tTbN/Kyu
	 Hs6DLLoPzOkR+P+iHexhfDJL4GDd8X4us/9HbIL6hODwQ0GH3KIqd7bORm6xD7K9Xe
	 vkOCUDo1X/RElORdScxyUerbJgh8vLKurXlLstcVK51hh58CwCQ/8JDo3kqOD2qzPN
	 SoJeozoy2NERbXs8ia1k+PF6RqrdK4PTEoGCGiYzDaoVyX9Z1gUg5cFc+VYxY3mfV5
	 IXaZRyqIBQsbtDclwqjpAPldl0sXXetkDkloc2e+UcVoke37rJc25s+DzLWXD3qb+Z
	 9Nzu88fR7MCwA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 03/21] arm64: stackprotector: Temporarily disable per-task stackprotector
Date: Fri, 18 Sep 2026 17:13:47 +0100
Message-ID: <20260918161407.2300-4-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Per-task stackprotector relies on telling the compiler about the system
register used to hold a pointer to the current task. As we're about to
change that around, temporarily disable per-task stackprotector for now.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..b8270b301809 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2455,6 +2455,7 @@ config CC_HAVE_STACKPROTECTOR_SYSREG
 config STACKPROTECTOR_PER_TASK
 	def_bool y
 	depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_SYSREG
+	depends on BROKEN
 
 config UNWIND_PATCH_PAC_INTO_SCS
 	bool "Enable shadow call stack dynamically using code patching"
-- 
2.55.0.1082.g2b9226bbc0-goog


