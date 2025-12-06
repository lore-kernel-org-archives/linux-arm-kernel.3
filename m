Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0217FD3B7E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 19:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KqLYLsomN1FrW/JcYenjNd2NwX/rE/LjvkJ1Y/BsdvU=; b=pbLEedYJYGCj3RDNMYsqQKVR7A
	pXAg0uJJcznkNMnnNScwF/DB6t7aGYfSMyr3ZivEwIz/Yk7z2KtDtw+L7iNJETdXw3r/TGAP0rYwN
	8NbdxVVY1z5e95hZSUaVNvGNLzCGeQIfmtDsDwZUyHYYxbKC1HY5MOisKkvknSDEujeqndNPCwSMv
	mDfVHA9pXZZENyCYsV6w0dl6ioRPM2/NRWoytTUlzeUyWWYATDdkJuaRMt77jo1EO3qZNBpvz8aC3
	Qe8irg1COuaMX37X5XtpUvhl2b6WOL9KIeYnnBzAO/A19FptpmyyKKCI247Yv5cj+9Z49KPltq/hn
	+QX/rb/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRxX3-0000000B9En-1SDP;
	Sat, 06 Dec 2025 19:01:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRxX2-0000000B9Ee-22Hb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 19:01:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 50AF560097;
	Sat,  6 Dec 2025 19:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98933C4CEF5;
	Sat,  6 Dec 2025 19:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765047683;
	bh=3ePID8OtexLHvKZJHnWPep8FkN/akgpFUVG9vEqC2Mw=;
	h=From:To:Cc:Subject:Date:From;
	b=cg0d4Hzo+UMIJ8j3jDFDucbvx1CFJ1trH/NnZ0Lu+faaRp5vI0EeKAbUIEowQ5/zW
	 3sFz7kohgM9gHWJkOHXu0dNw8W9tpj38BkOmQFWc+jy4h5F82frII3ZT9sAmgS+/SD
	 Z1aC37JTutAHq8301i2KHCUsSstwinciA9WJtcAyFET71r9oI4MWXIYogwYECjAjFj
	 nviFY8EKBjUXFTMjT3oILuufiXRDUf2y/Rl0x3UzpCHmiOtApOqXO2fIF8BpIb39OX
	 ztuWx/8DIr5aGA3Sh5CUgFuFuT8CavwY9NpIR2sl5hXzsKlQ1AF0Xp6CYy/vhHefX8
	 eU4xcfK1Q8PuQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-efi@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Kees Cook <keescook@chromium.org>
Subject: [PATCH v2 0/2] efi/arm64: Simplify SVE/SME state preserve/restore
Date: Sat,  6 Dec 2025 20:01:15 +0100
Message-ID: <20251206190114.892262-4-ardb@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=994; i=ardb@kernel.org; h=from:subject; bh=3ePID8OtexLHvKZJHnWPep8FkN/akgpFUVG9vEqC2Mw=; b=owGbwMvMwCVmkMcZplerG8N4Wi2JIdOkttrZ5e69aWETfbM/Ss/QLQ0x3LPr+ObNEQczw54e4 bKcvtyio5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzkSwfD/+in4gunzm3+lFaf k+z48Nv7R5P9pfRUg3+l807QqjJgMGBk2JGiV7HLcO42F+ut3XVu69hebF0o+S7wQ29IEi/rFbd +BgA=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The EFI specific SVE/SME state preserve/restore logic is unneeded, and
can be removed. Patch #1 adds some lkdtm test cases to emulate the
condition under which this code might be called.

v2:
- Document that BUG_IN_HARDIRQ and PANIC_IN_HARDIRQ will crash the
  system.
- Add Kees's R-b
- Rebase onto torvalds's tree of today so it is expected to apply
  cleanly to -rc1

Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Kees Cook <keescook@chromium.org>

Ard Biesheuvel (2):
  lkdtm/bugs: Add cases for BUG and PANIC occurring in hardirq context
  arm64/efi: Remove unneeded SVE/SME fallback preserve/store handling

 arch/arm64/kernel/fpsimd.c              | 130 +++-----------------
 drivers/misc/lkdtm/bugs.c               |  53 ++++++++
 tools/testing/selftests/lkdtm/tests.txt |   2 +
 3 files changed, 75 insertions(+), 110 deletions(-)

-- 
2.47.3


