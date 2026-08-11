Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD90C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qG1LYmIXQwJhNszNA6JSaXd2z4OF9GJH1weAVjbiHlk=; b=vtyEFhFM5x2QpM
	9OsPgJw3hADFfhKx5GjXbaj6w63kTsfQJa3lW4rpxcqJrmUyUck6Hrs/T18MUDs1E7QzwL8rB3v16
	QB025yGgsljQTCtZirEBd5Q7jTo0GTbR1wOK6GvicZnVNBkw9URhRyx4iOoHfEXfCDd5r5IvPPx4y
	+3/TUEBafFGZzmy0mEKCJ4E7FHcWiwJ2xRGFdkxqV81uLPwbsQ29aaYh1GxQkx7kT7Gx6FRbS+MJ5
	i2DPlzAglZMQ74RFWx/wMCsWEU4qRr9EcY2NIZVBXT+2J+/CDYKj/ajNmE7ENZ0Z41fllSBJ/AQtt
	mt1lAlS8M8LTRu5ZJh3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRG-0000000EK8e-42Ix;
	Tue, 11 Aug 2026 15:30:50 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoRD-0000000EK79-2ICK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:30:49 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4954dff6536so25333135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 08:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462246; x=1787067046; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qG1LYmIXQwJhNszNA6JSaXd2z4OF9GJH1weAVjbiHlk=;
        b=dicrlpzZo6eL3mspCLIYr+Jbo6SIdkfa4OPB0+iubwoqsuE8+6f8+GKCo12jqaO0gz
         NCPG4w9K+xmeqruXFI9nHusuhAmx29BW5h2cpCvelN5Pdd/+WudfpR95FldO2EDV1L+P
         0u25wSPaG5ofSilO95TcAD67+nSRQPP/eDg87Jt66bDGcb4K/e7YkiuFrTxnM/zQJU3L
         MnIStk4UPJSmvWYVFhOGjyo/aMwruhJ7UREq8VyEMNAzz1jfJJXLtftUEozAFlRswKFv
         jOLPuPYrMkNXYEma6lfeGgAztkqkigo9IX7nInsouBw3/PIrvPEqKh8KIToHqk+kwkfE
         e9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462246; x=1787067046;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qG1LYmIXQwJhNszNA6JSaXd2z4OF9GJH1weAVjbiHlk=;
        b=NxZBHbnB8Mj5eZnhjKIoSK8MtHNcgobXthmPTMkkWTpAYiMG+FiC0MesMfHgrlBo4y
         OD2yODugY0rJXz20+ZEuYDOMAEgUV7tNdFXrrZTrBXnKdxA+zVCKtI3qSQzU73DHHSiT
         gpoJWbIhErneM41rX9qYonnW/yODKe+IBiw5fQtloQDvodzvfJxRvgM3gCPDPMBud8t2
         BiydWuQGzcpwAmx3T++6+SCWLrpZIbTDeBdjz3BzuEtPzZRagnjQXxxSc4YNcGAo/vNp
         JkWTjKSB5k4oCtszo8RnaZjyr+uV/M21z+iJhrBEzP5ffRCo19W2GsMLxT9U2QVDOaNP
         ks7g==
X-Forwarded-Encrypted: i=1; AHgh+Rpl79Hc82N2bqabwjrT3xQQNHltaCqBu4bhk+ITqfIJQbwF+DbPHNeOyhOqLGiFnutQAtp85kHWQROazdWl2AAf@lists.infradead.org
X-Gm-Message-State: AOJu0YwkF6ZUGLae8H4yr3MvgZmGIaR1ZgFxyTcCOfODo1WvHtTXvwRz
	gA6f55f9DGl2Atb6B2ZGm+44twN1sOImn8R+qtklUQQmI49Uv+jz/FCtS3VOUv/PFXw=
X-Gm-Gg: AR+sD13Mlf2J2S4eLzpUfZEWmypvz6MwPUAm6ltpPN+zAzUzk/+RVm5tzscAlK52e4j
	Yes2IxG/2563BsdAzdd327XEz3psvE+bwP2lbDEi0E4mOHzyMPmPxIbe908mJUVuuxXruPYX3kK
	IxaxZqgFdhmz+Gbo18O1+q0FTmhjzN7Vs8zpWDXqLEovAHjP5pQEaPkrYs5IYIkMxyZh1ob5l49
	dAE8QARE+yXOJBxcTx1O5s6l3DeFeM6bp5Ud+UMG4QVNEvxW+nWs+d1qk4zeDu/dV15J8Dr0A/2
	6dfFDnkxw24drh7TGZ/dqQLFXCspFy3AlaoHqShmMcU9Kjp4V2StZOpbkiEuqMlbpHTLnzeUrBF
	fAzGu2vvZi2zZpmQ+jmHiGsOYFADolfVpBucfTt09WiFHcufqiofTnc4LQXtUvlhhudoe79Yz+E
	TBUPh+AeeP/0KGrBStwczpKbLIkyHHrL7mGE3BPLgl+Q2HeyymZDl5kDgR9C13CZxe
X-Received: by 2002:a05:600c:8595:b0:499:518d:ebd6 with SMTP id 5b1f17b1804b1-4997846c98fmr70953065e9.17.1786462245612;
        Tue, 11 Aug 2026 08:30:45 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:30:45 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 00/14] perf cs-etm: Per-thread mode fixes and snapshot wrap
 support
Date: Tue, 11 Aug 2026 16:30:03 +0100
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPw/e2oC/x3NQQrCMBCF4auUWTsQI23Bq4iLoZmYEZqUmViUk
 rsbXX5v8f4DjFXY4DocoLyLSckd59MAS6L8YJTQDd75yU1uxCetbLgYvnIsulKtHHBjxZqUKWC
 UN46OZ38hmqNj6E+bcp//ldu9O4nVop9ftLX2BR8T+p6EAAAA
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
 Suyash Mahar <smahar@meta.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_083047_632970_23E77FB8 
X-CRM114-Status: GOOD (  15.89  )
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
 tools/perf/util/cs-etm.c                           |  98 ++++++++++----
 13 files changed, 382 insertions(+), 368 deletions(-)
---
base-commit: bf10e6ee2ac3034c9068e03eed418fd16961984e
change-id: 20260605-james-cs-unformatted-per-thread-fix-50e723aa7f0e

Best regards,
--  
James Clark <james.clark@linaro.org>


