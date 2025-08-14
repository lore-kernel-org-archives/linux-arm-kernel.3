Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF5ECA0EEA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=; b=hIVV6U4miRTNW0IWvKt+QSOm3E
	nx2FUS6G6wTE7bGIRAi5omxPKZRjqekz5aAEyhOK6VDzI52TzFrT8WPvskHk+0Nf5S1DLAYJCCxnu
	k/sanMXW86fQEXN9uhsBrJe/YwMRDIV1bVY7pjFpPi56O4j7f4VTiDHluuREfEKzRojq22CXXwa+r
	aMOxA/NkfFLgpjdXplgD1elK7D30fL5P9zicK1exjN2lP24SxivDBW5WkRkCwusAlBKmAxSJXcUHk
	01RBx+8Jg9VttE5fRHOgjEiHAK4Au3f7UHzDSnKX5pX30Ovaid79mS8FmAUdxZ5hFqnuKFwg1cptD
	BCYhNGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXmx-0000000GxUW-1Tv8;
	Thu, 14 Aug 2025 13:14:39 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUDp-0000000GOmj-3BOw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:26:10 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45a1abf5466so4566105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 02:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163568; x=1755768368; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=;
        b=uAcKb7mFNa36enWJRlQUCHM4ekFo03AYMsancQ7y+vHBpjSZ8ldZm3JuWFv3+ZNl0v
         NSb3J2ZjMeA0jvDKzt6EYO8Aqy9LWdi5sNzoXrIeKEJtEyDu8RvKXsHAylHadCiHnIHo
         EJLZCvbmocsBo51EZ3XyqZ8FY58GcW9IEscdQ2XFCjVxaqOH7DMrsx6YzLnzuwmnxw1f
         dfxv+YlS6bw+675VpeG6YJxH/hyNgbTH0Xyk7snenaZmSolWTDQA6uH3LkK5mRokA5Oc
         eeyv5l5zPHGtCsnOzQpVrdGvz0Fm/25F2H8STYCXaKhECw2QAcLIj/JLlIALOqmncQqV
         /9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163568; x=1755768368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=;
        b=gdeGpCDpce+H0LbAVWciOgtBgONCIAEaXZe65rz5tT7cXB1dVw1KFnzW22tjOcxsHG
         ECZ+cL6lCJUWDv5ssIOuAhfikv8YGuyLWW2NOEN59BEdJtPTtGTxhGa0ymCrZmi34oYW
         FuLJG323wkSE0BRXcD0GmSy/XP/OazwfA8riak0cvjYBjYYVSaShF0KRNhubAhW2ezp/
         ItdR31P+cpmf9/oAFivxsgYpoUpazIDY0azWmx323RBowrtA9iZwLz4JsINu+j+H8FYH
         aOl3fCgQUwl6zBNCckmY67vQ6xHJudl3/NMQ4RgpWyEE6WVd779Zr2/f3S6iVLEhCP7P
         JY8A==
X-Gm-Message-State: AOJu0YxdAK8SViRO6rvUnDDUt4IB7lcIUH25dQir967JFtu1SaPVAkZ8
	ZdlHRdwsXQOLEcun26oxVuxBDc4EPBJeqdMuqO4wrAS5nVCfY2hpypBKVvKMv2AKm1Y=
X-Gm-Gg: ASbGncsp33R90RiY5yotehfYbPIfVoyzgLVpowaWRfGdOwRzCV3ig02NdQvt5kN1U39
	F9EmQ7zvLdLFrbmqSTQkUwvN9+SwFQXfaEkitREYe7DGAHD9xUAObpsvTkEdyluC/MDezftBM+N
	ic0hj+XEBcW8gg1sp2Jyuvaq2cz9/DNVlGLqFdNi4AsCPG5gZSlHv/md3PKCpzybSfEG5ioSPwU
	PXC2TEeH1PQ0X29cOyCcUVo50tAapLET0LmjJweQTcCJqsNAlx79AqSNIRNxwej01LM3eriZXxF
	g5ggPHa2Pc7/Z8fCuNOof7mlTCt40h3dC9O6GN/SDC/IrfrKvuc5sc4DXziGIPWhdQF7uzb0GjL
	n7SFrOPTrIOGYLf1p3sFK5gPUdCj8nt0=
X-Google-Smtp-Source: AGHT+IEfiNAJpBqr1EBOXZKivbX12m1SjqEMe6qLmXAWuSO2UYgUUw0TISQjYJI+9nhScFZ8SMs3Cg==
X-Received: by 2002:a05:600c:1d04:b0:458:b8b0:6338 with SMTP id 5b1f17b1804b1-45a1b79573cmr16522705e9.6.1755163568201;
        Thu, 14 Aug 2025 02:26:08 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c76e9basm14536775e9.21.2025.08.14.02.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:26:07 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 10:25:30 +0100
Subject: [PATCH v7 08/12] perf: Add perf_event_attr::config4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-perf-feat_spe_eft-v7-8-6a743f7fa259@linaro.org>
References: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
In-Reply-To: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_022609_801050_36371168 
X-CRM114-Status: GOOD (  13.17  )
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

Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
packet using another 64-bits of event filtering control. As the existing
perf_event_attr::configN fields are all used up for SPE PMU, an
additional field is needed. Add a new 'config4' field.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 78a362b80027..0d0ed85ad8cb 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -382,6 +382,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
 #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
+#define PERF_ATTR_SIZE_VER9			144	/* add: config4 */
 
 /*
  * 'struct perf_event_attr' contains various attributes that define
@@ -543,6 +544,7 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+	__u64	config4; /* extension of config3 */
 };
 
 /*

-- 
2.34.1


