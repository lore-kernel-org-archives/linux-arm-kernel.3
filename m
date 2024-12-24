Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F80E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 10:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GC94EcAYbMBUjUIz25uAVNdsPCjZLYUODaiYVrPBPmU=; b=sCFOP7EvOjhCagPa3rtOiR9HSQ
	BcZsae+bX2lztcegLzJxoFCNDfFRxqo9az3XvPwaDVYymXltRKzSHiHV6PYWNvyEFhiZTDgm6sLBZ
	Bs9DNQJ9gxDDMoU8WUfGRPql+Q7qE+H5zK2xiklh9aC7p+R/dkk6Fx+h56MUhCjJGcJ7LD6tXYlEb
	0iFonkWPI1lXZgsv4wE19j+R0AhafOYiu4dsz2s498n0WP83b7UqWi95V6NfLGh2ICHQTlQYuKFRK
	k4BcLocDh/15qyht3g8AHgFyiWvuFOu9xMV45RkqAqz4+28wHJWz0bxuQVx5HuZ1JuSHWqrUNHeGo
	oST290mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2RP-0000000BnjZ-0Mzi;
	Tue, 24 Dec 2024 10:47:07 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2Ox-0000000Bn8y-1wuD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 10:44:36 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso4830517f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 02:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735037074; x=1735641874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GC94EcAYbMBUjUIz25uAVNdsPCjZLYUODaiYVrPBPmU=;
        b=yGSCMrK3JUHHQJdX4FwJFHz8r05vZ7t4/Yk+qanAIZMJFEfWOHe0k0kgv9HjTU1sxu
         VubOJkO00uREJ0DEn74M3DXjTIPS7fBZoqpH/SIWB+tbaMKD7jvHfk4/JKHwAgzbmX/d
         BHXhHXH9epChkwTOXEtObg5bPQ8qMh2S4bMRIHCVzb3/t8JIuBcp1O4/62avPRzXQUGx
         2qrWZOWY3gvRXdfZb6Phju5gwFIqVJEWahCeBQSm840Yee5xZqNe8ZQgQledUpuRPGe/
         aKDdSZbtuFK7evTSh7nEFAlT86016nI4sd92Tpgz8Opamu0mxeHvd4LzA8BigvGibNSI
         sDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735037074; x=1735641874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GC94EcAYbMBUjUIz25uAVNdsPCjZLYUODaiYVrPBPmU=;
        b=xEGAjcqemie1yRG3mK/ldvM8meHg8jKjkSH3yvJD9ocDIas6xXbyXhKF4tL6uiVWkr
         VViVy/tpike0lMmVw1odOYXJvVvsrayRTK52DqEl8NlxXzHf/xmeG1QA9I5tIVWFVMXR
         oEKRLx2zUxuhfek3xYMzObo68efZj1/lTwZWkzipLmgJukTiPkmxWntgj1ubXJahdMUu
         T7mv6WD3HDLTeaS8z8LsgE/rtgXRiDEH7jmM9g2HcbmS3+Bv0ycZAs9jBTMmBIjwDYRI
         fJoTMfbFUAXQG6L2Z2Rw6VtVv4zKyqCc+hOOy/rbkxeuoa42p0u0fx6IcvS+j+Qig64V
         4WFA==
X-Gm-Message-State: AOJu0YyOA445tluu9GQr2YWM7qcujHvx3Bm6B82TgMrxMnCbeZ4Uz3Lx
	js5nm4wT+638pa8F/lTfz+wq7gYQa2ZGx2Pk8DCSAPTNXcf5yZcjfW5SIYswNe4WoBJc9nLHmvm
	G
X-Gm-Gg: ASbGnctovG04kPWtSswXr+Fy2QQuXWUSZRT3ZPhVw9v8ajk8P2x11zyfAikJMoGp4C8
	wWYPu+uU1fiBMxX8IpX6u5ocPRrv9miLtgXrp7QOxfeHONvqm85biK9ZV9ME1rHp6L8M6lBKev0
	/U6kH8XJxDcOCA4EtUv+Sj//5H3gWKI+XdR1/weBL95PY7UZ4gHLmXKKEX1OaOzXmi/kP402GH/
	yWJevYMu59W5pzq1FeSrr/4dpffutgoQ1GF7xZy13vSRYBbMQEmgSI=
X-Google-Smtp-Source: AGHT+IGsMgTuO0pGQvcVI5qARtXeuTRPJmGG/qKyW3MAU5lGxMoG/jQVQ07m+joXnw4orY88L8Fh8Q==
X-Received: by 2002:a5d:64eb:0:b0:385:fb8d:865b with SMTP id ffacd0b85a97d-38a223ff5bbmr15275872f8f.48.1735037073679;
        Tue, 24 Dec 2024 02:44:33 -0800 (PST)
Received: from pop-os.. ([145.224.66.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847714sm13938184f8f.54.2024.12.24.02.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:44:33 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	irogers@google.com,
	yeoreum.yun@arm.com,
	will@kernel.org,
	mark.rutland@arm.com
Cc: robh@kernel.org,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH v2 0/5] perf: arm_spe: Add format option for discard mode
Date: Tue, 24 Dec 2024 10:44:07 +0000
Message-Id: <20241224104414.179365-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_024435_527934_4C0CE270 
X-CRM114-Status: GOOD (  14.79  )
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

Changes since v1:
  * Add a new section and some clarifications about the PMU events to
    the docs. (Ian)

James Clark (5):
  perf: arm_spe: Add format option for discard mode
  perf tool: arm-spe: Pull out functions for aux buffer and tracking
    setup
  perf tool: arm-spe: Don't allocate buffer or tracking event in discard
    mode
  perf test: arm_spe: Add test for discard mode
  perf docs: arm_spe: Document new discard mode

 drivers/perf/arm_spe_pmu.c                | 23 ++++++
 tools/perf/Documentation/perf-arm-spe.txt | 26 +++++++
 tools/perf/arch/arm64/util/arm-spe.c      | 90 +++++++++++++++--------
 tools/perf/tests/shell/test_arm_spe.sh    | 30 ++++++++
 4 files changed, 137 insertions(+), 32 deletions(-)

-- 
2.34.1


