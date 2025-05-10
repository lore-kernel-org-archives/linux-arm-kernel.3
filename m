Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651FBC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 06:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvSrH0m4IUpU+lJMf9GPrH6cvsJ1xHIQMLaVbqpMvdE=; b=TVR3XX+BDoySysvF3CaiuBuQO1
	qIhYVrrT9u0Bml9uy6L31+1DkYE37W81ScUs/LeR2BFCHE7yWx6lzIZa8A1cylf5IomOYLwSS33Tj
	MyWIZIKayhrhWMjUlVblgfFoH/x9n+vhF8l4oXw9gJCEAxi4HTN32DEY/hi78ElV+p2QGnnvcZrwb
	0UO2ycmC0HEk937FRDeBoNs3S2QL9bGZ9Dy1BVEN6oSuK71Xzg+4V14CwKjSQ8O04ExURuXaPzFgk
	l+e/JJ2PgSiHBRRVhXggPi/Hn5/i8aEh39jRB/3BaMX+BCjU8f4sWNmOv4RIBsLKDEGiwrIsmuRp0
	1Hcrsy1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDdK4-00000005UVa-4986;
	Sat, 10 May 2025 06:04:32 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDdEW-00000005U1d-1FA3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 05:58:49 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22e8e4423ecso26402145ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 22:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746856727; x=1747461527; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZvSrH0m4IUpU+lJMf9GPrH6cvsJ1xHIQMLaVbqpMvdE=;
        b=ZuL6nmJqABQyo9OvzygLQHzYSqIeZQkquXe8TrhH2rY3FPyTMuWGScMSLBn31VGhD3
         onqWvstEvJUsaC2k4ZiTOLJZrFpOMRFBptvbqEPcDa86sW9TOWVFFIyeQirzQHaRE6Py
         /mhFFkvCDqyFuj2r5KYQx/C5ZoB41D2AsOotK6JvlBdj1LRf0ltJnvMuzQhoC55K9fwt
         /GycBbaF+OB0YKGn4GXux7F6sk9NCIqqdpga4V/Dfskvp52XdwAUuFzdqimw0Py/Yopy
         JkeMF3tMIVZFbvbtYQwXKSmw80JBtKS6WxSU5AgOJK1oS8y8o08MZDuuCucanonsgsOt
         SoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746856727; x=1747461527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvSrH0m4IUpU+lJMf9GPrH6cvsJ1xHIQMLaVbqpMvdE=;
        b=caWmTXJDSO10onq5zvqLm/gEfCbNlIVL5SkpJX74hkcdPWbrErlSlHizww9EsvPF1P
         GCWMuiOiD28nVon6dN4M2saJePLLJcWFwc42XEck/yagQVJzu45c9Q+FLeOMU41u8hs5
         mO/pMm17zna4+bCE0jakOeluSqHr0vvmd4M7nLWIm/EwDgx8iEhFOTtzK2tPtu6XxbFg
         I4xF9nptEETxXQyIKetUzEKD2B5hdvBOX20s1gweNPEGcB+CNa/ewOOizWtWkLk3m6E0
         PC6u0HotusA8jrnkKjZNPwtMxwfsTzepkrYXdWXm970hCWIljluh/nJy3Msb+shyU4BY
         yX7A==
X-Forwarded-Encrypted: i=1; AJvYcCWCMxNYF4peN1VXlXn/i4hEZe53Drp6JxuxcMOylASLorNC49tdyGHDPZxXDrADzFLecM3kc4b5v0z00Avo107D@lists.infradead.org
X-Gm-Message-State: AOJu0YzxF10YwHYxgoLUO7mGoI1w4c6DMMHc/43wixHpROBaS6+JTh0C
	KaEdbX9qtP6Vhcz57NEGmx5zr39pa3ScF8Kw/zfku+D82Ta79tFbspxjxA==
X-Gm-Gg: ASbGnct8/paB+CjMZilGlZJbjAsofTpFpypholoatm1dhNGV0NgiJmWJderK6RtrkK0
	ypKLnRBOcGCnJdQ9yk4nzD+9hi2dUbQ4zeJKFIehhB+yQKn9Mcj310Tzs1wameviS6xkh3EQwqp
	25KYuH/UZC5y1hB6Vpe5cKGlq2TH0eyEwgXaUlAXpKIA99gNdv1xqNqkATa2HIgE2Ufc/VfyPPP
	d4ONepEO18lLA+seG5lp2jghG6GOnJ+NWL2MZvRsL+atBElnbR0GKIOnM6nvp+fYYzUjrJ8PVGv
	bbqUf2U+s4SbG6fWCkN74gyAdunB/An3P0j5vS8DdGBiQbr3Zf6Xr8w7+T1N8UyvVt0xnA==
X-Google-Smtp-Source: AGHT+IHszysuOKe+BXliXC54u04RRE82xYLl5n3Hlqtc4Nnx4bwzHJoObH1iIIdfyb0NhtdrtlIVMg==
X-Received: by 2002:a17:902:f612:b0:223:54aa:6d15 with SMTP id d9443c01a7336-22fc8b3b39fmr105809735ad.12.1746856726879;
        Fri, 09 May 2025 22:58:46 -0700 (PDT)
Received: from [192.168.0.121] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc77413besm26910865ad.84.2025.05.09.22.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 22:58:46 -0700 (PDT)
Message-ID: <fa4f46ef-0f86-41f8-afc2-afc8dd2704a1@gmail.com>
Date: Sat, 10 May 2025 13:58:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v6 03/21] drivers/perf: apple_m1: Support
 per-implementation event tables
To: kernel test robot <lkp@intel.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>
Cc: oe-kbuild-all@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 devicetree@vger.kernel.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250429-apple-cpmu-v6-3-ed21815f0c3f@gmail.com>
 <202505071747.2b2WEajY-lkp@intel.com>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <202505071747.2b2WEajY-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_225848_360128_7EF558C6 
X-CRM114-Status: UNSURE (   7.69  )
X-CRM114-Notice: Please train this message.
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


#syz test

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 365b4ecaedb1..81443e5158b2 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -1082,7 +1082,7 @@ static void m1_pmu_write_counter(struct perf_event *event, u64 value)
 
 static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
                                struct perf_event *event,
-                               const u16 event_affinities[M1_PMU_CFG_EVENT])
+                               const u16 event_affinities[])
 {
        unsigned long evtype = event->hw.config_base & M1_PMU_CFG_EVENT;
        unsigned long affinity = event_affinities[evtype];


