Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43A7CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UV6sISLO4w8eGHUIdDrjvmSz9Ea/WUvFisToxeVjPY=; b=bNVlwqzDZU9SqDOhzQrAcWpDGy
	u0qjx5/Qq38mw4PaZi6cOCgD5UlLBQ4+bWXm65Pw29IwWDlzIk6ZxAXFjgsr6hWMxB4Ps+yn8ud3o
	VVP/DwnNq+5ICMBJocHcpOijwh341eEna3OjzK1YNma+3+U8+Yfj9GghBwdjQlY9038U3v2KGET/P
	/GSzgAYRRPiSQ2ZaegY9DZUG2JbjYU3+gFN8VjyJbl8f6jKvY/Vw7FZ6MAnSIvW1nzSw25djp+YSq
	RLR1PD2QdD/xLx/+MM0aF8gXEIRp3LayT0SF5XavFXkS0hVAtzv+VeXMm6PX+3Xqurxb86GGc/xzP
	glKUcRoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hKv-00000007PfD-0j29;
	Fri, 17 Oct 2025 10:05:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hKq-00000007Pao-3Wlf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:05:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85DFC1596;
	Fri, 17 Oct 2025 03:05:12 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13F423F59E;
	Fri, 17 Oct 2025 03:05:18 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 17 Oct 2025 11:04:56 +0100
Subject: [PATCH v2 07/25] perf arm_spe: Remove unused operation types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-perf_support_arm_spev1-3-v2-7-2d41e4746e1b@arm.com>
References: <20251017-perf_support_arm_spev1-3-v2-0-2d41e4746e1b@arm.com>
In-Reply-To: <20251017-perf_support_arm_spev1-3-v2-0-2d41e4746e1b@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760695507; l=1210;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=b0PllY8RWLZry/bueun+VAsGue4qV9iwUC/TXi6VS1k=;
 b=GXv+7c8tcqC5vqMffBQDOJPLRkvRKO9BBF/BtahDw+E4YkZKYR8s5n7BMNjvlLr2P8OJ+GbT+
 gVczEtyWtVzCdif8iE9OQLAak78ginUxhbrp46A8aMwAfNnoJ8ewKvV
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030520_936511_0FE17BC7 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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

Remove unused SVE operation types. These operations will be reintroduced
in subsequent refactoring, but with a different format.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
index fbb57f8052371e51d562d9dd6098e97fc099461c..1259cbadfdc8098019afcd4cf65e733475310392 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
@@ -39,8 +39,6 @@ enum arm_spe_op_type {
 
 	/* Second level operation type for OTHER */
 	ARM_SPE_OP_SVE_OTHER		= 1 << 16,
-	ARM_SPE_OP_SVE_FP		= 1 << 17,
-	ARM_SPE_OP_SVE_PRED_OTHER	= 1 << 18,
 
 	/* Second level operation type for LDST */
 	ARM_SPE_OP_LD			= 1 << 16,
@@ -53,8 +51,6 @@ enum arm_spe_op_type {
 	ARM_SPE_OP_UNSPEC_REG		= 1 << 23,
 	ARM_SPE_OP_NV_SYSREG		= 1 << 24,
 	ARM_SPE_OP_SVE_LDST		= 1 << 25,
-	ARM_SPE_OP_SVE_PRED_LDST	= 1 << 26,
-	ARM_SPE_OP_SVE_SG		= 1 << 27,
 
 	/* Second level operation type for BRANCH_ERET */
 	ARM_SPE_OP_BR_COND		= 1 << 16,

-- 
2.34.1


