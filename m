Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E539CD8C85
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 06:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMReWLDLXVskrK7YvKiFAJhgJ2Bnx+tOpFTmEt9zhgs=; b=s4MwhYYelYA5Bb3vWWYI5bMgaS
	xR93Ja2Rcqj1QXuTExKC0sghb5EEBbXDnyaGJKLxgkMAQrLxi2SGPpvmQR5MWA6hHT99zYvedQA1n
	0zmvCJJuvfkx9ke4/Yl3tBvrcUygJFc17AeJ4BONbhu82H/v/+XjIq3/mBgFAlobQ8YCyOF5qe6cs
	aYd6GoTQIGJ++kLHhbpcj9vVDYr0kH9dPr1bjoVNs697qLaNDo+/FYQCzjrOID/5yMhxEMSSPj5f8
	oVgVrJWNmIvbf0igxQuE6bv2b1oI0RnQ7BZJ1t5RP7XgSyNTVYRb8LbRfX5awD5CJbwneLHwCWogi
	pe5n6QhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpYR-00000004oBY-2tid;
	Tue, 09 Jun 2026 06:03:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpYN-00000004o2m-3sSL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 06:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sMReWLDLXVskrK7YvKiFAJhgJ2Bnx+tOpFTmEt9zhgs=; b=gy1cqmlNX4qZajnRj2QcfT0SSE
	JQ7dc+/EqyVOprFo4uGnWzI2dFDIkGO0Rbw6kHCYJOns9Nkex2G113kOxeW3dl6pD7OJH33SnBmDU
	5M2R3ypB3GyQD17uD6jqeTaYwBZdMFaSMTWFeK+MCom1F1Nz+os8juk+EmcOSLF7+JDr46AUBRwzM
	67RMsyBonduuRsegG3DZVsu9etyzXpXkPsFLNiqQYfCrLPSsUTZLqOEBabnDJvmfHq3TmyDVG4rcl
	vNiDt3PMapzCkP2HGQjK8Lf/UgjcBRGSkbtMl7PspM29gy6RbOS3pFdFWyQgzG9ySElEPqd3zMpUJ
	Nft6RSZQ==;
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWpYL-000000020BQ-0SVH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 06:03:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780984986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMReWLDLXVskrK7YvKiFAJhgJ2Bnx+tOpFTmEt9zhgs=;
	b=gvRwUWkoqGKbVUgPgeiG7/g1s8sdwcUdIJLcVniP2hi4alfPvPizJHNpMvj/acPeEM//pw
	jkn9A0DD8DgGaEyoEm4GXmghWb3BktXQ2A2xZEzzXtCPKQ4SniAx95gCMnAwL5jSmAowFc
	/b6lCTnqECHLw7/opEnGd5Kii5Arzcc=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 08 Jun 2026 23:01:33 -0700
Subject: [PATCH v6 19/21] tools/perf: Add RISC-V CounterIDMask event field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-counter_delegation-v6-19-285b72ed65a9@meta.com>
References: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
In-Reply-To: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
To: James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ian Rogers <irogers@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_070309_262415_0776E6D8 
X-CRM114-Status: GOOD (  11.61  )
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

Counter delegation lets supervisor mode choose the hpmcounter for an event,
but the hardware may only allow a given event on a subset of counters. Add a
RISC-V specific "CounterIDMask" json event field, handled like the other
arch-specific entries in event_fields[], that carries the allowed-counter
bitmask through to the driver's existing counterid_mask (config2:0-31) format.

The value is the bitmask directly so no counter-list to bitmask conversion is
needed, and because the field is RISC-V specific it is a no-op for every other
architecture's events (unlike the shared "Counter" field).

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/pmu-events/jevents.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 457fce7a5982..c1ed8a05c9a4 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -396,6 +396,7 @@ class JsonEvent:
         ('EnAllSlices', 'enallslices='),
         ('SliceId', 'sliceid='),
         ('ThreadMask', 'threadmask='),
+        ('CounterIDMask', 'counterid_mask='),
     ]
     for key, value in event_fields:
       if key in jd and not is_zero(jd[key]):

-- 
2.53.0-Meta


