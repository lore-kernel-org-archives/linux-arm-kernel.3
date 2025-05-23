Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6F4C54FC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 17:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0ctuDf7rPG60GAwFxTGoz6NYx8f9F6/hvlCXn/a3FZg=; b=MEVv9IloW2tbF2bFPKG5gw/XGM
	+gLTQ2K+gSYuhLgVJL6aIU2yI9kn225J7mTmK0DgwG6eKlK2Pdw0jZo9mXwXh+rJnA1RBFBYP+N3H
	rN6WOCOekcpKArfqrqLd6MunGzEc5x1SsNiIrl3jr6juQk+I6N5sHxgyQnu2AnmJZPlMgMOtXhgqc
	WH+63SFccEJnqdzsZTkawvod4iH9xgAWHK4O+KH2XspQkMFBccQOQe2/Q/aCRChqTlx1gS4v5TxDD
	Jb7LjsqFNx2raVv1Pp2B1/cFluSPNTmqhOCZosC3mDRtAhjx9fMWnHTdOd/rl9mwXQxVwdsXR1+ld
	JaFxBinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIW7M-00000004WjU-3WBr;
	Fri, 23 May 2025 17:23:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVmg-00000004Tmp-2Yvd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 17:02:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07A7262A12;
	Fri, 23 May 2025 17:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8E4C4CEEF;
	Fri, 23 May 2025 17:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748019733;
	bh=XfBSdfdD/kXxiwUBFnPdb6JpH5LmGZGFFN5ATSPDw7U=;
	h=From:To:Cc:Subject:Date:From;
	b=BZxla8oCDH2AcyoUG4Dlxq243yQYJ3i1MsuTn6NMZi2sG1qJLY+RfF8hSOs1iTp+t
	 2Hb3buvxctMEXV/u6Yj0VVk06w5SCsp3MK9BzfY79XjVyuaGngO30ICFSkjBM462LF
	 wy1cUq4+PzCuynbcBvu6kl7i4rWgcdKodZidlA2qofZdbm1waAnrwalLtvVsYv88P5
	 dp46LYL4G6M4k9aWCxdP33rO13b4L4uRfyFAzG2PtCYBgOze7n91jsXDO5WhJ2+gBe
	 0AuOXhLh0j8hNseJ0iL7arlgd7dzjnZQUHqJw6lhnefBFT12UcKWE4L/JJEa7HAmZq
	 HQa7rpE6RHnNw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uIVmd-0003gD-AG;
	Fri, 23 May 2025 18:02:11 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Mark Brown <broonie@kernel.org>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Will Deacon <will@kernel.org>
Subject: [PATCH] arm64: sysreg: Drag linux/kconfig.h to work around vdso build issue
Date: Fri, 23 May 2025 18:02:08 +0100
Message-Id: <20250523170208.530818-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, broonie@kernel.org, scott@os.amperecomputing.com, catalin.marinas@arm.com, oliver.upton@linux.dev, will@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Broonie reports that fed55f49fad18 ("arm64: errata: Work around
AmpereOne's erratum AC04_CPU_23") breaks one of the vdso selftests
(vdso_test_chacha) as it indirectly drags asm/sysreg.h.

It is rather unfortunate (and worrying) that userspace gets built
with non-UAPI headers. In any case, paper over the issue by dragging
linux/kconfig.h in asm/sysreg.h. It is the right thing to do, at
least from the kernel perspective.

Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Fixes: fed55f49fad18 ("arm64: errata: Work around AmpereOne's erratum AC04_CPU_23")
Link: https://lore.kernel.org/r/aDCDGZ-G-nCP3hJI@finisterre.sirena.org.uk
Cc: D Scott Phillips <scott@os.amperecomputing.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/sysreg.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index cd853801a8f7b..f1bb0d10c39a3 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -12,6 +12,7 @@
 #include <linux/bits.h>
 #include <linux/stringify.h>
 #include <linux/kasan-tags.h>
+#include <linux/kconfig.h>
 
 #include <asm/gpr-num.h>
 
-- 
2.39.2


