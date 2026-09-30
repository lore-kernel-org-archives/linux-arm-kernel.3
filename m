Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65F3CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 02:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ejtBKpCiqTKtrmIWQ6wbWfU16DGFM5bweUdoZbMOV20=; b=sdjd6FgfUJnG4Zs60EjJcqPjmn
	scLt6J4UXgyOwuA1M/QPwyN+jrUGEaXzLI48XRAqxGYVo+hKsclEofuPKmQiWFhyQCbcwrDksNHx4
	43Q17RnjE/HQgr1x65aKMdl3pwWp7esd/GkswdyTE9QHBxDiSAWRZBxy/wQIMNQyDua5mBNpWKihT
	NnTw3svZpMDGc0OU+vnvCepamiqw6dcXoNJ5FJF4U6Gi5nDBm7GLbLH18DzOd/CQE8+dusA0ECuuU
	Dutbhk2PnRyTiPSugeo21SYGWFPUhUvcqeSwz1vbpU+l+2UgTElDg9bqraM9SSUh1tZ8MMOe2Zjqr
	dKqNhBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBkAi-00000004uqK-1U2w;
	Wed, 30 Sep 2026 02:35:52 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBkAe-00000004uph-24wx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 02:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=ejtBKpCiqTKtrmIWQ6wbWfU16DGFM5bweUdoZbMOV20=; b=H+KO8CvDdWZpFu5MnimSUAHn+M
	hUSvIMQGd5BGyw3AK75i0av0SrTj5R1V2KGMin+QlUWFBSjwViyMM+W1c03gY1igav/SZwpLQyXsj
	Om3Wzg0PhHcrfKUXM3qEFbkjBQxaN7G7UVJGUTaoGVxvG7WsxA6L14HQFDHHH29locFRXZCx6f0Na
	6jTZWvPGZLdgkkCUFkH+uRG2vREZH9c8BgePSIotTDjO/EvHxCZw1OO/wot5Y66z/eHWqRTjIrHwZ
	3PcrQibOeaAZr8nbQcqExnRW5UIVeb8MvFh0kBQZ0BpxKKcEBs3b7/TAlNFmNT7pV2Q7YO5anAzgH
	1pDf+uWw==;
Received: from [177.172.123.214] (helo=computador)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xBjei-009DEu-Mo; Wed, 30 Sep 2026 04:02:49 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Billy Laws <blaws05@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Ryan Houdek <sonicadvance1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [RFC PATCH v3 0/1] arch: arm64: Implement unaligned atomic emulation
Date: Tue, 29 Sep 2026 23:01:37 -0300
Message-ID: <20260930020138.2377090-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_193548_563261_2D6C8EC2 
X-CRM114-Status: GOOD (  21.19  )
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

This patch proposes adding kernel-side emulation for unaligned atomic
instructions on ARM64. This is intended for x86 emulators (like FEX)
that struggle to effectively handle such operations in userspace alone.
Such handling is required as x86 permits such unaligned accesses (albeit
sometimes with a performance penalty as in the case of split-locks[1])
but ARM64 does not and will raise a bus error. Due to the weaker memory
model, ARM64 requires a lot of sync instructions to keep the consistency.

The patch is a reduced version of the real effort, to make easier to review
the proposed approach here. Some optimizations and instructions were left
for future revisions of this patchset. The full picture takes advantage of
all the LRCPC1/2/3/4 instructions + FEAT_LSE, according to the support of a
given processor.

User applications that wish to enable support for this can use the new
pctrl() flag `PR_ARM64_UNALIGN_ATOMIC_EMULATE`.

 * Why should we add the ability to deal with x86 shenanigans in ARM64?

To increase ARM64 support for more use cases, such as gaming. The vast
majority of games are proprietary apps compiled to Windows/x86, and there's
a huge effort on emulating this stack so games can run properly on ARM64.
Apple did an extra step on this and even added hardware extensions just for
this use case. Why don't just use x86? ARM64 is a much better platform for
embedded use cases such as the Steam Frame, so this isn't really an option
here.

 * Precedent:

Both XNU and NT kernels support unaligned atomic emulation for their
respective x86 emulators. Given that "Apple Silicon" has the advantage of
having the full TSO model enabled, they need to translate much less memory
access to atomic/sync instructions. Windows additionally supports 'volatile
metadata', which is emitted by newer versions of MSVC to inform
emulators which specific load/store accesses require atomic handling
[3]. FEX supports this together with an extension mechanism [4] which
can be manually populated to avoid e.g. the aforementioned Assassin's
Creed slowdown.

Emulators like FEX attempt to emulate this in userspace, but with
caveats in two areas:

 * Performance

It should first be noted that due to x86's TSO (total store order) memory
model, ARM64 synchronization instructions (such as LL/SC and atomics) must
be used for all memory accesses. This results in unaligned
loads/stores being much more common than one would expect and the
overhead of emulating them significantly impacting performance.  For
this common case of unaligned loads/stores, code backpatching is used in
FEX to avoid repeated overhead from handling the same faulting access.
This replaces faulting unaligned sync ARM64 instructions with regular
load/stores and memory barriers.  This comes at a cost of introducing
significant performance problems if a function like memcpy ends up being
patched because it very infrequently happens to be used with unaligned
memory. This is severe enough to make games like Mirror's Edge and
Assassin's Creed: Origin unplayable without application-specific
configuration. LSE2 helps a lot here, but it's limited to a 16B
granularity, so it doesn't cover all cases.

Microbenchmarks[2] measure more than 4x decrease in overhead with
kernel-side handling compared to userspace, and this figure is currently
even larger when FEX is ran under Wine. Such a dramatic decrease would
make it reasonable for FEX to default to the no-backpatching path and
provide consistent performance.

 * Correctness:

x86 atomic accesses can cross 16-byte (LSE2) granules, but there is no
ARM64 instruction that would allow for direct atomic emulation of this.
As such, a lock must be taken for correctness. While this is easy to
emulate in userspace within a process, correct atomic cross-granule
operations on shared memory mapped into multiple processes would require
a lock shared between all FEX instances which cannot be implemented
safely in userspace as is (robust futexes do not work here as they are
under the control of the emulated x86 program). Note, this is a less
coarse restriction than split locks on x86, which are only concerned
with accesses crossing a 64 byte cacheline size.

This implementation is a RFC so we can learn more about how to make this
code upstream and what the maintainers think of such feature being
merged here. The code is a simplified version of the original work done
by Billy Laws, where we accept just a subset of 64bit atomic
instructions that are enough to be used with a benchmark tool[2], and
this is the proposed interface being used by FEX: [5].

If you want to read even further, FEX developers came up with a good post about
all the details of emulating the memory model: https://fex-emu.com/Scourge-of-emulation/

Thanks!
	André

[1] https://lwn.net/Articles/911219/
[2] https://gitlab.freedesktop.org/freedesktop/snippets/-/snippets/7875
[3] https://learn.microsoft.com/en-us/cpp/build/reference/volatile?view=msvc-170
[4] https://github.com/FEX-Emu/FEX/pull/4773
[5] https://github.com/FEX-Emu/FEX/pull/4985

---
Changelog:
 - Refactored asm code
 - Add Kcofig option
 - Used more common reg code
 v2: https://lore.kernel.org/lkml/20251117160841.334224-1-andrealmeid@igalia.com/

 - Added a check for LSE Atomic instruction for the prctl()
 v1: https://lore.kernel.org/lkml/20251106160735.2638485-1-andrealmeid@igalia.com/

André Almeida (1):
  arch: arm64: Implement unaligned atomic emulation

 arch/arm64/Kconfig                   |   6 +
 arch/arm64/include/asm/exception.h   |   1 +
 arch/arm64/include/asm/processor.h   |   5 +
 arch/arm64/include/asm/rwonce.h      |  14 +-
 arch/arm64/include/asm/thread_info.h |   1 +
 arch/arm64/kernel/Makefile           |   3 +-
 arch/arm64/kernel/process.c          |  15 +
 arch/arm64/kernel/unaligned_atomic.c | 521 +++++++++++++++++++++++++++
 arch/arm64/mm/fault.c                |  10 +
 include/uapi/linux/prctl.h           |   5 +
 kernel/sys.c                         |   7 +-
 11 files changed, 579 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm64/kernel/unaligned_atomic.c

-- 
2.55.0


