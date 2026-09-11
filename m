Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47329C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 03:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbMD56baPgM+e8xPeMNNZSCp/t9stBa6OwHW9SFOA28=; b=xK1tW5CejEXu5nvnWaj5BpXeHr
	yuzswGd2Ity/Q32tx0SHCyIffPjY2DNSBlw9INxAaGWI/REYMIlz+AcbarmknS0IZbL+b7bGHv335
	sqXFoeUMSnazx45zrjeJeT70bgT29nY82M19nD8L0+YkNUKKTDEXQgQOg6sZqTH2olnXRPwoqSupk
	SG5nN4P5cJZOkGNXfn9f7ZsQ5RlgjNSASer3SYHwsLWmIv2gHamGqLH1Vauo+5dYMExoKPeGMhokU
	Y2de3n/efIAqtiBcWHVwlgLE89XVVKt1403tOu0ifQhKvht/Kb17Cv7My43/Yi+WMPR8CxKWm+8x1
	b10mb0Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rvv-0000000Fl47-04gs;
	Fri, 11 Sep 2026 03:28:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rvt-0000000Fl2k-2V9t;
	Fri, 11 Sep 2026 03:28:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0390541724;
	Fri, 11 Sep 2026 03:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB181F000FF;
	Fri, 11 Sep 2026 03:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789097288;
	bh=QbMD56baPgM+e8xPeMNNZSCp/t9stBa6OwHW9SFOA28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=feUh0UZBssO51F57kDi2j/ZaL6ovAYwz5gkKITjjKUh0UlXjPERvne8pnMQ/QpT0U
	 oPsXx4uVqHTmf3eX8kkEtBqAYPgRGiOX8plVLwQLdoE4w2qpWbXd0c3C1FChmKHrzm
	 upH51A4XT7x2TmOdH623XueCJMkvtDqnf6koNB1scqwAbu1ylwL4RVtQFkC4SV0WcW
	 qHFD4uE8JKaIwQS5dtHxVGdA8NxRjO0pbWlEpV9PdoQR4E6vNCeUFVLKGGiC6UdJe0
	 B5Lr268ylvHEGQV1+szYoiLWXi4yPm+cM8SZUXT19AlyAH1ZebLVzplzmC5MrsTiEG
	 dc84KF0TWuwJQ==
From: Guo Ren <guoren@kernel.org>
Date: Fri, 11 Sep 2026 03:27:10 +0000
Subject: [PATCH v2 2/6] riscv: sbi: Use IPI_MAX for SBI IPI muxing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ipi_max-v2-2-a77826ff189e@kernel.org>
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
 linux-mediatek@lists.infradead.org, 
 "tip-bot2 for GUO Ren (XuanTie)" <tip-bot2@linutronix.de>, 
 "GUO Ren (XuanTie)" <guoren@kernel.org>
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

From: "tip-bot2 for GUO Ren (XuanTie)" <tip-bot2@linutronix.de>

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     2a0d49514f297baee259b19fb5553b538aa67d10
Gitweb:        https://git.kernel.org/tip/2a0d49514f297baee259b19fb5553b538aa67d10
Author:        GUO Ren (XuanTie) <guoren@kernel.org>
AuthorDate:    Sun, 16 Aug 2026 07:00:46
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 15:34:34 +02:00

riscv: sbi: Use IPI_MAX for SBI IPI muxing

Now that IPI_MAX is visible from <asm/smp.h>, replace the hard-coded
BITS_PER_BYTE with the proper symbolic constant in the SBI IPI
extension driver.

No functional change; IPI_MAX is still 8.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Anup Patel <anup@brainfault.org>
Link: https://patch.msgid.link/20260816070049.2097442-3-guoren@kernel.org
---
 arch/riscv/kernel/sbi-ipi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/sbi-ipi.c b/arch/riscv/kernel/sbi-ipi.c
index 0cc5559c08d8..eeec178a9b95 100644
--- a/arch/riscv/kernel/sbi-ipi.c
+++ b/arch/riscv/kernel/sbi-ipi.c
@@ -57,7 +57,7 @@ void __init sbi_ipi_init(void)
 		return;
 	}
 
-	virq = ipi_mux_create(BITS_PER_BYTE, sbi_send_ipi);
+	virq = ipi_mux_create(IPI_MAX, sbi_send_ipi);
 	if (virq <= 0) {
 		pr_err("unable to create muxed IPIs\n");
 		irq_dispose_mapping(sbi_ipi_virq);
@@ -75,7 +75,7 @@ void __init sbi_ipi_init(void)
 			  "irqchip/sbi-ipi:starting",
 			  sbi_ipi_starting_cpu, NULL);
 
-	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
+	riscv_ipi_set_virq_range(virq, IPI_MAX);
 	pr_info("providing IPIs using SBI IPI extension\n");
 
 	/*

-- 
2.43.0


