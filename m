Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9BEF0183C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2YHVtNrer6ZgCaM7gU2oNTFgWRDR0cCXzcTFScMMl0=; b=xDbMrVr22F/QBYC2rzadteGfb6
	eES3GF0ksuTP/0t1+1iZ1LGpHTSTnsA+zKODMBAOznKibNSXKi8lHxWWZLGxwpyYROl3UdsepuGTt
	vy8yK+4q43LQfFGNqKA15z1jYKNoF11tCkJjLwxaO+AZ73n80g5b3hCi70t79vOJwCKN4gwFsJGww
	JJOJoGScMrDbXujx5OdshPKUmB2UitTlmWDa0E34hiccWklXv1XmznRaISnpR+nBAvuBGW0t7+TZz
	fULfW97q3XSvyoreOj5Zzgxh/NcLuKji6y85gd/RiweuZ3JgfyKcyAJlmLVSwdHURG454NCrFaAMQ
	8fnOkJLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVrL-00000003rcc-2Duu;
	Fri, 06 Mar 2026 14:08:55 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVrI-00000003raf-2UQl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:08:53 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-439b611274bso3765074f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772806131; x=1773410931; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2YHVtNrer6ZgCaM7gU2oNTFgWRDR0cCXzcTFScMMl0=;
        b=YoKCHadryw/pt11h2rRytjQ9m+de7VeL90IA1nCSNLwyPunC8yXCrGKzujmCyGSADU
         WrZBLGrkPVCz4jo40trJN/jfkMD/tNv/d6gPaH5R0rVEKIx5WAojP2HK6AAymizbnSW2
         /W51kkM5ymBTubFH5bDVILKM9PRojKT5/0GjbY81n1Was87LAsGgBAjM8VlTChBWM84E
         DAmwqYoyeKAd7pMxi429flhbFIiIN+PNmU1rzO4YdKKx0I2Wum37aWaLbCUoQrEqvFnV
         BbKZPzvPxJ/wJwthOCRT4EFjoDDNMV5C9yYslgZ/YFGFwwS416zu9i4EYC7/uXmKobQE
         SXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806131; x=1773410931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R2YHVtNrer6ZgCaM7gU2oNTFgWRDR0cCXzcTFScMMl0=;
        b=wT/ejal6So+nUf5cHs9/Fym6C++M7B621iIDBEZjZ+w/eVMfepj/bbSWPtOB3tAFMZ
         2DqSI5iIOSeGngI/CQGfPs5W9Z5DBJ/oRBX+E32nmxOmmfox9EriVrwqgvZCNS83B/kA
         O4we2z/dPV/gSftBqGUKyvtU4BAyskNJwHRM5QSLqazjrqwwcpksVlH4dstHL8eeZiAt
         TGu8TvpZWh2CTk5tLs4MilBKJy2otH7rLUbzBlUfBlhSnuv0Jgftxjtno4hj5kYWcNKp
         o5C1MuzmHIc7lKjrydNgNAZa+ghoUysV1rUtdUZcv937A5l8zYwxC9G9YVJPW/qGa7qS
         oTkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG9PFuUmOoqB7qqMXUKMLynLwF3uS27UU76kK7QkOqTHTDt6tuvF9s+bgBeYdLaqHFw1AGwM4/Pr93rmGKLZ1N@lists.infradead.org
X-Gm-Message-State: AOJu0YyVedYP6sKqdJE3TBT0FbbkoFXn89je4uqwm83g0LppaHejTmJE
	Ep3yZrBtvAHeEdOi3gViI1t73JZNkh+1rKD4yFbCYT8k5xaJ8yXY4mHUTXIq3cWfNTZaAb3ApJi
	hgqegOYQ=
X-Gm-Gg: ATEYQzxUfdS9UIk1uau4SLo3zt1rcVx2f2GzcmrJgnccK3CEG1K54NiAxHNmIK6FvQy
	tS1negiE4VV0Kw0BVJ7gHT82FTa9ICupSqv87qGyyVLEFSsKu/bT1PW2xy8ufRxIQ6MWBMwVciq
	dMnHoTulBG5Osd2oPbTZRUMXL7IV2EzdQpQF5g5o4NSzl484RzI5T9mI/Y2rJwYat7U11fNcXWS
	9/ROvPt78Y6Ygsu/gGekqUmj8ZT3drJ1phaHofSORY+HkmKF2cHq+PBqsUZeAZuT8rq4L0PGFK+
	j70QK/s67Xl71BxX1vuaaS7VBPmf2jC7gtsj53MEJZO6tfsiK4GgabEylEiRaUthh0+rdXjhztb
	SQPPYDR2ww2KEPLAxb2TOJONFBg2v23b52GVUPNgu5mFVgoE6No2p/WXQH0fWm0GWhc3W0tbIGF
	QrkAMIXXBUKD9qfKlEHqP5i03eGJsw4895
X-Received: by 2002:a5d:5f47:0:b0:439:c008:d81 with SMTP id ffacd0b85a97d-439da65c807mr3986639f8f.15.1772806130625;
        Fri, 06 Mar 2026 06:08:50 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2bdf8sm4212967f8f.25.2026.03.06.06.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:08:50 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 06 Mar 2026 14:08:35 +0000
Subject: [PATCH v2 2/2] tools: Sync coresight-pmu.h header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-james-perf-remove-etm_opt-v2-2-b411d3ae24b3@linaro.org>
References: <20260306-james-perf-remove-etm_opt-v2-0-b411d3ae24b3@linaro.org>
In-Reply-To: <20260306-james-perf-remove-etm_opt-v2-0-b411d3ae24b3@linaro.org>
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
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060852_684576_6731CA77 
X-CRM114-Status: GOOD (  11.32  )
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

Tested-by: Leo Yan <leo.yan@arm.com>
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


