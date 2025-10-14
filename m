Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DB8CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQMq4XFtoATrbQB4MivFxur0yQnArRqt8i7j0LTryyU=; b=kA0HLiwWQvecTyH78zm0G8nOVS
	lvItztvyWJH+9+FXyJH1jOyHIafecoQMj3SRRXWjeCzOPAqNg/w/cohxx+FmyPy4F5+/suvjyLXXl
	w/KOCI61MBYttqcYp5IaxZuo6CklPXL/DTrCZ3YGcGXVH8PB0xt5YUM2powDCNqkk8agomqo7jEt3
	tjPSatyHBrWHkiSgqf49vicOLe35nmwsTcE+HLSAZPgjCz2LiO11zHHBxp0wi3ScSpVpn159hwoSV
	3aOmPYv8VK9zwqvBdDdUhq9oYqmhESOYuwMb91ZGowTMZFuFoHLqG7kMdqwtOIYNbXg527FcWDE8P
	GmMBQ+Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gZh-0000000GicH-0FpJ;
	Tue, 14 Oct 2025 15:04:29 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gZf-0000000GiaZ-0l9K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:04:28 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-330b0bb4507so4852671a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454266; x=1761059066; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQMq4XFtoATrbQB4MivFxur0yQnArRqt8i7j0LTryyU=;
        b=SfDAUrddz3vdmf03SiFHFQ4bXQD5gWDnoxfkf7epq7e4ItEK5cQZ/S5Q361Yxus5ql
         QSGvxJrn4Q8nN3Aiw+CZu1jojtiH+atm/NEh3f9DrlCtIxRVbd/OHsgJSqwOe1uJOFAg
         wwEEimwIlIgnf+Kn2MgOfQLwzXFdimmz74y/z7ly4rl+9GTQwRZrEs4cIfxb+hAhWv9F
         kRv8De/c61nGPDU1aFycweC2Im1SXsWZ5ABH4BSc71I30YBvFfaRngU7+U7au6CKTlea
         Qq6uhOXro0rH2XRoIHcibqbPAtwOzwb/C0JlvFmP4Zs7gjL5qJkS+0pN13Y1Ga9lRt+o
         oPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454266; x=1761059066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQMq4XFtoATrbQB4MivFxur0yQnArRqt8i7j0LTryyU=;
        b=q27zxpCbAoIhUU3GT9nS+h7waYQAHcntkBtA3JRktEwZmgCWuUXF0BadGU7NIYux9f
         RycvoIrHcOTj6LCZRgbAGPpiL79qnLYnHil5vBHR2gN3A2+yQ6sEh8FTTYytUEBwGDe7
         QuzXDlNNPfCSLTyP+M7JjxIWxlWtVE71GhJmmJKHIGJGHyJ7mzrfZ3tTzzqV7NW+aHFw
         PnJzqK6CTmG1o9BAR1JyB+makd1mKQpG6ur4mdbhy63gJBSO1xdfItdLh9Hcn9c22buu
         DczdjVMdFFXXMXb1svEICCvWpiFGNBpf0jZG3DUNls3yggKhCAWh8Qdp8r7ya+vrIDLe
         TL5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgBgKslq9/X+8BRluEqkW0IsJW5B6XR/L7WaPsAz5iXOmabHZda64mT5LTvg1QbB5gpbFLuecLEgelqozO+G9F@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4HikI9gQaesd7dGvi+DwirxtG4MOZLqqpzON3dlC9ZGMHlg1M
	TkJA5bwCNUZ5VR37rbKAwa1YG2px6GMEo9HHRzUMWL5KOHLI6rDDCtrD
X-Gm-Gg: ASbGnctyhKzBgFZ/tOFFAREZZ5n+nd2ZwkvZVIiWyrrgm04vCJQOBAxGk/dfNgqpapX
	6pZFJd1t7EdAYFJIBA6EDXo55gE5vuXtKzSpWLFdmGFEh+9dhd4KRm8XTiunuOYgXJlrR6f+zRV
	2Owi1fqrCC9xAKTPihKfRXtB/tv1K+NeKUISKQUSWBAUrkCWQetn7yNUDYNS1gBii0sFw5WYLm2
	xzJ5WkCM+Q/brxtPA6m6tWEGlSW+zhFVGISs1kk2XesYCF6whwQcwgsPu0T52p5/HTwZYST1rCx
	WNADLai1KP5xBypVdZKgGB+KYbXDPUOtVo5QC02+ZvlxBcb6Zba1JuLZYBkFBYFo4KNfxc2IV+5
	VXC8WexlDQR2DBVnbkTD5JeKov/MA4iDiBI1AMRMf31M=
X-Google-Smtp-Source: AGHT+IHH//oGG+duDcarvnMpMCx+s6l5ttFKPXRC9yiM8WYuLiLPNBvTpEmaQ3ZPfrfAhgmB0mtrKA==
X-Received: by 2002:a17:90b:3812:b0:32e:1ff5:5af4 with SMTP id 98e67ed59e1d1-33b51399fd8mr39464227a91.35.1760454266031;
        Tue, 14 Oct 2025 08:04:26 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:04:25 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:35 +0800
Subject: [PATCH RESEND v8 02/21] drivers/perf: apple_m1: Only init PMUv3
 remap when EL2 is available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-2-3f94d4a2a285@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=LWdyJWF3F8SjS8P7dCHoXr3nix46HR/GnW+584oj+64=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZs9VdcsiLU/uSNPQdxREbNvTvb8kWSvNL59
 LtT9fudemKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbAAKCRABygi3psUI
 JKDcD/0b0EZQZCeoY92NSoIoBkRH/0fDA8xMHVxYUbUWvKC6BcMtgc6zs/pA/xvkRD7bikc77mR
 VN4XBPEtMvJptsrMqhUyZgZECmFqTIDFUhkX70YTbOlS4wO2Zgji2nmPi5KDfRhPPxuhLJ1ENmc
 VxKSNvir1mUHLXjcIdUczGpI/zJbWoXe0qkAXJSfeebBYqLrqy6648LbmiHe75hFC9x/sdcuOs4
 Xc8kbYTBWEltzNCdwZxlUcOfCkncmP8MeDceDdERNCvr/4gMVafJDN2LKFHFtOCJzPO6d9eqB5U
 kt9EO7uANvrWPdbEzwhfKpna75FRKRM9W29DRg+UiebgNWkjvYmIeSWltMzCxKpmh+z1c9hmmJs
 vBThwOE4m9hj9OpGeG/U3CDC7kQTQwSni+zjScWl+Vh87lSgtDMsAGGfNB6EmOFeWjv6iAqiF56
 FGgmENFXuXwkJIo/oZqxLQQoBI14djgjy4CXCkLzNw+cMZ1C/6Mlo7Mbx/6QrTV509IHIAe/Xjl
 jk4uAnqz3ZF/m2MQCJDVGfUwvcx+Stst8urbES5JHS1VEvDNQnCGDqjwwznZIdLEOjfQJMlAANn
 DMZpgx/jNhgPayfdDeWO4nppPt0oJWaqMAWDLpAjF8EPq3QnYJoVhnDN5nqePga6IYsXCiPwuIh
 iNGhEoD3WwLdm2A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_080427_237121_6DBFA8CE 
X-CRM114-Status: GOOD (  13.91  )
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

The events in the Apple A7 PMU is very different from the ones in M1, and
EL2 is not available on Apple A7. Instead of assigning the wrong PMUv3
remap on A7 or declaring a new PMUv3 remap that would never be used in
practice, skip initializing PMUv3 remap altogther when EL2 is unavailable.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 81b6f1a623499566ef04d04075752f34e2cb6a92..f3948528e28e0189efd0f17fde0d808930d936af 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -645,8 +645,10 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
-	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
-	m1_pmu_init_pmceid(cpu_pmu);
+	if (is_hyp_mode_available()) {
+		cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
+		m1_pmu_init_pmceid(cpu_pmu);
+	}
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;

-- 
2.51.0


