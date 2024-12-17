Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB145E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 11:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uqzWbv8Vx54w1pLkcBRkhMoXdOrWLUel0oeu9kIT208=; b=2GtaudZ/UrRjP7za/Le2piE/L5
	akMEXfCfFA7NdfsneYvIkPiuOGUSTDuc+/E/WRm0PWDFxl0CPoEi0fF2CNy5wZnZ5GG5dxBmGz//s
	dJfyBum0gFIxd1WDNTBFItLxhAZ14i9eznGu5hXLwBM/3Gs3x+Mie5XFoEjPngg4bVjoMqWkXs7l4
	oR8+gF59toF1dFAbjFyABJNKQRO3i7Ku8ME8PQ8F3a/Uz5+ByL8EZ6G+OQ2riJDKf5+Oc+NtosGUG
	uWx3sxGW1Z46cduoMhVHDWRcl9LCMSvwz670uysaZRyX7fcEVPj6fNCCDBKOBY12ZDGG7kUVEUEEm
	jgWL/pEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWCf-0000000DJwD-1HFS;
	Tue, 17 Dec 2024 11:57:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWBa-0000000DJgH-0PKK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 11:56:23 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso36003715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 03:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734436580; x=1735041380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uqzWbv8Vx54w1pLkcBRkhMoXdOrWLUel0oeu9kIT208=;
        b=WvPBHl70ei0klTsZc8XM4Hr/4pd0jznJ09TeBRyrwQFflC4hH58UeGSpX7Adn8lj2S
         P7CcAfvWozjyTFqB4kaqsEb3uC8U8rctirCarqxN7YY/8OiTneRf0vJPSVNp81I0bHRC
         qbc0bbzI93h6rC9x190boed3gqy9iNe312HBs6iTsNPFW8fLD9ZBqWsC3EqaT37Etrxl
         XLxrTwsqEG2PYLlV8TbWj08J0d4cL6gXso5AerPxg9i4ejWnwJe4m2CBTs3PM0fz7/5V
         ZFsbQV3eV+VRmi++XJ7O5ESQjteZOKcX7BuyCGtnpQOErgkg5R1lMjpRUONNrT1Q2rrV
         5X/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734436580; x=1735041380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqzWbv8Vx54w1pLkcBRkhMoXdOrWLUel0oeu9kIT208=;
        b=gwxBjjJTdpJfXkD+O1Iyi6shgiaC1rMhtccH8FZyxu1ivkqLgEm4gfWQdiv+4r7ue3
         i6wKL2bIOiUcdiJbZFWfRjOYLux9//uDSYlggkyXjvLXYhfw4YaN/M158IhXSelXTzH1
         wL4osZDNgzp4EMQwMFrBeoUG4vuiJWLMQph8QWSnBKFDtBRaVVLi53JN8yx+FT+CWctI
         MJ3YZSLHK5aI4kFU081YHk6Uu9Cxc271ATsx6p72VTNid2GfYTGwcC/AJJe5WD5GoQTz
         oFiYy7LEIhjzSexFKNlFjmS6meUh8S5fNfVMEfdjunqkslH3GTpHTPYNVPReoLN6A50c
         3v6A==
X-Gm-Message-State: AOJu0YxsgLDVmYUvDLKiFUC4i7WcmyOfXXpdivSfb3/dtlgpSXOPjskY
	WxpAHOpkH0bN6Q3fM7tNAdLUMh9W9BjAMkCuPsLDUD0anmT9EKPbYJrrvAnksFGzWhiQZvwrLHD
	s
X-Gm-Gg: ASbGnctPu2qulq1el6QjgRkem3ndOwTWcHVEDOxeNvr/a5M30lTw2l+BcqvMMLp/z9n
	dku7wPcaDOIKbbYwlLg+gzGgtkwg7EKSEZFoHAMHf7A52EbIxkcxg74Pt6+z8m4tjwBXGepuVU/
	j9iFH6+U8DfvhfWLKDdV2r5gRJ2O97oAn4PKjHYhLTsFwY1FPEiLoELmtNT7zPUEh5gFf2u8gKV
	1nQwfai3lh6ycO1xongquKqUf3rFRaxjM5d4b8XrsAbO+6m4DcQc/hi
X-Google-Smtp-Source: AGHT+IFjDZqkiyvwauk6XlCYDztdJprHg+FIrxmThEaEHO34WOG2PpkjDIx179eIda/PttDeXCiW5g==
X-Received: by 2002:a05:600c:384c:b0:434:f871:1b97 with SMTP id 5b1f17b1804b1-4362aaa23d2mr133318405e9.33.1734436580421;
        Tue, 17 Dec 2024 03:56:20 -0800 (PST)
Received: from pop-os.. ([145.224.66.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436360159aasm114935825e9.6.2024.12.17.03.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:56:20 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH 0/5] perf: arm_spe: Add format option for discard mode
Date: Tue, 17 Dec 2024 11:56:03 +0000
Message-Id: <20241217115610.371755-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_035622_144759_C568DD4D 
X-CRM114-Status: GOOD (  14.41  )
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

Discard mode is a way to enable SPE related PMU events without the
overhead of recording any data. Add a format option, tests and docs for
it.

In theory we could make the driver drop calls to allocate the aux buffer
when discard mode is enabled. This would give a small memory saving,
but I think there is potential to interfere with any tools that don't
expect this so I left the aux allocation untouched. Even old tools that
don't know about discard mode will be able to use it because we publish
the format option. Not allocating the aux buffer will have to be added
to tools which I've done in Perf.

Tested on the FVP with SAMPLE_FEED_OP (0x812D):

 $ perf stat -e armv8_pmuv3/event=0x812D/ -- true

 Performance counter stats for 'true':

                 0      armv8_pmuv3/event=0x812D/  
 
 $ perf record -e arm_spe/discard/ -a -N -B --no-bpf-event -o - > /dev/null &
 $ perf stat -e armv8_pmuv3/event=0x812D/ -- true
 
  Performance counter stats for 'true':

             17350      armv8_pmuv3/event=0x812D/ 

James Clark (5):
  perf: arm_spe: Add format option for discard mode
  perf tool: arm-spe: Pull out functions for aux buffer and tracking
    setup
  perf tool: arm-spe: Don't allocate buffer or tracking event in discard
    mode
  perf test: arm_spe: Add test for discard mode
  perf docs: arm_spe: Document new discard mode

 drivers/perf/arm_spe_pmu.c                | 23 ++++++
 tools/perf/Documentation/perf-arm-spe.txt | 11 +++
 tools/perf/arch/arm64/util/arm-spe.c      | 90 +++++++++++++++--------
 tools/perf/tests/shell/test_arm_spe.sh    | 30 ++++++++
 4 files changed, 122 insertions(+), 32 deletions(-)

-- 
2.34.1


