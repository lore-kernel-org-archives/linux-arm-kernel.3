Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3084C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbMTDlBgEhApgK58zKh1p/h3J3hSqU82Hox3Oxp6r3I=; b=vxUf62psmrQ1OLUGYUXsJ64CyC
	KwFvYwZOW4RiP+dFud+pIWrHW5oflvpapiCK7J8yGZhySS5DNVtZxGCvDm4KyA8NPXllzFCJIXzAS
	kjzX1sBxL84hkVPHusFBe0Ap1wo5JhfySYfoIMxJbylzMfSETWZAYhW7VbRxCcYFtc3WEM0f4eGFj
	uV4D1dfg1TS557irzYkboRNbLoix2c+pFVXUJ9kTPuMv6YCoX9CnT3RySt3fPhr5GM+9U9wKM9jCv
	JoQdGmpcqVIUZq18BF6Svdq3ylRIRY5w9+DraTWcOOXcdL46vVSd6IIWITp0FCIt65jMHgznEhuDx
	K5kPz8Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OnR-00000008hqQ-3tpM;
	Wed, 23 Sep 2026 15:22:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OnK-00000008hlU-0tqT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:22:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53DC31713;
	Wed, 23 Sep 2026 08:21:57 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 963D53F86F;
	Wed, 23 Sep 2026 08:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790176920; bh=jr6rgp9BDzG3S84HnXLYb8kzpUHgSQc0QYp/oTK+hI0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y76lsS2vlpiBJlvAoy5NTL2bfGWEGaYAxPfGCjNUiJqHltYPezc4IUYV6cMnMKldR
	 3toCC+toUqR/IFZMOYmr5glCSL3pR03ujsmlMgEc2AqlVmu7Wm+6SfUxapUIMI+E6S
	 pcqepA1hyb2mJ54Eqy3tj4jFVGMabBrMHlmIEroM=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 23 Sep 2026 16:21:42 +0100
Subject: [PATCH v2 02/14] perf intel-pt: Preserve return addresses for
 asynchronous branches
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-perf_cs_etm_fix_non_taken-v2-2-6ab8c07a5455@arm.com>
References: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
In-Reply-To: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790176913; l=1356;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=jr6rgp9BDzG3S84HnXLYb8kzpUHgSQc0QYp/oTK+hI0=;
 b=/FYgfBXt1MezJNB+vTU67BSfL2iiVIcoKpoywwZv6tbuqnER+TXCPg1oaMMchEoJMPlpF9ioj
 hEmsnyAO5GoCUvJHIgQ1hjqZG660JLE1f9a85rEwIY45hyAPYpCQsvh
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_082202_313318_91573CE2 
X-CRM114-Status: GOOD (  11.46  )
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

Intel PT uses a zero instruction length for asynchronous branches so
the thread stack resumes at the source IP. A dlfilter can fetch the
instruction before call/return processing and replace that zero with
its opcode length, advancing the saved return address.

Set sample.ret_addr to sample.ip for asynchronous branch samples so
instruction fetching cannot change the return address. This also
covers asynchronous trace-end samples and VM exits.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/intel-pt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/perf/util/intel-pt.c b/tools/perf/util/intel-pt.c
index 8c21c9f52d572d2dd4e15b3b5c341b253ccea1b5..e8b9c8a67b0a0635e0110eda4b6ccb2511132fc7 100644
--- a/tools/perf/util/intel-pt.c
+++ b/tools/perf/util/intel-pt.c
@@ -1803,6 +1803,13 @@ static int intel_pt_synth_branch_sample(struct intel_pt_queue *ptq)
 	perf_sample__init(&sample, /*all=*/true);
 	intel_pt_prep_b_sample(pt, ptq, event, &sample);
 
+	/*
+	 * For asynchronous branches, use the sample IP as the return address
+	 * instead of advancing it during instruction decoding.
+	 */
+	if (sample.flags & PERF_IP_FLAG_ASYNC)
+		sample.ret_addr = sample.ip;
+
 	sample.id = ptq->pt->branches_id;
 	sample.stream_id = ptq->pt->branches_id;
 

-- 
2.34.1


