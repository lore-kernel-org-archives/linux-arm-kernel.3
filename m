Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F76AD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3c2VRSJWQ7JSy+P02tbPOI2K5T6H9cQBjul66McAq4=; b=10DZugIYr8HEM9rLPU+GjXzeK5
	2uN3iH2Lua7uK+a1yi14HYUO7MQD1rhQj3qlFyS97t2RnntdDUOuX6GVgi5L/V5Dqh5Xfv04YUnwp
	Yx5B9eGNzttqfMVyqRule0P0/EVc7Z0TQikTxvxx2VAW0GfxZfxob4ui1cGItHk7ZJptiP/GOLdAv
	LQGhjjGRHVoyi8DsnqQFyYTvccskJpV0Mrv/xS9IuVqvEgww5DDaHAfMdIoYt9NboipYMg4NtF00A
	hSad0DDAF5cvyx52PWpthOxI9q/2sUn7YLy1F1LPM1ptTboGVqAKNjeFK6GYGhRcn8SuBTzUJryiN
	uI5Tni+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1yx-00000003QmZ-1DGa;
	Mon, 01 Dec 2025 11:22:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1yu-00000003Qlg-41l0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:22:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D39701595;
	Mon,  1 Dec 2025 03:22:03 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B23FC3F59E;
	Mon,  1 Dec 2025 03:22:08 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 01 Dec 2025 11:21:51 +0000
Subject: [PATCH 01/19] coresight: trbe: Use helpers for checking errata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-trbe_buffer_refactor_v1-1-v1-1-7da32b076b28@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764588125; l=1969;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=WzPIT7JrkPATOGEn6EDeq+ISNkYbUEBxIuW8y7cUFbg=;
 b=6YaGZArGMrS7ML/KajEPsrZHMzjRZMdzjMsh9THC9ulWERs8ss1yDgMpkkmrHqS4OsYaWKrUD
 AHKWQAbvmHGBT8OuWGN6d7Z9suNVa+z29sH6HVky3wjkVcKXejOb6h8
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_032213_044717_B304664D 
X-CRM114-Status: GOOD (  13.33  )
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

Use the existed helpers for checking errata instead of open coded
equivalent.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 293715b4ff0eb0abe30f9b477700ca94f81cd4a2..0ddb3db0213cf0014e29decfb79da68b0a351b31 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -723,7 +723,7 @@ static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
 	 * the space we skipped with IGNORE packets. And we are always
 	 * guaranteed to have at least a PAGE_SIZE space in the buffer.
 	 */
-	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE) &&
+	if (trbe_may_overwrite_in_fill_mode(buf->cpudata) &&
 	    !WARN_ON(size < overwrite_skip))
 		__trbe_pad_buf(buf, start_off, overwrite_skip);
 
@@ -946,7 +946,7 @@ static int trbe_apply_work_around_before_enable(struct trbe_buf *buf)
 	 *  - At trace collection:
 	 *     - Pad the 256bytes skipped above again with IGNORE packets.
 	 */
-	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE)) {
+	if (trbe_may_overwrite_in_fill_mode(buf->cpudata)) {
 		if (WARN_ON(!IS_ALIGNED(buf->trbe_write, PAGE_SIZE)))
 			return -EINVAL;
 		buf->trbe_hw_base = buf->trbe_write;
@@ -970,7 +970,7 @@ static int trbe_apply_work_around_before_enable(struct trbe_buf *buf)
 	 *     - Adjust the TRBLIMITR.LIMIT to leave the extra PAGE outside
 	 *       the TRBE's range (i.e [TRBBASER, TRBLIMITR.LIMI] ).
 	 */
-	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_WRITE_OUT_OF_RANGE)) {
+	if (trbe_may_write_out_of_range(buf->cpudata)) {
 		s64 space = buf->trbe_limit - buf->trbe_write;
 		/*
 		 * We must have more than a PAGE_SIZE worth space in the proposed

-- 
2.34.1


