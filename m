Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9A3CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+q4tuIYVP7tFZUg4GJPwHPFaDPPEFgUkCMeus59NRqI=; b=3rZGyHIBz6R5aqQkP2QKRvBm5P
	XVJT/pjSH/DmVFb4faPO2mlamM5zd/G3Uut3YWE32XXZ5xIhbXYiPHMnjDGOSSX8KW3CQJjCJHAp4
	D0AK3BWfG/dUs2Z1hQhSDcGc4ZZVv4wkqioNvRfJIfgCT7ryVvT9DJtHb7ULCktbkVEYwhQy0wQLW
	8bmCar2YsuzQMXs/6lvcu76ikupfMKeFDSDasU81fxYH/EG7ORsfzm7tTTrSxmtVRCsYondolt1Al
	JMDI4kSZTbfH94pU742wlzlQ+1JtmoqzP3p6GobKG6SojwtUe9XCfsn3wKPW7omdIUJ9yFwGnY/76
	S3ZM28eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hKn-00000007PWl-1DXm;
	Fri, 17 Oct 2025 10:05:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hKk-00000007PTh-1E38
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:05:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E557C1596;
	Fri, 17 Oct 2025 03:05:05 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73D143F59E;
	Fri, 17 Oct 2025 03:05:12 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 17 Oct 2025 11:04:52 +0100
Subject: [PATCH v2 03/25] perf arm_spe: Decode GCS operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-perf_support_arm_spev1-3-v2-3-2d41e4746e1b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760695507; l=2306;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=AI7UBaNe19y2ZmOnZ10XQZCilrMUPhEQMhX054AblbQ=;
 b=saS9Y+yl20L3IZCJAST4fGGclNj8Yx67kKxOEMVQ2qqHXvr8n9qInlkUbTUMp2NRH3V61Odhc
 5a3RG49U8/SDGKWIIPVy4Vm+cPp0gMMI1bgbrPaqo2ooiHzHMdJNZgM
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030514_473218_7732BFC0 
X-CRM114-Status: UNSURE (   9.56  )
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

Decode a load or store from a GCS operation and the associated "common"
field.

After:

  .  00000000:  49 44                                           LD GCS COMM
  .  00000002:  b2 18 3c d7 83 00 80 ff ff                      VA 0xffff800083d73c18
  .  0000000b:  9a 00 00                                        LAT 0 XLAT
  .  0000000e:  43 00                                           DATA-SOURCE 0

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c | 4 ++++
 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index f6e9c58ce62f3ae227a79d91caefaef4bd87d98a..0046079edaccdd4d0c093f73395d1ecdc0007621 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
@@ -394,6 +394,10 @@ static int arm_spe_pkt_desc_op_type(const struct arm_spe_pkt *packet,
 				arm_spe_pkt_out_string(&err, &buf, &buf_len, " PRED");
 			if (payload & SPE_OP_PKT_SVE_SG)
 				arm_spe_pkt_out_string(&err, &buf, &buf_len, " SG");
+		} else if (SPE_OP_PKT_LDST_SUBCLASS_GCS(payload)) {
+			arm_spe_pkt_out_string(&err, &buf, &buf_len, " GCS");
+			if (payload & SPE_OP_PKT_GCS_COMM)
+				arm_spe_pkt_out_string(&err, &buf, &buf_len, " COMM");
 		}
 		break;
 	case SPE_OP_PKT_HDR_CLASS_BR_ERET:
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
index cb947e625918922dc1fa25cf8843b09661197782..94333e7bc382deef119414e4f1de7c2878620035 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
@@ -154,6 +154,10 @@ enum arm_spe_events {
 #define SPE_OP_PKT_SVE_PRED			BIT(2)
 #define SPE_OP_PKT_SVE_FP			BIT(1)
 
+#define SPE_OP_PKT_LDST_SUBCLASS_GCS(v)		(((v) & (GENMASK_ULL(7, 3) | BIT(1))) == 0x40)
+
+#define SPE_OP_PKT_GCS_COMM			BIT(2)
+
 #define SPE_OP_PKT_CR_MASK			GENMASK_ULL(4, 3)
 #define SPE_OP_PKT_CR_BL(v)			(FIELD_GET(SPE_OP_PKT_CR_MASK, (v)) == 1)
 #define SPE_OP_PKT_CR_RET(v)			(FIELD_GET(SPE_OP_PKT_CR_MASK, (v)) == 2)

-- 
2.34.1


