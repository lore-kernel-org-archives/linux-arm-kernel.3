Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14F3C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C7VjhmW7Ji1O81mMVXsP2dK74SX9e3LQ0nzhMOEopUs=; b=h/rn6+k55+3AQVpDLqTifWxFw3
	14quUxauyN5wSdZKQKyofsrPnkvrvxRsvQRRbJQiBprw7VeaTbNRm75rQjp+994S0YOQ3kFKKC8sd
	FxyJY/rVuxBnQ0dOYU7fH9FOlyoF8cH4wOYvCAutPL6w8vPkT+rEgu9N1AEJjEVfSdXXhaL6ao0bj
	OkfpV69kOYHvFUDnHQyNm142trEe4Qf7yK4o//gy/oC9n4hn3qbHIhsEeK8Zs9+Lhi+I0oVh+TubT
	vwilwSrzJtUlFsIC/k6HaKGWerT44TdkdpUMnp1C/uWaqsRP7eyqp0Ky+Cs4PpJq8xEGtiqYToHzU
	f2Z5DleA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3BO-000000054tL-1LLV;
	Mon, 17 Feb 2025 15:37:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk38k-000000053ok-28jo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:34:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B50FEA415EA;
	Mon, 17 Feb 2025 15:32:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B556C4CEE7;
	Mon, 17 Feb 2025 15:34:33 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1tk393-00000003aJN-0HcM;
	Mon, 17 Feb 2025 10:34:53 -0500
Message-ID: <20250217153401.022858448@goodmis.org>
User-Agent: quilt/0.68
Date: Mon, 17 Feb 2025 10:34:01 -0500
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
Subject: [PATCH v4 0/6] scripts/sorttable: ftrace: Remove place holders for weak functions in available_filter_functions
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_073434_690715_5A139735 
X-CRM114-Status: GOOD (  22.86  )
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
 kernel/trace/ftrace.c   |  45 +++++-
 scripts/link-vmlinux.sh |   4 +-
 scripts/sorttable.c     | 401 +++++++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 437 insertions(+), 14 deletions(-)

