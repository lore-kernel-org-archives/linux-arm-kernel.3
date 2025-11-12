Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0A4CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qrhVqeHf6fqxEOD5Qqq0ok4gDvzJsVnqdabHmih6mc=; b=y18AjrJYw6zT36HS3kkTevmW/G
	pv7D6NykLhZIEKAVpsYju7SrxchoJZlmtZ8k8oXjtMGUutIBB9edlxAuhcTa8y6fScoFv6v8M9E6y
	WZZo4B2JELkQUFkItDUweChfO0rD4WutWKxtFlzitWL6+I5RPDZeJgFFBO6i36gawqGAJl6F4aKIo
	e/sGjbRNwqQa9G5Sqo4Bvg4CiRUpjDoKLFDXi/NcUdK1IFC3X3EKHGkeN6aID37RxfCPq3Y+uAnc5
	6gHUzOHajCwLwfudmcp0NUYfdrCLam8hDNm7hVLrGjU41COJEjauApGYJnJhvaN2Z0stAtWmEy1FS
	aJRDLwCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFWl-00000009JVO-1r28;
	Wed, 12 Nov 2025 18:25:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFWg-00000009JTT-24cO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:25:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32F911595;
	Wed, 12 Nov 2025 10:24:54 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F02B13F63F;
	Wed, 12 Nov 2025 10:24:59 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 12 Nov 2025 18:24:30 +0000
Subject: [PATCH v3 04/25] perf arm_spe: Rename SPE_OP_PKT_IS_OTHER_SVE_OP
 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-perf_support_arm_spev1-3-v3-4-e63c9829f9d9@arm.com>
References: <20251112-perf_support_arm_spev1-3-v3-0-e63c9829f9d9@arm.com>
In-Reply-To: <20251112-perf_support_arm_spev1-3-v3-0-e63c9829f9d9@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762971890; l=2605;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=zixE5i3+mSZRJrxDBxY30q3IwlWCPYbQatyMldJsYEw=;
 b=bZDR+bsM4PrMy/Y2HfaDaz672uS7iKE+SzxXAxWYD2s0EftIqYcnu5lW0vP5AirkrfYgTGLHY
 WiU81mQEU77Dv1VL5hBnzB/2RVK/8OZ/V+8wm/1CjRifk5sAph7s6Zm
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_102502_672414_684D8A02 
X-CRM114-Status: GOOD (  11.55  )
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

Rename the macro to SPE_OP_PKT_OTHER_SUBCLASS_SVE to unify naming.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c     | 2 +-
 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c | 2 +-
 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index b0fb896abad48de93aa1ed560029f9bc9ae969e9..847c29385bea8618e14b2eb21a08896041890d89 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -205,7 +205,7 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 				break;
 			case SPE_OP_PKT_HDR_CLASS_OTHER:
 				decoder->record.op |= ARM_SPE_OP_OTHER;
-				if (SPE_OP_PKT_IS_OTHER_SVE_OP(payload))
+				if (SPE_OP_PKT_OTHER_SUBCLASS_SVE(payload))
 					decoder->record.op |= ARM_SPE_OP_SVE_OTHER;
 				break;
 			case SPE_OP_PKT_HDR_CLASS_BR_ERET:
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index 0046079edaccdd4d0c093f73395d1ecdc0007621..533920b738cbcb39136d1ba3d88e99f9d8009e74 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
@@ -340,7 +340,7 @@ static int arm_spe_pkt_desc_op_type(const struct arm_spe_pkt *packet,
 
 	switch (packet->index) {
 	case SPE_OP_PKT_HDR_CLASS_OTHER:
-		if (SPE_OP_PKT_IS_OTHER_SVE_OP(payload)) {
+		if (SPE_OP_PKT_OTHER_SUBCLASS_SVE(payload)) {
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, "SVE-OTHER");
 
 			/* SVE effective vector length */
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
index 94333e7bc382deef119414e4f1de7c2878620035..48bd9e9ef132b11b79ffe2e2fbc7cfe4c340ff92 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
@@ -123,7 +123,7 @@ enum arm_spe_events {
 #define SPE_OP_PKT_HDR_CLASS_LD_ST_ATOMIC	0x1
 #define SPE_OP_PKT_HDR_CLASS_BR_ERET		0x2
 
-#define SPE_OP_PKT_IS_OTHER_SVE_OP(v)		(((v) & (BIT(7) | BIT(3) | BIT(0))) == 0x8)
+#define SPE_OP_PKT_OTHER_SUBCLASS_SVE(v)	(((v) & (BIT(7) | BIT(3) | BIT(0))) == 0x8)
 
 #define SPE_OP_PKT_LDST_SUBCLASS_GP_REG(v)	(((v) & GENMASK_ULL(7, 1)) == 0x0)
 #define SPE_OP_PKT_LDST_SUBCLASS_SIMD_FP(v)	(((v) & GENMASK_ULL(7, 1)) == 0x4)

-- 
2.34.1


