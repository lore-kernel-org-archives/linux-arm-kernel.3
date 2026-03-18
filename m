Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA88010706E8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 10:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+4Piwuv7FUWhg5/JGbXFFZg6GM+JMj2yuCa07l1n5E=; b=HZbWfgNNXbTnuRttOTIsfXLsFx
	6LAZzbQoXPuywLpIuep8urRTdm0Pq8whVahQJbA+H2Aj9hwJHQa37Kdtrx9AuEsOz5xF+J83VS66H
	rBePHgizZKUhVzmKWMteVo2BjwjVHww3QwF28jHRsvWLMWzI4FxoJdGYD066Mx+i3WT7Mg0tJBHL/
	sdL53tdqnZaKq+ZTEcDoY0EKow+Ry1XzepgnbZqEUfOe6+hULDQc8JsZAAprXJ5sn/IHzDYOYVVoO
	vl4qxSGqCF/WEw/EBcNP5euhQTW0aYwJQwgEy4qfYTq59rm9Tw4vWQ7hpTEomWR54FgF12pq/MNDT
	v0gwBd9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oGi-00000008DZs-3ZOr;
	Wed, 18 Mar 2026 10:36:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oGf-00000008DZA-2797
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 10:36:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E23A1E7D;
	Wed, 18 Mar 2026 03:36:41 -0700 (PDT)
Received: from e142892.manchester.arm.com (e142892.arm.com [10.33.8.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1DB733F778;
	Wed, 18 Mar 2026 03:36:45 -0700 (PDT)
From: Mike Leach <mike.leach@arm.com>
To: linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	acme@kernel.org
Cc: suzuki.poulose@arm.com,
	leo.yan@arm.com,
	james.clark@linaro.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@redhat.com,
	namhyung@kernel.org,
	irogers@google.com,
	Mike Leach <mike.leach@arm.com>
Subject: [PATCH v2 2/2] perf: tools: cs-etm: Enhance raw Coresight trace debug display
Date: Wed, 18 Mar 2026 10:36:40 +0000
Message-ID: <20260318103640.464982-2-mike.leach@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318103640.464982-1-mike.leach@arm.com>
References: <20260318103640.464982-1-mike.leach@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_033649_657817_EB2C13E5 
X-CRM114-Status: GOOD (  11.39  )
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

When compiling perf with CORESIGHT=1, an additional build option may
be used: CSTRACE_RAW=1, which will cause the CoreSight formatted trace
frames to be printed out during a perf --dump command. This is useful
when investigating issues with trace generation, decode or possible
data corruption.

e.g. for ETMv4 trace source into a formatted ETR sink a dump -

. ... CoreSight ETMV4I Trace data: size 0x28c150 bytes
Idx:0; ID:14;	I_ASYNC : Alignment Synchronisation.
Idx:12; ID:14;	I_TRACE_INFO : Trace Info.; INFO=0x0 { CC.0 };
                Decoder Sync point TINFO
Idx:17; ID:14;	I_ADDR_L_64IS0 : Address, Long, 64 bit, IS0.;
                Addr=0x0000000000000000;

becomes with CSTRACE_RAW=1:

. ... CoreSight ETMV4I Trace data: size 0x28c150 bytes
Frame Data; Index 0; ID_DATA[0x14]; 00 00 00 00 00 00 00 00
                                    00 00 00 80 01 01
Idx:0; ID:14;	I_ASYNC : Alignment Synchronisation.
Frame Data; Index 16; ID_DATA[0x14]; 00 9d 00 00 00 00 00 00
                                     00 00 04 85 57 08 f2
Idx:12; ID:14;	I_TRACE_INFO : Trace Info.; INFO=0x0 { CC.0 };
                Decoder Sync point TINFO
Idx:17; ID:14;	I_ADDR_L_64IS0 : Address, Long, 64 bit, IS0.;
                Addr=0x0000000000000000;

CSTRACE_RAW=1 has no effect on ETE + TRBE trace as there is no trace
formatting in the TRBE buffer.

This patch enhances the output so that for each packet the individual
bytes associated with the packet are printed.

Thus for ETMv4 this now becomes:

. ... CoreSight ETMV4I Trace data: size 0x28c150 bytes
Frame Data; Index 0; ID_DATA[0x14]; 00 00 00 00 00 00 00 00
                                    00 00 00 80 01 01
Idx:0; ID:14;[0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x80];
             I_ASYNC : Alignment Synchronisation.
Frame Data; Index 16; ID_DATA[0x14]; 00 9d 00 00 00 00 00 00
                                     00 00 04 85 57 08 f2
Idx:12; ID:14; [0x01 0x01 0x00 ]; I_TRACE_INFO : Trace Info.; INFO=0x0
                                  { CC.0 }; Decoder Sync point TINFO
Idx:17; ID:14; [0x9d 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 ];
               I_ADDR_L_64IS0 : Address, Long, 64 bit, IS0.;
	       Addr=0x0000000000000000;

ETE trace output changes from:

Idx:0; ID:14; I_ASYNC : Alignment Synchronisation.
Idx:12; ID:14; I_TRACE_INFO : Trace Info.; INFO=0x0 { CC.0, TSTATE.0 };
               Decoder Sync point TINFO
Idx:15; ID:14; I_ADDR_L_64IS0 : Address, Long, 64 bit, IS0.;
               Addr=0xFFFF80007CF7F56C;
becoming:

Idx:0; ID:14;[0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x80];
              I_ASYNC : Alignment Synchronisation.
Idx:12; ID:14; [0x01 0x01 0x00 ]; I_TRACE_INFO : Trace Info.; INFO=0x0
               { CC.0, TSTATE.0 }; Decoder Sync point TINFO
Idx:15; ID:14; [0x9d 0x5b 0x7a 0xf7 0x7c 0x00 0x80 0xff 0xff ];
               I_ADDR_L_64IS0 : Address, Long, 64 bit, IS0.;
	       Addr=0xFFFF80007CF7F56C;

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Mike Leach <mike.leach@arm.com>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 8592a778b26a..91d3feb18aaf 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -22,12 +22,15 @@
 /* use raw logging */
 #ifdef CS_DEBUG_RAW
 #define CS_LOG_RAW_FRAMES
+#define CS_PKT_MON	1
 #ifdef CS_RAW_PACKED
 #define CS_RAW_DEBUG_FLAGS (OCSD_DFRMTR_UNPACKED_RAW_OUT | \
 			    OCSD_DFRMTR_PACKED_RAW_OUT)
 #else
 #define CS_RAW_DEBUG_FLAGS (OCSD_DFRMTR_UNPACKED_RAW_OUT)
 #endif
+#else
+#define CS_PKT_MON	0
 #endif
 
 /*
@@ -664,7 +667,7 @@ cs_etm_decoder__create_etm_decoder(struct cs_etm_decoder_params *d_params,
 					   trace_config, &csid))
 			return -1;
 
-		if (ocsd_dt_set_pkt_protocol_printer(decoder->dcd_tree, csid, 0))
+		if (ocsd_dt_set_pkt_protocol_printer(decoder->dcd_tree, csid, CS_PKT_MON))
 			return -1;
 
 		return 0;
-- 
2.43.0


