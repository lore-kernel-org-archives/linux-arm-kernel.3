Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6627CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7TkIz3XcNZzBFScIUbNy9ytIHILZUanUufywGu/Sn8=; b=QwCTzUz5SSUWWPU+IYYs02fduh
	4I1n2SNoVISNSc/jmxeRHh8leIcUpxhpIo5er/fK02O4rJ/LO0ebXE2N+gPr0lgKjJiwDijoS3fxK
	Sxxu+yjEhqzB0ZVnLdQkcaq7r+oojG+eGRrBRJJnLQXlZZcvj8i0zk01huRz10aBBLX3EcsONX4C6
	qg54VM7jGlw44WEjZTRV7yNiU3yr1e50lRWr2MFm4dlUpXqm2oJVBpSc3/UXXXlN8lb9B4q+HHU35
	QGoHjqMgLA3AUEdASc8RVv6R2EiaQyTDW9nRv7tdxm+l0sw8TBFV6+O3NpfGKQC085dUHQu6V9XSg
	3Y56dsXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHfM-00000009MAe-3FKX;
	Thu, 01 Oct 2026 14:21:46 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHfF-00000009M7F-071r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:21:39 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so36152955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790864495; x=1791469295; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7TkIz3XcNZzBFScIUbNy9ytIHILZUanUufywGu/Sn8=;
        b=jqqDcfeE92tqOXlaz+ponrx+wgA6kHJ9tjOpjKS1Zi/hy1zpwCZChNSruA3aC54Bpi
         7Ua9jsjQElJjqZpsP15LrfxUVMuauT94rlAakC2dsb6IqaUUGx7avzUeD1+1lPG59O9T
         SyDGYXLZCZTjWhFTk5cwMnJJEoFjc+dJBPoyQsUC4S/lGAsVfa51hx/bbArRPap67OVs
         R6YjGNS9BKcxtiC/OCxo240VCrS9t+pSJpnwJL766mViu9WTHYoy5dsQSCDCxf25YdVk
         LZLw3CrPKMHiR3wLlVWkLl2u7uVL5AltPvVcVI0Kx0OyHFbJdx/Pc1528PMpssRifAH0
         llGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864495; x=1791469295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7TkIz3XcNZzBFScIUbNy9ytIHILZUanUufywGu/Sn8=;
        b=OYFFke4aM8P+OGD9N5P1LlEsBEY4qD6kJRywZ1x37w8KoSRMVyAUNc36/pB40GB0Kj
         i1DueGJ3YkCVwJwfS6nO1+Nie+8O7bhGFBSFuktiapYo+DS0/FkR87mzfCCbYsH67fFE
         a6aVsc9sOpDM93+3ijSkYMFea5MyCAU+J7CSBAPueKKnHrjbSfKX1M56SeB3ks1B6TJj
         Xwaof+BVB2Met2vw4aKaeuAtWSidK2RBAYVkCC3e82ed6cEDmftW/uuat+1DVHJIYaUI
         vIbYXSgr8wcIpZaWKgQSqr77psbxfeyRPXZuUKgb1kkD6qxu+bS+AhOJhSd1tlsPt5vF
         taPg==
X-Forwarded-Encrypted: i=1; AKwUvBy1ipR2K1bcl/F+P4EUqUiNdpv/THXulvKxUtmFJHbuq973m0DkDe1VmE2J+xsvp5Eb4ZvTKZW7MD88H2cbts0P@lists.infradead.org
X-Gm-Message-State: AFuF++njrcUHg0mOn3yQMJeKhdC3ls4L5+6OM2Fdk+znoufWEoLUCTcX
	lRnm/r/xDN8Gf+U+BlcH7jnVGa94GklxctkYPh2bQMPRuxnLj01LUXr3fysTU0qU/Zo=
X-Gm-Gg: AYBFou2OI5knBXPdujrUcvNaXXMzgrgoQT3F+uEHOxcAWQMPCKOp9x0+f8NGN5/oIqr
	O1JNpQWDyRBv1trP0paSe67LhHWnhFFpGcjpPvbNnwGWuKXqZGejcvmQNG77cHt/s7kLL34HQ6A
	oNT/jGbw2IQBhaLBCoUsAuMFJE/QgvvwGkYuLQ7fE1f0nOt+oJgDZNCGQeqQECwLZYgX87dbYFo
	LvbzUA566zhFSRfmqI1Tzkg6PrHfUKwMKr4tMrxdJDKZrDNoBfCaZHaapD8Vx4vtOark/NJwTzE
	KRJqJwahzhmZOTrr4bnXFY/lNZIagGak1y3YA+yNVZADNqhTbOT/4tG5LDuF/LFBEA6pOXJcY5o
	cL64ZaPVyTRNU7qAVwsMlLS86bls8twWaJvsy6BTNQoqacl4c5J7SVKgk4Aq86ExekNl0N4vkBw
	dWvkQvgDy/u+qg6GJU6+iV1XvbEgo8S3q13wusC0jw1swE9c23BWPM79cpeXAXXRDz+3z9XGwq2
	g==
X-Received: by 2002:a05:600c:638d:b0:4a0:21b9:a55c with SMTP id 5b1f17b1804b1-4a021b9a5f4mr42960425e9.29.1790864494791;
        Thu, 01 Oct 2026 07:21:34 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a020f7f1c2sm34783975e9.2.2026.10.01.07.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:21:34 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 01 Oct 2026 15:21:15 +0100
Subject: [PATCH 1/2] perf/core: Return errors from
 perf_report_aux_output_id()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-james-cs-retry-hw_id-v1-1-4d45ab46cde7@linaro.org>
References: <20261001-james-cs-retry-hw_id-v1-0-4d45ab46cde7@linaro.org>
In-Reply-To: <20261001-james-cs-retry-hw_id-v1-0-4d45ab46cde7@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_072137_819251_5E80411A 
X-CRM114-Status: GOOD (  13.87  )
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

It's useful to know if this failed or not so a retry can be attempted
later. Return the error code or success.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 include/linux/perf_event.h | 2 +-
 kernel/events/core.c       | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 48d851fbd8ea..01d318a4de50 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1896,7 +1896,7 @@ static inline struct fasync_struct **perf_event_fasync(struct perf_event *event)
 }
 
 extern void perf_event_addr_filters_sync(struct perf_event *event);
-extern void perf_report_aux_output_id(struct perf_event *event, u64 hw_id);
+extern int perf_report_aux_output_id(struct perf_event *event, u64 hw_id);
 
 extern int perf_output_begin(struct perf_output_handle *handle,
 			     struct perf_sample_data *data,
diff --git a/kernel/events/core.c b/kernel/events/core.c
index d7f3e2c2ecb1..232da3b6f393 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -10563,7 +10563,7 @@ static void perf_log_itrace_start(struct perf_event *event)
 	perf_output_end(&handle);
 }
 
-void perf_report_aux_output_id(struct perf_event *event, u64 hw_id)
+int perf_report_aux_output_id(struct perf_event *event, u64 hw_id)
 {
 	struct perf_output_handle handle;
 	struct perf_sample_data sample;
@@ -10585,12 +10585,14 @@ void perf_report_aux_output_id(struct perf_event *event, u64 hw_id)
 	ret = perf_output_begin(&handle, &sample, event, rec.header.size);
 
 	if (ret)
-		return;
+		return ret;
 
 	perf_output_put(&handle, rec);
 	perf_event__output_id_sample(event, &handle, &sample);
 
 	perf_output_end(&handle);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(perf_report_aux_output_id);
 

-- 
2.43.0


