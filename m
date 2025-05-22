Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5D1C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 19:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdMt+/71IZVg41NURvd5gzpotrZUIy+pYhJIn00Ob54=; b=tqJFgrJexTA03kzGy5wGp+h6cn
	eeTGmxaTF819xfHlSFxHHENg1bY1lzI0GqLA5owoKTq4omfxA4Nvfjva8tndu0t9Eg/04IVSLM6Su
	DjJR8tZHg77qD5Wy3L/j4Z0LAv3J+/MUDPxKPlmXmN6M+T3kHWvqODpI9/GFkT6eSmvnrxdwhmSVj
	O34H+EMGY3cbuK1LStTbMGzxGLbQz45fWMVePjB0AeMxSQ93YImM+IuXPXLcug+hNwzqDFZ1RLEPM
	gg5FlHOyfP09BeFLtyiEj94AokGvRRus2G0GHbwyaN/LpBKGPabXw8huK+ldvoEMXM6fpYQ6TCAs2
	u9sjoq7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBIs-00000001yKv-1ox0;
	Thu, 22 May 2025 19:10:06 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCl-00000001wLK-2SAF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 19:03:49 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-23205d55bf4so49317125ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 12:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940627; x=1748545427; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LdMt+/71IZVg41NURvd5gzpotrZUIy+pYhJIn00Ob54=;
        b=vrXAaMc+Gqpmm4vO+eEwg7hihLuRA02xTnuSSJvf5EEXT1h/Co2RGVtP2zopU3NR2T
         JQ6XaqqWOsvsVlhlCccFLjR6hFpnG+L7PJsaHtlhuZO0b8WEL4s40anzBuWV+bS+jZ/N
         Uiv8d2hhlKpA+FDqbZfsEWrAHCxURvtq75vv7ZHNTz3gJqKCVZh2tngUj3Gy6CmmUpKf
         LkJjN8CNvmKLVJ1+iiBX+CftIFraiQfU/nbQVsVeD4nXTO8xNU9dF3yXmlQWP8lhW3+d
         ACkCFe26D3dLHgIb5mP7tb/5ns2sqa83L5z9cX3LABI6aSd76QyX8YFUVOfweuJRf4Cx
         B8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940627; x=1748545427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdMt+/71IZVg41NURvd5gzpotrZUIy+pYhJIn00Ob54=;
        b=R1krykEhPzSqwS7m3U1gIgaFvsOp1WrueHoMf2L701VVIXiQnR/R5rYrkA1Ej++G1F
         OnVHqyjf0Q+otwMTuctqIiC5CdWFbuzQCqgY8wA2xxPA06q0mooK//0kHibLbZpSvbdu
         EmaTv9qGoay2igxLHqFPG/N/Ih39rCah5tSJ4sIU5k0ykP9Yym5tC8spD9hvJBImbL/2
         hSJhj8IqzhExUXp6o3H7CMefx02kqb6yR1U+DU8LtnhWM9lwz5Lh0mI7Qmc9TvVysdJD
         H1Bkt8vkF9EfvYo32nQHVt3QpMhcZ0ErSR8gpvd0aiJja9kGW6aXXc5VsEdB9KszIDfd
         jBdA==
X-Forwarded-Encrypted: i=1; AJvYcCWZjy0zsxhgw9+xbqseiki5q6oeoqohSQYa8JQguJ5LRjJYG/rzkqZuM5rwf0S8xS1pmGQx2wFqikIRfDA7bW/I@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5nKzmsW/XxtiC2tulFJwD2KgvAfiF37/afNsku4gSfUM6qpKM
	/8pmQFsNIQ4l9Cz4SbCKg1EGqiyp8h4zWyOu6Y80Ci9X9rTlNcDwphg2Lfl3LCKxul8=
X-Gm-Gg: ASbGncuROl44hONEujwhwYDA9Oav88F/Kt+GuuKdAiCmF1RedteQq2CW+8zxB5geM6Z
	tNd9dvbVleIgDt98iUtup8HTCiiyI+/1jb+6kkGc88R/z5WBTKPosZOOXQOFb7we79l5HKq9Oxy
	x1GIycf06/PQvQKpgNIfOucy9Cbb0PXtBzgWkMP+h8DcrKHQ+fclrNGLnKQQrq92eDVGsBhV9KX
	fQCGP9CsIZcgY7hd3L6VlGvFpSPxReu3bcrM5xTkwbWP419+QIDddFNSTchUmM+bOggBqa93ZWZ
	daI48dycsjW7trEX/8HBYKC2lJ+lvoBI4768u/CYsVnXctN7k3+Yp4THpOq1jnNl
X-Google-Smtp-Source: AGHT+IFfCV//qxOe2okhTwLGpNoq8DsTJkacWkNUL4qxPXo2ylZ1GEBeSAkJ2y8sxhW9UlvW9cu03w==
X-Received: by 2002:a17:903:124b:b0:231:fc6a:9639 with SMTP id d9443c01a7336-233f23cbf73mr1605975ad.27.1747940626613;
        Thu, 22 May 2025 12:03:46 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:46 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:36 -0700
Subject: [PATCH v3 2/9] drivers/perf: riscv: Add raw event v2 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-pmu_event_info-v3-2-f7bba7fd9cfe@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250522_120347_628588_4E0AD5E3 
X-CRM114-Status: GOOD (  17.28  )
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

SBI v3.0 introduced a new raw event type that allows wider
mhpmeventX width to be programmed via CFG_MATCH.

Use the raw event v2 if SBI v3.0 is available.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h |  4 ++++
 drivers/perf/riscv_pmu_sbi.c | 16 ++++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..6ce385a3a7bb 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -160,7 +160,10 @@ struct riscv_pmu_snapshot_data {
 
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
+/* SBI v3.0 allows extended hpmeventX width value */
+#define RISCV_PMU_RAW_EVENT_V2_MASK GENMASK_ULL(55, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
+#define RISCV_PMU_RAW_EVENT_V2_IDX 0x30000
 #define RISCV_PLAT_FW_EVENT	0xFFFF
 
 /** General pmu event codes specified in SBI PMU extension */
@@ -218,6 +221,7 @@ enum sbi_pmu_event_type {
 	SBI_PMU_EVENT_TYPE_HW = 0x0,
 	SBI_PMU_EVENT_TYPE_CACHE = 0x1,
 	SBI_PMU_EVENT_TYPE_RAW = 0x2,
+	SBI_PMU_EVENT_TYPE_RAW_V2 = 0x3,
 	SBI_PMU_EVENT_TYPE_FW = 0xf,
 };
 
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index cfd6946fca42..273ed70098a3 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -59,7 +59,7 @@ asm volatile(ALTERNATIVE(						\
 #define PERF_EVENT_FLAG_USER_ACCESS	BIT(SYSCTL_USER_ACCESS)
 #define PERF_EVENT_FLAG_LEGACY		BIT(SYSCTL_LEGACY)
 
-PMU_FORMAT_ATTR(event, "config:0-47");
+PMU_FORMAT_ATTR(event, "config:0-55");
 PMU_FORMAT_ATTR(firmware, "config:62-63");
 
 static bool sbi_v2_available;
@@ -527,8 +527,10 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 		break;
 	case PERF_TYPE_RAW:
 		/*
-		 * As per SBI specification, the upper 16 bits must be unused
-		 * for a hardware raw event.
+		 * As per SBI v0.3 specification,
+		 *  -- the upper 16 bits must be unused for a hardware raw event.
+		 * As per SBI v3.0 specification,
+		 *  -- the upper 8 bits must be unused for a hardware raw event.
 		 * Bits 63:62 are used to distinguish between raw events
 		 * 00 - Hardware raw event
 		 * 10 - SBI firmware events
@@ -537,8 +539,14 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 
 		switch (config >> 62) {
 		case 0:
+			if (sbi_v3_available) {
+			/* Return error any bits [56-63] is set  as it is not allowed by the spec */
+				if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MASK)) {
+					*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
+					ret = RISCV_PMU_RAW_EVENT_V2_IDX;
+				}
 			/* Return error any bits [48-63] is set  as it is not allowed by the spec */
-			if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
+			} else if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
 				*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
 				ret = RISCV_PMU_RAW_EVENT_IDX;
 			}

-- 
2.43.0


