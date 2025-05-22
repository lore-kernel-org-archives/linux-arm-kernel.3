Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1973DC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 19:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDxMnssaauwljQxlk9zc0qXTf5HAsn9k6GC49F2uSIA=; b=btvOKIhhPP7qQY9Acl5FhicZf9
	cOICG7tDfdRCLcJkthbf/gGk+yni1neMeOa8Nx72PtEObuCpzdLYAFINuMUSEsE/1QU/WOQFaLlqB
	DY+PyiZtBPtfPecEVmFeqXFaNPGzY17cjwXMTA7kpunslfKs+WP2Pa+R8Jm33QMWje2XGqV6DprPE
	gHkx1rskan3GFeof1xnEwgXoN7pzLCZnAbsZDWt4maHgT3KuiJ83x9M2pghjCayp+gRk7AH6la4JW
	gDa14iM7Z+oU5gG5wPMQo6B00ETCElLb5tiyKbQPn0WsdbQhZ3pMjSoTJvfrUhOWR6r9dV4emJyrO
	ZO0KCxpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBMt-00000001zBL-09Q6;
	Thu, 22 May 2025 19:14:15 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCn-00000001wNQ-3COW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 19:03:51 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b1f7357b5b6so5341175a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 12:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940629; x=1748545429; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDxMnssaauwljQxlk9zc0qXTf5HAsn9k6GC49F2uSIA=;
        b=15cOhUxtgr6JT1fOi2aSAGwU5Bs776F72MbszXfPb/MIbDbBP9eOsy6H6hs8qqEhNK
         j8Z7yKt/rTMXThIdTLRwQhhUwWlyULliYzkxTymS+v+5LRw8pyvBjoOz4kOxJttGHUvp
         zWZVGwVI+1ITCSzt9bahA0gPefPmid6hgEw/Mr+Sdd96yo8IbNhfojV5BjT1Gn8H/feE
         VxZv5eq+5pK92fxVIMxcfGAfqD0TBwdOdEPh3SDuyjjMoC/QYNNltrpdJ7tcgJMPQAdR
         7p3Wijstp6imAQ81H34y5rLaCpXHy105Q3A44Iq2VS91IqSI7MydvQ8I4E6JRySEGre3
         MnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940629; x=1748545429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDxMnssaauwljQxlk9zc0qXTf5HAsn9k6GC49F2uSIA=;
        b=Tsn5vZCAmU4su2QBoaVYlkvEKJ4jjve4sEnhf0ZdnRdA6ghgN/4e5QX2WlOyIGKu3E
         MtUyLuQDdaL4EWQsla5czVh1nJ1pOs2C1ElSMXtC3stRJC6aXwqZrU6uXqFD6drIAvbW
         3mTpins1XQF19K4iLzAn8pUF9eL5h/365Np/5fGxJJhAvtmRIndtQQD7hJupLL3iIHzw
         vqjST/fJJTdBrRTxNAhNN/n2JNIlXDYABwQ/kn33tROG+K13P1ywdSSIshmj0U7StMa2
         AsRYm3hILmtx8LJYu8MRKXdM34iYaP8tjW5Ccc/WAQVanWrY/Jz5ygvC1hX+eNeVBk9P
         otOA==
X-Forwarded-Encrypted: i=1; AJvYcCVV1Bm2eueN6Zs/UAz6f1PKBV9pBSgOZxbXcvJP08GECM+P0kg2jQ3+7Uzo1HxoCLuu32vMs2R1kEkftNbslYdN@lists.infradead.org
X-Gm-Message-State: AOJu0YxgDrLrNQTafItBs0K0ypkkAg7XLNTyCIML3x2SLOPVumBKCefC
	8o1XBpmZxOpXI+sUQiYT2jMrOZv9uQHZyc8GjeAHKLQJWDca/WxAkqQixycPMouUxtc=
X-Gm-Gg: ASbGnctt5BGDZTj079wZAM30MfyPca/xsv4b90BiRLa2SO9J/rYA9HPQt+RFy7oCeps
	3r0Ic5v8SVS/nvJ1CBO9iQp3DXwFW4/rjP8NKFtkBCU7yA7wOwdmYJU+KnyK2xzYH6OvFB4zlFs
	87jcTqgSpdc0KRRggV+JMiJyBnsKWaltMBmBmmLq+uSHCRfkkc7Rog8M/gfrcpOxDzZRmY3cjIV
	O9fGp7CjSXouel2ayzOfFGbEU43Gyz59TWz+YnovbWw7QPtVTf+GpICxM5CUrVpTDaZDzZSKWiw
	/qqEMbc9VsMyB0tJy6p6CzcmjoXlrMOgycUH1HGciFl8tlYbzdRYrN4w62UUsKUx
X-Google-Smtp-Source: AGHT+IG3oxLFDfbSNt6EH0ZdTZ5dYeLSDKnP9JAmNGN1V7oKcB4sbiLpNV8c6lgFnjfD3N9PA0Fqjg==
X-Received: by 2002:a17:902:cf09:b0:22d:b240:34fe with SMTP id d9443c01a7336-231d451b294mr410839265ad.25.1747940628742;
        Thu, 22 May 2025 12:03:48 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:48 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:38 -0700
Subject: [PATCH v3 4/9] drivers/perf: riscv: Implement PMU event info
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-pmu_event_info-v3-4-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_120349_850938_EA843C7D 
X-CRM114-Status: GOOD (  17.43  )
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
 drivers/perf/riscv_pmu_sbi.c | 68 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 6ce385a3a7bb..77b6997eb6c5 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -135,6 +135,7 @@ enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_COUNTER_FW_READ,
 	SBI_EXT_PMU_COUNTER_FW_READ_HI,
 	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
+	SBI_EXT_PMU_EVENT_GET_INFO,
 };
 
 union sbi_pmu_ctr_info {
@@ -158,6 +159,14 @@ struct riscv_pmu_snapshot_data {
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
index 273ed70098a3..33d8348bf68a 100644
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
@@ -316,6 +376,14 @@ static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 
 static void pmu_sbi_check_std_events(struct work_struct *work)
 {
+	int ret;
+
+	if (sbi_v3_available) {
+		ret = pmu_sbi_check_event_info();
+		if (!ret)
+			return;
+	}
+
 	for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
 		pmu_sbi_check_event(&pmu_hw_event_map[i]);
 

-- 
2.43.0


