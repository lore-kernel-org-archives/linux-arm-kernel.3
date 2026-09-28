Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F68CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hor10U+s1qaTZ4O83N+1FxyNefuAcFSZjMILtQRhok0=; b=Tb3eH3jLs2AvWEJkXfdMTmW+WO
	/2M++ZKDdebURV5JBIzfTiW/h4bMdsX/EUnBFu8NP/oewYLs/907ew4IU6IaW3AFlb7uSIUkKuLj6
	ghGun3EpYOYr963hkeFLGKHxoda+42OFTezeMt7G+L1GlA9f4ztPK3fC6dxNhgBmOmR29kI+Q8ZLF
	E1CHR11NT/plbT7qbmbPWjy/9F2EJS/BdWqO4uCG0VeXX+gyl9oCsQmWSn7oAEjA9jEm0/fDZvOvW
	0cmfGULUbYqhjNgzYc4Wt6ZJPWyH4WuQmfIxQOCYgFKlf3TZA0aL4Ce1JW3QiXDzKHHyuqApRPcQc
	uZxclk6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDy3-00000000ylo-3LtI;
	Mon, 28 Sep 2026 16:12:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDy0-00000000ylI-3QsS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:12:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 978A81655;
	Mon, 28 Sep 2026 09:12:32 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 554B13F86F;
	Mon, 28 Sep 2026 09:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790611956; bh=Mlyq+ukKe2ByVk3Bd8wSohPfKW8jWheZr5H2rogrdFA=;
	h=From:Date:Subject:To:Cc:From;
	b=LAMug/Txr/5DrmHQ54y+TxWy/Y1gzKcUmPbN23oUJLqrfO2F792K5C9OWFaw9J+o3
	 Q+eakTy3zohL4lwtrBFIsAz9XiS/rSTMxrEGxS2BJBO+vSoF2L5YIjWqpUDtCdSt2k
	 2lUzaRqfcIhYWFHeOs95PXNtLeQ32ldf/r3m1zL8=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 28 Sep 2026 17:12:28 +0100
Subject: [PATCH] perf arm-spe: Add Neoverse V3AE data source decoding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-perf_arm_spe_add_neoverse_v3ae-v1-1-738c9ed12d31@arm.com>
X-B4-Tracking: v=1; b=H4sIAOuRumoC/x3NywrDIBBG4VcJs65gLOTSVyllsPrbzqJGRpBAy
 LtXsvw25xxUoYJKj+EgRZMqW+4YbwOFr88fGInd5Kyb7OoWU6CJvf64FrCPkTO2Bq3gdvcw6zg
 nt9i3C3OgHimKJPs1eL7O8w8NnMyTcAAAAA==
X-Change-ID: 20260928-perf_arm_spe_add_neoverse_v3ae-917f280b2c7c
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Kieran Hejmadi <kieran.hejmadi@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790611954; l=946;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Mlyq+ukKe2ByVk3Bd8wSohPfKW8jWheZr5H2rogrdFA=;
 b=M3Z0WJzWRnTDgi4rNH0BatdMRZgWsF7Ew4WfIzcwLVK0g1pdBjYnvah1fua6agSOtLmkM937m
 +hJGwBYFKvCBl45UoYNiy1Bv9T1I4zH3f+NyZ7H30SWz+5Vwbj2nUp7
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_091237_014059_6BE89860 
X-CRM114-Status: UNSURE (   9.65  )
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

Add all Neoverse V3AE revisions to the list so the common decoder can
populate the memory source and snoop information.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 7805a1a98a89a2853ad02ee7751472eddb1054ed..8d95df23be6f654caee77e9d155af7ebf5129c91 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -626,6 +626,7 @@ static const struct midr_range common_ds_encoding_cpus[] = {
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
 	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3),
+	MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3AE),
 	MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
 	{},
 };

---
base-commit: 0ae6fc78c5ce0dfd18d8712a50f0fd4602eff103
change-id: 20260928-perf_arm_spe_add_neoverse_v3ae-917f280b2c7c

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


