Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEBBD111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DH7JPr38ZUC5gIbq64OXa6mGRV30JS9nyWXFk8VHFE0=; b=hFQPQNP4L/Cnvd2C8ggyFpa8ag
	pRTstt7770AERDsQ8Q+Ip7bFCqEA6Lu1+Ac1W/V78JM/oCMuiAM8lgUYh7AHnNyP/TQfTz23bGEJY
	CpLYBg5+OMTySCmOd6NYHchFTFyz3dByNKPG/6phHaA1SYHLLQFMIlDST6lzbNNr4ZoMxIZ0NMshh
	BO/r4xk1i6Sa9Mt9LSEPqIEQCGm5/JCYexeBFfe9K+g7GSX/2tyuT304tD0xKrriL0nRSFeCasFzS
	iS3HRKlxi06XI6jfaSzW9JuNJB+EmB5ADcqDE36CCFsmTjZc1+KPnMpPwHI+SUiG9yuDXGq9FqPrt
	OofBOAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1zR-00000003RGp-0kzc;
	Mon, 01 Dec 2025 11:22:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1zO-00000003RCp-2loh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:22:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 922CD153B;
	Mon,  1 Dec 2025 03:22:34 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7236B3F59E;
	Mon,  1 Dec 2025 03:22:39 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 01 Dec 2025 11:22:02 +0000
Subject: [PATCH 12/19] coresight: trbe: Calculate size for buffer wrapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-trbe_buffer_refactor_v1-1-v1-12-7da32b076b28@arm.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>, 
 Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764588125; l=1661;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=YiG3r48nDifBFjpQKNGxPwH2NFBQuAbAaMlyQ0TBHdQ=;
 b=WPVW4J1nxfTXlcM++NTc5Fb3Dr4++iWibPixr4rGthRR2HcJdd1yTZDLV5JhH0wTwZa+HlfG0
 nA53uhBl3/TDcEZ+p2WMKneTR81p+MedxQaDzmOl2IDiUqG2rs9OIG6
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_032242_766389_EBEBE1D5 
X-CRM114-Status: GOOD (  14.82  )
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

Calculate the wrapped size when the end position is less than the start.

If the start equals the end, the "wrap" flag is used to decide whether
the buffer is full or empty.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 2600af12a8fb94bb8c74efda2a101aacd01b0b34..48bc03bd339908b5eac9466dc60325ff1b238976 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -696,7 +696,7 @@ static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
 {
 	u64 write;
 	u64 start_off, end_off;
-	u64 size;
+	u64 size, buf_size;
 	u64 overwrite_skip = TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES;
 
 	/*
@@ -726,11 +726,18 @@ static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
 	 */
 	end_off = write - buf->trbe_base;
 	start_off = PERF_IDX2OFF(handle->head, buf);
+	buf_size = buf->trbe_limit - buf->trbe_base;
+
+	if (end_off > start_off)
+		size = end_off - start_off;
+	else if (end_off < start_off)
+		size = end_off + buf_size - start_off;
+	else if (wrap)
+		/* The start is the same as the end, just wrapped */
+		size = buf_size;
+	else
+		size = 0;
 
-	if (WARN_ON_ONCE(end_off < start_off))
-		return 0;
-
-	size = end_off - start_off;
 	/*
 	 * If the TRBE is affected by the following erratum, we must fill
 	 * the space we skipped with IGNORE packets. And we are always

-- 
2.34.1


