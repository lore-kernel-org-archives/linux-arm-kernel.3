Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1BFFEEF4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpsJulnDdvHBRscZw94/N6Zs1iwUAKYW6ZQQ9YyXyQU=; b=seb/ca8I9O0uwdtgoNfjRXwxR1
	Hp6pY3GeHxUqn+UK1ZQ9waePH6Tk4gK66jenKFuRhlhTu1TH7kJ4hzma4HC0FtyGh2zqWfu4gK58Q
	EZxDcOx9dCa6GUCyY4NpyehiAlGXPrFAlJV8IqR02eGhmE5S2viDMd82Bizm7rY93brKY994FsQkI
	EMgbQl62WZL5YBV+jYUoxRduUw0Ol6x8HP6/YiR35RfQ6Secsv4cnN1D0nFdH9SKpTqCXqB8/4aFH
	flmhNGCiX7SYYgPZBjVpDSiLN6dL80D5f1CoqV4A1FuWTgvZcE1natRFFDJJi1wmFG7hu86hhpQZI
	y7msoIWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA745-00000006YxB-13a8;
	Tue, 07 Apr 2026 14:06:01 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA741-00000006YuR-0dpe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 14:05:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so32871855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 07:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775570755; x=1776175555; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpsJulnDdvHBRscZw94/N6Zs1iwUAKYW6ZQQ9YyXyQU=;
        b=tDY/yhVdv940NnvWnw207PT41xj8t5ADwXTUZQe+X4PmgvZCSIUoEmRSEbpFjzMCEo
         uLbNlaGJUGDQzQ4IjoKa/09UaYMrMq3PVIAqu2yZnQ8KxfWHRGB49tkH6pw81NZEaC2I
         SFBhJ+jXnpjRJDXVFwJtZ2368+LzD+wCY4Yi1tjBKwJtrKY7z8ureijsMPqzHi5K2BjV
         oICS2ee4uyd0qrJ3+m7NolTfQ+9t+c+Ay7VmdDCT3VbhuSGCTX6EkpG8btSsZ6CaJ00B
         iATu4aDF8J2Q9UrIPPfnJo+cVpHgYl9VVRWx1pZVe4s+SFIT1dKdLeDmHqk0wGMJTNQu
         K3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775570755; x=1776175555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QpsJulnDdvHBRscZw94/N6Zs1iwUAKYW6ZQQ9YyXyQU=;
        b=IzkuKd2lL7UgWODgxAVSCAPT9dh92j388PlkuOIZzBPmuLp2eZyWfbq2SO5W9Vybfo
         4C5OMFhubx6pRWs6u2Ioo21WGl+BZ+y8MzOdPypwhqgzOaZxhEcwj21IbSTVoEuhYOaa
         eqrYjX5vaIHpAZ2Liiy+bOp1tUXBOPoq9d/yy2EU+Yof9O0uRTz+FLjQU9T+TX8/KMYs
         wde3JOk/tDgavQuj07ibqDk4HHiPZIRI0lihHi1haQxz7xoGzXxCRrCCMyPwFKZXDiiv
         cL+Kk/+VKW1il0L+IV9IaIdA+ICRxcuz6vib0LeBiBH9ESAwXbaVOizncmAxxpCFt1hP
         vucg==
X-Gm-Message-State: AOJu0YzxNJLNo26cceJGGXuviUrejAH44+CAglvY0UKjL7B69XomEUqC
	tz3dT4qIbGr9Lt7QNvVJXv781+9KFZMHSLqYrw3S4iXXY6B89gxZkp/GILNKNNtAois=
X-Gm-Gg: AeBDietSPc0txgwm7sgu+gqHJD0XXFlqwoxpM2OmuFZYovjx0R5IfjgqnBaj3lCaoyu
	akEkPwG9C2V4K+1mpaB2ZA16VxBfaYMcHVHrzIYU4OPPBrzJjf2kJTQpoqJoZVc9JHTzs4627KW
	190RZMUIZBt+ZYgnmk+VAbzCCELvQ/dALBNvJqqXxFOQR5Nt6BZMbx75qf4oUxSEN3TgVVgkuBP
	w1/NodY7DVpIoz6kWPN80LHnY9YSz1xLm9C2ZBV9BWfp5Z58dZrfgQ8U6QJQYbekKXUpWgZcpS7
	2865aexp+f8mWvQfpnBz1iGLA/0dxK2RmB+FgIKb/KlfhN3IqQNjeA/8FsG1vtsGNbRWAFJbkA8
	NU82ogtawwis7+EnE4a39ZSpJI2TxDkz78WKEWYP76FGqm5lWHWBDd9wMkkQREphYB6e8BhhHO4
	Wwp6cMCevOFNsMJTrJhSAQcR4RinBHcrkn
X-Received: by 2002:a05:600c:a4a:b0:488:904b:f31 with SMTP id 5b1f17b1804b1-488997a44e2mr248941935e9.22.1775570755200;
        Tue, 07 Apr 2026 07:05:55 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e822227sm626876145e9.4.2026.04.07.07.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:05:54 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 07 Apr 2026 15:05:16 +0100
Subject: [PATCH v2 2/6] perf arm_spe: Handle missing CPU IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-james-spe-impdef-decode-v2-2-55d3ef997c48@linaro.org>
References: <20260407-james-spe-impdef-decode-v2-0-55d3ef997c48@linaro.org>
In-Reply-To: <20260407-james-spe-impdef-decode-v2-0-55d3ef997c48@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_070557_216971_F6D10E8E 
X-CRM114-Status: GOOD (  15.61  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/arm-spe.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 7447b000f9cd..fc11f32e4911 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -968,16 +968,23 @@ static int arm_spe__get_midr(struct arm_spe *spe, int cpu, u64 *midr)
 
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
+	pr_err("Failed to get MIDR for CPU %d\n", cpu);
+	return -EINVAL;
 }
 
 static void arm_spe__synth_ds(struct arm_spe_queue *speq,

-- 
2.34.1


