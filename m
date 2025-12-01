Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF91D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X84F1hDQ8xSmQ2F/pbw6nhgF9wVmwTN6nIxuNvmzEjU=; b=ZQFM+zs2FIUF7qo/10nlCpTnIL
	FtD+QZ+2mq+SDW1MUQDWQB0Avuiu6tViehvHiZysBpiCDdkdKQmPS/8a8UVABcbfPYU/w6B9181Wf
	Ei4ZUSnZr5slP8dGIAGaGlOvHEuyRak5mBRGcXtmS6/S8261qY5sKyAJIJ4tw3YHEoP8867NMKFew
	An7OGy7ZU4bpgWJEUsWS6pWHqs6qaEzq8+8/g1y3q2qdgsOkqOxbLNjE6wqtwb6GE7HTFj2ZNmQ0S
	wyhj11kkBulOuv2SHnRo5FF50UXPTC9WtI5QBguI0VVlJmI+83nSdrDx0R3jbwaLIaVBpkXjthxC6
	42QPmgiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1zO-00000003RD7-3Kku;
	Mon, 01 Dec 2025 11:22:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1zL-00000003R98-2op9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:22:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2684153B;
	Mon,  1 Dec 2025 03:22:31 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A46FC3F59E;
	Mon,  1 Dec 2025 03:22:36 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 01 Dec 2025 11:22:01 +0000
Subject: [PATCH 11/19] coresight: trbe: Apply overwrite erratum for only
 wrap event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-trbe_buffer_refactor_v1-1-v1-11-7da32b076b28@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764588125; l=1418;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=zPgqK7cT5HRw0jmMlFJlZiw1Qze5S36cdWxXgWmVrNo=;
 b=0m6xNEMS4HJ8tkJXOqGn+u0uyMMVUB0T6iKZ8Uf469sl+ePiLcER3p8nvin6+E5g9tAzGRpq0
 VvzQeV6frqAD1s3U8PKT/La3jBobNX74D0Auq+2WgksHHITGx/kBW4u
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_032239_812685_E4BEACAA 
X-CRM114-Status: GOOD (  12.48  )
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

The overwrite erratum occurs only on wrap events, so apply the extra
wrap condition check in the workaround.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index e579ea98523c24d23a0cd265dcdd0a46b52b52da..2600af12a8fb94bb8c74efda2a101aacd01b0b34 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -714,7 +714,7 @@ static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
 	 * 64bytes. Thus we ignore the potential triggering of the erratum
 	 * on WRAP and limit the data to LIMIT.
 	 */
-	if (wrap)
+	if (wrap && trbe_may_overwrite_in_fill_mode(buf->cpudata))
 		write = get_trbe_limit_pointer();
 	else
 		write = get_trbe_write_pointer();
@@ -736,7 +736,7 @@ static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
 	 * the space we skipped with IGNORE packets. And we are always
 	 * guaranteed to have at least a PAGE_SIZE space in the buffer.
 	 */
-	if (trbe_may_overwrite_in_fill_mode(buf->cpudata) &&
+	if (wrap && trbe_may_overwrite_in_fill_mode(buf->cpudata) &&
 	    !WARN_ON(size < overwrite_skip))
 		__trbe_pad_buf(buf, start_off, overwrite_skip);
 

-- 
2.34.1


