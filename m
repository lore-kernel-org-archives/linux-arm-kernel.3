Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5321C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fp1WUkxnhvJ5IR2eKQ3SMHt49du3trxxPvYQkmiNNK8=; b=Ec5rTKnaI66URb
	2ofmixR3FcCvzizDpSEnUV+LEN4SwLq82wkwz7pnlxjNk9AwSM5woUVqqlW0xzcZrxotm+SrTMghY
	G5eUstPsYgmQT/kmIdOBOYTIsO8GYL9Fh/v7Yh1q3iwskbASLYePPgUVoUAeUCl55V5NjsZyAwi6B
	kbDQfl0K2Hd8dA7wfMDYoRLDcYPvd4r3+Zst21+X/+4pny4GWg4K5uIyabtuWW3SbO0RZYA3DnM1F
	GKEd8ItWbyYMbYv4vs0d+JUjJXzr8KJrAPmueu1zQwyRv2trGTAsRWPf9Xqy9of2x2bIUetu8MNUK
	tb9UxkbzvYBwDAdxVfDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cR5-00000007MwE-3GTC;
	Mon, 07 Sep 2026 16:43:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cR5-00000007Mvd-1e1j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:43:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C5D6760214;
	Mon,  7 Sep 2026 16:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C05A1F00A3D;
	Mon,  7 Sep 2026 16:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799390;
	bh=Fp1WUkxnhvJ5IR2eKQ3SMHt49du3trxxPvYQkmiNNK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n7Tw5X7wmPClS1PfidWlMSSGzwE56Vyb+K07OW9TKFGgJ/1QxvCFZoKgfDEo4IsKp
	 uPIWzntXgAWLL4aYjmXCXMiCzDQ9zEN+mQWDVqzPIqoYMhnVduceRNdLEq5GbWglKm
	 3wYOGEQcyfNEC0iyBdCqh3WErPszKpUEgaW/42wJmPP7KbFvHFB/k8kuRoAaYQyExa
	 BsJekbPdn/amcdakWif/SD0mswbdTyZxn7YKG1MzCx/dMhvX6zof29YelMhynlQ+Yf
	 jADdEkNMyKYC+WvGrt/bNz9WDlU8EM78l7YYkczXS4yQqEbsizmeYBNCrP6+T1obHs
	 Gqwi/u4rn4gtw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 03/21] arm64: stackprotector: Temporarily disable per-task stackprotector
Date: Mon,  7 Sep 2026 17:42:28 +0100
Message-ID: <20260907164247.17223-4-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
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
2.55.0.979.g7e5102b832-goog


