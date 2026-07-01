Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236FEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 08:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8V8xtoKAqPlqqdP66L19gg4AeWHREfPI94nLKFh6Tk=; b=vRWgGWTBrEAYx1cXxCGhlQhdT7
	Gj1+pXtCLxAiYba4UcotxKa5zkXAuU7rmFc5r4UXDf8LmLEo1ZqIrqzBTwV4xfvgMTcQ7fqWqfzXs
	UNZeAXLxi7Tw3YTpEbsgV8QK3yVml1+2BdlwS4QuoWF54mqrW3Ewrygh6tvX6VO/RJzT0P9O8Ftyb
	mbrJQLzs5Skdbt92KMK/IZU1t6BomeBHDwF3rl/I0wAavxcpBgDUrJ7TzmAd4+RBrSyvvKpGjk0Q/
	4/dTWOw/cQmXqGInq8LoEdMryW7Locn3PqnBTXKG6bshDieOLQD2c+XFqZV6RWdfQnmwcfPQl/oWg
	MdqdbzFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqd2-000000016Mf-3aTl;
	Wed, 01 Jul 2026 08:49:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqd2-000000016If-00K0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 08:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=S8V8xtoKAqPlqqdP66L19gg4AeWHREfPI94nLKFh6Tk=; b=QqNC8BpCPq7Tq85dEFVE8KfcAk
	3T8s0PBmrIO3/QXMKfXhfwzMQ4j8iKm8pZJPeNU8cgeVaQLwWNe4hxJDLXn/suYYbLU1XJ4R3gG9D
	8Kk5QMb6VSNCW6it0sy5CTXM8aif4yTiHC5mE+k7T6vFlta2RrlTjvAZei3oQc8DeDTXMeeej+wzn
	s43S5UjAZgQsW40fF1RwtRZ+NhPsEZps7ya2D0YVNLsjydgrUbAEXsK1Mta1+O2BN+hi7nzIZH+8E
	8g3xUUFwdXuJfIN3SZV7tAtF0PERp1vdcUAYs0DAPP4bVShZSkLIBYSB0LeexTSOMY5P+xZVARLWn
	JG/QPpog==;
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weqcv-00000002Wyq-44vl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 08:49:06 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782895740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S8V8xtoKAqPlqqdP66L19gg4AeWHREfPI94nLKFh6Tk=;
	b=uiLH+Uh9dSNQoPC8h35NhiprnhamkymjKrSZfhp5i7VWRDdYEQfxzf1+izxnVLZHjMPFdW
	Irb4Biq7+mvnafDeeOOeK+cLN8zFyvXbp+2h/MBYrmuZn6bRvcgDio4rKEq1dCP5yqytrR
	boC+/qSkoW2lzlnlYwySyWjT3Gviwc8=
From: Atish Patra <atish.patra@linux.dev>
Date: Wed, 01 Jul 2026 01:47:09 -0700
Subject: [PATCH v8 21/22] TEST(do-not-upstream): fake qemu-virt PMU events
 for cdeleg counter-mask testing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-counter_delegation-v8-21-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
In-Reply-To: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
To: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_094903_597012_33621B97 
X-CRM114-Status: UNSURE (   9.73  )
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
index 6d528eafb525..725816c274e5 100644
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


