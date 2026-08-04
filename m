Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB192C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 23:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCVhMTFo9ZCIqfgdJ+B+IzrzbBtMPPk2WY1IBkcWtfU=; b=MOLmvRkn76DmfIOoKok6eOUN7T
	vR5G1dhdirZTuqJpKA3u8MTHfeNtuI20toMO9bsIP/AI3AEVYNy/tRwd23e4tEAQbS58CJJ5aKzt1
	OMNGebZzdnRZKxnGuvGHNse25K7rM0Ns9MubiFM4+oHQbFZfNqhJifxdFEvxBmlW2bsY3+jihyiM6
	wCD7QtXu1GgNFmDC6om5Pmlt3XLZ9GTvYc6wmdnqPzcmU17RGYbLcDBJM/y7xH8Si9UC1wq16/tWX
	SjhSOJQiffSGeyV0GValyOvIO3H1IHANeV3AvQv2JeGTl2/G4VLyJ3KA+tqnkEAe8gzjn8D50fGNv
	DhVJx5DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrP20-00000002whY-4AIs;
	Tue, 04 Aug 2026 23:58:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrP1z-00000002whM-3TTx;
	Tue, 04 Aug 2026 23:58:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C585C60A6A;
	Tue,  4 Aug 2026 23:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148E71F00A3D;
	Tue,  4 Aug 2026 23:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785887926;
	bh=SCVhMTFo9ZCIqfgdJ+B+IzrzbBtMPPk2WY1IBkcWtfU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=YYTk4rkz3f7zh1LLjCQt/arT1XMQFHNw7GR48lndg5vQnIHUmlmY67d4Sb/sAS4/W
	 3p9tfajAwvLR0QA0eWoDDnrwf3ePfa7+L2BfxW7sTZkk+C24aOVlrK1Omj7mrmzJdR
	 FV/Zc0wELT/GHKmADlbsFMp2mJqVz8e9cvFznhVwBmAlY5Arg+k1IbvOiseciPyniw
	 hqAgkMaKkGOA57swioeIJn+Jw1Ry4jviHHhIYnXHSAFZoy4FP80l1qh7bu1AGIP6bz
	 yrCSOeOuA1kjpoEpN5gIOAKMZvmJRCl5Zyma67IsfXPYEvJFHYh4+mHISvWs0kYhW1
	 c3Iz2QL6JSM5g==
Date: Tue, 4 Aug 2026 17:58:34 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Atish Patra <atish.patra@linux.dev>
cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
    Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
    Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v8 03/22] RISC-V: Add Sxcsrind ISA extension definition
 and parsing
In-Reply-To: <20260701-counter_delegation-v8-3-7909f863a645@meta.com>
Message-ID: <f488451d-a8bf-f6d4-3f34-c820a0171019@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-3-7909f863a645@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 1 Jul 2026, Atish Patra wrote:

> From: Atish Patra <atishp@rivosinc.com>
> 
> The S[m|s]csrind extension extends the indirect CSR access mechanism
> defined in Smaia/Ssaia extensions.
> 
> This patch just enables the definition and parsing.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Thanks, Similarly to my comments on patch 2, the following is what's been 
queued for v7.3.


- Paul


From: Atish Patra <atishp@rivosinc.com>

RISC-V: Add Smcsrind and Sscsrind ISA extension definition and parsing

The S[m|s]csrind extensions extend the indirect CSR access mechanism
defined in Smaia/Ssaia extensions.

This patch just enables the definition and parsing.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Link: https://patch.msgid.link/20260701-counter_delegation-v8-3-7909f863a645@meta.com
[pjw@kernel.org: use official RISC-V extension names in the patch description]
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/include/asm/hwcap.h | 4 ++++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 7ef8e5f55c8d..d4a7b90e2d78 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -112,6 +112,8 @@
 #define RISCV_ISA_EXT_ZCLSD		103
 #define RISCV_ISA_EXT_ZICFILP		104
 #define RISCV_ISA_EXT_ZICFISS		105
+#define RISCV_ISA_EXT_SSCSRIND		106
+#define RISCV_ISA_EXT_SMCSRIND		107
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -121,9 +123,11 @@
 #ifdef CONFIG_RISCV_M_MODE
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
+#define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SMCSRIND
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
+#define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SSCSRIND
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f46aa5602d74..3fa0a563fb21 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -576,11 +576,13 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvksg, riscv_zvksg_bundled_exts, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvkt, RISCV_ISA_EXT_ZVKT, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
+	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
-- 
2.53.0


