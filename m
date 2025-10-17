Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4A0CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EmjDPTVTEQtw4C56BW15lH+yjoMvIUdobS10UjSP3JY=; b=hMwcTrMu6Gdor0V40wkSC0x4VE
	1Sh1uKV+iDxNBRIlPDI4+eeg6vY6dM5abhQhL3rmQnaE7zj+Qzuuh9Zu2xHQHubC49962b8KHzCjL
	qSimw6YbMhTGEZA4ccrKW342pE3n3EWMqHBEF6B3iOUrMotR9lMsJdhuhip76TEvgZObWR5Cqa2fe
	ydygdP2s6FrLVjN2EfQ9i0aWxSulX0oHnkgFkhY9AeMsL88sxx9MoqLqb21NPJo+uKiawOIIeodyq
	ecGA6BirMvsqx8xMGXOsXaoihLCRemQz7NVM9v/1YGS41LISrOtI88G4eWhFFtT+QSTYCsIDNc6PF
	40xEWETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hKu-00000007Pdn-25aL;
	Fri, 17 Oct 2025 10:05:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hKn-00000007PXE-2gJF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:05:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B60C1C14;
	Fri, 17 Oct 2025 03:05:09 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE29B3F59E;
	Fri, 17 Oct 2025 03:05:15 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 17 Oct 2025 11:04:54 +0100
Subject: [PATCH v2 05/25] perf arm_spe: Decode ASE and FP fields in other
 operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-perf_support_arm_spev1-3-v2-5-2d41e4746e1b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760695507; l=2769;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=N0jNmX4wH1J25D1rmsic2Y5Tu8VYPddY1OtkCA2TvqI=;
 b=66JwCbDx9O+k8fTscIAFDpGlP7GzRLaLBxsrFf1+YAFxQnOTiNxwAk2IpYVSmm+Lh2vPtrUgy
 TifUQ8K6XkLBnnrPXOuDXur9sVeDLuB8PEoQEvuLFGEUXxNEk4rPmII
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030517_815169_C4434B54 
X-CRM114-Status: GOOD (  10.47  )
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

Add a check for other operation, which prevents any incorrectly
classifying. Parse the ASE and FP fields.

After:

  .  0000002f:  48 06                                           OTHER ASE FP INSN-OTHER
  .  00000031:  b2 08 80 48 01 08 00 ff ff                      VA 0xffff000801488008
  .  0000003a:  9a 00 00                                        LAT 0 XLAT
  .  0000003d:  42 16                                           EV RETIRED L1D-ACCESS TLB-ACCESS

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c | 6 +++++-
 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h | 4 ++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index 533920b738cbcb39136d1ba3d88e99f9d8009e74..21b65a9b40f481b6cb25aaf01ab627ade046ff72 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
@@ -351,8 +351,12 @@ static int arm_spe_pkt_desc_op_type(const struct arm_spe_pkt *packet,
 				arm_spe_pkt_out_string(&err, &buf, &buf_len, " FP");
 			if (payload & SPE_OP_PKT_SVE_PRED)
 				arm_spe_pkt_out_string(&err, &buf, &buf_len, " PRED");
-		} else {
+		} else if (SPE_OP_PKT_OTHER_SUBCLASS_OTHER(payload)) {
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, "OTHER");
+			if (payload & SPE_OP_PKT_OTHER_ASE)
+				arm_spe_pkt_out_string(&err, &buf, &buf_len, " ASE");
+			if (payload & SPE_OP_PKT_OTHER_FP)
+				arm_spe_pkt_out_string(&err, &buf, &buf_len, " FP");
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, " %s",
 					       payload & SPE_OP_PKT_COND ?
 					       "COND-SELECT" : "INSN-OTHER");
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
index 48bd9e9ef132b11b79ffe2e2fbc7cfe4c340ff92..704601c6dbe30e93f83a82670d0d60344a22222a 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
@@ -123,8 +123,12 @@ enum arm_spe_events {
 #define SPE_OP_PKT_HDR_CLASS_LD_ST_ATOMIC	0x1
 #define SPE_OP_PKT_HDR_CLASS_BR_ERET		0x2
 
+#define SPE_OP_PKT_OTHER_SUBCLASS_OTHER(v)	(((v) & GENMASK_ULL(7, 3)) == 0x0)
 #define SPE_OP_PKT_OTHER_SUBCLASS_SVE(v)	(((v) & (BIT(7) | BIT(3) | BIT(0))) == 0x8)
 
+#define SPE_OP_PKT_OTHER_ASE			BIT(2)
+#define SPE_OP_PKT_OTHER_FP			BIT(1)
+
 #define SPE_OP_PKT_LDST_SUBCLASS_GP_REG(v)	(((v) & GENMASK_ULL(7, 1)) == 0x0)
 #define SPE_OP_PKT_LDST_SUBCLASS_SIMD_FP(v)	(((v) & GENMASK_ULL(7, 1)) == 0x4)
 #define SPE_OP_PKT_LDST_SUBCLASS_UNSPEC_REG(v)	(((v) & GENMASK_ULL(7, 1)) == 0x10)

-- 
2.34.1


