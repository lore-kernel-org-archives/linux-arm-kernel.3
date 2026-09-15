Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6222FC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PB1Q5GI+tPsMektfPcYCJx7vUK8TPqC20eQ52SJlABg=; b=Wn9LKo5JmTqmILVC5CrQ5bRnhO
	cDzq88wHW7dmfVwXTIgESOTOowxvSf9ql6qvLzCYau8PZQKhMura3Q8ToH8c+vLjBGw6GuhE21mHa
	+pNjKtxjNy1GLmpUasHEiGIc7woOugBPsQA5TBBQjJD4HNtNOushKBURi7AshFtv+V1UJXlvpMEW7
	9qtvu6SOKBymOqtvmZrM6fR9ji/FzyC3rEgi5qLLPUXl8IeY9IO18wkflggEYheAKwRdWXxJAuH5c
	eYqx3WNbTRAnHQiAICpnBmT+SNfk2qAjEixfg4g8Hg50vR3YIPR/cmbQxjmHCtQ1BbP7i3Sf0vM5o
	iU2O/Ing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPJ-00000007Hgn-0pEJ;
	Tue, 15 Sep 2026 15:49:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPA-00000007HdZ-4AUo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:49:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A68FC15A1;
	Tue, 15 Sep 2026 08:49:02 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC1673F882;
	Tue, 15 Sep 2026 08:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487346; bh=SS1qtrHSbngdvNGeG6RPiWAf922Nowh6gFGV0Y8RWAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Cg02Lq0gG5n1mRpbGar6YHdQ8r8ovabBEs37FeOp7fn80ms95FFn+uehzIRFgZD+2
	 gJwvFzGP1r4Tnj+agH2QJuyc+dnb0QRIUoufd+RGSKYtLzPyRs82ORN8J4qHmlT8iF
	 8DOz3Hmq2rFd8Vf7jz7DDVVpYaKT0xGCH5K2uaVY=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:48:47 +0100
Subject: [PATCH 01/25] perf/core: Reject non-positive AUX snapshot sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-1-35cf6f297d20@arm.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487340; l=1513;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=SS1qtrHSbngdvNGeG6RPiWAf922Nowh6gFGV0Y8RWAU=;
 b=SxMQuzcTemr+ai7HEpuK/BgH25DGTLYAII4GoCYRsGRwpD4jnF4vZB/wJ1/ILF7ZHo87xkeGA
 NpJFSBgW4toCfGtbeZNzzIBJzrZ5NWrqzrBvU1MuGsRJjAnlh/KDdM0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084909_076477_B82842E9 
X-CRM114-Status: GOOD (  13.09  )
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

The existing validation rejects negative copy errors but allows a zero
return. In that case no AUX data was copied, but it is incorrectly
passed to the alignment-padding check.

Reject zero together with negative errors before calculating the padding.
This reports the invalid snapshot result and avoids treating a missing
AUX payload as alignment padding.

Fixes: a4faf00d994c ("perf/aux: Allow using AUX data in perf samples")
Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 kernel/events/core.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index fe33fe15689d077e7f445c0b17d9c2e638c884a1..17355e4b8b7c6c106117153c9eb8509e6f9a41e3 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -8058,12 +8058,11 @@ static void perf_aux_sample_output(struct perf_event *event,
 	size = perf_pmu_snapshot_aux(rb, sampler, handle, data->aux_size);
 
 	/*
-	 * An error here means that perf_output_copy() failed (returned a
-	 * non-zero surplus that it didn't copy), which in its current
-	 * enlightened implementation is not possible. If that changes, we'd
-	 * like to know.
+	 * A negative return means that perf_output_copy() failed, while zero
+	 * means that no AUX data was copied despite a non-zero request. Neither
+	 * can be treated as alignment padding below.
 	 */
-	if (WARN_ON_ONCE(size < 0))
+	if (WARN_ON_ONCE(size <= 0))
 		goto out_put;
 
 	/*

-- 
2.34.1


