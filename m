Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6451073C82
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KpBkvXoWMaREiHwfE8NrZ0xdjSUtM8ms57ph18B9uZ8=; b=PGx65gC1RScLYVVweFOfRsmLcM
	TL29+3MV3eA7Kh1tD6J3BdAEtRU2m/aa7A8bpPfRbddRRkhgPCUTqkoLbw32Xt1H++HrEVPrf2tEX
	K48/eENepe42Zgaian7FV9MJEkwwW7hYHG4jpxXHL03g7J7zbEVpAK8UUu0npQMC7rPFTVSums00x
	wlG/QRjYInlZW1Yo7jXbQx+wH+sbWP5Mz7FpOOuaSz8RDkSF1wltiL7E4Nd9qSQcpPz1ySqQB104s
	kaLS5Bfmddeio2a7w9zRqd3aAsafY8l2gx9euL/eTdqpTYHtbOMlw/EKhdlQ4zG4ionOjmstMW5Xm
	PamBS5Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPRg-00000008dGZ-0NBp;
	Wed, 08 Apr 2026 09:43:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPRd-00000008dFQ-2GBL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:43:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3069C32E3;
	Wed,  8 Apr 2026 02:43:26 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E0493F641;
	Wed,  8 Apr 2026 02:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775641411; bh=EfovEt/+pDg6M+HIkNdZubv3GBaXYR/cbM7RTckIW4M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mmwTb/48ICnuGc7pZS/OynOOnQUOqp/8UJ9SIy2MX5hBIfz8s9dsLXLX0dIOYrZm2
	 PMjgeOUjOO5CSk84JafJat2w4h+ovMS++rErvJGJZmYl1GyGe1L+AQfQgcdf1L1iJr
	 pd1NFBSlFEanPPZpNeRevdztzodwPfhNoYzdtjUo=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 08 Apr 2026 10:42:31 +0100
Subject: [PATCH v5 1/4] perf sort: Support sort ASE and SME
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-perf_support_arm_spev1-3-v5-1-b5bcea6217bb@arm.com>
References: <20260408-perf_support_arm_spev1-3-v5-0-b5bcea6217bb@arm.com>
In-Reply-To: <20260408-perf_support_arm_spev1-3-v5-0-b5bcea6217bb@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775641408; l=1838;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=EfovEt/+pDg6M+HIkNdZubv3GBaXYR/cbM7RTckIW4M=;
 b=kuW4WZuKarGhOd9GVLJh03EeD8j5qQzfWEOqCe9Zxd4iOZXTHH+MTUcAEoIY1u9HsgjV46PNy
 u3x23EhzPW1AIVFcUI+yvaVZPaDodrGtLcK+DepENjSrSIeTEVdTfTg
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_024333_617562_AFCB8853 
X-CRM114-Status: GOOD (  12.52  )
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
index 5c9656cc4f9dacdb66351543c103ddd3cee6860a..69ecc5be0488c749a11fe9912375d8e5408175bf 100644
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


