Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93898C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 14:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfK4D8WXXHfk2zwldWwUzY+IJqnsgpS7YeB5hPDSAiU=; b=oIywVHWpz9WK2415Bt2mG8Gaam
	Ny3a5O4zj/tehykrn2TkmSTUAIaoOzSNrnNee4kxv5W+HnimnlScLT2+dko1f5TD2l5oDzSAg3vc3
	r5FSM3xODoOOwP9od4tzX77lVxC258TCo0Ff9diycP782qO4TN5VQfFA9JJ69JVviMHoORUyQmSGu
	ew/Fdbc90jAd9BOGn26hNQ+VTvysgcfQnS53OW0tnlUTqiMainy6Nh0cQWiA7zoxOuxUAetaSWxiK
	RMvIYZWOGcSlRPFsej3LBx/tPCAJNVglael+8AZgGfj3xg8HQnHupLPaCXGaf5NMWCWYLmV3dzaYb
	YNxvbapQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJ8n-0000000CI46-3koc;
	Tue, 06 May 2025 14:19:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGhG-0000000BmUZ-2anY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 06 May 2025 11:42:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gfK4D8WXXHfk2zwldWwUzY+IJqnsgpS7YeB5hPDSAiU=; b=MgKk6ezzU9PbJKYNwEnNgQVMkN
	NmYgUyExaIegO015QhCnsiIV8xUGdYpGdWaRN6MAXeyFUaRRaposems01/1+kFucNPiSxoUXLFif2
	c2ChNM4hAx4TYBpUyMVS7mVJwX+Umwpq0a+Edjfx90m/fcvPB5Vt9i4u2WGJAzawQFC2cmNetDCTd
	NbqYJvDsa7xWxBxnT4i3sv9eCS/x+DMp8gmPrEkVHPgnw0rZ22jd1aoCVJdtm/izVDdzcr9EGjgsU
	5u3gXwp/EH2UzGtIf1sPxuRE1rQYUQOx5kAYgVgG8R2ao7esfYMcS9y1Doz1kdY6mFlr1kI2jV4BX
	Iac/GCGQ==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCGhB-0000000FdPZ-1jA0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:42:49 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39ee623fe64so5740158f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 04:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746531763; x=1747136563; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfK4D8WXXHfk2zwldWwUzY+IJqnsgpS7YeB5hPDSAiU=;
        b=laJ//eTeLxpdxlLEt9LZw5O+IxRFh5BjZKrlwsp5aM6LLe0zm45so9MWUDpljsPSw3
         7IaOQDNaLTzTATPtmrPJ95hHkVJQyigVdCYayYG0Rqp9ac50V5qS22y6BT9X3tvGOR9p
         xRtrmEHsofLvHGUA8cBW3TSBLcv+HKR2j//7s61SM2oNHQQJHL2JB+zZiOIdn8Dbnh4x
         tZWK1cE3ArOvggN9BiQEYr0xzw3N9FI5UJAv3VIpMTNjlrhC+kPRA3fLTbBKQY5vJiUd
         RHxttEPe91US5aVtKefb3k95aTbYoM2OMgZ9KKAt2f3Wrftyg5IBCp/51dKmJExhQmnH
         Exsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531763; x=1747136563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfK4D8WXXHfk2zwldWwUzY+IJqnsgpS7YeB5hPDSAiU=;
        b=VHzkkrTpIAaQHpStSBzF5D7LF7VXhiCleNITUl1dlnlf7Fh0XP+6zuso/czUVBjrhu
         0Xz7/kR23p/U+kYGEMRcpQVba+dDFTTzvaxVFhWIvwb6F9JjiCdDSmTLzbde2vk271Ek
         XoXqj1XFp8KarxW5unSpOqkBdoRsZjpjDm8lFbznXbDDFX0WPf5TNwVeMeNhNmhBvV4L
         QwUh0fVt0212BUSuW4Y172rcjHOl3XOpWfumAHDhtkF6pBbllykbje5JxSbISpa+KXwq
         NxF3nzuOFJnOu1pOE4YIEDYdV/J/8n4VuruikfEcbeYriIzz0S5hvlT6N8Lwnj+tA3MU
         x+gw==
X-Gm-Message-State: AOJu0YyN11uSWkcaakxJaIG4VZp+1sFF6k1O1qujQo3rySfAqIVDKLcg
	03b8BktHYR55pnMjq34Ptb9JKBPbncQPwcm01oBVcMxsAS9Ded6CQLLuTNM1Uec=
X-Gm-Gg: ASbGncvOIEUjS0qw7D/R2ZoF1ShFDs5y2M4wPwZCYo3/tF1HNjchAkPMsyq6X6IIoGb
	TkRsCf4UDbJBuXD7W9BYcEUEhsNfmYfb+GgNulvk4zNMSDIKlKuGCvBrWbOlaGYrYB5AqwqGk4f
	tEqfql7Gb+w20/e7LA9Zgfj+r+yjIeJU2ftjOAPfgcWZ9Ix7oy7DU1oG3KR/7J1u+vONejnEjQg
	sQ1Z/Q4riRrtvIfla+g1WbKlwiZDCq4Fux7nMXOO1porHN6yiRxB9jIUlvIlXhQMiWXbrMP8k2O
	JsFmrnvRS6HuNZZuYECwmMe8ys+MKR2hnRAx1l0w6le1qtglSLQ7BlFZFg==
X-Google-Smtp-Source: AGHT+IFxzoHVTs85nB/2QCYX1+sgmEItPPt1ggabHpBdb5kgred/4/pK2CDSumpwJgEYOUOvr/4oog==
X-Received: by 2002:a05:6000:2407:b0:3a0:82d1:f3c2 with SMTP id ffacd0b85a97d-3a0ac0cb13fmr2410966f8f.10.1746531763203;
        Tue, 06 May 2025 04:42:43 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm13198473f8f.25.2025.05.06.04.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:42:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 May 2025 12:41:40 +0100
Subject: [PATCH 08/10] tools headers UAPI: Sync linux/perf_event.h with the
 kernel sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-james-perf-feat_spe_eft-v1-8-dd480e8e4851@linaro.org>
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
X-CRM114-CacheID: sfid-20250506_124245_747654_98708739 
X-CRM114-Status: GOOD (  12.31  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index 5fc753c23734..c7c2b1d4ad28 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
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


