Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E05DC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0Jq54M6feo8dxcXZ9rpxE1kRx7QpIWtSFT27jMcdYE=; b=20feJRYsPWD88ckm3JIn1VZwv8
	9f54rGpSLTSb/J/9h54NiOZiXbSSEkL/3oMkRsapmbLqXv2SWlVAg5iWz58in8xAf9a3AkGMephfZ
	aCuP31kXb0N5Z4Ut8yAjs/ao+U1bszvFSsEyM8h3QUo+n5U3kq9KiJnv1HgUwHI0Is/aQ9ZTkK5kN
	I3+HWpbAsXuUa4C6rmpHgACHa3w3iOwTi4wQIFs7WtdE5Tl2C1mGcgujjdCJqc4hKLbmNAkhmMC2U
	JnpnLgRzpkBUnvOx4C9YMDtLSvWtnL+4WRlya7783GaMsVEq9FrBLf770qpYOncMNbmLSSM2d47C4
	I5v6fffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Oo3-00000008iF3-40Iz;
	Wed, 23 Sep 2026 15:22:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ond-00000008hzJ-2LKX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 15:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=H0Jq54M6feo8dxcXZ9rpxE1kRx7QpIWtSFT27jMcdYE=; b=PKbqfZfUTkSrmjQyOtbiVxhskc
	oNq1JpRcZDgIkOUncVUdp+pm0WhBY2FdwBZtPgXEZIGyFtLVDS+IEuguoyFm/mUtrls+JpIexRn7p
	q61FqKbHzO/jB0t4pSDdQEEx1ewOyIzkMMff1y7DNiBtbWj8PFY7aHrMKufMXG9qEFCi4c2BBw5Dp
	swMgBR+lYOqgmGz2uuNSKIrJfZ+YA0tMqmp3RCAH5Gcs2S2QVCGGNW+wrAlDyI62pcTXiDjpjG6Ma
	bG7q8jDmMaMVp+hY8C+ACOdQ8pr752XWvfT4jfnPKL2EIuVd6Jajd5sZuzv1Za1jWucUDiSnJLH3Q
	pFThbpcA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Ona-0000000Evec-0uTd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:22:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6E341D14;
	Wed, 23 Sep 2026 08:22:12 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0574B3F86F;
	Wed, 23 Sep 2026 08:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790176936; bh=7P52Iamvzkdn9OJUTBT7htFwBgcAKkrJTYDZdLDrnHU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d6PMTZjQ7ZSxzrqFK/e2yI5C8+JzcOrD2Qt5cClF8mvJrqAShnmRPOj6My2rjA2cd
	 1ci29qzO5V6gHwW5lWsIxJerW/YKdpdLVD1+jzzUrFVbzJ4W/g241y0u1aby3faEWw
	 dIqgUzTgMb+vIaeGNQqCSsiLOY9tI7MxfcoAjvj8=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 23 Sep 2026 16:21:48 +0100
Subject: [PATCH v2 08/14] perf cs-etm: Centralize branch sample synthesis
 checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-perf_cs_etm_fix_non_taken-v2-8-6ab8c07a5455@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790176913; l=2314;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=7P52Iamvzkdn9OJUTBT7htFwBgcAKkrJTYDZdLDrnHU=;
 b=erlS3IJaBTyVBA7wVoMmrsa9kP3LBQ1uP7H7zeLDxlwD+GmLediFjMaSkpeyuHFLm+Sq3Q2Ot
 H6pTVJGzJV/Bf7j802YxLvf3vPZBvTZxpInkUwA1nbnhdfCI9jL8XBI
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_162218_855810_E598B719 
X-CRM114-Status: GOOD (  12.30  )
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

Move the branch-synthesis option and packet checks from cs_etm__sample()
into cs_etm__synth_branch_sample(), alongside the existing branch filter.
Call the helper directly from cs_etm__sample() and cs_etm__flush().

Accept trace-start and trace-end flags, this preserves boundary samples
without a taken branch.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 37 ++++++++++++++-----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 5b5ee52c0277f5ff8f03c2908e4af1d7801845ff..c8a92b5dba6001329d68766d540b9b7ead90e9e6 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1726,6 +1726,14 @@ static int cs_etm__synth_branch_sample(struct cs_etm_queue *etmq,
 	} dummy_bs;
 	u64 ip;
 
+	if (!etm->synth_opts.branches)
+		return 0;
+
+	if (!cs_etm__packet_has_taken_branch(tidq->prev_packet) &&
+	    !(tidq->prev_packet->flags & (PERF_IP_FLAG_TRACE_BEGIN |
+					  PERF_IP_FLAG_TRACE_END)))
+		return 0;
+
 	if (etm->branches_filter &&
 		!(etm->branches_filter & tidq->prev_packet->flags))
 		return 0;
@@ -1965,23 +1973,9 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
 		}
 	}
 
-	if (etm->synth_opts.branches) {
-		bool generate_sample = false;
-
-		/* Generate sample for tracing on packet */
-		if (tidq->prev_packet->sample_type == CS_ETM_DISCONTINUITY)
-			generate_sample = true;
-
-		/* Generate sample for branch taken packet */
-		if (cs_etm__packet_has_taken_branch(tidq->prev_packet))
-			generate_sample = true;
-
-		if (generate_sample) {
-			ret = cs_etm__synth_branch_sample(etmq, tidq);
-			if (ret)
-				return ret;
-		}
-	}
+	ret = cs_etm__synth_branch_sample(etmq, tidq);
+	if (ret)
+		return ret;
 
 	cs_etm__packet_swap(etm, tidq);
 
@@ -2049,12 +2043,9 @@ static int cs_etm__flush(struct cs_etm_queue *etmq,
 	if (err)
 		return err;
 
-	if (etm->synth_opts.branches &&
-	    tidq->prev_packet->sample_type == CS_ETM_RANGE) {
-		err = cs_etm__synth_branch_sample(etmq, tidq);
-		if (err)
-			return err;
-	}
+	err = cs_etm__synth_branch_sample(etmq, tidq);
+	if (err)
+		return err;
 
 swap_packet:
 	cs_etm__packet_swap(etm, tidq);

-- 
2.34.1


