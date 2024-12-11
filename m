Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D983E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 19:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4S6kZ35vJrT0i1WSZghALo6NK7jQGeJ2/+g2JPtPw2M=; b=lsZwJB7IBhTZhDkViNvuqzuVSE
	A5DTUnhKCkaOUi62c/rX8WXathPXEepJ1lVm/lrzsQArYMmA3Uo3Y+kNZnzhGQPK6Z6QytqDDCGa5
	uS4mDOoPf4MJo/+e1n/gYHpJkNH/yYvbR12tfIneKM2wXV59FroPmPkL1vRMypVUEBsJKefn+ddMY
	HHdL7c2bBu94pdTP7u40CXBOA9Hk8EzSOkpkfP4siXzsYD+W4xjDMgPZerzroBL+BSI7ugdCafhtq
	lwnEFTrbXRAzbkdTjrwmiGl5vH6kpWsFKtPqkZlcFOVOVlRd5ibRunS40l9nUlbziEnNK/kyyl6BN
	cXJ4GR5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLS2G-0000000Fqgf-1ZfH;
	Wed, 11 Dec 2024 19:06:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLS1C-0000000FqR2-0SZf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 19:05:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7E781007;
	Wed, 11 Dec 2024 11:05:32 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 43A3F3F5A1;
	Wed, 11 Dec 2024 11:05:04 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] perf/arm-cmn: Permit more exhaustive groups
Date: Wed, 11 Dec 2024 19:04:58 +0000
Message-Id: <bdfd1e58dac449e407c5cacfd6bf8577dc0a5899.1733943898.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_110506_186349_41D9DDF9 
X-CRM114-Status: GOOD (  11.00  )
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

The group validation logic still somewhat assumes the original CMN-600
case of events counting globally, such that if one tries to group 9
events where the first 8 target a single DTC domain, the 9th will be
rejected because *a* DTC domain is full, even though it might only
target other non-overlapping domains and thus still be schedulable.
Improve matters by only counting the DTCs that the new event actually
needs (as arm_cmn_val_add_event() was already clever enough to do).

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-cmn.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index edefb51ac90a..b49e353e10ab 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -1779,8 +1779,8 @@ static int arm_cmn_validate_group(struct arm_cmn *cmn, struct perf_event *event)
 		goto done;
 	}
 
-	for (i = 0; i < CMN_MAX_DTCS; i++)
-		if (val->dtc_count[i] == CMN_DT_NUM_COUNTERS)
+	for_each_hw_dtc_idx(hw, dtc, idx)
+		if (val->dtc_count[dtc] == CMN_DT_NUM_COUNTERS)
 			goto done;
 
 	for_each_hw_dn(hw, dn, i) {
-- 
2.39.2.101.g768bb238c484.dirty


