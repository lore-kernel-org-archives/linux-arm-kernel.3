Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B032C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 04:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+su7Pdf8Wu86Zcml4faTN2UwZ+oipeVYumq+PsYwErw=; b=KxJdNJdHWaH1Fxq1H5TDbcPnx3
	bML0BxWDQuw752ingPzYoMdjDy98HoDVV0VEGPk/FLz+QvERbOwaaIzmDqkgRxC4U2ai0N3si8X5O
	kJmCEn9RKxwPkwBCWptK3J/STUda08yARvpmTU4fCJgeLCAw9Di/9yZGhAg6/HZQZck54kpSdlst4
	6jFLL1/N9GwqVuyD1uMBg5j+6RJnzYFms29b6qoAZ3sb+uuQLt9VYwTgy6hBxPCx7Ws3DbUtpZk6H
	7cTFEK/yir2y+EKVKuYVKc0+aHoqT3JuIVQju02KlwUE9txSVIH1DZVB7IF3fosRDqnRR0/3Tq12J
	I0m09GKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyuV-0000000E4A9-1Y5Q;
	Sun, 09 Feb 2025 04:27:11 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgylh-0000000E2Uq-1zW3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 04:18:07 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2fa1d9fb990so4654471a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 20:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074685; x=1739679485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+su7Pdf8Wu86Zcml4faTN2UwZ+oipeVYumq+PsYwErw=;
        b=RyVhxtOk9yFTVa5fhH9FEoDTMNvWQ9pmZ45w9pGR8Pfa93CErKyNVQLdBwA2445bj7
         yAQ2kpr1hkVcMVRkHsn6+cGHFNX9ShC0KaxSH8U/tGv2HqZdtfIZwEaNB8zYXHaH3Gm2
         4hrhu5fIJN4/9aMLvCImleMkqs0bxjC5lPBucJjkdXki8lvw7kUKbpMsnFxDQauGVGDk
         EDGNhdqQWUSxqrXcvJdV7rC8Uum5aLEXP3QO/OT8hrsGoTFc9mHbvQ0BxIno5OqbnsqJ
         ryrKnjtoM47kQOjoX09qvXVTTOJJ11ONOovpC+x8PnPhx9/3wZt+2g6LI/7jwStLB9tF
         8Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074685; x=1739679485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+su7Pdf8Wu86Zcml4faTN2UwZ+oipeVYumq+PsYwErw=;
        b=J9guRItTR2V8kqwytnsqRVQtiU3OrT//GkiZevZQmMwjSHqEqybVcR8DYXo2oBMR6M
         a89jwK+HpO/+J+vKRkyVgRESlcYyQxUI6baa5tZL3xC//+3YZT4PTKXIzbWnREiNTzBr
         8JcU/br219AHr4Ed4LOksZxhfwtCGckweWcehEgR+0NbFNNpMDoJQ5hgZG/36LmG5SDy
         z1e/OG2MLP36KST5WmqQAK35TO+EV2H67I47Xwa41PCSjj0i5xydYTA+n1cR46eEdNzv
         uoUCV4i694XCR/VoWchqYl8M/j/WB2AVAGcCMvcIr30F7/goB7xn/F03mvwPaFhUTuXX
         /CIw==
X-Forwarded-Encrypted: i=1; AJvYcCUH50lyQ3E2LnTxDMHeUsDyqMYKnsrvjjX8DMgmnuZDml5jfBi0L56ZNlNujmkCVwWFJnJ6GiSJXS06ZczTnXCo@lists.infradead.org
X-Gm-Message-State: AOJu0YwdFat4uUXV81YV5N2EX5/KpJvGq76YBDZf2dJQB6ll2MaxIH/s
	MYyrJ95Y8MxRrn952t7GtXXWHGzWe6OKiUqtyVLKk/E0f4vX/lYFStP3QzT0kVs=
X-Gm-Gg: ASbGnctXdQvSZumtKgKe7VsZmDgsoc6ckt6ZW0rH9YpVKSWxKLAp+947+3YYAxKpjxQ
	XgxASW0Ep7sA8eDqTH9EZE+Gc9psJWjMtztqXWYNbmkddZcsHnCcd/GDMO12zZOdUyGhrfMyjYX
	T+KwwzlE/9zed/o3uLjqgVfoaDNKJvJpfbdiRTgiSjFFNOH9jePcnQbTmI+a642WJSgGMPo+BdG
	nGYfOuaZjA8UxdgYbt9bCqiT40loIVNmwEMiYaBMP0hlOcxNwUGtQ/r3g+dI4Y3w8L91x91OGny
	4RtegDWeHdsMpOqTz1rRzbJ0qptdGO0ZxV8FkGoDVyOxmtwJ/lT9gAU=
X-Google-Smtp-Source: AGHT+IHplK1Odn1krUBJui9aJ3bXui5w4fG7ychKlkG3JoJ8qZ1jCX3WfSDt+grELpA1vaZRwG2+1g==
X-Received: by 2002:a05:6a00:178c:b0:730:8a5b:6e61 with SMTP id d2e1a72fcca58-7308a5b7c17mr217952b3a.2.1739074684846;
        Sat, 08 Feb 2025 20:18:04 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:18:04 -0800 (PST)
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
Subject: [PATCH v5 06/11] genirq: Remove unused GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option
Date: Sun,  9 Feb 2025 09:46:50 +0530
Message-ID: <20250209041655.331470-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_201805_685007_C2329833 
X-CRM114-Status: UNSURE (   9.99  )
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

The GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option is no used anywhere
hence remove it.

Fixes: f94a18249b7f ("genirq: Remove IRQ_MOVE_PCNTXT and related code")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 kernel/irq/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 5432418c0fea..875f25ed6f71 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -31,10 +31,6 @@ config GENERIC_IRQ_EFFECTIVE_AFF_MASK
 config GENERIC_PENDING_IRQ
 	bool
 
-# Deduce delayed migration from top-level interrupt chip flags
-config GENERIC_PENDING_IRQ_CHIPFLAGS
-	bool
-
 # Support for generic irq migrating off cpu before the cpu is offline.
 config GENERIC_IRQ_MIGRATION
 	bool
-- 
2.43.0


