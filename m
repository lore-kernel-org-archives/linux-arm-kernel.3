Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E281CC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdlWRdH/H8iL8QSy1QmXwkvjy5+5wNnPwJoBbpgZwJA=; b=1DstZOxnkBKnHksLeHB6Ol1M3L
	TAE5Afu/tN4duP41TPRfPnlvMCUfT1x6wJZYysF5QSoA3qBIOvH6sly2YiElZVnW9B6zGN6EkOR0O
	ZrxJ442w66JqvnVtrKoFLg/pCa0PrV5ZrxNVez6HJFMJwOv/DrH/2/DzoE+/smdu1c/hFd06q3sKF
	DCjpSrGHG0g3oGwjAD7D0a/X8rSY/w+9C2/St3kIV8xxnCZTCx9F8hnNUei4eWRqx4px3gkfcjF26
	zxKl9XrBasqKvSWOlu7h0Iw04RJgWJh93AiIYz7uy0mEWHIeUbM939VfhsF9DUMSgmVqhc0bk/S4P
	1sZe3Tsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsd-0000000Cx3w-09mc;
	Fri, 21 Aug 2026 09:49:43 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLsQ-0000000Cwx5-1j7u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:49:35 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47f6609c657so374986f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305768; x=1787910568; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdlWRdH/H8iL8QSy1QmXwkvjy5+5wNnPwJoBbpgZwJA=;
        b=Oby0VcZBU2Cm2ntDSLa/JkiXithUlkAz3Gg+7Xl5AFK2DbCSOJksMQzWEJ0zPQNnOb
         OGyd5lL4tSfxCdzcbGnKAKgTl+d0uLMmq6oCCIKMVONmcFi5Qvg81rakBGhtJRMyQC5j
         MM5pBtfUpNNHYD+CpwF0c+rviS0dyYkY0CjWVTIjdcPStsf7qP8n3uYZIbalfrSk0Qkm
         FwDPDC6tqJ9qU6wkxfgekQt0OlN35YJFJE/5fOHGuYp7kiEmUMOvF5hCnmQg3scWBWMr
         c1c92P3ka7+3VoH4UCrzDl1YEtyV4QTzLIQlIKBcL+RWJgSqfHPXgPF7e55TNB6wUaoz
         eQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305768; x=1787910568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SdlWRdH/H8iL8QSy1QmXwkvjy5+5wNnPwJoBbpgZwJA=;
        b=G1cPNFFnmk9Aff20zl/iMzvwjJ4TWFnwUafKoPL/+8fWURpyaWWXFktzTprrErI3FT
         vttlyZ78lRfVtu0Z/JlMc5e1UmnAVqFAv8qODdBD0vxMzV++LOji/8s2zlMS7lM5tWFE
         lxEtpe1h1G8D5m/B9J9HBDMMdr6iJMPD5VxAq0LX5k2Q2tGyZ3yQXvWTPMo26tnwf78c
         68j+z2Ks+WqnR+Wq32xhQN1FjCEqAjn/ezK8vRB9ZuNL4EVhvmkeM3fPg3nvtngOFm62
         Bg24mCjjj8ZCpt+WWs/PRdi/3aluDV9SzHgbExsopwlegvW3p4NN917chvXDTplgDFpM
         fglA==
X-Forwarded-Encrypted: i=1; AHgh+RoZczzsqoXzycR+DdVJT0AqhWi2EFglAYJnp1i1IPuYXIQMvHHJICMkXi7tMt6mlaJaK1tUzBhmkgriEk6WGPRI@lists.infradead.org
X-Gm-Message-State: AFuF++lTUtQbCCllrLAuucjqOR+1NK/4p6pcbUyRce8xtmCk0oCRK34p
	9pM7W/3eXXS9tvBGvtW1Bes5JRgSGaScbRQop4EYYHliIMTl8lHfvYcVf/mMMYmoXqk=
X-Gm-Gg: AR+sD12dFzRWde3HihVx5j9ASyoUS0ojGIGaaXeP6YgBYHHWWnuTaCa2HGhLhQr//rm
	yRudFaxa9ttT9eumFu9Ahs9hWSKqwYl19cfku0DIgpsgCoc3yJTEom2PZreACfK3o9DXL8W92IZ
	9n3+k6bIohi5SN4gE6SsCIWN6yqxZNRm9MP3Rw9laDBAQRzhfO+CpEE/hYygC+fzS0Pru3iCLp0
	OOExB8u19/k6QBdbJYhimO4fyRkCbzvZwnVM3/5DDhpeDb6kTyLVYa4vmJnU4KE0CvuKhzDu0rp
	IpLytIkqgWrsuqGKo4/CzG39KnXvg22Ez22KxhfAMgHwK6HEm7m6MVRUHIphM6eZJDRd2jZ+2VK
	ycGGlp2R9Q9CZt2/ZYe2jsZ6Z5f/2QpgcQlyd1dbgRE3qTIUIZ+EE8yTak+Lk4rO+JAYmeAy798
	cf5D+n4PV8GkN/HkgxRIIOxdcDtM1LpLNXvfQW17fF34eZuwDvRWyNnmUnbzaXWlEf
X-Received: by 2002:a05:6000:1aca:b0:47f:86af:8fdd with SMTP id ffacd0b85a97d-482c0b588eemr5703982f8f.3.1787305768520;
        Fri, 21 Aug 2026 02:49:28 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:28 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:01 +0100
Subject: [PATCH v2 03/14] perf cs-etm: Turn on context packet timestamps in
 per-thread mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-3-00c4fd0701b4@linaro.org>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_024931_926236_30D0FE08 
X-CRM114-Status: GOOD (  15.60  )
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

Practically this costs nothing and preempts future changes that will be
made to support decoding trace in order with Perf MMAP and JIT events.
It also helps keep samples in order when we add support for multiple
per-thread mode threads in the next commit.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index acfdb3f53821..d0486a164a70 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -453,13 +453,22 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	 */
 	evsel__set_sample_bit(cs_etm_evsel, CPU);
 
-	/*
-	 * Also the case of per-cpu mmaps, need the contextID in order to be notified
-	 * when a context switch happened.
-	 */
 	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
+		/*
+		 * Timestamps are required to interleave samples from different
+		 * CPUs.
+		 */
 		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		/* Context IDs are required to associate trace to a process */
 		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
+	} else {
+		/*
+		 * Enable context packet timestamps only (no periodic
+		 * timestamps). Even in per-thread mode with a single process we
+		 * still need to correlate trace to a specific mmap around
+		 * execs, which can be done with just context packet timestamps.
+		 */
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", UINT64_MAX);
 	}
 
 	/*

-- 
2.43.0


