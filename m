Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED80AF531E8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 11:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmMwrtSIePz754V0sje5TuC0YnmOAM3jxAH9WYpMnUs=; b=nHN8p/vFAg8ikYjMhGuKjCJQhM
	GR5HyXevB5W8T36ZbGIfdSEYVubvFEU/jZ11P5BNKEK0IWCu5cTt8GF2Hm9LVfq6JjTfj3wN4h2An
	Xn63ctpsNeYDueFZ7ENTdzoRrfc5g0v7yi4MOxNhc2XSkyYAzO5WUC30ULk4Y89oLVK6Xrk42xHUR
	ZkWslHqwB8GlItLPJJiY1FbT3UR63xxkyUIbnKh9R3Yhn99samPNEswPunsK9pjhlkRcnsefKy/1b
	Iq4nndnLbAXUmxTmUMmnBzr6adX1A0qoPS7/0jTyYHBObQF0eHsSPi6UsQIz2Q0I17wNkyYGAgEoF
	rk4GVKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbbO-0000000HCXU-17BG;
	Tue, 14 Apr 2026 11:06:42 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbbL-0000000HCUe-0ZaG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 11:06:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488d2079582so49234965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 04:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776164797; x=1776769597; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmMwrtSIePz754V0sje5TuC0YnmOAM3jxAH9WYpMnUs=;
        b=zFvKOBnnQL0CQEEvdZWWu3zqNyhH7IqWdDYd3oV3aNdbUpaR2SESNSBQ0di5+IV+9e
         dHAnTD++Oypt2UrbSu+UdGo67WJeq7WCepAdT5m9Lcix7ItjwrnB/Gz+iclL+5c4XBBP
         gTj3MQnJBzSYiD9PNNJJ1L7c+ftimsNzq4MM/4mT8uZOAMxv38QOxcm4qqh+rBQGdPrS
         Jr9OJaN6nZhsYQYgJrvbSzqgq3OlMdtX0v3guZ8pIuXfx/1nOlc/lLGdfO++7L1vMYZG
         U2UmiQEJK7gdOmZN/fKRNagvAQZ3x3LPASudYWA8zJBIg2UtQK4sKhcNbpN8XqnH1qtM
         te+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776164797; x=1776769597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SmMwrtSIePz754V0sje5TuC0YnmOAM3jxAH9WYpMnUs=;
        b=H27a00FrhhgUf8Er4AKu5oJI3ZDbUexkjQ/VtijHC/JVA7PAexaJuJqTkfUQJIQ9rF
         rFacAQNRZyC6rDWVRbcJL+vgpIfo+ewGD7WUSX7Vyuke6PfAfg/aYlV0C6hU/1lh5gCQ
         33UeIBtR3fdigeoNEsWJqx9bkrToxLe6u4RwvoMRVvnE2MJ9FSfPUuX9EjoUXsYDblU2
         esw3roL17Og5VoSSRSOWvZ2AMYu8UMEeYQXBIBBNkrKwPUKrl+9KmMe5NXtieNInsflq
         ME0Oho6YoBCJXBfZU3iYr+Ma0Lo+BrmRUIcCCqDHaxJhXqTha+AZHJjcUeOoigcpgJC6
         pcjQ==
X-Gm-Message-State: AOJu0YxugnyyGNrufvhJuCDK93Dsgo+qbt7XtL1yHbvXBhCqfhDCp1i9
	BaTi6kALStcMDt96zZ1yX+GyO0XeKjOpMx3Xa33jVyCdzGT2oDr1EEJGgPui2njYovY=
X-Gm-Gg: AeBDieua0LUvmit4+e6jQ36aQBWjEE49QdLKHUuwPcwlPbNUjd/QFK1W8NwPbRk4tD1
	fPxnwkRRuAbeD8seB5eZcBQVk8MmMWiNcq6z2XoNliXHj/FtaZa3pjWRgH12lMvFOmUDAfpu9sP
	PM0Ig0dX+j5SK+Zmi2+mwGvijaNAVrvcF22BZAWdr365/+EQ2Xg1sBElT7T8oBv5Yss37z6+xhv
	IZ87OR2d+XYjhJAaIkRyAixss8kePRQ1/Am1zkNiSg6R23zDnw/jpYylIKhgG27l3mr+yOgfObw
	w3K3RmL0x91tabXzRW8ejB0XewVdy0d8f78JIgY+NATgMQacec9i9no1UKkiDYQmAF1LTxD/8Oe
	UA/t27EpSLteTOgOXIkl8Okakk8Fj8kBVHY3EfRIVdkUT+tDvvwekwapO8cy83NtORKZixze0ki
	cAdkl21dtj53G7jPlovlXeQtY2GlUQWcW694n1B5xGWw==
X-Received: by 2002:a05:600c:3b24:b0:488:b811:51c4 with SMTP id 5b1f17b1804b1-488d6872ed0mr236056315e9.25.1776164797092;
        Tue, 14 Apr 2026 04:06:37 -0700 (PDT)
Received: from e133063.arm.com ([213.137.22.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d9dd86sm183254655e9.4.2026.04.14.04.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:06:34 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 14 Apr 2026 12:04:52 +0100
Subject: [PATCH v3 6/6] perf arm_spe: Print remaining IMPDEF event numbers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-james-spe-impdef-decode-v3-6-63baf9c893b1@linaro.org>
References: <20260414-james-spe-impdef-decode-v3-0-63baf9c893b1@linaro.org>
In-Reply-To: <20260414-james-spe-impdef-decode-v3-0-63baf9c893b1@linaro.org>
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
 Al Grant <al.grant@arm.com>, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_040639_203512_D12FCFE0 
X-CRM114-Status: GOOD (  13.88  )
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
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index b74f887a48f2a13b1be165947b4e3293f9987bd4..600677318f84c06970e4e618280c39cc83ac5b1e 100644
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
+		arm_spe_pkt_out_string(&err, &buf, &buf_len, " IMPDEF:");
+		for (int i = 0; i < 64; i++) {
+			const char *sep = payload & (payload - 1) ? "," : "";
+
+			if (payload & BIT_ULL(i)) {
+				arm_spe_pkt_out_string(&err, &buf, &buf_len, "%d%s", i,
+						sep);
+				payload &= ~BIT_ULL(i);
+			}
+		}
+	}
+
 	return err;
 }
 

-- 
2.34.1


