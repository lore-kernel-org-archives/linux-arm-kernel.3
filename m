Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C44CD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9jyilWguLu67n8biDRIgMEACORytYPuUBaW4nQt3n0=; b=afHf6XBH9AEoU24RH/9e87s7Ng
	hUrYow4v0KS+heagtMaUSpTduZgtM6rzNXDUBWB3DSSlNCQTr/oLpJ7eJkPlKVa2lTOk6TaN4KDdu
	jULbFrFmpe8GHIAEKXKhnmYa9ELPH8HepXAX3HuQZ+2UWXfh3Vhec7Wow3UBW/oUXg67sGvcTOfH/
	9oPFe6L0DYQFhPfO+2wHXD7hmRcJGDuMzqSsWHLfVlpuaP0b51ORxW6b1uHdJ+mSLbrbGFO01Ia0G
	gOe4/wBvCBzU4NmOd3r3TP8+RDIZFeDza69lsX5yZiUuzQ1u/BHKggGniuiu5gvO8IvY5U22eSNBp
	yv1vCFUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1zq-00000003Rqy-3ZAv;
	Mon, 01 Dec 2025 11:23:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1zo-00000003Rn4-1rhU
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Dec 2025 11:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=R9jyilWguLu67n8biDRIgMEACORytYPuUBaW4nQt3n0=; b=iJJBRf+zv1Jk4ywDPMwLu80Jdd
	bCdodVBDzOhb+syXhuZRuCCzA0M+NwR8k/vSQRu/gk8sXSf24JtAs7bYS2cH9aQdQ+Ej1hD2Tty3m
	L2IU7SMwHA4FeQEOqlUDYR3TZU6MwY1QvEAeX0MW8xLo4yKKhm1WKbXnmHHAqaBlGqU1+f6cNTkWq
	FQ8EIJ152UX8mrqCnLBtyPOEM4kFFh2dOn1NRgCgAcRJDwyPE4fzEDGdJ1M2V3T1I+h6tpwy21Tql
	y3sngaw2aXKTs4h2e8wCgtFCnpMYa2bL/4Q2mTsls6n2tBnxzVUVwCMuFRzE25d2Lf9F6eJa0awHa
	DT/ievaw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ18A-0000000Feps-2xmo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:27:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48F431595;
	Mon,  1 Dec 2025 03:22:54 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28E3E3F59E;
	Mon,  1 Dec 2025 03:22:59 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 01 Dec 2025 11:22:09 +0000
Subject: [PATCH 19/19] perf: cs-etm: Set watermark for AUX trace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-trbe_buffer_refactor_v1-1-v1-19-7da32b076b28@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764588125; l=1279;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=CnLBhlCtv3ztxvAipwj7G3XfegrAX9IB1iFyGNaXBw4=;
 b=JCZvKgPoppyGZi9uQ3L79JfnjD3WKDxqWgyj3lepFbASg8s6jT6fcDbvQWEeQja+YC/BoKXNE
 m0yvrnCCStzDA76g5U7+URc7obMXrMG0frUfWc8f9+16Mg8axWh8mAu
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_102743_003394_47D2197F 
X-CRM114-Status: UNSURE (   8.39  )
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

The default watermark is half of the total buffer size. In many cases,
the tool can not be notified with sufficient free space, especially when
profiling with small AUX buffer (e.g., 64KiB).

Setting watermark to quarter of the buffer to notifies the tool to read
data earlier and prevents the data loss.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/arch/arm/util/cs-etm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index ea891d12f8f40beebf8dee1d3db71cad701f5666..649b8b0d0f92b4af45fb97db9da3c5ccf24a978b 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -424,6 +424,13 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 		pr_debug2("%s snapshot size: %zu\n", CORESIGHT_ETM_PMU_NAME,
 			  opts->auxtrace_snapshot_size);
 
+	if (!opts->auxtrace_snapshot_mode && !opts->auxtrace_sample_mode) {
+		size_t aw = opts->auxtrace_mmap_pages * (size_t)page_size / 4;
+		u32 aux_watermark = aw > UINT_MAX ? UINT_MAX : aw;
+
+		cs_etm_evsel->core.attr.aux_watermark = aux_watermark;
+	}
+
 	/*
 	 * To obtain the auxtrace buffer file descriptor, the auxtrace
 	 * event must come first.

-- 
2.34.1


