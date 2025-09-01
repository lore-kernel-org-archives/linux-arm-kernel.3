Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FBFCA100C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CE9jiANI0cz/l/cDSr25IEHnZ3OQaeUcRCYLlwFZaDU=; b=aEEBzN0NnUE0//VjWUHhwvepKy
	gXMRiIN7mp16Etl98AHA7LcWciMcx9LLwtBmyoKEZvYarM0xSnZYjCLGR2NYlrwU1KGc2H6BAKrcg
	MdXUSCCUigVI9EBLYSqh1bqTlV4146T+IQw5ur/QutNU7twO5ieDHBvZ0ojMr97KQY/rgX8wMbaSf
	aJ9pmF0DUejfCGVq7HWEEieyR5EyYm3lkBylkQ/umEUNX5KbV2McUYy7vGXeCZhkY89Qrz1/sOmIB
	5Z9sKPQIsXEAOE8XFph5Yq9vUOWWeoDEHHumvp4z+sPc8jenJmD/yjipytl4Lewwdt7J9WuBGP+7T
	Srh7DteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7VN-0000000DGv4-0mLM;
	Mon, 01 Sep 2025 16:35:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3r5-0000000CYug-1lWR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:41:52 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45b8b7ac427so6204855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756730510; x=1757335310; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CE9jiANI0cz/l/cDSr25IEHnZ3OQaeUcRCYLlwFZaDU=;
        b=Ag9QjpnxjoPM1xcV/2qloRoKfK5f9Dft2u5+M52zWRqq9RApXkk1QKXozExc5gHmGl
         oqNPvVXAJCfyR8qxUSq/5LwCLp+8zWj87i9rrWWau3xn25mcLA2Mi4toIk3rngo4E7DA
         DAsj/TvCmp3KKhEWQF+m/8UFf4iVYRBHhNMOix7TO4okbauAZuGqNetqUYngufyeVckc
         xqeP40iud/F65gGoHSezam8NXfpr5GuDv3qGmIeOqbzkv57YiVqv7tx1BwrlHJrOJ5Nq
         2G1jhF/CTh16SVtH4wwX6+jnPlvHLNfouvIwJnNvL9BABE88M9ZRzP0iIPZ3cNHKu7Aa
         x1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730510; x=1757335310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CE9jiANI0cz/l/cDSr25IEHnZ3OQaeUcRCYLlwFZaDU=;
        b=QYFWeLdK2mgidh4pbvwpPKtAUL6pja3RMIpNpz5wHP34aOAX1vF9eQIieKCUiRMreA
         8QcUXbrMcnBIgMiQCLMx3rfdPzkqX1tVanFeGEUI86Y+jZ1FIbtQgsDIWxR1tJCldqbO
         JjEwqGXc0pYYVw2vufotodHMjxNFRHcWvDkf4jhI8WUG++/ySoWJK8GEy97cA84yMaQY
         mdDCcurLI5DQ6T5SWoem06EeWtx8/7jUxQSzGMCSQvjc9YCb8awO9tIvZjMnSOAbwokh
         G9vFs5lFfXFr/SyyRMK9TkMCQwbwYlRIaHUPrbjw3KvT3ae2YmQyO3nTSO5JtfD8nlhd
         KDNA==
X-Gm-Message-State: AOJu0YxH91vV9zXfb3lySSXsapyr9NWmr4SRzayaz35ss/xIY3bXvaJd
	xCWZGNyyRBN7KTrtjZevIjEZrBZY/fbDPLzIaz1Dnwp+/cdOkZna4SXu6KhbrhTJNb8=
X-Gm-Gg: ASbGncugF7xhhplBFS9yhcsbpomWRyUmSPMDXFu1VTaye9YRrkvxTGTSgPK1+w2kcD0
	6z/N5EETFLlMAIg2qLmpoPYT9M1v1vFA6YyOsPUlgEfhNfqZzlQQwYNK0/bUtTar78kOwqdS9eA
	VQELuiE0aQcO69qInfryqgOUh4GK6siMGaOZSYKF0lMsR+UYvcBqUJjJZm5jSsYDw+tbt+NvMNs
	vEAfQE8XRRd/pyggTDTAHjnEHknYivCzXcIH5uPLw2RL+EYLar8sqaTFb84XQKGi+rGLQ61TVmV
	eGtk2K9GzhrqYZLaodSdvYFqvDtdEKcC4jASQCEvfzlsV20a56RKk5aiu/cH3bnlBB9aQ+ECeEy
	5B4P2Nt5Y7TMdWlvZqQYFCcRS79hUE2bvMrb2VHXY2g==
X-Google-Smtp-Source: AGHT+IEpKxBP9k/vYtw8Ht1MbnsTYjDO7wEj/uW0QbGaAjhmSNIBbT3ZI/wMtrWxLNIo5Z9MYwmVUA==
X-Received: by 2002:a05:600c:1e89:b0:45b:88c6:70a2 with SMTP id 5b1f17b1804b1-45b88c67360mr50627485e9.1.1756730509844;
        Mon, 01 Sep 2025 05:41:49 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e898b99sm154946315e9.19.2025.09.01.05.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:41:49 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 01 Sep 2025 13:40:30 +0100
Subject: [PATCH v8 01/12] arm64: sysreg: Add new PMSFCR_EL1 fields and
 PMSDSFR_EL1 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-james-perf-feat_spe_eft-v8-1-2e2738f24559@linaro.org>
References: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
In-Reply-To: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
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
X-CRM114-CacheID: sfid-20250901_054151_471616_2BF15376 
X-CRM114-Status: GOOD (  12.21  )
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

Add new fields and register that are introduced for the features
FEAT_SPE_EFT (extended filtering) and FEAT_SPE_FDS (data source
filtering).

Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 696ab1f32a67..b743fc8ffe5d 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2994,11 +2994,20 @@ Field	0	RND
 EndSysreg
 
 Sysreg	PMSFCR_EL1	3	0	9	9	4
-Res0	63:19
+Res0	63:53
+Field	52	SIMDm
+Field	51	FPm
+Field	50	STm
+Field	49	LDm
+Field	48	Bm
+Res0	47:21
+Field	20	SIMD
+Field	19	FP
 Field	18	ST
 Field	17	LD
 Field	16	B
-Res0	15:4
+Res0	15:5
+Field	4	FDS
 Field	3	FnE
 Field	2	FL
 Field	1	FT

-- 
2.34.1


