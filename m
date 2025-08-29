Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A49CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QppemwXg72umVaHol/lc8lTgDOnrssZANvnDyByXBzA=; b=WKkTje3SQIC0vKgWnxT9XAr8gM
	rYZ+jlZyOsKxiHaAWxqbI4BcqY5uZEshOi2fr9bSxEG7Eb6iw+sOqu1GuzMyJ+vjDXsU9iPS7M4gw
	eB91WWRcQgfUxi+NCD+ru0m2+1dT+CAyDAEFI7BAkL1cNi8vZW6O+bxboLI7cJ+9QyYSFhdU/HQyJ
	PSlizXj0seZs+F531FpctW30DRK3OQvI5aN6Ys8FLItFTze9uj2vWyItFeM5257IagaXgZ3ceHvWn
	LSZEEsZEZFSHkihlPTiou0uh2uNOu4d9SXUkLBX3NsbtGD6JwnSnEckS8ImVNRpPCf1vFCzXXmwYk
	Nb+g8qnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9iH-000000076T7-182I;
	Sat, 30 Aug 2025 00:45:01 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0Hu-00000006409-1Cc5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:12 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-77238cb3cbbso146720b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 07:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478469; x=1757083269; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QppemwXg72umVaHol/lc8lTgDOnrssZANvnDyByXBzA=;
        b=YuvlSVGvaAm6liLZ9WmL77dXRFZfVzqLIoKAnDrSL+kvb3QZhGhSoUJlhssEPoBSmr
         WB83hcVr5LxGnff8YrqHtnb1rXz33f1yId1XtWMHH+tvYdcT5iOAC0pz7WaYTsYVTU9d
         27ugoCTl/WRWMZtSRgqW/6VDXZ8ma1j0Q1rlbOM5WqMOcaSze41Bgpw5JEwYKpmwsg72
         WW0ri/O+8yrdS8Ofj5mJAPPCjnv4iiujsQq8XNATZAT85NLMUrngy6ExedPYP/BnFKwn
         8Af/mv/9fYa2xLrHpbbUJ/O6j6xTPA1xUzNabEFtg9bpM5xngpSrseT9EZD10HNZpSom
         XVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478469; x=1757083269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QppemwXg72umVaHol/lc8lTgDOnrssZANvnDyByXBzA=;
        b=OIQa6m8/2HF+H3PMOtJAsBqseUIu+DrqLumfbzlEfwSTCluzUYRXvvhueO99/YYkh5
         aCw/DKvZ7Oa1fymcnffd3odJPx+/q+7Am4yZHqCcubD7A1H/Yfo9rMEL76aHL1QoYSj/
         eF3XSvd3cDnh4EvjIqF0txW7AfcA3QcvvpBZW9S4lvT7IbwJCB2g3r+ERrmeRofkg/Im
         mK948GWmvQzaH4Nx/vtIf4XmCwFvKjoK4vD2e6a2sCvOTh03bZiW52eHLK/4FQX8dNoL
         g2acOXHJuAbwSZno8cYQNiIsNOn2MkLFxzp/zbdFmxCHeFaq0XZO0sEqhTYgIB+WTXYk
         1FzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpIu4YA2zbM1kvhsBIfVtkYGvBLk7S8ZLoqA0WOofq59kngoyBXBzK0Y97CNjQUSyAFpZzh/u+amXk7eTTQYJx@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1+Q9ULmDINbdPIxsqCzR8+qt+35mvKW9iVMFKKJnAj84X/LMT
	WXgrbs5gxk5f3plZ08c6h3yx3JpXGLXKMzU1kTX3FLjjTZJiOHq7HHWgBQ3wNXeCNIc=
X-Gm-Gg: ASbGncvlCaCRvm2WCgv1xi+FXfpkpyrHW0uw5aMqHf0rQk0FWecuZayky2MjFxqH/Kj
	gvZEGOFsVFf/ktAjk1y4LJtfTviu/VtQC8nTnr3Mwblm/DrPcey57z6a4T1L2SGHOobR+dCMgP/
	sAp6jolJnbqtwm1MNWRGH4vvyKYN+Mt3WI2ocKkjm9MRLIWPydoVk6+YxvbO+W3hd7ayZi2Awhj
	sw/cBQmXy1N+FxZXkrqDNL2Ai9TS0HHV9c4Ltt10KOGz0MYjih/gfq5uKkAPv1IpWdAx9RkR7AL
	kTDt6UIC456qx2gOiMHrTaZ6u0IDVd0HNk7Nq+d5IImETFxndn0fTUu5Z6Rz6cWJ5hmyIdF+dBc
	VUEsI6I1RLIKYJtME/IjrSky8pjSxurDlNpY=
X-Google-Smtp-Source: AGHT+IEyDQaVO7hw6M+jmWcVL/199fQHjMH7i3C/32jO0Trqcu+fqIoi/CB4Tct+03RcyOTn/ZKedg==
X-Received: by 2002:a05:6a00:2306:b0:76b:e868:eedd with SMTP id d2e1a72fcca58-7702fc059c7mr38073588b3a.24.1756478469428;
        Fri, 29 Aug 2025 07:41:09 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:09 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 29 Aug 2025 07:41:02 -0700
Subject: [PATCH v5 1/9] drivers/perf: riscv: Add SBI v3.0 flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-pmu_event_info-v5-1-9dca26139a33@rivosinc.com>
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
In-Reply-To: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_074110_327522_E0F26ECB 
X-CRM114-Status: GOOD (  10.47  )
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

There are new PMU related features introduced in SBI v3.0.
1. Raw Event v2 which allows mhpmeventX value to be 56 bit wide.
2. Get Event info function to do a bulk query at one shot.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 698de8ddf895..cfd6946fca42 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -63,6 +63,7 @@ PMU_FORMAT_ATTR(event, "config:0-47");
 PMU_FORMAT_ATTR(firmware, "config:62-63");
 
 static bool sbi_v2_available;
+static bool sbi_v3_available;
 static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
 #define sbi_pmu_snapshot_available() \
 	static_branch_unlikely(&sbi_pmu_snapshot_available)
@@ -1452,6 +1453,9 @@ static int __init pmu_sbi_devinit(void)
 	if (sbi_spec_version >= sbi_mk_version(2, 0))
 		sbi_v2_available = true;
 
+	if (sbi_spec_version >= sbi_mk_version(3, 0))
+		sbi_v3_available = true;
+
 	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
 				      "perf/riscv/pmu:starting",
 				      pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);

-- 
2.43.0


