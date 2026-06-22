Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A18CDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 08:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ea3qX/iYYZe37EiflUkHEkxWKDcUhucpAlxGsriXrfg=; b=Hny2kBiXog2Z45qSYT8XBPx/JC
	AIqApQrqTTIBLVgkDU1jVLVAiHE4MFqDi+JeHNehQC5rSFFNvYWO3ubPjMUwFdTWZkRr/6saGTxPO
	s4tySHPerPO8cDL6vOdnxacQdnjJcV22/u2RAFd24d7foY6sOGKTlA3HrQUbKtuJwfFaxkBM6Hhzo
	A46Ru/KARrGWZ7tiSHTw7S1qzkAi0Pyv4zkdK8DIvebVSwNJwL2AO7ldajYAmd/iyjEH7XJEXAeRS
	6L9snolojs/IZEqeF6uWAhig71BLHcvSsyVnToo3Nyid5yZ0AMBy5CJ9wJQobbPSnZem26+bZVb8J
	VOI4jf9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZg8-00000004dSP-43ne;
	Mon, 22 Jun 2026 08:06:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZfs-00000004cy7-0Xvn
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 22 Jun 2026 08:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Ea3qX/iYYZe37EiflUkHEkxWKDcUhucpAlxGsriXrfg=; b=bMHopEXlxxZuE9qhIcJJ3vg+jW
	bAwgXZ/uMbsGcIFumxPCVGHFUWeSj+ECEmMPtvs8ACa4Xbku7c9+YcpXsdZmXDGqTEuBfg616q2lf
	edxpepsWjivJFrMvoWN8xcQyNsuP5mnpV+fE7t6wFoYJBa0ZGTzWL2X2ohMDyB/8k33kOnsvEc2DZ
	yOjtUngh/CB5Nug3o8AJX2hPvYy19288C9PtPf4NOBepoyGPS6H50XpgcH/9XMvK4b1DgRrfIW1Hl
	R0K3pD9j+CRl55U87vtljhyCsxG7A9quuv6O0qxnZ1bRnsJmSTln+Wwxx7Quz2FSoA8oXS8eAPADJ
	PUImK1bQ==;
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wbZfo-0000000HANc-2D5A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 08:06:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782115586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ea3qX/iYYZe37EiflUkHEkxWKDcUhucpAlxGsriXrfg=;
	b=Hz/AlxmSGVIw0yDaoAbncHQlZ7hUowxBQwkuMTYRirIjCBNMb9z1F/Q1xxFBdKCOqLuYjJ
	DcYtk2AgYoeOWDe/gtYsHA73EvHtop1BYaFpFuzlfZFn4FxjHAZkpeBLiVY1XxgzEaxQHF
	feabxqsUeBSUaiJ60IYECmWHEjsy/io=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 22 Jun 2026 01:04:33 -0700
Subject: [PATCH v7 21/22] TEST(do-not-upstream): fake qemu-virt PMU events
 for cdeleg counter-mask testing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-counter_delegation-v7-21-0ba2fd34614e@meta.com>
References: <20260622-counter_delegation-v7-0-0ba2fd34614e@meta.com>
In-Reply-To: <20260622-counter_delegation-v7-0-0ba2fd34614e@meta.com>
To: Jiri Olsa <jolsa@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Rob Herring <robh@kernel.org>, 
 Ian Rogers <irogers@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, Namhyung Kim <namhyung@kernel.org>
Cc: devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_090629_052316_B503A0A9 
X-CRM114-Status: UNSURE (   8.85  )
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

From: Atish Patra <atishp@meta.com>

Adds fake-any/fake-ctr3/fake-ctr34 (event codes 0xF0x QEMU doesn't model) with
counterid_masks, to exercise the counter-delegation allocation + counter-mask
constraint in QEMU (events read 0 = allocated/programmed, vs 'not supported').

Signed-off-by: Atish Patra <atishp@meta.com>
---
 drivers/perf/riscv_pmu_sbi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 3cb7a1f4035e..13a9f1fe4293 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -492,6 +492,12 @@ RVPMU_EVENT_CMASK_ATTR(instructions, instructions, 0x02, 0xFFFFFFF8);
 RVPMU_EVENT_CMASK_ATTR(dTLB-load-misses, dTLB_load_miss, 0x10019, 0xFFFFFFF8);
 RVPMU_EVENT_CMASK_ATTR(dTLB-store-misses, dTLB_store_miss, 0x1001B, 0xFFFFFFF8);
 RVPMU_EVENT_CMASK_ATTR(iTLB-load-misses, iTLB_load_miss, 0x10021, 0xFFFFFFF8);
+/*
+ * FAKE events for cdeleg mechanism testing: event codes QEMU does NOT model.
+ */
+RVPMU_EVENT_CMASK_ATTR(fake-any, fake_any, 0xF00, 0xFFFFFFF8);
+RVPMU_EVENT_CMASK_ATTR(fake-ctr3, fake_ctr3, 0xF01, 0x8);
+RVPMU_EVENT_CMASK_ATTR(fake-ctr34, fake_ctr34, 0xF02, 0x18);
 
 static struct attribute *qemu_virt_event_group[] = {
 	RVPMU_EVENT_ATTR_PTR(cycles),
@@ -499,6 +505,9 @@ static struct attribute *qemu_virt_event_group[] = {
 	RVPMU_EVENT_ATTR_PTR(dTLB_load_miss),
 	RVPMU_EVENT_ATTR_PTR(dTLB_store_miss),
 	RVPMU_EVENT_ATTR_PTR(iTLB_load_miss),
+	RVPMU_EVENT_ATTR_PTR(fake_any),
+	RVPMU_EVENT_ATTR_PTR(fake_ctr3),
+	RVPMU_EVENT_ATTR_PTR(fake_ctr34),
 	NULL,
 };
 

-- 
2.53.0-Meta


