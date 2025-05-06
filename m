Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE59C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhJcuLA9lc6JwkXlygLvOeNzNKhkGSCKOxEZRRwR2Fk=; b=2zq1IMdMgKXIFEYgAH8QMSbDzD
	TJNr9wCXTsNTuB8bjntEq/mG91jv9Wj8tgBS+1ISAt3BXtye7HMFYKNY0vH0odguy296GExY7CPzQ
	1sZFtt+WdCibF2WgqaMBbmiSpcv9GhHgsQG3S47CY914o4LR2Oo6EPE6/l0i7nnzjJjIxUVuIRGz5
	zIWGmAbmeNc4Cs7eZofNlkuVg7qtixbycjjldf833/uRufKhKSs2AIiVFq4y/7254V7/uRv+ZSOhv
	BHuuyTpwqdaqEJ9EQz8d4FF88J/s4dvdK75nmoOyKr+6sCcZwQ8M71mgCI7EJKh9oVJqQSUvdY31M
	QGG6dACg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGW5-0000000Bkb5-3QvN;
	Tue, 06 May 2025 11:31:17 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEz1-0000000BSwy-0pn0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:53:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-440668acbf3so7143745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746525182; x=1747129982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhJcuLA9lc6JwkXlygLvOeNzNKhkGSCKOxEZRRwR2Fk=;
        b=cWDbi0mIg7ciU3zMGEd5Wff3AyMd4Zd7PfKsKAfsuFuzkMj7aqtuCt2ACLQXqCJlaA
         syVZgVus/h55jibAg4ZoWTfskoK4O3QMYO37Jfj8MCXe43GC3fC9Mgw+PTp1Zbob2OCS
         23QpOPqMw/kHhXrES7M9A6XlZOIfC10fN9/6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525182; x=1747129982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhJcuLA9lc6JwkXlygLvOeNzNKhkGSCKOxEZRRwR2Fk=;
        b=Vbxod/3T5N4vbffrCBrh6v7q3gKW2W/ZcKekWap4Td6UktBk71jPl/A7LkPkCqRvg0
         armXFezeEc53B5xp4tEruhggJ9zGSjwWwx4i8EzYFzoc3B76Au7Byt2M+bsesmNNxeS0
         XcTNaMzhqFlvPeKphfuPHMyqMsZXFr2fG7DbcTWxG3bSPyavMYFy3DxAqPrkFU0/Gvgi
         soH6RCWzJOzOz7Uf8HvPWtNUd5WL4QjKf+ezY4DoH0eSKSUTIuq4pFt6EVKVk2n5d9UR
         wJyak8MBUcCw+4pQRMVq+uC9MiNYaQdQhIHPe2s7Kyrc8f8YVnbBsjy63+FIKfr8JIYj
         zt/w==
X-Gm-Message-State: AOJu0YxrjNgGAvMHq5dx9b48WUVDh/SH+8Kvbu0lM/3uNENioh9GAAGG
	xniY3rI9V/qRoQIRwF57w3HTp38x1Mop/e3uzQBHJlos3I4R4h+9KMlIa6bMoSKKW1LgDP5cT1U
	=
X-Gm-Gg: ASbGncs10/D+jm378mQUdWKtI2ntfvfVaUWbp+PPr2ohaY4cCn4/T/8TiO6VwFyiK58
	NzOaOvKxI0qk5k4y9DvjTBUNnBPUEf5iKu4PLiLFjlA6V6dzEI7+9xLkCb2h8H15R0iAwx+2MUZ
	aoWSDYLtbhbSy7zzayWo2KsWvkCoIDJmrMqacJGn34AFO6ogSoIDrSnk/aWLEQAJPiZdygAD5WH
	787ibv3mIaputqux/L/vnJ/L1n6sV/DYYxYFCJkEssPZk+WGixFVvur9S8gjEV5O3WwlAoUoBwr
	cpsVm5LoThETv1+K3HPWDeMmgNIOpsjMcfV6PcpODDQBES+B31H00cSn
X-Google-Smtp-Source: AGHT+IHU7272b30JufMiYFqV3ys7N1n90y66VNZEPW3djdWr2Dr7SURgKX3aokdtNYam+3P+w0HERQ==
X-Received: by 2002:a05:600c:3e07:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-441bbec0fdfmr51577235e9.3.1746525181618;
        Tue, 06 May 2025 02:53:01 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:7196:3093:b0e3:1016])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7a46sm12879860f8f.44.2025.05.06.02.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:53:01 -0700 (PDT)
From: Florent Revest <revest@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	akpm@linux-foundation.org,
	broonie@kernel.org,
	thiago.bauermann@linaro.org,
	jackmanb@google.com,
	Florent Revest <revest@chromium.org>
Subject: [PATCH 4/4] mm: consolidate VM_HIGH_ARCH_* macros into parametric macros
Date: Tue,  6 May 2025 11:52:24 +0200
Message-ID: <20250506095224.176085-5-revest@chromium.org>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
In-Reply-To: <20250506095224.176085-1-revest@chromium.org>
References: <20250506095224.176085-1-revest@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_025303_249056_EDF95135 
X-CRM114-Status: GOOD (  12.69  )
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

This reduces code duplication and chances of mistakes.

Signed-off-by: Florent Revest <revest@chromium.org>
---
 include/linux/mm.h | 50 ++++++++++++++--------------------------------
 1 file changed, 15 insertions(+), 35 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index b12549f0a6dce..6750020d5ea37 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -298,42 +298,22 @@ extern unsigned int kobjsize(const void *objp);
 #define VM_MERGEABLE	0x80000000	/* KSM may merge identical pages */
 
 #ifdef CONFIG_64BIT
-#define VM_HIGH_ARCH_BIT_0	32	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_1	33	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_2	34	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_3	35	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_4	36	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_5	37	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_6	38	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_7	39	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_8	40	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_9	41	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_10	42	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_0	BIT(VM_HIGH_ARCH_BIT_0)
-#define VM_HIGH_ARCH_1	BIT(VM_HIGH_ARCH_BIT_1)
-#define VM_HIGH_ARCH_2	BIT(VM_HIGH_ARCH_BIT_2)
-#define VM_HIGH_ARCH_3	BIT(VM_HIGH_ARCH_BIT_3)
-#define VM_HIGH_ARCH_4	BIT(VM_HIGH_ARCH_BIT_4)
-#define VM_HIGH_ARCH_5	BIT(VM_HIGH_ARCH_BIT_5)
-#define VM_HIGH_ARCH_6	BIT(VM_HIGH_ARCH_BIT_6)
-#define VM_HIGH_ARCH_7	BIT(VM_HIGH_ARCH_BIT_7)
-#define VM_HIGH_ARCH_8	BIT(VM_HIGH_ARCH_BIT_8)
-#define VM_HIGH_ARCH_9	BIT(VM_HIGH_ARCH_BIT_9)
-#define VM_HIGH_ARCH_10	BIT(VM_HIGH_ARCH_BIT_10)
+#define VM_HIGH_ARCH_BIT(i)	(32+i)	/* bit only usable on 64-bit architectures */
+#define VM_HIGH_ARCH_(i)	BIT(VM_HIGH_ARCH_BIT(i))
 #endif /* CONFIG_64BIT */
 
 #ifdef CONFIG_ARCH_HAS_PKEYS
 # define VM_PKEY_SHIFT VM_HIGH_ARCH_BIT_0
-# define VM_PKEY_BIT0  VM_HIGH_ARCH_0
-# define VM_PKEY_BIT1  VM_HIGH_ARCH_1
-# define VM_PKEY_BIT2  VM_HIGH_ARCH_2
+# define VM_PKEY_BIT0  VM_HIGH_ARCH(0)
+# define VM_PKEY_BIT1  VM_HIGH_ARCH(1)
+# define VM_PKEY_BIT2  VM_HIGH_ARCH(2)
 #if CONFIG_ARCH_PKEY_BITS > 3
-# define VM_PKEY_BIT3  VM_HIGH_ARCH_3
+# define VM_PKEY_BIT3  VM_HIGH_ARCH(3)
 #else
 # define VM_PKEY_BIT3  0
 #endif
 #if CONFIG_ARCH_PKEY_BITS > 4
-# define VM_PKEY_BIT4  VM_HIGH_ARCH_4
+# define VM_PKEY_BIT4  VM_HIGH_ARCH(4)
 #else
 # define VM_PKEY_BIT4  0
 #endif
@@ -349,7 +329,7 @@ extern unsigned int kobjsize(const void *objp);
  * (x86). See the comments near alloc_shstk() in arch/x86/kernel/shstk.c
  * for more details on the guard size.
  */
-# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+# define VM_SHADOW_STACK	VM_HIGH_ARCH(5)
 #endif
 
 #if defined(CONFIG_ARM64_GCS)
@@ -357,7 +337,7 @@ extern unsigned int kobjsize(const void *objp);
  * arm64's Guarded Control Stack implements similar functionality and
  * has similar constraints to shadow stacks.
  */
-# define VM_SHADOW_STACK	VM_HIGH_ARCH_6
+# define VM_SHADOW_STACK	VM_HIGH_ARCH(6)
 #endif
 
 #ifndef VM_SHADOW_STACK
@@ -381,8 +361,8 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 
 #if defined(CONFIG_ARM64_MTE)
-# define VM_MTE		VM_HIGH_ARCH_4	/* Use Tagged memory for access control */
-# define VM_MTE_ALLOWED	VM_HIGH_ARCH_5	/* Tagged memory permitted */
+# define VM_MTE		VM_HIGH_ARCH(4)	/* Use Tagged memory for access control */
+# define VM_MTE_ALLOWED	VM_HIGH_ARCH(5)	/* Tagged memory permitted */
 #else
 # define VM_MTE		VM_NONE
 # define VM_MTE_ALLOWED	VM_NONE
@@ -393,7 +373,7 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
-# define VM_UFFD_MINOR		VM_HIGH_ARCH_9	/* UFFD minor faults */
+# define VM_UFFD_MINOR		VM_HIGH_ARCH(9)	/* UFFD minor faults */
 #else /* !CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 # define VM_UFFD_MINOR		VM_NONE
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
@@ -406,13 +386,13 @@ extern unsigned int kobjsize(const void *objp);
  * if KVM does not lock down the memory type.
  */
 #ifdef CONFIG_64BIT
-#define VM_ALLOW_ANY_UNCACHED		VM_HIGH_ARCH_7
+#define VM_ALLOW_ANY_UNCACHED		VM_HIGH_ARCH(7)
 #else
 #define VM_ALLOW_ANY_UNCACHED		VM_NONE
 #endif
 
 #ifdef CONFIG_64BIT
-#define VM_DROPPABLE		VM_HIGH_ARCH_8
+#define VM_DROPPABLE		VM_HIGH_ARCH(8)
 #elif defined(CONFIG_PPC32)
 #define VM_DROPPABLE		VM_ARCH_1
 #else
@@ -421,7 +401,7 @@ extern unsigned int kobjsize(const void *objp);
 
 #ifdef CONFIG_64BIT
 /* VM is sealed, in vm_flags */
-#define VM_SEALED	VM_HIGH_ARCH_10
+#define VM_SEALED	VM_HIGH_ARCH(10)
 #endif
 
 /* Bits set in the VMA until the stack is in its final location */
-- 
2.49.0.967.g6a0df3ecc3-goog


