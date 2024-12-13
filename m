Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7231E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 17:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YyBmt+RdVlBnGqBSYj/SN1ZaEWgSLw2OVfU/VAho0NY=; b=XkV3hGJB7WlXkJxEkEtxzGxtDr
	M4QPLa8UYxPxl0OShUIEPnBe02IcQ2kztXTlCasJWrHF3RGb5xlClRqDs+QGSdbjkFEyXlGziS2Fr
	hM82Mc+Huow4PUQOcaUwrszoMPvmlqTpcWylus6+dTd26R+HtgZ7i5e1GbHFyVNjcQQXcdYXXhm5J
	fxBUj/lR4E6JimZJ0tuwxaLFVdSNBgTOddTKZpk2pUR+9mNHp68aTQnE4HHZFi3fGVtM9tZrZ5ocu
	9y+lOJQejhcYpxFm3Jd7AtjsVfR6eBaUOkgumGQZk4E2QaRSs+WJWkJwcZER6VjEzkvm7aW9h5gD9
	RqMw9bow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM9gf-00000004bEf-1cWy;
	Fri, 13 Dec 2024 17:42:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM9fa-00000004b4h-1FFn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 17:41:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7145FA405BC;
	Fri, 13 Dec 2024 17:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8842BC4CED6;
	Fri, 13 Dec 2024 17:41:40 +0000 (UTC)
Date: Fri, 13 Dec 2024 17:41:38 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 6.13-rc3
Message-ID: <Z1xx0ha7lbKkdhRC@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_094142_396066_30001869 
X-CRM114-Status: UNSURE (   8.74  )
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

Hi Linus,

Please pull the arm64 fixes below. Thanks.

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to ce03573a1917532da06057da9f8e74a2ee9e2ac9:

  kselftest/arm64: abi: fix SVCR detection (2024-12-13 14:59:37 +0000)

----------------------------------------------------------------
arm64 fixes for 6.13-rc3:

- arm64 stacktrace: address some fallout from the recent changes to
  unwinding across exception boundaries

- Ensure the arm64 signal delivery failure is recoverable - only
  override the return registers after all the user accesses took place

- Fix the arm64 kselftest access to SVCR - only when SME is detected

----------------------------------------------------------------
Kevin Brodsky (1):
      arm64: signal: Ensure signal delivery failure is recoverable

Mark Rutland (2):
      arm64: stacktrace: Skip reporting LR at exception boundaries
      arm64: stacktrace: Don't WARN when unwinding other tasks

Weizhao Ouyang (1):
      kselftest/arm64: abi: fix SVCR detection

 arch/arm64/kernel/signal.c                         | 48 +++++++++++++++-------
 arch/arm64/kernel/stacktrace.c                     | 32 ++++-----------
 .../testing/selftests/arm64/abi/syscall-abi-asm.S  | 32 +++++++--------
 3 files changed, 55 insertions(+), 57 deletions(-)

-- 
Catalin

