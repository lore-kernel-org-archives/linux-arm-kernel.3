Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4E5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 14:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5DTjVFlw3a1BE3G1k/Oc0pCRnQoWK8WuT3gO6hdQWPM=; b=kne+GqO/b54rW2sY/08fFyR+cO
	/XFAUYWygxor+mtdHBAa1mQzPiLxoC997BW2vF/0YUalILXljeWhZNGEWYG1CKv7yB0lP8151YEHw
	wIocx0MyNWZKFs9t35U9QhM+0gZ+RGyAZQ/Ml23UjYmJG1zu5NNUQ8jkf/R7bK8rH9bjZmxKLhIho
	lpm4WSoSWZvJ3W7CeKTeG4M2rffFd8esRe9oZzCG+uMUGRUGymIqQU52RLaIzG2m7fECJ8enwm3ur
	IsYF8QIYjXbmNG/1jXeqU6cULDVx84OTwyziNURI9rJtf+3je8vshr1oAMiESJLzfTOn1uKi3eKZm
	vex6ICfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVX5i-00000008nXu-1Diy;
	Wed, 08 Jan 2025 14:31:26 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVX4T-00000008nCQ-2weM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 14:30:10 +0000
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43618283d48so122101705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 06:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736346608; x=1736951408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5DTjVFlw3a1BE3G1k/Oc0pCRnQoWK8WuT3gO6hdQWPM=;
        b=OD0qnDn6nCqYKSBTHxiI6umnkjQJv4VTBQvFUTWOdMD+OgpLm/tSptjxFP3JAAJZTa
         7mWBScVeuE+X43gUrum+ADfcE6mroicUtHj9cs7k9AIt9HfFvjaLr2yf1Tl0Yqk5UEMm
         Mf2PZ18QJ2d7VWXUhTwxWYpdHZ+hOZiA/ft9R3darKKsd+3Td6bFejk6/41zB49Bio5p
         L+ojLCoiitCILdwsNuUV8EvKAZZx7mFF0/7n0WPk+WeaQg+C96pqFHBeKsOHnmVbU50l
         qDFPd4kCyQ6yZ6ZClXprx9li44NSF/sTzOD8bUZK3Q4cZLfBmAWMbc1yjeb6GU7MqPbw
         nozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346608; x=1736951408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DTjVFlw3a1BE3G1k/Oc0pCRnQoWK8WuT3gO6hdQWPM=;
        b=GMBQbO/gSK0E8idf6fg1LnqoC+2vHH8AtGNp1QguZyEGCqzw3EQmk2NEFyAfCtDbvx
         kQR0LN5nE12GwxZDqJi/KMkCm2xUHCcMbOg5mDlfuizURsf7bQRa6SuxuKSW+PTH4PG4
         l638cl7tmtnilje49CbEts1zM+HgcFR8heZsdAXkjbzKBiarpYPRIqTBcK0ErwQa5YOx
         97D0Cjb8Bk1D//cmELvp0nb15xzSWFqaWHyBe0F8movdpLSS87xKOsw+wzznMiTAQeNy
         r+eKLWYraVeEmMCRq4kLpu1wKGP+VxPi06RvSy2Y32GHi2lj458gHO455Fc8cf1sDM5q
         l6+A==
X-Gm-Message-State: AOJu0YxxVdthVa7eVznjL5NGywXB0Xu/dLzJWQLYXO7mFQWpg74M9xA7
	D3xBwDI6a7/g9sEiQlQnhGYL/kIuVP1l2W9+MdlBOF+NwbSsbPS69L/tvwPahRXil5VqVZHPsEm
	B
X-Gm-Gg: ASbGncuz/VHa8OUnAlj6Sd4e20MJW9gdeQ5psZsQSuYe3V9aLxYz/6O9od1StxSj1Ix
	J8CZ+i/WHrG2/bra5O+Wf2+N8srPLNlI1VE5WQb/aD6YAH3fPsNTY279Qxfg5UmgnvZXCwUrSpI
	MiR2V2GTMsaj07oHlYJZWruVAtiVrFg1sPtIYljNtza7b5vyMmAiBTZylhgSXvsKAugpNBlMUZj
	T+V3Mx1Ywccu24PRX5l3Mwf2QXxfk+2caNHNxRZoLVxv3Ed+Yn/zXCT
X-Google-Smtp-Source: AGHT+IG+cpKSlSJhi+F2YnCugAoch81HQ2u34rrtXJ7N+pJyIFTLAKd0EsB9c31sEmDi5t+EC9MrUw==
X-Received: by 2002:a05:600c:3b2a:b0:434:f623:9ff3 with SMTP id 5b1f17b1804b1-436e26a8c3cmr28551185e9.15.1736346607506;
        Wed, 08 Jan 2025 06:30:07 -0800 (PST)
Received: from pop-os.. ([145.224.90.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddccf4sm22836965e9.19.2025.01.08.06.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:30:07 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	irogers@google.com,
	yeoreum.yun@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	namhyung@kernel.org,
	acme@kernel.org
Cc: robh@kernel.org,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	Michael Petlan <mpetlan@redhat.com>,
	Veronika Molnarova <vmolnaro@redhat.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH v3 0/5] perf: arm_spe: Add format option for discard mode
Date: Wed,  8 Jan 2025 14:28:55 +0000
Message-Id: <20250108142904.401139-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_063009_734072_F3FDC29A 
X-CRM114-Status: GOOD (  14.65  )
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

Discard mode (Armv8.6) is a way to enable SPE related PMU events without
the overhead of recording any data. Add a format option, tests and docs
for it.

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

Changes since v2:
  * Use existing SPE_PMU_FEAT_* mechanism (Will)

Changes since v1:
  * Add a new section and some clarifications about the PMU events to
    the docs. (Ian)

Applies to v6.13-rc6

James Clark (5):
  perf: arm_spe: Add format option for discard mode
  perf docs: arm_spe: Document new discard mode
  perf tool: arm-spe: Pull out functions for aux buffer and tracking
    setup
  perf tool: arm-spe: Don't allocate buffer or tracking event in discard
    mode
  perf test: arm_spe: Add test for discard mode

 drivers/perf/arm_spe_pmu.c                | 22 ++++++
 tools/perf/Documentation/perf-arm-spe.txt | 26 +++++++
 tools/perf/arch/arm64/util/arm-spe.c      | 90 +++++++++++++++--------
 tools/perf/tests/shell/test_arm_spe.sh    | 30 ++++++++
 4 files changed, 136 insertions(+), 32 deletions(-)

-- 
2.34.1


