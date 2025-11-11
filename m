Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11997CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 11:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfuWM/BYuIKRAqpYoUgwQd7cyFQJ3HADoloFiEPlZDo=; b=fRhX1DljD0z8q+H0l8EpEOYYjj
	WrQjsMNx22kBDQ/PtnWyR2260IvdFiWUq4ZjwMF1NS+f5MtXOMiIM7IpdnvP4gHc409ICilJ7P4r/
	Olwtr5zSfm/cRaPk/02aa/oCKHghLPLhnFRsODWrsxyQIc/AyHrZNRqr1IKnisb2qP2VME+nzGShw
	W9LtpbM3oRUGzsJXPz8lfZBvsOGW4CTF4vFFh8PVuCtPEo9/MXHABFKKb1MSXhbjcg+MzSxYUIiQw
	Qha5b0I0fKfg3Vt2cTsVgnJXB37/VSDfeokodltvM71NjRrJLkEO640iUREK2f263QM68XqPKPXjM
	jgu3aFOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImhp-000000075Fb-075v;
	Tue, 11 Nov 2025 11:38:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImhk-000000075CC-0xro
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 11:38:33 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso20880215e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 03:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762861110; x=1763465910; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hfuWM/BYuIKRAqpYoUgwQd7cyFQJ3HADoloFiEPlZDo=;
        b=p1mjQPlcVi5Y7Fez4noYLUcMkLR5maKUk7DC0BSvVMxl+tm/6BQizaOOykDyUKBx4i
         W2/5TENXzHJTUZuS9gPsbyw6FMoczuTPoCquaQsuXq2ZNTgVXS+uANLOWJb32pG2vUd3
         LgEnneJ++mzfBqP3l0UwKt+FYfed32TamCX7a5w1wrfNe6tfmRn11vXs9wH0nU9SueOj
         KEAb+UsKeRodUy6Tv58pXXOgPTX1Z9gcPqf2HMD20xd3OvWSk1ZfIlwetpVlgl8MCLF5
         GVbn3RC2Pt/5f24OxZX0ia8sYWdMaPlJjZ17BToX3fCnVjWhwqOwbKj0zrRsJSUDfP+U
         RQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762861110; x=1763465910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hfuWM/BYuIKRAqpYoUgwQd7cyFQJ3HADoloFiEPlZDo=;
        b=epXuj+30Vdy6JC2CKvwC/CZf4JJKFBdAXkKowlKhliD9EZzg60Ib96MgoDf7ymHASP
         Kc4FGA/cIpp5PR63ts/2p0WoZo02l9tIOIWNHDvRMNNJj5swuTlHybGLZTOYIxwIBvBE
         Sn4iqwl5WC5ZFD3XOfPe0Opifp6qseS1xXiYT8Dw8t58Jio4xukeY9ZNkIPJC47ZbmQa
         tMt+yg6+GX0HohOg/9HNp2ajhKRsbVbXLdhKPvMvXzgkoRWwsPGQWRQu9HgELhCxGQhF
         BmayeUbs4WWAm0za4c2DVkJ47Ugo3jMccOSqWi4+Qgfhv39v3iYVo6dn3qlGxGR3Mt6S
         JGSg==
X-Gm-Message-State: AOJu0Yy10MJi4psFpySCTTKM8KKC0HB7FXgEj+NgF/mcD414Ole752lA
	cAuSJLzDPlXmbByDk4W1+mYy0UeB/ED/wzXsB2uYLLSQqTGhtiS5vLML+dg2Pjd9+RE1iSLVo7Z
	a8HrFsFM=
X-Gm-Gg: ASbGnct64XCy75uVAgt11gbpqh9xkoOCVcMt0/aa76PQZ8f9Zle7mza0s4NJE7NAAhn
	hWMrDC5VEzfv5nQ9mgtJf7fvKlXtIvgswbkSOxdIpPpmKddrGF1L5hStwzpw9ChqksYE99YRyXQ
	zoB2l9HysFE7cneeCynl8Pr3oNp4xBkoxf78WTBdGKcuLD3guBis1eaosChhYQgp2MCUc8qs9z9
	XC11Xjgv3X8vXXZTrKxUlUWJFLLcSNSwUh2liWAMqH4RT6D+kumIwIqLDHkXdgswnMJN7D9gQj2
	kqLbX8FlLsqRlgW6quuVwIO+tRGZs/5OOkPcacGsY01KR40jt+wn59GJ+RvdOo9sRb31qt2ka4Y
	7rXX+jdVAo9aGqw5A5pLmdOJU1aN+Whx+GiV4ylXwQ5EvSDqi11aE6pRGa8gEih68P2c7QxzQ/0
	x7CI0RKVXqszuVQrDwb5U/KN4O3mCZKFk=
X-Google-Smtp-Source: AGHT+IGYPR7rqVbdbF+k3EWMkcQQ1XUolXYoeKsYoPvyE020LtvRy4kS5z2d7QV4g2hQ3KZfV9KU5w==
X-Received: by 2002:a05:600c:1c15:b0:477:7c44:c0c3 with SMTP id 5b1f17b1804b1-4777c44c1e2mr78464655e9.40.1762861110374;
        Tue, 11 Nov 2025 03:38:30 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac675cd25sm28133486f8f.22.2025.11.11.03.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 03:38:30 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Nov 2025 11:37:55 +0000
Subject: [PATCH v10 1/5] perf: Add perf_event_attr::config4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-james-perf-feat_spe_eft-v10-1-1e1b5bf2cd05@linaro.org>
References: <20251111-james-perf-feat_spe_eft-v10-0-1e1b5bf2cd05@linaro.org>
In-Reply-To: <20251111-james-perf-feat_spe_eft-v10-0-1e1b5bf2cd05@linaro.org>
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
X-CRM114-CacheID: sfid-20251111_033832_287030_E63FE571 
X-CRM114-Status: GOOD (  13.25  )
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
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
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


