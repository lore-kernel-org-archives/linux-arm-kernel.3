Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB95C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4LeDiWpmItdCucrYhEz4Y1pqZjokzwxp6RaryeR6gEU=; b=AKKcFJRp2moP5h
	7PwL6EV/Zig9o7Qyz2hEFLuAm6BTRrutTSxBVXmF03bMAp7cFq8+J7BXKCCsy1EygWIy1jV0uSdMO
	AiX3DxyjFqp+Q5Du6pnjkJmgQeyL3F5pVYoQelXd5MrQFpnP3+aWlWveLT2/HjZKKewnDNXe3rddK
	RlHOE/HRzUT+53y10XG9LnYAH+5ZFcnXEZlg68NBDq1i0M0+GLEorimqC0Qy+e7kXYgFf8uvL8rsC
	Vw3+VBi4HaRKaIdbQ9FDGxwo7x7JRpYcdbhcOUNYzNxYetoel/EZNtu23QPv5Bsow4ZsbPOH1Eht0
	Pm/HOdXmgYv9Ye7ajP0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBRT-00000000eQH-3VSW;
	Mon, 28 Sep 2026 13:30:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBRQ-00000000ePb-1QzX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:30:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B4E41655;
	Mon, 28 Sep 2026 06:30:41 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.11.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 483E63F763;
	Mon, 28 Sep 2026 06:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790602244; bh=g0Lf6JKCzpKjGOipIHc53lgSHnbLrCMIM0jyCiqKmXU=;
	h=From:To:Cc:Subject:Date:From;
	b=fVhhSntAnv+kBQDLrSz1rQ8j9vGdUBul1z9dCburmig6HXuykk2FT19LW81XgAEHQ
	 kPqbjTnvTbtOdf8N8tHAGn/HraZanlCeFhzYL8nOkri0RvF0rLXTMQ5f/aG3AZapcg
	 2TFHAJ7/DesrLgY3QJUaJlB3l+5WKL//3WVIkMMQ=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/6] arm64: alternatives: switch most used alternatives to callbacks
Date: Mon, 28 Sep 2026 14:30:28 +0100
Message-ID: <20260928133034.243541-1-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_063048_466395_CD071E1E 
X-CRM114-Status: GOOD (  29.28  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Barry Song <baohua@kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Shanker Donthineni <sdonthineni@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, Oliver Upton <oupton@kernel.org>, James Morse <james.morse@arm.com>, Andre Przywara <andre.przywara@arm.com>, Tejun Heo <tj@kernel.org>, Lucas Wei <lucaswei@google.com>, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello,

This series looks at some size reductions for the kernel by replacing
the most used instruction-based alternatives with callbacks, implementing
ideas of my previous RFC on the insn framework[0] and taking into account
Marc's comments.
The goal here is to create specialized callbacks rather than overhauling
the whole insn framework, which lead to using bitwise operations to modify
the original instructions in most cases.

Using the alternatives dump produced by Mark's patch[0] on v7.3-rc4 defconfig,
the most common instruction-based alternatives are :
	1. 10k entries, `ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE`,
	2. 10k entries, `ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027`,
	3. 3k entries, `ARM64_HAS_VIRT_HOST_EXTN`,
representing a potential maximum 92kB space saved on alternative instructions.

Sadly this is not realized in practice, but I wanted to share the results
below and see what the mailing list thinks.

All in all, it feels like a fair bit of changes for 1% gains on the Image size
and an increase in size for vmlinux.
The gains on the I/O workarounds are more clear cut and could be taken
by themselves, but remain quite slim.

I would be curious if other configurations benefit more, and the impact
when tested on high core-count machines.

=== Structure

- Patches 1 and 2 are preparatory commits for patch 3 to make
  the insn functions used safe to be called when patching alternatives ;
- Patch 5 is an optional clean-up of hard-coded values, to be re-used
  in patch 6 ;
- Patches 3, 4 and 6 are the actual alternatives changes
  - Patch 3 : replaces the NVIDIA workaround to device I/O reads
  - Patch 4 : replaces the Cortex-A57 workaround to device I/O reads
  - Patch 6 : replaces the TPIDR_EL1 to TPIDR_EL2 switch for per-cpu

=== Results

All numbers are on v7.3-rc4 building defconfig with GCC 13.3.0.
Only the patches mentioned are applied on each line.

|   Patches    |  Size (B) |	|    Patch    | Size (B) |
| Base vmlinux | 172826400 |	|  Base Image | 52374016 |
|          1-3 |    -71672 |	|         1-3 |   -65536 |
|            4 |    -71704 |    |           4 |   -65536 |
|          1-4 |    -64712 |	|         1-4 |   -65536 |
|          5-6 |    +68008 |	|         5-6 |       -0 |
|  All patches |    + 3240 |    | All patches |   -65536 |

The impact on alternatives is two-fold :
1. As expected, all alternatives for the two I/O workarounds and
   97% of the `ARM64_HAS_VIRT_HOST_EXTN` alternatives are converted to
   callbacks, saving 85848 bytes (20 pages).
2. The raw number of alternatives *increases* by about 3% (250 new entries)

Almost all alternatives that are patched later, e.g. drivers loading,
are now using callbacks as well.

From my limited testing on a Morello board, boot time seems unaffected.

=== Analysis

I was a bit perplexed by the results, not expecting either the new entries
nor the increase in size due to the TPIDR patch.

Using `readelf`, it appears that most of the increase in size comes from
debug sections massively increasing with the TPIDR patch,
specifically `.debug_line` and `.debug_info`.
Most of the new alternative entries also come from the TPIDR patch,
which is probably due to the compiler making different optimization decisions.

Interestingly, as most of the size increase is in the debug sections,
`CONFIG_DEBUG_INFO_COMPRESSED_` options have a stronger impact. Despite the
increase in size with all patches, compressed debug info shrinks vmlinux
by 57856 bytes compared to v7.3-rc4 with the same debug info compression.

I experimented with adding `volatile` to the asm block in
`__kern_my_cpu_offset()` to see how that would impact both the size and
the amount of alternatives.
Without the patches, it does add 200 new alternatie entries but shrinks
`vmlinux` by 100 kB. The patches add 260 more alternatives and shrinks
`vmlinux` by another 2 kB.
So it looks like compiler optimization would be a large cause of the change.
I have not tested the effects on performance of this change, but given
the comment it would probably be detrimentary so I elected not to include it.

Previous to this series, I also looked into creating a callback to handle
reading and writing to system registers with exception level variants,
mostly used in KVM, but with no benefit. I will share the findings below
in case they can be useful to anyone.



I am curious about what people think, thank you in advance !
Kind regards,
Ada

Based on v7.3-rc4.

[0]: https://lore.kernel.org/r/20250923174903.76283-1-ada.coupriediaz@arm.com 
[1]: https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=ee8dd3d5de66e92a98896d6f316a71ec815cd51e

Ada Couprie Diaz (6):
  arm64: insn: remove deprecated memory barrier types
  arm64: insn: make `aarch64_insn_gen_d{m,s}b()` alternative-safe
  arm64: io: replace NVIDIA Olympus erratum alternative with callback
  arm64: io: replace ARM erratum 832075 alternative with callback
  arm64: insn: operate on MSR/MRS sysreg field via defines
  arm64: use alternatie callback to patch TPIDR_EL1 accesses

 arch/arm64/include/asm/alternative.h |  3 ++
 arch/arm64/include/asm/assembler.h   | 12 ++---
 arch/arm64/include/asm/insn.h        | 65 +++++++++++++++++++++++----
 arch/arm64/include/asm/io.h          | 51 ++++++++++++---------
 arch/arm64/include/asm/percpu.h      | 12 ++---
 arch/arm64/kernel/alternative.c      | 25 +++++++++++
 arch/arm64/kernel/image-vars.h       |  3 ++
 arch/arm64/kernel/io.c               | 49 +++++++++++++++++++++
 arch/arm64/lib/insn.c                | 66 ++--------------------------
 9 files changed, 182 insertions(+), 104 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.43.0


=== Abandoned : system registers with _ELx variants

KVM uses alternative instructions to access the correct registers
for the desired exception level when in non-VHE mode.
This is used in a good number of places in KVM, so I wondered if
a callback could save some space.

Going through the system register encodings, the following pattern
emerges for registers with multiple variants depending on EL :
- CRn, CRm and op2 are identical
- op1 encodes the exception level of the register access :
  - EL0  : 0b011
  - EL1  : 0b000
  - EL2  : 0b100
  - EL3  : 0b110
  - EL02 : 0b101
  - EL12 : 0b101

So it looked like it would be possible to bit-mask the op1 field per-EL.

However, among the registers with ELx variants there were exceptions :
- TPDIR_EL1 and TPDIR_EL2, which are used for per-cpu functions,
  do not share the same op2 field
- BRBCR_EL1's op1 does not match above pattern
- MAIR2_EL{1,12} and MAIR2_EL{2,3} pairs have different CRm fields
- SP_EL{0,1}'s op1 do not match the above pattern

And, in general :
- Arm ARM DDI 0487 C5.1.1[2] mentions that op1 has different values for EL1
- Indeed, many registers outside of those with multiple ELx variants do not fit
  the above pattern
- There is no hard guarantee that the above logic will be maintained long term


Considering the above, I reimplemented `{read,write}_sysreg_elx` with a
compile time check switching between the current alternative and
the bitmasking callback for the instructions that do match the pattern.

This did convert about 200 alternative entries to callbacks, but because of
the increase in size of debug sections and symbol tables, this only made
`vmlinux` bigger by about 3 kB with no change for the Image.

Given the negative impact on size, limited applicability and benefits,
I did not move further with this.
However, it might be useful to simplify some of the awk script generating
sysreg defines.

[2]: https://support.arm.com/documentation/ddi0487/mc (version M.c)

