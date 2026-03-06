Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF2FF01829
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 11:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mMT+D07w7rqjOY120b1nVktQhIrW6vGfucleX/0LgI=; b=Bt4kdRpifZooHDhrSKacl7tN9V
	j/AlUs6lJIBBqYhhA6RsqZlCbt30n3ipjxiGAUHxygpR5OQkG7vPyOp+z1YFeyFABtjpvBkYuyZG4
	4SCjZQ2IPTW1tBh+PzTdss0iYOnSpG9gK7HKBLrdglWBwOEq25wUrU5l/V4EDYCEy6k1aCd3CDh1z
	AVVD5+jY6belz7c6CSZOTwY17EmBLCPSTxeXffD0OkkGIGbK9caE9UJFa5stenTuhtAJ3akDbjo1t
	qiMD9cWNKzp3BZSPaFhR45yzw2IrGogOAYLncKcJ4ytve/4/HT/eeY4ACYI8Mc9TpN+bmx7I5JdeE
	KnoAnx/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTIl-00000003Ys1-1yTO;
	Fri, 06 Mar 2026 11:25:03 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTIi-00000003Ypu-1jMy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 11:25:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4837634de51so39581695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 03:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772796299; x=1773401099; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mMT+D07w7rqjOY120b1nVktQhIrW6vGfucleX/0LgI=;
        b=e7EGPD6wHGMSTOy60Pu/thDkRg7zVVBVKY7f8SMPMqLQM3GP79/3V2A6zgylw9VcO1
         YPIfxSGKXEOVuWMM5D+QrJ64sjvu7UGJ2Ygv3NZbb6jZLJHBpuleb+7F9cJGK2oLs5/P
         yNl1n41hXMl1HGQg96L2ZoQyZhMBALcyutzO6yUkXi5j9GavPy36YQfRjEM09XbgZyxi
         HqN31ZipjcL8F5/hZTHXpogRsA+EFdTW2Llvi5O/eH80/ngNS1obJtHvkmQHcu/e5xxF
         4KlM7x8X9RxhleSqsFRK/E8cZDLJbhS5g1p+F+6DIKUCpbj4iSeoe/9fbNoYxvcToCuM
         9dBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772796299; x=1773401099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/mMT+D07w7rqjOY120b1nVktQhIrW6vGfucleX/0LgI=;
        b=GHkEmgHVoY9B6939/Wi6nNgxdWgDTCj3ZeurBnWHRKa6ed/fYS22jUk7ssNaQj3Ksi
         +NcFDwA699dmdLtjPWiPFUGL+OttHw5hxuCkLtFglKG6wYuKFyAwDBLA7TGcNmI7hKni
         IViU7AQFV6kyw4TV7CM5alfYI1LEIncUOUPNqro6sAD31iRv/cq55IKRSV8TNTNNiVVR
         bi1H3iVkX2Kh4SXzI4WRgVF+zvIbLbj0um8rlDCO+woShWWJ1TZWEGuaq3j4BaHMX142
         gHNQy5EcuUC9fr6S5scH3YMyz+OC4TCP/Nf0aqRu0XpnBgdOGSHbFaZRCTD6jjtIXu72
         yiTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8QzUOsGYrKMMGd5HwBfdTYVpxDrJ7/Gt7HgFoVwbcUHbYO/jCyJTxMMb2zmXKr2vmp2boK1gf6WPEQZ9Df3IW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/jlKFY/EJXjSgVLJ8icUF5odLQpgJwn1cHcB1N7U3uLyX0j2H
	WcZvqG5guVIhh58VwspxiTsbVQTwqvMxAE4RAXCzcg2dOUQ/Wobj3RRrnZN8h+ojdic=
X-Gm-Gg: ATEYQzywFg1ufqeWpUepRx9l8+L+4v2ffh1SuJyUcooGZdMs3SfRxyGODLJefun3eEr
	shG41spm+KB8SeBqYkIWTJJt+TW/gedbc+jjjaI9ICA+M4Lx37TCxvnv1/Dzn8WP7ZRSFDnoIVN
	29ZtWfOL+Qp1dSbr1SZ70qjCKI8oY++KqeNBlmOBCCTLdcCMauYlhuoTu5qdwELexjdE4bL5Hao
	BPF4jNQwsbF6cTQ+gUD80a8EJMsD1PwrZGrn9lqSTOD1NaYgCp6ss5F+pNfR9jcsufzzfWBKomp
	959g2VdhAUjlnoH1JLwJRLUYkcgEjGguBwlE4GoePabce3flQ3kU2qrANVn+56r0PN6f588mj82
	0Qss+LyzoW+tOfHtjhJxQUCyGEz2b4byN+i7DvFrxAfwGGL0sKKNjtqYPOCOqFl5hS9sLtmXDRq
	d9gXZq4foZW9oMct/KRHrXsOzDv3KkJIyv
X-Received: by 2002:a05:600c:a12:b0:477:6d96:b3c8 with SMTP id 5b1f17b1804b1-485269648fcmr24117915e9.23.1772796298595;
        Fri, 06 Mar 2026 03:24:58 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm66542245e9.4.2026.03.06.03.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 03:24:58 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 06 Mar 2026 11:24:46 +0000
Subject: [PATCH 2/2] tools: Sync coresight-pmu.h header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-james-perf-remove-etm_opt-v1-2-03c662380361@linaro.org>
References: <20260306-james-perf-remove-etm_opt-v1-0-03c662380361@linaro.org>
In-Reply-To: <20260306-james-perf-remove-etm_opt-v1-0-03c662380361@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_032500_476245_0946B482 
X-CRM114-Status: GOOD (  11.25  )
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

Update the header to pull in the changes from commit 3285c471d0c0
("coresight: Remove misleading definitions").

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/include/linux/coresight-pmu.h | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/tools/include/linux/coresight-pmu.h b/tools/include/linux/coresight-pmu.h
index 89b0ac0014b0..2e179abe472a 100644
--- a/tools/include/linux/coresight-pmu.h
+++ b/tools/include/linux/coresight-pmu.h
@@ -21,30 +21,6 @@
  */
 #define CORESIGHT_LEGACY_CPU_TRACE_ID(cpu)  (0x10 + (cpu * 2))
 
-/*
- * Below are the definition of bit offsets for perf option, and works as
- * arbitrary values for all ETM versions.
- *
- * Most of them are orignally from ETMv3.5/PTM's ETMCR config, therefore,
- * ETMv3.5/PTM doesn't define ETMCR config bits with prefix "ETM3_" and
- * directly use below macros as config bits.
- */
-#define ETM_OPT_BRANCH_BROADCAST 8
-#define ETM_OPT_CYCACC		12
-#define ETM_OPT_CTXTID		14
-#define ETM_OPT_CTXTID2		15
-#define ETM_OPT_TS		28
-#define ETM_OPT_RETSTK		29
-
-/* ETMv4 CONFIGR programming bits for the ETM OPTs */
-#define ETM4_CFG_BIT_BB         3
-#define ETM4_CFG_BIT_CYCACC	4
-#define ETM4_CFG_BIT_CTXTID	6
-#define ETM4_CFG_BIT_VMID	7
-#define ETM4_CFG_BIT_TS		11
-#define ETM4_CFG_BIT_RETSTK	12
-#define ETM4_CFG_BIT_VMID_OPT	15
-
 /*
  * Interpretation of the PERF_RECORD_AUX_OUTPUT_HW_ID payload.
  * Used to associate a CPU with the CoreSight Trace ID.

-- 
2.34.1


