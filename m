Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A5BC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 04:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvFsqgBHoepkWBjGC1yP+KOn/8qryanxa+3zb4U83Ao=; b=sIoRVCvSAmu2oi0qiWhceHEbpP
	3Bn0E7qICAY1y0mb+QnBgT2T0StCQtZ7GJquqZq8zAdLoj6BPlGrCRGxCNRiKZ+yzav6j0b9SisRZ
	ABeZapSShWfB+eqKRATnX+yeUwR9Ve9UCRAuZkZzHQkqhw8XkWp7g2+WPX2hMeCUMTD4Ehq3VdanG
	ypLPHfVyRmOaYhTwTxidUnNWHvtg9BSt2iT8Ap5+6GxhYE6KNkECqT7QlLXY0ay1BffTWtZnvIUl2
	2O/XoBXiEcDn4lMBTVyHuZw+vnAag30MNDzIM4Hnuk9HKSz9oIHB7bniVRxRYZ3QjRVGidQxf4gUK
	//v85Jvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgynf-0000000E33D-3YUm;
	Sun, 09 Feb 2025 04:20:07 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyl1-0000000E2H1-0IJn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 04:17:24 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2f9ba87f5d4so4708276a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 20:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739074642; x=1739679442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvFsqgBHoepkWBjGC1yP+KOn/8qryanxa+3zb4U83Ao=;
        b=ZhA1QhQF6RbBN70YHFPxplw9pQyOyDyCcHQUzrRG1Zq75CgTyYW7SIi/4ql2bVxHc9
         jBoStP4eaHWs39I/UVCQtuQVNIHnrMIOUTfsL0iGE8lBnYq7fIsttOQVVrsFLLSEt1bf
         KGu4NDFdsC74RMNu7SlzW3FKdShCpytmvU0pvTje0gLo5cYALvN/dbmT4NI4RMlv+M7g
         Cg8Ua81FkQRUIOAVcBeCIzIryR3yIVzOO+HIaQg9T7oYh6Up8PK1jghvoU7GgPIL2ECL
         xGStANAxnPwh5obYJy2QW/6rhrCJn0ueL1Ug6TsQYM2ieVyR3U3ymgowu1n4cEXAgtgB
         uedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739074642; x=1739679442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvFsqgBHoepkWBjGC1yP+KOn/8qryanxa+3zb4U83Ao=;
        b=BsXjScLQimpIb9bzBlLke8uce3g1G0pWwMeKvfR7xu5aNM+uHsKnc62Lk7C5jEyxYG
         ASftuf35zp1ZLEeiIhLpBJIYrVNLoa4NW2FnvPiVthcRmnXVejRsoGNG8Zxr/EfJRNaz
         1PTsXXZWjdcgIyqncAQGtjumyZCj2aMQMbtq+J9Nlp6DHBQpAZI8k60B5EFH4hOYzBxi
         aLcZigoXuiEl00UZaxCgQyuq7U5KpRVYVu4uo7ZS/12uwJZrSTsvyTOI2AhbKcL6oMW7
         NwbqhkASOeQZ+WcwR96U299qBWJ1+WHOVu8adI/X0sjrJlxQDyXE+X2af5Jo43+amvFO
         rgJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqWa5+roFlJr2JR0vh3KGNbPc8y9p6wBZD62ld9vKYd07T1oM5pKkvcEcVQuhcgAU4ebL15Oc+gAU+1O4SK0xl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy74V2Q+gLIq1urtU00o8giwLS2wVsPj+2Hh8U6dYsTbibM1yAl
	ic1eiiE9/kFAWIORHIyczcVxNlz+CzFhPEuhi7PGmoI9qvKWUztY6Q/QNlBsyho=
X-Gm-Gg: ASbGnctqo2MV8jgykRQNBPnKNTayw2zMzCmavMs5kchKLX7p6ePovuFyNx1R4l0X9U9
	eXxMRgRk4J/1geKUftS++mBvTSprNh/+WD8QenWuFIg2ptoJI73+jHHu4ItWtLO6MFXh+HpwjqL
	egmsZLOOhlbpAuz+am8cpfLWoqmHvC5s2IWlxL08IsqeuTSWs9ooss3cZQbQOxFvV0Yh4PJvll8
	lC+gIe26Q7lR+4RPJUYWHfVYJC/E0Gzyr+b8bL0LzWQzh4XoI1aLhryCTYBKFY9vHWPobBjgHZm
	B1B8SmgZm+NkKZ0lABq51ZnmHF+H0ucqufpKMznegSDlMXteGIWvBoU=
X-Google-Smtp-Source: AGHT+IHRXdIPs1mvVVeCpBykzAl+ifFcG5qlvMFYrTkFKgREylWnQV7fAuN/+eShJoWgxmV452gK/Q==
X-Received: by 2002:a05:6a00:b41:b0:730:8a0a:9f06 with SMTP id d2e1a72fcca58-7308a0aad32mr287596b3a.16.1739074642169;
        Sat, 08 Feb 2025 20:17:22 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73073eba116sm1898410b3a.124.2025.02.08.20.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 20:17:21 -0800 (PST)
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
Subject: [PATCH v5 01/11] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Sun,  9 Feb 2025 09:46:45 +0530
Message-ID: <20250209041655.331470-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250209041655.331470-1-apatel@ventanamicro.com>
References: <20250209041655.331470-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_201723_172926_F0FE36B4 
X-CRM114-Status: GOOD (  14.18  )
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

From: Andrew Jones <ajones@ventanamicro.com>

Instead of using imsic_irq_set_affinity() for leaf MSI domains,
use imsic_irq_set_affinity() for the non-leaf IMSIC base domain
and use irq_chip_set_affinity_parent() for leaf MSI domains.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index c708780e8760..5d7c30ad8855 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -96,9 +96,8 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 				  bool force)
 {
 	struct imsic_vector *old_vec, *new_vec;
-	struct irq_data *pd = d->parent_data;
 
-	old_vec = irq_data_get_irq_chip_data(pd);
+	old_vec = irq_data_get_irq_chip_data(d);
 	if (WARN_ON(!old_vec))
 		return -ENOENT;
 
@@ -116,13 +115,13 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		return -ENOSPC;
 
 	/* Point device to the new vector */
-	imsic_msi_update_msg(d, new_vec);
+	imsic_msi_update_msg(irq_get_irq_data(d->irq), new_vec);
 
 	/* Update irq descriptors with the new vector */
-	pd->chip_data = new_vec;
+	d->chip_data = new_vec;
 
-	/* Update effective affinity of parent irq data */
-	irq_data_update_effective_affinity(pd, cpumask_of(new_vec->cpu));
+	/* Update effective affinity */
+	irq_data_update_effective_affinity(d, cpumask_of(new_vec->cpu));
 
 	/* Move state of the old vector to the new vector */
 	imsic_vector_move(old_vec, new_vec);
@@ -135,6 +134,9 @@ static struct irq_chip imsic_irq_base_chip = {
 	.name			= "IMSIC",
 	.irq_mask		= imsic_irq_mask,
 	.irq_unmask		= imsic_irq_unmask,
+#ifdef CONFIG_SMP
+	.irq_set_affinity	= imsic_irq_set_affinity,
+#endif
 	.irq_retrigger		= imsic_irq_retrigger,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
 	.flags			= IRQCHIP_SKIP_SET_WAKE |
@@ -245,7 +247,7 @@ static bool imsic_init_dev_msi_info(struct device *dev,
 		if (WARN_ON_ONCE(domain != real_parent))
 			return false;
 #ifdef CONFIG_SMP
-		info->chip->irq_set_affinity = imsic_irq_set_affinity;
+		info->chip->irq_set_affinity = irq_chip_set_affinity_parent;
 #endif
 		break;
 	default:
-- 
2.43.0


