Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EE5C5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 22:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=whCVtKu77+eGcZ4xirsoqc32IORWXPzEmNIchbxCDv0=; b=sje8ef0ocMLIdk2Ra1m+yqZ0jV
	zUdLc/fykiMPyNQn8hPzfBZK+TfpbLcU+C/uYv3UHdzlx9Ho+YKwosSZj6npxE/XwRZZkAiHemS78
	edTgUmes1xD4TMCl+k7NqOdyTp2t/K2S/uBYFPs7QNSBPmKtZ7OACZji2sMTHj+0zsHVINVyNFK26
	dXxxbw0fWz3utfKYKrMR/xtvjZExxxWZyCF75Mbf1uBIOwK+BBQfxkjn2vgdloow13oThJ5aFzXBL
	Y92AoOfyQOwNMAw3ZL+tfoOijvMWt+8JY0YCmulLNtvI3LJyqouqpcKjJ+YBOUE4EXbnv68ch+u6A
	x9WEduyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5jG-00000006uLG-2ddH;
	Mon, 17 Aug 2026 22:22:50 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5j9-00000006uHr-3WpP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 22:22:46 +0000
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLoAXO1515142;
	Mon, 17 Aug 2026 15:22:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=whCVtKu77
	+eGcZ4xirsoqc32IORWXPzEmNIchbxCDv0=; b=BkxE38P1pskgo29x3ELk4XZUU
	nbd/CZngMmrR47HgkrnmoCEqXqGTZbbYQHSraeMz0UFFSTKeKg68rgSHGsO6AuoW
	+BHYLI9191rfXW4UHbOQyqEcoKcZ2Q4OpNlIAgKRcVmInqjDbHJUb7xHOKv600xZ
	4XsYJt+jxItWYluPIjyFvvwYRHA6ElJOrdas6P51K68L/4jSO6NhDkFP3C19M2vb
	WDNZKjAcESXTpeCy1qSQ16kOH8gha/AO4CNsJR+vIbvE3wIxfYbAxbm681Q33F+E
	wCQeFGcDGOpyJhQTIIMDhaHzk87CRKi0NYLAHe5BKDtGyEwULOqOpXNCWw79A==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4g2nx9v064-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 17 Aug 2026 15:22:22 -0700 (PDT)
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.45; Mon, 17 Aug
 2026 22:22:21 +0000
From: Amir Ayupov <aaupov@fb.com>
To: <linux-perf-users@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan
	<leo.yan@arm.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
	<mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim
	<namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>
CC: <linux-doc@vger.kernel.org>, Mike Leach <mike.leach@arm.com>,
        Jonathan
 Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Swapnil
 Sapkal <swapnil.sapkal@amd.com>
Subject: [PATCH v2 0/5] perf: Add CoreSight branch history to existing samples
Date: Mon, 17 Aug 2026 15:22:15 -0700
Message-ID: <cover.1787005265.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:208::f]
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDE3MSBTYWx0ZWRfX8mcnyvDiIv4f
 uAenopX6+2IsUPkSUhNaI7Mv22DTvY2kXga0njQkb6A8bXLDHUttPRWG4x0aA/Z87dqCuAUiwKN
 JJZrM7LiHOZk0Dltf5rXvo7eO3MAS7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDE3MSBTYWx0ZWRfX/9dLQMBZQ1Cb
 EU/QHuEIVMgRlHgLySirX82ESTxV5YU65nuoTDvChsn8sTLWAevZaGqNu2PezuiqGMqyf1B24eF
 uelGg2ksc46yFWyHVOl1RdN7A8i9oqKHG4ux4jhePVB10QrYDJH8EyLKwL56BFZd9pYE61W8Sep
 Y0Y/r91NAEc1KAwK3AIgPLHjDiNZdvkqOZX13nCg477CW6jzuLiK+EV1yuGZj2UmffKJuA5O8aO
 eWCy1wmPWZxvYM4s01On+QVNBoqlaEJ4zvChjVbEpB1qwWssUFcg0dyOX0vZaOsMgT+yf0dzmtY
 Icfl5kCgLvLm8Xq4cz6aANCP1bwOGovvMy3sUZL+eVnwdaX/4JDaP1n9W+FK+sHSRrLzhd8gWhc
 6/CeoX1NQcPV1dAaSDhyEeoQaz7okarngEMKRvB0C4pV/tI2E6wlLMrrmE06hWUvh1ED4Cx7Yb7
 GcOl1esnW0m6wxLrh/w==
X-Proofpoint-GUID: QSz51B02sM2_jhmilQg7PkO43w7IvplE
X-Proofpoint-ORIG-GUID: QSz51B02sM2_jhmilQg7PkO43w7IvplE
X-Authority-Analysis: v=2.4 cv=D7t37PRj c=1 sm=1 tr=0 ts=6a83899e cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=wpfVPzegXHpEFt3DAXn9:22 a=MiVhCCOMtV7kWwbjXwoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_152244_012289_51273DCD 
X-CRM114-Status: GOOD (  15.59  )
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

CoreSight ETM can synthesize branch samples from an instruction trace, but
context-sensitive PGO needs the branch history leading to an existing PMU
sample together with that sample's event identity and callchain. This series
implements that mode as --itrace=L, following the corresponding Intel PT
behavior.

The series first separates timestamped queue setup and teardown from the ETM
decode loop so decoding can stop at an existing sample's timestamp. It then
reconstructs branch history in the thread stack and attaches it to eligible
samples without replacing their IP, event, or callchain. The attached history
is consumed after use so a later sample cannot reuse an earlier trace window.

This enables a context-sensitive PGO workflow where a cycles event supplies a
frame-pointer callchain while duty-cycled ETM supplies the path leading to the
sample. A dlfilter removes samples for which no ETM history was available, and
the documentation describes the complete recording and decoding workflow.

Changes since v1:

  - Rebased onto perf-tools-next at d17c5b770972.
  - Dropped the HEADER_GROUP_DESC reader workaround. The issue is in the writer
    and should be fixed separately.
  - Dropped the branch-stack hw_idx patch after review established that zero is
    appropriate for age-ordered CoreSight branch stacks.
  - Dropped the local wrapped branch-stack copy fix in favor of upstream commit
    ab9c84d1cd59 ("perf thread-stack: Fix heap buffer overflow on branch stack
    wrap copy").
  - Added James Clark's Reviewed-by tag to the dlfilter patch.
  - Consume branch history after attaching it so samples with no newly decoded
    trace cannot reuse a window from before an untraced AUX pause interval.
  - Flush all trace-ID frontend thread stacks when their physical ETM queue is
    exhausted, preventing stale history from surviving a trace gap.
  - Check every matching CoreSight event when deciding whether kernel trace is
    enabled.
  - Reworked the shell test to use FIFO recording control, removed the invalid
    bare timestamp option, reduced the workload to 10000 iterations, and check
    proc1 and proc2 callchains independently with bounded failure diagnostics.
  - Renamed decoded test outputs to script-L4 and script-L64.

Amir Ayupov (5):
  perf dlfilter: Add non-empty branch stack filter
  perf cs-etm: Split up cs_etm__process_timestamped_queues()
  perf cs-etm: Add branch history to existing samples
  perf test cs-etm: Test branch history on existing samples
  Documentation: coresight: Document context-sensitive PGO workflow

 .../trace/coresight/coresight-perf.rst        |  62 +++++
 tools/perf/Makefile.perf                      |   1 +
 .../dlfilters/dlfilter-nonempty-brstack.c     |  26 ++
 .../tests/shell/coresight/add_last_branch.sh  | 203 ++++++++++++++
 tools/perf/util/cs-etm.c                      | 252 ++++++++++++++++--
 tools/perf/util/thread-stack.c                |  17 ++
 tools/perf/util/thread-stack.h                |   1 +
 7 files changed, 546 insertions(+), 16 deletions(-)
 create mode 100644 tools/perf/dlfilters/dlfilter-nonempty-brstack.c
 create mode 100755 tools/perf/tests/shell/coresight/add_last_branch.sh


base-commit: d17c5b770972854a4fe4cf5cc22e17eb21cdc787
-- 
2.52.0


