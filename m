Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B4EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 21:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9OvSlPazCgFtig4k2fUccNlDviHoE6kU11ttZKdFgo=; b=VAu96FiJsMQFZLRPD0SGxs9tX5
	9HzJUw76F+uhrixHxih8zmt2LWtJp4N8OqweJYpDNkya1mRAhLi3+cKodwp8VVYaIRCBbGhrTkRA4
	Bm6u40wmSNljr73ZIPJ7UsXm2xqVlT7kJJR0XKotN5gH0j1UW83zLskrTeL6VnGwOy3CeyqC0IHom
	pxna1oOI+Khuc20oBSfagHs1E8AYFK/7na+TJr3IpkQWIM2H6Ls2WExVcGhxXddGvUZCkmYONcWLc
	Mu8auz5KoK3iVL/knjp8WChX1wuvxcBIuYh0HBN046zc6w3R11Simcr47Gf5C1kLkaf1X0eLltLq2
	DW/PnOew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNf4Q-0000000ErFW-0Kdt;
	Tue, 17 Dec 2024 21:25:34 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNf0C-0000000EqSu-45go
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 21:21:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734470468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S9OvSlPazCgFtig4k2fUccNlDviHoE6kU11ttZKdFgo=;
	b=ddoRcP90eOxaD/OLmG314kYYJZdKueqpRMZqLSDK8LApVxf6E0CFffLjN5P7svI4JCuymF
	kCtEx16eZ2XrvMPB/tQdxl6bQjt9AJGodbwK9RcIZcQjvjHt/75D23JxGd6hv26ImJaZLY
	zu0vVyzFpI7uxSBh78RomHXfH+jdE0Y=
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
Subject: [PATCH 03/18] drivers/perf: apple_m1: Map generic branch events
Date: Tue, 17 Dec 2024 13:20:33 -0800
Message-Id: <20241217212048.3709204-4-oliver.upton@linux.dev>
In-Reply-To: <20241217212048.3709204-1-oliver.upton@linux.dev>
References: <20241217212048.3709204-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_132113_156924_F3822DD6 
X-CRM114-Status: UNSURE (   8.16  )
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

Map the generic perf events for branch prediction stats to the
corresponding hardware events.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 drivers/perf/apple_m1_cpu_pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 2a34523500f8..d6d4ff6da862 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -170,6 +170,8 @@ static const unsigned m1_pmu_perf_map[PERF_COUNT_HW_MAX] = {
 	PERF_MAP_ALL_UNSUPPORTED,
 	[PERF_COUNT_HW_CPU_CYCLES]		= M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE,
 	[PERF_COUNT_HW_INSTRUCTIONS]		= M1_PMU_PERFCTR_INST_ALL,
+	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS]	= M1_PMU_PERFCTR_INST_BRANCH,
+	[PERF_COUNT_HW_BRANCH_MISSES]		= M1_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC,
 };
 
 /* sysfs definitions */
-- 
2.39.5


