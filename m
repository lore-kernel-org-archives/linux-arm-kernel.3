Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C852C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 03:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Mime-Version:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WqiLWeTfwca+ZCiVwfRlVuUMX0C/baa/Iki7LyO/m5k=; b=diCJ6bZhw8w+AAM+V3m9ei2Uo2
	elAaWV2hLSrvdBrmi+CImfneajc/NEI3EqG/r6JIX6lbCOJJGUaUPbm5baE163WMMbGgNiZHwVLry
	sfI5YDYx1/pB2xWlS8QEXq/27NICBPgOFtEqQS7Jakp6ihlXQQRvXc5Byuh7PG9eerRPEDoBO2cXi
	/hZfmp4k48q2ND8lBlRT6tskqYBlaGZAgA1OKdRaYpIAB7Xu2HWRo5s+5HNjr8NpcykYNHisG7tkN
	Mh7TiZ2UnMSOctbDSuig9Sy1d6oT7vICKHyYsS3SAiqWMTJOd+aCTiYgvh3v8nvJ8lYMn4qe5R3pF
	JSrQZU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucyYN-0000000DpJe-3Zs7;
	Sat, 19 Jul 2025 03:48:04 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucyVq-0000000Dolo-4BfZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 03:45:28 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-236725af87fso40422205ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 20:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752896725; x=1753501525; darn=lists.infradead.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WqiLWeTfwca+ZCiVwfRlVuUMX0C/baa/Iki7LyO/m5k=;
        b=Rx4f4vLDbXBUFt+Ws3VDLLvZ3cvcojHGPT/6smhHAPle30gWmbFA/5t8+yH3rU0Up2
         BRo3OsaywLXMcx4LCwfXYzh/taCx9CMZRV/coDp/7C38rVFn5jZTvT5oH9RBvO7Y0Foh
         33Zvkvq29q+8SOeWxJmtBIoa9YfKLCLkIc0phCQUcIGaQiQJHemAaW8bnGom1O+mYdGL
         3TyI8hsXfG9182+fjt1UXFw+e0UAxOJR50B+2c1r+ikEQ+cwfTVsA0L6n0PZvG+24raH
         xrS+86pIUG0DzGmEWSb9E7faBWXlEVG0fkYzFC4qkD4f04tMyuMmlBEV4XuDpd4gaJPY
         KBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752896725; x=1753501525;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WqiLWeTfwca+ZCiVwfRlVuUMX0C/baa/Iki7LyO/m5k=;
        b=TqdEruF49Bl053u59wp1ihFWVVXhGuvpSOL57S7QyRNkf06b2ELznorsK6dp3MnpWu
         75EIuXUVKAETdrKpSKuwvR9qbevpI1TSpxHj0z5JQ6Oh0OBsDajG/09YkZwDAd6QVNBJ
         LvAh1//+roagX6u9rDcADW9t17c8vpN7iONLjGJfVjrzAKyjuQxPoSAba8U9n3DBaM/q
         Wj3gA+QybJBs9XwSRP9QgOmfd8ewFr+FZtivHxumVis6LZFMOQIu50a4Tw6IJixWfTBn
         bSmroMvBEC8VTRWM0K7061HFm9x1iSyMISok/n8ZdC9KU5xkpIXW96vqjJkU5FoFugMI
         ABjw==
X-Forwarded-Encrypted: i=1; AJvYcCULHguAIDYAwEG7ncz1ct6UgEJoZhGRLAOReLBeKEbZ7EvbLYM07GraBEd6uJMDLuO1CpV4vRUlffPBPuxZ/LTv@lists.infradead.org
X-Gm-Message-State: AOJu0YwGRQQWmW2CoGLHFw9Uqa8vu6ckt7DcnhJVJmXie3axxf5MBQlD
	Qua4zweSUxWat9xeudEHruiCptN7sw4j/0NVp1Bxm1Jjg0kC3x9jW9zTsxzbLjXX3+BLXje0Xkx
	cn5SQ5jg0iQ==
X-Google-Smtp-Source: AGHT+IHOdI8T6cUx74r7dZ/PvCczYxC1VCDvNVPBQLTqMZoVUSnomyHJted7sh7Fd5TYTJMr/OnALNl7AWMj
X-Received: from plbkh3.prod.google.com ([2002:a17:903:643:b0:236:945a:3454])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cf0f:b0:23e:277b:b921
 with SMTP id d9443c01a7336-23e3035f774mr127637705ad.42.1752896725602; Fri, 18
 Jul 2025 20:45:25 -0700 (PDT)
Date: Fri, 18 Jul 2025 20:44:56 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250719034515.2000467-1-irogers@google.com>
Subject: [PATCH v1 00/19] Intel TMA 5.1 metrics and event updates
From: Ian Rogers <irogers@google.com>
To: Thomas Falcon <thomas.falcon@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, 
	"=?UTF-8?q?Andreas=20F=C3=A4rber?=" <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, 
	Caleb Biggers <caleb.biggers@intel.com>, Weilin Wang <weilin.wang@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_204527_033972_3365BF20 
X-CRM114-Status: GOOD (  13.14  )
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

Update events from:
v1.31 -> v1.33 for alderlake
v1.09 -> v1.12 for arrowlake
v1.14 -> v1.16 for emeraldrapids
v1.10 -> v1.12 for graniterpaids
v1.14 -> v1.17 for lunarlake
v1.14 -> v1.16 for meteorlake
v1.28 -> v1.30 for sapphirerapids

Update TMA 5.0 to 5.1 removing the slots event workaround as the patch series:
https://lore.kernel.org/lkml/20250719030517.1990983-1-irogers@google.com/
is assumed.

The patches are generated by:
https://github.com/intel/perfmon/blob/main/scripts/create_perf_json.py
with pull requests 323 and 324 applied.

Ian Rogers (19):
  perf vendor events: Update alderlake events/metrics
  perf vendor events: Update arrowlake events/metrics
  perf vendor events: Update broadwell metrics
  perf vendor events: Update cascadelakex metrics
  perf vendor events: Update emeraldrapids events/metrics
  perf vendor events: Update grandridge metrics
  perf vendor events: Update graniterapids events/metrics
  perf vendor events: Update haswell metrics
  perf vendor events: Update icelake metrics
  perf vendor events: Update ivybridge/ivytown metrics
  perf vendor events: Update jaketown metrics
  perf vendor events: Update lunarlake events/metrics
  perf vendor events: Update meteorlake events/metrics
  perf vendor events: Update rocketlake metrics
  perf vendor events: Update sandybridge metrics
  perf vendor events: Update sapphirerapids events/metrics
  perf vendor events: Update sierraforest metrics
  perf vendor events: Update skylake metrics
  perf vendor events: Update tigerlake metrics

 .../arch/x86/alderlake/adl-metrics.json       | 104 ++++----
 .../pmu-events/arch/x86/alderlake/cache.json  |  99 ++++----
 .../arch/x86/alderlake/floating-point.json    |  28 +--
 .../arch/x86/alderlake/frontend.json          |  42 ++--
 .../pmu-events/arch/x86/alderlake/memory.json |  12 +-
 .../pmu-events/arch/x86/alderlake/other.json  |   8 +-
 .../arch/x86/alderlake/pipeline.json          | 163 +++++--------
 .../x86/alderlake/uncore-interconnect.json    |   2 -
 .../arch/x86/alderlake/virtual-memory.json    |  40 +--
 .../arch/x86/alderlaken/adln-metrics.json     |  20 +-
 .../x86/alderlaken/uncore-interconnect.json   |   2 -
 .../arch/x86/arrowlake/arl-metrics.json       | 180 ++++++++------
 .../pmu-events/arch/x86/arrowlake/cache.json  | 122 +++++++---
 .../arch/x86/arrowlake/frontend.json          |  40 +--
 .../pmu-events/arch/x86/arrowlake/memory.json |  22 +-
 .../arch/x86/arrowlake/pipeline.json          |  94 +++++---
 .../arch/x86/broadwell/bdw-metrics.json       |  30 +--
 .../arch/x86/broadwellde/bdwde-metrics.json   |  30 +--
 .../arch/x86/broadwellx/bdx-metrics.json      |  33 ++-
 .../arch/x86/cascadelakex/clx-metrics.json    | 139 ++++++++---
 .../arch/x86/emeraldrapids/cache.json         | 100 ++++----
 .../arch/x86/emeraldrapids/emr-metrics.json   | 131 +++++-----
 .../x86/emeraldrapids/floating-point.json     |  43 ++--
 .../arch/x86/emeraldrapids/frontend.json      |  42 ++--
 .../arch/x86/emeraldrapids/memory.json        |  30 +--
 .../arch/x86/emeraldrapids/other.json         |  28 ++-
 .../arch/x86/emeraldrapids/pipeline.json      | 167 +++++--------
 .../arch/x86/emeraldrapids/uncore-memory.json |  82 +++++++
 .../x86/emeraldrapids/virtual-memory.json     |  40 +--
 .../arch/x86/grandridge/grr-metrics.json      |  20 +-
 .../arch/x86/graniterapids/cache.json         | 227 +++++++++++++-----
 .../x86/graniterapids/floating-point.json     |  43 ++--
 .../arch/x86/graniterapids/frontend.json      |  42 ++--
 .../arch/x86/graniterapids/gnr-metrics.json   | 131 +++++-----
 .../arch/x86/graniterapids/memory.json        |  33 ++-
 .../arch/x86/graniterapids/other.json         |  30 ++-
 .../arch/x86/graniterapids/pipeline.json      | 167 ++++++-------
 .../arch/x86/graniterapids/uncore-io.json     |   1 -
 .../arch/x86/graniterapids/uncore-memory.json |  31 ---
 .../x86/graniterapids/virtual-memory.json     |  40 +--
 .../arch/x86/haswell/hsw-metrics.json         |  32 ++-
 .../arch/x86/haswellx/hsx-metrics.json        |  35 ++-
 .../arch/x86/icelake/icl-metrics.json         |  96 ++++----
 .../arch/x86/icelakex/icx-metrics.json        | 155 ++++++++----
 .../arch/x86/ivybridge/ivb-metrics.json       |  30 +--
 .../arch/x86/ivytown/ivt-metrics.json         |  33 ++-
 .../arch/x86/jaketown/jkt-metrics.json        |  20 +-
 .../pmu-events/arch/x86/lunarlake/cache.json  | 104 ++++++--
 .../arch/x86/lunarlake/frontend.json          |  40 +--
 .../arch/x86/lunarlake/lnl-metrics.json       | 216 +++++++++--------
 .../pmu-events/arch/x86/lunarlake/memory.json |  22 +-
 .../arch/x86/lunarlake/pipeline.json          |  85 ++++---
 .../x86/lunarlake/uncore-interconnect.json    |  10 +
 .../arch/x86/lunarlake/uncore-memory.json     |   8 +
 tools/perf/pmu-events/arch/x86/mapfile.csv    |  16 +-
 .../pmu-events/arch/x86/meteorlake/cache.json | 129 +++++-----
 .../arch/x86/meteorlake/floating-point.json   |  28 +--
 .../arch/x86/meteorlake/frontend.json         |  42 ++--
 .../arch/x86/meteorlake/memory.json           |  15 +-
 .../arch/x86/meteorlake/mtl-metrics.json      | 103 ++++----
 .../pmu-events/arch/x86/meteorlake/other.json |   5 +-
 .../arch/x86/meteorlake/pipeline.json         | 173 ++++++-------
 .../arch/x86/meteorlake/virtual-memory.json   |  40 +--
 .../arch/x86/rocketlake/rkl-metrics.json      |  97 ++++----
 .../arch/x86/sandybridge/snb-metrics.json     |  19 +-
 .../arch/x86/sapphirerapids/cache.json        | 100 ++++----
 .../x86/sapphirerapids/floating-point.json    |  43 ++--
 .../arch/x86/sapphirerapids/frontend.json     |  42 ++--
 .../arch/x86/sapphirerapids/memory.json       |  30 +--
 .../arch/x86/sapphirerapids/other.json        |  28 ++-
 .../arch/x86/sapphirerapids/pipeline.json     | 167 +++++--------
 .../arch/x86/sapphirerapids/spr-metrics.json  | 153 +++++++-----
 .../x86/sapphirerapids/uncore-memory.json     |  82 +++++++
 .../x86/sapphirerapids/virtual-memory.json    |  40 +--
 .../arch/x86/sierraforest/srf-metrics.json    |  20 +-
 .../arch/x86/skylake/skl-metrics.json         | 101 +++++---
 .../arch/x86/skylakex/skx-metrics.json        | 101 +++++---
 .../arch/x86/tigerlake/tgl-metrics.json       |  97 ++++----
 78 files changed, 2870 insertions(+), 2325 deletions(-)
 create mode 100644 tools/perf/pmu-events/arch/x86/lunarlake/uncore-interconnect.json

-- 
2.50.0.727.gbf7dc18ff4-goog


