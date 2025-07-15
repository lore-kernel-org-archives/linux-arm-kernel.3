Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E41CC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRwyOgWeUUf4xzQUl6yQwVpNHXqT8Es+y3tNlmZTS9I=; b=vvzLVcoxnHcbTWLqtyMzi/nVUP
	H89J50Eqr2IBKiCJWu3PNa49y0O1sZSKfkMHdugk8LenqCA6BP6dCLVgcvCzMInXIf4X/BXQlRZw5
	lsvLarWfDAy9HV8wmPx34oMOHhfyY1Mqxnw1T/jzw6cx6fjiWvF8JjnH8JgNefaQS4BMIAOAt9wcT
	YhworAAsgFoJxiR36giDZqG0miyVgMGIVOTLdENeBv85GhNDNOGWC9OGf19XL6rtYrLmShiVOJiqh
	Oc+5b3z0o+BTlUUYnf2UMdfSSg6cITb1a9L3wuTAAoaIZjgcJgnhdflT+4ZnF3dMV5c41rIigLJgm
	FtOWEWZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl7O-00000005yho-2I2T;
	Tue, 15 Jul 2025 19:15:10 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubi7m-00000005gef-1QSv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 16:03:23 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-749068b9b63so3850699b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 09:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752595399; x=1753200199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRwyOgWeUUf4xzQUl6yQwVpNHXqT8Es+y3tNlmZTS9I=;
        b=NpEIpsmd9My1Ci3ZRQDPitFftcjVgc3jubm7kd7kddyCbQPXeHAPdEbb9MaB4NZBxw
         Gtt2bIlQ0JA1L0nXR1Fg7r5DFFIA1R6ZT61+p0giSu21wJMcHWzvkymD3SCvc8B9O/Y9
         yJCwlofVntXfz+rF2nHjgaIQ9tUAk59YHl1o1kJ+DEJExbFItzOTOGK4bRqRewz5ddN4
         MaJGYP8fwazSrMjxMj1nzhgVL1+DPj+Pga2ZDkwHUNgfp8JfXOBJMGqXK2mijGaaoZPh
         2ftrTuzneIsbB7idOBdcwsqBamdpMzHi3ts0cNTxz2WB7atXEyAFPsJjrBsKVu0YLKFv
         ojkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752595399; x=1753200199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRwyOgWeUUf4xzQUl6yQwVpNHXqT8Es+y3tNlmZTS9I=;
        b=Us1+Nrfi6MWmCrQ8bdG3SyCz+BfvPHYMw7Fw3K1v9TXKlqWIVbw8nG2ZyVCRl/qWd0
         w1ePKdiaho9HiHGgKAjDZxCw00c6XXIhdJNECnjNCFMbwLbF8dI78gep/JxZ5HuVFpKS
         89APf4h3cdhhp/sBiMfMBT3Tp+6jCHuhOHL/0ljaonskGz5C7KHUA9xlUoTxbbaiGqbH
         A+P0nmOyvGkOX11cudrhKD8EHeOf5FrPEdlwi/Nw7CRFUpldWnC9FvigaIQqLa5BDJPI
         T/XNpPCHBfHFTPyfYIjG1O1pgBnl8/WMCcNiWfYfxdajSsKNe/7Z5YOfQoqZd3nbYCVu
         OGYA==
X-Forwarded-Encrypted: i=1; AJvYcCUP8DhjAJTVSmLv48SpBkiRb6j+l2rb3HhW+vrN9CGTnZA2fTfobiKJAid/Wo+2ka0HeVRjs9vuY9tYZPLujYfd@lists.infradead.org
X-Gm-Message-State: AOJu0YxV7Ar/TlVXhd4WdD/U12p5qCYNnABYxiEC50TqsUSXmCCLAkTk
	15Xw8rSSVcDtD7FC38cuyYTObinEaClLGtdzcSIaPIbZi3hZtsCByrlx+7FhKm8FzZI=
X-Gm-Gg: ASbGncsLccxGoMK+Corx1mSNpH15WRKHlJ34efo1G59Nj01DT7QcKcB8mA8/m+Q4fb5
	NzQ4U0W9kltXHKSuGEDRXZzgwzlKLkvwDzvzkFmooi7zWTwpiY/U/DiXWdHan2PI/Qim8I140hV
	+0f2IJydFYOVIaKu8eenDre7B9gVrwimMgk13dEdnSYRui3G3USfubFVNyYPI1W19LmZpwkP6En
	RYJJeoXuXAup6yxXEsm1p+OMd5O7QYfp/g7we/miw8+to5RAaU35qPq8JvsfBrbV73VCqGblUBg
	Rc1N52khLFLLZZyBRFB1VOTIXgFxLdFtQwQTjeGV7s/U7gNlF3F6kY1ZDcEBDgkEP8HWZfDLufw
	Z32o=
X-Google-Smtp-Source: AGHT+IGvzjaplpjHHcySeWxi/fySPbOh8CHoZuQqs8pJ8fFzORsjPFHbBuFq87mnlR1ZNPoONlGm1A==
X-Received: by 2002:a05:6a00:218a:b0:742:a82b:abeb with SMTP id d2e1a72fcca58-74f1beec959mr22574622b3a.2.1752595399392;
        Tue, 15 Jul 2025 09:03:19 -0700 (PDT)
Received: from cleger.eu.int ([2001:41d0:420:f300::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f856fdsm12546532b3a.144.2025.07.15.09.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 09:03:18 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH v5 1/5] riscv: add SBI SSE extension definitions
Date: Tue, 15 Jul 2025 16:02:29 +0000
Message-ID: <20250715160234.454848-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715160234.454848-1-cleger@rivosinc.com>
References: <20250715160234.454848-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_090322_544133_026886F9 
X-CRM114-Status: GOOD (  10.74  )
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

Add needed definitions for SBI Supervisor Software Events extension [1].
This extension enables the SBI to inject events into supervisor software
much like ARM SDEI.

[1] https://lists.riscv.org/g/tech-prs/message/515

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 341e74238aa0..e4993fb664d2 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -36,6 +36,7 @@ enum sbi_ext_id {
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
 	SBI_EXT_FWFT = 0x46574654,
+	SBI_EXT_SSE = 0x535345,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -430,6 +431,66 @@ enum sbi_fwft_feature_t {
 
 #define SBI_FWFT_SET_FLAG_LOCK			BIT(0)
 
+enum sbi_ext_sse_fid {
+	SBI_SSE_EVENT_ATTR_READ = 0,
+	SBI_SSE_EVENT_ATTR_WRITE,
+	SBI_SSE_EVENT_REGISTER,
+	SBI_SSE_EVENT_UNREGISTER,
+	SBI_SSE_EVENT_ENABLE,
+	SBI_SSE_EVENT_DISABLE,
+	SBI_SSE_EVENT_COMPLETE,
+	SBI_SSE_EVENT_SIGNAL,
+	SBI_SSE_EVENT_HART_UNMASK,
+	SBI_SSE_EVENT_HART_MASK,
+};
+
+enum sbi_sse_state {
+	SBI_SSE_STATE_UNUSED     = 0,
+	SBI_SSE_STATE_REGISTERED = 1,
+	SBI_SSE_STATE_ENABLED    = 2,
+	SBI_SSE_STATE_RUNNING    = 3,
+};
+
+/* SBI SSE Event Attributes. */
+enum sbi_sse_attr_id {
+	SBI_SSE_ATTR_STATUS		= 0x00000000,
+	SBI_SSE_ATTR_PRIO		= 0x00000001,
+	SBI_SSE_ATTR_CONFIG		= 0x00000002,
+	SBI_SSE_ATTR_PREFERRED_HART	= 0x00000003,
+	SBI_SSE_ATTR_ENTRY_PC		= 0x00000004,
+	SBI_SSE_ATTR_ENTRY_ARG		= 0x00000005,
+	SBI_SSE_ATTR_INTERRUPTED_SEPC	= 0x00000006,
+	SBI_SSE_ATTR_INTERRUPTED_FLAGS	= 0x00000007,
+	SBI_SSE_ATTR_INTERRUPTED_A6	= 0x00000008,
+	SBI_SSE_ATTR_INTERRUPTED_A7	= 0x00000009,
+
+	SBI_SSE_ATTR_MAX		= 0x0000000A
+};
+
+#define SBI_SSE_ATTR_STATUS_STATE_OFFSET	0
+#define SBI_SSE_ATTR_STATUS_STATE_MASK		0x3
+#define SBI_SSE_ATTR_STATUS_PENDING_OFFSET	2
+#define SBI_SSE_ATTR_STATUS_INJECT_OFFSET	3
+
+#define SBI_SSE_ATTR_CONFIG_ONESHOT	BIT(0)
+
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP	BIT(0)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE	BIT(1)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV	BIT(2)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP	BIT(3)
+
+#define SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS	0x00000000
+#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP		0x00000001
+#define SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS	0x00008000
+#define SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW	0x00010000
+#define SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS	0x00100000
+#define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
+#define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED	0xffff0000
+#define SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED	0xffff8000
+
+#define SBI_SSE_EVENT_PLATFORM		BIT(14)
+#define SBI_SSE_EVENT_GLOBAL		BIT(15)
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
-- 
2.43.0


