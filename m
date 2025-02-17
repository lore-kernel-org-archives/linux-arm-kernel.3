Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EE1C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 09:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=; b=B1qy38nmy86Bv2Tw380GFY3aMd
	24CncYIqXVXZnrobx9iENpO+GNMCVon5mqYl1shoveRFcnBLJQ7eX97hiyJz/xD3A19eE1uFhdYrd
	1FbuUf7POKsj4pacQVqC+5R5L4TGBoTT/fAcV6hbCI5c4TO0Q41DMFqJFPP03jZGOtcnDkIHRVGDp
	Orlh6Z5+Ql4JepseiSG6fY9K7V4wBgHI0/9LhSe/XqXu8DwjDG8YT8fYOCu2Es9kJoXn+CUMr7DWL
	MbMCGbP58kEnFwJwYnPEq9MTZHIoYIqUoRJAXXoDOmkt9I2RWVw5FZnBSoJ0KJSE0jXhObgcGHn0l
	mojICYwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjx72-00000003sG7-0gbW;
	Mon, 17 Feb 2025 09:08:24 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwxa-00000003pis-3Vnf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 08:58:39 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-221206dbd7eso15647305ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 00:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782718; x=1740387518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=CQ24t2T3OORUKZUHdpf/oNLLdmnm7gXAu7bzdGfXjo3a0YkuIqXUPcB061AqpkVScS
         V1Z2i5pN1pr4FKgrTjftABvkAIq9X8G5VJ59Szul0j1GNXnWaQH7E+05HfB4/SxHD8lf
         bKqNO4+/Y0BNbZtzlbtO6kaAUN0WKSTyZbnPicyaF+T9HqYKfSRboXocO8G8Hch8IH97
         Bk6TJeN0l8fDsHqVEtZ6o2NxWkQWfKPXW6JZSfcsizeBI+zu/4a9Ycbn93fIpr2en2df
         XsxbSBQ7/ecFO0HYW7ULAK0q/VDwLQ0V8OY7LTwCMwWK24aCySVkhpeEtXkXUnUBa2H2
         oWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782718; x=1740387518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=eiqcRJ6hS7asSDFNVN0tpXjlHCZSCzD/Ml6IeHhftlMd3F82iF1Za+E0BHd7yA5Z2y
         vFOgv8AVHSfCg3uk169BW0gbudU5xXaF21lq30JdI33rWaEzyKhSMmgQFrzCyZeFddMy
         vNDvcZQfQuOUq+wqZSlgLBNUX5txETzFQBhPPXhU/dYm9csvTcw1tMjjWYOitKRbZbdW
         ZIR6Mu3aSRvNbzpVKEWxpWV+IxioMLQqy/WNl+bcKnoNOGJdZhn9IkKYCXyksUOGCFHh
         ZIRqy2rTTHrGIcm4S3i2QrPDkInwKPwgRhlslyXdT/s4tQyy3mHK4NZz1fmGKVEaGSYK
         Jrsg==
X-Forwarded-Encrypted: i=1; AJvYcCWTdb8KYBDY5FNr4BDiab4IxlHiBm0rWCIRaAH4CA3SDjW3g1i9li3k03gR/LhX21Qoo8cC876x7BjN//xgjaL3@lists.infradead.org
X-Gm-Message-State: AOJu0YxBgXICxzPvtVB949H180c8lGyl6tnIG+Pr8KXmeNNa9dS7m2X5
	bxdnz692PJL6hynzwF5DdWJYEKgzbQYrLWQp5udCnlj3M1Hpg6vqIIIKwTcZNjA=
X-Gm-Gg: ASbGncsODSo2VcQ+epaXElT9H+cyPnr6JKwj8fxRrLxydh+lFxXK4R/P8kuU5NgsBIU
	03egSywJQeUpdHDTMulVzAdKobJTTsgpKj+sMKXEmQvSFZS0jffN+qrk6h6ygVz5dgH8Fv7kKai
	JPzPV1I+Zi7eNFFQB8K5wx6dANWlG9HizOHxxpUjnrIJveZloIbT0VOnFbFqxOURT8gGhJAMvW+
	Io9i8ulFMa6FPiJR1w0Y/IR+AFshFd010ObqwoedChB3B/AeYAnq7hBG5d2FwvtLucMQkOqHpHQ
	8Yt4N2KQdm8WuEj9dMPHSeqN5QByUqfO4+rUpenEbadL/YQVFaII5/c=
X-Google-Smtp-Source: AGHT+IF5wHBOeSXkGQAxYL6n4RikPXg1rsQVBSgGjP3SNk1+gp0GdS9NH13FpIk5wtFAo3PxZIMq+w==
X-Received: by 2002:a05:6a00:3d0f:b0:732:4c47:f807 with SMTP id d2e1a72fcca58-732618fa196mr12143576b3a.21.1739782717876;
        Mon, 17 Feb 2025 00:58:37 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:58:37 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: hpa@zytor.com,
	Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 06/10] RISC-V: Select GENERIC_PENDING_IRQ
Date: Mon, 17 Feb 2025 14:26:52 +0530
Message-ID: <20250217085657.789309-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217085657.789309-1-apatel@ventanamicro.com>
References: <20250217085657.789309-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_005838_866620_B7951D7E 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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

Enable GENERIC_PENDING_IRQ for RISC-V so that RISC-V irqchips can
support delayed irq mirgration in the interrupt context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..a32f39748775 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -111,6 +111,7 @@ config RISCV
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
+	select GENERIC_PENDING_IRQ if SMP
 	select GENERIC_PCI_IOMAP
 	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
-- 
2.43.0


