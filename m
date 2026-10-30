Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC1E606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1Mj5gSDp;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cb8IPV1h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=amrurVyFz2qCQ2dJYaGk9kdX43uV5l+FEryyxcl8RBk=; b=1Mj5gSDpj+l7C8C/YbZPTDvT42
	pPdxmrtcwJMTHVnh6xLibiTserIwjpkGO1yhJIuuwm9jd5fdXfCGKOwy7rKrYXeE1fZS7ylI93JAw
	XbrgPHjR7oo3snpXawcjaU1A5p0aWEPgaPXlO/akUNnJPEs5Jqhugx7mgXlIQSqHxJoQwjLbQl1/L
	PuBlN3OFh0i2X+kTxjTrvErdtLVmg1u4oeIbY61qVGDW3zcikUBdlE0ejfhOgHkS1w7xxtSpu3EhJ
	Cb3vmeif+sBtxTW2C7FuyCGxq53PDW5KAa6G5APO0MQhU2dn2XuLQDugR2TCJemTiV5nTD6LAOQkM
	UsKYTfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoIL-0000000BxK5-1YvZ;
	Fri, 30 Oct 2026 15:13:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoII-0000000BxJE-1I7J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:13:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C285B1682;
	Fri, 30 Oct 2026 08:13:20 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6B273F59E;
	Fri, 30 Oct 2026 08:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793373203; bh=qeA/v2pMKzG/IbdRRS3JspucVQmdahAGmUNM4jKeLyo=;
	h=From:Subject:Date:To:Cc:From;
	b=cb8IPV1hgg9U3uyK91HR0vfS3u9SbLLTxRTeXO6YRV+Xr9yvlXNbSRlRMdM4QIY/Z
	 adkxP/5HqcOrQF3/nk87kHAcKbA0jmUqLbj9aJDOe7RrUkHYgtbsPu/7oM6hyP9716
	 Q3/x0cso9/Kn5yMXlcmTXHpCzHJ3/leIlc+mdgk0=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v3 00/14] perf cs-etm: Fix bogus branch samples on
 exceptions
Date: Fri, 30 Oct 2026 15:13:07 +0000
Message-Id: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAO05GoC/43NQQ6DIBAF0KsY1qUBFKhd9R5NQxCHShrBgCFtj
 HcvunHXdPkn/79ZUILoIKFrtaAI2SUXfAn1qUJm0P4J2PUlI0aYIJLWeIJolUkK5lFZ91Y+eDX
 rF3jMu6aXVta2oYDKfopQCrt9f5Q8uDSH+NlfZbpd/1EzxQQ3XNBStEa09qbjeDZhRJuZ2eG07
 KfDiiN0dzFEat5wfjjrun4B4iqZDAgBAAA=
X-Change-ID: 20260713-perf_cs_etm_fix_non_taken-5b4d7f73f41e
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Suyash Mahar <smahar@meta.com>, 
 Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793373201; l=5599;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=qeA/v2pMKzG/IbdRRS3JspucVQmdahAGmUNM4jKeLyo=;
 b=oJjOMo4x7HvO/AK9R91zwmP2939QV8ql9fGB8T+x6kAZ49lUuasj1fonVXH3gI0nInUZu9AY2
 27LfBgkJYQ8AfGxYMxP1twDAZk0hsMNAiWkfA5E4WdZJLEQck4BeaPB
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_081326_451124_6E41998E 
X-CRM114-Status: GOOD (  14.56  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CoreSight currently models exception entry by changing the preceding
instruction range into a taken branch. This can give an IRQ the source
PC of an instruction that already retired and overwrite a real branch
immediately before the exception.

For an untaken B.LS followed by an IRQ, perf script currently reports:

  hw int  4000f8 => ffff800080010c80  b.ls #0x400118
  ...
  iret    ffff800080012284 => 4000fc  eret

The hardware trace supplies 0x4000fc as the preferred return address.
For an IRQ, this is the architectural resume PC (Arm ARM, R_VBQMV).
B.LS has retired, and the saved PC identifies the boundary before the
following MOV. Using this PC as the IRQ source reflects the
architectural state at exception entry:

  hw int  4000fc => ffff800080010c80  movz x2, #0x1796
  ...
  iret    ffff800080012284 => 4000fc  eret

The IRQ sample represents the transfer from this architectural execution
position to the handler. The series synthesizes exception entries from
exception packets, preserving the preceding branch and its outcome.

The supporting changes:

- Let decoders supply sample.ret_addr so later instruction fetching cannot
  change thread-stack return addresses. Apply this to Intel PT
  asynchronous samples as well.
- Prepare packet ISA and instruction-size handling and share sample
  synthesis helpers. Mark untaken branches and break history when
  instruction memory is unavailable.
- Add a thread-stack regression test and four AArch64 CoreSight tests.
  IRQs and page faults must resume at the entry PC; SVC and emulated MRS
  must resume four bytes later.

Based on the AI search and test on my x86 machine, this matches perf's
Intel PT handling of IRQs. Intel PT records the next instruction's IP in
the FUP packet, and Perf uses that IP as the interrupt sample's source.

This series is verified on Orion6 board with "perf test coresight".

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v3:
- Introduced the pref_ret_addr/end_addr union (James).
- Clarified zero-size A32/A64 exception handling and why T32 retains
  per-address instruction decoding (James).
- Retreed missing exception pairs for up to three recordings,
  then fail instead of skipping (James).
- Shorten the IRQ workload (James).
- Fix FIFO argument quoting and remove redundant ShellCheck source
  directives (James).
- Checked instruction length before copying bytes into sample->insn
  (Sashiko).
- Retried MRS checks when instruction page faults may match the opcode
  filter (Sashiko).
- Rebased onto the updated perf tree and collect review tags.
- Link to v2: https://lore.kernel.org/r/20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com

Changes in v2:

- Rework the fix around exception packets to preserve both exception
  entries and preceding branches.
- Add explicit return addresses and the Intel PT asynchronous-branch fix.
- Split out packet/synthesis preparation, record not-taken branches and
  handle unreadable instruction memory.
- Add thread-stack regression coverage and four CoreSight tests.
- Link to v1: https://lore.kernel.org/r/20260713-perf_cs_etm_fix_non_taken-v1-0-4561607fc69f@arm.com

---
Leo Yan (14):
      perf sample: Allow decoders to supply branch return addresses
      perf intel-pt: Preserve return addresses for asynchronous branches
      perf cs-etm: Break branch history when instruction memory is unavailable
      perf cs-etm: Centralize packet ISA initialization
      perf cs-etm: Use the recorded instruction size for A32 and A64
      perf cs-etm: Mark branches that were not taken
      perf cs-etm: Factor out final instruction sample synthesis
      perf cs-etm: Centralize branch sample synthesis checks
      perf cs-etm: Classify exception calls using the exception packet
      perf cs-etm: Synthesize exception entries separately from branches
      perf tests: Check CoreSight IRQ entry and exit
      perf tests: Check CoreSight syscall entry and exit
      perf tests: Check CoreSight abort entry and exit
      perf tests: Check CoreSight emulated instruction entry and exit

 tools/perf/tests/Build                             |   1 +
 tools/perf/tests/builtin-test.c                    |   3 +
 .../perf/tests/shell/coresight/abort_entry_exit.sh |  32 +++
 tools/perf/tests/shell/coresight/irq_entry_exit.sh |  36 +++
 .../tests/shell/coresight/syscall_entry_exit.sh    |  32 +++
 .../perf/tests/shell/coresight/trap_entry_exit.sh  |  39 ++++
 tools/perf/tests/shell/lib/coresight_exception.sh  | 164 ++++++++++++++
 tools/perf/tests/tests.h                           |   3 +
 tools/perf/tests/thread-stack.c                    | 106 +++++++++
 tools/perf/tests/workloads/Build                   |   4 +
 tools/perf/tests/workloads/branch_not_taken_loop.c |  33 +++
 tools/perf/tests/workloads/page_fault_loop.c       |  37 ++++
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c    | 106 ++++++---
 tools/perf/util/cs-etm.c                           | 246 +++++++++++----------
 tools/perf/util/cs-etm.h                           |   6 +-
 tools/perf/util/intel-pt.c                         |   7 +
 tools/perf/util/sample.c                           |   1 +
 tools/perf/util/sample.h                           |   5 +
 tools/perf/util/thread-stack.c                     |   5 +-
 19 files changed, 714 insertions(+), 152 deletions(-)
---
base-commit: 4626d370ae89b8af4d46a45372b269f926ec662d
change-id: 20260713-perf_cs_etm_fix_non_taken-5b4d7f73f41e

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


