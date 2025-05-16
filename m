Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A94C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKbGApiEtkT8/WDx/Modbo6eDPhoN4O6DcMv04ORqek=; b=C7qG1Nw+G3WJyvi1gZbVGKqVk7
	BN7Nuzst6wgt9zujbKssh1NbqaPWTwaYbB3YGUQ8GsQoniaqeBOQnedbWkj0zCc/Exed1JTa9O3LT
	S28p8f+5jysXlNIEQP7Sjj5LVJ5/TRpVfiwXN0H+yeCntlLvdQx+W86m0YthsccJ7kCRqC5TBoKhF
	z91flQum911imutrnpv1Slb0IaxWgD+VrnshqI0suIpWRFMDFMbr1F5IUVJt9IZMZ4rSxpfyZU3s6
	H7M10bzpM9x6vuJpTuIzg/63mrjW/LpxmFAGaVgAWW8oBJDbrvG/2Agg2znwQmyFCsPfL+h/rFDD3
	mrR7FfyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxQA-00000003v97-11cZ;
	Fri, 16 May 2025 15:56:26 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwv3-00000003qBU-2xkT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 15:24:18 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7423fb98cb1so2664345b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747409057; x=1748013857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKbGApiEtkT8/WDx/Modbo6eDPhoN4O6DcMv04ORqek=;
        b=LnrIlf2npslBvgrACH9IXuv1I9OIvZcDy+QNVhjNm2gQVtpoReN6pMgFkFs6zUgyqI
         TBI7OtjqlDcCtlu7LwKZ9S4YodPYC9kLF5NgXO3sbOmwmI71IXkKRYrDeL88dAHU4HYM
         J27rR0m3sONimdegcNBR5POwF9oQfkSsSPSITeZh/y7mKIlP1Nj7OGaDewaIF89Z6DbZ
         9V1MdkIF2eVNEXa90AIhTTdDtoO53qGMVIv0kAcIcIQ7e2gGWmMtzrx3Im1lbx8a5BdK
         fijM5HO1hpXl2sprjhKsR0m2wBR9ml2uQBuas+atO+J/cOFBOB/7lgYC/eMQfNuj11ad
         5dQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747409057; x=1748013857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKbGApiEtkT8/WDx/Modbo6eDPhoN4O6DcMv04ORqek=;
        b=YH3AYIsQ1wtY3Blnd/FT6FMSJWXZqoj86tLq1/ONOaIH0iwYPhsXot08izQKqKls93
         tXWamCA3d2VoBjEWDDp2BSRbQTh3dvWYw1R6zHf2PmM0Va9UgcpzPzTANhYMt99ngk86
         /Q/N+9/60ODeA2R04mAiONnEQPCV0LYlUyZsJWk7nJgeufhbm0ja25DiZCX35B3IiOJs
         qj+xeKmMOpfevHxi2QeZTXx8d+dE7lkf1T4wgymHE/It4k7fev+pDyLCrVOWxCSAnC1q
         i+Vr3iK/uRIr170/jAU1EiJ2kG9a8HvUo9h9gVRxzCZgBLJW18AwFHuJhWryiFeOZIgE
         xRug==
X-Forwarded-Encrypted: i=1; AJvYcCVmHNARd7aop0hoNOwYZ40NGIUXPaUg5CDLEbft36OjqbHIGqIVvFY+fgURHHx6DiB+uEwZO8D+YGdjol0o9KMC@lists.infradead.org
X-Gm-Message-State: AOJu0YxDGW/TtXvS5ffX6QCD9ulvxwTOjqlZtdbR/D4CyJ21BnWXABsQ
	sq+tnT7XmdXByw/dqYmWnn4OHeRZLS8i7FiY+421UrVWOMRI8j6VmhytsTxQIVoze2S2E56BWUv
	mnTIab7k=
X-Gm-Gg: ASbGnctFtIfgMuHvc2Zm1UArwvFRFrX0pHNKsySSmR0DCRXZ43cUZOGrnG6Pg7Ioih0
	iINjedG6j+x+46mw1paggvsK664agbvCG+lMv6EKwlEoric5UA1MwLM5U9LlpZV74/6ZzacOOG6
	8KSbt5U5k2CAbiypDCSQfelaX7Jd/wfKUAMlMNULicf3HbxKlbvngux6MyM09fojKwbgjQM7vlJ
	yjGXRIVqQYhTa0QUnVTKiQkSh0O53nwSw7jnQLbFjdklnc29WB6JaGNi39JBPgHknQXWtfm/3S2
	1bMs6aHJitesNE6cSlxgbJ/3E/s4qVS3CYZzdA3iiPpuO+DVXQECG5h2fm7wujs=
X-Google-Smtp-Source: AGHT+IEPys89YDQJYKU3/9Q96sLuGwipd4FD9peTZgU8hGsM8WzNmpqONcesktg1K7D9UT/m6i5B0Q==
X-Received: by 2002:a05:6a20:12ca:b0:1f3:418c:6281 with SMTP id adf61e73a8af0-21621875ab8mr5817835637.4.1747409056778;
        Fri, 16 May 2025 08:24:16 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96def68sm1666997b3a.30.2025.05.16.08.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 08:24:16 -0700 (PDT)
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
Subject: [PATCH v4 1/4] riscv: add SBI SSE extension definitions
Date: Fri, 16 May 2025 17:23:39 +0200
Message-ID: <20250516152355.560448-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516152355.560448-1-cleger@rivosinc.com>
References: <20250516152355.560448-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_082417_761918_DDC46801 
X-CRM114-Status: GOOD (  11.30  )
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
 arch/riscv/include/asm/sbi.h | 65 ++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 3d250824178b..4d7f81c620ef 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -35,6 +35,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_SSE = 0x535345,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -402,6 +403,66 @@ enum sbi_ext_nacl_feature {
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
+#define SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS	0x00000000
+#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP		0x00000001
+#define SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS	0x00008000
+#define SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW	0x00010000
+#define SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS	0x00100000
+#define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
+#define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED	0xffff0000
+#define SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED	0xffff8000
+
+#define SBI_SSE_EVENT_PLATFORM		(1 << 14)
+#define SBI_SSE_EVENT_GLOBAL		(1 << 15)
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
@@ -419,6 +480,8 @@ enum sbi_ext_nacl_feature {
 #define SBI_ERR_ALREADY_STARTED -7
 #define SBI_ERR_ALREADY_STOPPED -8
 #define SBI_ERR_NO_SHMEM	-9
+#define SBI_ERR_INVALID_STATE	-10
+#define SBI_ERR_BAD_RANGE	-11
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
@@ -505,6 +568,8 @@ static inline int sbi_err_map_linux_errno(int err)
 	case SBI_ERR_DENIED:
 		return -EPERM;
 	case SBI_ERR_INVALID_PARAM:
+	case SBI_ERR_BAD_RANGE:
+	case SBI_ERR_INVALID_STATE:
 		return -EINVAL;
 	case SBI_ERR_INVALID_ADDRESS:
 		return -EFAULT;
-- 
2.49.0


