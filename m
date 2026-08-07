Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828E8C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfYXgw69zMSEclDnNr5kszfAFVsyyRX4EV9lqJDD4s4=; b=3Rwyks+G5uV0ihq1eTbQTvbdWR
	8y7+gKmxIW38G4g4MRzCVtr/63uddCreOPIMQfh9fKx8gBT2eJlBtY0612vHXXoxbyLCsqRwbRben
	Ly1bzj8Tz88Y3Tm5T9Z9mUDaplMXYvWDCIjocqVeJd49ZN9pMKkeA5/pSSiewxw55zISFAXXYiIin
	hEC++hZoRuzkPogz3TVRpR8kB/UC29k8uZk9bs/2THGWemaCqmB1mcKE6blgT8ItL0fgRf7roqMJ6
	Uvr5Js9f/HoeVhSDXuAoluo6oFUDGm8HkM5W2hEVTJfNQhV6VuK+ajTGGcwB/0DJaJ2eMNMwhxZUy
	DkgrXFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFf6-00000007Mff-3LZY;
	Fri, 07 Aug 2026 08:10:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFf3-00000007MYI-0MEn
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:10:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=BfYXgw69zMSEclDnNr5kszfAFVsyyRX4EV9lqJDD4s4=; b=bySPrXLmqFCV9yjIs0MD2zut/o
	2BX9BepQ0mW9D+ZR1MgFogAbQSfUYI8NeSqbhTaiQxxWk9AG599gIpfghLkvOsl0cE09DyEUAao+z
	ms5NW+0agZMhnO86yqJ2XyMMsiOUkgQvOMhTDovEiB8MuGURup51yCJm3+1qb991W3o+1CkWU2FKO
	UbimwI6GmT4wZ60LRkCBPDauwrEDqCETJsqXEv4QnCmkJDjXQOhcH2h6IDfRBhL+1wUqTuMPSmo9Y
	xQXchpoKXputMmnYCNx3mKjrX6LpCkWn9ALUeOAIPgqeZw3nu3VU/jdVHdlXzZ2Bxhpv/vy5FFHtm
	AGmm+pzg==;
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFez-0000000CAwo-01Hz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:10:36 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786090231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BfYXgw69zMSEclDnNr5kszfAFVsyyRX4EV9lqJDD4s4=;
	b=DV3cbjQIASZzTdDYM1EnEUE7GAYOSygcGnb5EH9Hra5RBZsKD8Nh5NASPHOZtCY1mMV/c5
	6NhXvWxFUpwJ/KCsY+aOCZL+7z2UocgrY7QqgAMgIwaC6+rK1rRXXt6tMafdYFnxzntcSt
	yN6LOVxSRlvsIYXQWrCV8wyymzLXs3g=
From: Atish Patra <atish.patra@linux.dev>
Date: Fri, 07 Aug 2026 01:09:12 -0700
Subject: [PATCH v9 17/20] RISC-V: perf: Add legacy event encodings via
 sysfs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-counter_delegation-v9-17-58658104e487@meta.com>
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
To: Will Deacon <will@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Ian Rogers <irogers@google.com>, 
 Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_091033_252497_50927FBE 
X-CRM114-Status: GOOD (  14.61  )
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

From: Atish Patra <atishp@rivosinc.com>

Define sysfs details for the legacy events so that any tool can
parse these to understand the minimum set of legacy events
supported by the platform. The sysfs entry will describe both event
encoding and corresponding counter map so that an perf event can be
programmed accordingly.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 drivers/perf/riscv_pmu_sbi.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index ee0c07785927..5eb49db8bc7c 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -130,7 +130,20 @@ static struct attribute_group riscv_cdeleg_pmu_format_group = {
 	.attrs = riscv_cdeleg_pmu_formats_attr,
 };
 
+#define RVPMU_EVENT_ATTR_RESOLVE(m) #m
+#define RVPMU_EVENT_CMASK_ATTR(_name, _var, config, mask) \
+	PMU_EVENT_ATTR_STRING(_name, rvpmu_event_attr_##_var, \
+			      "event=" RVPMU_EVENT_ATTR_RESOLVE(config) \
+			      ",counterid_mask=" RVPMU_EVENT_ATTR_RESOLVE(mask))
+
+#define RVPMU_EVENT_ATTR_PTR(name) (&rvpmu_event_attr_##name.attr.attr)
+
+static struct attribute_group riscv_cdeleg_pmu_event_group __ro_after_init = {
+	.name = "events",
+};
+
 static const struct attribute_group *riscv_cdeleg_pmu_attr_groups[] = {
+	&riscv_cdeleg_pmu_event_group,
 	&riscv_cdeleg_pmu_format_group,
 	NULL,
 };
@@ -446,11 +459,14 @@ struct riscv_vendor_pmu_events {
 	const struct riscv_pmu_event *hw_event_map;
 	const struct riscv_pmu_event (*cache_event_map)[PERF_COUNT_HW_CACHE_OP_MAX]
 						       [PERF_COUNT_HW_CACHE_RESULT_MAX];
+	struct attribute **attrs_events;
 };
 
-#define RISCV_VENDOR_PMU_EVENTS(_vendorid, _archid, _implid, _hw_event_map, _cache_event_map) \
+#define RISCV_VENDOR_PMU_EVENTS(_vendorid, _archid, _implid, _hw_event_map, \
+				_cache_event_map, _attrs) \
 	{ .vendorid = _vendorid, .archid = _archid, .implid = _implid, \
-	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map },
+	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map, \
+	  .attrs_events = _attrs },
 
 static struct riscv_vendor_pmu_events pmu_vendor_events_table[] = {
 };
@@ -472,6 +488,8 @@ static void __init rvpmu_vendor_register_events(void)
 		    pmu_vendor_events_table[i].archid == arch_id) {
 			current_pmu_hw_event_map = pmu_vendor_events_table[i].hw_event_map;
 			current_pmu_cache_event_map = pmu_vendor_events_table[i].cache_event_map;
+			riscv_cdeleg_pmu_event_group.attrs =
+							pmu_vendor_events_table[i].attrs_events;
 			break;
 		}
 	}

-- 
2.53.0-Meta


