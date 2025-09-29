Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8807CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JDt+U5mg31jFW5fPMsOnddS69R5y2pKEahMNYUnRVk=; b=UwkFOY1v9HwwMG47rdXQH4YI97
	OnqQKwbtUrjlvM51pyswTsjE/IOrYj3n2xynLkgIxVGdl9ef8K0TjXgV0mEvy75E3pRo3U/tobTF8
	IPCeroL0DnDrliD1L5zNQ1ftqQcz1xtAstjqjNhOUTvdN1HdaYVl25srCskkhxba7ttBn/F2imaoG
	N6m9pCI2jgkyBDAh23mWuKj0Uos3K4eDd6fdHi54PZntFoHZLmaI5+amyy/3qnBIdSjqK+Ks71EIq
	4piL5iGHZ7wY/VAwfDIH7PRbwaywWaftNWzz37DeYCo8R0E7ZV5n2wlwAAs/yrFul9Zji16DH7HoT
	kr5MU6Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gtx-000000030E3-07iT;
	Mon, 29 Sep 2025 16:39:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GtS-00000002znw-2dHl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:38:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1632A1758;
	Mon, 29 Sep 2025 09:38:22 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B182E3F66E;
	Mon, 29 Sep 2025 09:38:28 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 29 Sep 2025 17:37:58 +0100
Subject: [PATCH 22/25] perf sort: Support sort ASE and SME
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-perf_support_arm_spev1-3-v1-22-1150b3c83857@arm.com>
References: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
In-Reply-To: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759163872; l=1594;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=O2JCKwZiq/8V3Xxbek8aiCCoU93jZthj0Zm90C2K5hU=;
 b=Hh6yzhTmHWVaSqklEuWWWA1Prr9Yngr304iLkQNyQjpGmMKNWl7+gZB+Ngy1CwyZpMxvzWyoj
 fLE14ZglA1KD2pehRXODrruZEXhyaezZD0geytLKGNiNn+zBiXUtq5q
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093830_728123_7947B54E 
X-CRM114-Status: GOOD (  12.79  )
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

Support sort Advance SIMD extension (ASE) and SME.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/sample.h | 9 ++++++---
 tools/perf/util/sort.c   | 4 ++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/sample.h b/tools/perf/util/sample.h
index fae834144ef42105d08a59704ee75cd4852bbc5a..405876885e1f273c039cb67187c6e5c39c91a612 100644
--- a/tools/perf/util/sample.h
+++ b/tools/perf/util/sample.h
@@ -67,12 +67,15 @@ struct aux_sample {
 };
 
 struct simd_flags {
-	u8	arch:1,	/* architecture (isa) */
-		pred:2;	/* predication */
+	u8	arch:  3,	/* architecture (isa) */
+		pred:  2,	/* predication */
+		resv:  3;	/* reserved */
 };
 
 /* simd architecture flags */
-#define SIMD_OP_FLAGS_ARCH_SVE		0x01	/* ARM SVE */
+#define SIMD_OP_FLAGS_ARCH_SVE		0x01	/* Arm SVE */
+#define SIMD_OP_FLAGS_ARCH_SME		0x02	/* Arm SME */
+#define SIMD_OP_FLAGS_ARCH_ASE		0x04	/* Arm Advanced SIMD */
 
 /* simd predicate flags */
 #define SIMD_OP_FLAGS_PRED_PARTIAL	0x01	/* partial predicate */
diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
index f3a565b0e2307a8adf159725f803df5fef0dff83..c7596e9ca089c170988dbc43a00f6973039261cd 100644
--- a/tools/perf/util/sort.c
+++ b/tools/perf/util/sort.c
@@ -195,6 +195,10 @@ static const char *hist_entry__get_simd_name(struct simd_flags *simd_flags)
 
 	if (arch & SIMD_OP_FLAGS_ARCH_SVE)
 		return "SVE";
+	if (arch & SIMD_OP_FLAGS_ARCH_SME)
+		return "SME";
+	if (arch & SIMD_OP_FLAGS_ARCH_ASE)
+		return "ASE";
 	else
 		return "n/a";
 }

-- 
2.34.1


