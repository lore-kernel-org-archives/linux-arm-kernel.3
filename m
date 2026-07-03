Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C47EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hU2s5sTARzwxz07Ot/JHw31yTaJn50NPn5yHr3XxEGI=; b=oVV2YK55zAKxY4
	mVxial0Hirp9LOPG+pTfnvHvF32qIeh5Iohub4rGJgturSrrdHEqQvhGDjxdBudqvrH7M/dM+PJ1Q
	+LBH8uYiSS2TwEnIpju9YJ1YLvuhGgVXQKcvDSDHC2VfMRg4KgSKBBnyYcxWqzIGz72BoUTrp6Nef
	Ssm0sHBQnCh7W1LvhHNuwMvVdSvTomXirCjfiElAnSRankhYKTINQLOEXGYBZW8CeB+mb4TnIk8pS
	fK+YiUbqvZOoit9w6EvfKNpTOT+P485aLJ9EXzh8nrgqJ3XSTjFMrKafmmBMARRv2XhJUQMYvMMQA
	aXTPeqVLbNz7eBfRyVdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdHp-000000070GJ-3I3H;
	Fri, 03 Jul 2026 12:46:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdHp-000000070G7-0lEP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:46:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F83C60051;
	Fri,  3 Jul 2026 12:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9481F00A3A;
	Fri,  3 Jul 2026 12:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783082788;
	bh=hU2s5sTARzwxz07Ot/JHw31yTaJn50NPn5yHr3XxEGI=;
	h=From:Subject:Date:To:Cc;
	b=YMloIzSbY75uWv3bR+hIQwzC9E6MAbdcXqL6o4ohC1ULdkwXAxDrArr/jGaryFdCt
	 vKwXwPHJY8vBA4nSTIdpHZFx6hXcrgkgcDAk3k2qpdO68tJR5tmJXVGhSSaAqoBfjs
	 s6gwwB8VbqQWm9ETqoQDqstPohyl5op9lvqKSNCOrQaEKn69rZRecK8g7X6qENgBos
	 +cFXuQAVFajY7pL74GOjSc0PBa97Pl9jcsCPgqZzIe0QorGc2VOR2RON63P3/O+B3g
	 8APVkkw9yPbhsE6kJRn2s1I2+J5gF/d6WHKHPmPa3r5HkL9uTifPEPWi4gmOOWh9TB
	 9Mt99ZnAaLu1A==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v10 0/2] arm64/sve: Performance improvements with SVE state
 saving
Date: Fri, 03 Jul 2026 13:34:03 +0100
Message-Id: <20260703-arm64-sve-trap-mitigation-v10-0-32b4861b64fc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADusR2oC/43SS2oDMQwG4KsEr+tiye+ueo/ShWPLiWnzwDMML
 SF3rxNIh2IwXUqgT/xCFzZRLTSxl82FVVrKVE7HVoB42rC4D8cd8ZJag6FAKZywPNSDUXxaiM8
 1nPmhzGUX5jbGkSyhMTI65VmbP1fK5euOv723el+m+VS/77sWuHX/oy7AgSePRAkSOq1fP6ge6
 fP5VHfsxi64Uh7kiMJGwTZRztIhWOgo+UsBjCnZKGWtj75RysmOUg9KCUAcUapRWpFI1gUZyHe
 UXikl9IjSt4BoMqEGTbkPaFZKox9RplERhbRbMiFS6ii7UlaKEWUbZbVu7yHb9ZPtKPegjJA4p
 BwX3G0zgImOpBEd5VdKgxtRvlE+RpdjEgLz34DX6/UH3/NmXBwDAAA=
X-Change-ID: 20230807-arm64-sve-trap-mitigation-2e7e2663c849
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, 
 Ryan Roberts <Ryan.Roberts@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5071; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HuXt7jsh/CZygZ3C+OMITQQyBEWJ8LCt0eh/pyt5o2Y=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqR68gcpt6c8tQCP+/LJyje0rbnjln6mTWv1cB6
 13wozN4TgCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakevIAAKCRAk1otyXVSH
 0AUcB/4vGiA+IkPM5x/SLEvev54vRQPdy3if7nYLd338M09R5a9ygxnNlsEcUPufqsh0vbNbKlG
 UV2MJ2Y4N7mBLzqF9Bxslt7GLk5DsnsrbIz5RuqgbdlfglkgC45Pel5tHXDAGg8e0mUNOSW1B9P
 eN4E//Ht1aXOh0Cb6In8G3nPCYqmVwWdC2s1x21no4WX4ejKzXCZ2nhsPDD5dlF3qmeFO+e/VE0
 cbdKa04U3izi5HkJPNIrWr15jh9vE8o0m4kNto/19FogEHAEdkVST/spzo6NHknanfw5NKJ7RFc
 Ayy2hiq1BHUJdPcmLaI178lsJ0kLu701mDrm9/ozdNYz5w6E
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
Changes in v10:
- Rebase onto v7.2-rc1.
- Link to v9: https://patch.msgid.link/20260518-arm64-sve-trap-mitigation-v9-0-9cc8fcd002fd@kernel.org

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

 arch/arm64/include/asm/fpsimd.h    | 15 ++++++++----
 arch/arm64/include/asm/processor.h |  1 +
 arch/arm64/kernel/entry-common.c   | 15 ++++++++++--
 arch/arm64/kernel/fpsimd.c         | 47 ++++++++++++++++++++++++++++++++------
 4 files changed, 64 insertions(+), 14 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20230807-arm64-sve-trap-mitigation-2e7e2663c849

Best regards,
--  
Mark Brown <broonie@kernel.org>


