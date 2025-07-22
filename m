Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68209C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 03:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOiuLvmg0zyyTxkdzmKKTYBl9SQzDB7q/BZgYmb7rvg=; b=qGRBbmQdpMFwV61FA7y6kNU93F
	n6SXYmwHyCekdGzSsl+wkUByCqO1R+pGiK/dXRPNSK2O3dQ25jSwHlbQvs2w+2yUA6+iwQ+lQWUAC
	h16fZpw7UQ2atnUYibdpMFwyk2YYUiGZPQUpGur93lGcE+JOClPqYPTk0Hc6bQHEFpH0t3p6D+Hl+
	zN9rspYJ4J6rJzFu9Ytf19OwpPhPKxqGekbLG1Et0iqSWb2MH3CxjFCCDvxVaQtpWv2UWM+njOwUO
	8LRw4fYbHt6xDuh5J8ALwh1j+t8Gqa+EHAPfmco6HeXpToe0lnGViEZiytVRuwFdkvsUZ3ft+qwal
	R4T7ORrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3gA-00000001Ay8-1Gd1;
	Tue, 22 Jul 2025 03:28:34 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3TW-0000000196L-0PXy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:32 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-74af4af04fdso4186925b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 20:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154129; x=1753758929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOiuLvmg0zyyTxkdzmKKTYBl9SQzDB7q/BZgYmb7rvg=;
        b=J/9fRkYMHl5hkSEl4WNEr12REk2wwSPmTx1B/gyRie8UIV28dIMQBuJMlkBcqZvUTs
         HPEngrSlz5C/pgTUN5Te9LFXDjGtQMEVo7a2Cib33xI0kzdY9QFSGPUNJ5CjPGhx1nL8
         ZnwY9Vr7Q4UbXp32MjidH9QoUgMgOhW1j6du9yW4LXpSottC1bf5QSyXo10UJqIwtPvo
         FxI/hM2KPYONzQOLXpcny6MTzKdg5f+mRf7GstrMMLqed/cYFLZuQ9zxxbAweunIiIyX
         2oBdEnY/tvp5DuUfxE1ccUTas4uYIaL+9dnOFX1P4DwH/3sV3XMokjc4dsV5GxOn1VTg
         pKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154129; x=1753758929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOiuLvmg0zyyTxkdzmKKTYBl9SQzDB7q/BZgYmb7rvg=;
        b=Zo8qG9tA2HgmOR+U2fiFaBRsOuJ4SHhZJWTybvjMBj5ZJJgs7Xv4wnzpZUsuU6W/na
         EtPhWzrjLmOm2m7AuHQgg5fA0hzBrHaNcj2WPRdCiikIMnirxMJfWflhDvUKXebCnhiL
         5wOnWXbprtlgw6HJncrEEdQDtBPb6vU5w4t6PK9OypjNIk+xQEAr3m+74OU9SaE94qV8
         sIOSbygOVplJXWJuS+KOxxeG9OzsmIahki4Gw+IUi8UOQK8jtUG8Iw0AmV0ypDIUbfCj
         UH+Oj5c2s+LvKs2DKrZDnIxz2iZ1s8VvjDNpf2sq3aVhDLoMFjjv6Rrs7A38hUM6gjSV
         1X4w==
X-Forwarded-Encrypted: i=1; AJvYcCV6jfnO0ycesiZcbul2fSykchZjkmELG79vCaA6cr5ROl8d3aZmH+rK6CZxQfI4gOg/5cJ+1OzTAMIUo7Tlq5C7@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqow+lNB8I8waGnlSZEkIBn/zB65qld/L0NTxGMuxy0ntNZURO
	FkjPExoT9FBOLGRGmespyIyHWXjEkpTv4hxHZMnLRXGeFxpS06eWjvRP1XOhZIkgWKQ=
X-Gm-Gg: ASbGncuDrS0EUOPoEnaPnJm0U544K+CxDxKE6GCNroPaoujIuhhUpwZcco3RyVTkUb6
	ZSof5Ix2RqpJEYOFhTEOd/LTBxLq84W52nZvrZHR0dMrUKvHuxM1T9v9F5nOVZg3+xjAicDpZG1
	VkpueXCfg18nVejHBZliLe5fbfjpbxWMKszNGCyL4UkJEtONvBK554EUyuha2r1YEUwD0wuiKeM
	ojdtznfwXG/WbzkZknig9aHUekRxPdkyW3i/SIdCfSuyJmdfiI6bEDu2q2+77RXWP4O/Y+aYtE1
	oD23v7JM2OPvCUdqzelkcSeMRjMFko25ufHmxUErQ3VIKcdbWCvMKUHlj0Qp6WyyFn1bLgbTf8i
	zOVaup/eRs7cxm/WLU5aSKGlJcuMLTaf2KJ8=
X-Google-Smtp-Source: AGHT+IE4m/tGD4iWa8+mTThA0s1cqsabkUVocojZBeVv2a32z+xQKzcohOpb05G+cpoLAKrGJbuRZA==
X-Received: by 2002:a05:6a21:99a1:b0:233:aec3:ce69 with SMTP id adf61e73a8af0-23d37ccbf52mr3181460637.3.1753154129335;
        Mon, 21 Jul 2025 20:15:29 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:29 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 21 Jul 2025 20:15:20 -0700
Subject: [PATCH v4 4/9] drivers/perf: riscv: Implement PMU event info
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-pmu_event_info-v4-4-ac76758a4269@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250721_201530_192275_C86CE509 
X-CRM114-Status: GOOD (  17.71  )
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

With the new SBI PMU event info function, we can query the availability
of the all standard SBI PMU events at boot time with a single ecall.
This improves the bootime by avoiding making an SBI call for each
standard PMU event. Since this function is defined only in SBI v3.0,
invoke this only if the underlying SBI implementation is v3.0 or higher.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h |  9 ++++++
 drivers/perf/riscv_pmu_sbi.c | 69 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index b0c41ef56968..5ca7cebc13cc 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -136,6 +136,7 @@ enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_COUNTER_FW_READ,
 	SBI_EXT_PMU_COUNTER_FW_READ_HI,
 	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
+	SBI_EXT_PMU_EVENT_GET_INFO,
 };
 
 union sbi_pmu_ctr_info {
@@ -159,6 +160,14 @@ struct riscv_pmu_snapshot_data {
 	u64 reserved[447];
 };
 
+struct riscv_pmu_event_info {
+	u32 event_idx;
+	u32 output;
+	u64 event_data;
+};
+
+#define RISCV_PMU_EVENT_INFO_OUTPUT_MASK 0x01
+
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
 /* SBI v3.0 allows extended hpmeventX width value */
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 7331808b1192..433d122f1f41 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -299,6 +299,66 @@ static struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
 	},
 };
 
+static int pmu_sbi_check_event_info(void)
+{
+	int num_events = ARRAY_SIZE(pmu_hw_event_map) + PERF_COUNT_HW_CACHE_MAX *
+			 PERF_COUNT_HW_CACHE_OP_MAX * PERF_COUNT_HW_CACHE_RESULT_MAX;
+	struct riscv_pmu_event_info *event_info_shmem;
+	phys_addr_t base_addr;
+	int i, j, k, result = 0, count = 0;
+	struct sbiret ret;
+
+	event_info_shmem = kcalloc(num_events, sizeof(*event_info_shmem), GFP_KERNEL);
+	if (!event_info_shmem)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
+		event_info_shmem[count++].event_idx = pmu_hw_event_map[i].event_idx;
+
+	for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
+		for (j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
+			for (k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++)
+				event_info_shmem[count++].event_idx =
+							pmu_cache_event_map[i][j][k].event_idx;
+		}
+	}
+
+	base_addr = __pa(event_info_shmem);
+	if (IS_ENABLED(CONFIG_32BIT))
+		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO, lower_32_bits(base_addr),
+				upper_32_bits(base_addr), count, 0, 0, 0);
+	else
+		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO, base_addr, 0,
+				count, 0, 0, 0);
+	if (ret.error) {
+		result = -EOPNOTSUPP;
+		goto free_mem;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++) {
+		if (!(event_info_shmem[i].output & RISCV_PMU_EVENT_INFO_OUTPUT_MASK))
+			pmu_hw_event_map[i].event_idx = -ENOENT;
+	}
+
+	count = ARRAY_SIZE(pmu_hw_event_map);
+
+	for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
+		for (j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
+			for (k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++) {
+				if (!(event_info_shmem[count].output &
+				      RISCV_PMU_EVENT_INFO_OUTPUT_MASK))
+					pmu_cache_event_map[i][j][k].event_idx = -ENOENT;
+				count++;
+			}
+		}
+	}
+
+free_mem:
+	kfree(event_info_shmem);
+
+	return result;
+}
+
 static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 {
 	struct sbiret ret;
@@ -316,6 +376,15 @@ static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 
 static void pmu_sbi_check_std_events(struct work_struct *work)
 {
+	int ret;
+
+	if (sbi_v3_available) {
+		ret = pmu_sbi_check_event_info();
+		if (ret)
+			pr_err("pmu_sbi_check_event_info failed with error %d\n", ret);
+		return;
+	}
+
 	for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
 		pmu_sbi_check_event(&pmu_hw_event_map[i]);
 

-- 
2.43.0


