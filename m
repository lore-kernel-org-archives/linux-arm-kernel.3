Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9269DC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4WyD6gto8k9p+oppNtMWnPKnI8RbUei9hALn7mkrXLk=; b=BbUq8EYxY+Tfhp
	w+4wyZYF28w5nsww6ewjUZI2t+mBaOZU3LAu/2UOBH/9Vj8t5425bJ0bgsRnqTszM2+fcx1WKjGN7
	gdfnWZuqWJ0ky145Um9CuFO4WQNhiuOeE6/4Q6GtH17vLPF91IuM3X/V9LmdqiLRpiORSopIj9Uya
	URSKrrgX1Bv4/XkOvc72+osXIDmMYJk2JOvB7Q8Tad+ucr4NpOGSnbZDM/MgUQdyrSN9HqiUC9hkE
	/L5cXGGlZ/2Gds6cCAI0M28P/zzAPoWRc+72f78EKprh2Kbr3sWs8f3sAJvRMSGWWaXYlKJkRXc8r
	hqQZEaM2zXl6nHSlUVNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SUl-0000000Cqzb-0mw4;
	Tue, 01 Sep 2026 17:42:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SUj-0000000Cqz7-2Q2h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:42:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 023D4424B3;
	Tue,  1 Sep 2026 17:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700451F000E9;
	Tue,  1 Sep 2026 17:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788284520;
	bh=4WyD6gto8k9p+oppNtMWnPKnI8RbUei9hALn7mkrXLk=;
	h=From:Subject:Date:To:Cc;
	b=JDRZ4zPgcKStNr8mty6yOM4DANVcITW+maww/v2Z5d0YFXBOSc5SMiTqsbdmd7+S7
	 qsiGyAFIH0RFa9wXk5qZELry/U0HvEar6fBVD1oKCQUHakGGHl14mUpdJGTzD0tHFD
	 jfz96LZAWM1uzT7+xjD2mNv249B25p4JJLuDQoru7wyj+HEdJ/u//vJwYvGB4fECzm
	 6aJD7iIAg+4M/BG3THWuCINoy3ddhSDugjBeM/wiIUUev1u+ym+gDBSGAx6k8GxnrF
	 pvKhhVTyCCFRavN/kUiUdU/gTk+LTC/hQw25lNpKGTEske4/dk3hl1hTx//XbUzUqc
	 i1evNDNyHxRxQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v11 0/2] arm64/sve: Performance improvements with SVE state
 saving
Date: Tue, 01 Sep 2026 18:38:40 +0100
Message-Id: <20260901-arm64-sve-trap-mitigation-v11-0-be8095543a46@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKANl2oC/43SS2oDMQwG4KuEWddFkt9d9R6lixlbTkybB54wt
 ITcvU4gHYrBdCmBPvELXYaZS+Z5eNlchsJLnvPxUAvEp80QduNhyyLH2hgISIIDK8ayN0rMC4t
 zGU9in895O57rmCC2TMbI4JQf6vypcMpfd/ztvda7PJ+P5fu+a8Fb9z/qggJF9MQcMZLT+vWDy
 4E/n49lO9zYhVbKo+xRVCmcIqckHaHFhpK/FGKfkpVS1vrgK6WcbCj1oBQgUY9SldKKIVo3ypF
 9Q+mVUqB7lL4FJJOYNGpObUCzUpp8jzKVCgTSTmzGwLGh7EpZCT3KVspqXd9D1utH21DuQRmQ1
 KWcAOGmhGiCY2mgofxKaXQ9ylfKh+BSiACU2oAIq2Wh+w0IFZM0KWdwMiqFP9j1ev0BNcMFj2k
 DAAA=
X-Change-ID: 20230807-arm64-sve-trap-mitigation-2e7e2663c849
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, 
 Ryan Roberts <Ryan.Roberts@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5221; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KuvaB8efZlA+wafGdaPm/hF443HcsjdHzcHPaDPxCfc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlw5jIwkBAJIWtc8EqlawFQja05XnyzoqoG6Ym
 knqRJuEatuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcOYwAKCRAk1otyXVSH
 0IAQB/0eDDquLr3ROzoP+Rd+qQglgEMRfY2qywD+dI1X4D+is7oQm6Zn4TDCQfcObT8RtfWre/5
 FUClns+M0cGvWez42XVZ7n0i9v1BRR49j0aEOS6h3H53jNdzfeKZGxWzLy+rtR3/olfGNfafWin
 l7+9GEQyjxZuuREn/dPKqCgTSrXgqDoqc+X2rvaJhuFkykskiR4bmOshyjKdgHElrHmw7mfIWBQ
 YgfTeFQfJvq/t0hqU5+fkUbfCL6hm/6LnkTStFmDLylWiCmmecHgSGDzdAoXs4WlsHhvpwbQ4SI
 usXG7G7QsI4oxIo8vVEKWGikZetZ7hnIXP+Di119z5fsTgQg
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
Changes in v11:
- Rebase onto v7.3-rc1.
- Link to v10: https://patch.msgid.link/20260703-arm64-sve-trap-mitigation-v10-0-32b4861b64fc@kernel.org

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
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20230807-arm64-sve-trap-mitigation-2e7e2663c849

Best regards,
--  
Mark Brown <broonie@kernel.org>


