Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D40CCD188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZJgKOvBaKxRXht8HXlFm085PMZstahMFekfq0ah17k=; b=boRdMc+0DgYV6V9cQmIM/yrkLG
	tTw+UkiGggeBpvpP/83IXnjlbemCRec6R71OuTM/C87QSmS2xXQ7t4Sm+/Zc0UK0r++8rQad47NIh
	V+N0jNWWU9sB2HoB2uT2BRj3lJ2EsaWTg8RWk8aQRb2UAB0Qusty6C0E6YmymbVa6MqdcYP2BRvqJ
	AEsmkDBzwfykWzH7nhYfSXhjtOkNu3FXHD5SbFVEvqrCeIkI3iLVx+pheqpVtd/LKTMnWSRWp3pTu
	uirkZe9gu2C7jjf5crdCrC757Pf367yG1AGsY3eTD/RDc07LIIWeUOEP4+aBnJKoDW3586mykfcYS
	RQWGtuow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mzo-00000005fBj-3Ojx;
	Thu, 09 Oct 2025 09:31:36 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mzk-00000005f8Y-24rF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 09:31:34 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-62fb48315ddso1085206a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 02:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760002290; x=1760607090; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZJgKOvBaKxRXht8HXlFm085PMZstahMFekfq0ah17k=;
        b=mQO9Ik6pKUDEPcSEJLDX/N/VQ8xb44qviyNNaxt03JMhHTBofDz6e6JIvUjhkcbX98
         iT9OVCOc10cPLbn0K341Dta9qa+6UxOvu8bif+cX2DplrvYiMhJlem3YSKW7z62MNUXM
         GG8OuopGfVlnywErCXckyHkAiw9Qn/iXj0MrkD4RA+bHpgG2VUuDs1S7sVeRcEDNXVmL
         iqompkmVTa+hWeSMRNuWLEG13ucB7FQuUDlMUHU8LbYPzQ2H+T9q4/aRvbjRoweUp1rg
         L4jVPDV0XSoWL9sk5XRp3CHG5xW2+9tV7qunpx6NeUb0eUJRfgDPzfTCWzDVQ1Nu8yo1
         0uTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760002290; x=1760607090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZJgKOvBaKxRXht8HXlFm085PMZstahMFekfq0ah17k=;
        b=WEPhh8tSKoLXAbUDQDIwDLg7purGGRxAIeARUQZbK4zTofNAbmPa9APNr7cgQe/m8f
         wsf90HNUSllbpkwtG8XSmFOXsZAhIdE/OD50aRhPcVTeliOf4sGm5QeElu/uz4GuDpM+
         Xl9pXa9lD7wEmq5dbt7tmWKrkCNsUrIlleLzvwqgQ78mvIUvbodtkMehdvKQJWJ/tDx6
         qt2/H3oOlXn9Rj/In+CQOa1li8m+Hn3ruaZV5m8rzFBQRNNYfyYhpvAVadMOVOmVnRw0
         KvDx9hnO384ggzXILD2++kKN2gWI0VZc+RYu4SatEQ3+5qaNZZxGcoHKPpFHhbQmzASY
         l2Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXZ4zoIJf69gD77E12xo6zptr93uv4Zj8ubERVU8YD22GVz37vsI6mWSWTEe0vMl+CAlcKjpTVbWC3ceNmHG0/z@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6Mb4wZyCDfoFIUwmlvRSb90Auz3S0FO+WWIxeNsdS1eNkf/pI
	CfsaKrlHWfPE33RBYbqofEA31ulLAZRklbiamDxs7fDT/nWLsXPhkI6vil0ygmhHYfQ=
X-Gm-Gg: ASbGncu7OycDu3uCgBqLptukwiLm6xyJQCL5dEqiAZ+ZSxyWO93mlTIdfYmMuIkC99b
	UdltDI5L9Q5A6Ynd9TOjHTYGkFc81IuoWNSOR+R2oeVkieIm7iaq/rvwBrdQ+D7dYEG9xU9DUDE
	/kEXCnJf7+y1ULzdf1hDufnywWbB5bCZGsnZ0MTDd3Ruqns5ObG7pHbsdHNxDXEdlOSFabfg06Z
	x7FKcQvy54I5iycXymp8wMC0+mfgd9y2HaaP3fUmCazK/UwW5gTkGI0HFVjMEGtu6YlsUs1BKNz
	Z6v84jEF8kL8tNvu28Wn9csYQ6EV/4KTK1NeBHN6V3Gt67F0MOwpQ1HNnPIEJuVR4OGE0E2xCyJ
	fDuvNbyVFIwXtt/SuZjS6m98EhIAP2qRwbF6CtrOqFLm1aUpU6LqnqTra0RQWBbO0q8rf3z3khc
	lalkdzoMiVE7T0yCMAmb+E5Wqiy9UYZXUL0m9nkH4q
X-Google-Smtp-Source: AGHT+IEFBHjueK2L/ZW7bhe4lMi2BrLNc1+BBy/coGcE53/TY8ObSw8M15JdE25SHgGvgOlFyZngtw==
X-Received: by 2002:a17:907:3e22:b0:b3e:b226:5bad with SMTP id a640c23a62f3a-b50a9a6d8a3mr783863066b.8.1760002290407;
        Thu, 09 Oct 2025 02:31:30 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173a41sm1855670766b.87.2025.10.09.02.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:31:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 10:31:27 +0100
Subject: [PATCH v2 3/3] soc: samsung: gs101-pmu: implement access tables
 for read and write
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pmu-regmap-tables-v2-3-2d64f5261952@linaro.org>
References: <20251009-gs101-pmu-regmap-tables-v2-0-2d64f5261952@linaro.org>
In-Reply-To: <20251009-gs101-pmu-regmap-tables-v2-0-2d64f5261952@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_023132_770352_9E62FB7F 
X-CRM114-Status: GOOD (  13.08  )
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

Accessing non-existent PMU registers causes an SError, halting the
system.

Implement read and write access tables for the gs101-PMU to specify
which registers are read- and/or writable to avoid that SError.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Note there are checkpatch warnings 'Macros with complex values should
be enclosed in parentheses' and 'Macro argument reuse' for macros like
CLUSTER_CPU_RANGE(). Since they are used in an initialiser, the only
way to get rid of the warnings is to avoid the macros and duplicate all
the related register ranges I believe, which I'd rather not due to the
sheer amount of similar blocks.
---
 drivers/soc/samsung/gs101-pmu.c             | 306 ++++++++++++++++++++++++-
 include/linux/soc/samsung/exynos-regs-pmu.h | 343 +++++++++++++++++++++++++++-
 2 files changed, 640 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/samsung/gs101-pmu.c b/drivers/soc/samsung/gs101-pmu.c
index ec345d09f21fca8692c3ba2a61feae5615bbef51..17dadc1b9c6ecb49e463fbbf48b1bd866fea936e 100644
--- a/drivers/soc/samsung/gs101-pmu.c
+++ b/drivers/soc/samsung/gs101-pmu.c
@@ -9,6 +9,7 @@
 #include <linux/array_size.h>
 #include <linux/soc/samsung/exynos-pmu.h>
 #include <linux/soc/samsung/exynos-regs-pmu.h>
+#include <linux/regmap.h>
 
 #include "exynos-pmu.h"
 
@@ -20,9 +21,312 @@
 #define TENSOR_PMUREG_WRITE		1
 #define TENSOR_PMUREG_RMW		2
 
+static const struct regmap_range gs101_pmu_registers[] = {
+	regmap_reg_range(GS101_OM_STAT, GS101_SYSTEM_INFO),
+	regmap_reg_range(GS101_IDLE_IP(0), GS101_IDLE_IP_MASK(3)),
+	regmap_reg_range(GS101_DATARAM_STATE_SLC_CH(0),
+			 GS101_PPMPURAM_INFORM_SCL_CH(3)),
+	regmap_reg_range(GS101_INFORM0, GS101_SYSIP_DAT(0)),
+	/* skip SYSIP_DAT1 SYSIP_DAT2 */
+	regmap_reg_range(GS101_SYSIP_DAT(3), GS101_PWR_HOLD_SW_TRIP),
+	regmap_reg_range(GS101_GSA_INFORM(0), GS101_GSA_INFORM(1)),
+	regmap_reg_range(GS101_INFORM4, GS101_IROM_INFORM),
+	regmap_reg_range(GS101_IROM_CPU_INFORM(0), GS101_IROM_CPU_INFORM(7)),
+	regmap_reg_range(GS101_PMU_SPARE(0), GS101_PMU_SPARE(3)),
+	/* skip most IROM_xxx registers */
+	regmap_reg_range(GS101_DREX_CALIBRATION(0), GS101_DREX_CALIBRATION(7)),
+
+#define CLUSTER_CPU_RANGE(cl, cpu)					\
+	regmap_reg_range(GS101_CLUSTER_CPU_CONFIGURATION(cl, cpu),	\
+			 GS101_CLUSTER_CPU_OPTION(cl, cpu)),		\
+	regmap_reg_range(GS101_CLUSTER_CPU_OUT(cl, cpu),		\
+			 GS101_CLUSTER_CPU_IN(cl, cpu)),		\
+	regmap_reg_range(GS101_CLUSTER_CPU_INT_IN(cl, cpu),		\
+			 GS101_CLUSTER_CPU_INT_DIR(cl, cpu))
+
+	/* cluster 0..2 and cpu 0..4 or 0..1 */
+	CLUSTER_CPU_RANGE(GS101_CLUSTER0_OFFSET, 0),
+	CLUSTER_CPU_RANGE(GS101_CLUSTER0_OFFSET, 1),
+	CLUSTER_CPU_RANGE(GS101_CLUSTER0_OFFSET, 2),
+	CLUSTER_CPU_RANGE(GS101_CLUSTER0_OFFSET, 3),
+	CLUSTER_CPU_RANGE(GS101_CLUSTER1_OFFSET, 0),
+	CLUSTER_CPU_RANGE(GS101_CLUSTER1_OFFSET, 1),
+	CLUSTER_CPU_RANGE(GS101_CLUSTER2_OFFSET, 0),
+	CLUSTER_CPU_RANGE(GS101_CLUSTER2_OFFSET, 1),
+#undef CLUSTER_CPU_RANGE
+
+#define CLUSTER_NONCPU_RANGE(cl)					\
+	regmap_reg_range(GS101_CLUSTER_NONCPU_CONFIGURATION(cl),	\
+			 GS101_CLUSTER_NONCPU_OPTION(cl)),		\
+	regmap_reg_range(GS101_CLUSTER_NONCPU_OUT(cl),			\
+			 GS101_CLUSTER_NONCPU_IN(cl)),			\
+	regmap_reg_range(GS101_CLUSTER_NONCPU_INT_IN(cl),		\
+			 GS101_CLUSTER_NONCPU_INT_DIR(cl)),		\
+	regmap_reg_range(GS101_CLUSTER_NONCPU_DUALRAIL_CTRL_OUT(cl),	\
+			 GS101_CLUSTER_NONCPU_DUALRAIL_POS_OUT(cl)),	\
+	regmap_reg_range(GS101_CLUSTER_NONCPU_DUALRAIL_CTRL_IN(cl),	\
+			 GS101_CLUSTER_NONCPU_DUALRAIL_CTRL_IN(cl))
+
+	CLUSTER_NONCPU_RANGE(0),
+	regmap_reg_range(GS101_CLUSTER0_NONCPU_DSU_PCH,
+			 GS101_CLUSTER0_NONCPU_DSU_PCH),
+	CLUSTER_NONCPU_RANGE(1),
+	CLUSTER_NONCPU_RANGE(2),
+#undef CLUSTER_NONCPU_RANGE
+
+#define SUBBLK_RANGE(blk)						\
+	regmap_reg_range(GS101_SUBBLK_CONFIGURATION(blk),		\
+			 GS101_SUBBLK_CTRL(blk)),			\
+	regmap_reg_range(GS101_SUBBLK_OUT(blk), GS101_SUBBLK_IN(blk)),	\
+	regmap_reg_range(GS101_SUBBLK_INT_IN(blk),			\
+			 GS101_SUBBLK_INT_DIR(blk)),			\
+	regmap_reg_range(GS101_SUBBLK_MEMORY_OUT(blk),			\
+			 GS101_SUBBLK_MEMORY_IN(blk))
+
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_ALIVE),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_AOC),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_APM),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CMU),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_BUS0),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_BUS1),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_BUS2),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CORE),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_EH),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CPUCL0),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CPUCL1),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CPUCL2),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_G3D),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_EMBEDDED_CPUCL0),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_EMBEDDED_G3D),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_HSI0),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_HSI1),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_HSI2),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_DPU),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_DISP),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_G2D),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MFC),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CSIS),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_PDP),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_DNS),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_G3AA),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_IPP),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_ITP),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MCSC),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_GDC),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_TNR),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_BO),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_TPU),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MIF0),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MIF1),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MIF2),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MIF3),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MISC),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_PERIC0),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_PERIC1),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_S2D),
+#undef SUBBLK_RANGE
+
+#define SUBBLK_CPU_RANGE(blk)						\
+	regmap_reg_range(GS101_SUBBLK_CPU_CONFIGURATION(blk),		\
+			 GS101_SUBBLK_CPU_OPTION(blk)),			\
+	regmap_reg_range(GS101_SUBBLK_CPU_OUT(blk),			\
+			 GS101_SUBBLK_CPU_IN(blk)),			\
+	regmap_reg_range(GS101_SUBBLK_CPU_INT_IN(blk),			\
+			 GS101_SUBBLK_CPU_INT_DIR(blk))
+
+	SUBBLK_CPU_RANGE(GS101_SUBBBLK_CPU_OFFSET_APM),
+	SUBBLK_CPU_RANGE(GS101_SUBBBLK_CPU_OFFSET_DBGCORE),
+	SUBBLK_CPU_RANGE(GS101_SUBBBLK_CPU_OFFSET_SSS),
+#undef SUBBLK_CPU_RANGE
+
+	regmap_reg_range(GS101_MIF_CONFIGURATION, GS101_MIF_CTRL),
+	regmap_reg_range(GS101_MIF_OUT, GS101_MIF_IN),
+	regmap_reg_range(GS101_MIF_INT_IN, GS101_MIF_INT_DIR),
+	regmap_reg_range(GS101_TOP_CONFIGURATION, GS101_TOP_OPTION),
+	regmap_reg_range(GS101_TOP_OUT, GS101_TOP_IN),
+	regmap_reg_range(GS101_TOP_INT_IN, GS101_WAKEUP2_STAT),
+	regmap_reg_range(GS101_WAKEUP2_INT_IN, GS101_WAKEUP2_INT_DIR),
+	regmap_reg_range(GS101_SYSTEM_CONFIGURATION, GS101_USER_DEFINED_OUT),
+	regmap_reg_range(GS101_SYSTEM_OUT, GS101_SYSTEM_IN),
+	regmap_reg_range(GS101_SYSTEM_INT_IN, GS101_EINT_WAKEUP_MASK3),
+	regmap_reg_range(GS101_USER_DEFINED_INT_IN, GS101_SCAN2DRAM_INT_DIR),
+	/* skip HCU_START */
+	regmap_reg_range(GS101_CUSTOM_OUT, GS101_CUSTOM_IN),
+	regmap_reg_range(GS101_CUSTOM_INT_IN, GS101_CUSTOM_INT_DIR),
+	regmap_reg_range(GS101_ACK_LAST_CPU, GS101_HCU_R(3)),
+	regmap_reg_range(GS101_HCU_SP, GS101_HCU_PC),
+	/* skip PMU_RAM_CTRL */
+	regmap_reg_range(GS101_APM_HCU_CTRL, GS101_APM_HCU_CTRL),
+	regmap_reg_range(GS101_APM_NMI_ENABLE, GS101_RST_STAT_PMU),
+	regmap_reg_range(GS101_HPM_INT_IN, GS101_BOOT_STAT),
+	regmap_reg_range(GS101_PMLINK_OUT, GS101_PMLINK_AOC_CTRL),
+	regmap_reg_range(GS101_TCXO_BUF_CTRL, GS101_ADD_CTRL),
+	regmap_reg_range(GS101_HCU_TIMEOUT_RESET, GS101_HCU_TIMEOUT_SCAN2DRAM),
+	regmap_reg_range(GS101_TIMER(0), GS101_TIMER(3)),
+	regmap_reg_range(GS101_PPC_MIF(0), GS101_PPC_EH),
+	/* PPC_OFFSET, skip PPC_CPUCL1_0 PPC_CPUCL1_1 */
+	regmap_reg_range(GS101_EXT_REGULATOR_MIF_DURATION, GS101_TCXO_DURATION),
+	regmap_reg_range(GS101_BURNIN_CTRL, GS101_TMU_SUB_TRIP),
+	regmap_reg_range(GS101_MEMORY_CEN, GS101_MEMORY_SMX_FEEDBACK),
+	regmap_reg_range(GS101_SLC_PCH_CHANNEL, GS101_SLC_PCH_CB),
+	regmap_reg_range(GS101_FORCE_NOMC, GS101_FORCE_NOMC),
+	regmap_reg_range(GS101_FORCE_BOOST, GS101_PMLINK_SLC_BUSY),
+	regmap_reg_range(GS101_BOOTSYNC_OUT, GS101_CTRL_SECJTAG_ALIVE),
+	regmap_reg_range(GS101_CTRL_DIV_PLL_ALV_DIVLOW, GS101_CTRL_CLKDIV__CLKRTC),
+	regmap_reg_range(GS101_CTRL_SOC32K, GS101_CTRL_SBU_SW_EN),
+	regmap_reg_range(GS101_PAD_CTRL_CLKOUT0, GS101_PAD_CTRL_WRESETO_n),
+	regmap_reg_range(GS101_PHY_CTRL_USB20, GS101_PHY_CTRL_UFS),
+};
+
+static const struct regmap_range gs101_pmu_ro_registers[] = {
+	regmap_reg_range(GS101_OM_STAT, GS101_VERSION),
+	regmap_reg_range(GS101_OTP_STATUS, GS101_OTP_STATUS),
+
+	regmap_reg_range(GS101_DATARAM_STATE_SLC_CH(0),
+			 GS101_PPMPURAM_STATE_SLC_CH(0)),
+	regmap_reg_range(GS101_DATARAM_STATE_SLC_CH(1),
+			 GS101_PPMPURAM_STATE_SLC_CH(1)),
+	regmap_reg_range(GS101_DATARAM_STATE_SLC_CH(2),
+			 GS101_PPMPURAM_STATE_SLC_CH(2)),
+	regmap_reg_range(GS101_DATARAM_STATE_SLC_CH(3),
+			 GS101_PPMPURAM_STATE_SLC_CH(3)),
+
+#define CLUSTER_CPU_RANGE(cl, cpu)					\
+	regmap_reg_range(GS101_CLUSTER_CPU_IN(cl, cpu),			\
+			 GS101_CLUSTER_CPU_IN(cl, cpu)),		\
+	regmap_reg_range(GS101_CLUSTER_CPU_INT_IN(cl, cpu),		\
+			 GS101_CLUSTER_CPU_INT_IN(cl, cpu))
+
+	CLUSTER_CPU_RANGE(GS101_CLUSTER0_OFFSET, 0),
+	CLUSTER_CPU_RANGE(GS101_CLUSTER0_OFFSET, 1),
+	CLUSTER_CPU_RANGE(GS101_CLUSTER0_OFFSET, 2),
+	CLUSTER_CPU_RANGE(GS101_CLUSTER0_OFFSET, 3),
+	CLUSTER_CPU_RANGE(GS101_CLUSTER1_OFFSET, 0),
+	CLUSTER_CPU_RANGE(GS101_CLUSTER1_OFFSET, 1),
+	CLUSTER_CPU_RANGE(GS101_CLUSTER2_OFFSET, 0),
+	CLUSTER_CPU_RANGE(GS101_CLUSTER2_OFFSET, 1),
+#undef CLUSTER_CPU_RANGE
+
+#define CLUSTER_NONCPU_RANGE(cl)					\
+	regmap_reg_range(GS101_CLUSTER_NONCPU_IN(cl),			\
+			 GS101_CLUSTER_NONCPU_IN(cl)),			\
+	regmap_reg_range(GS101_CLUSTER_NONCPU_INT_IN(cl),		\
+			 GS101_CLUSTER_NONCPU_INT_IN(cl)),		\
+	regmap_reg_range(GS101_CLUSTER_NONCPU_DUALRAIL_CTRL_IN(cl),	\
+			 GS101_CLUSTER_NONCPU_DUALRAIL_CTRL_IN(cl))
+
+	CLUSTER_NONCPU_RANGE(0),
+	CLUSTER_NONCPU_RANGE(1),
+	CLUSTER_NONCPU_RANGE(2),
+	regmap_reg_range(GS101_CLUSTER_NONCPU_INT_EN(2),
+			 GS101_CLUSTER_NONCPU_INT_DIR(2)),
+#undef CLUSTER_NONCPU_RANGE
+
+#define SUBBLK_RANGE(blk)						\
+	regmap_reg_range(GS101_SUBBLK_IN(blk), GS101_SUBBLK_IN(blk)),	\
+	regmap_reg_range(GS101_SUBBLK_INT_IN(blk),			\
+			 GS101_SUBBLK_INT_IN(blk)),			\
+	regmap_reg_range(GS101_SUBBLK_MEMORY_IN(blk),			\
+			 GS101_SUBBLK_MEMORY_IN(blk))
+
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_ALIVE),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_AOC),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_APM),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CMU),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_BUS0),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_BUS1),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_BUS2),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CORE),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_EH),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CPUCL0),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CPUCL1),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CPUCL2),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_G3D),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_EMBEDDED_CPUCL0),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_EMBEDDED_G3D),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_HSI0),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_HSI1),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_HSI2),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_DPU),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_DISP),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_G2D),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MFC),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CSIS),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_PDP),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_DNS),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_G3AA),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_IPP),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_ITP),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MCSC),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_GDC),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_TNR),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_BO),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_TPU),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MIF0),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MIF1),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MIF2),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MIF3),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MISC),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_PERIC0),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_PERIC1),
+	SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_S2D),
+#undef SUBBLK_RANGE
+
+#define SUBBLK_CPU_RANGE(blk)						\
+	regmap_reg_range(GS101_SUBBLK_CPU_IN(blk),			\
+			 GS101_SUBBLK_CPU_IN(blk)),			\
+	regmap_reg_range(GS101_SUBBLK_CPU_INT_IN(blk),			\
+			 GS101_SUBBLK_CPU_INT_IN(blk))
+
+	SUBBLK_CPU_RANGE(GS101_SUBBBLK_CPU_OFFSET_APM),
+	SUBBLK_CPU_RANGE(GS101_SUBBBLK_CPU_OFFSET_DBGCORE),
+	SUBBLK_CPU_RANGE(GS101_SUBBBLK_CPU_OFFSET_SSS),
+#undef SUBBLK_CPU_RANGE
+
+	regmap_reg_range(GS101_MIF_CONFIGURATION, GS101_MIF_CONFIGURATION),
+	regmap_reg_range(GS101_MIF_IN, GS101_MIF_IN),
+	regmap_reg_range(GS101_MIF_INT_IN, GS101_MIF_INT_IN),
+	regmap_reg_range(GS101_TOP_IN, GS101_TOP_IN),
+	regmap_reg_range(GS101_TOP_INT_IN, GS101_TOP_INT_IN),
+	regmap_reg_range(GS101_WAKEUP2_INT_IN, GS101_WAKEUP2_INT_IN),
+	regmap_reg_range(GS101_SYSTEM_IN, GS101_SYSTEM_IN),
+	regmap_reg_range(GS101_SYSTEM_INT_IN, GS101_SYSTEM_INT_IN),
+	regmap_reg_range(GS101_EINT_INT_IN, GS101_EINT_INT_IN),
+	regmap_reg_range(GS101_EINT2_INT_IN, GS101_EINT2_INT_IN),
+	regmap_reg_range(GS101_EINT3_INT_IN, GS101_EINT3_INT_IN),
+	regmap_reg_range(GS101_USER_DEFINED_INT_IN, GS101_USER_DEFINED_INT_IN),
+	regmap_reg_range(GS101_SCAN2DRAM_INT_IN, GS101_SCAN2DRAM_INT_IN),
+	regmap_reg_range(GS101_CUSTOM_IN, GS101_CUSTOM_IN),
+	regmap_reg_range(GS101_CUSTOM_INT_IN, GS101_CUSTOM_INT_IN),
+	regmap_reg_range(GS101_HCU_R(0), GS101_HCU_R(3)),
+	regmap_reg_range(GS101_HCU_SP, GS101_HCU_PC),
+	regmap_reg_range(GS101_NMI_SRC_IN, GS101_NMI_SRC_IN),
+	regmap_reg_range(GS101_HPM_INT_IN, GS101_HPM_INT_IN),
+	regmap_reg_range(GS101_MEMORY_PGEN_FEEDBACK, GS101_MEMORY_PGEN_FEEDBACK),
+	regmap_reg_range(GS101_MEMORY_SMX_FEEDBACK, GS101_MEMORY_SMX_FEEDBACK),
+	regmap_reg_range(GS101_PMLINK_SLC_ACK, GS101_PMLINK_SLC_BUSY),
+	regmap_reg_range(GS101_BOOTSYNC_IN, GS101_BOOTSYNC_IN),
+	regmap_reg_range(GS101_SCAN_READY_IN, GS101_SCAN_READY_IN),
+	regmap_reg_range(GS101_CTRL_PLL_ALV_LOCK, GS101_CTRL_PLL_ALV_LOCK),
+};
+
+static const struct regmap_access_table gs101_pmu_rd_table = {
+	.yes_ranges = gs101_pmu_registers,
+	.n_yes_ranges = ARRAY_SIZE(gs101_pmu_registers),
+};
+
+static const struct regmap_access_table gs101_pmu_wr_table = {
+	.yes_ranges = gs101_pmu_registers,
+	.n_yes_ranges = ARRAY_SIZE(gs101_pmu_registers),
+	.no_ranges = gs101_pmu_ro_registers,
+	.n_no_ranges = ARRAY_SIZE(gs101_pmu_ro_registers),
+};
+
 const struct exynos_pmu_data gs101_pmu_data = {
 	.pmu_secure = true,
 	.pmu_cpuhp = true,
+	.rd_table = &gs101_pmu_rd_table,
+	.wr_table = &gs101_pmu_wr_table,
 };
 
 /*
@@ -124,7 +428,7 @@ static bool tensor_is_atomic(unsigned int reg)
 		return false;
 
 	switch (reg) {
-	case GS101_SYSIP_DAT0:
+	case GS101_SYSIP_DAT(0):
 	case GS101_SYSTEM_CONFIGURATION:
 		return false;
 	default:
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index 71e0c09a49ebb8544d26081e97492665e5e9ec6a..532c6c2d11950c606576805aeeb38b4612cd2d44 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -672,14 +672,341 @@
 
 /* For Tensor GS101 */
 /* PMU ALIVE */
-#define GS101_SYSIP_DAT0					(0x810)
-#define GS101_CPU0_INFORM					(0x860)
-#define GS101_CPU_INFORM(cpu)	\
-			(GS101_CPU0_INFORM + (cpu*4))
-#define GS101_SYSTEM_CONFIGURATION				(0x3A00)
-#define GS101_EINT_WAKEUP_MASK					(0x3A80)
-#define GS101_PHY_CTRL_USB20					(0x3EB0)
-#define GS101_PHY_CTRL_USBDP					(0x3EB4)
+#define GS101_OM_STAT                           0x0000
+#define GS101_VERSION                           0x0004
+#define GS101_PORESET_CHECK                     0x0008
+#define GS101_OTP_STATUS                        0x000c
+#define GS101_SYSTEM_INFO                       0x0010
+#define GS101_IDLE_IP(n)                        (0x03e0 + ((n) & 3) * 4)
+#define GS101_IDLE_IP_MASK(n)                   (0x03f0 + ((n) & 3) * 4)
+#define GS101_SLC_CH_OFFSET(ch)                 (0x0400 + ((ch) & 3) * 0x10)
+#define GS101_DATARAM_STATE_SLC_CH(ch)          (GS101_SLC_CH_OFFSET(ch) + 0x00)
+#define GS101_TAGRAM_STATE_SLC_CH(ch)           (GS101_SLC_CH_OFFSET(ch) + 0x04)
+#define GS101_LRURAM_STATE_SLC_CH(ch)           (GS101_SLC_CH_OFFSET(ch) + 0x08)
+#define GS101_PPMPURAM_STATE_SLC_CH(ch)         (GS101_SLC_CH_OFFSET(ch) + 0x0c)
+#define GS101_DATARAM_INFORM_SCL_CH(ch)         (GS101_SLC_CH_OFFSET(ch) + 0x40)
+#define GS101_TAGRAM_INFORM_SCL_CH(ch)          (GS101_SLC_CH_OFFSET(ch) + 0x44)
+#define GS101_LRURAM_INFORM_SCL_CH(ch)          (GS101_SLC_CH_OFFSET(ch) + 0x48)
+#define GS101_PPMPURAM_INFORM_SCL_CH(ch)        (GS101_SLC_CH_OFFSET(ch) + 0x4c)
+#define GS101_INFORM0                           0x0800
+#define GS101_INFORM1                           0x0804
+#define GS101_INFORM2                           0x0808
+#define GS101_INFORM3                           0x080c
+#define GS101_SYSIP_DAT(n)                      (0x0810 + ((n) & 3) * 4)
+#define GS101_PWR_HOLD_HW_TRIP                  0x0820
+#define GS101_PWR_HOLD_SW_TRIP                  0x0824
+#define GS101_GSA_INFORM(n)                     (0x0830 + ((n) & 1) * 4)
+#define GS101_INFORM4                           0x0840
+#define GS101_INFORM5                           0x0844
+#define GS101_INFORM6                           0x0848
+#define GS101_INFORM7                           0x084c
+#define GS101_INFORM8                           0x0850
+#define GS101_INFORM9                           0x0854
+#define GS101_INFORM10                          0x0858
+#define GS101_INFORM11                          0x085c
+#define GS101_CPU_INFORM(cpu)                   (0x0860 + ((cpu) & 7) * 4)
+#define GS101_IROM_INFORM                       0x0880
+#define GS101_IROM_CPU_INFORM(cpu)              (0x0890 + ((cpu) & 7) * 4)
+#define GS101_PMU_SPARE(n)                      (0x0900 + ((n) & 3) * 4)
+#define GS101_IROM_DATA_REG(n)                  (0x0980 + ((n) & 3) * 4)
+#define GS101_IROM_PWRMODE                      0x0990
+#define GS101_DREX_CALIBRATION(n)               (0x09a0 + ((n) & 7) * 4)
+
+#define GS101_CLUSTER0_OFFSET                   0x1000
+#define GS101_CLUSTER1_OFFSET                   0x1300
+#define GS101_CLUSTER2_OFFSET                   0x1500
+#define GS101_CLUSTER_CPU_OFFSET(cl, cpu)       ((cl) + ((cpu) * 0x80))
+#define GS101_CLUSTER_CPU_CONFIGURATION(cl, cpu) \
+			(GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x00)
+#define GS101_CLUSTER_CPU_STATUS(cl, cpu) \
+			(GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x04)
+#define GS101_CLUSTER_CPU_STATES(cl, cpu) \
+			(GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x08)
+#define GS101_CLUSTER_CPU_OPTION(cl, cpu) \
+			(GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x0c)
+#define GS101_CLUSTER_CPU_OUT(cl, cpu) \
+			(GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x20)
+#define GS101_CLUSTER_CPU_IN(cl, cpu) \
+			(GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x24)
+#define GS101_CLUSTER_CPU_INT_IN(cl, cpu) \
+			(GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x40)
+#define GS101_CLUSTER_CPU_INT_EN(cl, cpu) \
+			(GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x44)
+#define GS101_CLUSTER_CPU_INT_TYPE(cl, cpu) \
+			(GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x48)
+#define GS101_CLUSTER_CPU_INT_DIR(cl, cpu) \
+			(GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x4c)
+
+#define GS101_CLUSTER_NONCPU_OFFSET(cl)         (0x1200 + ((cl) * 0x200))
+#define GS101_CLUSTER_NONCPU_CONFIGURATION(cl) \
+			(GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x00)
+#define GS101_CLUSTER_NONCPU_STATUS(cl) \
+			(GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x04)
+#define GS101_CLUSTER_NONCPU_STATES(cl) \
+			(GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x08)
+#define GS101_CLUSTER_NONCPU_OPTION(cl) \
+			(GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x0c)
+#define GS101_CLUSTER_NONCPU_OUT(cl) \
+			(GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x20)
+#define GS101_CLUSTER_NONCPU_IN(cl) \
+			(GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x24)
+#define GS101_CLUSTER_NONCPU_INT_IN(cl) \
+			(GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x40)
+#define GS101_CLUSTER_NONCPU_INT_EN(cl) \
+			(GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x44)
+#define GS101_CLUSTER_NONCPU_INT_TYPE(cl) \
+			(GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x48)
+#define GS101_CLUSTER_NONCPU_INT_DIR(cl) \
+			(GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x4c)
+#define GS101_CLUSTER_NONCPU_DUALRAIL_CTRL_OUT(cl) \
+			(GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x60)
+#define GS101_CLUSTER_NONCPU_DUALRAIL_POS_OUT(cl) \
+			(GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x64)
+#define GS101_CLUSTER_NONCPU_DUALRAIL_CTRL_IN(cl) \
+			(GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x6c)
+#define GS101_CLUSTER0_NONCPU_DSU_PCH \
+			(GS101_CLUSTER_NONCPU_OFFSET(0) + 0x80)
+
+#define GS101_SUBBBLK_OFFSET_ALIVE              0x1800
+#define GS101_SUBBBLK_OFFSET_AOC                0x1880
+#define GS101_SUBBBLK_OFFSET_APM                0x1900
+#define GS101_SUBBBLK_OFFSET_CMU                0x1980
+#define GS101_SUBBBLK_OFFSET_BUS0               0x1a00
+#define GS101_SUBBBLK_OFFSET_BUS1               0x1a80
+#define GS101_SUBBBLK_OFFSET_BUS2               0x1b00
+#define GS101_SUBBBLK_OFFSET_CORE               0x1b80
+#define GS101_SUBBBLK_OFFSET_EH                 0x1c00
+#define GS101_SUBBBLK_OFFSET_CPUCL0             0x1c80
+#define GS101_SUBBBLK_OFFSET_CPUCL1             0x1d00
+#define GS101_SUBBBLK_OFFSET_CPUCL2             0x1d80
+#define GS101_SUBBBLK_OFFSET_G3D                0x1e00
+#define GS101_SUBBBLK_OFFSET_EMBEDDED_CPUCL0    0x1e80
+#define GS101_SUBBBLK_OFFSET_EMBEDDED_G3D       0x2000
+#define GS101_SUBBBLK_OFFSET_HSI0               0x2080
+#define GS101_SUBBBLK_OFFSET_HSI1               0x2100
+#define GS101_SUBBBLK_OFFSET_HSI2               0x2180
+#define GS101_SUBBBLK_OFFSET_DPU                0x2200
+#define GS101_SUBBBLK_OFFSET_DISP               0x2280
+#define GS101_SUBBBLK_OFFSET_G2D                0x2300
+#define GS101_SUBBBLK_OFFSET_MFC                0x2380
+#define GS101_SUBBBLK_OFFSET_CSIS               0x2400
+#define GS101_SUBBBLK_OFFSET_PDP                0x2480
+#define GS101_SUBBBLK_OFFSET_DNS                0x2500
+#define GS101_SUBBBLK_OFFSET_G3AA               0x2580
+#define GS101_SUBBBLK_OFFSET_IPP                0x2600
+#define GS101_SUBBBLK_OFFSET_ITP                0x2680
+#define GS101_SUBBBLK_OFFSET_MCSC               0x2700
+#define GS101_SUBBBLK_OFFSET_GDC                0x2780
+#define GS101_SUBBBLK_OFFSET_TNR                0x2800
+#define GS101_SUBBBLK_OFFSET_BO                 0x2880
+#define GS101_SUBBBLK_OFFSET_TPU                0x2900
+#define GS101_SUBBBLK_OFFSET_MIF0               0x2980
+#define GS101_SUBBBLK_OFFSET_MIF1               0x2a00
+#define GS101_SUBBBLK_OFFSET_MIF2               0x2a80
+#define GS101_SUBBBLK_OFFSET_MIF3               0x2b00
+#define GS101_SUBBBLK_OFFSET_MISC               0x2b80
+#define GS101_SUBBBLK_OFFSET_PERIC0             0x2c00
+#define GS101_SUBBBLK_OFFSET_PERIC1             0x2c80
+#define GS101_SUBBBLK_OFFSET_S2D                0x2d00
+#define GS101_SUBBLK_CONFIGURATION(blk)         ((blk) + 0x00)
+#define GS101_SUBBLK_STATUS(blk)                ((blk) + 0x04)
+#define GS101_SUBBLK_STATES(blk)                ((blk) + 0x08)
+#define GS101_SUBBLK_OPTION(blk)                ((blk) + 0x0c)
+#define GS101_SUBBLK_CTRL(blk)                  ((blk) + 0x10)
+#define GS101_SUBBLK_OUT(blk)                   ((blk) + 0x20)
+#define GS101_SUBBLK_IN(blk)                    ((blk) + 0x24)
+#define GS101_SUBBLK_INT_IN(blk)                ((blk) + 0x40)
+#define GS101_SUBBLK_INT_EN(blk)                ((blk) + 0x44)
+#define GS101_SUBBLK_INT_TYPE(blk)              ((blk) + 0x48)
+#define GS101_SUBBLK_INT_DIR(blk)               ((blk) + 0x4c)
+#define GS101_SUBBLK_MEMORY_OUT(blk)            ((blk) + 0x60)
+#define GS101_SUBBLK_MEMORY_IN(blk)             ((blk) + 0x64)
+
+#define GS101_SUBBBLK_CPU_OFFSET_APM            0x3000
+#define GS101_SUBBBLK_CPU_OFFSET_DBGCORE        0x3080
+#define GS101_SUBBBLK_CPU_OFFSET_SSS            0x3100
+#define GS101_SUBBLK_CPU_CONFIGURATION(blk)     ((blk) + 0x00)
+#define GS101_SUBBLK_CPU_STATUS(blk)            ((blk) + 0x04)
+#define GS101_SUBBLK_CPU_STATES(blk)            ((blk) + 0x08)
+#define GS101_SUBBLK_CPU_OPTION(blk)            ((blk) + 0x0c)
+#define GS101_SUBBLK_CPU_OUT(blk)               ((blk) + 0x20)
+#define GS101_SUBBLK_CPU_IN(blk)                ((blk) + 0x24)
+#define GS101_SUBBLK_CPU_INT_IN(blk)            ((blk) + 0x40)
+#define GS101_SUBBLK_CPU_INT_EN(blk)            ((blk) + 0x44)
+#define GS101_SUBBLK_CPU_INT_TYPE(blk)          ((blk) + 0x48)
+#define GS101_SUBBLK_CPU_INT_DIR(blk)           ((blk) + 0x4c)
+
+#define GS101_MIF_CONFIGURATION                 0x3800
+#define GS101_MIF_STATUS                        0x3804
+#define GS101_MIF_STATES                        0x3808
+#define GS101_MIF_OPTION                        0x380c
+#define GS101_MIF_CTRL                          0x3810
+#define GS101_MIF_OUT                           0x3820
+#define GS101_MIF_IN                            0x3824
+#define GS101_MIF_INT_IN                        0x3840
+#define GS101_MIF_INT_EN                        0x3844
+#define GS101_MIF_INT_TYPE                      0x3848
+#define GS101_MIF_INT_DIR                       0x384c
+#define GS101_TOP_CONFIGURATION                 0x3900
+#define GS101_TOP_STATUS                        0x3904
+#define GS101_TOP_STATES                        0x3908
+#define GS101_TOP_OPTION                        0x390c
+#define GS101_TOP_OUT                           0x3920
+#define GS101_TOP_IN                            0x3924
+#define GS101_TOP_INT_IN                        0x3940
+#define GS101_TOP_INT_EN                        0x3944
+#define GS101_TOP_INT_TYPE                      0x3948
+#define GS101_TOP_INT_DIR                       0x394c
+#define GS101_WAKEUP_STAT                       0x3950
+#define GS101_WAKEUP2_STAT                      0x3954
+#define GS101_WAKEUP2_INT_IN                    0x3960
+#define GS101_WAKEUP2_INT_EN                    0x3964
+#define GS101_WAKEUP2_INT_TYPE                  0x3968
+#define GS101_WAKEUP2_INT_DIR                   0x396c
+#define GS101_SYSTEM_CONFIGURATION              0x3a00
+#define GS101_SYSTEM_STATUS                     0x3a04
+#define GS101_SYSTEM_STATES                     0x3a08
+#define GS101_SYSTEM_OPTION                     0x3a0c
+#define GS101_SYSTEM_CTRL                       0x3a10
+#define GS101_SPARE_CTRL                        0x3a14
+#define GS101_USER_DEFINED_OUT                  0x3a18
+#define GS101_SYSTEM_OUT                        0x3a20
+#define GS101_SYSTEM_IN                         0x3a24
+#define GS101_SYSTEM_INT_IN                     0x3a40
+#define GS101_SYSTEM_INT_EN                     0x3a44
+#define GS101_SYSTEM_INT_TYPE                   0x3a48
+#define GS101_SYSTEM_INT_DIR                    0x3a4c
+#define GS101_EINT_INT_IN                       0x3a50
+#define GS101_EINT_INT_EN                       0x3a54
+#define GS101_EINT_INT_TYPE                     0x3a58
+#define GS101_EINT_INT_DIR                      0x3a5c
+#define GS101_EINT2_INT_IN                      0x3a60
+#define GS101_EINT2_INT_EN                      0x3a64
+#define GS101_EINT2_INT_TYPE                    0x3a68
+#define GS101_EINT2_INT_DIR                     0x3a6c
+#define GS101_EINT3_INT_IN                      0x3a70
+#define GS101_EINT3_INT_EN                      0x3a74
+#define GS101_EINT3_INT_TYPE                    0x3a78
+#define GS101_EINT3_INT_DIR                     0x3a7c
+#define GS101_EINT_WAKEUP_MASK                  0x3a80
+#define GS101_EINT_WAKEUP_MASK2                 0x3a84
+#define GS101_EINT_WAKEUP_MASK3                 0x3a88
+#define GS101_USER_DEFINED_INT_IN               0x3a90
+#define GS101_USER_DEFINED_INT_EN               0x3a94
+#define GS101_USER_DEFINED_INT_TYPE             0x3a98
+#define GS101_USER_DEFINED_INT_DIR              0x3a9c
+#define GS101_SCAN2DRAM_INT_IN                  0x3aa0
+#define GS101_SCAN2DRAM_INT_EN                  0x3aa4
+#define GS101_SCAN2DRAM_INT_TYPE                0x3aa8
+#define GS101_SCAN2DRAM_INT_DIR                 0x3aac
+#define GS101_HCU_START                         0x3ab0
+#define GS101_CUSTOM_OUT                        0x3ac0
+#define GS101_CUSTOM_IN                         0x3ac4
+#define GS101_CUSTOM_INT_IN                     0x3ad0
+#define GS101_CUSTOM_INT_EN                     0x3ad4
+#define GS101_CUSTOM_INT_TYPE                   0x3ad8
+#define GS101_CUSTOM_INT_DIR                    0x3adc
+#define GS101_ACK_LAST_CPU                      0x3afc
+#define GS101_HCU_R(n)                          (0x3b00 + ((n) & 3) * 4)
+#define GS101_HCU_SP                            0x3b14
+#define GS101_HCU_PC                            0x3b18
+#define GS101_PMU_RAM_CTRL                      0x3b20
+#define GS101_APM_HCU_CTRL                      0x3b24
+#define GS101_APM_NMI_ENABLE                    0x3b30
+#define GS101_DBGCORE_NMI_ENABLE                0x3b34
+#define GS101_HCU_NMI_ENABLE                    0x3b38
+#define GS101_PWR_HOLD_WDT_ENABLE               0x3b3c
+#define GS101_NMI_SRC_IN                        0x3b40
+#define GS101_RST_STAT                          0x3b44
+#define GS101_RST_STAT_PMU                      0x3b48
+#define GS101_HPM_INT_IN                        0x3b60
+#define GS101_HPM_INT_EN                        0x3b64
+#define GS101_HPM_INT_TYPE                      0x3b68
+#define GS101_HPM_INT_DIR                       0x3b6c
+#define GS101_S2D_AUTH                          0x3b70
+#define GS101_BOOT_STAT                         0x3b74
+#define GS101_PMLINK_OUT                        0x3c00
+#define GS101_PMLINK_AOC_OUT                    0x3c04
+#define GS101_PMLINK_AOC_CTRL                   0x3c08
+#define GS101_TCXO_BUF_CTRL                     0x3c10
+#define GS101_ADD_CTRL                          0x3c14
+#define GS101_HCU_TIMEOUT_RESET                 0x3c20
+#define GS101_HCU_TIMEOUT_SCAN2DRAM             0x3c24
+#define GS101_TIMER(n)                          (0x3c80 + ((n) & 3) * 4)
+#define GS101_PPC_MIF(n)                        (0x3c90 + ((n) & 3) * 4)
+#define GS101_PPC_CORE                          0x3ca0
+#define GS101_PPC_EH                            0x3ca4
+#define GS101_PPC_CPUCL1_0                      0x3ca8
+#define GS101_PPC_CPUCL1_1                      0x3cac
+#define GS101_EXT_REGULATOR_MIF_DURATION        0x3cb0
+#define GS101_EXT_REGULATOR_TOP_DURATION        0x3cb4
+#define GS101_EXT_REGULATOR_CPUCL2_DURATION     0x3cb8
+#define GS101_EXT_REGULATOR_CPUCL1_DURATION     0x3cbc
+#define GS101_EXT_REGULATOR_G3D_DURATION        0x3cc0
+#define GS101_EXT_REGULATOR_TPU_DURATION        0x3cc4
+#define GS101_TCXO_DURATION                     0x3cc8
+#define GS101_BURNIN_CTRL                       0x3cd0
+#define GS101_JTAG_DBG_DET                      0x3cd4
+#define GS101_MMC_CONWKUP_CTRL                  0x3cd8
+#define GS101_USBDPPHY0_USBDP_WAKEUP            0x3cdc
+#define GS101_TMU_TOP_TRIP                      0x3ce0
+#define GS101_TMU_SUB_TRIP                      0x3ce4
+#define GS101_MEMORY_CEN                        0x3d00
+#define GS101_MEMORY_PGEN                       0x3d04
+#define GS101_MEMORY_RET                        0x3d08
+#define GS101_MEMORY_PGEN_FEEDBACK              0x3d0c
+#define GS101_MEMORY_SMX                        0x3d10
+#define GS101_MEMORY_SMX_FEEDBACK               0x3d14
+#define GS101_SLC_PCH_CHANNEL                   0x3d20
+#define GS101_SLC_PCH_CB                        0x3d24
+#define GS101_FORCE_NOMC                        0x3d3c
+#define GS101_FORCE_BOOST                       0x3d4c
+#define GS101_PMLINK_SLC_REQ                    0x3d50
+#define GS101_PMLINK_SLC_ACK                    0x3d54
+#define GS101_PMLINK_SLC_BUSY                   0x3d58
+#define GS101_BOOTSYNC_OUT                      0x3d80
+#define GS101_BOOTSYNC_IN                       0x3d84
+#define GS101_SCAN_READY_OUT                    0x3d88
+#define GS101_SCAN_READY_IN                     0x3d8c
+#define GS101_GSA_RESTORE                       0x3d90
+#define GS101_ALIVE_OTP_LATCH                   0x3d94
+#define GS101_DEBUG_OVERRIDE                    0x3d98
+#define GS101_WDT_OPTION                        0x3d9c
+#define GS101_AOC_WDT_CFG                       0x3da0
+#define GS101_CTRL_SECJTAG_ALIVE                0x3da4
+#define GS101_CTRL_DIV_PLL_ALV_DIVLOW           0x3e00
+#define GS101_CTRL_MUX_CLK_APM_REFSRC_AUTORESTORE 0x3e04
+#define GS101_CTRL_MUX_CLK_APM_REFSRC           0x3e08
+#define GS101_CTRL_MUX_CLK_APM_REF              0x3e0c
+#define GS101_CTRL_MUX_PLL_ALV_DIV4             0x3e10
+#define GS101_CTRL_PLL_ALV_DIV4                 0x3e14
+#define GS101_CTRL_OSCCLK_APMGSA                0x3e18
+#define GS101_CTRL_BLK_AOC_CLKS                 0x3e1c
+#define GS101_CTRL_PLL_ALV_LOCK                 0x3e20
+#define GS101_CTRL_CLKDIV__CLKRTC               0x3e24
+#define GS101_CTRL_SOC32K                       0x3e30
+#define GS101_CTRL_STM_PMU                      0x3e34
+#define GS101_CTRL_PMU_DEBUG                    0x3e38
+#define GS101_CTRL_DEBUG_UART                   0x3e3c
+#define GS101_CTRL_TCK                          0x3e40
+#define GS101_CTRL_SBU_SW_EN                    0x3e44
+#define GS101_PAD_CTRL_CLKOUT0                  0x3e80
+#define GS101_PAD_CTRL_CLKOUT1                  0x3e84
+#define GS101_PAD_CTRL_APM_24MOUT_0             0x3e88
+#define GS101_PAD_CTRL_APM_24MOUT_1             0x3e8c
+#define GS101_PAD_CTRL_IO_FORCE_RETENTION       0x3e90
+#define GS101_PAD_CTRL_APACTIVE_n               0x3e94
+#define GS101_PAD_CTRL_TCXO_ON                  0x3e98
+#define GS101_PAD_CTRL_PWR_HOLD                 0x3e9c
+#define GS101_PAD_CTRL_RESETO_n                 0x3ea0
+#define GS101_PAD_CTRL_WRESETO_n                0x3ea4
+#define GS101_PHY_CTRL_USB20                    0x3eb0
+#define GS101_PHY_CTRL_USBDP                    0x3eb4
+#define GS101_PHY_CTRL_MIPI_DCPHY_M4M4          0x3eb8
+#define GS101_PHY_CTRL_MIPI_DCPHY_S4S4S4S4      0x3ebc
+#define GS101_PHY_CTRL_PCIE_GEN4_0              0x3ec0
+#define GS101_PHY_CTRL_PCIE_GEN4_1              0x3ec4
+#define GS101_PHY_CTRL_UFS                      0x3ec8
 
 /* PMU INTR GEN */
 #define GS101_GRP1_INTR_BID_UPEND				(0x0108)

-- 
2.51.0.710.ga91ca5db03-goog


