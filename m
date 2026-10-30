Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFF560A2615
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AZCNJfdJ;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SwCm6YVD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CQnY8qKFGpPU9NXWHDHKpiteq0S+2FYWabMRXfrAGd0=; b=AZCNJfdJBsof4K
	4BGqL8g0mz5NWQLBN1AQXidzQqxykW/XHZ7XI4Hp2axmvm2cm7Ix1dgk1KBF6TRRZ25rSN3cEHPNo
	xwS4OCtvuSx3enA+T/H+C3iA4Ef/TuG5kEt6qC4kc9uSA/zedE+6KrndohndbDR1qWlwI6bsIzx0Z
	BgbGmA/lRGpv9k784udlUR3ibzWQhpQQR/lmNULfmU2MW0dZxYcBXm4wAZ7Pb2y1qUAYxSSy9N180
	XQ9dLQ3+FmnnoGh51uvHJQvRU9RnCPJgdwDCbHjCHWL4H0EN6hMLC8qAhMIS20QCSoPWeu/EnZaQL
	gCfLqqoeGn8MxujHTwIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoIR-0000000BxNX-2x4R;
	Fri, 30 Oct 2026 15:13:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoIO-0000000BxLg-3Ef6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:13:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 791361682;
	Fri, 30 Oct 2026 08:13:28 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FB353F59E;
	Fri, 30 Oct 2026 08:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793373211; bh=NrgmhdsujtT12W5xQ/MkNTy/uIFou/U+aGx0G8RML+k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SwCm6YVDPMcXv50hLL0xE3ynlfWrT6UaBnmeC3/df0tEpFYmq28Ui1DlRzNQIBcpZ
	 8+C8Xi2dnMB0+IBbpo71TpbSx7mG6dMxfRnH0r49ilvmMRz2oaiKSl3SY+IOC93YsJ
	 EMc+v6SFlUwEjC7bITTX1MHHQajCdh4G+17v7beg=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 30 Oct 2026 15:13:10 +0000
Subject: [PATCH v3 03/14] perf cs-etm: Break branch history when
 instruction memory is unavailable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-perf_cs_etm_fix_non_taken-v3-3-7629b52ab047@arm.com>
References: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
In-Reply-To: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793373201; l=1318;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=NrgmhdsujtT12W5xQ/MkNTy/uIFou/U+aGx0G8RML+k=;
 b=LDWF85DFHqcVcWG50iHm7JfbLnb2COwRgnhtGc/VIyMOmojGR8J+xwCS4JFbMaCrOVIRbLIbB
 nISQBwO/k8zCLqio3T5RbgbG5RvcjqmsLQF/Bv+AVdK4uAmwkP1u9LR
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_081332_875967_F79262DC 
X-CRM114-Status: GOOD (  10.61  )
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

The decoder currently ignores OCSD_GEN_TRC_ELEM_ADDR_NACC, allowing a
subsequent range to be paired with stale branch history from before the
unreadable code.

Treat an inaccessible instruction address as a discontinuity and flush
the pending range and branch history before processing subsequent
elements.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index b56cf57a68c88de4686ecc8b0c7e71ac0f1d2f09..3fbb3fdf0382705bd4efa732c54ebb816144b2a8 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -594,7 +594,8 @@ static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
 
 	if (type == OCSD_GEN_TRC_ELEM_EO_TRACE ||
 	    type == OCSD_GEN_TRC_ELEM_NO_SYNC ||
-	    type == OCSD_GEN_TRC_ELEM_TRACE_ON)
+	    type == OCSD_GEN_TRC_ELEM_TRACE_ON ||
+	    type == OCSD_GEN_TRC_ELEM_ADDR_NACC)
 		resp = cs_etm_decoder__buffer_discontinuity(etmq, packet_queue,
 							    trace_chan_id);
 	else if (type == OCSD_GEN_TRC_ELEM_INSTR_RANGE)

-- 
2.34.1


