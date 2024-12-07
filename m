Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91A1E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 19:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZusazknTvRCKC9OsJXLvajHD+Zt9NLjrmB7oTXHVD0=; b=aiu+REyJWj4n5gIsbuq27kdCxm
	Pg1ILD/3dTOvgRaXFOAPYKeKLpR147dx+1lDV3eBm9iSa1Y7XpV8ygQsdl7XmrC35o3TXIm5IOk9a
	FOq+KZU68l2rwS7TZCVylLOS6ELENuOj6yUrHfaAGSEX5MLUoV/jUk6WqUKlgOC1JZeSwEkmv1oxX
	BrKO4bHCHUVlf4Sg9s0MAVFYSM0lUfWILDngbl3e1d7g7ocrx18hydibEOYw2XCq07IPkeSHv19pj
	htZR2MQttUWbex/C0DcNZZ8mBCcLrbdQzRV+rLiOMCLqHMdSHtN1GaxH/020Xc6CcGVmfx38tUFPF
	Xn8jYecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK0C0-00000004ISx-1d1k;
	Sat, 07 Dec 2024 19:10:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK09y-00000004IKX-0gUL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 19:08:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3CF18A40856;
	Sat,  7 Dec 2024 19:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E789C4CEE0;
	Sat,  7 Dec 2024 19:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733598488;
	bh=ieCSJY6ovtV+5BP0KLjpV97miFo9w2jKSQmZAKncuJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mDstrgRc3DVnIPMquH9SUR5DmN++/RW9bLlH+EXnQNm1tPZjG/GQmwRUuD92yMN5Y
	 /sZT5Qeu6XmbZ7Ur/xO29B5aGMrog2esOHQMsd/2dP/G6SxIO+E6Kw0cMuCjq7GoGm
	 H2uV0V/DDrXYM0F5h3jTTgBUx4/2ydMw7befQBC16Lsjh+M6ta0VcvmlG/dgkP7g1o
	 QZkuVHrncM9M4kEHlycnZWII0OW34n/jIJHAfTG6Y2dLHSkR1K5QtLpCbrtrHc3cv7
	 nGGeGH8Wf8FFR0PFDwC2xGzTrpmHbe2SiivkHx/hL4INnUAAD5OCBuJpXNw6/lBPlK
	 uZkMDzqLlbQRg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tK09u-001TOc-3X;
	Sat, 07 Dec 2024 19:08:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/4] arm64/sysreg: Allow a 'Mapping' descriptor for system registers
Date: Sat,  7 Dec 2024 19:07:37 +0000
Message-Id: <20241207190740.2607673-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241207190740.2607673-1-maz@kernel.org>
References: <20241207190740.2607673-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, joey.gouly@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_110810_356123_138B65E8 
X-CRM114-Status: GOOD (  12.48  )
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

*EL02 and *_EL12 system registers are actually only accessors for
EL0 and EL1 registers accessed from EL2 when HCR_EL2.E2H==1. They
do not have fields of their own.

To that effect, introduce a 'Mapping' entry, describing which
system register an _EL12 register maps to.

Implementation wise, this is handled the same was as Fields,
which ls only a comment.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/gen-sysreg.awk | 2 +-
 arch/arm64/tools/sysreg         | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index d1254a056114e..1a2afc9fdd42e 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -206,7 +206,7 @@ END {
 
 # Currently this is effectivey a comment, in future we may want to emit
 # defines for the fields.
-/^Fields/ && block_current() == "Sysreg" {
+(/^Fields/ || /^Mapping/) && block_current() == "Sysreg" {
 	expect_fields(2)
 
 	if (next_bit != 63)
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index b081b54d6d227..b6846c601df6c 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -38,6 +38,13 @@
 # Fields	<fieldsname>
 # EndSysreg
 
+# For register names indicating a cross-EL access (*_EL12, *EL02),
+# a Mapping entry describes the register it actually accesses:
+
+# Sysreg 	<name_EL12>	<op0> 	<op1>	<crn>	<crm>	<op2>
+# Mapping	<name_EL1>
+# EndSysreg
+
 # For ID registers we adopt a few conventions for translating the
 # language in the ARM into defines:
 #
-- 
2.39.2


