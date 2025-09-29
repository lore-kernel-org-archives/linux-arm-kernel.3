Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50542CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtmqNZExTpOoWoC+piJmNvBBjNMhWOel9iqpkSCV1+Y=; b=hvqUgSxXVM+U4ADwBiXfSykpBi
	FTo2j6U/iipfypiMv6QXDmWiLEMmjzxHELrAwGhkUzKoR78h7lUV4waZd1dJULDyT07kfURpnpOyD
	TFf3kw1lB2XEtcbvMFiCnzT+iTFfootajnxCGZB53XUlAVU3Ic/M7UztebxASWSaANCbQ9Etzl5pV
	4Km4ZeH+k3Cj5kERwv52Xp5bCTqUtOYMtNWiKEf2KDvRM4lRU8Ne9ce02DT0utdQ1R9mSqnjA6Bp3
	AtQfYH0DvYvlCxb71EhS8i+ULV86Fb+oKA7piA0fVFjyjX5XlDpbtjqnIXdet+hgGftzmEGEMpZ2w
	tcS6rTbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gt8-00000002zSf-2eY0;
	Mon, 29 Sep 2025 16:38:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Gt2-00000002zMV-0ss1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:38:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B66BC1758;
	Mon, 29 Sep 2025 09:37:55 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D4803F66E;
	Mon, 29 Sep 2025 09:38:02 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 29 Sep 2025 17:37:42 +0100
Subject: [PATCH 06/25] perf arm_spe: Decode SME data processing packet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-perf_support_arm_spev1-3-v1-6-1150b3c83857@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759163872; l=3212;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Eh/nqOU+QofsS2OSXnw9Q/W0xybJNqrLOXhmO4OxKOw=;
 b=LXJt9FIyZoSe3Z2XMq0XFbTm42+9tLetEQthIxqzpb8HdmYS6jt0qEtXRZMcgKGjUi0dJSTy9
 qcn0WxjkUHZDoCAg8/Jqpc1YnWCEiror5gBZfoe4zmILem3btS5JurJ
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_093804_399208_5E0368ED 
X-CRM114-Status: GOOD (  10.87  )
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

For SME data processing, decode its Effective vector length or Tile Size
(ETS), and print out if a floating-point operation.

After:

  .  00000000:  49 00                                           SME-OTHER ETS 1024 FP
  .  00000002:  b2 18 3c d7 83 00 80 ff ff                      VA 0xffff800083d73c18
  .  0000000b:  9a 00 00                                        LAT 0 XLAT
  .  0000000e:  43 00                                           DATA-SOURCE 0

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c |  9 +++++++++
 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h | 11 +++++++++++
 2 files changed, 20 insertions(+)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index 21b65a9b40f481b6cb25aaf01ab627ade046ff72..5769ba2f414049161f271fd8b8f40c440d15a75a 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
@@ -351,6 +351,15 @@ static int arm_spe_pkt_desc_op_type(const struct arm_spe_pkt *packet,
 				arm_spe_pkt_out_string(&err, &buf, &buf_len, " FP");
 			if (payload & SPE_OP_PKT_SVE_PRED)
 				arm_spe_pkt_out_string(&err, &buf, &buf_len, " PRED");
+		} else if (SPE_OP_PKT_OTHER_SUBCLASS_SME(payload)) {
+			arm_spe_pkt_out_string(&err, &buf, &buf_len, "SME-OTHER");
+
+			/* SME effective vector length or tile size */
+			arm_spe_pkt_out_string(&err, &buf, &buf_len, " ETS %d",
+					       SPE_OP_PKG_SME_ETS(payload));
+
+			if (payload & SPE_OP_PKT_OTHER_FP)
+				arm_spe_pkt_out_string(&err, &buf, &buf_len, " FP");
 		} else if (SPE_OP_PKT_OTHER_SUBCLASS_OTHER(payload)) {
 			arm_spe_pkt_out_string(&err, &buf, &buf_len, "OTHER");
 			if (payload & SPE_OP_PKT_OTHER_ASE)
diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
index 704601c6dbe30e93f83a82670d0d60344a22222a..adf4cde320aad01265b5232b0d6ff6b1f752f35f 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
@@ -125,10 +125,21 @@ enum arm_spe_events {
 
 #define SPE_OP_PKT_OTHER_SUBCLASS_OTHER(v)	(((v) & GENMASK_ULL(7, 3)) == 0x0)
 #define SPE_OP_PKT_OTHER_SUBCLASS_SVE(v)	(((v) & (BIT(7) | BIT(3) | BIT(0))) == 0x8)
+#define SPE_OP_PKT_OTHER_SUBCLASS_SME(v)	(((v) & (BIT(7) | BIT(3) | BIT(0))) == 0x88)
 
 #define SPE_OP_PKT_OTHER_ASE			BIT(2)
 #define SPE_OP_PKT_OTHER_FP			BIT(1)
 
+/*
+ * SME effective vector length or tile size (ETS) is stored in byte 0
+ * bits [6:4,2]; the length is rounded up to a power of two and use 128
+ * as one step, so ETS calculation is:
+ *
+ *   128 * (2 ^ bits [6:4,2]) = 32 << (bits [6:4,2])
+ */
+#define SPE_OP_PKG_SME_ETS(v)			(128 << (FIELD_GET(GENMASK_ULL(6, 4), (v)) << 1 | \
+							(FIELD_GET(BIT(2), (v)))))
+
 #define SPE_OP_PKT_LDST_SUBCLASS_GP_REG(v)	(((v) & GENMASK_ULL(7, 1)) == 0x0)
 #define SPE_OP_PKT_LDST_SUBCLASS_SIMD_FP(v)	(((v) & GENMASK_ULL(7, 1)) == 0x4)
 #define SPE_OP_PKT_LDST_SUBCLASS_UNSPEC_REG(v)	(((v) & GENMASK_ULL(7, 1)) == 0x10)

-- 
2.34.1


