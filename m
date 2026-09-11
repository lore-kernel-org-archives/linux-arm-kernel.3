Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BA2C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 03:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2A7ZXlaUgzKlIRf43CRGlNeTsk8uPGumps0WoOKIcXc=; b=v9BqEQtSxDrEqZlE6nWb3IqpO3
	GSsB91Pbe9CTU+rc0h7RlNZGYEpiAMlGZf9sQb0RQdd28sCJjRm5MQmVPl1+9nbKA/jV6HQdiv/kA
	jfvpA/U8HLpmky+tdxBNcSnDNxLAJlExqhoiKgLCMBW2FSpesgaL2VLmtR7MMaCZZvgKMo73LH353
	p1Hymj56/1MXMuU8byekgxfwjgedheWxPEtt5d/p2MmZRonNuEZd7OnEnAaUF1jBq75vBem03pc/4
	/wGDw8sNKzKNrZUpCYKQGvlEIv+7xFUFhNHzWTvR3RZBjeepcZr5NTgDh0I+0CU77vsni2M72/4+u
	Y2nFMawQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rw6-0000000FlHw-2Hth;
	Fri, 11 Sep 2026 03:28:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rw5-0000000FlGR-0pdt;
	Fri, 11 Sep 2026 03:28:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A02FA601F0;
	Fri, 11 Sep 2026 03:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF6A1F00899;
	Fri, 11 Sep 2026 03:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789097300;
	bh=2A7ZXlaUgzKlIRf43CRGlNeTsk8uPGumps0WoOKIcXc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MuyGIa+L/7cRt+s9yK++OGfB5nWowDjYEv1WlWuvCKsgNWQptCipSm14Izdt6MC44
	 grmDwu0q2rrcHBigQ50y3j2QnUciLRSgV+xV4+N+HHLeTvz93vGTIUuENqTcr3DWXp
	 T/m88xKj/K/GHQQpaTnDH4HJ0dWbCC1BSIHrM6LIpKVERDQMQnWHgHCcCzLEwVQPm9
	 prwZ5cRFWxgzvHrYATZv6clkE82Cj/q7GUish2stIk4jOwiSiEN+TRGVCIR7hbpdT1
	 +esHCjSrskLUiRyY/LLVcYTQQagknazLYF1ApB+n5khIhE8fviQ/4DRmWoo8hN09QF
	 HG5HVnk7OkGVw==
From: "GUO Ren (XuanTie)" <guoren@kernel.org>
Date: Fri, 11 Sep 2026 03:27:12 +0000
Subject: [PATCH v2 4/6] irqchip/aclint-sswi: Use IPI_MAX for IPI muxing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ipi_max-v2-4-a77826ff189e@kernel.org>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
In-Reply-To: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Anup Patel <anup@brainfault.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, "GUO Ren (XuanTie)" <guoren@kernel.org>
X-Mailer: b4 0.16.0
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

Replace the hard-coded BITS_PER_BYTE with IPI_MAX now that the constant
is exported from riscv asm/smp.h.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 drivers/irqchip/irq-aclint-sswi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index ca06efd86fa1..5e010fc401f7 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -138,7 +138,7 @@ static int __init aclint_sswi_probe(struct fwnode_handle *fwnode)
 	}
 
 	/* Register SSWI irq and handler */
-	virq = ipi_mux_create(BITS_PER_BYTE, aclint_sswi_ipi_send);
+	virq = ipi_mux_create(IPI_MAX, aclint_sswi_ipi_send);
 	if (virq <= 0) {
 		pr_err("unable to create muxed IPIs\n");
 		irq_dispose_mapping(sswi_ipi_virq);
@@ -152,7 +152,7 @@ static int __init aclint_sswi_probe(struct fwnode_handle *fwnode)
 			  aclint_sswi_starting_cpu,
 			  aclint_sswi_dying_cpu);
 
-	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
+	riscv_ipi_set_virq_range(virq, IPI_MAX);
 
 	return 0;
 }

-- 
2.43.0


