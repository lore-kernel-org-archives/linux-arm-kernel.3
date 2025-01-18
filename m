Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161A6C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 16:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lBcCkYZGqUKu3cSA3W2Zh/4n8iTPp48ifQZWMJrBSVA=; b=aocucFhQjde9C+TgGMbt2psazz
	Y1v6lsT6gyCFln9ihmzMq79meL+4Ve4Lnh51GMCXJQGS4BhY9srMIB/GGk0b3TXDheJG506qv6ldQ
	IyC/wWUPFg3QXbx2j/QPARzCMi92LpH4vadL3ka3MaA7NRCeT5jg7fESS+6wZTNGI4vmBxged7z1N
	oNlf82mUUH4wnBZnvLvZw6RyYkA1Bpwa59UKZi+ipXjXY20medAyVPxOJ9VQDuphUwznh18SGpSIH
	kT834kFC0EMm70YvduptgDfXSp8+zedtCLI2jJLwQOZhkpgrllVZuGdVM/5/TL9zocxRHeZIMGucE
	+N+1xkbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBpL-00000002iqd-3Yst;
	Sat, 18 Jan 2025 16:37:39 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBo4-00000002imN-1iWn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 16:36:21 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so4140808a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 08:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737218179; x=1737822979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lBcCkYZGqUKu3cSA3W2Zh/4n8iTPp48ifQZWMJrBSVA=;
        b=Svi81kLbAy2bSnm3ifrzC/feSGKx5jfI6DmG8cgTTFpRdkhGQET7VdyZQ7u0jJaJ6e
         MQF3pcXCMe859rtG5dwuS3K1t8sSr9FyE89VJZZ3pINJgDgFopitglht4M74zt2hX5uy
         YySmpERh0+aazv00mrZbk/zKusJXG0CmWOq1P6A0pzvwOAmC+yZ3Cgmklv/EPRYnMyuK
         hBpf+o6OIHDppHIOz5v72I4kzpa/2RH5biuqoV4fPCE9gc5j5xvr82tOX6VEeqrs2NDi
         LN6tr1k3g5fnFvFb9G2Zm/SutTdyo88dVtMCWLuuK4xszNthuDDp02sWTy28Cjw4y+tm
         NI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737218179; x=1737822979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBcCkYZGqUKu3cSA3W2Zh/4n8iTPp48ifQZWMJrBSVA=;
        b=hs0jOkuEhPduzq1hVPPO+Vp4J/NRrT6NRKDOEmpqIxzAskCKJgHlUxj0PQqnYbIIhZ
         clQBN1SPNjHE1UYmZiAM2MesY0VM98aa0diJzztJbp0CkcenHm2rvsPPY2zry+jN1jmA
         TdsFET+/qQv6YL3y3RvZD5WmHqMBe5xQ2/PTMHMCaQcxFRPJtqc26bYMuurU3PEJpJ2N
         Eg0ixUd+222stO0D4AfUHtc4jvWZ3YyYLpkKQxdoagPVsK50n2jcRiVBJyNK1z0kab3i
         iQ3U+51g/vyv7l03xPuAyglK2c3Z/35y7L/jsJFwU01WhOtBF6ZfMb5oidPKZZe1inep
         +wJw==
X-Forwarded-Encrypted: i=1; AJvYcCX/hE8zyNs1mcYOgQtinyD4n3jCgIRtcVltzEWZnqLuwdclpIojTWA+Hip3LuwYLuBF0aiDBqgDQVUCIso0D9Me@lists.infradead.org
X-Gm-Message-State: AOJu0YyCtt5mHEY8lSg3vfBMjhW8xj+Rc9+pDnr7qNEvDnRW7Lne4UkA
	SajC1c443ZzCAwvIXIw4EnJYVCvqROoRS4I4owJe57joJFAxMwwT
X-Gm-Gg: ASbGncsNS/P6t1L+lRsfNzYoN9d232jKTmZMZvc4IHnxejLJwuhjt3mKmdHIzioGemx
	eUAXCESl+u5LAmzsMgl+WAQhfJeYJGV7eLqfnIzi1GwU7NyZm0r65l4L4feGyKAS9j4YGorHA/a
	16r+Y+j75P5tTUtUzDsygNO1dHlypEiENEly+JLg4ALKbh6tZnvFk70bVkHHPU6Du4cHHKnLaAU
	8K6e4ZS7rhyT98GmJf53BgmfswWZpGhLKQZM8JhjN9N/HP7Ry48ONfDs5jAq9/+DLOUJV4=
X-Google-Smtp-Source: AGHT+IFIC6xQyN0czHlq14fUPCGSYmLyGoA8mjgv2tG6wO4ESEzTfyUD4RwRKSlW4dbm9htceT7Hgw==
X-Received: by 2002:a17:90b:270c:b0:2ee:8031:cdbc with SMTP id 98e67ed59e1d1-2f782d2c9a1mr8501141a91.23.1737218179378;
        Sat, 18 Jan 2025 08:36:19 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f72c2bae59sm8156962a91.30.2025.01.18.08.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 08:36:18 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] irqchip/apple-aic: Only handle PMC interrupt as FIQ when configured to fire FIQ
Date: Sun, 19 Jan 2025 00:31:42 +0800
Message-ID: <20250118163554.16733-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_083620_446835_7CE0723E 
X-CRM114-Status: GOOD (  12.27  )
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

The CPU PMU in Apple SoCs can be configured to fire its interrupt in one
of several ways, and since Apple A11 one of the method is FIQ. Only handle
the PMC interrupt as a FIQ when the CPU PMU has been configured to fire
FIQs.

Cc: stable@vger.kernel.org
Fixes: c7708816c944 ("irqchip/apple-aic: Wire PMU interrupts")
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---

Changes in v2:
Fix the conditional to have the intented behavior of evaluating to true
only when both PMCR0_IMODE is PMCR0_IMODE_FIQ and PMCR0_IACT is set by
reverting the conditional to how it is before c7708816c944.

Link to v1: https://lore.kernel.org/asahi/20250117170227.45243-1-towinchenmi@gmail.com/T

- Nick Chan


 drivers/irqchip/irq-apple-aic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index da5250f0155c..2b1684c60e3c 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -577,7 +577,8 @@ static void __exception_irq_entry aic_handle_fiq(struct pt_regs *regs)
 						  AIC_FIQ_HWIRQ(AIC_TMR_EL02_VIRT));
 	}
 
-	if (read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) & PMCR0_IACT) {
+	if ((read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) & (PMCR0_IMODE | PMCR0_IACT)) ==
+			(FIELD_PREP(PMCR0_IMODE, PMCR0_IMODE_FIQ) | PMCR0_IACT)) {
 		int irq;
 		if (cpumask_test_cpu(smp_processor_id(),
 				     &aic_irqc->fiq_aff[AIC_CPU_PMU_P]->aff))

base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.48.1


