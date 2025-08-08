Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FA9C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 15:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRwyOgWeUUf4xzQUl6yQwVpNHXqT8Es+y3tNlmZTS9I=; b=f4hEMjg6FjLisJLSpEN6yLt1WR
	GTv/nCGcy9qevpRuZKxc86tyBDEwLKljIPBN6Jf0Q7lcuFSNMQlYBv2IgAf+lbJlvKUDLs31/DDID
	KWVEV6IAU4p14Gf780OR5reYgJSC/7qeaVC5JZhSyxqWK7DcXDDbwyABmug1oZolyJE8iqWcIohqT
	xAwg/oh7WjRhhrVqJMtENFaa2z0A/2KH8QptNAqthiWJH4yIun9110Ju25Y6VXou+tokpanIFN5ez
	iHNjMwX0w3BeAJlOwVtbUOO3bVlJ3DZi3umHhTvPUOulIXJ3rHcff2RMMWVC7EwMXUDNn75Shs3ee
	jO8DHzXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPGo-00000003D92-0xxY;
	Fri, 08 Aug 2025 15:44:38 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPBm-00000003CT9-2CWG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 15:39:27 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-31f3fe66ebaso2855023a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 08:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1754667566; x=1755272366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRwyOgWeUUf4xzQUl6yQwVpNHXqT8Es+y3tNlmZTS9I=;
        b=K0pS30noXcdpadB+LVDLk6wLTyaU+G4eq1zah4k/+3uGDBbpxwEmzag/mliiBvqPv9
         dPwuxbA8otlT1GZf1bKRYZ5zl+0/py09SlAL/zBsa1sYPse1wbakSZE/gvHUWgCk2GbP
         8+jBjuB4D1/ozYNQuembdGeh3Zo4Y2B+ccYh1youR0V+e1Ks+CXpj9WAQOdDTkBii2IX
         FNA52GUsGQCZceAktQoXI5u+QAvXNimgHkwq0Xf+wGYmoyEyy1MJ108itvGHxsWZ0V0S
         hFAEcHq2yFxW6e4Bx45kk7oihD4/p/466TVBLGlQzRNtgYVVTECU6qVDsaBBQLxVtn5q
         UwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754667566; x=1755272366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRwyOgWeUUf4xzQUl6yQwVpNHXqT8Es+y3tNlmZTS9I=;
        b=cWIZbRmXArC8PK/WFoGtG2B/i67XEauDIghpLCM0hjW+mIIllkUsnabX6mBOWbza4W
         drjpVdq4nAGIfGIY4vsbDUcDocn+022MGL9JWyHjmcRTIiS1NLQ9wQu8rUE/fDj//a82
         lTInA4TiTy0qa58kDDELvCNfeOpDlzleqrjRmI6sZDeexw2i91VFcKFmDzSffgTNmeV7
         qHV4fZYvZBODSU+Rhc2NOm0GPbFop2zahHyOQ81JSQVNERoJ7fQW9LqPETFJcZNjF4sV
         tvwq1z+G8bjvGdxqT9FMGRATTT4N8v1scxhm33o2VJE6Nrl3qoljMvdyOEFMtxpX5JKT
         3e/A==
X-Forwarded-Encrypted: i=1; AJvYcCXN5ejP2ebPxl9zF63UFecQMMLn2J6aq/9yisW9Xqg9q3QbPKaEx/DQnKBw020Gq69jkU1OhB5WVqQ7vjAGWGRK@lists.infradead.org
X-Gm-Message-State: AOJu0YxSCbiL9iosWBiNmKLKNvr1nOuEVGVRb/WsyTIXuWRHQfjxEsd1
	2y0t9VL+KScsR2ase8aNCXVM3n5R2iXkEvqiVdiZKOJDZFJJ0BSTMygc76gb7aW4ypTCr8n+7Wg
	E01I0
X-Gm-Gg: ASbGncunzCL/f3Ysbexkv8Zo6PKeYQNjPDQ1LhvAZeiSE1eX9vCAiqY7gY0BE+F3oLU
	rw3kl4J83PB6kLFE7Oil2P9qD2msde4/LOJbqBZmT1HfugCYqPayIPiZv4cwujbUz3Bk+Oe+eO0
	u46VgLNlIlH+b8s5T49FmfX0ZPsvrgUDlWQqmGwLuZWfcidWuluIWkwqp1ueDkzV9sPtVRiS7Gu
	PyAgrJimrOPmwBn/UDxgmrunFiZnrxtHBT9TcWIS8NN0QRm9rmQys3kpuS1/x657upd6524m8lw
	2pLNjMJdkgdTxGN+8+75CpTS7yen7OVRLq/FgmgrmvE0ftSTf4CGKcuPK4NcoCUttrwWljy3tTs
	rZyE=
X-Google-Smtp-Source: AGHT+IEMeucseF/gpbdWW57tdD6DURYLC5rMNYgTyXb7nxmDdDLc/tCzgk2uslWhC5YtHa2cc8w4rg==
X-Received: by 2002:a17:90a:dfc7:b0:313:aefa:b08 with SMTP id 98e67ed59e1d1-3218465337dmr4414853a91.16.1754667565153;
        Fri, 08 Aug 2025 08:39:25 -0700 (PDT)
Received: from cleger.eu.int ([2001:41d0:420:f300::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3218c3c2d58sm1135971a91.16.2025.08.08.08.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 08:39:24 -0700 (PDT)
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
Subject: [PATCH v6 1/5] riscv: add SBI SSE extension definitions
Date: Fri,  8 Aug 2025 15:38:52 +0000
Message-ID: <20250808153901.2477005-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250808153901.2477005-1-cleger@rivosinc.com>
References: <20250808153901.2477005-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_083926_577727_66357439 
X-CRM114-Status: GOOD (  10.56  )
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


