Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B56FD0D14B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 18:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C4Rru172R/+vicnw1TiTYzzoRoFaQGVK7e6q0LaQAVc=; b=oE0xqlBBjAW2pPjcYrCDrP7iJ9
	m+cGlrz0ZThCKyfUnwng2TX8jC56jbtLnCz4fC56VNd4zYwFCpJNfw09LyxnrH9eVjw2WMHN11RDT
	vqnkJhrKP7aabA0n3zdBbw4opDSBJEI+/An6QmVreqdr5sEy+DWVMG4wHTvD9jOk2Tz9JdnhlQaus
	aVETGcAHbvE2NjMJlxOnGo9cn53tyImfqudeySuI5GO96grGnkHdeYZusTqRydTMFyGw6+yrzvdx3
	B1WnnA/mcpiJa3/xU5+lz3x9us4c1DQUJUU+HfDTx8ufQK+v1OHJJbpyr1FEwA6D2QHquKsBWT40f
	QPwDL9mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXw6-0000000FQHv-2xN3;
	Wed, 07 Jan 2026 18:07:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXw5-0000000FQH2-0GMT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 18:07:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2313A60007;
	Wed,  7 Jan 2026 18:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0DAC4CEF1;
	Wed,  7 Jan 2026 18:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767809227;
	bh=ZeslsZxILV34i/sGoYHyxlv20RmBgrVCfD69wbKG7so=;
	h=From:To:Cc:Subject:Date:From;
	b=CNyYwV02q8flOo8pgKj2VaOx5p+stTtiP93dfeaSrn5QRuIZ6Oq2PlmQmMVhkgZLE
	 hpGB8YXcrnCHEsoiZjzteuz/lTB0OTdALB0otn9Y8dcU4XEE+i1oTsvljUH4miglur
	 7QSaIpNJCOh4C5l4YeFt/Mz8aZLBvcbJS/rxtspBRvZUgMmS9IqJaVZ7Q8xMDAuLE0
	 18kzvdIxnpS+2HyHyTH+J++PRFDoPsA5e3wjMUzgvZbRy2QOf1ZNMACvB1/zam3PNh
	 yugNhWIpVTgiEp9JNhuiSavKFvye4m35KwznLTcTRZmQxb8r4H9BLx1NfByxaIO4DY
	 lH/mFtquFL9cg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vdXw1-00000000A9B-1sfk;
	Wed, 07 Jan 2026 18:07:05 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 0/3] arm64: Unconditionally compile LSE/PAN/EPAN support
Date: Wed,  7 Jan 2026 18:06:58 +0000
Message-ID: <20260107180701.2858276-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

FEAT_LSE and FEAT_PAN have been around for a *very* long time (ARMv8.1
was published 11 years ago), and it is about time we enable these by
default. The additional text is very small, the advantages pretty
large in terms of performance (LSE) and security (PAN), and it is very
hard to find a semi-modern machine that doesn't have these (even the
RPi5 is ARMv8.2...).

On top of that, FEAT_PAN3 (aka EPAN) is a very nice to have, and
naturally complement PAN for exec-only mappings.

Drop the configuration symbols for these three extensions, and let the
automatic detection of features to its job.

Only very lightly tested, but what could possibly go wrong? ;-)

Marc Zyngier (3):
  arm64: Unconditionally enable LSE support
  arm64: Unconditionally enable PAN support
  arm64: Unconditionally enable EPAN support

 arch/arm64/Kconfig                  | 46 -----------------------------
 arch/arm64/configs/hardening.config |  3 --
 arch/arm64/include/asm/cpucaps.h    |  4 ---
 arch/arm64/include/asm/insn.h       | 23 ---------------
 arch/arm64/include/asm/lse.h        |  9 ------
 arch/arm64/include/asm/uaccess.h    |  6 ++--
 arch/arm64/kernel/cpufeature.c      |  8 -----
 arch/arm64/kvm/at.c                 |  7 -----
 arch/arm64/kvm/hyp/entry.S          |  2 +-
 arch/arm64/lib/insn.c               |  2 --
 arch/arm64/net/bpf_jit_comp.c       |  7 -----
 11 files changed, 3 insertions(+), 114 deletions(-)

-- 
2.47.3


