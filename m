Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9BCC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 11:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6klp9EUNzNQb89anQF9S8nNJOTrH6bgf7Ht0lN5b5Y=; b=5BWHkxlPiovwcpuIXKzektiYhb
	KQxH4vri665TExk1HDdLUjbHHAx1CYqZ4MaXeV/HLJtO4aKvJJyqsBbKy/8ONzO60HFdFQ9/nTcM8
	Dd0WQoKZWCjIwiW16cUAbR18n3miTYVbC9w7WaqzJNydxCvVr1z/7gF5GzS4Q0/fRjo1pQDZotZ03
	s1Jpq8dJTzMNK2pTEgKVxnKVmOq7DaaNvs+NQOLAMCnslVSlS9TYO3jdR97q225mcdtr8h3fBY9SY
	e0Wc14jLHeRjp7Xf/1NXIiYztn2EcSfg2C9Qmaz5PgJahUEBK7EqU2E2Q3T8IlhyRM2+rclUYvYtM
	exMJ9KGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8Ub-0000000FKuV-1tul;
	Thu, 05 Jun 2025 11:10:41 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8Ap-0000000FIJ4-12gD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 10:50:16 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a510432236so640193f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 03:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749120613; x=1749725413; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6klp9EUNzNQb89anQF9S8nNJOTrH6bgf7Ht0lN5b5Y=;
        b=OY99CO2BOcS33QAI3v8b9beCYWTcijUQoW6Wk7EcAOwTbXA1ULXoi621CzL+VOcqTP
         vvvs5cyiSMgR3+DfsSDIN7HY0MPx+n7pyj9fQfMLSXWZgkoUC7/92A0yBQoni8Kj1n5Z
         7y0n+8bKS/VLvt+EU5inzXU0F4lxizmlf4S+04YYSjfYjyN+8iW9WN2ZkbtdcdrrcKXF
         Zz/uEr9ORqN6W9nOANOc8sm5YEJHTa0u64lz8Jyq0a9c/Ndoit2WJvnoyccd8JTsnEJ8
         RGmQy6jtrVFhj2E8+dL3LzcV/QLQrJ5TTh+J7SiqNVSRdVIGDWAdXi3MJtvwz0vxNZtg
         onkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120613; x=1749725413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6klp9EUNzNQb89anQF9S8nNJOTrH6bgf7Ht0lN5b5Y=;
        b=e+zBrA3+MH+0KLvcWgNmpdFP+DWtnAPaP9oi7M3xZc7RHX7b8XZvxOPyGw8fCFKBLC
         Jnnd2sVOOsxtOac3UodireU0Rb6VQbs+ztSDHqYMMwEQz3EYT3PGWvK62BvqAhAVjdfX
         9SI1RLKxLFd+SouI0HAJOMZfsutzX9oARnMspESAhlf/Wst5FyW1kamCsuWpSAIC7Jyg
         +ZpHuDjkrDFMIXcUvjmI9VtSbqjZ0JrT+NV5VriTSaE8Dp5tGHIALdXFtFkeihi23Cg+
         Uwnx+LTmdgtInLpI8k6zup6HE5LzNDSnJHv6/YYYCD025rRZvmufPTc+f1zk558bj+W/
         Xl+A==
X-Gm-Message-State: AOJu0Ywq5EuH3810K6EgQ2qKn2SOADHWDM4Dl4/dGj3JVyYp4VOfZnxT
	mrY69mhN9UGI+CMEos546K8ogRItMBfunMEDLDgWgcxOKE9XOzcdQtzQ8N7dhan875A=
X-Gm-Gg: ASbGnctmzC5zCQw6itUfUwMXd4pJxjeu0ggG4pGdhQImHWHtN0gvk2cYQNfAmYD6bci
	0VZ8/0IASR0OcrlDrsH+WQTsWlNctdBgbIfUMGW/bwddKi6NTGvA9ph2c1wCb4RhumyZZXSXKY/
	lvWwLuqnQNnzZZSiG3zG56sUA3QC1UIsp65r7zkP437pzur5mn+aZ5z6rCRsNHFuUbWsh0dB65b
	+CIsYpoMEjJjEJWwp6DoHfvQIfEQmz50TwNYZyxHULwfkNI7sF2qq9vBS+Y9osoiint/QuimSUy
	eoo5k0d9u00nq02vCHtyAjKCql5LZvtwnjapLoewt4HbGs3L1k64pvahnesbkUDctbmAUN8=
X-Google-Smtp-Source: AGHT+IH02Sm8uYqylsDIHsGX3ZEWWx30EqeNhSMG+4n8yfcZZZ5mpZsxJSCawBIvfoWGFHbxRM6qAw==
X-Received: by 2002:adf:e38c:0:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a52670e28dmr2309297f8f.32.1749120613386;
        Thu, 05 Jun 2025 03:50:13 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm20629965e9.23.2025.06.05.03.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:50:13 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Jun 2025 11:49:06 +0100
Subject: [PATCH v3 08/10] tools headers UAPI: Sync linux/perf_event.h with
 the kernel sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-james-perf-feat_spe_eft-v3-8-71b0c9f98093@linaro.org>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_035015_341293_68BE1A7F 
X-CRM114-Status: GOOD (  12.18  )
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

To pickup config4 changes.

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index 78a362b80027..0d0ed85ad8cb 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
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


