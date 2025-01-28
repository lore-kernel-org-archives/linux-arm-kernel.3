Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F641C02190
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 05:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaBtUmcc8yUuB4kb43/yPbo3SeenY+DY+wt99rutmtE=; b=VlaJA9wN1WPGv4OoYT/3BTtZy7
	VMtj4uMNdr9KsuyHV+YoWfn6bVa9nQypFORSbZuMG4G5AZVIXWyB+1l0pAd8z/3KaOq9blKXR679s
	l6GhI8CoHDHbyDl1okCULeEI5ClL0oZVGyB5FEa50tSwTv9IMx8m1NiSYXlIpewNzCH5JjrVE+4jO
	UDQZKgHBh4Hpphu+XIxC0UF9Of7keXSxc9Ua2wS6qpsUGvP/pkipS4o2S585UktmpoQkWFALaauKY
	zyAygXf32Hdgqnbn13zcvG2oqF5pet6FGx0RSXbXlNPfFUvHY52MwcGIGT/U0tI/4Msr2wxZj7Jf+
	4nE84Pww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdqf-000000047Dh-2O12;
	Tue, 28 Jan 2025 05:09:17 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhf-000000044Qb-2YVs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:01 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2f43da61ba9so6861876a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 20:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040399; x=1738645199; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qaBtUmcc8yUuB4kb43/yPbo3SeenY+DY+wt99rutmtE=;
        b=BLl0w0u+Rgg2Pe8VByR9MEq67LxHIKU/63faSH8as4v5TEv9zvBEPirLCl5rkUQ9lR
         CkLez/LMZq+usBV+eYiuJoYDPBzunqATkMrTqjEbD4w2hy4Id1FTDjR4UJekLsl4pAXl
         kMXQ0MdgztEvp/VJS+CvNFCTw93dA2UVIeaUs7u1wza3JI8zLQo1TKfip9O+cqLyHNcl
         XJrCqqcmZfklvYjJqX019drzcOegJB/KxI4/aKjE9k/J5+pEFS83zdc1yM0rYioe0Q6t
         uDmnuPEB2O9G1jzi3e/BVLd/mWj6JWNMvKBAW9OC1MhloB3SBAliI4s1WAJ62ZbRm2s3
         mLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040399; x=1738645199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaBtUmcc8yUuB4kb43/yPbo3SeenY+DY+wt99rutmtE=;
        b=VC1PuPy48I3jMTSOkWRVPnQlJOoq8pd8xlLGd3ibS+jrABUOI1Cqdl73Lo0RondeZu
         uFAUbwRhPjjg/cr7kCbNNxPZ+SL79JDOXabNXLWgyjwU3MiCrnExS0vlk/ZEESZr1H4r
         wu0l1amxpvPT4kf0JKCpHTVnrBGMsQdduC2j6Hhy67CJ5q4NuV+mWFU0nJPnZCgVq8h3
         yZb5O58/ZZrQ5M0wsDWlx37mdf7NygpWaDdpkzYlzo626zV3dHq4SX7JugAuGol++5wj
         WEyjC04uT+IIqomj4kN+yx3G6KPkLXhO+eM8AjJ+28Zaw6kI/+KJSdiUdSBBVWwneJrP
         ikyw==
X-Forwarded-Encrypted: i=1; AJvYcCWz9HNuhqFZ2uZQXDjJc6T0UxPA2tu/Mdzk6Lw630buCYKLlzZykTg8cQFpUrfrc3c/qMgLU650ogAdKx4i6DnI@lists.infradead.org
X-Gm-Message-State: AOJu0YyF13Cjj/uiyOOpdIPTKzhu2gjo56fDhqMgiYjhP7vvcN73Rv+O
	Uedj3w31oV4PUTGqfzjNJKXC/BGZSpeN7a5xauwWbwfuKhMgMf8o/XzxAlQEG8M=
X-Gm-Gg: ASbGncv+568GdwgcjJctVh83R8TmqJ7/ZrNPcYxaSHm3cNQ8R3QudtWD4JJAfuF8F7z
	usz2fniZGEiyPytD+QRGVnE+iu0jekrPmx0Vj7nwcofad6wvDTBFibVyhfs67ouO5Dgf49jISJd
	ZcjBfk1HS2aKfeRjAJGtPLfLFO6xKhtOTZWh1vE3gm53WAVlyNv0kNRBLiZTA0CF+LEj+rE9yLw
	mgyzbnwCyHSDEamuDfHMEVzQ+n75ksnpOYNki6jWiRI8VMFesaGbzOGYr7s5vSuLTEMGe2HCOn2
	nBLe/WnhPi91S708+HC2WOcgEC3d
X-Google-Smtp-Source: AGHT+IGvdsN2QjvjEdbxBM8fo2c3ojaIC5oAQTKaWVxAx/Vzcck7YYYeeDIBW3vl6CdvOvXnZUnWVw==
X-Received: by 2002:a17:90b:3a05:b0:2ee:c9b6:4c42 with SMTP id 98e67ed59e1d1-2f782cb68fbmr68628638a91.16.1738040399051;
        Mon, 27 Jan 2025 20:59:59 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.20.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 20:59:58 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:47 -0800
Subject: [PATCH v3 06/21] RISC-V: Add Sscfg extension CSR definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-counter_delegation-v3-6-64894d7e16d5@rivosinc.com>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
In-Reply-To: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
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
 Atish Patra <atishp@rivosinc.com>, Kaiwen Xue <kaiwenx@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_205959_736440_75C9767E 
X-CRM114-Status: GOOD (  11.50  )
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

From: Kaiwen Xue <kaiwenx@rivosinc.com>

This adds the scountinhibit CSR definition and S-mode accessible hpmevent
bits defined by smcdeleg/ssccfg. scountinhibit allows S-mode to start/stop
counters directly from S-mode without invoking SBI calls to M-mode. It is
also used to figure out the counters delegated to S-mode by the M-mode as
well.

Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2ad2d492e6b4..42b7f4f7ec0f 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -224,6 +224,31 @@
 #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+/* HPMEVENT bits. These are accessible in S-mode via Smcdeleg/Ssccfg */
+#ifdef CONFIG_64BIT
+#define HPMEVENT_OF			(_UL(1) << 63)
+#define HPMEVENT_MINH			(_UL(1) << 62)
+#define HPMEVENT_SINH			(_UL(1) << 61)
+#define HPMEVENT_UINH			(_UL(1) << 60)
+#define HPMEVENT_VSINH			(_UL(1) << 59)
+#define HPMEVENT_VUINH			(_UL(1) << 58)
+#else
+#define HPMEVENTH_OF			(_ULL(1) << 31)
+#define HPMEVENTH_MINH			(_ULL(1) << 30)
+#define HPMEVENTH_SINH			(_ULL(1) << 29)
+#define HPMEVENTH_UINH			(_ULL(1) << 28)
+#define HPMEVENTH_VSINH			(_ULL(1) << 27)
+#define HPMEVENTH_VUINH			(_ULL(1) << 26)
+
+#define HPMEVENT_OF			(HPMEVENTH_OF << 32)
+#define HPMEVENT_MINH			(HPMEVENTH_MINH << 32)
+#define HPMEVENT_SINH			(HPMEVENTH_SINH << 32)
+#define HPMEVENT_UINH			(HPMEVENTH_UINH << 32)
+#define HPMEVENT_VSINH			(HPMEVENTH_VSINH << 32)
+#define HPMEVENT_VUINH			(HPMEVENTH_VUINH << 32)
+#endif
+
+#define SISELECT_SSCCFG_BASE		0x40
 
 /* mseccfg bits */
 #define MSECCFG_PMM			ENVCFG_PMM
@@ -305,6 +330,7 @@
 #define CSR_SCOUNTEREN		0x106
 #define CSR_SENVCFG		0x10a
 #define CSR_SSTATEEN0		0x10c
+#define CSR_SCOUNTINHIBIT	0x120
 #define CSR_SSCRATCH		0x140
 #define CSR_SEPC		0x141
 #define CSR_SCAUSE		0x142

-- 
2.34.1


