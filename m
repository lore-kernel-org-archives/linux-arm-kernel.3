Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD91C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 20:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PiUK2ioqh2BYVrmabTp1PfcvkxlDT4JEX8xC4ka/whI=; b=SA9tWpToQ7Y2NqYYfiVAHpHGkE
	r0/lj2eVCFExr6G85TbUNqqI9vIQKifvhSxn9TwSskqV/K/L0FsYS5zYU/skhdsX0ImKi6xdQ/5Qj
	EM3x5ywnuLH7fJj5rNjqnf+77JXem7AmxYSYsddg+7H824ZOZue8wGHe0LCRs69u1xwN7DfxEviqw
	9N/pnie+PID3MSZVYHb+zyxaeTdLuf6uM7aPRpdUbN3Up/nj13JeetTw0d5J605a8bTFb6SNDP3Vw
	KxSahWfLNdeTk+YgpWckA+bChOmPgF6n6QnD1tA6nperonVaYo/yT4L7tYPbH+8Ul0szK1LwSeXRQ
	NTK8J9iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGma-0000000ALNU-3Dn5;
	Tue, 21 Jul 2026 20:09:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGmZ-0000000ALNO-04oN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 20:09:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 10F8060A7E;
	Tue, 21 Jul 2026 20:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA571F000E9;
	Tue, 21 Jul 2026 20:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784664577;
	bh=PiUK2ioqh2BYVrmabTp1PfcvkxlDT4JEX8xC4ka/whI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DLddbgn9Jc/bwveW0prc+TgDS0j49dIy7Nx65zOBUds18CjsvTnKEVAOzrLiHv08i
	 /uRPfVrKZlmt5X7xFcYkyXDsfJtQ56Cf11/7B0Zl65K2BcZbETvzjhSDtRC78V0mUp
	 WAG81U58FtnIyrs/8V5P9Wx6C3AK4GvXafN+R/IQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Julio.Suarez@arm.com,
	Kiel.Friedt@arm.com,
	Ryan.Roberts@arm.com,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	John Garry <john.g.garry@oracle.com>,
	Namhyung Kim <namhyung@kernel.org>
Subject: [PATCH 6.12 1254/1276] perf arm-spe: Use old behavior when opening old SPE files
Date: Tue, 21 Jul 2026 17:28:17 +0200
Message-ID: <20260721152514.156438847@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721152446.065700225@linuxfoundation.org>
References: <20260721152446.065700225@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

6.12-stable review patch.  If anyone has any objections, please let me know.

------------------

From: James Clark <james.clark@linaro.org>

commit ba993e5ada1ddce7a71140dc85ef65bc2cd981bc upstream.

Since the linked commit, we stopped interpreting data source if the
perf.data file doesn't have the new metadata version. This means that
perf c2c will show no samples in this case.

Keep the old behavior so old files can be opened, but also still show
the new warning that updating might improve the decoding.

Also re-write the warning to be more concise and specific to a user.

Fixes: ba5e7169e548 ("perf arm-spe: Use metadata to decide the data source feature")
Signed-off-by: James Clark <james.clark@linaro.org>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Cc: Julio.Suarez@arm.com
Cc: Kiel.Friedt@arm.com
Cc: Ryan.Roberts@arm.com
Cc: Will Deacon <will@kernel.org>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: John Garry <john.g.garry@oracle.com>
Link: https://lore.kernel.org/r/20241029143734.291638-1-james.clark@linaro.org
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/perf/util/arm-spe.c |   50 ++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -655,37 +655,35 @@ static bool arm_spe__is_common_ds_encodi
 	u64 *metadata = NULL;
 	u64 midr = 0;
 
-	/*
-	 * Metadata version 1 doesn't contain any info for MIDR.
-	 * Simply return false in this case.
-	 */
+	/* Metadata version 1 assumes all CPUs are the same (old behavior) */
 	if (spe->metadata_ver == 1) {
-		pr_warning_once("The data file contains metadata version 1, "
-				"which is absent the info for data source. "
-				"Please upgrade the tool to record data.\n");
-		return false;
-	}
-
-	/* CPU ID is -1 for per-thread mode */
-	if (speq->cpu < 0) {
-		/*
-		 * On the heterogeneous system, due to CPU ID is -1,
-		 * cannot confirm the data source packet is supported.
-		 */
-		if (!spe->is_homogeneous)
-			return false;
+		const char *cpuid;
 
-		/* In homogeneous system, simply use CPU0's metadata */
-		if (spe->metadata)
-			metadata = spe->metadata[0];
+		pr_warning_once("Old SPE metadata, re-record to improve decode accuracy\n");
+		cpuid = perf_env__cpuid(spe->session->evlist->env);
+		midr = strtol(cpuid, NULL, 16);
 	} else {
-		metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
-	}
+		/* CPU ID is -1 for per-thread mode */
+		if (speq->cpu < 0) {
+			/*
+			 * On the heterogeneous system, due to CPU ID is -1,
+			 * cannot confirm the data source packet is supported.
+			 */
+			if (!spe->is_homogeneous)
+				return false;
+
+			/* In homogeneous system, simply use CPU0's metadata */
+			if (spe->metadata)
+				metadata = spe->metadata[0];
+		} else {
+			metadata = arm_spe__get_metadata_by_cpu(spe, speq->cpu);
+		}
 
-	if (!metadata)
-		return false;
+		if (!metadata)
+			return false;
 
-	midr = metadata[ARM_SPE_CPU_MIDR];
+		midr = metadata[ARM_SPE_CPU_MIDR];
+	}
 
 	is_in_cpu_list = is_midr_in_range_list(midr, common_ds_encoding_cpus);
 	if (is_in_cpu_list)



