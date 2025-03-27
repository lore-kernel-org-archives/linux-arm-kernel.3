Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E6AC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 20:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+j0mOzBIBbWihlBNi7mWaZI+CG3uEBnbuDjvN2IYRxw=; b=b35sh1jeX7QxE/TZ4a1gRl7ZLG
	K0LO9tJ6PerV5BZ7Bk3RUHbL0z+dn6B1vIHYUXzzQzqWBBhIYbHH1qLmAUcEr4FLgUVe4bsK6+KpE
	ILKcp91IW8e6zDKlz6lLNIU8aQeFoCBUG/ZMlElx54xQStZudhoaR1fPCunKt/rCbh4IqtXsGRTF1
	MptVjyIALXbCai3mY434w7E18kNSnu0E3Yo2NK/1XxkxSQ56ZB6qaU+Q7RAlb9ErGrSqRS++0RDjH
	ZN+IKJAWkrayyfz5OQR9Ln2LjqzLqccLAaFWisJQPtUqzeTlclNa+8QWf2k/sSpFYAcRk5nbNfgHW
	1w7/WhJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtRU-0000000BvB3-3EBi;
	Thu, 27 Mar 2025 20:03:08 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1p-0000000Bpn7-0PtV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:39 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2ff797f8f1bso2156497a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 12:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104196; x=1743708996; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+j0mOzBIBbWihlBNi7mWaZI+CG3uEBnbuDjvN2IYRxw=;
        b=GP/DXwbHV/XjgSe9Ho4YylGbA0U8MIEbOF3KX72Gc/3pV8RWw6/ZKxRMhMMNV4sEEj
         yeLezD5/+FLDlf642mRmCnshRZIcQubKr82KgQyC94xQfrUoMAOlAQBwszSlFtHKkEB1
         HGFG5C5x6xHHH+pRmWBsfN6BHdt/GTbnhbNc9Nwq3p/AdS3gKTyJx2MelP8cMsjFfRWu
         ctfOMkVIVCsosnyML9p+Fq6SSTIUX0u5jORM5R2QyJ+ir/8OSYZUrn37jqhTL5isioA1
         4wvoFeavlc9LY7TFYYHsdWyN5NmPRru0wZLCAoQ6I7yKrODS6E/2+HG5KUhklVx5IINp
         8rkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104196; x=1743708996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+j0mOzBIBbWihlBNi7mWaZI+CG3uEBnbuDjvN2IYRxw=;
        b=bmoMvV8kytDCWn9NDxmRO38DicdiRJ6KFiTWCy7RXIbFSSpYNIMWNrTwYv70FMrBIo
         HH9E2c0u23iQ2X2bOgDzQ8KoQoBDHbGUtJwvBZ6t6zntukzqX4DRn6WyDcYZOcDax/Pi
         /bH0uho5kxcM23MwTeSgMxnUNF+nW5v82qXLUdvTqs9hLMUe8oy7fJYp01J+ctyM/Y/p
         k8vqxkJhWMpNTCi8FVxihp/53pbA7z0/m6B60zM1T93FGG9MJTFVmcuZ2VQFyuhL/DID
         k+q+fM6OAaMnAdgkUd4pi6g1hDXd5HmKnHSnc0tl/iL0LbKDtOlao8Ixn1dTmZqzvyKp
         CAQw==
X-Forwarded-Encrypted: i=1; AJvYcCVNswXFwVSSu5sNFMSaEEfwoJ06N15qQuCLwkBtCYqpZGZyrLVWqZAy6oml02G55Q6qm57ogHuqUktUYn40D9jy@lists.infradead.org
X-Gm-Message-State: AOJu0YwzErxxYycD7XNfqD6wekaWrc95eTFV1TYaAu+8d2iUFHddsSBV
	MnnvKnj9ljTzVybTZwdKLYoRGdyXv4Gbndqg8WGI8L3DlZrKfVuJFbFWOskY0ww=
X-Gm-Gg: ASbGncvi+gjCEHjcgr/lSh9Gi7E7u/pPQ6aLVPMS2OedVCzBxeZf/3lUBSfsqe/JDnx
	Mu2RaC6zUIvFv9KjIhf+JCfD2bnK0bHLCrsIqPwZVooBcJPe3CokQfTlzmO1NFSz09URifpb3x4
	VB9wD4MdV5nY89N+wJ30TNuK7ublXOZryuDRG2jdr1kHu59FksWDbBVGwqWKZbXVuE4X0Y2KxyN
	tkVTKeBYriebT/owTaJwwS1POdZVwehSLtIJ7rd4kA76Evzcz0p3/mx9GdEo+0/fkcOIVUlefFD
	tyzn7mY/arvjwmkBTfV3w62wB9c+oPUkP9+9kiws1WgUdRkjxr07zQt2lA==
X-Google-Smtp-Source: AGHT+IHdjjEQNX6IhpahJsgRaqmFMHO1OoFraaA5RvWPqmrRHezthFdgwqtl7qWclGaf4FKMvnzgWg==
X-Received: by 2002:a17:90b:2649:b0:2ff:4bac:6fa2 with SMTP id 98e67ed59e1d1-303a7f65282mr7819841a91.16.1743104196370;
        Thu, 27 Mar 2025 12:36:36 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:36 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:56 -0700
Subject: [PATCH v5 15/21] RISC-V: perf: Skip PMU SBI extension when not
 implemented
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-counter_delegation-v5-15-1ee538468d1b@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123637_188206_8E224226 
X-CRM114-Status: GOOD (  17.01  )
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

From: Charlie Jenkins <charlie@rivosinc.com>

When the PMU SBI extension is not implemented, sbi_v2_available should
not be set to true. The SBI implementation for counter config matching
and firmware counter read  should also be skipped when the SBI extension
is not implemented.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 drivers/perf/riscv_pmu_dev.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 7c4a1ef15866..d1cc8310423f 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -417,18 +417,22 @@ static void rvpmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 	}
 }
 
-static void rvpmu_sbi_check_std_events(struct work_struct *work)
+static void rvpmu_check_std_events(struct work_struct *work)
 {
-	for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_sbi_map); i++)
-		rvpmu_sbi_check_event(&pmu_hw_event_sbi_map[i]);
-
-	for (int i = 0; i < ARRAY_SIZE(pmu_cache_event_sbi_map); i++)
-		for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_sbi_map[i]); j++)
-			for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_sbi_map[i][j]); k++)
-				rvpmu_sbi_check_event(&pmu_cache_event_sbi_map[i][j][k]);
+	if (riscv_pmu_sbi_available()) {
+		for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_sbi_map); i++)
+			rvpmu_sbi_check_event(&pmu_hw_event_sbi_map[i]);
+
+		for (int i = 0; i < ARRAY_SIZE(pmu_cache_event_sbi_map); i++)
+			for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_sbi_map[i]); j++)
+				for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_sbi_map[i][j]); k++)
+					rvpmu_sbi_check_event(&pmu_cache_event_sbi_map[i][j][k]);
+	} else {
+		DO_ONCE_LITE_IF(1, pr_err, "Boot time config matching not required for smcdeleg\n");
+	}
 }
 
-static DECLARE_WORK(check_std_events_work, rvpmu_sbi_check_std_events);
+static DECLARE_WORK(check_std_events_work, rvpmu_check_std_events);
 
 static ssize_t rvpmu_format_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
@@ -556,6 +560,9 @@ static int rvpmu_sbi_ctr_get_idx(struct perf_event *event)
 
 	cflags = rvpmu_sbi_get_filter_flags(event);
 
+	if (!riscv_pmu_sbi_available())
+		return -ENOENT;
+
 	/*
 	 * In legacy mode, we have to force the fixed counters for those events
 	 * but not in the user access mode as we want to use the other counters
@@ -878,7 +885,7 @@ static u64 rvpmu_ctr_read(struct perf_event *event)
 		return val;
 	}
 
-	if (pmu_sbi_is_fw_event(event)) {
+	if (pmu_sbi_is_fw_event(event) && riscv_pmu_sbi_available()) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
 				hwc->idx, 0, 0, 0, 0, 0);
 		if (ret.error)
@@ -1945,12 +1952,13 @@ static int __init rvpmu_devinit(void)
 	int ret;
 	struct platform_device *pdev;
 
-	if (sbi_spec_version >= sbi_mk_version(0, 3) &&
-	    sbi_probe_extension(SBI_EXT_PMU))
-		static_branch_enable(&riscv_pmu_sbi_available);
+	if (sbi_probe_extension(SBI_EXT_PMU)) {
+		if (sbi_spec_version >= sbi_mk_version(0, 3))
+			static_branch_enable(&riscv_pmu_sbi_available);
+		if (sbi_spec_version >= sbi_mk_version(2, 0))
+			sbi_v2_available = true;
+	}
 
-	if (sbi_spec_version >= sbi_mk_version(2, 0))
-		sbi_v2_available = true;
 	/*
 	 * We need all three extensions to be present to access the counters
 	 * in S-mode via Supervisor Counter delegation.

-- 
2.43.0


