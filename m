Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C33CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 08:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxVWTJdT+SCjk5O8ZmtBkLAMOboy+sCiTeWzaOD3L7c=; b=QwE+OROv3lR2uHhSNn8THiPG4f
	uDzdeM2sY98Z7PoRAO/JDvJ3cA78KDiw3TS2FYkkhawM49/fQFDvRUZOkT7OxeGc790rXh+vNhYb5
	pnZ0AS/MFNF7xuVw+FgwZ9vEd8sYZ3bQBtuykbQpNvwQBWNJ3+FFWSW0p+e6VoQbQOTCH6eAtwtx3
	2gn/vmsnkrBkXndsiqmSnJ5MhS5dCbqnQGpOMhG9wh2iSS17i7wNUnxnulQHKOPgfZl7FItajkIcu
	RZXXrmNcEaClVcPYKNnTMleSPb7pD1xJ9yfCa7hrAlz1PD1ch/ChHpy8MB78+nGAvvOOuFNcTWQ1o
	XnvXiUHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYsz-0000000DHJe-2YuS;
	Wed, 05 Nov 2025 08:28:57 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYsw-0000000DHHy-0wY1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 08:28:56 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2955805b7acso5724165ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 00:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1762331334; x=1762936134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxVWTJdT+SCjk5O8ZmtBkLAMOboy+sCiTeWzaOD3L7c=;
        b=C4pWTgoS+fc/tiFH/FsrmrJhyjQWtDf0sv0sMFixqYIv5fsFQIapUgpQz3Zb8xtWNn
         Cr7Xd2vk3y/VwDlZqtHQaHZ5/PCjgo5W5ZroQlGi9BT8WV9+5OhzJ7IhA4bXx3e+Ai3x
         6eTOoXQn34anNC542qDYS0uQURA9b8apv7Bb4U+U2k8vB8iBX7FABc2FUHR0iev29ahF
         4HmwJTXwT6FnazctN5VOcZTpfbc+FyDC8ckuTn5TrZRbWLGgAs5BKVwif8nl4bSGE0r6
         z30FwpRihDwwNKFlcwSdoYWT/WvHPO9rErVJNtlEiWS4Hv0iRGcTvotDq4Gl1heuViNs
         aryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762331334; x=1762936134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxVWTJdT+SCjk5O8ZmtBkLAMOboy+sCiTeWzaOD3L7c=;
        b=h22EOzXcZEoHc982T2Q4OnoWQUNQM1uoFj+yheGpTtozCF0hsZjy27Q10wavTUOzNp
         Rr18HMZZTdQUwKcIHXURyl2ExGXwagyYwrUga55DfEbnivVRsj/gIeL37Y9yZC06Jgf7
         TpPx59UZdXaobxIvwLLRoFyYj7LlE3HXM/ouAJZQMWLJivIonIG3kXmaK59W0LkwPC6A
         hdqVjFF1TG4lIZSa5IxrG3NYZrlj8Zvs0bcYCSee9SHu7Y/Ku4lVGHudAp+6DLdYhsqF
         amiBtMrfYrlLwZQbd/4RjeQHJNtSsTlnDzR4t4QVyu+zArPC+CUzjCPecXLwZ7GPhYva
         JiFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPNTA/thkQjo0tJt3dcr1sxuiSJwEotIF5ExMS5q4syFZTxibIjU7FWUaMqshS7bZCkHKCjvHJNw7Fl/P5g8av@lists.infradead.org
X-Gm-Message-State: AOJu0YyQJH//QTLA6mjlskHAhSlukqpvx4jDLfSWVDDodqcCcyGfkF8G
	o0vwiUWXvi9YuUi4VbTSoUPKXmZTtAY5FRly6VvOAk2APA6iam7AIepYPYLQ3dw2tpQ=
X-Gm-Gg: ASbGncvEYLcXMIh0QpwTkqXzsKxxdb9Y971LfLtaX79piinl2+08JZgPWENXkkS0J8s
	OxwZ2RcorBHPHQjkKKD65p7z7K5jiXMDXeXBHnioaONN5flscBqTjaEMGOGRHYjPIZZ519llRyI
	uaRsExztRe4e3JIOihkWuz25HfKhjcU6z3FaKaHZdDd1KnUB9HG57qI3bjZf/eApUzwJKdNya+1
	UFIJthQ9KrAiHKJtv1gxoYD52b7aN8N/eXN4eZHHrF9ziBgzBzXiOX7/uzPKQztuHTD36yKO47W
	5sEAnhs4ogie1M73jL3zuYUwwsE6N6M1UuAQ9mZlA/G/xSP4D0z1vlGDoz8AVmHlxmaFpUi+rzX
	nv8AxOot3XUSbf+gV9SwMCSYN12Ddbzi0OuYX4irZbXbjfV0MDeSr89Sh
X-Google-Smtp-Source: AGHT+IGoN1GXGikcvAvUXnBnSY8dbKotW+FyvTG4CG4Bx86TVuBznGgWug72QAB0JjPEWtQzHPyqhw==
X-Received: by 2002:a17:903:2346:b0:269:aba9:ffd7 with SMTP id d9443c01a7336-295f9483fb3mr69028445ad.25.1762331333570;
        Wed, 05 Nov 2025 00:28:53 -0800 (PST)
Received: from cleger.eu.int ([2001:41d0:420:f300::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a741e3sm51870875ad.98.2025.11.05.00.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 00:28:53 -0800 (PST)
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
Subject: [PATCH v8 1/5] riscv: add SBI SSE extension definitions
Date: Wed,  5 Nov 2025 08:26:33 +0000
Message-ID: <20251105082639.342973-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105082639.342973-1-cleger@rivosinc.com>
References: <20251105082639.342973-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_002854_295666_EF9026FC 
X-CRM114-Status: GOOD (  10.33  )
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
index ccc77a89b1e2..0f47e6f03b7e 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -37,6 +37,7 @@ enum sbi_ext_id {
 	SBI_EXT_NACL = 0x4E41434C,
 	SBI_EXT_FWFT = 0x46574654,
 	SBI_EXT_MPXY = 0x4D505859,
+	SBI_EXT_SSE = 0x535345,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -505,6 +506,66 @@ enum sbi_mpxy_rpmi_attribute_id {
 #define SBI_MPXY_CHAN_CAP_SEND_WITHOUT_RESP	BIT(4)
 #define SBI_MPXY_CHAN_CAP_GET_NOTIFICATIONS	BIT(5)
 
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


