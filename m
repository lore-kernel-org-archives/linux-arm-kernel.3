Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2214E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 15:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5vk6+7Zp7POqWSiiv1DSP428bWeQZRwfTw6RhTWCJyw=; b=ui7atOrMLPABRCC8wICZeuFx0p
	V6G4V5lPAzVkdt727g/1yPhsZqvIwsiVWZJtXJ5cj2C4VjDK4Q0Yfu5rUkcN3PzwsrO6en95ji/7p
	yxcdunhZfzvD2Q3tGYBLdqEN+CkM+YrEGY6pi2qtDlB0j8ozDGpZFVvyLLNOQLL+8C/Wl1WcSt8pF
	jP6N6suc7xpsQ1rusomqM4XcRfZZAWG19/Dse7LzSpj8tWrvMnoK26RA6eZMCJt2KoRD5lmsoYKjz
	DCW0VvmNMKy4A+PPd+PrFins3l48NRpJ/7oQmqXyTDEYvt75g0lneudgSln4DEbPIgvEgsLk1d4Ea
	ueieN2Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuea-0000000CVu6-2Txx;
	Thu, 09 Jan 2025 15:41:00 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVudM-0000000CVhp-2XjT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 15:39:45 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aaee0b309adso183703566b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 07:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736437182; x=1737041982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5vk6+7Zp7POqWSiiv1DSP428bWeQZRwfTw6RhTWCJyw=;
        b=OQVopmiqEVzOH1AB9bop/n596Pagj/tjtnLWWCDYIdhpAVuHvbOXx3bO52eJyQYbvP
         JiQaTn892eQadCwMbVf1zijhNuGLQW8adBkFEjjgWkSmPr/0mXvCUpeAG9QpvxOefyzC
         h/U790U6ebkK9xLXZD0LCven9HLFRanjU/675VsbftVTc56TO1oGgCXwzIcWhNpb81Qg
         IcKcJ4nHNKQdMkXEsRaToD0rzJmG0rUiKksU4eyEQTR/f2JCoc56lC+aI7TJlTrAce2n
         l915/79Sf/zUJ6kjIgPQshxl71kqxdmLmrCZTJFKnpjNBXp7/T7Fc98o/iPyaP679CgK
         i98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437182; x=1737041982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vk6+7Zp7POqWSiiv1DSP428bWeQZRwfTw6RhTWCJyw=;
        b=tKNWZpnEBdPVWUsB4pJiOmQqOKoOxzy80T5epw9O9CUGGX1hrYeZYg6zSMblFiNbQ9
         ioTGPLkxH/7FMaLSMAkEFA/dyjCTz6KU3AtUdDdm/D41Lp4YngSkxe1zJiItyxY+uUKw
         UFVdGgSN/G/U/q7lg54nBRBS1i9Z4UPn4OhFjrb+j8l9CiNJHiFgvrraTjvLCuENDfEc
         +cNzgH/+V87woZLbYIAuzlJmfMGnH0Asv+ZsHJVZPv43hqPNOw2KMcU5JSGOoge1F/uN
         lewvd+jYGBCgMJuJzFMvClsDx97Bds7tX9+uzXLO/G8Kc/nnLOxzh2wg3gqCRceOyE26
         8r5g==
X-Forwarded-Encrypted: i=1; AJvYcCUfG4fc/ONKuZD3aUQ2Cb8c4NT3ZIq6QpxEArmAaMMkl0XOPyC8ZhZQPh3ZBJYwSGmJ2VjIUl4HREzjHaSrzWO7@lists.infradead.org
X-Gm-Message-State: AOJu0YzIR20RTpVN+3tLNnxcfFlopS808EJQr19PkcGM+Oko2V2OPnHQ
	1cp9aSTpc5eBjuTnCzDPe3kdOkcJG5BOtC/7DxKHIwYQcxwihdj4
X-Gm-Gg: ASbGnctthBl6OKFH7WFcJYZ8vVAJaJecqPnrErxvqSswF/TLPitbeLS59mG+A4ispxJ
	d+nnqsWYb97yaIKY3i5NyNs0Sr8POFIIhCQCTJFoaJTC9XCpE5y0mQ5cyZ3JKsVnCPknyvYCqLU
	GGuUUA+6wjkqcQBB/7JtBrRaV8WdzIz9rYmcjC5VhfgZQHBhv1Of6AW7fE4NCItRDIYUYSJuEcC
	50sb1CHPN1iI2FRvAStDw6QLTaLXvhFoGPXCaDp3or/jbzYovbxgNPD7a2YOTLxJ+SjTIskmhdu
	n5YaMhu+bs1r7vIioToYFUkMIZU/yfCITZ5WFWYg3Bc=
X-Google-Smtp-Source: AGHT+IFj2+tODvSpYPQKL+ViJ0DL//Q+lzKHKCCuLpU5rxscBjkzMHzjJznmcSvRpQo5DVH64bosjg==
X-Received: by 2002:a17:907:787:b0:aae:849f:3255 with SMTP id a640c23a62f3a-ab2ab709e27mr618538166b.34.1736437181824;
        Thu, 09 Jan 2025 07:39:41 -0800 (PST)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95aee31sm82176466b.133.2025.01.09.07.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:39:41 -0800 (PST)
From: Philippe Simons <simons.philippe@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org (open list:IRQCHIP DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support)
Cc: Philippe Simons <simons.philippe@gmail.com>
Subject: [PATCH] irqchip/sunxi-nmi: add missing flag
Date: Thu,  9 Jan 2025 16:39:35 +0100
Message-ID: <20250109153936.1908044-1-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_073944_649408_5767C431 
X-CRM114-Status: GOOD (  11.88  )
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

AXP717 has a PEK to wake up the device from sleep
AXP717 is on the NMI irq pin
add IRQCHIP_SKIP_SET_WAKE flag is required to enable wakeup from the suspend
---
 drivers/irqchip/irq-sunxi-nmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-nmi.c
index bb92fd85e..3e87ca724 100644
--- a/drivers/irqchip/irq-sunxi-nmi.c
+++ b/drivers/irqchip/irq-sunxi-nmi.c
@@ -186,7 +186,8 @@ static int __init sunxi_sc_nmi_irq_init(struct device_node *node,
 	gc->chip_types[0].chip.irq_unmask	= irq_gc_mask_set_bit;
 	gc->chip_types[0].chip.irq_eoi		= irq_gc_ack_set_bit;
 	gc->chip_types[0].chip.irq_set_type	= sunxi_sc_nmi_set_type;
-	gc->chip_types[0].chip.flags		= IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED;
+	gc->chip_types[0].chip.flags		= IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED
+		| IRQCHIP_SKIP_SET_WAKE;
 	gc->chip_types[0].regs.ack		= reg_offs->pend;
 	gc->chip_types[0].regs.mask		= reg_offs->enable;
 	gc->chip_types[0].regs.type		= reg_offs->ctrl;
-- 
2.47.1


