Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C393C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yesbJ70rYCYKNF3xmTkOjW0iKFtYX/mox68ufT+yucs=; b=pIsDS3f/0aKgC+svR7Aad/2x5M
	YdQEGwvNWztJqUx0ZJjuopiwg+QWEbEoraZV7pP/rGii4HMXuXsea4mFomlDsF9KqJ/QQAEeMchao
	MGfHx8omT7VNZggrv6GtDt+hWR07lstCw70erMwS8r2lz345EGYQ0EcidDv4vdY44NABh5YR816bL
	L7AjuE8yKbLEs2uCg1rBvUbUurIobxlAjMuGQCgBzHapHbPNg6q+YkhtCwulQmgkGKvqVB6Dv5Q4O
	/x4YiMOfo4SsgI7EqtkZl/TI21rBLyQDHUuqKqnuJ3u3pKwmm8SinRzUHIPKD47KCGYrC2jnx4lnJ
	0IDB9LGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUB1-00000009l8T-2dVM;
	Tue, 18 Feb 2025 20:26:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTlA-00000009flI-3wMS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 20:00:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2BC07A414A0;
	Tue, 18 Feb 2025 19:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC1EC4CEE2;
	Tue, 18 Feb 2025 19:59:59 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1tkTlW-00000004Aon-1RHX;
	Tue, 18 Feb 2025 15:00:22 -0500
Message-ID: <20250218195918.255228630@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 18 Feb 2025 14:59:18 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 bpf <bpf@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>,
 Zheng Yejian <zhengyejian1@huawei.com>,
 Martin  Kelly <martin.kelly@crowdstrike.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Subject: [PATCH v5 0/6] scripts/sorttable: ftrace: Remove place holders for weak functions in available_filter_functions
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_120001_133309_1EB1ED67 
X-CRM114-Status: GOOD (  23.62  )
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

This series removes the place holder __ftrace_invalid_address___ from
the available_filter_functions file.

The rewriting of the sorttable.c code to make it more manageable
has already been merged:

  https://git.kernel.org/torvalds/c/c0e75905caf368e19aab585d20151500e750de89

Now this is only for getting rid of the ftrace invalid function place holders.

The first patch adds arm64 sorting, which requires copying the Elf_Rela into
a separate array and sorting that.

There's a slight fix patch that adds using a compare function that checks the
direct values without swapping bytes as the current method will swap bytes,
but the copying into the array already did the necessary swapping.

The third patch makes it always copy the section into an array, sort that,
then copy it back. This allows updates to the values in one place.

The forth patch adds the option "-s <file>" to sorttable.c. Now this code
is called by:

  ${NM} -S vmlinux > .tmp_vmlinux.nm-sort
  ${objtree}/scripts/sorttable -s .tmp_vmlinux.nm-sort ${1}

Where the file created by "nm -S" is read, recording the address and the
associated sizes of each function. It then is sorted, and before sorting the
mcount_loc table, it is scanned to make sure all symbols in the mcount_loc are
within the boundaries of the functions defined by nm. If they are not, they
are zeroed out, as they are most likely weak functions (I don't know what else
they would be).

Since the KASLR address can be added to the values in this section, when the
section is read to populate the ftrace records, if the value is zero or equal
to kaslr_offset() it is skipped and not added.

Before:
    
 ~# grep __ftrace_invalid_address___ /sys/kernel/tracing/available_filter_functions | wc -l
 551

After:

 ~# grep __ftrace_invalid_address___ /sys/kernel/tracing/available_filter_functions | wc -l
 0

The last patches are fixes to ftrace accounting to handle the fact that it
will likely always have skipped values (at least for x86), and to modify the
code to verify that the amount of skipped and saved records do match the
calculated allocations necessary.

And finally, to change the reporting of how much was allocated to reflect the
freed pages that were allocated but not used due to the skipped entries.

Changes since v4: https://lore.kernel.org/all/20250217153401.022858448@goodmis.org/

- My tests found that the variable "remaining" was used uninitialized

Changes since v3: https://lore.kernel.org/all/20250213162047.306074881@goodmis.org/

- Do not remove 'W' weak functions that are still used.

Changes since v2: https://lore.kernel.org/linux-trace-kernel/20250102232609.529842248@goodmis.org/

- Rebased on mainline that has the rewriting of sorttable.c

- Added the code to handle the sections being stored in Elf_Rela sections as
  arm64 uses.

- No longer use the "ftrace_skip_sym" variable to skip over the zeroed out
  functions and instead just compare with kalsr_offset.

- Sort via an array and not directly in the file's section.

- Update the verification code to make sure the skipped value is correct.

- Update the output to correctly reflect what was allocated.


Changes since v1: https://lore.kernel.org/all/20250102185845.928488650@goodmis.org/

- Replaced the last patch with 3 patches.

  The first of the 3 patches removed the hack of reading System.map
  with properly reading the Elf symbol table to find start_mcount_loc
  and stop_mcount_loc.

  The second patch adds the call to "nm -S vmlinux" to get the sizes
  of each function.

  The previous last patch would just check the zeroed out values and compare
  them to kaslr_offset(). Instead, this time, the last patch adds a new
  ftrace_mcount_skip that is used to simply skip over the first entries
  that the sorttable.c moved to the beginning, as they were the weak functions
  that were found.


Steven Rostedt (6):
      arm64: scripts/sorttable: Implement sorting mcount_loc at boot for arm64
      scripts/sorttable: Have mcount rela sort use direct values
      scripts/sorttable: Always use an array for the mcount_loc sorting
      scripts/sorttable: Zero out weak functions in mcount_loc table
      ftrace: Update the mcount_loc check of skipped entries
      ftrace: Have ftrace pages output reflect freed pages

----
 arch/arm64/Kconfig      |   1 +
 kernel/trace/ftrace.c   |  44 +++++-
 scripts/link-vmlinux.sh |   4 +-
 scripts/sorttable.c     | 401 +++++++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 436 insertions(+), 14 deletions(-)

