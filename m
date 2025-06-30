Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9E5C83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 16:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AijBn+2IP/f3LutSbY1Cih8y5aOz7Ns+ZjylgLZ/gSs=; b=HZywwETGLVZfVsYbmFfO4/3hOV
	bNZcSpNSDLtl54IocwG6of0TliENb45cIFBCupMOkukyMWbK6TMPNQ9pnutK8cEEVZOkUBopqTUUy
	JDbztniCGfYZVLbxtW5BrFxYtIVlCY3nesUtuWwC1n3HgptOmuTbOgbNPSfiRGHsXGN1ia+VkXI/s
	EbNd9jYaArbIdm2eqo+6q0s67eFKaulRkMg7CjfqXJgoC1hoARSg+yItoEn9Udk+8HiVZ4n9SSRR+
	ezVz+/f4aeC5+dOGBW+OgLusbH1IZEBHbeBy/fMuKgGoP/wB+KmX3LUUW/XxwKkr+wlsMqLqMkOoF
	nGXL3dJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHCY-00000002t2V-2mit;
	Mon, 30 Jun 2025 16:17:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWGN2-00000002k6X-1Q7G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 15:24:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E8FE1516;
	Mon, 30 Jun 2025 08:24:20 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81B383F6A8;
	Mon, 30 Jun 2025 08:24:33 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 30 Jun 2025 16:23:43 +0100
Subject: [PATCH v2 11/13] perf arm_spe: Refactor
 arm_spe__get_metadata_by_cpu()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-arm_spe_support_hitm_overhead_v1_public-v2-11-2e1afab313b9@arm.com>
References: <20250630-arm_spe_support_hitm_overhead_v1_public-v2-0-2e1afab313b9@arm.com>
In-Reply-To: <20250630-arm_spe_support_hitm_overhead_v1_public-v2-0-2e1afab313b9@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 German Gomez <german.gomez@arm.com>, Ali Saidi <alisaidi@amazon.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751297044; l=1957;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=SSENaL9QPQy/OwQbeJf4NlxCmJRyfqxIKzm2IN2ukF0=;
 b=EZipj/LL0o/8GPMbqI4Pnrqhg6pBpATY8/R81PyVLDw2BPyn8mWApkYc63cNxNzZwjKJ+Npgg
 2I1nOdKtAFVAYHsLDF4gOi+JpfE5k1aPR8J91ONP5kW6oBMNEvsVhJ1
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_082436_419228_1C6A5C59 
X-CRM114-Status: GOOD (  15.56  )
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

Handle "CPU=-1" (per-thread mode) in the arm_spe__get_metadata_by_cpu()
function. As a result, the function is more general and will be invoked
by a sequential change.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 3715afbe1e4713b5eebb00afbcb3eaa56ff1c49c..5b6699f192e5e58bab6b0d8e2e8df80fdf404a36 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -324,6 +324,19 @@ static u64 *arm_spe__get_metadata_by_cpu(struct arm_spe *spe, u64 cpu)
 	if (!spe->metadata)
 		return NULL;
 
+	/* CPU ID is -1 for per-thread mode */
+	if (cpu < 0) {
+		/*
+		 * On the heterogeneous system, due to CPU ID is -1,
+		 * cannot confirm the meta data.
+		 */
+		if (!spe->is_homogeneous)
+			return NULL;
+
+		/* In homogeneous system, simply use CPU0's metadata */
+		return spe->metadata[0];
+	}
+
 	for (i = 0; i < spe->metadata_nr_cpu; i++)
 		if (spe->metadata[i][ARM_SPE_CPU] == cpu)
 			return spe->metadata[i];
@@ -926,22 +939,7 @@ static bool arm_spe__synth_ds(struct arm_spe_queue *speq,
 		cpuid = perf_env__cpuid(spe->session->evlist->env);
 		midr = strtol(cpuid, NULL, 16);
 	} else {
-		/* CPU ID is -1 for per-thread mode */
-		if (speq->cpu < 0) {
-			/*
-			 * On the heterogeneous system, due to CPU ID is -1,
-			 * cannot confirm the data source packet is supported.
-			 */
-			if (!spe->is_homogeneous)
-				return false;
-
-			/* In homogeneous system, simply use CPU0's metadata */
-			if (spe->metadata)
-				metadata = spe->metadata[0];
-		} else {
-			metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
-		}
-
+		metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
 		if (!metadata)
 			return false;
 

-- 
2.34.1


