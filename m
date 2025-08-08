Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC39EC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 11:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=; b=DKBbQsNmkUmlDMtyGGK3Vzyjhx
	wHqmJQxfggAH6JxBRaTJs7WAIQjnhAd9YwSC8I9M62P6I1w+7QQ8C32t0mDnzRM8t2IO4nAgKz9mN
	bcj4ltU92AzcriaNDYsLJdQHAoRZt4Zk936oQROGLvah8X0+U0myqGYngcGZCxeKAPoL9eNU1YPaZ
	sxVWOoUImJ/Ax+Z+aOgBNRXbXcailu+KvG0hlQ3hruROnpo0+07xd5JGs6XwhEZqck4nPS6ZgBd4q
	WljNmg+IsiFm8qOpht7xRdzGn88yZhHJ8u/x0l6FTelwoMJglDUQfUxoF2m1CML3bURl/hanPQh2L
	jNy1ZbDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLYS-00000002iJb-0vUt;
	Fri, 08 Aug 2025 11:46:36 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLCX-00000002es5-00xm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 11:23:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-458bece40fcso11037075e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 04:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754652235; x=1755257035; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=;
        b=XuvWgdpTFRNlDsDoqH1LkQWFb4JzUc9ZbJMmO7PIJfYyYA8sLcJIkBfBZ+XoX21Lo+
         LCthHD4TWOaCqraE+dJBjgzVhkg+UyGue3Ae+2opZW8CCLQeVO9J2ONaWbF3gkrjlQZ4
         xg1MrfzfYcaXAieVa+c9DrFMADriLqoXLPSyU6pAeIEyTO28WwO5P0TcRniC95GIdZRD
         ZoT9OTLUZWQw9oE/8iqc77WJBCY4SE8aZ07Bc/NVnOjVB4XDjk3cLLHG990zhdW3omxZ
         WSxE0bgClgvY4kvNdx3jgd37h9GjgUa+qGePvm7CXIy8SNFf5wMqG4a8HONwplwZB8za
         Q1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652235; x=1755257035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=;
        b=f/K6JLCzSWtWk+awk6DzD9OrtispszR8yPcHFWPgG9GeGcYujUKu2fVqm12QZZWwjD
         9XseI7AFU7/IKdKPHI/pq8PLx2fa4FCL94A97wxNIA35HFvsvpsSfQnr0itKEtJdDUMN
         GR5t6mye4IWYigSbvwtV7rT3q9UTJbHyaiusqFcXmaFh6Q8Gxzaik4Qqn59eo8wvFyWU
         /mdu1V8j2lCVwCgKt7yNafQVsPj0Y2cXcGCtBpZwkCRRIG4Bx/wG6/eA+rNuZvgwPFy7
         0W6yD380qibup8UCgkc85k+I7rk4Oa2c1IxX58N/WxdsRk495wSgGNc7j33Mj1qy/16u
         OKmw==
X-Gm-Message-State: AOJu0YzT/vq6qrgnDuOeW6EgQdtL488Fjlo6SwaS71ApuTgxb7aqooyd
	KtZ5UsaMfbtjBoLrJ0qdDTAA4AMrwfaIidbOQ3x82XId1aDtkicNm75yrEADxLSit1A=
X-Gm-Gg: ASbGncvEIoT1OBiHl62d3H+SSqPKoabQSi+bcoS3o+/3IiJSciihAbesu8Xeo5UAPVV
	VAhNyoGZrSsoLAh4AR9TN+3vY6RH66+Z16nDepkJrFEefWietsoQPUNRLg9f8CgX7U3XkK550Ew
	QCde2RiLVS5lXnETGWMlvqFWQW3oOFFDGTBXdj3gplgKrjm+2fJ1lRk4Sgs4N1PPk7jw6fSfIGs
	WqpbpX1qbMQ1nFUZFWM+kTPLcSsJhXi8lIjufKsYKMWgBdeEG+l61P88yQjtqVgOJ8M2kBVvetn
	anJ8CJOujrDXZIwo+QFhNawx8HI0uHqAPrLyEXFs/32B/OWRh1830nuT2gynI+pE237cEZyMjZt
	3YCUp19pigT+K7s8Vhp7Pj5qA4tW4WoU=
X-Google-Smtp-Source: AGHT+IHOQ18gbVsDEVyKCfZAIEJklPYVqKw1aZ8vUXtA3WE+OW7IGcXWNxJyWSMYhUVtrh63ytt5Fg==
X-Received: by 2002:a05:600c:198c:b0:456:13b6:4b18 with SMTP id 5b1f17b1804b1-459f4fc3a9emr26503515e9.31.1754652235388;
        Fri, 08 Aug 2025 04:23:55 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45923c34af8sm233482635e9.24.2025.08.08.04.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 04:23:55 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 08 Aug 2025 12:23:05 +0100
Subject: [PATCH v6 08/12] perf: Add perf_event_attr::config4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-james-perf-feat_spe_eft-v6-8-6daf498578c8@linaro.org>
References: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
In-Reply-To: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
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
X-CRM114-CacheID: sfid-20250808_042357_040006_FFBE60EF 
X-CRM114-Status: GOOD (  13.38  )
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


