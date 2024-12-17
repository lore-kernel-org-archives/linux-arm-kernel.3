Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84659E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 21:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcEmfpLqIW1Z12OpNFspMutcu+Tk1OvNr+7PPdfsRyo=; b=VuKWM/eiFnCPH/P/wTXHcp8G5l
	DrSeQPM+cluom3QlLM3uA17Ry3173O4E8kaFuuRdIXNqfTpxB+gLG0VrhWed3mY6QHVowceX5TkUK
	tHkcpN6tr9oggD2zm7dE8YVXyaNBZ64hq/ryJOlA8brivVN48tCDKLwja9l7gXIYtTUOKQqomufd7
	6wIiC16d/AATxzRCAatgMstpDKJfnTJsWjrL8iJyqxZCUHYJrvHBXiEDy5qT4aYVgksgGBxdq4uQS
	cyrvntzhNdEF6TbozMo3lPlwtPvSe3OLDV8Xr70Kb9vd6suze4H+OE7tK2nv1Q4X1VJzFv2tmsw7O
	5vMdDOIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNfJb-0000000Etiz-4Bjh;
	Tue, 17 Dec 2024 21:41:16 +0000
Received: from out-187.mta0.migadu.com ([2001:41d0:1004:224b::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNf2P-0000000Eqrl-3Yi8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 21:23:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734470606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EcEmfpLqIW1Z12OpNFspMutcu+Tk1OvNr+7PPdfsRyo=;
	b=CgvLXXFjpqwY4rgZR3L02QL3zorf4YPkRDogp1MKm22ZPwwiUXNTZpFp/WBFpwTGZ6ocZz
	UqPADVEshmMdxJWGcW8djppmX9chkojkFiT//UtaPdOv2Gk85GUqHjpv+bb4LgSmwNLHPa
	8rZoYmUOgXe0VOcQCp5vpLsxfGsGdbU=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [RFC PATCH 16/18] drivers/perf: apple_m1: Map a few more PMUv3 events
Date: Tue, 17 Dec 2024 13:23:17 -0800
Message-Id: <20241217212317.3709478-1-oliver.upton@linux.dev>
In-Reply-To: <20241217212048.3709204-1-oliver.upton@linux.dev>
References: <20241217212048.3709204-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_132330_026036_B1FE07D5 
X-CRM114-Status: UNSURE (   8.48  )
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

Map some more PMUv3 events onto hardware so 'perf stat' in a KVM VM can
show some useful information (e.g. IPC, branch prediction rate).

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 drivers/perf/apple_m1_cpu_pmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index b4fe247543a6..0e54d3f900a7 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -180,7 +180,10 @@ static const unsigned m1_pmu_perf_map[PERF_COUNT_HW_MAX] = {
 
 static const unsigned int m1_pmu_pmceid_map[ARMV8_PMUV3_MAX_COMMON_EVENTS] = {
 	[0 ... ARMV8_PMUV3_MAX_COMMON_EVENTS - 1]	= HW_OP_UNSUPPORTED,
+	M1_PMUV3_EVENT_MAP(INST_RETIRED,	INST_ALL),
 	M1_PMUV3_EVENT_MAP(CPU_CYCLES,		CORE_ACTIVE_CYCLE),
+	M1_PMUV3_EVENT_MAP(BR_RETIRED,		INST_BRANCH),
+	M1_PMUV3_EVENT_MAP(BR_MIS_PRED_RETIRED,	BRANCH_MISPRED_NONSPEC),
 };
 
 /* sysfs definitions */
-- 
2.39.5


