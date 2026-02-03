Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531F2E83040
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 02:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWFMiIxkxOEYbk57D4xMTZi9KCyV2cP/dryOu5t03fI=; b=hLbat/71JbIi+WARPPlb5NM+Ey
	5l+Ca3e2HW70WHRfAvnCwVudggJXBxBR1aCI7f5x7D6EcxoR0V5KGGhtbwU0OSEwvXOkUZ7G7DXRf
	7y+vjkk17EP1qaFNW3KLmHSeG2lcwvfKWXyQsVReLFkKz9VDPUby01sZAUuMQdfmR/BHwriOnjsh9
	mgi7uLDSKOrAj+J+8QtvkrRlQ1ZkiNXY0Gzn4yUvuX238447iYyUqDyRiP3yt6q9QShsiT7z8/+lj
	ICpkBH0VIuF6uR4n1UkTzyKjXdptZE/DL9eRX/BPxy9DUxz68zKlFPKbm/vE4jlv/5FuY4hYnfqkD
	IrI5DgrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn6SM-00000005wNB-2ViB;
	Tue, 03 Feb 2026 02:47:58 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn6SK-00000005wLN-0lG7;
	Tue, 03 Feb 2026 02:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770086876; x=1801622876;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZFP9ftY8bSrq1v5fwO+CjAOG/yHX4OP7LEXkU9+oNBc=;
  b=HeAWeVU7mE68yqXLPx/FTfbEr/MCAuDngHt/SQQJOmGsDp+efF+2/oG8
   wX9jYbhMlv5EdhafhV0OpSBQIiAntqcEQwNitxAH6JdtfDPT1ZaN82UmR
   o4101GKT84eTPC/DEeFz3u2uSFmhBhwSDXhpRhV2K9H2mFgQVoK1MeU5H
   Hx6u+mTevJMJJ01v4w+6jMh/xWRa1e4wFpP90IlbmB5jb2LwGM26h0JML
   7GE4Sp4SgTfEraOsO7Ahi7iXGpftdYUxZ3HVWg5eYU36mhmjB6Y7WfhLx
   t4VVHsqbRedLPYigkd6Oxq9UKcZCDtYsc2OF+Y0hh59BPSB65frL5uK6v
   w==;
X-CSE-ConnectionGUID: 2x7zBZrQSbemnqPyAAcSrg==
X-CSE-MsgGUID: Xyy0aHn8S/iT+RQzcoXAwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71152128"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="71152128"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 18:47:56 -0800
X-CSE-ConnectionGUID: syzJ3XD/Q5We8vUakIh8vA==
X-CSE-MsgGUID: 3WNYg+RBRRe8if1tXYjtIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="208991715"
Received: from spr.sh.intel.com ([10.112.229.196])
  by orviesa010.jf.intel.com with ESMTP; 02 Feb 2026 18:47:50 -0800
From: Dapeng Mi <dapeng1.mi@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zide Chen <zide.chen@intel.com>,
	Falcon Thomas <thomas.falcon@intel.com>,
	Dapeng Mi <dapeng1.mi@intel.com>,
	Xudong Hao <xudong.hao@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Subject: [Patch v3 1/4] perf regs: Fix abort for "-I" or "--user-regs" options
Date: Tue,  3 Feb 2026 10:43:53 +0800
Message-Id: <20260203024356.444942-2-dapeng1.mi@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203024356.444942-1-dapeng1.mi@linux.intel.com>
References: <20260203024356.444942-1-dapeng1.mi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_184756_246747_F8B65F4D 
X-CRM114-Status: GOOD (  14.85  )
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

Fix an issue where the `perf` tool aborts unexpectedly when running the
following command:

```
perf record -e cycles -I -- true

 Usage: perf record [<options>] [<command>]
    or: perf record [<options>] -- <command> [<options>]

    -I, --intr-regs[=<any register>]
    sample selected machine registers on interrupt, use '-I?' to list register names
```

The usage of the `-I` or `--user-regs` options without specifying any
registers should default to sampling all general-purpose registers.
However, this currently causes an abnormal termination.

The issue was introduced by commit 3d06db9bad1a ("perf regs: Refactor
 use of arch__sample_reg_masks() to perf_reg_name()"). This patch
resolves the problem, ensuring that the `-I` or `--user-regs` options
work as intended without causing an abort.

Fixes: 3d06db9bad1a ("perf regs: Refactor use of arch__sample_reg_masks() to perf_reg_name()")
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
---
 tools/perf/util/parse-regs-options.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/parse-regs-options.c b/tools/perf/util/parse-regs-options.c
index 8dd35f50f644..b44b47d9059f 100644
--- a/tools/perf/util/parse-regs-options.c
+++ b/tools/perf/util/parse-regs-options.c
@@ -66,12 +66,14 @@ __parse_regs(const struct option *opt, const char *str, int unset, bool intr)
 	if (*mode)
 		return -1;
 
-	/* str may be NULL in case no arg is passed to -I */
-	if (!str)
-		return -1;
-
 	mask = intr ? arch__intr_reg_mask() : arch__user_reg_mask();
 
+	/* str may be NULL in case no arg is passed to -I */
+	if (!str) {
+		*mode = mask;
+		return 0;
+	}
+
 	/* because str is read-only */
 	s = os = strdup(str);
 	if (!s)
@@ -104,9 +106,6 @@ __parse_regs(const struct option *opt, const char *str, int unset, bool intr)
 	}
 	ret = 0;
 
-	/* default to all possible regs */
-	if (*mode == 0)
-		*mode = mask;
 error:
 	free(os);
 	return ret;
-- 
2.34.1


