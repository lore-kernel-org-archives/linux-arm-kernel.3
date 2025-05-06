Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E84DC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 14:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIZcQ6bjIvx3LOuJqJtvWPXqPFlWznoYfJ+QWY9umw8=; b=Y9gzFRTa/hUB9ZtpIxCkJoBhkl
	nMQA4wDgeAlxhAcTnJrgh0ZAMvnPvMKCJgjmtSTyxkOq8JqOPU4Q42m2c2PzuqYGQ9BdX3DOoeIAk
	1HMzltg7Rpai+8dJScHys++Lsb2DZLHxQZoKCARofUZTM84i70R8+Oh/LKLz9lOMlheLoiBcRZ7ku
	4V6pWiBkSYwfn0Ma5nxOJvday7BufS2PwAmSyWcar/tojyyRsly4cWI7catLA3mbsav+Mlk0Q9jf3
	EmLNOa4BBDjT93pID0hI7PxugG36c94+A/ZU2K09DNXypnJPQ3CIoNYoa9L7x11j2WH+QIMnQs18l
	LgM/P1Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJO6-0000000CLCu-0y9i;
	Tue, 06 May 2025 14:35:14 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGh8-0000000BmPk-0MOf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:42:45 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39efc1365e4so2609303f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 04:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746531760; x=1747136560; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NIZcQ6bjIvx3LOuJqJtvWPXqPFlWznoYfJ+QWY9umw8=;
        b=MLXRjkyUqJLzo3WkgA8fQt5Co3TyT4MqotxNc/80HVtZSEkynXmHy+lACH1Bhhs+TL
         LnPkM2OuPU9vhGc/ABs8RBKlZsraHIRRma+E2QQ6x3HvdlyP0Xsu5RduxEiJfFMVs3+i
         HBhspyv8WvQxqnWmeoI3kOo7B+E3xon/ECGEwF1lRmlD9Ip8TsVN2X23ydsirXXz/cZp
         kob1IznXmkg8mjLvKmSdI+pCvbR+tMJh0hmVWqK4DCHln+a9IxwDSUHzFIP8u9yA228L
         YFQ4Dr0a0Fa19bdSJGR4Ss/C7DuOZJ0k8g6nm9H1kMmTBTahCpOJSoz1lN9qqsVaAAIv
         U1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531760; x=1747136560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIZcQ6bjIvx3LOuJqJtvWPXqPFlWznoYfJ+QWY9umw8=;
        b=mhqaT0sG2h2N3h1850m8ccIXzbp8pTY07znYmmEH8COJD4MMUAhOi+xoEKbgmZHh59
         rxvjeXDu6hx2fIei/3grsI4gvQZa2RGJWl/7L5Wt4I8187VMDnv/FkR08RvaLjKdN7mM
         nvdkSqRLGyT8u55X0ELgR5P+O97JeKdery3B7L7vi9ptp2NQqgFcwSp+u9pZ+fu/BRqf
         OQ9/OghdEDL5rpQowUj0y8gudO2U2WYQnIY/K1kKRXONf0zS1g0pji42VNq6oJAmz/pU
         Hz2yvcHdnWkdOejqrq3fZ1Jq3jRFXFsvKxfcln6xaqivH+hMypnQuELfGYDv//DQT8+y
         ZoPA==
X-Gm-Message-State: AOJu0Yx+SJZ+Dx7fqa8aRKh2jrkoLxct1eKWVJ5CwvpOXq9DuDCzURRC
	grKT+qQMnR27KEyIRu0fXveEWPxn7AylYPWF9LM4DiWhhtn7yiQq0vF54lbhdBc=
X-Gm-Gg: ASbGncs4IbGncm6GwY2rmqiqDpHVezMTlau0plmJg+swXwAkOEq05m8vuiLWLG2uUww
	Mt7dm+duRHV3Uxt690s/hmMfuYR2T8iaIG+0JGqZT8HZcSnQv4aJL52pCfVm+l80iSIMLMj63Qw
	54gAuFyNDK3b5GxKBMveEZeAd32qmNvRAzGjG5vsEiP3UZjI4IyCcsKC88UTZaY6roaXc6tGYbr
	fnegHgB6YSnYzUw6s3v52F9CGlFBjVV9xHtL6cpYu5m89Ed2hv+TaMinzvgtt7pOjqsEf39/40T
	e7+IOH6wZ2zN65QXV0s3TbE40CMkNCU0hQIW7GRm6qHE/3A=
X-Google-Smtp-Source: AGHT+IFOd1IsGOuUERaKBF17xqjJD9v+resYFgda6lTrrEteCoMMOKMSD17uDHezFeocGMqRKvBkWQ==
X-Received: by 2002:adf:e6c8:0:b0:3a0:b1de:1be0 with SMTP id ffacd0b85a97d-3a0b1de1dacmr1217177f8f.31.1746531760579;
        Tue, 06 May 2025 04:42:40 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm13198473f8f.25.2025.05.06.04.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:42:40 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 May 2025 12:41:38 +0100
Subject: [PATCH 06/10] perf: Add perf_event_attr::config4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-james-perf-feat_spe_eft-v1-6-dd480e8e4851@linaro.org>
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
In-Reply-To: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_044242_125072_BF86B00B 
X-CRM114-Status: GOOD (  13.42  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 5fc753c23734..c7c2b1d4ad28 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -379,6 +379,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6	120	/* add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7	128	/* add: sig_data */
 #define PERF_ATTR_SIZE_VER8	136	/* add: config3 */
+#define PERF_ATTR_SIZE_VER9	144	/* add: config4 */
 
 /*
  * Hardware event_id to monitor via a performance monitoring event:
@@ -533,6 +534,7 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+	__u64	config4; /* extension of config3 */
 };
 
 /*

-- 
2.34.1


