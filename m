Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68647FF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 12:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S18IWDdCFBzuI8NowwnU28bSpSBRFbUFQV3pp3AHHVI=; b=3y8JMNYSX/bw8B
	kC4AghGtmN+H0r5gS17YcbhKQBpI2XJSUq4lN8L0QoQiE9aTjrxPUyZl2Pd2Tutn15+trKzxnH2+W
	3kJR793U7a0qgyJVRNX8CRXz8uSO2IQ9naLqr1/dJVByump476pwvjwCZX2JL+cnIKYm0jCfdZsm6
	9WNTkDTpkKOiTxWPUIK9nTcxxC8YBJCRBfcEcPCeXnql/k47kjslayEsz8bhp5FQ9ID0hSyPcTnDA
	/SuCPaEFz8No7iYCTo6o+WlaHSMURHMh1qlrLexby2n9DjZJ+u1QGrtdaxZKYQA94t6/QScH3hB5D
	zJ91q8NbG34x0KJqq+2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKh7-0000000Gqbl-1Zda;
	Mon, 27 Apr 2026 12:04:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKh1-0000000GqaI-265s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 12:04:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44A8D1684;
	Mon, 27 Apr 2026 05:03:54 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 272613F62B;
	Mon, 27 Apr 2026 05:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777291439; bh=OFh1b/dqzoKdOtO2WACkfb8cmDS6G37Dk4q1SpTij4w=;
	h=From:Subject:Date:To:Cc:From;
	b=pv2iyaWLd7PVCESn/x1/Gc/jSokxnSvZQ/jbyRNJKFDeP43QPOBkehnSQMyyGsTM5
	 5XJ7ZUB4OfSghB68hntCCiZfigwjA8kT9QdaLW6PYXuarV9M3+Uc2C6tWi82mvjKpE
	 gYeEmRM2XAwnwxOb/o7HhL8nfL7qcdFMwvbIZozc=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Subject: [PATCH v2 0/5] POE sigreturn fix and extra tests
Date: Mon, 27 Apr 2026 13:03:32 +0100
Message-Id: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJRQ72kC/02OwQ6CMBBEf8Xs2ZJ2oUQ8+R/GmFIWqEhLtmg0h
 H+36MXT5CUzL7NAJHYU4bhbgOnpogs+Ae53YHvjOxKuSQwosZQF5mIKdI2u8+YuDrJSVW41om4
 gDSam1r2+svPlx/FR38jOm2FrtBxGMfdM5l+qVFGgxiyFzEstlBjSE5/VHJo4vE+Gx8yGEdb1A
 /JsNxKvAAAA
X-Change-ID: 20260423-poe_signal-809193c5225d
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Mark Brown <broonie@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777291437; l=2985;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=OFh1b/dqzoKdOtO2WACkfb8cmDS6G37Dk4q1SpTij4w=;
 b=LJz4yEtlHPyFFFqBnyWhEUZ9R8mWnmQnZdkz/Z3vRs98YJf/tdewM7QGuDnqMQbX48bZaP/C2
 /yEx169pfFtCeCDsd3uGYZdDyI3UkI0PzXafacvz4gsDCBntLTMtLG0
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_050403_790967_8F8D6FCE 
X-CRM114-Status: GOOD (  15.60  )
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

Commit 2e8a1acea859 ("arm64: signal: Improve POR_EL0 handling to
avoid uaccess failures") introduced special handling for EL0 registers
that impact uaccess. This did not however handle the case where a signal
handler removes the relevant record (poe_context for POE) from the
signal frame; this is clearly not typical behaviour but it is legal.
That commit resulted in arbitrary data from the kernel stack being
written to POR_EL0 in that case.

Patch 1 fixes this by tracking which fields in struct user_access_state
are actually valid. This restores the original behaviour, where POR_EL0
is left untouched if poe_context is removed.

The remaining patches add new tests to the arm64 signal kselftests to
check that POR_EL0 is reset and restored (or preserved) as expected.
Patch 2 fixes an issue found by Sashiko while reusing some code for
the new tests.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
v1..v2:
- Patch 1: introduced accessors and moved to using {} for zero-init
  [Will]
- Patch 1: removed change in setup_sigframe() - using the new flag
  isn't actually more consistent than checking system_supports_poe()
  and doesn't play well with the new accessors
- Patch 5: fixed the size passed to get_header(), as reported by
  Sashiko. Added patch 2 to fix the issue where I had originally
  found it.
- Patch 4: improved commit title [Mark]
- Collected R-b

v1: https://lore.kernel.org/all/20260421144252.1440365-1-kevin.brodsky@arm.com/

---
To: linux-arm-kernel@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Hildenbrand (Arm) <david@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org

---
Kevin Brodsky (5):
      arm64: signal: Preserve POR_EL0 if poe_context is missing
      selftests/mm: Fix resv_sz when parsing arm64 signal frame
      kselftest/arm64: Add POE as a feature in the signal tests
      kselftest/arm64: Move/add POE helpers to test_signals_utils.h
      kselftest/arm64: Add tests for POR_EL0 save/reset/restore

 arch/arm64/kernel/signal.c                         | 54 ++++++++++++----
 .../testing/selftests/arm64/signal/test_signals.h  |  2 +
 .../selftests/arm64/signal/test_signals_utils.c    |  3 +
 .../selftests/arm64/signal/test_signals_utils.h    | 16 +++++
 .../signal/testcases/poe_missing_poe_context.c     | 73 ++++++++++++++++++++++
 .../selftests/arm64/signal/testcases/poe_restore.c | 64 +++++++++++++++++++
 .../selftests/arm64/signal/testcases/poe_siginfo.c | 15 -----
 tools/testing/selftests/mm/pkey-arm64.h            |  3 +-
 8 files changed, 203 insertions(+), 27 deletions(-)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260423-poe_signal-809193c5225d


