Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9D7CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goqLKtDob+ZNX+w3rmmnq6+zF8DlfuvYjDiKv2ieDbU=; b=u4ybXtHxl02oDrz41NwVuQKTB5
	iE2cTBLZNLKvxoMqsSGgBRGj0TVE6GDKdPszyyOsDrpGLTyr9sqnECOgWkrokPwIxuZqVegNn2CZN
	3xguJpuPH+fglmc4gXwQ5VtP2XpzZyF3K/Zahdf8MoX6FdtJaJ4O+xjzq1W552EV96pb7LrG9dF4D
	bDrh9fcvDggOZFxNHDXWGTJjricz0QD+zaiMF1sYbszAoZf27wLpkxaOmsawpDMtbc0G1BCjy8GBN
	1sPKqFCCGY+M8QXt4IKL6qrsSssJfGefeaNvuMMAOmWmineW70uxMEs3TX0t0XTdZCSE6tvs0YKY3
	iespk/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtR9-00000005TJd-0oBk;
	Tue, 09 Sep 2025 08:10:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsOB-000000051t0-3aap
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 07:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=goqLKtDob+ZNX+w3rmmnq6+zF8DlfuvYjDiKv2ieDbU=; b=fpQ40FqPeu5fRfKUh/uyi7C0YD
	qonlIOySOt+Na/G1Tqs6LbEMIayY9EoP3I07H9BoNjyrgJa0fLS2ICLsqbSK6dkDt4E/y1yUsBAHr
	L2cpeaq+us9dkABy83qfz2Xt0O5mzbtdWkfyGoJDuhMw+yFzhOyD5QcEfgtTJ0Gmlms+6vw14oknd
	YSFQI6UxUqAw93UN9CScaN089Lm/2cf1KIMIWIV1tb+EkbsLkTD6Gt5489H1FE/yLGV+DxsxfaXQf
	YWH1kCFfPZ9GOfJ+Gr3xiGMkoZvxhZXsw7+Y9Beq0GbHng5XqTvp8zKEzT4n1nUJ0hdkryB1i5LYM
	X/NEpKzw==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsO3-00000005ECT-1Hd7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:38 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7725de6b57dso6049873b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757401407; x=1758006207; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=goqLKtDob+ZNX+w3rmmnq6+zF8DlfuvYjDiKv2ieDbU=;
        b=RaH982WwrOSE+5OQ2eCOL3T1GxYBNY4B5jSnD9SjBQ5gw70A2EfqvK5q+1mjRnUGSv
         Jwukp2HXvyN0QPXfxGYYn+tz1Fynu7a3jw6LDHRmplu7sVL4M7e+RSYmsJzYbjDklUhl
         PsNQwRGh7uv97ThD3sUfsSAsAfOgxEvg3USFaWIdlBNxdF9A3E2pO1GHLbEI+zPJTzv7
         +AzhsqDLuaSRW3RAe0ENQccaeWzO9T5IpLzGmhlPgECjRKM1t7aHJgYiSQ4gASXQyb9X
         5sKSXSl08W6HOdBQ6x0YHuLdKwbhdPzSEOcJEX5NfiA0OyNlwqkWViu4lWQiRC2a/qrc
         ZI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401407; x=1758006207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goqLKtDob+ZNX+w3rmmnq6+zF8DlfuvYjDiKv2ieDbU=;
        b=rXRe06w0jZVcFxamvhfiHkEfeo7LscvAQmMT8JA/kJma4GVva7tEBS2zm57N1I+HZ1
         TpqhYzj82wIYL9jZmZJQwJcqRbMmENGnHTwWblgslOD8uC5Xucvv1uAtGJly96JfkD7t
         NlaWAKOJd+bPlHdsQf+UXvspSinVODrZXRBIld5wdAEgyhBK0f+yXLIqvZ4xLxXTqtcS
         +46wlUx6BuhqhrDnThtvbYvsoGX75/tjIaTAivjy/wETdjX7bmaWKzunjfOCvnC4vgUI
         FDuEl+10wnoSrgB2iWem+8jF5syglZsMFHpBZkDp+I57RH9+MWpjB7xi+qpwSn9H3VvR
         MPGw==
X-Forwarded-Encrypted: i=1; AJvYcCUlFyACaPi6KQVusUlXiZEHeUcdYbAsnH5mRLtaxz3PDjOTmRLE6sLMrgwlbV6KW2YdNV+nqD0dCB+Q5E/pDe8o@lists.infradead.org
X-Gm-Message-State: AOJu0YyJbD7qFE3Hen0QhrCWbhrhfXYVmPQ3oVoR85X4QmJtvtD524TF
	s12x96JXSiKbNMsQGWyyW4MFxTY2bCCZnzwiFyodse6HikP6BO0n1/VQz7GCoRSmgIc=
X-Gm-Gg: ASbGncsqWKJYg9cyVrHV93GWiR+W7n0RZwkBSc/64zbmDAYid8VngUYfzhPrbcoTqRw
	eQnYdnQL66ZTSJ2hfPVM6ycvOBRIDYnRMVx6MfqePTFLRYuMuV83AI23TV1+FXJ6QAHOW7H1l8S
	jX8s7YCxKmG1JNEwd0xy0+EMNsxcd33yfQTgo8pQrxwXHqda53kgHa0KLF7GjDqbiu9mkpz1BIz
	jh5E7secdgajgb0S0im/LxcZkNa7AbO7ji4wWp1xXL58jvlCjdTyGahJuiQV6WMNiuKuUlr8fXy
	21nMmV6lcarI6JJBNV1EAGGKxr612Q/iUZWoOjJwdBFl0W7Ram7gzFQ4Vjlk2Y8qUo9Xd3rElCE
	spM1tVeuiyhvHsnTRixHGaTm3f3x+bp6teqY=
X-Google-Smtp-Source: AGHT+IGJbDnkT5SHhTAhiO5Q6ljc1ugcvXc+gcWNPs7wch9qaoN42+cmkfKz9M/HNQWQv+Jtvr6PpA==
X-Received: by 2002:a05:6a20:3d83:b0:250:429b:9e56 with SMTP id adf61e73a8af0-2533e9476eamr16763215637.8.1757401407457;
        Tue, 09 Sep 2025 00:03:27 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7158sm1025535b3a.72.2025.09.09.00.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:03:27 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 09 Sep 2025 00:03:22 -0700
Subject: [PATCH v6 3/8] RISC-V: KVM: Add support for Raw event v2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-pmu_event_info-v6-3-d8f80cacb884@rivosinc.com>
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
In-Reply-To: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250909_080333_404000_87A94C49 
X-CRM114-Status: GOOD (  11.70  )
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

SBI v3.0 introduced a new raw event type v2 for wider mhpmeventX
programming. Add the support in kvm for that.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 78ac3216a54d..15d71a7b75ba 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -60,6 +60,7 @@ static u32 kvm_pmu_get_perf_event_type(unsigned long eidx)
 		type = PERF_TYPE_HW_CACHE;
 		break;
 	case SBI_PMU_EVENT_TYPE_RAW:
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
 	case SBI_PMU_EVENT_TYPE_FW:
 		type = PERF_TYPE_RAW;
 		break;
@@ -128,6 +129,9 @@ static u64 kvm_pmu_get_perf_event_config(unsigned long eidx, uint64_t evt_data)
 	case SBI_PMU_EVENT_TYPE_RAW:
 		config = evt_data & RISCV_PMU_RAW_EVENT_MASK;
 		break;
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
+		config = evt_data & RISCV_PMU_RAW_EVENT_V2_MASK;
+		break;
 	case SBI_PMU_EVENT_TYPE_FW:
 		if (ecode < SBI_PMU_FW_MAX)
 			config = (1ULL << 63) | ecode;

-- 
2.43.0


