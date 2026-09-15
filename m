Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F13C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsmrtkOFNtL8+jWugshSmkIdkqviskkheD4tYRtKBLA=; b=jCp2hx+oXLLsuCmRYhCv7lqQyp
	lqaSM3LeteMEkKkgpPMjMfNXxNbTy8IFqY+ZDvh842ey2EREBe4B9G/jrJlXs9Ryqol/evIiXarrT
	6KGz9mtBPssN/YzQlSVMoLKRMLs9pTWVlVQXLpA18M23AdLHQCKow5hv4/tcafhCtBU6khhsIbhcD
	FvxXVc7iS0ctmwV1pozM5lwir2f+ZWIa1NeE1SbB03C8qTa2j49MsNiHDSF+RZ65snxnuzvBvsYnu
	UuRPhapYLHp17/yZWQfNfl46q535FHLDNmfJVc88NuFQNTxek+hpZTprCwRBPwobUrjLAzfEIMN3W
	/yHZfVUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VQd-00000007IkI-1eW1;
	Tue, 15 Sep 2026 15:50:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPp-00000007I3V-2Hrx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:49:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23D7615A1;
	Tue, 15 Sep 2026 08:49:45 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B25D3F882;
	Tue, 15 Sep 2026 08:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487388; bh=2BWIzct5AOjyfF3AD0YgFM25chejHt1dAhhGT0eurX0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gY6xFSfk7qsqfrCYpUN1B+yQB6GszxHx6mqZmavlCL9YNw0zzW+K3/gZE/YO1Jx2s
	 H/P5fHEBYrU1A095iYpixEoVJGoboyoeeeb4sSRDtrjCE5WUA31rFH8HPycEkDY5qH
	 xKZbtknQPMhUmccidu1RHDkkSYNjsDN6zMat4KLU=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:49:03 +0100
Subject: [PATCH 17/25] perf cs-etm: Allow history collection for samples
 with zero IP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-17-35cf6f297d20@arm.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487340; l=1574;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=2BWIzct5AOjyfF3AD0YgFM25chejHt1dAhhGT0eurX0=;
 b=JEAlUVzjAxBjSEXx7rX7saEGp6gs8WRPKMkLB0A+GL/m05JjtdPTWvwRsDl9QqVTOeULXeoee
 1Z7SykBs4bPC3TUZz3yZ28S3t5cPrPCfZprrjvB+TBsNuIvtpY/192C
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084949_738164_58606BC0 
X-CRM114-Status: GOOD (  12.61  )
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

Perf clears the IP of a user-only PMU sample when its interrupt skids
into the kernel. The timestamp and TID remain valid, but the zero-IP
check prevents --itrace=L from attaching decoded branch history.

Remove the IP check and keep matching samples to trace by time and
thread.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 00407a80933e1c0b76260aed5894dece50b9aecd..baa962085dba5226d9729a0ee8039374d5fcb1a0 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3097,6 +3097,8 @@ static int cs_etm__br_stack_init(struct cs_etm_auxtrace *etm,
 /*
  * Add decoded branch history to an existing sample. The sample keeps its own
  * ip, callchain and event identity; only an absent branch stack is filled in.
+ * A user-only PMU sample can have a zero IP when the interrupt skids into
+ * the kernel; its thread and trace window still identify valid history.
  */
 static int cs_etm__process_sample(struct cs_etm_auxtrace *etm,
 				  struct perf_session *session,
@@ -3107,7 +3109,7 @@ static int cs_etm__process_sample(struct cs_etm_auxtrace *etm,
 	int err;
 
 	if (!etm->synth_opts.add_last_branch || sample->branch_stack ||
-	    !sample->ip || !sample->time || sample->time == (u64)-1)
+	    !sample->time || sample->time == (u64)-1)
 		return 0;
 
 	/* Adding branch history to existing samples supports the host only */

-- 
2.34.1


