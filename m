Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4366BFEEF4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUsEosGHbHSKoT3nv7zDi6wwgNQYAMlH9EtHkBeF/j8=; b=kJqpbxYK7cNufzgoGCwagcsfOB
	xEgibngLuh7pvXdwZFBFLs/+bcPCJkZ42HmeToimOM+JHTuUcprjr9d3fEq3FQfgCL+KBtFg4rOcH
	O7/JZK3eDvI1laejBzszww48OApoXJRGqxDwkWukdUoCT55xEx6VLSKOnd1Gl4nY3aag+OSP7OKjj
	zI2RUZOypHM394rG5JhE7S6JRZEn14OiApjQ2BqRSpPF6Zbi/ct6LvnDW/02Yx4d2FPywiNekYDlc
	FSwvdtkC21rtvNXidWeMkiMFEcmtohSWrSMl0khRhUsLwbhIwWsjj6wdwv3hjFdxjRWpwgqfLXn9+
	8m8ftxnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA74A-00000006Z12-0VYW;
	Tue, 07 Apr 2026 14:06:06 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA746-00000006Yxq-3Xen
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 14:06:03 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48896199cbaso45373695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 07:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775570761; x=1776175561; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bUsEosGHbHSKoT3nv7zDi6wwgNQYAMlH9EtHkBeF/j8=;
        b=vBzx1/2RDzz87sq+0Y/YahGs0z6WBoxvIsfNjOke/ws2hQ1l+OxJ/b8aXSCUdP9kXs
         r+Pd0dHZWQhkL0g0E8Nt2chDPYoLPPCYcxWldVbcMtqK5hUe19KSWx/2a66MJL0zdiSD
         WiyUR8popK2x6b5vAbWggOvVzZ2Ruw5COuQLDJxu7IQoJn/Fq6DF1CQUfM9S5hh+1Dom
         rsoLQgLuWVd5jGYhSVJxWoTBwb9hf9YLN5MnaC5S/FtSmczsIqz0cXeIiZ3BebKOtoZM
         EGTBkZTdsgnLAe9xAKX3Kr9QTQcsIFsTmVTYkq5eMA6Sd40/2yY9YPo/sdu1E4dpGPfI
         fOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775570761; x=1776175561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bUsEosGHbHSKoT3nv7zDi6wwgNQYAMlH9EtHkBeF/j8=;
        b=oYObTLgoA8MFDfMCJmeM4zrHSVA50p5vCACDuuZaq07GVcHAMpTQYKrWViqRUBia4F
         SLRG8V1IV6Pq2wM9egeGGsdqiydUcBXfRcxNqlS6F/4Eq9aB/8mdCqSLcIVWbbG35mty
         oHopcP3k10wPP/UN2gGQ7cs9GpNcoIBrgtstFC7enimyJNpL7tozU7sRGxYt9rwfCNLb
         5iu5EFiZ6FiLG4MiuirUmQlBsNMZkLswVcgrXElPCfSX1iO4WijzzRlpHei+1ioaXuKb
         k8U2/Gz/ufuBWZ2JA/bu7dSgi8+9/wwAVpphbQLpFBmdkwFYeDqIo4AU7ZY1YkLY8frI
         8SiA==
X-Gm-Message-State: AOJu0YxPekZLipt1TN5rNW56FoLZ8T9vPCO3jG1UBGabVp/z371oeKg+
	58qWKA3Dnii5V94zc6YHY1RlEHAAgmjXY72/+NnhWCJEfxsGhXDmL5tEb4LmMVVmWRUxFh1dOP6
	gSHzWfTk=
X-Gm-Gg: AeBDieviso8as7E3FXjea5mt0jsNyDOsyXs27sLC2DzD4yK40OyYzPR5pFnAPo/JOSp
	Ll4U5tisNhrnyF8tcptm3Ovyt0QJoazZ95LDJg78/01ZZ5PWfBos5DLCusE2GWH+i8oXCGkSrfN
	a1oj5w1xk+hvrmpPAFaY1IFlY0DkWvZZZqGAcmlEALZVEbVQDciJbcXbXYA1oPp3NwrwmThq7oN
	1LGHDc6S1Dp3xGEW5Z8/2iPvgxHvBxdhqk5EDCGl42FJwF5dAfo/xS5AFyS81Om9xDgKL/fiANL
	72IA9Rh14d8gK+1q29U5bS26hMCagkVV7vjnYvZYqgHhnBe4KdsQT6KQ4lrDwysRYvIpSWCQLWv
	K/Osc0ssWFuEtLQ6lMPPzK34ZIzVpHHThcYD6siXfxX4XP4xJu+slknKkUAgEpIg0VNNZrMIYJi
	Va6jtkJoOrkHnqHOFtONfa8rD/vm7H4YLL9cZU+vJ3rZg=
X-Received: by 2002:a05:600c:5292:b0:488:966f:70a7 with SMTP id 5b1f17b1804b1-488996b02f2mr260622725e9.2.1775570760907;
        Tue, 07 Apr 2026 07:06:00 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e822227sm626876145e9.4.2026.04.07.07.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:06:00 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 07 Apr 2026 15:05:20 +0100
Subject: [PATCH v2 6/6] perf arm_spe: Print remaining IMPDEF event numbers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-james-spe-impdef-decode-v2-6-55d3ef997c48@linaro.org>
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
X-CRM114-CacheID: sfid-20260407_070602_911822_E288E272 
X-CRM114-Status: GOOD (  13.31  )
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

Any IMPDEF events not printed out from a known core's IMPDEF list or for
a completely unknown core will still not be shown to the user. Fix this
by printing the remaining bits as comma separated raw numbers, e.g.
"IMPDEF:1,2,3,4".

Suggested-by: Al Grant <al.grant@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index b74f887a48f2..c65b22a2179c 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
@@ -8,6 +8,7 @@
 #include <string.h>
 #include <endian.h>
 #include <byteswap.h>
+#include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <stdarg.h>
 #include <linux/kernel.h>
@@ -365,6 +366,23 @@ static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
 						   payload);
 	}
 
+	/*
+	 * Print remaining IMPDEF bits that weren't printed above as raw
+	 * "IMPDEF:1,2,3,4" etc.
+	 */
+	if (payload) {
+		int i;
+
+		arm_spe_pkt_out_string(&err, &buf, &buf_len, " IMPDEF:");
+		for_each_set_bit(i, &payload, 64) {
+			const char *sep = payload & (payload - 1) ? "," : "";
+
+			arm_spe_pkt_out_string(&err, &buf, &buf_len, "%d%s", i,
+					       sep);
+			payload &= ~BIT_ULL(i);
+		}
+	}
+
 	return err;
 }
 

-- 
2.34.1


