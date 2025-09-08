Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552B0CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OljeesxWIp9jDHv6jz9r0EeqTIgS1JKVuBa2eUtHLpE=; b=XXhgTX1ZpDvF+b+AkXitMpspGK
	jOUQ+UQ/1tvyZ0ovbSXBY8nZmyBsgZ4UGJ29U8x1rokK6E9R0mLEjx8ifEiBOWg3BBSBwSD7iWDsZ
	bwGdaujq+BS0M8XkpQzQC4DFMe8jMZa+8GwJeSoE1VUpoSZYjVGBPml/xZVKbLFtHMSWltFwyxkb7
	ECjrymWAIh7saeU1PHYBhC4+Wt6yObCcKy52nwANOSjnDsrHgqopQzsoWx0QdUq3LDe6Lhct7by1u
	DsA88A+gQleqLqOGxOEXK5b9f7R7n4Tzw7ajEful7Clx+07B8GEooEhL774GWCrzjVfKXA5+2SRSK
	AwaYP6Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlfb-000000034ka-3E8e;
	Mon, 08 Sep 2025 23:53:11 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgSO-00000001U67-0VsU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 18:19:13 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2518a38e7e4so25018255ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 11:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757355551; x=1757960351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OljeesxWIp9jDHv6jz9r0EeqTIgS1JKVuBa2eUtHLpE=;
        b=HYUA2YrAaSISmkFEgUocu+kzn/LEq1pIJziu0bI0v9ImoUuxdP+jzOW2MdGuXjbH+X
         GEfF3qn4l8cXfrP/9A86nk5S/61CXUw4BOGG7eGBnxcsvctWvi9nQzHCjSgt/micrA13
         gqqkwtuOp/wis7RFUuW/QpbjZw08ElicyI36lVc8KbYZX7um6km+k817+8bdllNXDGzR
         x16s5KLgpsuORW9YlwguOnf5GsvlXmkQrkruy1hglqUSxsO6srGyyFk3hcY+gV+zqGo/
         FJxfaJ4Dm/3WDxim5i3klnGrhSZH1je2xSMykd4H61bZqSwIzs0PsZK2PfRX/nKAVJcv
         LNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757355551; x=1757960351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OljeesxWIp9jDHv6jz9r0EeqTIgS1JKVuBa2eUtHLpE=;
        b=AezWniobBe4JDS4+ZOHUd1BggmkIG02y8Iu/Tb4Wn1nPshjAWc+C3wzHebDXkXYV+I
         lbO5pdYbcnUPKTyuOcsmDHtLXS9NdYBtgf3ukvdb/oPa+Bhg461nGEPsVpcBBi+k7x5J
         njZy5YLQjj+63jCY8Kdz7zIkP8gCcs8wrub6wHKptTfV2AMLiYxN5vck90OkrH0qd1un
         Ym3qJaunPOinMyS3e/6zDpK6DOoxRLXVL4H84/kVOtsrtaZzoKxpEi2hiiWo1Oz48QHJ
         JEJxJAFKPU1+JtxkAV96nhN6yJetv4QlMc8JC1q3EMM3BOEM6u6l49Uak1X0mxsbpQQ0
         g5DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvObZyiLkluSQhELwpkxCuZWnWiChYkQOOdE+GYe6P17Ao1e93oM2dos5yV19AbJQvT/9MeG2muG03v65Yqat2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9wMe2xIPODZok8ZJ7N8FNfezXqXbwwChW+yi6P12G3yn8+u9w
	9b30j+3wqmcvc2U9qY19vPQJimdHM8Eq/4v0ZP8ukkMbx/HwSBydvf0EyVF3/zofoPQ=
X-Gm-Gg: ASbGncse3NbKO4Zr87dn6OGXr3i1mR4CQtvcBFLkOD+y4BakZ5mDjf/fll2hUs1yKKO
	DgWHyd0ACO6ocWCFm9U8Jc3k5dqEecegE2uG9Cw6sdjc3IjVYYtwnFI7WVAII04j46ZjeWpJJA0
	ZoKsaH63NaaBW69f1AX1hG0unrzt36gKKr6DRX9hymscoHpfEZ37bXc1zBJPJW/52yZ5L3Vg0UK
	YBRgdxgNAtAZCpNDoN6Jo922UutXPgeN/mWI/WRYxRWCLxz+0EsVoWUg3tl5js66sxtPzWHByJW
	YE0CEyAmrTXy323s1yhO9w631Hh7OZMpFzVa3IMJyo1Q9pTeCeO96zR85AmHtk9xIis9T14FnYV
	lOsLkiafAFsTRa9fbW+9xPfA4
X-Google-Smtp-Source: AGHT+IHobZOnXIMkvuSbjqGZcdW0FzEx8+rn30MylSnC+vt7QbpZ58d6DFDptlwzGDiTrysTelEV2w==
X-Received: by 2002:a17:902:e811:b0:244:5bbe:acdd with SMTP id d9443c01a7336-25179f34dc0mr105646145ad.27.1757355551317;
        Mon, 08 Sep 2025 11:19:11 -0700 (PDT)
Received: from cleger.eu.int ([2001:41d0:420:f300::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccd763948sm117012755ad.118.2025.09.08.11.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 11:19:10 -0700 (PDT)
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
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v7 1/5] riscv: add SBI SSE extension definitions
Date: Mon,  8 Sep 2025 18:17:03 +0000
Message-ID: <20250908181717.1997461-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908181717.1997461-1-cleger@rivosinc.com>
References: <20250908181717.1997461-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_111912_162438_BE0A0106 
X-CRM114-Status: GOOD (  10.72  )
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
index 341e74238aa0..874cc1d7603a 100644
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
+	SBI_SSE_EVENT_INJECT,
+	SBI_SSE_HART_UNMASK,
+	SBI_SSE_HART_MASK,
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


