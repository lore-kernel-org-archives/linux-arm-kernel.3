Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B743C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 12:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ENKrydK9y6Ncy6QzWlN/lVHecxyLZuFBTl1oby0dHM=; b=kxnD+vAGQwwN9D53MVALmVjd27
	UWWGvO6aCz3ZKf4XK+GOBo4vxK9kE6Bdtbm3zEBK+63PAOZCfOnFUIoPr6mYQYfGT/VrQHFL2nIhO
	503fkYV80Mcekd0EWVJWpycErPZMxBacfU+xq+khRXtjXSGOEWXynoChMeUlhbizLj36JXOQXusmr
	jNVhEaImheAeyQUrpamYsWGuT0ce4A5hV5LG1cu0yRWNp1rQlCm3uvvTFrOMKGQT6ULRzLRH1ZxTo
	Jw+IX6XFvLVUXI+0I5+FOGZgq8RWnnnLrj6l6HZt0Lb77LLXXS1vd1m+7n25NJcagmraABrS/t+xp
	i0kz/Iog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcBm-0000000FiJL-0vL8;
	Thu, 29 May 2025 12:16:50 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbVZ-0000000Fd8W-148e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:33:14 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a36e0d22c1so480692f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 04:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518390; x=1749123190; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ENKrydK9y6Ncy6QzWlN/lVHecxyLZuFBTl1oby0dHM=;
        b=rWJn86AGeQsN0cZHJ+lQ/P80SWFTTvB3miDWCYOPiVlR7jKJ+sTFFO8BL7VaF4v91W
         xtJCNm4TZ3KkIQmr0Y+C+dsnHq9YDKX3ZjdPbZCct7B1qch8nc4MhDFCsn5a0sTCXy/k
         ytziItYxEQobXskKPRGh5Y4yw7HZE/xYlGhsnFHW4w7/WRS8U8Yrqg1UCO76Y9gm2pKM
         UawDSIX/7Xomx5diw8eI33u9H6s276uoQOjOf5L5mbX5A+nLryvoW7cR7rZt6cU4JjQu
         xi9NvI8BFB7q3CgvwS2D/z0C3PUOrXSPC5tjpTDvHB/CGqrGTpr1vgaeqAHtPo9laUba
         68NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518390; x=1749123190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ENKrydK9y6Ncy6QzWlN/lVHecxyLZuFBTl1oby0dHM=;
        b=ppTK0Od+FG7067BTN/AclQRkqaH4bpPlKcpQ7jGyOctv2JlOa/VmKFlC762u/z3TAy
         nOSXLgP+4ArpPXNTCJrQ1dEOcnr1jHBZvNcIZmvgc1GLtJyptZcK29LkKqHFNsBzBrlz
         2TFc4jawaEqCM8cmpeNqKE19YG/oeTIkcy2tSeO0riuzBRCHRgvYR+y/m8fiTM+ckc+J
         ZiJHMasBJVQ3Z2bdFB3ihJhgnGymCQu40KsEziIQU2qOm4kAi6BTHX/Fe60YdadGrSWy
         +CXAUO5hdv3NiwcIJy32fskh/X8RZQf8YM0kzuMron7XSVDkHHYBMkipJ36GuSUZuPdg
         LrUg==
X-Gm-Message-State: AOJu0YzVjjEN6UDhuYn8nQa4Q7qtljQQrPfzp815k9DN5zc5u/t1mRrJ
	qwXGGM+l6Ia9diFvjvJJxLjKXqcIBChcmUA3iuBno6EUnCW8F9I5lFMvx2lhGFQY5BE=
X-Gm-Gg: ASbGncsoRaMm26AbMJqGLtT7IRstoRehI+XcU8D4YFYbu1qQ86X3gzaXgoqG6iqNtTL
	/wDVG0lxacbcv2n8kngnxMv0rBr2vFTxxO+nIBfeEHRQUbkN4ebXEtgK1w29g4u5gjIfv33Vl5U
	cFmUWJYWG1DLXV2OnZcQRZXneA0H0Zn0G8vvxqDmzshpLywec4V2eH060ljCnR1KCiF7TDAJ5N9
	tl8Td2XJWGuigI8LmDKpUAxS4CF/0gnSthQswRziaaSyLwhC8PjSTQLZO8gnw9LyDXo10UkljR/
	QydhOMjJcIqtCTIZotmFq/YXN9OMjBzAEKaD8Dizf+oYDc4rrmOdVIXuHa7E
X-Google-Smtp-Source: AGHT+IGzW6H/JY6okGMYKiGy1G81BD38MaxIg1/bSFnC+yh1zhWoHrWS5IoXHEN57n42Gztkjj9u+w==
X-Received: by 2002:a05:6000:2011:b0:3a4:eb92:b5eb with SMTP id ffacd0b85a97d-3a4eb92b7damr3548709f8f.50.1748518389701;
        Thu, 29 May 2025 04:33:09 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 29 May 2025 12:30:22 +0100
Subject: [PATCH v2 01/11] arm64: sysreg: Update PMSIDR_EL1 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-james-perf-feat_spe_eft-v2-1-a01a9baad06a@linaro.org>
References: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
In-Reply-To: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
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
 kvmarm@lists.linux.dev
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_043313_310299_28246387 
X-CRM114-Status: GOOD (  10.89  )
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

From: Marc Zyngier <maz@kernel.org>

Add the missing SME, ALTCLK, FPF, EFT. CRR and FDS fields.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index bdf044c5d11b..e7a8423500f7 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2226,7 +2226,28 @@ Field	15:0	MINLAT
 EndSysreg
 
 Sysreg	PMSIDR_EL1	3	0	9	9	7
-Res0	63:25
+Res0	63:33
+UnsignedEnum	32	SME
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	31:28	ALTCLK
+	0b0000	NI
+	0b0001	IMP
+	0b1111	IMPDEF
+EndEnum
+UnsignedEnum	27	FPF
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	26	EFT
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	25	CRR
+	0b0	NI
+	0b1	IMP
+EndEnum
 Field	24	PBT
 Field	23:20	FORMAT
 Enum	19:16	COUNTSIZE
@@ -2244,7 +2265,10 @@ Enum	11:8	INTERVAL
 	0b0111	3072
 	0b1000	4096
 EndEnum
-Res0	7
+UnsignedEnum	7	FDS
+	0b0	NI
+	0b1	IMP
+EndEnum
 Field	6	FnE
 Field	5	ERND
 Field	4	LDS

-- 
2.34.1


