Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594FBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 17:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SMfUfvW3CDALFQXIvplePcJ2AFe5oQyyPWvHaoCu1wU=; b=YfjUTRhrRuJJPGAJHXjEtsE4a1
	3YkDTFVBYnBzkhL9ytu5+wkUkWJzijzSpbQdrkWBJG+lHmUFakCAw9JZqtIjWQE/8+v3ToxJ9K5sy
	hTmtIJM7/95mOH3vdB7az0FEVtPYwkowP+oFONiBipSas5m9GxoCNITKxMFXbuFh58LMXbiY99+Uf
	dNGovehff4sM9WWRGcO7xqYM1rGTajfQic+YqRJhNO2LmIbqvWFOceFVq9yGZOpSrvvbSjowPYgLq
	8A5kAuHOezePhAIwCWmmblwMfwzDgX7xeJRhWZW2bwfkvg/ZE/bT3q7kebYY5U69GSI7c0zcIFbHd
	IuJEMFng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKrH-000000055Xy-3zD2;
	Thu, 02 Jul 2026 17:05:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKrF-000000055XQ-0MGY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 17:05:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCD021D13;
	Thu,  2 Jul 2026 10:05:40 -0700 (PDT)
Received: from e132581.cambridge.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C45693F85F;
	Thu,  2 Jul 2026 10:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783011944; bh=Z9D2qSGiQ3LAherp1GRKw5aRfHCfU8hdsMJK5H8Q3ec=;
	h=From:To:Cc:Subject:Date:From;
	b=WoFGd+hD+1SmysK0Hg7D+TgbciBIQ1Yz5/zPfkz09h1tlTPKFC6VaoTwLcUHeREHt
	 ITNryvAtnJ3LjYHn6JORWcbL1y6EIBSI4D+/OSu9rO2/cDrSJKM4fvA0qnyoVhBld7
	 UmWBOTm6Q2aaFDuO5WkeK/jaAhCVZ3mnWTJ2MUaM=
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH] perf: arm_spe: Make wakeup range check overflow safe
Date: Thu,  2 Jul 2026 18:05:21 +0100
Message-Id: <20260702170521.4103426-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_100549_163397_E6BB6A59 
X-CRM114-Status: GOOD (  13.05  )
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

The current code checks whether the wakeup point is in the current
writable range by comparing it with handle->head + handle->size.

The perf AUX head is a monotonically increasing index, so that addition
can overflow when head is close to ULONG_MAX. In that case, a wakeup
point which is still inside the free space range can be missed.

Use unsigned subtraction to compare the distance from head to wakeup
against the handle->size. This can dismiss the issue when addition
overflow.

This is unlikely to happen in practice, but the change makes the
watermark check logically correct.

Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/perf/arm_spe_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index dbd0da111639..b64cf2313a20 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -577,7 +577,7 @@ static u64 __arm_spe_pmu_next_off(struct perf_output_handle *handle)
 	 * the page boundary following it. Keep the tail boundary if
 	 * that's lower.
 	 */
-	if (handle->wakeup < (handle->head + handle->size) && head <= wakeup)
+	if ((handle->wakeup - handle->head) < handle->size && head <= wakeup)
 		limit = min(limit, round_up(wakeup, PAGE_SIZE));
 
 	if (limit > head)
-- 
2.34.1


