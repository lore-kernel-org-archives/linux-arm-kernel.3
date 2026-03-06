Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB05EF0182A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 11:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ABkanZA7mSS4Cmp/AVVTuo11SCyLRUQ6Ylv2Kzgw2mU=; b=iPXvLuy8qmh7ol
	VhT2vc/kIihwxzE28DAQVeznwfUpcw81fRgXBtq7vpJ6P3/C/JjhCcOk3NQ5fvLDrKYkc0G+Rt0CM
	nJok6WRTqTFgvrCfmWr/yxTajgjzg2kTqjCASOG7bskkeD4hsZpHrhMF86PqlGt79XmXzdd5/X6Y3
	Kv/NapPHEbpKwuPuiqjaRXZYKz4yyBKyj9uGvnyL/cRjOdAseLg+csAkryHARzA9NanLIWqZ2GdCt
	cO6KGzlKzOA7QElH1MoFctr7+bejKMquC9wHUyzReRz+eBQOX3WWv+OSo/6gxg4H+z4Yekd5acj+l
	lwNVOG7RXkuFXvbndhOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTIj-00000003Yqo-114r;
	Fri, 06 Mar 2026 11:25:01 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTIg-00000003Ype-1Wlc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 11:24:59 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso80263625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 03:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772796296; x=1773401096; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ABkanZA7mSS4Cmp/AVVTuo11SCyLRUQ6Ylv2Kzgw2mU=;
        b=Jy1NVtLa8+XBz96DX1SVqtUil1BMpJDJlN9EpmGZGKOexuM7V/BvuepWdGAyPbh9Ks
         dBL4XlN28KavNc0tipQ1/2J8xMC4rIva0imNiDE+hjUVW5omZaxWdLw9K8gT9AihhnMc
         CN63h5XkCAe5itk0N5rrbcFudLT5dnnFgKPeA1uxxU3P5oVqaxvFDr1kbUW1MupSMtRD
         zNBIK2DATV3a1018KS248RLCWwDoZCtzPjW0lMvxIgWLAxaNBDKuhWpzWiwp51pVRhYU
         RTX+XhYLx8q2LHtE4cA0mzs6bWVwcQFhiKurXR9uSa5wA7mPlR3dtlVn7W3T00oOn55q
         FbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772796296; x=1773401096;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABkanZA7mSS4Cmp/AVVTuo11SCyLRUQ6Ylv2Kzgw2mU=;
        b=c2HzB9jzDOP1lHW3URRqXQJOyGDrJe7QBDpcstwBmqa646REdcYcB22Hv2l0mJnqIU
         IxzTbsBUHqurrCEtsTubn8DW7Hg5OAeaGxtaVTUpeoVf77ht4t0sv38YGW6rs1lfT+zE
         51ND2t7+o1sRzy/6SriTITkomf4mjpDALF1+EiuotpGRCpE1obAiOYzCXtRtG1UF4Wd5
         Sp8ReglpHQntc62GzrJR55/Qu3jmyzC5FBAA6nTRpS2Hty/Tkn+gjhvxa+B3f6LgQPHf
         Rlyq2ut0OaRGzxf9p8BPOgwVAG1iGpwHitvPWPOFBQ33fA/1GfL+GHX716NwvSlq0Ifi
         jeHw==
X-Forwarded-Encrypted: i=1; AJvYcCWteqCCD2YB/ySu7rXl5DuVsDb8jCrcSSEGXdcc10lN44kvarhjR1B3hMxpag32qdOHTv/nPE31OOaWZMQ9iHQl@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfctbh0brINrTpMrIaslqBHQRExaEIDqrJIkfaPk6+L6yl6Awn
	yOz7VhYpc2wSgzoH3alpLmXR8UfWuWOeZoyaL8IGGgQI8fJYpR2uTzI1HqKwmLw2sZ8=
X-Gm-Gg: ATEYQzynna60qbgOXrL1/zB1fMko+YH079Im9aKKfwVm9Hby8ugNVSh6vB9tQsd9I5k
	JHHUpb44KSuAHVjsiFfTYlVbJTZp9Nt3gfeIRGMcjANTBMmjCBIQO5YrwJOOPMW5l0rFnOw11i6
	C+kdm5Dhv3o0X3HHUlu8naHrZr9whXiHwwUoFmR+QRLC5elTTkQgtUOSP7JAaBCJI6UDwOn1bBY
	ZLHYW9Ob7b9X+2YcxWToPRAz/hdHAVnqbIC/a3qbSnUSQXV+AVPB4gbr3Gk2SLBfdA4LGHZO9wh
	IpIKSsGPM/MdaFVB/kwXm0Lvdz+yC5WZEL30Cqm4p8BehK4RMZ6V+GfcPnQbWp7LTqHaknpHknj
	O/0TJo6DU8N0ysiOwuNF57U6gTyGYU+r+KTfRvOIYgmJoaN8lVfVe2xrwz13iClLSr4VhdRpzus
	LXcECXDdKcHJrqHEm8sFVrVpQkqKpq1SPb
X-Received: by 2002:a05:600c:1d1e:b0:483:709e:f239 with SMTP id 5b1f17b1804b1-48526951ca9mr27092225e9.22.1772796296413;
        Fri, 06 Mar 2026 03:24:56 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm66542245e9.4.2026.03.06.03.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 03:24:56 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/2] perf cs-etm: Finish removal of ETM_OPT_*
Date: Fri, 06 Mar 2026 11:24:44 +0000
Message-Id: <20260306-james-perf-remove-etm_opt-v1-0-03c662380361@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHy5qmkC/x3MQQqDMBBG4avIrDsQLaS2V5EiIf7WEWLCJEhBv
 LvB5bd476AMFWT6NAcpdskSt4r20ZBf3PYDy1RNnemseRrLqwvInKAzK0LcwShhjKmwN3i7l+0
 nj55qnxSz/O/38D3PC7VAasFrAAAA
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
X-CRM114-CacheID: sfid-20260306_032458_425293_BCDDDCA2 
X-CRM114-Status: UNSURE (   8.10  )
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

Finish removal of ETM_OPT_* defines so the coresight-pmu.h header can
by synced from the kernel.

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (2):
      perf cs-etm: Finish removal of ETM_OPT_*
      tools: Sync coresight-pmu.h header

 tools/include/linux/coresight-pmu.h             | 24 -----------------
 tools/perf/arch/arm/util/cs-etm.c               | 14 ----------
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  2 +-
 tools/perf/util/cs-etm.c                        | 36 +++++++++----------------
 tools/perf/util/cs-etm.h                        | 15 +++++++++++
 5 files changed, 28 insertions(+), 63 deletions(-)
---
base-commit: b1718b0367ba31e8db273e3896ebd1707bcbe59e
change-id: 20260306-james-perf-remove-etm_opt-c0e9a768dce8

Best regards,
-- 
James Clark <james.clark@linaro.org>


