Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B7EC36011
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 20:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KssINcBHG6V5nsmKK6p0ubimcU1BXEQtWDJ9ECnykV0=; b=b+1S5Sw0ZbZicwLZ6/0N0yzZly
	aErhiMTzrJdzus4osqSgxc8aPYKURQ04PyCQJKnvVLwzYCnymaXxVjAJ3A7VjpQkuPenGtj8meqvw
	/ac//pMJmaPR6gKgFRDruK5NLrPFysF/L2mERCLK/epCIIIxU5pe5maqTXM82v/EgXBvR7qbhULBK
	GOgS37sA41Cyr4fTmXfrbG3lEYgr7TyZsRoKrwYkaXQ4BjPg8qA7e2LJ1qYYRj8yl3S/KhEQBss0R
	Llkynok7El1lk4JF4Qskx5QKTNNRQHpfU86MUN9BO6V+Ee7rlC4WA9KhMruQiU0qrpfOEJAV9d/FJ
	cuN7TmOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtUw-0000000BviA-2tlq;
	Thu, 27 Mar 2025 20:06:42 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1s-0000000Bpq6-1C97
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:41 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-303a66af07eso1936855a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 12:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104200; x=1743709000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KssINcBHG6V5nsmKK6p0ubimcU1BXEQtWDJ9ECnykV0=;
        b=Xsxcli3p4QXHyg5kFipIgiMBFC+oT6GdpgdSKOEsgcolkgu6hmUNqf9zQ10fyrmILn
         GNlDU7IyuohAhb5qpAhFCoIjzWiCuy8ZdIzMNvS3A3+1V7JoBlnBX+PFSWA8MGfR7eSd
         TiCTGm0S7Zr8plYOZxDYFXfPmIfHuGLXjy105ctW3OnLOHmm1zfFDeZxxDY0LzMOJyx6
         MKnihl9Q+4Pt+KjfOwXxlGnKrbK2gQvS0MJKtRbpbXHkgFMtmTiabQJ3vW2CNh+Qyuzj
         FOV+aviRuo4yOBmq9PCEcc/KDRdgL7AOfvzjmoce8annOifBwk20VnSlSQWyEYEzR1Sb
         9XRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104200; x=1743709000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KssINcBHG6V5nsmKK6p0ubimcU1BXEQtWDJ9ECnykV0=;
        b=IqWive7RA75f8PbdiU4izqrS0hxC2u9V6wozlbhIHqsp3uELwYyHy8ysRxbLDrKtsI
         0fL5fC8GylZe1kQUWTeYTkZLg5Spv4EJDcaM7/4dueB4PPg4G//w3psb46NaorF/A6AG
         oCvfwfmavyXTlQJdYuHnK2KD1c9yQoqJsbqk3M/o5WyBiUvoqa4CHZbJ8JSwA/QiVDCC
         xliDtzn+w2wHsd9wZkfsBIul4UuLaLwgrQuNNt+pFRl7LDqju4xE+EbRfr1GLCYcFHU4
         3taH2P9yzC388YAZ1sVXQG9A2PZLA/pIvWDRdTy68L9GeSUOM+sgWCHEcca62uIdG7jk
         AP+g==
X-Forwarded-Encrypted: i=1; AJvYcCU1+qX+lJQKx83C7VGItJtFkFeE5RVEle582pfCMMf7CliR4v1E0e4Fkj8P99sNffjS/MquoRgYDNGzB+RhkCC+@lists.infradead.org
X-Gm-Message-State: AOJu0YwkxgVOpTlnmjDSj5SCtn0Z25dR/XEvGAjaQ05/G2nUOoe46XGG
	OTYnaNlr4n2noq0e6rW1HCXi6Kd90F8qoxUQMFV6+kiq38vrsbkWyNATCOEsibQ=
X-Gm-Gg: ASbGncsr9M6ynikNzbyUm9A6ax9/UWhgug7W5q4xhnk7EH9wMLtaLFfbW8uykSQLKB6
	dgGOGIaujdmQfkSwBRSmLqFpbAB3ZecQEjSggvGkdsIqaLD87lUdnCcu7rBMBx81Jge06smbggs
	4S8/tSexSpRwJZ+Vc/QoaXm62ai4TbaVNf5FAI0c/YpdYC/4gkisBUtSD4CLu+IzMSo5zV1xmqj
	do01nOadYW7WAmHoxL6mpOmlA3j/AXSZnkrGOzbNU4KTHE4Bb5IESy1xM9KFR1pBp5S6RSOgdv0
	3EWAPxKHjZ26jwxDajNc8buy+JyysBSFF/nmkfai7JfM26rGZF6XLpu/ew==
X-Google-Smtp-Source: AGHT+IE2krN6Iazwz2/u7kYznnPmcB0AT0QBtnSPpGlLXmbNzMbs0M2bltPDrqZDoRjoQ9cuAJeaHg==
X-Received: by 2002:a17:90b:278c:b0:2fe:b77a:2eab with SMTP id 98e67ed59e1d1-303a8e7653bmr6347831a91.32.1743104199626;
        Thu, 27 Mar 2025 12:36:39 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:39 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:58 -0700
Subject: [PATCH v5 17/21] RISC-V: perf: Add legacy event encodings via
 sysfs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-counter_delegation-v5-17-1ee538468d1b@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123640_370469_C7D3DA67 
X-CRM114-Status: GOOD (  16.36  )
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

Define sysfs details for the legacy events so that any tool can
parse these to understand the minimum set of legacy events
supported by the platform. The sysfs entry will describe both event
encoding and corresponding counter map so that an perf event can be
programmed accordingly.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_dev.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 92ff42aca44b..8a079949e3a4 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -129,7 +129,20 @@ static struct attribute_group riscv_cdeleg_pmu_format_group = {
 	.attrs = riscv_cdeleg_pmu_formats_attr,
 };
 
+#define RVPMU_EVENT_ATTR_RESOLVE(m) #m
+#define RVPMU_EVENT_CMASK_ATTR(_name, _var, config, mask) \
+	PMU_EVENT_ATTR_STRING(_name, rvpmu_event_attr_##_var, \
+			      "event=" RVPMU_EVENT_ATTR_RESOLVE(config) \
+			      ",counterid_mask=" RVPMU_EVENT_ATTR_RESOLVE(mask) "\n")
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
@@ -369,11 +382,14 @@ struct riscv_vendor_pmu_events {
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
@@ -395,6 +411,8 @@ static void rvpmu_vendor_register_events(void)
 		    pmu_vendor_events_table[i].archid == arch_id) {
 			current_pmu_hw_event_map = pmu_vendor_events_table[i].hw_event_map;
 			current_pmu_cache_event_map = pmu_vendor_events_table[i].cache_event_map;
+			riscv_cdeleg_pmu_event_group.attrs =
+							pmu_vendor_events_table[i].attrs_events;
 			break;
 		}
 	}

-- 
2.43.0


