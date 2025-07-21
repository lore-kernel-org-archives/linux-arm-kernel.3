Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6599C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=; b=GiILJ3FSiDMnix//09gWCPtdpV
	PsbjADPnuegyEL7UqMovEb+rG3lgUSGVcBhoemZFtwvKskkCnlN6I16U8kS3BEn4cjdWMerbKmIbj
	oiC9XBVFIZVqiBw+0NEevHt7XwHp42X+BC0CT/qKPNcy9hDw+3JIDYifQ2kPAHX/j8YuMtG3Vx2/1
	V5pRX4kxs4e0tIKV6Mm5juzok+VD5kDoi7zRdE4yW1qhmGYBzdIlmdJpnUnFwqXUi6o0TkPx6TaKo
	sec0Cf0oMeKrCem7VF6S/QsqJzmHchxPZYJt1fMpuGKvzUDEdEmI7CgujiR4e8uxvixdfh01+FE2h
	AlMMRvwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrL4-0000000HUZk-0yS5;
	Mon, 21 Jul 2025 14:17:58 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqCq-0000000HKu9-2jDu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 13:05:26 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a54700a463so2408605f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 06:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753103123; x=1753707923; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=;
        b=zkOUrQrXV1/nM0Jz22tS/MVlNzsd5GbHxWda56S41jT0ACKlxnvAejj1khH6AZOIBQ
         g6jOe5iiIsGxXr5henySpGrtD+Sc+NThXHFVZptxBWepqDTnjk11eJv1RlRWN/BHrDNI
         DG0GSVGG/HmtiVXRHi5PEtp9LAqQzkj9LiuI8fKfwszQOHICEnNLEKQnhk/WdzC5brSk
         5omQHa0aTXpbAHwp+KVTE4TyTQic30KkGxKWM5aiUr+NlLBYmNf9EeszABEP2aOqC5IN
         E2jT5PzAo6Zkpi6kc45q5OulZD7KdrY/WgWxshfmhFlUCIDYna1jWl3zHxqot4tKuzpo
         O7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753103123; x=1753707923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=;
        b=a9IsMQSeKEFoQ9nxmXQdYEbX9W0fy4d/8yvZeD/PkWg7gXVcpv/qOBadscRAynTrdl
         G6w3XbOdpTLRcPXVY+JY5h6sQQcZDKHWTGVZDQTQ4czvT0BgiVIDPUFIo7gGMOpJRJz+
         PgvmVhRz4hJIXqTGNfNE+Ydq0dyqLJ3M9cz2L3NuCxosDI6SN2kdaDi9qnwiKruxQKfw
         c6i36mf1pVTcmLS0n84qYgtmRedRVN6dq05PiQDJRXPb4XJhuEVCYxFkYRXbgiUH8ZTg
         JfrmAKPMpv3dBVMuFSWhIY7sQZp1Wwv7ieVcQXEoxoSjrhgw+ddhgexpNAq3B+7m+1yl
         Ih+A==
X-Gm-Message-State: AOJu0Ywe/Sz+I7x6N1+HydeW4/dywZ+zwikchzGres1SY9XO882+7Uqu
	X3k+cO8Cekurw//tCf+3lfByVR/oMXpAHcyfuC2Z4i9CiVW+O1QHMatnnI+39lQ1D+A=
X-Gm-Gg: ASbGncv0ptJnJnoDPa61i3zyw6XsavrN2bH6NeiK/Mpc9o8uhupI7lkivtgi429wfGB
	FTXUQjMa07AIa6sC6Fkelb6D4rOYywheMVr/7vu7RVV1PmerDRQm7JztcMkS3SmnV8eF23xcCbY
	Iu5Lmbrj9EhpF8mc5nKlcpRNa6CrmY2IuMhtEO1Z6SaqQKhD0HpSdUMym/vBv3s1IHc/aB9ZYo1
	rNJ+Gw3zcTtUMUbpKoUQ9pTKvryyT1TA0Fu1YrjJ46QC8i2lqOaK+XzMHOsdx22PNP10kpVwzcN
	jqfOJdRnpq+yliVPSPO7SVigogDqFKtdy6Oau8aShV4S7hFNp1hZJWom3TQh+wgsX8oVYWzIfgj
	2wNis0MWerHJ9vuq16lPmKnkiElVdepU=
X-Google-Smtp-Source: AGHT+IF6B+UvXtx0IYpruCvoBGXj7r+Qm/RbuQTzDQMBKY6Xx1qYG8QQ00o/M8y4LjQhDqQ1Ad7BQg==
X-Received: by 2002:a05:6000:25c4:b0:3b5:f151:207f with SMTP id ffacd0b85a97d-3b613aa23a2mr14510920f8f.3.1753103123024;
        Mon, 21 Jul 2025 06:05:23 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c632sm10485077f8f.80.2025.07.21.06.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:05:22 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 14:05:04 +0100
Subject: [PATCH v5 10/12] tools headers UAPI: Sync linux/perf_event.h with
 the kernel sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v5-10-a7bc533485a1@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_060524_694009_376D9235 
X-CRM114-Status: GOOD (  12.36  )
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
Reviewed-by: Ian Rogers <irogers@google.com>
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


