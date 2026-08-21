Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F609C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nglHA7/3MMjKEoG2M+lIJ5S7PK5gm+FyJaV8ZvyaR0k=; b=Ed/r0o0upRpUHt
	fTxHuUd2Ps7/a7qsDn7n3e2yutU8h3LHAD4Yywgm3NRfBtmvd35LXSIi1E33EVAUn+ZELP5Te4hVy
	yKjBJpiXO1598T08Ojfnus1F+Is+nQqU6Gx/4ikRkHdPbbbNpOB03rw8a/ClgLUf/2lJG3z6JSlR9
	H7+yhgyf46p4J3uFsYCf9isKDGFI/3v6Sv58zqzkHgtiXjT+OHg2jeyL9nDbGHPNFW9hx97gkZZvz
	sAkXPo74/4BgwKChtNfMxgJDpyITThMPJ6EHzNzpMEVJXMD5wGCYbOl346tXuHneUcQBKG08ovcEJ
	s8OevTrlsT1HyxQqItpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsQ-0000000CwxR-1Zey;
	Fri, 21 Aug 2026 09:49:31 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsM-0000000CwwG-2RJ0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:49:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4815bce4652so504378f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305765; x=1787910565; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nglHA7/3MMjKEoG2M+lIJ5S7PK5gm+FyJaV8ZvyaR0k=;
        b=Qj+QSHeiow2JwORLN6XaxoWWf08PqgXJpv9rzEaxDX5iBdMi6akj4t8FdUVrNi532R
         Odo9SOvwENIvqVkjlCwEI77PXuW3XyRlGfmQgXMkG6LNVEy/jFtmTGnVtfbrYTFbn4Eu
         fJHf9n4SgwMPBf2BQi4YqKEGbJqOEXYyINPdIoS/S0KgRk8jmfhsbaHQmhvtd6uUpyMZ
         J4NnpYWSeOcT/Ry36fY6R5u/ClMPlysg9TXUGKY9GG2JyegBJK6AfPi7q0JqOUGj0xp4
         jbgdmaG/TbeNkl1XL8lV9J8WeLfvfpWwXsqSqHrZsKS40BgF3nM+OFkzi/yn9+wGwWQ0
         ULHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305765; x=1787910565;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nglHA7/3MMjKEoG2M+lIJ5S7PK5gm+FyJaV8ZvyaR0k=;
        b=Y+wPQKhrqvLV15CSdusTcp3Uxf59OV8zsnqWQOeM7n/nh+sCg0H8zCR+cZvjnM6wlE
         m2uW6KxBtGSxNC7Sox2vOPqnBnJ1KLV9uyywGrkVsxNgOf4MlftjxZ+W6pepnQ85f9NW
         Rd7o4R6VfC5n88hJxRV/EliS4E4pUmVv5RHHX2pgEdfs3XcAOUJvzcwHTeaLFcIt2t9X
         gcmVt/rH9XwCdKsiNs0GolEf8JlCVlocXV7CRJ382QyqZo5qBkSkZt65LfaefAUVd7zt
         wW21rZf06tDlLIR/yYAYU77yU45yXDfuEqfUmLdn/sag+TPHJVSqDxvXoMV4eqSswmE5
         yeJQ==
X-Forwarded-Encrypted: i=1; AHgh+RoH/0QFISBbtTEJzgUKe8nnCzN8PFB08muFxnPmhIlJgLMFduLFFA+WQh5seMpxJ2KRw8DFkabSei+33g/1ok1v@lists.infradead.org
X-Gm-Message-State: AFuF++nYQFyVz+D0xj8WwvYI6dnpaeLeWO1THTQPY9GylY0KW2vU/RYR
	uB0bVIMVD+T6DDvvV035YJ0MygqLEwDJCSWf0qcPkzWy06yLhAG6z1mFtoEhqUQnPCU=
X-Gm-Gg: AR+sD11my9eExBmrsb7y+bMiKQVazGl012nmQPiM0hbedADiSnIxDqJ5caIYmp4aKYj
	m/FGl+LJCq21HMgDJg+VuwG9mo9gclJy1Rve/6Jl38M42U+gj0WGS74vWLdyWnOEg/7HWcRMqk8
	W6QcmmHxTWXMcQ2XLe6GrRGHZ9abADvi4OWU0vKlo7FfICJt4xmLZwjPnRvYkZbmbfM1DkMTfkJ
	SKDFCmltseMzCmXlIQM7G5tnF7w+HBBbhltNrFYM19gSXVXwD9KvF2sL+PTd5n/kCS4Fp3uNUnw
	4NM3KyqpRGIKpML56Be4heOyEX5bdiXAQeZn3PJrfbXc2fTmbzlIXMosbr1JcV39VsgQegeSppk
	2oUJFe8Q7AMTk1y0QYLb+dzIVnLIN0tC68JfCSAHBVzOUFWW8fzMjfz8PzqUfHIDVyUmHkxdYL8
	cGOi8wuUOdPt9KQI/ImlZ/aP+q0EvpMIUv341SfSTJLRwri7UDXXQaWV7ycX9z9sCbwBzSsLcfD
	mE=
X-Received: by 2002:a5d:59a7:0:b0:47f:93e4:5389 with SMTP id ffacd0b85a97d-482c0bb3a9fmr7556210f8f.20.1787305764643;
        Fri, 21 Aug 2026 02:49:24 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:24 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 00/14] perf cs-etm: Per-thread mode fixes and snapshot
 wrap support
Date: Fri, 21 Aug 2026 10:48:58 +0100
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAofiGoC/42NQQ6CMBAAv0J6dk1bUkBP/MNwaGALa6Ql20o0h
 L9b8QMeZw4zm4jIhFFci00wrhQp+Az6VIh+sn5EoCGz0FJXspIG7nbGCH2Ep3eBZ5sSDrAgQ5o
 Y7QCOXmAk1rq0tnYSRS4tjFkfl1uXeaKYAr+P6aq+9tdvlPqrvyqQcJGmMqVqnHFN+yBvOZwDj
 6Lb9/0DwG6C0tcAAAA=
X-Change-ID: 20260605-james-cs-unformatted-per-thread-fix-50e723aa7f0e
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_024926_667915_775C7C32 
X-CRM114-Status: GOOD (  16.64  )
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

Fix a few issues with per-thread mode:
  - With TRBE, thread migrations hit a queue without a decoder assert
  - On nVHE, everything looks like guest trace instead of host
  - Tracing multiple threads didn't really work

After adding a tests for those, it turns out there were some snapshot
bugs not picked up by the other snapshot tests. That showed that the
different snapshot searches for Intel BTS and Arm SPE were inconsistent
and I think all tracers can benefit from using the same pointer fixup
logic, so that gets refactored into the common auxtrace.c. Then SPE can
just share the Intel BTS search as it was obviously copied from it
originally. IntelPT keeps the more advanced duplicate data search, but
in the future that could probably be made the common one and all tracers
would benefit from using it (except maybe BTS if it always has a very
small buffer, but I doubt the overhead of the duplicate search would be
an issue). For now this is more of a refactor rather than behavioral
change so don't do that yet.

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v2:
- Remove stale "may be reset to -1 in per-thread mode" comment
- Set CPU when queueing auxtrace fragments otherwise
  auxtrace_queues__add_event() overwrites the queue's CPU
- Link to v1: https://patch.msgid.link/20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org

---
James Clark (14):
      perf cs-etm: Fix nVHE per-thread decoding
      perf cs-etm: Warn for invalid timestamp option
      perf cs-etm: Turn on context packet timestamps in per-thread mode
      perf cs-etm: Use per-CPU queues for per-thread mode
      perf cs-etm: Increase default timestamp generation period
      perf auxtrace: Turn Intel BTS snapshot search into a generic one
      perf arm-spe: Use generic snapshot search
      perf auxtrace: intel-pt: Use new snapshot_has_wrapped callback
      perf cs-etm: Queue partial AUX records
      perf cs-etm: Don't print missing buffers in snapshot mode
      perf auxtrace: cs-etm: Capture wrapped snapshots
      perf test: Allow infinite named_thread loops
      perf test: Add test for per-thread mode
      perf cs-etm: Test multiple per-thread threads

 Documentation/userspace-api/perf_ring_buffer.rst   |   6 +-
 tools/perf/Documentation/perf-test.txt             |   2 +-
 tools/perf/arch/arm/util/cs-etm.c                  |  30 ++++-
 tools/perf/arch/arm64/util/arm-spe.c               | 147 +--------------------
 tools/perf/arch/x86/util/intel-bts.c               | 115 +---------------
 tools/perf/arch/x86/util/intel-pt.c                |  58 +++-----
 .../perf/tests/shell/coresight/per-thread-multi.sh |  78 +++++++++++
 tools/perf/tests/shell/coresight/per-thread.sh     |  48 +++++++
 .../perf/tests/shell/coresight/raw_dump_stress.sh  |   5 -
 tools/perf/tests/workloads/named_threads.c         |   7 +-
 tools/perf/util/auxtrace.c                         | 136 +++++++++++++++++--
 tools/perf/util/auxtrace.h                         |  20 ++-
 tools/perf/util/cs-etm.c                           | 101 ++++++++++----
 13 files changed, 384 insertions(+), 369 deletions(-)
---
base-commit: 9453bc6a69ef43755f1c28d5688cacdd69fa16bd
change-id: 20260605-james-cs-unformatted-per-thread-fix-50e723aa7f0e

Best regards,
--  
James Clark <james.clark@linaro.org>


