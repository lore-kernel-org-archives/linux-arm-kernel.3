Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80FECCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfwDPpCiVyJ0buY5NGtfte2dcu4mrKn89k8yErLBKTw=; b=gW7oslfFc+GJA7vQXu6j86Kzqx
	lARSHs+bBB8OakoB9HsiPXy3s0DumNzRspRuLUCAKSLrNqAaZmMEzupqru4Y9inNsQBxPXNKpOe71
	QJtUGD9jFl9cKFEd3N+nlY5KA0QwGmtgn2c2AezJVTjxMvbCnbPWzD3ruYdKlNwpQDSrMLW4i+O3G
	LD7Ab8nZc5i/TxZlpjQ3Zztc/+L1K0cLbHXhG9NrXPiXC+rFXG485TO+3Gp/ZzJuojsPxnrPmTaxh
	A8s06UBslPpMrL2gHC3pIsxAjlbz1B3TABXXVkKq9d/gqkXyGMe6V0O6dCcotrFtcHu8BnKZZSku4
	85c9fO2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ga0-0000000GiqE-256z;
	Tue, 14 Oct 2025 15:04:48 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gZx-0000000Gimw-0E6d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:04:46 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7930132f59aso7316523b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454284; x=1761059084; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfwDPpCiVyJ0buY5NGtfte2dcu4mrKn89k8yErLBKTw=;
        b=FXVWMV0naWYjHXQRoTF6Xheex231t4RHriIXUk2pSX3Jr+2Hujdkjr5QUWaCjWtlj4
         NI+axOr37eTG1jy55cE5RIillvkwWBc3Z9lXlYRoho9/ipl8Sa4jTxyS2ad5xL+zmEnp
         LQ+YW9XtKr4TOcsuTQhgKy70zz0T73iMLjlFFQrqA2LKTWHbW8/kKYOLIx1EnB1Z1ek7
         3b7tjIxJ9Tl93sxkvbV0F/OsYVTquG/XmrC2CdCFPwBAPotjsx/QNrZX7ezQsxggdtwF
         M/ePDV8YOj/l/dlbkGz+RPITm4J4p13alt7pcdzVyUIzCNTN6OEGxXlxAQ3ZC8TXrRY7
         cjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454284; x=1761059084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfwDPpCiVyJ0buY5NGtfte2dcu4mrKn89k8yErLBKTw=;
        b=k1tQtZ9gls4OlAB6W//S0jWJKTV1UXeLaUJKSbfg4RYxAyRp4J5EI9fv2tFaP1mqHf
         a77t9prTKCeEN0EgJNQZrJQ4y5bJt0AgDRGRSofhc9/aPZKmBcj4VOTuzjZKF9Aa4InX
         b5hZzjnIDgdQyi/eKmO9Vl/a58VNDkm/Tv6/beQexIC7hzDRkX85yJUn8r7WW1m+dN9m
         1ZCe6A3qBDb1dzIoU+5ZlWgQZPunp1oKdltTZK615IZsWgzvFLtWsaKtpQYHaDZVWpR3
         ZTnwGSRtU7lzPDzfE7fMJrJCPku4ghBtM0UdTJH7KlARbUXFH+qrFtY5c7Iw0Uf5cXsZ
         +mIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW19KFTYOCbgJlOeOOsv3z8IXnv2JulwPjqkFsvalHQhXXEtapjzji1YtV92FLcRyrMY9dv6K0WbTIxAn1qDLtG@lists.infradead.org
X-Gm-Message-State: AOJu0YyTQLQKiyf4hRCT7IfTsWs+uqG5sTaYvrj8Yc30d0QGfDwkEDZ6
	ea9uEmAIZJzbvK4tPZ/aPO/L4uBsGmwRk5PwiciMmxGA49BuoTEMtczs
X-Gm-Gg: ASbGncsrTnAwdGNtgWDZTCHRwVWFzQkweDFH4/+NALBlaBJtNpD0K3HVEgGRUQJNK2w
	4XM4DziH+XhpKkgC+iJCAFD/+yzGANnKmyxRXGVLnwDy9WRhaW4XKgaUo+zwigAOQ3Spj6d5EMS
	WRn4HtNM58g3updbWOrrPsv9JnouqrByaw1OMPWigDhdbsN6ctVYRJ6gZJ9wLf0tII3slUBsc/O
	aqqqXW+e5y/YHxS/gpPaCATQVcbKaYor9tikOeInFxKfRy3PdjzvyWy3U3BuuWpi3iGcAeeBgjB
	HSiCVVkrg4Dx3QJ34uThbXiEqdInBdYSUyKylj+48ybCioq+HfSx5GgUoSde0vpOd6eWMqq84TN
	qIuGsocWXNvDXc7M5GHQgP9IeUx8FTGXNSj7zA+Q1N78=
X-Google-Smtp-Source: AGHT+IEUcKWN4BM/rckq+Z7v24QtVl6iV0VHt+z7yTPuHHzwk99+jGJZRM1YiVCJ8sEIrmXiCaMaYw==
X-Received: by 2002:a05:6a20:158c:b0:309:48d8:cf31 with SMTP id adf61e73a8af0-32da83de278mr33888699637.32.1760454284167;
        Tue, 14 Oct 2025 08:04:44 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:04:43 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:40 +0800
Subject: [PATCH RESEND v8 07/21] drivers/perf: apple_m1: Support
 per-implementation event attr group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-7-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=HNTQqQJemqX0WI0eYRGH+l+1PjBhJi/4JkQ/C04BuCI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZt+33mUgbufYlHVGEXhWTArkZwbw4rK+t3L
 3JK3LrfMTWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbQAKCRABygi3psUI
 JGsYD/9znkC5rAzIdt7p0b7H6L4B7xbkk+HxpkH85ZoVUmLNgveosIcz5Gyq3HXZq+kHAmOfnyJ
 KUJc9b4QRajZkLSGVUx0wb1GgySCYBuDATXx1QvL9bsTQEttURZbArA35JKtENAOj8Ik53ln2bv
 jxdO6MaRZVVSNOazCh3mvwO/y0q9tfmR//S6VwQ8G243/RWa07UHGBp2gRqbRGOMSm8FYottgh9
 Ctz5IKY9KClKMbZ94XRTQLy4kA5r4nhQpiGjoBTmYq7EaAYvbjpW7siBWAItsOfD+n6yVez8hT7
 csseEnllr22746D6LJoWm7tU8re+DC+hfK7OK2Doxt+NbrLRvAVWtIHT4Tt/2hA1pGZEYkamqzJ
 MZ18iXbSGKpRy6b5fpHClzsMO4LKR4tKLfKZD59tf0XMyxJ6O81/wi+A//QVCDvdJ8BmTaxpC/3
 PgmaGqAQD7ZNk8x2gHXir/lfEcXr+Tx7iAj7tlqQ+zfnnn83w56NC/KbRq7QRsrpQpmrvAV6pqo
 +5t2xj2dUTxPAO03uItkrj53zETg2wBwBxVVzEMjo+a5hpOACkhG4Atv+uDWXkBXUSfuuqMd1Ap
 evJgI64NRMudpI/XdtmHWeB9EX8O/bl2cASG3HeOwP4WmyZnXTjaAfRi7p1YKASPma/S06RkJMZ
 JAX/NiDIbAh2VEg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_080445_099757_3BF4AC36 
X-CRM114-Status: GOOD (  11.85  )
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

To support implementations with different event numbers for cycles or
instruction events, event attr groups needs to be per-implementation.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 303c0e62432281e899a33fc197365c70078d6ac1..d0362a1813788776f4210523efe33a3018cfef2a 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -668,7 +668,6 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu, u32 counters)
 	}
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, counters);
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
 }
@@ -681,6 +680,7 @@ static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -691,6 +691,7 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m1_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -701,6 +702,7 @@ static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 
@@ -711,6 +713,7 @@ static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->map_event	  = m2_pmu_map_event;
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->start		  = m1_pmu_start;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	return apple_pmu_init(cpu_pmu, M1_PMU_NR_COUNTERS);
 }
 

-- 
2.51.0


