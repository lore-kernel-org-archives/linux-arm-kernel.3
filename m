Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6ADC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 08:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XpbAvyCPU7XjesnTrNMuPwq8s0Ofi62LAN8USKi2As=; b=GMHM0d4x5An4cNvcz9bp1g/m/A
	5Xn5MtZ/9K8QMstzfx7jX6K91kBAuZFqtYRS03DJL3uKE6A/MK5vcBGQ0y76/nwXU6ow/0/Jglgwf
	V9bK1w/mpHycNDYRAoNN6S/tLX+1OPedzAmEgxk9GcAq3mTS0oP18eDCTT8KpP4wsHfO/L9+PRZ2n
	+PQXup/zCxJESwpAosx3rl0roDNaDRR6OkQlBol+lz8lSCPSb8RZbNWUfo+A6YyjLn8KuxDK5ZbC1
	mGCM6/1P8RelaSBhpHk3b0JMFN3KilhO2nQ25lU4t0OzyDUEmkyxX9dd+R1cq49dMadeVJc7Hv0XF
	NSRPDeWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDrE-0000000HTsm-2OY5;
	Tue, 04 Feb 2025 08:00:32 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDll-0000000HShZ-0u2u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 07:54:54 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7b6edb82f85so781530985a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 23:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655692; x=1739260492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XpbAvyCPU7XjesnTrNMuPwq8s0Ofi62LAN8USKi2As=;
        b=EdQSY7Li/3xErwyTKc5KPO1Hj882zI46VS6rdyOThYd+KcqT/+TSjk2tx0Z0kq78AK
         jhYeO2jM8vyGUXBnFt+PJQYsgGFzkAHjDRRdiwfHk+E3apCS6Jz4+Ri46EzGK0ndJNfT
         xW6kfj75fyTWJqypzFm7glZuuYRKue3nFeePEMsL1oEQXQPau7wZ9Kjn+HuWVIbDqRH7
         85o1Q7hNP/sTRBiMLIjNI0HQp9sj3jcXdYDNIKhCkcYSbGZUNYJ9ZUou1LFU27d0KD6B
         CsG7kVhuBE+S4T2qKD9QbNyLf2ubweD5trnPww89O99Yu+TkVumIfXEFGwPFvBh6H8EV
         /zOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655692; x=1739260492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XpbAvyCPU7XjesnTrNMuPwq8s0Ofi62LAN8USKi2As=;
        b=xDCsuEScirjA56sWhiHRFN/5966oItpPSR2JkMTE49RMIWtRFSMjtiSmh5Rp9Tq9+/
         MDwS6Wu/pGkZtRyN9Kk2y4bKVtXN5cYcKjUdC0jjKu0sImzvKcj0zPFpwNEFs3ipZrjp
         4S7btwSpM8r6XAC20THhIWTr2DpzwBBp8ILda5gpPm9xxHIcjggSc6wRsHwFbFO8JUpO
         357nScXWsIHrEd6xhF+NULxQs4IhndD+pUiGwNBXWgzyEkneeVbAUYgR4Sv4ODOKF+gA
         MwK11cl1Ia4ayemFL/kLQD42pWm9/26KVhZpes5u6wZaChrfuHmpHx8/t8NzaLxqY3Oi
         vmwg==
X-Forwarded-Encrypted: i=1; AJvYcCVssyFMCzSrmWil9NqCeY0D7Wv9PSupNc3S8TcExXLP2NGMw1jnxx7gr91rrqPyI5KGxDgQn6ZD4oYTfCf9nQUk@lists.infradead.org
X-Gm-Message-State: AOJu0YxsJdDoTbZ/0iwcoC5f5hCHciAZ9HOr3v2Ejxl45hnj6RYsOIwy
	qdmcMkE3YkF9c/qZHbCfRLSwjimFbrlfifXbVq4AsahMoivlXTTd/3gPPBWxDLE=
X-Gm-Gg: ASbGnctk1lHVKXpjdgDQUr7xzMTwySTqZNhm5bUQwe6fkZAD5NXzBxJstkOxzZY9MMD
	YziMxK0vf/9dpXA7zPkO6tKSFn9wf70trFDwAvvF2NmKRuRzqN1ok2Dal74zNBnjlMTAwsy1OeU
	8KkvxKJFl2VaeyNbyjr6HWqi/A4UAEp4un+e1K9WaBTCEdwyz8otXg1E7WGvSH7xLmFeyAkBgmX
	tcux8AOv/QP8NILXWiryhUEqHzWo0q7fDd3wFly/cTxZzWH/yfFgH/SwreulhKC6agdyLoO/X0N
	o6v1Brx6OSnq0K6tGZQML9SEVvdy3D1F+yqM7aS6uztV8zjHhlQCBMY=
X-Google-Smtp-Source: AGHT+IE555JYDjxayJP3hHqE1TDj1cVPpWMaeaM/3WguRaZQLIT7OdX0Wc2dai4BACH0ZbT7vjefxQ==
X-Received: by 2002:a05:620a:8395:b0:7b6:6e59:2864 with SMTP id af79cd13be357-7bffcd726edmr3656909985a.43.1738655691894;
        Mon, 03 Feb 2025 23:54:51 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:54:51 -0800 (PST)
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
Subject: [PATCH v3 03/10] irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base
Date: Tue,  4 Feb 2025 13:23:58 +0530
Message-ID: <20250204075405.824721-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_235453_278182_2D6C185B 
X-CRM114-Status: GOOD (  15.21  )
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
 drivers/irqchip/irq-riscv-imsic-platform.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index b44eb0b3990b..dc6f63f657e4 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -96,10 +96,9 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 				  bool force)
 {
 	struct imsic_vector *old_vec, *new_vec;
-	struct irq_data *pd = d->parent_data;
 	struct imsic_vector tmp_vec;
 
-	old_vec = irq_data_get_irq_chip_data(pd);
+	old_vec = irq_data_get_irq_chip_data(d);
 	if (WARN_ON(!old_vec))
 		return -ENOENT;
 
@@ -139,17 +138,17 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		tmp_vec.local_id = new_vec->local_id;
 
 		/* Point device to the temporary vector */
-		imsic_msi_update_msg(d, &tmp_vec);
+		imsic_msi_update_msg(irq_get_irq_data(d->irq), &tmp_vec);
 	}
 
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
@@ -162,6 +161,9 @@ static struct irq_chip imsic_irq_base_chip = {
 	.name			= "IMSIC",
 	.irq_mask		= imsic_irq_mask,
 	.irq_unmask		= imsic_irq_unmask,
+#ifdef CONFIG_SMP
+	.irq_set_affinity	= imsic_irq_set_affinity,
+#endif
 	.irq_retrigger		= imsic_irq_retrigger,
 	.irq_compose_msi_msg	= imsic_irq_compose_msg,
 	.flags			= IRQCHIP_SKIP_SET_WAKE |
@@ -272,7 +274,7 @@ static bool imsic_init_dev_msi_info(struct device *dev,
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


