Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20EDC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 20:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JOQ8WwmCbSnRqnzBomZTQ9W38PHSEAGnjY39LhZEAM=; b=x20/FZJ2Iq5M9XEWO8GSBcNFXZ
	msgAhpbRDXrBK/AVerTE3HkIZH/uFaGW4GXvccb6e5EAR0tqwKKd1FIMdU0rpqF5K5eEd/p6lRFQN
	Nyv5yg2/YsHHzxt5rI8+hyIlY5caRJCMwJUJVHPXGVZ7fieZZVFAc46oDBJ0YHFDhOBtutaxWwLzp
	T71QZ0oewhJUs7rYQt8trZnYuL7BtcSkjakGOH7EYr7Vw/Dpn0M8dpgYgnJqCneHjQ76bsxGThtVW
	dEI3vVx2EORzH1bimuirpRcavv0leA2YzH4K9ssDu+Vz1r68VFITCNmBIUwL8Msd359n4SCcV39PU
	VJHK6qIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtdU-0000000BwjZ-0IeT;
	Thu, 27 Mar 2025 20:15:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1a-0000000BpYA-0XLR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:25 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-227d6b530d8so28999775ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 12:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104181; x=1743708981; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JOQ8WwmCbSnRqnzBomZTQ9W38PHSEAGnjY39LhZEAM=;
        b=YWpowb+K2+o/3BdF5UE0LL+9EPD4KwPAvS+9R3IgGHrCIHmB5YG9irZ/6nxZF5Umlo
         x/1Q6BZBouEIE3CxMemr9Se8WmHKpB1v6X3VtscPDv50877jWlGP6jyibFvkTUDthuTd
         lBSTsmdfPJ/BtX6RIwBxei28lq9SEQLJ3mn4SL8gAjVtcIOCnSV0T8zIZh4L+XQRmjH8
         Mvn6Wf+3VXwXQeg3gdUr+miiSoqf2m/LE9p/VHjPKzjYxmXevIQnQV3/eIm19E61ShQ8
         Mb/Z3iZBtdOpvtxXvvDVpcXYRdNyvIKjN+o0IA76PE/mHO5rqbA61cB5UsrSD6p6oGHR
         bqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104181; x=1743708981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JOQ8WwmCbSnRqnzBomZTQ9W38PHSEAGnjY39LhZEAM=;
        b=YI0AGYjFaqNz19KdIDmQwX5zbwSPOOwfJSIkEFcY5uWPZ258Pz6AWw7lE7DJRtEMVI
         sm//4V/cmVaXfH69iOG0cV7XPjfjcoPCmNcUPEEDES70BijfGjs4ht9WMesRi6Zx3BTT
         p+GNqSycMBWjA8/ItJI/tbQTeHuyxFs6S6ENn1rAHDwbeSqse362SlePGxjBeSZm2BTY
         XJwUMtU7fe2EnanTBklhHpyOCqc/LxY/KnOSgACGYcg+mVYiAGo4VbmM2KtjnBsCuby+
         EehkF7OTTnbH6+7mZnBDZ+ONZ58SId2ETHMxWaU39zEELAFLTUqTrSgCrtdWCTrGIsEy
         mQWA==
X-Forwarded-Encrypted: i=1; AJvYcCWgwxA005LccD3DW2RPgO/rDu5Oq++SJS8qvRw8ekyqk8/3Myb/7QFpOtYpp5BXd6rC0GRZw7o1V0miaWgQSVTx@lists.infradead.org
X-Gm-Message-State: AOJu0Yztd1aIXLGHMEqPacCq+xlCDd72qriCJF3YTj9oJWH1r+SWZUrY
	lgaEhK9Nq0DIepTyCHYKTBA6abvTxYqUU73JEcjpAn5uDeObkQxm1WpV2xvmBhU=
X-Gm-Gg: ASbGncuM6bblYuqDBIVtIa3tN5GgZ9ehpZbFEoLy00CNOCs5yT/BSGxtBUSazOWZXt4
	BiieeCoVJxj7oJaF1Wd6fKiG0Gf9qyVS/u0/4JjUa4hi42BLHR0rq3ZMrTT6q+bsYtNnogsRG1p
	c1uKOQSyrm0D4G5KzXUoJOCSvK7phnF+rnS14nfWCiq5R7pGSIiXxe11aTaL2boG1XhqDDvJA8s
	SsAVtU4qCRALPTDBqBFCC0qe42d1mk8EcBIdlZBCPzEMSIyjNQbQmx8SfvFRuOL64O3bsvY+DRk
	GcCxS03gsjIYHszq+HOczIvMCMWXXP7fpdWenz36jQQb/R4RLOS3AWhaiBnvC3KCnSK4
X-Google-Smtp-Source: AGHT+IFSLJpOO+uUPIXxxR4PWavcDhvMZFlKhYeaacVfbM6bFNGqTFcN8T3TvSAfTzPEFeN7iSGrUA==
X-Received: by 2002:a17:903:11c7:b0:215:4a4e:9262 with SMTP id d9443c01a7336-2280481d0b6mr52437215ad.8.1743104181444;
        Thu, 27 Mar 2025 12:36:21 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:21 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:47 -0700
Subject: [PATCH v5 06/21] RISC-V: Add Smcntrpmf extension parsing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250327-counter_delegation-v5-6-1ee538468d1b@rivosinc.com>
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
 Atish Patra <atishp@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123622_170299_8B587CE8 
X-CRM114-Status: GOOD (  11.92  )
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

Smcntrpmf extension allows M-mode to enable privilege mode filtering
for cycle/instret counters. However, the cyclecfg/instretcfg CSRs are
only available only in Ssccfg only Smcntrpmf is present.

That's why, kernel needs to detect presence of Smcntrpmf extension and
enable privilege mode filtering for cycle/instret counters.

Reviewed-by: Clément Léger <cleger@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 3d6e706fc5b2..b4eddcb57842 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -102,6 +102,7 @@
 #define RISCV_ISA_EXT_SVADU		93
 #define RISCV_ISA_EXT_SSCSRIND		94
 #define RISCV_ISA_EXT_SMCSRIND		95
+#define RISCV_ISA_EXT_SMCNTRPMF         96
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index eddbab038301..e3e40cfe7967 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -394,6 +394,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
 	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),

-- 
2.43.0


