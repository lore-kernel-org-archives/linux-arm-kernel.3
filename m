Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1EBC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 22:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcpcuD7anqMhhZmchi1Jj15ct5OGdKXSmJ/UTKESh3w=; b=4GIYUnUEigpfrDM9O+IO9W4jFi
	8CzLmtxo+yXz9fz+/d2HeSoG5ZZPkzgcObsX4Df3z7IMMCysmjR9nxlh93EgNTQyM/EjhQu4OI2pr
	Ja6WJ6ais/76J3GPdn2djFvClSr2UbtyzfyqfgmHzXPqSFDUBWHJ0V0Z+10NtRm/Q4NP0UKn/bfIG
	m0FG38jBy+WR4Rw3ZurGigpG2x02a0G9IfuKclHEry+cncGoiFx+KTpkOJJwGHdbVKxoKWitH9Lye
	MJc3rOV2rSy6NFVM8PJiMSFJFStSI/VR/83fYMUeYlmyOgKSbo1pXf+Conc8GQ2ihd3w5a3Vpufyo
	3zkyqOcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zMy-00000005IXB-2hhI;
	Mon, 21 Apr 2025 22:12:04 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6z9s-00000005GBJ-0yRh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 21:58:33 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b115fb801bcso1278151a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 14:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745272711; x=1745877511; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EcpcuD7anqMhhZmchi1Jj15ct5OGdKXSmJ/UTKESh3w=;
        b=Jok7rWqcuOm54g3daeBPjsmeezijrvdUKiEuKL/uuhblS7ZYQP1fqY7/dwaWvp7e8v
         yllc4mT3meTFnAkRBuLlUVyopIWfuz5twio6mZdxSW3qmQIkKhI925p6Z7TvE+NwJFI/
         g/lzaK5W8g04hVD8Ni3p80ZQ9x3cd7RDiokR300TEsSU07CxhTfDPyKKy7e2upEjwxfT
         0bFe2vpkHxQW5dwUdCnl8o3K74/MKkrBCGnmiGKmRus0zoR6kU4AHT2wXPksy96ETzoi
         UUQRUjpvNW01DKNMds9scRM6t7QHQWts4sBQxEFHP2kI4gyCdmpl6qGu1LNJUw6nNamA
         WYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272711; x=1745877511;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EcpcuD7anqMhhZmchi1Jj15ct5OGdKXSmJ/UTKESh3w=;
        b=ok6Qk6eCgFUq/RtfP3OXKRKFvkq0DyRSQlpwfVa1hmwDVUPHiST3cefI6j8QDq8DzP
         5AhuQ43c+EfxyW6SdPH2mllfUpP77ZfxH3UjZDAo3Guh7hkr1GKc/DDyhjMjKRe51L5y
         NgFZ4Kw6Hmn5lr9TFGrkaooHvFpQnEzpwBE+C1mnBoZyZ0RwecvkMGva11Qdw32B3RnX
         6y9AZe2sD1DXNjeW40ZxKzJrcOo6piY3UzRrhvec7K1PozZUDisgdRVmNIM1YPbxWVDO
         tTL8wPdbUJndsUCU/nlNc+qDcBqLjYRe8BI1SMpjxNWWa4/dUwdIb0sgqmcL9401sCTb
         EIfg==
X-Forwarded-Encrypted: i=1; AJvYcCV92dmzUJKywdazpy2Ml0zj6zj/IPzl7aCOcNrMfZp2yCgBZhAsxYCA7/1HBTGCQPe6RGAzQHYx+T0xSp+3HtzI@lists.infradead.org
X-Gm-Message-State: AOJu0YzuXDIra1FW83IpnWUWz3n33geV4WKyojEQT1ErgyKLEovymdZu
	e/Np6Ygo03dpebIJTZlCdjm3qN57F1H3Kqb4Pyv85YhhzmaEH3EypA984F49WZGM5fzRx6+lObw
	t
X-Google-Smtp-Source: AGHT+IHXIs/Ogd7Xy1uFo5InHHYWM0p69glnRQCeqAR959OOyLerqEP0Pnb8KTz0VXSe5vCiUYWbcDZdU/s=
X-Received: from plsr14.prod.google.com ([2002:a17:902:be0e:b0:223:8233:a96c])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce84:b0:224:24d3:6103
 with SMTP id d9443c01a7336-22c5361988bmr204811505ad.35.1745272711001; Mon, 21
 Apr 2025 14:58:31 -0700 (PDT)
Date: Mon, 21 Apr 2025 14:58:18 -0700
In-Reply-To: <20250421215818.3800081-1-yabinc@google.com>
Mime-Version: 1.0
References: <20250421215818.3800081-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250421215818.3800081-3-yabinc@google.com>
Subject: [PATCH 2/2] coresight: etm-perf: Add AUX_NON_CONTIGUOUS_PAGES to
 cs_etm PMU
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_145832_271875_EC32DC2D 
X-CRM114-Status: GOOD (  12.92  )
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

The cs_etm PMU, regardless of the underlying trace sink (ETF, ETR or
TRBE), doesn't require contiguous pages for its AUX buffer.

This patch adds the PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES capability
to the cs_etm PMU. This allows the kernel to allocate non-contiguous
pages for the AUX buffer, reducing memory fragmentation when using
cs_etm.

Signed-off-by: Yabin Cui <yabinc@google.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f4cccd68e625..c98646eca7f8 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -899,7 +899,8 @@ int __init etm_perf_init(void)
 	int ret;
 
 	etm_pmu.capabilities		= (PERF_PMU_CAP_EXCLUSIVE |
-					   PERF_PMU_CAP_ITRACE);
+					   PERF_PMU_CAP_ITRACE |
+					   PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES);
 
 	etm_pmu.attr_groups		= etm_pmu_attr_groups;
 	etm_pmu.task_ctx_nr		= perf_sw_context;
-- 
2.49.0.805.g082f7c87e0-goog


