Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE83C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 10:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpkxTGRvQkor5ThWfPSfZfarMFvM1/zI/E944bIEcHE=; b=OE3khoTSMXs3vFHVgoRntiRxkp
	aVsS1l8ThFoxiUxrADvUwc9MPkANXThNbLFEnUVxlSMV3gb1q7ecefuJTt9+WoIngN+JLTnrb9umr
	bbdrG8KGu2Zv3Ir1+B9wmSnV5nUB0OB1tOumwp2CIO1Gubyin2Cr/vkiJ5rp3aKsdDvpDykhMqfZU
	4RQzEuVHjRuUlw4r9WTNk5lor7lXAYrohQEjZFGMM0bATrINhJTBA2HP51xtVVk4No+DtPq2NJWDJ
	jYx9ybIsNiFC3UUGQUbOPUJbB+mZS4H3Vg+CmqpAwiPcWrcrHhPslxtevDKgoYag1DS3rL3Vzz6QA
	6gvN7uUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8FR-0000000FJRb-3Ehg;
	Thu, 05 Jun 2025 10:55:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8Af-0000000FIDC-1QoA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 10:50:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-450d37d4699so4838305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 03:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749120604; x=1749725404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpkxTGRvQkor5ThWfPSfZfarMFvM1/zI/E944bIEcHE=;
        b=eIsI26G+7yJa/YueWLEy3X9Paw6/E8SzE4+tc3xWfmPmDIrwcp/Vst3JGPYYZgp9q9
         gNeAeIJZMn/s1F/wTddufm0Ymgh0nMcMyr2RUf+jcTSa07dWkRiEw5W4Ur6z2IM+vuFR
         jCuCb0JZXbfkTv0v7Xl8CvC3KTuknwJf+p4cMZDGVPjYvqIgHgagyM/zTxuX5Zf+5Ivw
         UmMHwIcveMeuYMIm88EDtMVlBFQTKcg/EkoZ0TFxTFGMxUGrrr53zfpvqZ1+gbvaGnEG
         4oAiO7RMeewhbewFaWtJWmSmM+t5VSd35oBONvbr7DZA88vDR1RjvpeC9gEakIQQLK03
         WEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120604; x=1749725404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpkxTGRvQkor5ThWfPSfZfarMFvM1/zI/E944bIEcHE=;
        b=jiZEpmOM7mXJ0QpUEb5k8x6irExC1y3Q5NxfmRmGp/7gf7RRzJsdbBBhxHy60AQEpq
         AWR3vbL+7z4uUzxUrNAmfE0V5ZhHcsTX4IA/M4IErLAGfwquH2WGf28ccXg3FIHzhEve
         +UdcaSPx/GV7oON2CJwi9+N8IsYnlAnxukRwgI8o6hJSli2xuo7MGFte7O8ftdJtP5Cr
         N6edxQU5gi2wLFiUgzq2Mc4uETksfHfBVZpJFztFIuPS8ODyc5dsethynqkGlS0ZTLTe
         vHfObO2T3gDvKgHqSVtE5J99hJjWM9RyuiI+dpXCnBfUCfX1Q7AVF3IXrR7k6w1mE9Wz
         6x+w==
X-Gm-Message-State: AOJu0YxVJ8b0YTk6xMQ+z5J+sZA5upkbDNEczcOF4hf4lXdEpeobWQ5x
	xbu4+rdGOs5MwXyBoOBgeYAfpLbUGvoJh/VnMT2V5tBW9NeQMFnoGENgdDJrGiiXEIg=
X-Gm-Gg: ASbGncsmxOI4HiW01QoXczEw7JgEV9cjeZf2gkB74SRHPZZVDbzkmuGRXZvXOyEJ/X2
	f6ZVI3dc7ShqX7soN19Of+iDhSQNhtsFSXfBKk1F8z4YAUnTZN8leo4fp8vzaW6OztyBo/cBkVN
	XfsQg0TBTfyutDKbbavDyAuyxySwgsXxST4KhgAq437w9FQ2t1FuKJBIy/y6VNnCztNydgPlPeu
	PkNE0lQCyv5o0A4E5nB+VwEZ9GkypD4vnDGikexNuuNqvGIEWzHKI/IvGK5zEbmwLlOJdlRZxFs
	vxGUjK1S+TecZf8mFMlMjdYeALY6LYJ7jkZLbCbZIL8FL2PpQpKqiw8TpIDr
X-Google-Smtp-Source: AGHT+IGzwrshaRz6RzNc0J7tOxVdD9PJSTMnVH2Zjax7vPL/2HgFnaNJ3JtdmLcA1rgDpG5sbM8aDQ==
X-Received: by 2002:a05:600c:8b27:b0:450:d37d:3584 with SMTP id 5b1f17b1804b1-451f0f31013mr62452085e9.13.1749120603619;
        Thu, 05 Jun 2025 03:50:03 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm20629965e9.23.2025.06.05.03.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:50:03 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Jun 2025 11:48:59 +0100
Subject: [PATCH v3 01/10] arm64: sysreg: Add new PMSFCR_EL1 fields and
 PMSDSFR_EL1 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-james-perf-feat_spe_eft-v3-1-71b0c9f98093@linaro.org>
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
X-CRM114-CacheID: sfid-20250605_035005_395513_4266B3A3 
X-CRM114-Status: GOOD (  11.40  )
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
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8a8cf6874298..2e897d8a4040 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2859,11 +2859,20 @@ Field	0	RND
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


