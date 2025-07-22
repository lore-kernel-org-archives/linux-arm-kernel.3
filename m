Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DE8C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 03:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QppemwXg72umVaHol/lc8lTgDOnrssZANvnDyByXBzA=; b=SbShrT4/QfpqTM/p0y/Vr5htsE
	ttueCzDG+TaXAzbu4o3Lkrl0Fws1MgJpqsZr/4m6eBKVkxydL78G86Qf8Bcc8F2HCfPGlcOvcCYZU
	Tkqch6usQ16SrukVYhLQUjoVdcI1KLwJSATZsiGp8aa6eDBAT40CLnIJY0D3x9zEksossGCcfG5QE
	OErICRFKrexd1KPgCzED6ThNon+/nKDm2Sz8TirHdqvNz9WQ6TvDv+o8QWMU/E30+2Utl0Czkqbug
	ygd9XZcmaVcx32h2CmsPfHuKWIK39L01SrTwCl//YTY6vmTbt3KJGESrJfVna217xipw6BBDl2l6v
	lXH1sAGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3YS-00000001A4Q-0OlQ;
	Tue, 22 Jul 2025 03:20:36 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3TS-0000000193o-3smR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:29 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-75ab31c426dso2513934b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 20:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154126; x=1753758926; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QppemwXg72umVaHol/lc8lTgDOnrssZANvnDyByXBzA=;
        b=fooP1swjwOSmtVGGDiKs6DY0oSLNPKjhw89u6B67jH+kk6+pOZnmI+9M/1hJglc+tE
         DC8duauvhWd+THnmpSDzjU8SqIGih7ABuntZORs3tnHQBKT0e+UGJkTe9FXDy4UuSU24
         IPTIc7xpppx/Wmn2iDAKJY7rwv1mhi9N6R58qp0oWz3Kvyq6hmfmWe1Iboy9WujVhYH6
         fvnjzFR42qDu3I0L8LCki7I31k1AYa54WjhBw3OVR3AWWv3fEIA68mAPh7MEeew0keOK
         pxNa0kO+i1po/fe13sqtNsuPzSOrFhUYJdl1A+Dmj6oeOlMvF5l+TTYkWvZ4Qfi+AESN
         BcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154126; x=1753758926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QppemwXg72umVaHol/lc8lTgDOnrssZANvnDyByXBzA=;
        b=ey1SiXgfAHp6nyNeKk0EOWZKxEj0LC1qkBBf4mwf4puOf/VonvuKuFf0fybkyxkqml
         /rNHP8t9oEtx0sC1TtkkGIJKeY0b0KToXSsEwwMKsohrxmVBQjvLIb8PnUyuyLm2g9mz
         938zRQCrzXJENYFgJ8hFyFnGyGbJoWR76IjmsLM05HHenJ8l/W+T+MTVOTjcIzEtXeqq
         M/7/AG6l6CUFz9SVTazdr92xhgJaadN8zk6F4YSy6iNS4sXRm34Mm9jT7mf108U9a0zs
         bKLhz+Iv/OUJeRZ/cuIs94UCzscf8NL0okX02gv4kxF1WWYAA9yLVVzLHY/2vRaVXBuE
         sm8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiYiGZ9Ujuyz4w6xCJNBNtOPCd/PqAZS4TSwVFIVkF2LvDS1mnoPVKZ8P0kZI892W30ETN2Mh13A6tVSb4aChB@lists.infradead.org
X-Gm-Message-State: AOJu0YyZEZm8+CNe8VmW4HYPKI6B5ZKVHW6pHD16s8XxaPf+6DpHDl9R
	O2QEG/DY9HJu7SymEVi39u6mJzLcAoiEHnP4dHjLZsi0/l/tw/HHaNVkXI2toqXUR64=
X-Gm-Gg: ASbGnctAqb7U2MFMOAK/CXRHmSvvZDIhFpyi6zrIYhTogTRaA9iL5CSjaR9UjFZ7ijI
	0OEhqAatPgjk5oT9MoNna2IYOWpLhdG+uAFrd0/WwIxLsCSS/Vk6QlSX1aWS31Rxljeehwqnm6S
	rv2lJsuK4aWdbBTfwLE3S+BlmE6PmzENdhf/4dzzSaelUKI3d/iFUR65mvBN+6El6sBj7ua8QU9
	5RgxHdd1mKNsJlGBDaFv08wBj+e9L+FpiKsO/PLoWXeU+SZPiWTrD2845/knr/Oy7EtMloxATMS
	v9UwddBxeW+R2UY8vgbMnLfPo4Pk1+POZCAn8Q4Q7lYzuf4eKmqsjDj29viI2yjnkTbDFiM/XoT
	59WdYHTKBmdCyyAiQjJ36ga6AY2Rgt0IWpyo=
X-Google-Smtp-Source: AGHT+IFGWxj3iUKxSSdZKPT9lOfiDcRTnkWskcnNV9b0jBWk2yItlB0Jg7U1GDfAal+i2ahxkqkLKQ==
X-Received: by 2002:a05:6a21:6daa:b0:1f5:8a1d:3904 with SMTP id adf61e73a8af0-23810b4dd3dmr37662781637.7.1753154126114;
        Mon, 21 Jul 2025 20:15:26 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:25 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 21 Jul 2025 20:15:17 -0700
Subject: [PATCH v4 1/9] drivers/perf: riscv: Add SBI v3.0 flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-pmu_event_info-v4-1-ac76758a4269@rivosinc.com>
References: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
In-Reply-To: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_201527_387131_EB3D2617 
X-CRM114-Status: GOOD (  10.76  )
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


