Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6833C98312
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KF1kLX/Nn0/bOfwr3hc8BfaEAM5/u7+LnbuRTLDoRLk=; b=k+J+LSRIpfKS3WeqfYjCJdmVEt
	4s+7KPaoveb1uAyoKSF2lf+96hBOnfQkjiodJn756M0ANyNjiki1EVdFG78gm7Cn/pQlN3FJDtD4J
	lzLH116n+8pIWstIZVrhs4sqidHmWn8lUbGCKxWOOo2pjhSGfdYGgOs/QcrRl5T9AEybf+qox65J2
	AAIQfi0bYiswNS5mciqFE3D5O+oc1VGMLb7x77/9HXQdnoosCt/8OtSFiHCKdrQOhLfNwFV96oOXN
	Vs/Zsps++pvssqtpNXJx6zXpvBw+TNt57fwCjxKY9dPts6ziy8tl1Sl7M3j7IFuaKoYqKWV12m3Fs
	o6n67EOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OnS-00000008hqo-0Qr7;
	Wed, 23 Sep 2026 15:22:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OnM-00000008hn4-3lfC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:22:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E15831A32;
	Wed, 23 Sep 2026 08:21:59 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C1B43F86F;
	Wed, 23 Sep 2026 08:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790176923; bh=wi+zn9O1qBn5yWetnOxpHDcJ44qEdmWTjDLDoafQLSY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I9GAUcipFtMhldJOdMoWYOAtPTFQPIy5oEZXM0Xv2Jdx4GHnIf6pff4+m0nN9OiiC
	 EUirc5EwgHte2IV0BGDpcmfcbHfliUwqiZ+moVez3ogYH/rfBpOT1gR3RvTl36WmR+
	 8MWkrpJ4LMSEzomqa8gUIUqA1HZMDFF6+PpTAYA4=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 23 Sep 2026 16:21:43 +0100
Subject: [PATCH v2 03/14] perf cs-etm: Break branch history when
 instruction memory is unavailable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-perf_cs_etm_fix_non_taken-v2-3-6ab8c07a5455@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790176913; l=1293;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=wi+zn9O1qBn5yWetnOxpHDcJ44qEdmWTjDLDoafQLSY=;
 b=k24/0ahZeLiRNnrB33kUsNhRAUML1zwRXvPDR6Jf8jGLim1vV4DejcevwOpoXQuEN5zMaWQYr
 eSUZ3XQ6GzrCMLhBEg77kMmYgfB3GBrb+FUe20xOHYt1jswDMKo+2Zr
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_082204_988022_45418898 
X-CRM114-Status: GOOD (  10.88  )
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

The decoder currently ignores OCSD_GEN_TRC_ELEM_ADDR_NACC, allowing a
subsequent range to be paired with stale branch history from before the
unreadable code.

Treat an inaccessible instruction address as a discontinuity and flush
the pending range and branch history before processing subsequent
elements.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 26940f1f1b0bf44c8671d80020597c672c361c1a..35ca1a23e12735416d0d412a949595efc5bfe50a 100644
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


