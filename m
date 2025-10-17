Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB7ECCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hnc2mUeAbjaG4HF8qFRvk87tmyTTYQ8ec61eQr9j9eM=; b=4QJWZK2DUPCCm2ZSmxA73h6MlE
	q0fvkkEWL76hquQooS+lt4lTel9IdBZLy6/xH5/2j86Ip7RzQ080oD+2o3TfDveX0At9YdHZu3Y0J
	dC3ww1yNTJXDteHRYcjCmk0brqFW21QvSyyeSl6isw5miA7o7X+U0ISuZ2SzR3nZitb/WJghm0TkV
	Ua+cBVi73oMikjcIiFxb5N7rHRXtejKhQukeyV5FlnbIkcr+6Esq7p50H+9DYv3BcLmvyTW4j6W71
	Z+3eT6Mfm1cnKs0rIAPUekAhGGdE8ADBbrZ7x7naaFoCyytjqQ17Mm5fDpzO8YCjHFrHwf/uJ/Ggx
	oALfSgqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hL6-00000007PtD-1GJN;
	Fri, 17 Oct 2025 10:05:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hKz-00000007PkC-0ZgX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:05:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C87EB1595;
	Fri, 17 Oct 2025 03:05:20 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 538A43F59E;
	Fri, 17 Oct 2025 03:05:27 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 17 Oct 2025 11:05:01 +0100
Subject: [PATCH v2 12/25] perf arm_spe: Report extended memory operations
 in records
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-perf_support_arm_spev1-3-v2-12-2d41e4746e1b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760695507; l=1324;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=IN1q4IBQZez4Gc/ZmEnYrKyLPI5UL1+SlIBjzXyHK0A=;
 b=VxPoYyNO/BR1xXa+AMqmCx4nlymIFVTXzKa1qqkLkvVqoFTCDmaPtDDBuoRmLViJalsa6tc8S
 KLMWMVtgi+fDUPznd3RLhfl7Ztnim+oreBGiGMeCC02i5HJJY8NIbAW
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030529_510557_0F0F832F 
X-CRM114-Status: UNSURE (   9.33  )
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


