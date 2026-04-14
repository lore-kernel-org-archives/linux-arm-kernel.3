Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51253F9D0C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 12:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eg1AN3CPIjuOdDVSv7pgWZI8ZtX7HtgIH7qnU4E7Mis=; b=oIRnXvU6V7gPEGNwZPklpaHMOm
	MHqkXMAzR/rqJQ3CKyhhVhez3mtJ8Sp4dNVs7F4IT6YHu+Gzqoe/I1/vb1xJvDwClXjjZbaIxNFy1
	I/rQBnvQi+MawHvVm3DXpMRvIdokoVvRim2dCZCHOSg96j8h7j+eTIPwnSaVjSpbepacO7mf8Uac6
	dLJihq29Z4QoFnLSiUpA2bR71Q5U373YLFCq9DC4ly2CxzWA0zF2Iej+O6WNwCi+fFFWfUTliQnW+
	lbF671THKSim6GUX2HFuSrIaJNRqkIJlOHaZh+6jr8FDAyM+7HWiMM0ONa18xE2If5AflCrE86MZa
	1UpLlrpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdBk-0000000HJuJ-0cBh;
	Tue, 14 Apr 2026 12:48:20 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdBh-0000000HJs6-03uN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 12:48:18 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-483487335c2so61422135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 05:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776170895; x=1776775695; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eg1AN3CPIjuOdDVSv7pgWZI8ZtX7HtgIH7qnU4E7Mis=;
        b=fj4mUhM6kRLaZe0N5Z4OQmTSzhQJt580l7guVL1TWzYPnWwyQbIPF//MnmlqpFKrK7
         8IMtLWfjwDGQ/8g2z1mQwNsGNnN6mx8N+3rBjwKhZiTfyXFJa8+U+X3dioP6CY4EpUdF
         AQIkYiU/oVrrzkXha0xqXuryrutDWGan2jhvOUYSxtnnZxJLoFcDR/1yeiRA8rFtERLv
         LxWcQSDyWGgKE33Novp/h6hM1lX266cU218lW/zAUmg9jAyf5ws3NPTi44WYBFWGSWNR
         VVQnSqnjES79mm9gL+8IhGTkoUOtvqY2+kNxUvfGlsf+3N3CHArxwOgyfmjR9BUgB2wE
         A4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776170895; x=1776775695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Eg1AN3CPIjuOdDVSv7pgWZI8ZtX7HtgIH7qnU4E7Mis=;
        b=PCrVUMNEw+86O2E7TB5fTRTRcOiKrqcLta6cvbWxHKAESREbaHcdP5jyce4/V/zwdP
         AGfEYSY8HM6eCN4Nc1AaaehO2+Jt7GqDyQrJNRWfysBOqIXPEmla5SGy4jRNXI96y/C2
         MPtD2rYn0FhDJLVwOge6nBW9MUT6sxeVlTJho6T8hNK4sFAvZLXfNICxQdz1KULuYE7g
         +hLmn52CPiLKQ1l3zn0Mr4kvhH4UwiPkQxKqHToghlX+ya7iqDtDHr0HBfF5psCGnCsF
         mBxEFoDB12eySpL8bpxYL3bDM+1WIKNX+/g/34WAQi/1Qk0XDLbafClflkfm0SRToW2K
         4+Ag==
X-Gm-Message-State: AOJu0YyghteHUMoGBdTzufdFx+axl3fAD4IuLciUqLuzu6bHPcesv8PV
	HaSZI/6KCuYIvQZc1itnGRN1XVYxxGuMZm7JJmwb6CIJ0O67p0oI+d6TuYnJD2YZAio=
X-Gm-Gg: AeBDiesTsXYTSAiUJHVma8WC2gfRLCpS8koitg1UASAUo5Iatff3vWs3xhluSVrAMBq
	P5koSE6hpzmCdDLhO6V7txOSI1Gnh3Ibu2XYALhbglX5/VqbuKoqjZOrh+3u8e1PpGAR0O9eNL0
	1t/pLvFcDQzjkdsSWUbGMK9gGTQjjHx6KizusWgcbDflTsJxHh+57978m/Z8PBCu8ewpVp61SGj
	fI+nVBmmGdjoWrnncTkZtxYFh0RxOjhJbW55/7Ff4mfUT+ZYzYw7H8ZrAqzMiJhTgkjVH80RUsr
	JbkQl52Cb9aD0IYLXTwb7zF4IJXUhIOldORAfaE/hOwRQZRcGgO8HvUoluKmh5DQahqLSp5Fhz5
	MXO5W7v+GEMwIEUMxAcap78klOaGNxzGTtpUHELoHWfPrOtkhQiQYYE4TJP9n742gBhMzEAIDPi
	Ms7yevTMqgOOi9k1IN9doN+nRSExEyqyjZ34JcloSV3KnGqvzhkCju
X-Received: by 2002:a05:600c:64cf:b0:485:b6dd:5066 with SMTP id 5b1f17b1804b1-488d67ce664mr229692535e9.7.1776170895003;
        Tue, 14 Apr 2026 05:48:15 -0700 (PDT)
Received: from e133063.arm.com ([213.137.22.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1e05bsm81185285e9.6.2026.04.14.05.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 05:48:14 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 14 Apr 2026 13:48:00 +0100
Subject: [PATCH v4 2/6] perf arm_spe: Handle missing CPU IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-james-spe-impdef-decode-v4-2-1dd30783a33b@linaro.org>
References: <20260414-james-spe-impdef-decode-v4-0-1dd30783a33b@linaro.org>
In-Reply-To: <20260414-james-spe-impdef-decode-v4-0-1dd30783a33b@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_054817_095737_33A7B8FC 
X-CRM114-Status: GOOD (  15.18  )
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

Don't call strtol() with a null pointer to avoid undefined behavior.

I'm not sure of the exact scenario for missing CPU IDs but I don't think
it happens in practice. SPE decoding can continue without them with
reduced functionality, but print an error message anyway.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/arm-spe.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 39046033e1433cff82ef0668074867aba4a462a4..037c7aa150c1efeda6e8e956a5b1db733e6ea74a 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -982,16 +982,23 @@ static int arm_spe__get_midr(struct arm_spe *spe, int cpu, u64 *midr)
 
 		pr_warning_once("Old SPE metadata, re-record to improve decode accuracy\n");
 		cpuid = perf_env__cpuid(perf_session__env(spe->session));
+		if (!cpuid)
+			goto err;
+
 		*midr = strtol(cpuid, NULL, 16);
 		return 0;
 	}
 
 	metadata = arm_spe__get_metadata_by_cpu(spe, cpu);
 	if (!metadata)
-		return -EINVAL;
+		goto err;
 
 	*midr = metadata[ARM_SPE_CPU_MIDR];
 	return 0;
+
+err:
+	pr_warning_once("Failed to get MIDR for CPU %d\n", cpu);
+	return -EINVAL;
 }
 
 static void arm_spe__synth_ds(struct arm_spe_queue *speq,

-- 
2.34.1


