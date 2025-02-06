Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD161C02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 07:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1ycQPnopfj+lIzIUm/dRgw4jBMxR4nO8n6QcQamF/g=; b=X5FB8ufnQC9ti3pvJ8w47/UE/i
	WeGPnXQSK4GR7m1QIt+n9v+EWpfihdMkNsrE+leonpS+BYvKIFm4AwaxJmYKtrjPiOVcbQm9Cf2Tp
	ma4JJlcf0Ntbss1wT8EYhwn8bNgnbunNsv9HN2KLSeHa70m3MKTvzrOjXMA8qEBgiRrum/y4xyL31
	GCHLcLIygkUFBpNDRUtM0VG2p8kHK9DIvS4nylDiU+3CIQTwv6+HPaltOn7ENFRs1zAvG1tYS+F92
	m5ih1vhA3OSx7DKdEtwOIk6R0C3nstm1h5j1iU8kUO6YKbyrxsKr511NpPl41tYKVBQfK7uu9SD9S
	HuuGcNVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwP5-00000005bc1-3fgW;
	Thu, 06 Feb 2025 07:34:27 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwET-00000005Y43-1RVr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:31 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2f833af7a09so772989a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 23:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826608; x=1739431408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1ycQPnopfj+lIzIUm/dRgw4jBMxR4nO8n6QcQamF/g=;
        b=mc8nAo9wWTvAIrckkmuOi+IXMoJhEiibAQyZjYJoho6IZMGWj+Prf9BI+UKf2qor0f
         ow2WL48/Bm9ATkQ5X46f0yLXKN96Xw5SWP9qmiqpMHYR7PuLansLe0Jl3T1DiYrXRS+E
         zQQQ9a1znYwI3CV+M0xhQXvMYCl6jj8pwKlIaf/cMVfk8CWtWlZSHnz3UT8kZDGxfzg2
         fSEoGu6FIvouCGSn2LDhZ1OzJzOV7R1SCdh2bxbGM1Q8yjOZGB8KE366GZSHTTJIrhgN
         UnqRgPasjWkApz14rXu0M9ffUaEsVoWpWjCxeZ4NGlkuoyxpvj49gOuIleLpnKUkFRln
         BByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826608; x=1739431408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1ycQPnopfj+lIzIUm/dRgw4jBMxR4nO8n6QcQamF/g=;
        b=CgF3BIKA2ZUkbBFO97MSc2uMOTypA8woRXuz53YE6etktyIJ5K9ioJYxUEuKbJw4C4
         z+Hk/o+kTaRCjekqd1P+6N/dK8Yvhs36ZXM85SsHlENyvlwbBX+G+IHkr1cjK1JBMQY9
         9u+nXU6mOYv0XqrIVn+kcwL98DDAmCTpuSF7FyUZwd/Dp1WY6f7W6ne/XAlg6VGXf3YJ
         dfw6wVJPxEwJsE/p6V55VZBOoGc16kpmTk8n9cwljNElZgW+6SgMnoe8bWvFB+oSr540
         A4bYkCCeZcJeVGL/WHzrgQyL2S/LhyuA2Uada7klrn5flmu2KxuWHoLjK18h/ufBamfL
         fA8A==
X-Forwarded-Encrypted: i=1; AJvYcCVJ6cqy6rLewuU84u7nUT1K/AMkSBshwEzaNMmLrsIBcBo/yO3HjBBv/NaSC7F5Eu4Gc457Xe7FoiqGayC9pMCa@lists.infradead.org
X-Gm-Message-State: AOJu0YyAKOJc7B48WXPVXxt5HMfDKNNe5UiYwewzmbpQXYCwsrguao5W
	j4LbkfF19xQfTrV4k6+QFZviXiMbeeK/NDqYcVckI35s8I6r8gzIIMAFVaICQpI=
X-Gm-Gg: ASbGncuXHbuekv97KgnsAx+CqCS8wms1Er4rvzkwC0I2MegsWJwVULuvdl0OXvhAiYB
	r2YL732EE7xhcj0aEALY2TdGnvovQ82s1sfVs1rTQGlwt49ZQ8IlfgRrbaW1fKSEz4cXDKBkGGk
	PpafjOZc4OAfTfnjFSuzFOIhUePHXMIXnSBMagQwY6dEua4IQqQS6JF7yH6htKIfa98+kb96nQc
	unlsYeGtKw6CW1w/kFj8WYOpnMMEvrUBoPLn1JAjw/WFg/fvVVoo4TPOqxko8E9F9JZNRzLcoLB
	vPozBJsvhRjvbsnGM+4XVPeNBlCQ
X-Google-Smtp-Source: AGHT+IFwe864GICHNnq9EVCYpLvbwfcMr9HibfAj+2D5yDDYG7ZeHAVPjVfRo7yQfH146FLB/di+WQ==
X-Received: by 2002:a17:90b:1d87:b0:2ee:edae:780 with SMTP id 98e67ed59e1d1-2f9e0793401mr10185856a91.15.1738826608431;
        Wed, 05 Feb 2025 23:23:28 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:28 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:13 -0800
Subject: [PATCH v4 08/21] RISC-V: Add Sscfg extension CSR definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-counter_delegation-v4-8-835cfa88e3b1@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250205_232329_408109_B62B502B 
X-CRM114-Status: GOOD (  11.09  )
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
2.43.0


