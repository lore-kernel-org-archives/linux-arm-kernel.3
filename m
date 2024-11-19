Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6E5D6C295
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 20:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40lt9LB/BTg/O24BZtpczZbDrdTkukX/GA7UpRzp0pg=; b=bVJfFiubmrExOUZUFv7ZPk616h
	W2R+LclepISs2NIUW1ujo7Var89mktw0cAhO6MAlByYlpzU07zgmwqR/pHxwCcM4KsAInRoQ+ADNg
	uuwSnza+JZT0phErq49SCGoaazxw+hftE2G8RO2vqGwjgv5KN72j4RiZH1lS2sVN1MKXwi1Rdv4Ji
	I/sSBP7JocCVh+zEocbA+o4hssn1WPxyE+pEO2zgghLnnnQxt1ewvDl9onvD31jEAfSfkv66QW0Vi
	JF8aIfVU6cGDpQmyFicAXpUYJ4kZUKpERChgRQ3WJWXsqjm5dL5MC56ZCp0GE9LLp4iExD4KRjrU+
	YsdjvLjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUxp-0000000Dj0U-1x57;
	Tue, 19 Nov 2024 20:36:45 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUsB-0000000Dh2Q-2AI1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 20:30:57 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20cd76c513cso49819915ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 12:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732048254; x=1732653054; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40lt9LB/BTg/O24BZtpczZbDrdTkukX/GA7UpRzp0pg=;
        b=bTxY8WLOxV07o6wdrJno2VU+okqKEOnwSZ18yehN4H7R12lP/6pNwxNwt1SnIFBazy
         +NqJko5qxVc5dX/kddWHLcAKH7Szi5JjOi4sd2+6heFJQ9zTvhR5Rb6hwCLC19BIcneu
         1v9A8x/n7pNiwasYv5CEGfKD9isaPw+Lq9FwaT2WvgWrI21cx8K5KBtaDPZyYltU7sYr
         yvPokikQBnPTmSyv6nK4Gwtj9llv5UnJGAQ8L+lE6hAL1Sa4tsMGdIGn6ni34XuFnFPl
         dgM7lO9IYRcQdmTMHdCoa3VwdR2i4I7PDOqc6W1lhHZVhbPwbo0wntrm7XUtMxGMPpxL
         f3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732048254; x=1732653054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40lt9LB/BTg/O24BZtpczZbDrdTkukX/GA7UpRzp0pg=;
        b=p5Ljh7ubs5AM+g6LqqnnngDDtCsfNC1Gaqh22D9B/AiEnQbULo0y9IG/J0fID9zsdQ
         Amwodf4c8hV9KwTc4Go+4b7qyL72jNw8YFHUPysAXlg9GG7w392XcxVKt6TZYdgbHhfd
         4stxX7j5X1Axbsn8QhdBOvmNgYeEQLzH74DzO4eMHnwtjfxDoR9T7h5OioJ4FcIM8D3y
         ML+9cGAV9jKej08D6kbPaB2WRpj7usDG5qfjpjMYsv1qISAu3B8WnHyOZ8YxfD4MGVaj
         GtW0SjW2lypkHkoIzzLKYM++EDrELrXM1K1c+E5a7EijL+TkBVEo/8AiWfzZ0PzJp8b6
         1PnA==
X-Forwarded-Encrypted: i=1; AJvYcCVonutql/kFsCLr574FN8wecTdgz7M5UZWjQcLo0XJC8WJwpbJL2reNNUGKj0Yw/py4KE/rb5r0C6pWPImsh8UU@lists.infradead.org
X-Gm-Message-State: AOJu0YxrCfEbfrP5wDYbAKgyfOr3xavZMtGoQJhmRgv0ZkC8AKC3O44k
	Py2NGH3RP3vgNi3XLzcATRiMrePasSGYEX01IKUAdEBzL1UEi9etKWy4nughZCg=
X-Google-Smtp-Source: AGHT+IHsJO0hcJESjwh6eQu7qwaEvcwUlwaSmtArcLLxZHqVuVRuaI9OsGKiZZ86BxWZYDPkCaGZqQ==
X-Received: by 2002:a17:902:d2d2:b0:20c:5533:36da with SMTP id d9443c01a7336-2126b381b65mr257415ad.42.1732048254555;
        Tue, 19 Nov 2024 12:30:54 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f34f2fsm79001315ad.159.2024.11.19.12.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 12:30:54 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Nov 2024 12:29:53 -0800
Subject: [PATCH 5/8] drivers/perf: riscv: Implement PMU event info function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-pmu_event_info-v1-5-a4f9691421f8@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241119_123055_592849_DA986537 
X-CRM114-Status: GOOD (  19.33  )
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
 arch/riscv/include/asm/sbi.h |  7 +++++
 drivers/perf/riscv_pmu_sbi.c | 71 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3ee9bfa5e77c..c04f64fbc01d 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -134,6 +134,7 @@ enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_COUNTER_FW_READ,
 	SBI_EXT_PMU_COUNTER_FW_READ_HI,
 	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
+	SBI_EXT_PMU_EVENT_GET_INFO,
 };
 
 union sbi_pmu_ctr_info {
@@ -157,6 +158,12 @@ struct riscv_pmu_snapshot_data {
 	u64 reserved[447];
 };
 
+struct riscv_pmu_event_info {
+	u32 event_idx;
+	u32 output;
+	u64 event_data;
+};
+
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
 /* SBI v3.0 allows extended hpmeventX width value */
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index f0e845ff6b79..2a6527cc9d97 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -100,6 +100,7 @@ static unsigned int riscv_pmu_irq;
 /* Cache the available counters in a bitmask */
 static unsigned long cmask;
 
+static int pmu_event_find_cache(u64 config);
 struct sbi_pmu_event_data {
 	union {
 		union {
@@ -299,6 +300,68 @@ static struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
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
+	event_info_shmem = (struct riscv_pmu_event_info *)
+			   kcalloc(num_events, sizeof(*event_info_shmem), GFP_KERNEL);
+	if (!event_info_shmem) {
+		pr_err("Can not allocate memory for event info query\n");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
+		event_info_shmem[count++].event_idx = pmu_hw_event_map[i].event_idx;
+
+	for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
+		for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
+			for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++)
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
+	/* Do we need some barriers here or priv mode transition will ensure that */
+	for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++) {
+		if (!(event_info_shmem[i].output & 0x01))
+			pmu_hw_event_map[i].event_idx = -ENOENT;
+	}
+
+	count = ARRAY_SIZE(pmu_hw_event_map);
+
+	for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
+		for (j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
+			for (k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++) {
+				if (!(event_info_shmem[count].output & 0x01))
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
@@ -316,6 +379,14 @@ static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 
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
2.34.1


