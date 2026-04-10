Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B561AE9904A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 07:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SESTM4Ovuw4pLW3E5UswVIQma+naSKNDeHNCAis7HIU=; b=R3avUwnfC+Fe66bl3J67tr/quw
	3eRSKvMAngG3aA2hwREKAYnSh/j0hzWNNs3kQO0rOfwgwcbpS1udkWfqQx3RpnNLAYOsjcd7NkrAN
	icArMt2CeTvUcaJSrTTwQiRbs2t8/jvvgSfroqYzVerJl7AHo8XGfzd9Cpn+UAEY+F1GoA1MCp/LN
	XZd5E14WOgPDIJAABGGXf1VdRij207qr3+Ed4FKVXUEBZVI/0Ckwxq0YlJK72REL4ZrCXGILEy60c
	kck2JWa8TyZbvmGDpTcnwwkDYUO0KcXWdFyGMAeI9hwgCEDYuAdiiGx0xWlk2peH93fP/RPRbXo7k
	9eS9kxgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6QT-0000000BkC7-3aGN;
	Fri, 10 Apr 2026 07:37:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6QP-0000000BkAr-33DI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 07:37:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15D351D15;
	Fri, 10 Apr 2026 00:37:03 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49B523FAF5;
	Fri, 10 Apr 2026 00:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775806628; bh=sT+Dto1iykaMgIS4XR6VGDBuVICmsWs7yPnEEI2WLVo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dmYlSCJ7IjIISOmwM2WCLXO7ff2FgYCnfog9flfg2joWincU0SvQVNxhaRF4DkedM
	 NxyGNVdj2nZC81oyMF4DlnVHAKYDJHyBgWhNASMYMMcyZnKb8TpD2wEVjgZujDReZf
	 JpXgSe6dStT8g769lH0SjH4pkm/jaG4U7bbQMQkk=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 10 Apr 2026 08:36:58 +0100
Subject: [PATCH v6 1/4] perf sort: Support sort ASE and SME
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-perf_support_arm_spev1-3-v6-1-3c6f2dfe2cd3@arm.com>
References: <20260410-perf_support_arm_spev1-3-v6-0-3c6f2dfe2cd3@arm.com>
In-Reply-To: <20260410-perf_support_arm_spev1-3-v6-0-3c6f2dfe2cd3@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775806625; l=1838;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=sT+Dto1iykaMgIS4XR6VGDBuVICmsWs7yPnEEI2WLVo=;
 b=/3VzkdTZ5Rkpd/+94VUgObMeZBVEs1W9IKe2eNSw+9wRKmPtuzrN7pS9pD5buzq9X1YyF0fd3
 HXjmMxi+W/6DzTeP4AqCRtcyelxbI+ZhIhOzI+pw73pl7PR6lhC24a/
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_003709_808060_3A921A41 
X-CRM114-Status: GOOD (  12.70  )
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

Reviewed-by: James Clark <james.clark@linaro.org>
Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/sample.h | 12 +++++++++---
 tools/perf/util/sort.c   |  6 +++++-
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/sample.h b/tools/perf/util/sample.h
index 3d27a0daef8fb2d72ffa8510923857e73130dd40..0e5ee7e0fb94f2d36c35df15de7c4ea00547a6c2 100644
--- a/tools/perf/util/sample.h
+++ b/tools/perf/util/sample.h
@@ -71,12 +71,18 @@ struct aux_sample {
 };
 
 struct simd_flags {
-	u8	arch:1,	/* architecture (isa) */
-		pred:2;	/* predication */
+	u8	arch:  2,	/* architecture (isa) */
+		pred:  2,	/* predication */
+		resv:  4;	/* reserved */
 };
 
 /* simd architecture flags */
-#define SIMD_OP_FLAGS_ARCH_SVE		0x01	/* ARM SVE */
+enum simd_op_flags {
+	SIMD_OP_FLAGS_ARCH_NONE = 0x0,	/* No SIMD operation */
+	SIMD_OP_FLAGS_ARCH_SVE,		/* Arm SVE */
+	SIMD_OP_FLAGS_ARCH_SME,		/* Arm SME */
+	SIMD_OP_FLAGS_ARCH_ASE,		/* Arm Advanced SIMD */
+};
 
 /* simd predicate flags */
 #define SIMD_OP_FLAGS_PRED_PARTIAL	0x01	/* partial predicate */
diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
index 6ce684d68bd61edba2df16806d8a8f18132617db..7198eb3ae560cdac762a7d233d19bd6c70903d39 100644
--- a/tools/perf/util/sort.c
+++ b/tools/perf/util/sort.c
@@ -195,8 +195,12 @@ static const char *hist_entry__get_simd_name(struct simd_flags *simd_flags)
 {
 	u64 arch = simd_flags->arch;
 
-	if (arch & SIMD_OP_FLAGS_ARCH_SVE)
+	if (arch == SIMD_OP_FLAGS_ARCH_SVE)
 		return "SVE";
+	else if (arch == SIMD_OP_FLAGS_ARCH_SME)
+		return "SME";
+	else if (arch == SIMD_OP_FLAGS_ARCH_ASE)
+		return "ASE";
 	else
 		return "n/a";
 }

-- 
2.34.1


