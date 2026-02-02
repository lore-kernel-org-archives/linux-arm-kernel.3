Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CE9E73156
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 11:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QyoII6nqzBeIWsDGEglX8EZ/BM8yJuMFD3qz9JYR7y0=; b=tt5stnKl6f9gJdBhRw+ny0H6ZH
	2TsVRCRvmJkzBk5aJ9XxdV+GHC6u1UPt6aNOCtQsfB4EmnL7ZXziJ57LElU9g3BQG30erOsEUC/HZ
	etQoA//49hJyD3lMrgJrHSOstrCGl0DIB5510RdqpmcF6SkNJT1kTcgh8we9xebai5+t5Ukn0bctC
	9jucsLJ4bzmK44aTK0Vo6R/6VB4Q763dyU1Eoi/jrtWYjjfOzazjCEs+TTd8YDwLGGGIbyCETiZ8A
	5MDlkzozqjX6N/Zm7N4hDl4GBZFMsuJ0wKv5CfWi5h46yXcZKk4RO+0IlOdrIdUZjMpj+7rEY6Oy3
	Rt/43WwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrwX-00000004szg-2hDf;
	Mon, 02 Feb 2026 11:18:09 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrwU-00000004syx-1tC3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 11:18:07 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8230d228372so2251081b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 03:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1770031083; x=1770635883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QyoII6nqzBeIWsDGEglX8EZ/BM8yJuMFD3qz9JYR7y0=;
        b=cnTWSmkopJ2HRQVo6BTfM3j8yNcxwdWOG3XkBdmASX0jMg85i2d5NV9WkA4/F/joPU
         +i6FnrTR/JkrTd2pPkTnDWJuyKZiK2fipGzCljAUJNZCZmgaQ9B+eLT+SRGrxNWhj+mI
         TTmpfHa8J07LfwiK09P0uJQPtK5Iszp4dRb4eBT3mLJ1UarIsW6XX65N5mvbU2BPT4A2
         qCBO2tlhUU0TDnFHdc//sQivcXAIHhBb7If9F35ZsZOP2ZcO5X4j6o6dExDP0O6sDMKo
         pvHIf2A5lt5xapAMKrpdE+QWKnjyLhj8NMShOLF4QQqNdf7BfGPm62ytMYhtYiiGkNL1
         o8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770031083; x=1770635883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyoII6nqzBeIWsDGEglX8EZ/BM8yJuMFD3qz9JYR7y0=;
        b=e25D+M78TgYF6ZGZlqOkhTg8IiN68RisHc0ro/shtaw4fF2KdpStmBm5grmNHN3u7I
         4KW7k9jtcuMZtnK8gBu/xgflZ1kbCfQFTW1opQvbxmBzmZFqpprdSZG+wbcMH+td0q9/
         BtC0wLvT15KNPahvVHqgGugkBPRP7wG/yW0QmNl3I0gX9bc512StUH8SK8drQouN6qhr
         Y31F3J04jJ0q9evqNvMeAbviOW32tgH5xT2QmFcZ5UYArBZP/3P8WhLYGHua2j8fV7DI
         0X8c1/GrvA5Ayexvjmy0NN4giYKKwFlgG0tvXKNBXRqcHEuU2tRqAQ4xC+cDD0kRWSSO
         89IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdlyQawt8R7Hip9dWXQ3E+/dtj1rxdm5ZjsRfixoHeHiG486i3JUwckNYrz/Kmz4B10Pq13ESNpi0X8FU0FBKf@lists.infradead.org
X-Gm-Message-State: AOJu0YzMd8796v/qR+OfqUgmtEzrvcl+eVAiHbQ1vJv/8NPIzy0KvrNR
	xUIg8I0kUtUwwNMTeXZyuGnoN1ArAhnZS5GaOlkzq4JJoD1bPkl/HOgXFAvr3eSdbJE=
X-Gm-Gg: AZuq6aL0ZIBeopBLQ3Y5YfrNESRTlj/gqdDCAKARq59+wGKBFnQOlPcO4gw4R0N3eKQ
	n+wj8F6BoSUrsGvDNKc6tEU8WG+qHw3hXvKE9d+8N1tij2GNLZr3a3r21i7VF3q9hhgjKgqMxXw
	atfE7yvO/rQ2LAd70ZwN2RDAgnBhOoB2Zq1cl7sUQYHPnl87/53m3a1cORgk5dAu3IVSSU9nWry
	HxExLKEQ0Ae9/RPZiqtCIBZaj+nrxCEJ7efRU/tS+ndTzMIGNV1a+3S2rPPA0WahPz1vUwgSxQQ
	R7f0B2W4DQqrQ0nLmUp8lupHny4D2Fm+O6jI4ipFjOnxZRCUIT/e51jgAMHunbSryQBbbVDC/Cj
	FtANHKeQC+UPHBEtSpyZihI480cc6/nAs2VweEbAFjFP4UibZMQcJywKRUBucikhG4bHlHAauMT
	x2BN4=
X-Received: by 2002:a05:6a00:1249:b0:823:9b7:9c0e with SMTP id d2e1a72fcca58-823ab75f14cmr11353585b3a.34.1770031082825;
        Mon, 02 Feb 2026 03:18:02 -0800 (PST)
Received: from n37-012-226.byted.org ([240e:83:200::8a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c32944sm16015811b3a.57.2026.02.02.03.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 03:18:02 -0800 (PST)
From: "qingwei.hu" <qingwei.hu@bytedance.com>
To: atish.patra@linux.dev,
	anup@brainfault.org,
	will@kernel.org,
	mark.rutland@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH] RISC-V: Skip stopping cycle counter
Date: Mon,  2 Feb 2026 19:17:28 +0800
Message-Id: <20260202111728.4067036-1-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_031806_480086_837D9DAC 
X-CRM114-Status: GOOD (  13.02  )
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

From: Qingwei Hu <qingwei.hu@bytedance.com>

In the riscv_pmu_sbi driver, pmu_sbi_stop_all() is intended to stop
all available counters. However, counter 0 (the cycle counter) should
be excluded from this operation because the counter may be used in
user mode by rdcycle.

Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 drivers/perf/riscv_pmu_sbi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 7dd282da67ce..2bc0050dabd2 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -900,11 +900,15 @@ static int pmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
 static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
 {
 	/*
-	 * No need to check the error because we are disabling all the counters
-	 * which may include counters that are not enabled yet.
+	 * No need to check the error because we are disabling all available
+	 * counters (except the cycle counter) which may include counters
+	 * that are not enabled yet.
+	 *
+	 * Cycle counter is excluded because it might be accessed by user
+	 * mode via rdcycle.
 	 */
 	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
-		  0, pmu->cmask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
+		  0, pmu->cmask & ~BIT(0), SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
 }
 
 static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
-- 
2.39.5


