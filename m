Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9A2D6C295
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 20:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qPwdXgi93D1Fj1M3CTUmRPQX23R+cN6bIgDXtW8EzY=; b=xSnKZzWq8vFTmrlN80A+I2gIyk
	0+PUZMPQ1/A2XYlQ9N5tkoAgMllMatUnUhQMKTc6g9kmCQ+7hjU7YJab3QIwwoTsNMWpicKweMCL5
	grOBeDSuXz8qUEp26EEx8S/vYUY0LLQKSZlTbkQDXyfOBhmrPCALNp8MCktqtFb9sNQXaeFpNgme9
	67Q/RgJ+p05hpUk81TYNFgMj449edF7l7GBsgnhIcZMawHS5HzbKzXew0nb+FcbvaCdEROHlLdOen
	j+WW5YdlC8oMvYnr9gdz3mWxBEO4b1DsgusZWzfsPSyGtYWkWLQnQCTU7WbJ/cQNXauaDV261gaTv
	D8MN6k2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUu3-0000000Dhp9-0Wjg;
	Tue, 19 Nov 2024 20:32:51 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUs7-0000000DgyS-1j6D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 20:30:53 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so2766949b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 12:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732048250; x=1732653050; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2qPwdXgi93D1Fj1M3CTUmRPQX23R+cN6bIgDXtW8EzY=;
        b=M5g8pKsRHJyiRw82RF+RYAGccxMNDhin3ktQQCsHuC5Fj4fDKJQlG6gPutwEKmshQ0
         IuYtQ7veeBECXntT8h8auF0hp2tSp9ZH9r8O/cx3RPDXwdcKJtu9xTpu99aGYhqKi7sl
         6o4QyBHEO9Bwb7mN4iYKHQBAvA+1FshteiSMlX+Tk/N6NUeS02lHAp/QAHG4ZNefBkTP
         zoL9IVX8/u2Kvex27Av0wytNihMGAwIqLFUdRrJFix8y2GUM88kvmWKAd6GwLTOpx/4D
         lAgXvOXo9V9gmstb7XHoSKgOBjyE4C1MtJ99IXogay8q1p7tHLUh8oZPl4TddYDIVO1H
         M/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732048250; x=1732653050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qPwdXgi93D1Fj1M3CTUmRPQX23R+cN6bIgDXtW8EzY=;
        b=aKo6oaUTFZcV7XuZqwZv0wge21/hMMSKPJF2bP7uk+0jDrPlA6LS+EvJgoiaSMMEqe
         VJUCSzMfGikKvend8lbhkzDgJhF5QzFsfzH+VbTxKppPlM41LyKMBL3DhO/259KX5z7n
         YULPyHRgfuUXnSBHRHlaxzKm16uLCfcOTzU1uQ1UG8iw/DtAdwWo1te3fSaFSNRzgza/
         lckWNOGbfiWfiiK1DNhko+PGufr4jPKOy9nuj1NNoWYBZIQ67dqfRzJsvLr5+haIRjH7
         F+Nyl0+Ff+NPYZozrDwOz74MaHcpdDHAN+l7uQqWyfbGuQzaOW+cV4qyNGZSzQWPQxpz
         NQRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYKBn05XOCnZXGofDyqG0b+2A5bu6K/j14tNOJFW1q0NkGCtjTPrslupDVEK0z3VFyMUGQmy2Hi2BN99Lb0NuT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz65ahVZ8VaVu70+OF6Eghjbyk8YxG8pNL0GXZ5ySFfKjjmsmyP
	hUxucvr8l4rZ7LVyBlZi3KoICHyY4n9euySxpPBRN/vr52GrhObaEpbv8xbCq1dfFf0NzzNg3py
	P
X-Google-Smtp-Source: AGHT+IHGbLa6SegMg+6UWCLGuDz+AC9C3f5G3GHUQKuYncIbocwbfU1Y52MRciljHs7ffGD0KEce3w==
X-Received: by 2002:a17:90b:288e:b0:2ea:37b4:5373 with SMTP id 98e67ed59e1d1-2eaca70abedmr135913a91.10.1732048250306;
        Tue, 19 Nov 2024 12:30:50 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f34f2fsm79001315ad.159.2024.11.19.12.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 12:30:50 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Nov 2024 12:29:49 -0800
Subject: [PATCH 1/8] drivers/perf: riscv: Add SBI v3.0 flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-pmu_event_info-v1-1-a4f9691421f8@rivosinc.com>
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
In-Reply-To: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_123051_452244_85EEEF01 
X-CRM114-Status: GOOD (  11.07  )
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

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 391ca1422cae..cb98efa9b106 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -63,6 +63,7 @@ PMU_FORMAT_ATTR(event, "config:0-47");
 PMU_FORMAT_ATTR(firmware, "config:62-63");
 
 static bool sbi_v2_available;
+static bool sbi_v3_available;
 static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
 #define sbi_pmu_snapshot_available() \
 	static_branch_unlikely(&sbi_pmu_snapshot_available)
@@ -1450,6 +1451,9 @@ static int __init pmu_sbi_devinit(void)
 	if (sbi_spec_version >= sbi_mk_version(2, 0))
 		sbi_v2_available = true;
 
+	if (sbi_spec_version >= sbi_mk_version(3, 0))
+		sbi_v3_available = true;
+
 	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
 				      "perf/riscv/pmu:starting",
 				      pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);

-- 
2.34.1


