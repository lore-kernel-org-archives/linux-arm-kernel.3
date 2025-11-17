Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5E2CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 16:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=04nkUmBTgyIlhi8kTBcDCYFcY4NIfVtCc0B9MV8VWWQ=; b=ILcV+0MWGcCqtRH4TQIXvymKlf
	+21rN3E4yB4M5ZCwfDLjIlE4l6hCXHJFzfi8eFKmYPLIdlSGOn6oBZV5VOvkYKcx/d/J7iSFSUJJA
	AmB9/fSoihPFLAzz4VsLiw1PR3sbxH69YFSbXo2d3KmzrkQ584pPlRQmLAwusVqYDmBWWxerkH7Jy
	oxwwOPpCDwBQkrYnd/jtRUzqvVoLzdVVcYOB+D04Pt/m2dFPkHFbmvO6lk9A1DKk1d76fd5z9gXYr
	tqDlV6xoTK0qkwH+AO8Hnqnnb1Gebx3ft0It01w+S3SkVp/nRHd3dsTNHkvH5o43cknNfL1JeHQ0b
	Ap8ZGjsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1mq-0000000GNLZ-0rLg;
	Mon, 17 Nov 2025 16:09:04 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1ml-0000000GNKa-3RE0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 16:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=04nkUmBTgyIlhi8kTBcDCYFcY4NIfVtCc0B9MV8VWWQ=; b=KCTfzP4FTJdFfn96PtfV6QHJDT
	bpU8DdKzyLnnR7BWwpijzGEMm46GE7RmTeSRB0amFaS7Br1op3y5F3V4hPG+1v3LU9hIC+eUMhEL/
	7T5bdYnmXSYpKqABU7gbzKoLE6X5/H7qhciSedCOYEM1jXjLoUzwe/tbyzyH+sesz55OIUM/iS070
	VvWP+kmYQkKplXx4j01acUSlvRt4YQmdzPRgnY4mA3SEpncnhjer3/ffCD6fquSl0hOcgmUStr61/
	DWi9DA8fxV0IwluUZvhks+bYOteH0t80jDfPleabbziZn2kvD+KrlKqq5HTLbGV8O7eYNeKIZ+kde
	P8O1q1LQ==;
Received: from [187.101.0.152] (helo=steammachine)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vL1ma-001drl-Vm; Mon, 17 Nov 2025 17:08:48 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	Ryan Houdek <Sonicadvance1@gmail.com>,
	Billy Laws <blaws05@gmail.com>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [RFC PATCH v2 0/1] arch: arm64: Implement unaligned atomic emulation
Date: Mon, 17 Nov 2025 13:08:40 -0300
Message-ID: <20251117160841.334224-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_080900_972933_E16F43FE 
X-CRM114-Status: GOOD (  18.55  )
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
but ARM64 does not and will raise a bus error.

User applications that wish to enable support for this can use the new
pctrl() flag `PR_ARM64_UNALIGN_ATOMIC_EMULATE`. Some optimizations and
instructions were left for future revisions of this patchset.

Emulators like FEX attempt to emulate this in userspace, but with
caveats in two areas:

 * Performance

It should first be noted that due to x86's TSO (total store order)
memory model, ARM64 atomic instructions must be used for all memory
accesses. This results in unaligned loads/stores being much more common
than one would expect and the overhead of emulating them significantly
impacting performance.  For this common case of unaligned loads/stores,
code backpatching is used in FEX to avoid repeated overhead from
handling the same faulting access. This replaces faulting unaligned
atomic ARM64 instructions with regular load/stores and memory barriers.
This comes at a cost of introducing significant performance problems if
a function like memcpy ends up being patched because it very
infrequently happens to be used with unaligned memory. This is severe
enough to make games like Mirror's Edge and Assassin's Creed: Origin
unplayable without application-specific configuration.

Microbenchmarks[2] measure a 4x decrease in overhead with kernel-side
handling compared to userspace, and this figure is currently even larger
when FEX is ran under Wine. Such a dramatic decrease would make it
reasonable for FEX to default to the no-backpatching path and provide
consistent performance. 

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

 * Precedent:

Both XNU and NT kernels support unaligned atomic emulation for their
respective x86 emulators. Windows additionally supports 'volatile
metadata', which is emitted by newer versions of MSVC to inform
emulators which specific load/store accesses require atomic handling
[3]. FEX supports this together with an extension mechanism [4] which
can be manually populated to avoid e.g. the aforementioned Assassin's
Creed slowdown.

This implementation is a RFC so we can learn more about how to make this
code upstream and what the maintainers think of such feature being
merged here. The code is a simplified version of the original work done
by Billy Laws, where we accept just a subset of 64bit atomic
instructions that are enough to be used with a benchmark tool[2], and
this is the proposed interface being used by FEX: [5].

Thanks!
	André

[1] https://lwn.net/Articles/911219/
[2] https://gitlab.freedesktop.org/freedesktop/snippets/-/snippets/7875
[3] https://learn.microsoft.com/en-us/cpp/build/reference/volatile?view=msvc-170
[4] https://github.com/FEX-Emu/FEX/pull/4773
[5] https://github.com/FEX-Emu/FEX/pull/4985

---
Changelog:
 - Added a check for LSE Atomic instruction for the prctl()
 v1: https://lore.kernel.org/lkml/20251106160735.2638485-1-andrealmeid@igalia.com/

André Almeida (1):
  arch: arm64: Implement unaligned atomic emulation

 arch/arm64/include/asm/exception.h   |   1 +
 arch/arm64/include/asm/processor.h   |   3 +
 arch/arm64/include/asm/thread_info.h |   1 +
 arch/arm64/kernel/Makefile           |   2 +-
 arch/arm64/kernel/process.c          |  15 +
 arch/arm64/kernel/unaligned_atomic.c | 520 +++++++++++++++++++++++++++
 arch/arm64/mm/fault.c                |  10 +
 include/uapi/linux/prctl.h           |   5 +
 kernel/sys.c                         |   7 +-
 9 files changed, 562 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/kernel/unaligned_atomic.c

-- 
2.51.2


