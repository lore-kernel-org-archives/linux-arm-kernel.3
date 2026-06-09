Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FBFCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 21:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgVtMxeTabi2qa/uRjh4m4K8g73Uf+vTYDmsLtwzKZU=; b=0YOAwpQLYgvXhVprncJ13tcpSp
	/F2ioU0zOf2fyhkXSSeNulWpKnij+/JP1ULX6+KhhzgIC7erthCyww76LTLY0i90wNiTSAiq7DKKX
	jABDspbXYqDlEOIExhZQ8+ujKda04yQuDbxYwOICX9SZFoTkBgNZQszok9uQtwADBMrlVBkJ0vnl9
	kH/GbdnmYrU1soQXcn8nzrphbRoQW1kmxcnXCObKLqFZHZtDu8Aunps0DOoRJ/sw58kpwUVCwLp01
	GkQU0NI5Yv/Pbw0BXBNl4tcqHWZqIs5/2cV36wuzXO5OUJ7UrcDWwtS8G1akWru5MLp6xBQsEtKes
	J44moG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4Lk-00000006Pro-2Vl8;
	Tue, 09 Jun 2026 21:51:08 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4La-00000006Pi6-24n3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 21:51:00 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-36d6389bbf4so5738957a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 14:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781041856; x=1781646656; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bgVtMxeTabi2qa/uRjh4m4K8g73Uf+vTYDmsLtwzKZU=;
        b=ENMDLsMpB0Qswl0Ch8/g5x9STLR8B6rslh3A1pgUQmRMMIAYDA3iG0xiO8KFvWri78
         3J8j9gHKxpXsWa5rD0M5ssri1SjWergiSGWLSrGYHo7PuCa8PXru8nJ72rIwl1Ymp1ze
         iWLi34z9y0bba+M2znFgLBjOxqaDn3XNlHUfG9i+z4/4w/aXq+HKKT5VUP1f0aBZ9NH4
         ceyzMoawl8CyH0TkbLrDQCgJOxjvxECnm2Z8YqUp3VFkvNHomgVJU9AelP6/By/vVao7
         ZUcjrHStWvefoKuOt5p2iLTrop8YDIbmr/FMLONgF/nMKRZZSfj861smhIHHAJPeg3d5
         sE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781041856; x=1781646656;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bgVtMxeTabi2qa/uRjh4m4K8g73Uf+vTYDmsLtwzKZU=;
        b=NghJls8eMACZvWdGTNVl2MMD98yjhWf65os8Gs5wt8PoW6JrVYb5K2d9Hfd9P3Bwom
         KAvBRDrmjJduN8ZplHBLTjHO3+zfbRKRyRPvhCTkzkxe4cQL36iwh58EQrzU3mHoIOc9
         iKn90BjxnecOB4OifY34aVIweV8f5TcL0R1AzffPl/LY88V/V5UTJtuqupuPgtvfi4UI
         mFhNDuXznJZdFB4zXsnrGTrJbCrWhmh2ZHtDfXf5PvgiIR1YyE7t7/jEAqy0fM+hGurk
         jOgGAljhjXlmspAaRl7kof/D8pkr6k5aUu105EWCy1sRos9qb58E+1IIBmktOGns/+Nc
         60qg==
X-Forwarded-Encrypted: i=1; AFNElJ+oQShyM/tNIDIEC4KvjUj/6HeJcJsuqwUPAVQdvDMHAaLTuXXILtHkbIptz4tpUzOpiUt2By3BJByUurbtSQSY@lists.infradead.org
X-Gm-Message-State: AOJu0YxlbmdAtdBRVMKSCT72GwLinFzKaxF+UuGaIqaBdoqqWR1c7edU
	ehzSwrDSw/VZheDSOjDyVfwUM24tSDPkxIURu2FOp63yq4Jei99IzWwXOFPFrarq92jFkjId1GJ
	ogrQIxQ==
X-Received: from pjbfu17.prod.google.com ([2002:a17:90a:d191:b0:369:1a1a:82d6])
 (user=ctshao job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1642:b0:369:7421:75cf
 with SMTP id 98e67ed59e1d1-370f0284a7bmr20878362a91.16.1781041856338; Tue, 09
 Jun 2026 14:50:56 -0700 (PDT)
Date: Tue,  9 Jun 2026 14:50:45 -0700
In-Reply-To: <20260609215046.2391903-1-ctshao@google.com>
Mime-Version: 1.0
References: <20260609215046.2391903-1-ctshao@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260609215046.2391903-7-ctshao@google.com>
Subject: [PATCH v1 6/6] perf vendor events intel: Update tigerlake events from
 1.18 to 1.19
From: Chun-Tse Shao <ctshao@google.com>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org
Cc: alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, james.clark@linaro.org, afaerber@suse.de, 
	mani@kernel.org, dapeng1.mi@linux.intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, Chun-Tse Shao <ctshao@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_145059_020470_9995DD33 
X-CRM114-Status: GOOD (  10.15  )
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

The updated events were published in:
https://github.com/intel/perfmon/commit/8353ffb63efcad6b6fac1a8c05d76e2d6317ae23

Signed-off-by: Chun-Tse Shao <ctshao@google.com>
---
 tools/perf/pmu-events/arch/x86/mapfile.csv | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-events/arch/x86/mapfile.csv
index 6af3cee12c8a..a7f870669827 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -35,7 +35,7 @@ GenuineIntel-6-(37|4A|4C|4D|5A),v15,silvermont,core
 GenuineIntel-6-(4E|5E|8E|9E|A5|A6),v59,skylake,core
 GenuineIntel-6-55-[01234],v1.37,skylakex,core
 GenuineIntel-6-86,v1.23,snowridgex,core
-GenuineIntel-6-8[CD],v1.18,tigerlake,core
+GenuineIntel-6-8[CD],v1.19,tigerlake,core
 GenuineIntel-6-2C,v5,westmereep-dp,core
 GenuineIntel-6-25,v4,westmereep-sp,core
 GenuineIntel-6-2F,v4,westmereex,core
-- 
2.54.0.1099.g489fc7bff1-goog


