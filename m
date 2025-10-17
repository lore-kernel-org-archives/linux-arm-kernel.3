Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CE3CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 15:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZY9EFOeF+9HVAzx7A9U3WVYFaFuOnHPNE2yDV1QGQU=; b=thrNyAD8UnamV0p8OV0SDpsb11
	yRRuLa4cwUDyV+3PLnIFh5OXN8ZNR8QcKBOIIyxnV+yAOQy/AurL64jMzgGL1PwBzAWZRfsI5hoZ7
	kSUcU3OSM728kNgX+KMrOrAs7djj1/eepxhtFUdxxFuIho5iX+uTCyG3Ibhb0r67KLiIE1aLeg3bK
	JjPL3S2ertxJzBcxFji+49NmLrxnA6m3vy0QhIfbv1IgzJzpOln2VYkxlDUwpNNLUhq9b1cr9Mp2f
	E9Wfzs0zORYsxGOdma0oiZ/Cwv+OCVOMxuO4kH0urDB2ibpQL11vEtPsmiN1Xr11eFW1jDbEQKGbz
	ktdVOVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mja-00000008KM1-31S4;
	Fri, 17 Oct 2025 15:51:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mjY-00000008KKU-3dK4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 15:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tZY9EFOeF+9HVAzx7A9U3WVYFaFuOnHPNE2yDV1QGQU=; b=G85fWX+Z4dc9sr1r3K00hUxedI
	bXhF8VCgswAfwNhSBFwNFqP30jQGCjKniIkuqY+RchJE8V6vL0FbzutEOu3coa0Z3kuk0bjrM0B7h
	bH170vWO0ataCByilsxcPSDILk6a+cJxqPNft/6naa+8jFP76yIZmAbNNQqZANM8jx8HWOdx9Tb+p
	pDR9xF9OGjusGEg7i3/IDMNHzQeMzF0P39UlFBwExLQiCa1x/ScGD/ak+jDYBm9o9UUq8YSuGZqiI
	ax4nv5qmMXUkHylJQyZRg+skqkESjAgvI659WokPLEdf6LSVN/PYfBcKBxPSd2AgsarHSdfk3SHJq
	fklZLlog==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mjU-00000007hff-2cWy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 15:51:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E2D940A8A;
	Fri, 17 Oct 2025 15:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E0DC4CEE7;
	Fri, 17 Oct 2025 15:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760716267;
	bh=vi24S4r00seo+yxu3h2z3uA9n2v8HfMe1RARODEk554=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lwqLUWHPc6RT3GYtFMs4FjdKFb25bSqGshROxdDCSU4eD66Mv4YDwjtdE0C9UBh4n
	 mYsqt3TpG9buFGZ6ZWKzCSKwZ3WCmLRqVSDX40j/vYEE3+JSvJlQ5QGIA3pIjWn98g
	 E3L1Fq4nercJx+pYUy/dT+s4d0sD8zlI44uDTIUE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Ali Saidi <alisaidi@amazon.com>,
	Leo Yan <leo.yan@linaro.org>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	German Gomez <german.gomez@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.garry@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Will Deacon <will@kernel.org>,
	Zhuo Song <zhuo.song@linux.alibaba.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 131/276] perf arm-spe: augment the data source type with neoverse_spe list
Date: Fri, 17 Oct 2025 16:53:44 +0200
Message-ID: <20251017145147.264329126@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017145142.382145055@linuxfoundation.org>
References: <20251017145142.382145055@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_165109_075032_2BD239C1 
X-CRM114-Status: GOOD (  15.09  )
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

5.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Jing Zhang <renyu.zj@linux.alibaba.com>

[ Upstream commit 74a61d53a6d1ca1172d85964d15c83c2cc3670b3 ]

When synthesizing event with SPE data source, commit 4e6430cbb1a9("perf
arm-spe: Use SPE data source for neoverse cores") augment the type with
source information by MIDR. However, is_midr_in_range only compares the
first entry in neoverse_spe.

Change is_midr_in_range to is_midr_in_range_list to traverse the
neoverse_spe array so that all neoverse cores synthesize event with data
source packet.

Fixes: 4e6430cbb1a9f1dc ("perf arm-spe: Use SPE data source for neoverse cores")
Reviewed-by: Ali Saidi <alisaidi@amazon.com>
Reviewed-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Jing Zhang <renyu.zj@linux.alibaba.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Ali Saidi <alisaidi@amazon.com>
Cc: German Gomez <german.gomez@arm.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: James Clark <james.clark@arm.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: John Garry <john.garry@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: Timothy Hayes <timothy.hayes@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Zhuo Song <zhuo.song@linux.alibaba.com>
Link: https://lore.kernel.org/r/1664197396-42672-1-git-send-email-renyu.zj@linux.alibaba.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Stable-dep-of: cb300e351505 ("perf arm_spe: Correct memory level for remote access")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/util/arm-spe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 9e7e56596c60e..2d7fc2b01f36b 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -423,7 +423,7 @@ static void arm_spe__synth_data_source_generic(const struct arm_spe_record *reco
 static u64 arm_spe__synth_data_source(const struct arm_spe_record *record, u64 midr)
 {
 	union perf_mem_data_src	data_src = { 0 };
-	bool is_neoverse = is_midr_in_range(midr, neoverse_spe);
+	bool is_neoverse = is_midr_in_range_list(midr, neoverse_spe);
 
 	if (record->op == ARM_SPE_LD)
 		data_src.mem_op = PERF_MEM_OP_LOAD;
-- 
2.51.0




