Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5C2E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rih2z+q1Taz5W9gbG28kyjqjg/d4/wnIMKspBHeQrDw=; b=a36wCwagh1ZQg3LuQ/dpCA0lGB
	kdS9VZn7pdYECSzta4svrP9/2VRvuIOmw2sHnDKgkBdX2rHgFo3BLx2KF15HnmjiPo8zzJnVcrVV3
	kKoW81MWgPJe5Eqg6Jm+q3utIjSIXKZQO/fObyrenQcDHlIbGd1ptiLcPruaHd6Zst+uBGYzQ6miq
	RCUk8XY2BZ+p9tODyWdp3OA1ImmwNEDGzNdNt0k2ZHhCcOus+26lRxiiLgLZXEclINSO0Z6LHJsFc
	+CPgkQOAThXnGukt8lJPukGxS24aWHDgFhtzBs7lioXCNs+px8UWedMiG04fBpFyPcsEV4mjp+DCi
	2mcP6vYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbOR-00000002CvV-2LEM;
	Fri, 06 Dec 2024 16:41:27 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbEV-00000002AJ8-2f3j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:31:13 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4349e4e252dso23643715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 08:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733502670; x=1734107470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rih2z+q1Taz5W9gbG28kyjqjg/d4/wnIMKspBHeQrDw=;
        b=Vwfq/vCxL3GP+gxRj2MjDxASPYPxR0utpfve16xptAetsKp8kp5BmcssysbHJt4J1C
         7OzgJFzFJiKSIaEqWU40WMN9KOUoLM6/8HSxFsnoPrBcHoXNhfuZNI2Io6/1xDwiVHsp
         H7NOlx5RPupOT3lc8CJXNHIFQWHsaULEsfVxz7FnScvaRHdjt9KaBTbVPvdlP1vbC0MI
         wouDC2JTD88oJazZ9vEXPG5atM30aoh9dWG33W44lOqZgL5ctC0JdXvdZYLVxb/5w/9e
         R5RngJRNhQ8URXk7+XyHH/R7G0IrmTMqIN1/yN9gMmOPYvQNDDjjTSYZ/1+PC3ZAni5P
         oDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502670; x=1734107470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rih2z+q1Taz5W9gbG28kyjqjg/d4/wnIMKspBHeQrDw=;
        b=Ncd081kJ+z9guJsm51rDHYrZ5cPsd7d/s4ulIIHp+/5l/k5h2K1rmf5XRZ1pioPqA3
         VbUYRQecE3Ub3JNlWEcipFNQnKEqXHELQDunqlhoAE45s8perH+tYstkbLf7o5MXHxDL
         mFy4JjFKKE7bJBULB4BAfbipjzcLaa4GttQXO07XsRx38rs5ae6uIes1Exf9V18OijQK
         9LIcq1cZbhykpV1gqIwoQoBmdnQgsFPcSHSUFqPJBOQ6kZz6PEkFFq50OK+THE+wj76m
         PFwwq3KjAKCrZ2OBm2sptsHcW/2GeOtxdj+dHb4BYNeA09MOHIT+WujiPQPaqAe720f1
         phdA==
X-Forwarded-Encrypted: i=1; AJvYcCXxe9GGpoeaVhUsIJULDcOQrzSj0cQ/ByKiuTxdIzqUEZ/4BAO0uXzlIGJvlk680g5dg29ZxolG0KeeC3gnxpN2@lists.infradead.org
X-Gm-Message-State: AOJu0YxAoxNXiT3c7uRLKdB0SpLJjXqWl8wOwrrd1UZDwXPHOLDvM1Eg
	Z3+mxmi6OFZrXa+24eAwTbcXOtYJkOjmlJ/0RLvh0XLr71BqYi0aypk8lHOwKheBg0ElsOb+P/f
	1pmg=
X-Gm-Gg: ASbGnctFXv4tO6vYSvMM1yfbYAgeVlrCUlqFlLsHBKX0EF2D3O1NbmFho3CQf7rzWxv
	Jqy9inLsGTWe8dZbAnFeh6Vi/PIW/YYN6GBnYHfWxAqN8NVHD1bybr7k2GHlPm9iVXJiF/3C7QM
	G1ybEGpjy8/al0AkvyOkjTQftKe9F2uPyfUgApnFGjD/UTkbEGXYueiPKBlrRL3g89xn1iVkcpK
	0LAewqYNpdFTg/9i2lDb0H1gPsMNulieXj7TwPuR4ZwLX7rPfY=
X-Google-Smtp-Source: AGHT+IFZNS/vLYTFlhcpAiQaF2L19OGIDhrILZwk3DfUtSNiJLmw56KxCqGdAEFEOkAw7CQrELObyw==
X-Received: by 2002:a5d:64c3:0:b0:385:f7d2:7e29 with SMTP id ffacd0b85a97d-3862b35d19fmr3174954f8f.15.1733502669549;
        Fri, 06 Dec 2024 08:31:09 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862f02f5c3sm1151942f8f.65.2024.12.06.08.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:08 -0800 (PST)
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
	Atish Patra <atishp@atishpatra.org>
Subject: [PATCH v3 1/4] riscv: add SBI SSE extension definitions
Date: Fri,  6 Dec 2024 17:30:57 +0100
Message-ID: <20241206163102.843505-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241206163102.843505-1-cleger@rivosinc.com>
References: <20241206163102.843505-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_083111_671928_8B39E987 
X-CRM114-Status: GOOD (  10.91  )
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
 arch/riscv/include/asm/sbi.h | 62 ++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 6c82318065cf..032dde350d40 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -35,6 +35,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_SSE = 0x535345,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -401,6 +402,63 @@ enum sbi_ext_nacl_feature {
 #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
 #define SBI_NACL_SHMEM_SRET_X_LAST		31
 
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
+#define SBI_SSE_ATTR_CONFIG_ONESHOT	(1 << 0)
+
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP	(1 << 0)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE	(1 << 1)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV	(1 << 2)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP	(1 << 3)
+
+#define SBI_SSE_EVENT_LOCAL_RAS		0x00000000
+#define SBI_SSE_EVENT_GLOBAL_RAS	0x00008000
+#define SBI_SSE_EVENT_LOCAL_PMU		0x00010000
+#define SBI_SSE_EVENT_LOCAL_SOFTWARE	0xffff0000
+#define SBI_SSE_EVENT_GLOBAL_SOFTWARE	0xffff8000
+
+#define SBI_SSE_EVENT_PLATFORM		(1 << 14)
+#define SBI_SSE_EVENT_GLOBAL		(1 << 15)
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
@@ -418,6 +476,8 @@ enum sbi_ext_nacl_feature {
 #define SBI_ERR_ALREADY_STARTED -7
 #define SBI_ERR_ALREADY_STOPPED -8
 #define SBI_ERR_NO_SHMEM	-9
+#define SBI_ERR_INVALID_STATE	-10
+#define SBI_ERR_BAD_RANGE	-11
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
@@ -504,6 +564,8 @@ static inline int sbi_err_map_linux_errno(int err)
 	case SBI_ERR_DENIED:
 		return -EPERM;
 	case SBI_ERR_INVALID_PARAM:
+	case SBI_ERR_BAD_RANGE:
+	case SBI_ERR_INVALID_STATE:
 		return -EINVAL;
 	case SBI_ERR_INVALID_ADDRESS:
 		return -EFAULT;
-- 
2.45.2


