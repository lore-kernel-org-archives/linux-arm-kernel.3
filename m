Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94725C02199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+su7Pdf8Wu86Zcml4faTN2UwZ+oipeVYumq+PsYwErw=; b=bJG3pS+a9sz565u61gk7IP/VxY
	BwMu0/5pa22gB0qNBnvo+Nm3AP64Dx9j1+++h8BRngsSJf2tU9fREkioJ/owQHKUsTPQwhOGfsQzJ
	3EbOqBy/kZi65fgz0jzMUhOgU+6PEtVEqGni9HtRMx7MEszrChdSqU4nhvlK8VriObba9pW7LfYyi
	vLIrt+BUnslY/RnMm1CoOFZ3fJcgIDDqcZfXFphYkVdsKSMn5K55M4l16z7Lu5fdliGQPkHU8jBVf
	NvDiSLsNw6MOo8BcPy4eu3F1ZZCx3S7SQOB+NNilISGuLk/ePAE6ZKRvd63jRMtYju9hzzmxRtJ9Z
	Dg/ndEXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfj0W-000000043iw-1MfA;
	Wed, 05 Feb 2025 17:16:12 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhpP-00000003sx7-3pUq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 16:00:41 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2163dc5155fso124422445ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 08:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738771239; x=1739376039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+su7Pdf8Wu86Zcml4faTN2UwZ+oipeVYumq+PsYwErw=;
        b=PopthXk4VsAXJfXDKGFYACxrpK0atlNg386cfypxV4QUhp/WLCgFiGiuXuSMViWK5n
         SR+8c+82WGZENM/aBDhIE2QqusuIgqdPHJH9el16gQyPdIxckP2BDAx+R1tHob5PGN7C
         d+dM0RcuzbwD2X7169332QV3AUSSZHoQaKuEDyc1LclWvLQRzvczcY95UHQ6fX9qjteK
         Qgh9lAfmhDuEq5sxyVoO81iXsCITD/xXjltWmADmwpwwuBOdbA3yDdXQE0eCTHy0dwzm
         /DKRPDHh7S/Mk36yoGLxmpDQrfxv18fnjEutxMeMUX5Y7fNvrtZjgEC665qhYsp8HCUT
         go/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738771239; x=1739376039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+su7Pdf8Wu86Zcml4faTN2UwZ+oipeVYumq+PsYwErw=;
        b=j6/WKdhypBNyObFtxY07+AYSkHPRm1RVPuFctfROlrpUwLjfK34Ljo23T9fOc8FPUl
         5ZsgdKZKrfjhEdZscBqSHOCzZMeniumFnO6T54QbtKdGVEABoSU00n4aK8Tao9IIB9xc
         lchWTRN6iEOnackVWYTXw1+4BwfFBjO8fgwk32PqBm91rDquch1fVYSu/u0BumP34JZD
         huN/Y2QYp9yLQYzWbsOV7S+d+BrECj17W3yH1DwV7gUMRVJedAardcMOIXdCq/5IeF4v
         UHfrmpL1lYEeW/W6N2r1IvBGbx+s/wnEP40x2J3MuGKTVbYu40eBUzzu/DvXleX97UMl
         kuBQ==
X-Forwarded-Encrypted: i=1; AJvYcCURt+nKV6SMX7PtlPIn93XC9G5u+LdOeERl0QS0OD9PcpG0V0XNNRx2zOTBVoWU27K/ZrAken+kQiAIlFwHj6KS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9bmxzQp2K+clknq88FoqfzXV8pai2G+Ps23FVijCP+CsAKv8d
	TWwMDFDaklgZP455Ot9Z/lnVbl6+iCdImBVVU9tjHQUxbD9Tvsrvt9ho3ToOoCE=
X-Gm-Gg: ASbGncsYmOMOIYgqH4sNB2Z+lD49X3DVOXLx0Ym8/0Sg8u4bCJxF3We/rZ5ijPRmw/D
	VfE/MO7NfLFZDwFFwhA1DWdaWPy0HFmx+rP9fdGrN73ynCKAlqvkYv4vm5tgrVLkxRwmnAR8qH8
	T9IIImka3/5cxtcjoLdSBpUUyTYLm3nR78+AvCuS5VrUWrliIYx2A6LIj2UhdJYl72oxQCgWzX1
	QJ6glgljbcc99GV7ttskPjsSGfqyaW+QrOjutDfAy2R61rVUIeOU62N1qRvnSQP5CZyecTB/jyl
	SNhRRyOTf3c264pXAsadWW3iqxVb0tnJmbqf0edSyTbBKBqzsI14nmU=
X-Google-Smtp-Source: AGHT+IEJIosY/OKbXQSnforNF3833piSl8A3TJUvYoiwSYBBjf98+ctLM/SnWJ1Zo9+v0gmQgw/WRw==
X-Received: by 2002:a17:902:cf12:b0:215:8847:435c with SMTP id d9443c01a7336-21f17df09demr64343705ad.12.1738771239274;
        Wed, 05 Feb 2025 08:00:39 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21edddf883fsm99369015ad.4.2025.02.05.08.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:00:38 -0800 (PST)
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
Subject: [PATCH v4 06/11] genirq: Remove unused GENERIC_PENDING_IRQ_CHIPFLAGS kconfig option
Date: Wed,  5 Feb 2025 21:29:42 +0530
Message-ID: <20250205155948.81385-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205155948.81385-1-apatel@ventanamicro.com>
References: <20250205155948.81385-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_080039_961063_8C1A93A5 
X-CRM114-Status: GOOD (  10.04  )
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


