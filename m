Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C49AC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 14:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61Iqgtu46/FNdhFy61CVblGgsvlOmM6sXXaQm3S4mzk=; b=NWDCV2CIsCvNunEki2S4J73i28
	vUPo1gq3m0SFGvS4aVzkMF3dJNv19dh5L192bmLZPJ7nkG07OhP1UR8kX36dNif5GFlG0ubqwKAzu
	pBLWJqlo2pU3650HAOGpmWCSWWqBt6XAJr0IGpFleGXYtZYFm7XCL97/fy0iJ28YrE1B5axMJJmzA
	kU+24WTra+rc/pldoZJIHtVOK3u2MeGj5x2fW3ruY63FaaYFL5IItvcgTO/5xFElhWVJJ2GeiR0cH
	O9S1WcchrGoH0oM8ZgGUmb4aIk8gsuhCo/201NC2b7s0peMALPx679bxYfKRwiz9j09xLrO9qwZfc
	q8zXunhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJGT-0000000CJu3-1ahd;
	Tue, 06 May 2025 14:27:21 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGh1-0000000BmLj-0dRb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:42:39 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a0af41faa5so269830f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 04:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746531753; x=1747136553; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61Iqgtu46/FNdhFy61CVblGgsvlOmM6sXXaQm3S4mzk=;
        b=dnJriJ8O9z9f79++xh8uOShpw819RRYFxsMSvqPp7OccptfKYjSZ4gCPkD9LaHeJAJ
         WCgie4G+CeEgta7ztBWdRuAMX+Pk1xAWJMjUsQM1NQewmEzpCueGO13p7xJmEImZV+cz
         B8FZiDqrWaLBXqaCGUrrkdUeEsMkekUG3tAEn6dbmyXBbLuff138BvSV7Toay150A7ok
         r6EoJirB4MvXvyAi94HM7Cfi+M72DlfIa/49Tpgv2AT+jYtX+E56h45iPvMKb2G07DwY
         op74mV3Goo2Kfy6E0oJWKcWs3kJYqxs3fD37AQrokNO0cX1UuXqaAJXVKItGDzxHo+WA
         4JbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531753; x=1747136553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=61Iqgtu46/FNdhFy61CVblGgsvlOmM6sXXaQm3S4mzk=;
        b=ZXpKrQ6D4idvzrlk2z1GKGcvamgFmKp3WsNtDruze+Aj/pGuda2vW+iU5BkI0uPEDn
         5Y9rK/L9t6YEjrpbL2rbPZIpH9zsWzSfK23yft+g6XfsnKITz9Aqre8WqayYOTpkZULx
         q58k50Ld4BLezLLjZ2M36IHM71H56q+iead3hteYmcMhnxz3YIADcm6ExIwUQe5XLhU1
         NnFNuro49qIhZViw/Mzz6ZiRtSN8vKsaAQ+P9Po3PjBSFeT6I3KhcV83Pnn3v0xNZmeo
         Hx+cstxv9ocJx3UnOk0xYLJOMOsDWUIGa2nax5h/KfAYqMbC26JHCfQOyKYhTZg9W61D
         fAIA==
X-Gm-Message-State: AOJu0Yxkhc7n5V6V9uaRWdKjlJJfgXk2mh1QkLdkKydArL66/2zmhpDP
	zBPskAdPXXkg9RgSl5TcYe/hiMBqzQ2Nr5A9nlkH/51NZGFsos6Zf6e78rOxzUA=
X-Gm-Gg: ASbGncuAX6E2t6nfXVRYETruTmmAtun45gzy4pOUjmPvUn5fixrhBXAdCqc/+StWshB
	HWrQzGcxc+gc2umAqpbrQM7DxcfR80cHh5MSX6vpvp/uMKaTawr8nK50OcEx5cedL6z9vwIFDhy
	+6F5rRxfpXLcRxeyOvHXCermyEP14RmsUqJFl0SgHOMaxrZ6sECVgDXdkSj6gMN/KyVX3BdY6uD
	toCyI9epy2GrPgQC7USCnYuY/2wRxQ1mtHLa9v9DUcSTr9isWoys9Yuy1ti8CWdhVv8VntYHSo5
	38VrKMWKhS6beO94v5L5ACCYcHEAlN7y7fKsQYxCfvBFhtA=
X-Google-Smtp-Source: AGHT+IGOdg/E7hDqzaYj4d5eAC+LYCA9Y7Nh4kV6qn5WCG2sjJC4tu8qT06CrXeaclDgMwZbgMGuJw==
X-Received: by 2002:a05:6000:402b:b0:39c:2692:4259 with SMTP id ffacd0b85a97d-3a09fd7a2d5mr9000895f8f.21.1746531753539;
        Tue, 06 May 2025 04:42:33 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm13198473f8f.25.2025.05.06.04.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:42:33 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 May 2025 12:41:33 +0100
Subject: [PATCH 01/10] arm64: sysreg: Add new PMSIDR_EL1 and PMSFCR_EL1
 fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-james-perf-feat_spe_eft-v1-1-dd480e8e4851@linaro.org>
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
X-CRM114-CacheID: sfid-20250506_044235_193254_AFD762EC 
X-CRM114-Status: GOOD (  10.50  )
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

Add new fields and registers that are introduced for the features
FEAT_SPE_CRR (call return records), FEAT_SPE_EFT (extended filtering),
FEAT_SPE_FPF (floating point flag), FEAT_SPE_FDS (data source
filtering), FEAT_SPE_ALTCLK and FEAT_SPE_SME.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index bdf044c5d11b..80d57c83a5f5 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2205,11 +2205,20 @@ Field	0	RND
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
@@ -2226,7 +2235,12 @@ Field	15:0	MINLAT
 EndSysreg
 
 Sysreg	PMSIDR_EL1	3	0	9	9	7
-Res0	63:25
+Res0	63:33
+Field	32	SME
+Field	31:28	ALTCLK
+Field	27	FPF
+Field	26	EFT
+Field	25	CRR
 Field	24	PBT
 Field	23:20	FORMAT
 Enum	19:16	COUNTSIZE
@@ -2244,7 +2258,7 @@ Enum	11:8	INTERVAL
 	0b0111	3072
 	0b1000	4096
 EndEnum
-Res0	7
+Field	7	FDS
 Field	6	FnE
 Field	5	ERND
 Field	4	LDS
@@ -2287,6 +2301,10 @@ Field	16	COLL
 Field	15:0	MSS
 EndSysreg
 
+Sysreg	PMSDSFR_EL1	3	0	9	10	4
+Field	63:0	S
+EndSysreg
+
 Sysreg	PMBIDR_EL1	3	0	9	10	7
 Res0	63:12
 Enum	11:8	EA

-- 
2.34.1


