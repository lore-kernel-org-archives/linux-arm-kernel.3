Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E83CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S+bJNY2azawl6TARHEiCSrt3oexOSpIJ3nSEc+39PZs=; b=a1HWCqxlVn1tSk
	fS1TkUUjrY8GJ2te3pBXfgX8CZVBk8t0zF0bIRchgBRKUUq8WPoxYvoYCCdDf9eYo9GSNt7eq6Ni2
	GLcRoMNY5/iE+m3R8WtWUGzCCjOI3ImBhQnBuidp6Srd3OPT62ZO3mK4RK/d1+FO7kxGqHV8yRLck
	FcxW4BUYhUV5R5MiK+4iMAMeMCxC5Mhf6qIJysWKLlypR2VXlGCLkccY0nQGGkxPdz2E6u+gWJubq
	c1Skz291icjyrlNlovy4+3q5U3VtwdeuQJN9HaugaQK7Km33vkB3msvV0z1w5Fq0vHjL2Bq/fufQT
	g0m6jkgLmW39Ov9VLDIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0dm-0000000GGzP-1ZJB;
	Mon, 18 May 2026 16:16:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0dk-0000000GGzD-41SV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 16:16:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5247160120;
	Mon, 18 May 2026 16:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC6FC2BCB7;
	Mon, 18 May 2026 16:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779120984;
	bh=a6ehEwxcfvf1a/EiCCCXSWERXhRSVhiiTAiYG3cJw6U=;
	h=From:Subject:Date:To:Cc:From;
	b=L1mY3kegMOzlom+F+EaQFxiQvWDUqFmnYzFvrPYT+rPP7lTOW18dO8GMA3iN52jDT
	 lQ+UbAAJisE30EQ0hDMIHKYeETaf9Q8tjEQ3RfK+T/m6KjVB/yJ//68VLyLg5Xttke
	 BXfwEcOEvkajxjvPiRgtc1LC6g/XQ3qRz96tbvsHux6bWLAyDKtLpEmsFgebnPQI7l
	 pDwljOV3Fxv02SJhcgksDT9wN+0gVUWCruZ+UgKtipvwVn+OT21F4IuzIaMltVz9cC
	 DKDdJPAenj/b6bn5Vw9FDVMtYS47lvByY39wru9X8q6fJDGC4hCaF5P+JAe3DEemi8
	 htpcWzFIpeseA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v9 0/2] arm64/sve: Performance improvements with SVE state
 saving
Date: Mon, 18 May 2026 17:11:45 +0100
Message-Id: <20260518-arm64-sve-trap-mitigation-v9-0-9cc8fcd002fd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEE6C2oC/43S22rDMAwG4Fcpvp6HJfm4q73H2IUTK63ZesAJY
 aPk3ecWujACZpe/QJ+Q0FWMXDKP4mV3FYXnPObzqYbwtBP9IZ72LHOqWaBCUl45GcvRajnOLKc
 SL/KYp7yPU+2SyI7RWuq9DqL2XwoP+etuv73XfMjjdC7f91Ez3Kr/UWeQIFNA5gQJvTGvH1xO/
 Pl8LntxY2dcqQDUorBS0CUeBvIIDjYU/VIAbYoqpZ0LfaiU9rSh9IPSChBblK6U0ayS85Eihw1
 lVkor06LMbUG0A6MBw8N2QbtSBkOLspXqUZHr2Mae04ZyK+VItShXKWdMfQ+q109uQ/kHZRVhk
 /JSSd8NALb3TFb9oZZl+QHmN3Dg0AIAAA==
X-Change-ID: 20230807-arm64-sve-trap-mitigation-2e7e2663c849
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, 
 Ryan Roberts <Ryan.Roberts@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4967; i=broonie@kernel.org;
 h=from:subject:message-id; bh=a6ehEwxcfvf1a/EiCCCXSWERXhRSVhiiTAiYG3cJw6U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqCztUOrdwfBgpR7sN6MMkFaFVvDvPRM0J7hcYp
 DUaj7bmYF2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCags7VAAKCRAk1otyXVSH
 0LSuB/9KiuzcI02vHn3x3bnLvPeoq3nmLF9VYF/OEXLgSheWL4P4xziYEOoIq1DESn8HhG3V9nx
 /0OSD4w1kw98EQVci2+CYoX4AbvU1YAYtcOlQrs6w09zE5x1LIHQfTHWyByf8B772jbk+u08xNw
 TJ0SytguYc6FclDNIw1oDRbfFtWvuBCeanHcIvMlmenaKdZMskt3A+xnTHLAGafLtQNdhOqU02+
 TZcV2qNM1T8d78+KASKSZAhE3wZfPOIoQVzXjCT/k5nPpz32h6ajzupa0Myfs9AevYLB6/pObLr
 swUUNMc8T80Ywo1A3mPayGhshaRFRbAt1jhENytkNRQoCvBr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

This series aims to improve our handling of SVE access traps and state
clearing.  As SVE deployment progresses both hardware and software
actively using SVE is becoming more common.  When a task is using SVE it
faces additional costs, the floating point state we must track is larger
and our syscall ABI requires that the extra state is cleared on every
syscall.  Users have measured these overheads and raised concerns about
them.

We can avoid these costs by reenabling SVE access traps and falling back
to FPSIMD only mode but if we do this too often for tasks that are
actively using SVE the cost of the access traps becomes prohibitive.
Currently we attempt to balance the tradeoffs here by starting tasks
with SVE disabled, enabling it on first use and then turning it off if
we need to load state from memory while the task is in a syscall.  This
means that CPU bound tasks that do not regularly do blocking syscalls
will rarely drop SVE while tasks that use a lot of SVE but do block in
syscalls (eg, due to network or user interaction) will be much more
likely to do and hence incur SVE access traps.

I did some instrumentation which counted the number of SVE access traps
and the number of times we loaded FPSIMD only register state for each task.
Testing with Debian Bookworm this showed that during boot the overwhelming
majority of tasks triggered another SVE access trap more than 50% of the
time after loading FPSIMD only state with a substantial number near 100%,
though some programs had a very small number of SVE accesses most likely
from the dynamic linker. There were few tasks in the range 5-45%, most
tasks either used SVE frequently or used it only a tiny proportion of
times. As expected older distributions which do not have the SVE
performance work available showed no SVE usage in general applications.

For tasks with minimal SVE usage benchmarking with fp-pidbench on a
system with 128 bit SVE shows an approximately 6% overhead on syscalls
from having used SVE in the task, the overhead should be greater on a
system with 256 bit SVE since the Z registers must be flushed as well as
the P and FFR registers.

The two patches here move to using a time based heuristic to decide when
to reenable the SVE access trap, doing so after a second.  This means
that tasks actively using SVE which block in syscalls should see reduced
or similar numbers of access traps, while CPU bound tasks that rarely
use SVE will see the SVE syscall overhead removed after running for
approximately a second, confirmed via fp-pidbench.

The benchmarking here is all very much microbenchmarks so there are
obviously some concerns on the system level impacts in actual use.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v9:
- Rebase onto v7.1-rc3.
- Link to v8: https://patch.msgid.link/20260320-arm64-sve-trap-mitigation-v8-0-8bf116c8e360@kernel.org

Changes in v8:
- Rebase onto v7.0-rc3.
- Add some benchmarking info from physical systems.
- Add second patch that helps processes that stay on the CPU drop
  TIF_SVE.
- Link to v7: https://lore.kernel.org/r/20240730-arm64-sve-trap-mitigation-v7-1-755e7e31bdd7@kernel.org

Changes in v7:
- Rebase onto v6.11-rc1.
- Only flush the predicate registers when loading FPSIMD state, Z will
  be flushed by loading the V registers.
- Link to v6: https://lore.kernel.org/r/20240529-arm64-sve-trap-mitigation-v6-1-c2037be6aced@kernel.org

Changes in v6:
- Rebase onto v6.10-rc1.
- Link to v5: https://lore.kernel.org/r/20240405-arm64-sve-trap-mitigation-v5-1-126fe2515ef1@kernel.org

Changes in v5:
- Rebase onto v6.9-rc1.
- Use a timeout rather than number of state loads to decide when to
  reenable traps.
- Link to v4: https://lore.kernel.org/r/20240122-arm64-sve-trap-mitigation-v4-1-54e0d78a3ae9@kernel.org

Changes in v4:
- Rebase onto v6.8-rc1.
- Link to v3: https://lore.kernel.org/r/20231113-arm64-sve-trap-mitigation-v3-1-4779c9382483@kernel.org

Changes in v3:
- Rebase onto v6.7-rc1.
- Link to v2: https://lore.kernel.org/r/20230913-arm64-sve-trap-mitigation-v2-1-1bdeff382171@kernel.org

Changes in v2:
- Rebase onto v6.6-rc1.
- Link to v1: https://lore.kernel.org/r/20230807-arm64-sve-trap-mitigation-v1-1-d92eed1d2855@kernel.org

---
Mark Brown (2):
      arm64/fpsimd: Suppress SVE access traps when loading FPSIMD state
      arm64/sve: Disable TIF_SVE on syscall once per second

 arch/arm64/include/asm/fpsimd.h    |  1 +
 arch/arm64/include/asm/processor.h |  1 +
 arch/arm64/kernel/entry-common.c   | 14 ++++++++++--
 arch/arm64/kernel/entry-fpsimd.S   | 15 +++++++++++++
 arch/arm64/kernel/fpsimd.c         | 46 +++++++++++++++++++++++++++++++++-----
 5 files changed, 70 insertions(+), 7 deletions(-)
---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20230807-arm64-sve-trap-mitigation-2e7e2663c849

Best regards,
--  
Mark Brown <broonie@kernel.org>


