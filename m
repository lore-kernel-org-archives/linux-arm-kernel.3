Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B6DCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CE9jiANI0cz/l/cDSr25IEHnZ3OQaeUcRCYLlwFZaDU=; b=nONnmOat2Vmow0vT7E5NwHK4h6
	5z8jJPWYHAYt6e5Q7U1S6G1IAR31UTvDhPoqTX0Z1dkpE2GjBs6e42PCag5JSwKHuVimjCpnD05+U
	zKihcyPwtudLfxesH0fzALT50bIZOgHoVvA8fMvIkgvV02ytCdYsMDHdYjtQkOXkopYsutt7QfSxR
	AhpaYlDIuH1AlKl4NpUDVkHCLwTNjtIuwDFsBIeq7NM9u+Kw5xYsm52r7h79QWqzQxoEvJ2T7CAJi
	NCw/5n8KTk/erPEDzxjRqzX8wyt5kQUiIBBAu7H+jAmqPg3LHNyVs0eahhs/vhhG8CnemcluWu2A8
	/uSkdjRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXmv-0000000GxT6-3xUk;
	Thu, 14 Aug 2025 13:14:37 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUDg-0000000GOfj-03LG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:26:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so3400465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 02:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163559; x=1755768359; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CE9jiANI0cz/l/cDSr25IEHnZ3OQaeUcRCYLlwFZaDU=;
        b=WJpk2420rVwm430UAZXqq4kxU3PX8czx3c6VvB3zKNMuObXArD0NYf9CWSvTBnIk5f
         S2M7iQb/avIyJ++LCCLX1pcKBb8z7WXM7bzxQdGhhSyKT9aC1f2INoFwIqnlL0Ws4oV/
         twtAGPF3m3Vx4WvpD7k1NbuY4sdGVpdqE2Uub0Z1Tg1gjQLAm/Zn/vrJaAENYQp2n1NL
         suXWHCKbUtMcEGu/XHgROrVz6pjP2QSBlFuaS2zG8c0hYw+a54bNaALMQQIXcZBw5hbS
         Fh6lCiKZGgm/0h7gjjmaP/DPjt4iawXiJ0700EGMyrI/wJZKpB86m4HJs6xpoj70jk8C
         sQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163559; x=1755768359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CE9jiANI0cz/l/cDSr25IEHnZ3OQaeUcRCYLlwFZaDU=;
        b=DaoKTC6GVAXbEJ4C5/oZ0fPON68zWgJyp3e7YKjz4hHRajH4C/63J6a03qFcJq/aPb
         PliWV9VrdcxdWpD8aOm4SilmF+POUFEGoUJUV5owrKDobtMADWcBRR+PPKM8bjaseR4+
         /REgK9HNGqUM5zcS/Y9Ml7u1HNefuCgGjLZC5zfuvbuzHkFZicDVeL2J8KKL9dU5ZAfS
         NRiPvnAcMKxBaF7TvjCnEPPahTWJhUKv3Jrt/nvVPwonIGdiUa1G0+6ivd0KP9/YvdqO
         hp2OFWhYiGJ4x5wBYn4szAxdySZrAQGevPGWzlx5T+BBLOEh4vq7XAiFEoaQhVnBTVN9
         CVgw==
X-Gm-Message-State: AOJu0YzYENDXB3AAWSsz5upph8F94iKgiVfmouoI7deWo5jR5h+bU/I0
	kjmw0NHVImgTVRMvSqE6DDYt9T0IkoqllFGBLrDFhMvkZqVWAKcDG6RR6N00xpmgHk8=
X-Gm-Gg: ASbGncslYmNFNcPkQnblEVkQtlBc0AS9q/dOxlXTLHFLbmi680S4LxWfULkCbGjfkAS
	85wdrX2ilYDPvTKKEIBRYEyhHfLitRORuJPYaoGT85Zxwk7NExg+sM6rUkqrF5iHWqkf8CqDwe+
	1I8z+5sXX1VNkXCLjBVodVYUtTMQtjurSGLB67b87Id5vHLBibXg30IQPVvXxCJsHWBDvg/xpdz
	NFfPpyZz979ToYFccxHYwmWNKA9RRiH7WwyE655DPn2RmAT8P1RMwkUBZlqsWnFl0UB6q8+18jz
	f/9pcCKVjEvvAGGlCBlcy8suyjCd69hS6R0MQE8SqBxrY/GwCLwDm//llR5ZxQxCXVXh0SSVKHT
	nate59siJDShwRgHTpPAPMCVaT+1gWPE=
X-Google-Smtp-Source: AGHT+IH3aH4s+NYnAVYfqbXpSrP1ix9p1QHXe6mSxBCrVv3jDGybUKX6JctDT3xmTAkJSTP0/FwOIA==
X-Received: by 2002:a05:600c:450e:b0:456:496:2100 with SMTP id 5b1f17b1804b1-45a1b6753a2mr19666565e9.31.1755163558609;
        Thu, 14 Aug 2025 02:25:58 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c76e9basm14536775e9.21.2025.08.14.02.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:25:58 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 10:25:23 +0100
Subject: [PATCH v7 01/12] arm64: sysreg: Add new PMSFCR_EL1 fields and
 PMSDSFR_EL1 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-perf-feat_spe_eft-v7-1-6a743f7fa259@linaro.org>
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
X-CRM114-CacheID: sfid-20250814_022600_059247_69CDEA53 
X-CRM114-Status: GOOD (  11.34  )
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


