Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5761FC6177
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 08:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvs9mu39u8pUKEaoauSfWHl5WiFJwmaNAiuKq3SpZKw=; b=Rzeieqe0lHFoSXFQgHaBDN3Zp3
	/qWMJIZfMqJyLFXlmlvigXSCszFUkt+1A4Ewo0RbvXcADeuDw23C0m+B8j+3XMSigPphVwTZuawJQ
	jADybl7HPZ1pFhzf7qNyLb2x1/wpQy9egq8XHwomKXa3PjuXYHEVC90ocbLnMIt2VAkqGPQ4CHlWU
	647k6d+YCLqZtbGlbBc8fbD81tpge3n1gPAyJwXfcIvVNDBgsOwb7l8CJQzIoIcjKPZr44ztsWnWD
	vMZUWsyeA3qPG5BsmLVqPJTWQIVhYZpiYNUPQxv2xDdACR/yX522H1q3j47/LBb8gAHIhocjU6W2V
	XWkgZjFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIw-000000097Im-0pbj;
	Sat, 03 Jan 2026 08:48:10 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbxIp-000000097FT-1olW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 08:48:09 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo14103511b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 00:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767430082; x=1768034882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvs9mu39u8pUKEaoauSfWHl5WiFJwmaNAiuKq3SpZKw=;
        b=iIUplYs83FarEa4c8rEDrLRCeMilUc1ymK5CCvZAeYJ/QNHdUaAIl1TPbeZezRci6T
         RTexWOkM3sjsf/Sh1FcrzvL5AZuepe9zvxy3GCZvva57Jt+tMfaymFCbOOw5N15/oZ88
         e1LYEY5Tgp491oSs7/oK05bFMKpiRsi2N3IPjpUp4qaMjUPOpFJum4cwRc03egbtLC/j
         pmx0VSoC3OkqGxlDYDSjwILiAX1FrRbzzwDQm39w4oO+hBhEFSA8Bao+WWlZaQyqbF44
         ktLd92rilqfYgxgToRe6rokZyX2hJpEGhL2DDqVZi1kn7mzDR0R9EQbKf5YO97iiapeo
         ktdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767430082; x=1768034882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bvs9mu39u8pUKEaoauSfWHl5WiFJwmaNAiuKq3SpZKw=;
        b=Df667MR2oo4ZGUtHLNqIy3Sfo9evnAfLmZRk0BcQlJ+K7GcczHK41DAm4PlsIRhZIJ
         +5YxmMd0d8jmZT5Gv5ri+vJItP7JZPkhYNrh80ze8Migmp9r/1G1n7RjQd3ni6vBr4vx
         zcBErDFdHOW5UjNTwQ8d8H4Hr3EGgZVvPLPMYRknkZHDustJzjHj4zqMbj9EuuReTnOI
         mUM0WQ7TbZF2IeDKoRJabzCeOufh02oXVrqtfoWXaZ6Cce4fNBB2329hnvhmAF37Am5L
         JAvNCT1KXWXypUlcPlvE8LTvdymYKkLBAh5m8ur+HIWFqb+nr1HN5OrXnZX4Ids/f+Dc
         hBmA==
X-Forwarded-Encrypted: i=1; AJvYcCWSvBspqJVZToEnxu/fNHch+Zjwao43WNBkSFkccWTq3TCHuNg448vuqDNrqQuSGk6c+5hmmahn5MzwTdp4BqMv@lists.infradead.org
X-Gm-Message-State: AOJu0YzQRXXygMxuO97ZNILgDjfyOtA6v4MoZ0pLpVPnjWLmt4g1h5fl
	LeCl/ycHRcRLIyEHcs+Sz/gqS9YJ709GuFHvXuIyGq3KOjlmpyf5Vy6W
X-Gm-Gg: AY/fxX7Ibyk4MBx13e0+TYbYzPJo+0y6R1BFVyux0uJJ7Niu9shEcDT+jAdxkObrn/R
	QwKckQijv6wrKyj6sI9LDvB81MXannu4YiTg1I1sFtUljBt5uBAHbzmtoRdoi1KOak7mNBI4Gtp
	RfXE7nL1FP8VLgF8xXiP7MjGtgnpF5O29ki8h81I00NJ5V7FM1P9IrOTvSsKD6asDWSa6qCa4b7
	IIjQ02pNPqIdr4ikT/B2PtayK+UwbrA4QvFZStsjWk4SibiFgQ4fWwYlXOx3KH3Jc3sNscGSrOO
	Odb6utsHKs0fN87ucW0pACb5krHYxuP5+zCFYnkyRRJnT4S+O6NtQ4GBuN0b2xULIVwcdmaCS9i
	cdqjgwvbsg5yOOFrcRIHpefJkSMqdryZi9Yupmsa9azkohTBR5rIk+G0oqHGX7zWdZiKgqowbSw
	MPUQlWhenxHkaxrz1V+WcFCmeU9Ob4tNqzj+4=
X-Google-Smtp-Source: AGHT+IFtMJvjrpfUuqAmA+OpACtkefUVF2XH5YredFgsYPdy6OhoXIwbDm8pMiudZkIWzurpixeN8w==
X-Received: by 2002:a05:6a00:338f:b0:7a2:7792:a477 with SMTP id d2e1a72fcca58-7ff65d7e81amr37223258b3a.27.1767430082432;
        Sat, 03 Jan 2026 00:48:02 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e197983sm42704939b3a.33.2026.01.03.00.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:48:02 -0800 (PST)
From: Keke Ming <ming.jvle@gmail.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org
Cc: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	tsbogend@alpha.franken.de,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Keke Ming <ming.jvle@gmail.com>
Subject: [PATCH 3/5] mips/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
Date: Sat,  3 Jan 2026 16:42:41 +0800
Message-ID: <20260103084243.195125-4-ming.jvle@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260103084243.195125-1-ming.jvle@gmail.com>
References: <20260103084243.195125-1-ming.jvle@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_004804_403738_211377A9 
X-CRM114-Status: GOOD (  10.78  )
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

Replace deprecated kmap_atomic() with kmap_local_page().

Signed-off-by: Keke Ming <ming.jvle@gmail.com>
---
 arch/mips/kernel/uprobes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/uprobes.c b/arch/mips/kernel/uprobes.c
index 401b148f8917..05cfc320992b 100644
--- a/arch/mips/kernel/uprobes.c
+++ b/arch/mips/kernel/uprobes.c
@@ -214,11 +214,11 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 	unsigned long kaddr, kstart;
 
 	/* Initialize the slot */
-	kaddr = (unsigned long)kmap_atomic(page);
+	kaddr = (unsigned long)kmap_local_page(page);
 	kstart = kaddr + (vaddr & ~PAGE_MASK);
 	memcpy((void *)kstart, src, len);
 	flush_icache_range(kstart, kstart + len);
-	kunmap_atomic((void *)kaddr);
+	kunmap_local((void *)kaddr);
 }
 
 /**
-- 
2.43.0


