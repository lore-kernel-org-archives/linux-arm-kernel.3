Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E72C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 02:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kppyljle9MoC1RO3HWHQlYBE2gQj+CD/61kPvhIKZUU=; b=tkhyMezxIRHUDeRfUmNj+fQlBO
	wwWwt9p6VV6e2sLDgNjthEoF7ob10nFvdTR0nl9z2Eb3UaOUvx4QAwBX6K5NyPmlAN1kd0SbiQyIl
	GZtwp+OtcD+yr2+wn3XFClYDM/RZs3uMgMNmGrv86xNroETSm1VHQG3Px6klqShcWkgb+CgQSBasC
	lQDiGl/TuII3fXRayxFzllX1zqf7/e/xYykoW8+v+FH7ghk9MrFYHdgOYy1WcNggafA6/mxk8qToP
	cDMvZJAo13yMgBQmZoIucmLxwxPTnH7a6QMB1EnOoUv0SjE6S2yBBGsqiHgHYx/QXpabKo/RCGJNb
	An1NNvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uilLE-00000009WGr-0CHj;
	Mon, 04 Aug 2025 02:54:24 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uilId-00000009W1k-0pno
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 02:51:45 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76bdea88e12so1966108b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Aug 2025 19:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1754275898; x=1754880698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kppyljle9MoC1RO3HWHQlYBE2gQj+CD/61kPvhIKZUU=;
        b=Nhk2bpHzGKP0pwcFLYFwajof0HZX0YQRLVi6LyEm0sdy8WnCTHwDmGF9EamRsdh6g7
         vo7e2/OouTHhyx3ZKS6mKXaM9FWsfGNbY6/NEbBoUO/ytb7KUHuOfIAN0VeZA3IeM//s
         N2WSzZjZpDPlscoDrtNbBO7JOhONPFbPREPJQdATjG+qL4bKmj5l3slphEJBN00hhacS
         VHlMvTnISyA1MpRolSTerx6MmjOdNUIPV1L+f1CTFExoFH4rRWcEnYFS7KlUcVxdwFmX
         tYsaBolns60ct2+yq5I7H/QWICPlRERNo+sre4Hcc5I3FIwAnakmlxvLiZtwYcZRPIHE
         PxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754275898; x=1754880698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kppyljle9MoC1RO3HWHQlYBE2gQj+CD/61kPvhIKZUU=;
        b=r0FtLgXlWC3wqhEmiRRjlf9myAX76ajou26Nk0Ntese6m7PBrlBvrr3RSzdfSohZCy
         6z4SvcqD81e0dQcO0NMljcoF6NeNxsvrs0YTBwIEDlgryhEDbnzIPFPnO3riQtpGUm0g
         o3fAVCDYpxMObDbaEJX/ojGeNbF2XQIlN4fkAtYJgEMi9q3DX6ApMYZ9mZDvpP5K38j5
         Wi6nqcm3JMcpFBQi/AmVFSnf0TrKrggifWSHPmZmvtHhzJllk0/uVSisRAxtNo9DppQJ
         LO5mZ0Dd3h6e6Z4KqIUI/6NpzQC/t3e3ggxyoP+vl9kNDRK/C7Lx7FmQKcUMhZFzrXFG
         MrtA==
X-Forwarded-Encrypted: i=1; AJvYcCU8EUN/7NJ6+wzk1BhjdZnVM+vEafWOV4ydqscMF2jDrFyPmwE7tfKgYAWgS8kdTi0OwZlICxOdahhF0ig5Vs6Z@lists.infradead.org
X-Gm-Message-State: AOJu0YwPym1f/YFEfVsngryoPXQm8O7/LBgcmKY9SxmRamp6vH3I81dU
	dLsn5RPGTxyj69MW+4mpaU2YensZ7Vw6WsdysToRLisMa5Z8TrtSGW0W18qTR1N50vI=
X-Gm-Gg: ASbGnculIXqDPXd2x0PqCEDK9nXKaQGKQz0NNtlW7ZF2DGJtqKUeg2AZWh0DLFchDEX
	RKtHgyDmW/hsbqqvQfc8raEHZIYozCiyACyfvSKtr26ilW6Ocb7TDgE78i+RbivfxaRxn2EeHX1
	D+LnjXu3/H/kFGqC3GzQE9KJwETVJJqFLsNYt4bVX7bV7DGtDvE70LDTAn3M3pDz+3N9RQs9bfD
	RI0tdzH0FH7UdUaCdMYG6QeuNdJNCgbfKBD6lBrTaCSAOJ6xMGg2OIFFv9F8om78tlKZyUhpo/+
	ejyqXcuj5pNEfXi09pKZrN2O1R1nA2AiniMSWwZdz8IB2OjiyyZGEKZ33dZGkqXnWcXXQyk2p/1
	/Vz8M+h9TMKBZY9parh1+IEZQ1174EtWUd07lqkhXAmXhvqxReclO/s5UHO4YBg==
X-Google-Smtp-Source: AGHT+IGnAJTT+IrbnsWZCRCk+YCd+3FYDN3fJPd3vuAU12BnpRFJPFCkmur1SehfCljyn2rk7N6/hA==
X-Received: by 2002:a05:6a00:9a5:b0:76b:c882:e0a with SMTP id d2e1a72fcca58-76bec30d23dmr8835977b3a.5.1754275898337;
        Sun, 03 Aug 2025 19:51:38 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76be9143983sm5181960b3a.1.2025.08.03.19.51.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 03 Aug 2025 19:51:37 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: atish.patra@linux.dev,
	anup@brainfault.org,
	will@kernel.org,
	mark.rutland@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH] perf: riscv: skip empty batches in counter start
Date: Mon,  4 Aug 2025 10:51:10 +0800
Message-Id: <20250804025110.11088-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_195143_232627_84AF219F 
X-CRM114-Status: GOOD (  10.58  )
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

Avoid unnecessary SBI calls when starting non-overflowed counters
in pmu_sbi_start_ovf_ctrs_sbi() by checking ctr_start_mask.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/perf/riscv_pmu_sbi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 698de8ddf895b..3977f7488e4ef 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -877,8 +877,10 @@ static inline void pmu_sbi_start_ovf_ctrs_sbi(struct cpu_hw_events *cpu_hw_evt,
 	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
 		ctr_start_mask = cpu_hw_evt->used_hw_ctrs[i] & ~ctr_ovf_mask;
 		/* Start all the counters that did not overflow in a single shot */
-		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, i * BITS_PER_LONG, ctr_start_mask,
-			0, 0, 0, 0);
+		if (ctr_start_mask) {
+			sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, i * BITS_PER_LONG,
+				  ctr_start_mask, 0, 0, 0, 0);
+		}
 	}
 
 	/* Reinitialize and start all the counter that overflowed */
-- 
2.39.5


