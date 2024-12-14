Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D698E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 17:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yE+w0neHmk87dMRt+p213gF5rtqgAWN6iext8wGVFRM=; b=E1fDnYlb5yeszfN5S6ugrS39+n
	YxipOm//KGNTY8TNXB9X/x1fM2i5vTz8f8yfGM9q63c6gdumnN8huLgcG5uuVILrMXdMRIED2RWIk
	0PLzzGT4FkBJIVs0cJ5Msy9atuxxyLJqbqjQ0KUM0AcAFdBXCyYQtgge+MZVJroeFTmq4kGAUlyCr
	6Kh4nnDR+xChqBlVPRZww7+hs8hbfueUv8gnQnPB3n6EeGdKtKAF25FitUYMKgJXtItzDDg/pXWUm
	ferVG9+LjS5qqrIwqkePYL+daa64ZATHQyxzdJljTB9DKLbzIRsVFv24KbYhnAKi9yys9FlsduDIj
	grMjN7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMW2c-00000006i7O-3vYw;
	Sat, 14 Dec 2024 17:34:58 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVuo-00000006gU9-1ESz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 17:26:55 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-216426b0865so24514115ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 09:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197213; x=1734802013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yE+w0neHmk87dMRt+p213gF5rtqgAWN6iext8wGVFRM=;
        b=GoFQlJy4nD3najFRD4CLhH3we4JMYqxuWrhQvzob74zv6RYqRkd7H2gH/9rxR1Vola
         gmFvskrU+yyH3AzgXshJNBz3IXP3K9YhawBWIp5ri4s0QAPSGToyYp1p0pDUtPQnYKrg
         BE9QjuaR5U9Yxjjcxm91tMU2D2mhlJexrf4VqOX/7LGajtT6M/7CIidcIiDh+wiTZR8r
         cWe9tGatmINEbCJSWsQ8l5TqcUxlMhLhMhs2LL8NHTPAWincZydxFs4/v/1AZWTD9L4y
         6g1sIVepMsSs160tlv4z/bst43hszxgsd1HbylbFQgUUvC61eTDCBEhD7B9iqoFdPika
         jh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197213; x=1734802013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yE+w0neHmk87dMRt+p213gF5rtqgAWN6iext8wGVFRM=;
        b=L3kqOgswO5w9pTSFYM70RYVhlF/+8/Ew23NLEwZeMMq2TDgl0xHPzfTwzmVdHih8B6
         rPGBMCTJVXV+eTkPuxxN2zJfnA0522yj1otQGmi3gEvrYNWWL7+/U6jPBTGeHF/9QYLZ
         ZVHpW157/Ur4PN2IFoANmEiWBmLED+yP/1NDLTHx3rbJe1FT9igQhOMFJt8zj3TTMHSb
         TkAxyXTOplNZoSGb/qL00r47L4JlsYq9QmeZBlnWSQOpE89AGWNT0vduu/kY/pW+UCfQ
         PEeif3y5MbOEVU513daOOSR9BHwg0LMTY+mXk599qY3yUi1ls7+aaNbrvB1aqGm+ZM9l
         mppA==
X-Forwarded-Encrypted: i=1; AJvYcCVCBEhCr8VarG+W0N0hKGIVYsBk96hRxChi5S0szABIM3R0RYCtg5w3iSTsr86gC5VVid/h69kS3vA1RBa5boZr@lists.infradead.org
X-Gm-Message-State: AOJu0YyGovVJCbi5EGJGvzwaTvY1jvDqv4NJIvgdQ04RqphOVwEN9XOZ
	fRIrcp7yL1tIGHsJ2mkTKKYljqcEl5SmIUvNe0XdXnPay2ewfVdrcZkWj3NYJy0=
X-Gm-Gg: ASbGnct29tnB/ZOgDb2MGgaYidRq8quRKYjrBgXzGsPzGXqfEcT4sUaFWpmxS8CagTu
	SmO98TerLLK01IlUNi0bPDhVFfH8dbJaI5B3Q+yaheivLO0+LaNC4YSJBKzbOo43cKT2BohxUp+
	Ysp96EzC+i7RBjmNCiOSII1pgNKZbm4PksF0Fek0WBRYj/qn1KEN7e+kS9l+LK09BSbkTJle/pv
	704jzcaCBE8WDOBm++W52QFmLFcEz5lIhhuV9J0Hek6gpf+fsDl5DGoWRSqD8Rvw1D6cWzXRFXp
	zGF1x9M2I6zW16E=
X-Google-Smtp-Source: AGHT+IFHcRze2J0M8hyBJEZA/NeT8/eZWD7tT0rfNtTykqj4Jc1ZWMZrjfrUoQxfR7mhTVQoKpV61g==
X-Received: by 2002:a17:902:e545:b0:216:30f9:93d4 with SMTP id d9443c01a7336-2189298bbf7mr99837005ad.8.1734197213088;
        Sat, 14 Dec 2024 09:26:53 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:52 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
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
Subject: [PATCH v2 07/11] RISC-V: Enable GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS
Date: Sat, 14 Dec 2024 22:55:45 +0530
Message-ID: <20241214172549.8842-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_092654_333377_BA3E714C 
X-CRM114-Status: UNSURE (   9.84  )
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

Enable GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS for RISC-V
so that RISC-V irqchips can support delayed irq mirgration in the
interrupt context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d4a7ca0388c0..adc878f029fb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -110,6 +110,8 @@ config RISCV
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
+	select GENERIC_PENDING_IRQ if SMP
+	select GENERIC_PENDING_IRQ_CHIPFLAGS if SMP
 	select GENERIC_PCI_IOMAP
 	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
-- 
2.43.0


