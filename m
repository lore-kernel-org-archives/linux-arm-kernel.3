Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400ECCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hnc2mUeAbjaG4HF8qFRvk87tmyTTYQ8ec61eQr9j9eM=; b=PfV+7pNSoukB2Y6KvtHsdwXMQ6
	HkF34TsZ9U6CCkap51h6PVeTUkwZRjTo4gNj8xc9ldn3cg+3+3Rs4FMKmi+ENnSugKrsh8Sas7AkT
	oPLIhf3VwR3+xqN0VLXJV1fVfelp2QEKT/57O+VHnadvDOcsD3m8wLYgoWUsh9fjuh0teN7XG0cL2
	S1ewPKmh9nHKQzPocIePYbBLz0uw/kMSAhsrTIrJBE20ch76xFIQUetJaEvwy8yAJ4kWEVO1Ekm4v
	4y5IFmluBZQisXrVkqQSdh+mdH3mnxJxU5IEF63DKWP92XWLOYWPpGhTFZdExuTxcI44t2HcKnzfj
	jblgMdtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFX0-00000009JjG-3ODS;
	Wed, 12 Nov 2025 18:25:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFWx-00000009JfM-2k9i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:25:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83C621515;
	Wed, 12 Nov 2025 10:25:11 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 504073F63F;
	Wed, 12 Nov 2025 10:25:17 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 12 Nov 2025 18:24:38 +0000
Subject: [PATCH v3 12/25] perf arm_spe: Report extended memory operations
 in records
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-perf_support_arm_spev1-3-v3-12-e63c9829f9d9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762971891; l=1324;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=IN1q4IBQZez4Gc/ZmEnYrKyLPI5UL1+SlIBjzXyHK0A=;
 b=gm7Ug7SfbufrC8gQNypKLowGc/kYYlopBFgaPUUnzEqs+elkD5cF/0ZlTiYoEYkp1fY66AYNs
 46Y9FMdykLQB/3rYRizpiiI+ROvXsBStnl4OOLRCln/NrQhtSxaz/rC
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_102519_746696_AF23256C 
X-CRM114-Status: UNSURE (   9.89  )
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

Extended memory operations include atomic (AT), acquire/release (AR),
and exclusive (EXCL) operations. Save the relevant information
in the records.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe-decoder/arm-spe-decoder.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
index 6696448bdf4f347e2032a1b4da46fcdd4016f9fc..949c20816826a4d45d6cf9a5efaa125acea90b0a 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
@@ -211,6 +211,13 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
 					decoder->record.op |= ARM_SPE_OP_NV_SYSREG;
 				} else if (SPE_OP_PKT_LDST_SUBCLASS_MTE_TAG(payload)) {
 					decoder->record.op |= ARM_SPE_OP_MTE_TAG;
+				} else if (SPE_OP_PKT_LDST_SUBCLASS_EXTENDED(payload)) {
+					if (payload & SPE_OP_PKT_AR)
+						decoder->record.op |= ARM_SPE_OP_AR;
+					if (payload & SPE_OP_PKT_EXCL)
+						decoder->record.op |= ARM_SPE_OP_EXCL;
+					if (payload & SPE_OP_PKT_AT)
+						decoder->record.op |= ARM_SPE_OP_ATOMIC;
 				} else if (SPE_OP_PKT_LDST_SUBCLASS_SVE_SME_REG(payload)) {
 					decoder->record.op |= ARM_SPE_OP_SVE;
 				}

-- 
2.34.1


