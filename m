Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741F2C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 03:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+YGz+V8i2Tas85KJKYFj/ybAdrkKvSaeyZci6zxQyQQ=; b=Yfu/pHePf5znfrnfzlGeZBFJV4
	hNkzNe8e/o1nA69N3fLa+h8pr/DKE64Xc2rr5KJxmYevFt/0yyG3K9lZWid9mDADrR+StwBw0smry
	S0KQpLKrMWtRdBcFYq5EgALiis2Jg49R5SK8UCC06HIaAnLvPoRqRCxXYYVKWMxRL5hXUGYCEiOYv
	aGaNnGJNzSMz0Lir1Rm/TmetAnIMpqAgyCv54x2H8sp9fKt5XRoNarey9hQfP8USamKbSZeon1RWn
	ViLpT7yCRx4Sv//w7UC8sClDKN9CtfsxuQZTMF4N4bUoIAKE3Zi+PrtplPZwSBBD9aegMyNepbPgk
	0MlKoIaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rvz-0000000Fl9U-19cI;
	Fri, 11 Sep 2026 03:28:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rvy-0000000Fl8Z-1egW;
	Fri, 11 Sep 2026 03:28:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2641541724;
	Fri, 11 Sep 2026 03:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590191F00893;
	Fri, 11 Sep 2026 03:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789097294;
	bh=+YGz+V8i2Tas85KJKYFj/ybAdrkKvSaeyZci6zxQyQQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HFNmoNtOHiD/49OInUi9e/bZQ1UbPM0ExRcVg9AKDluhZRnAG1dDxIba74yMLwGDS
	 IX2A4YA3Af+gCFmT60GN5cFBQkX5Ts2SffqmqcPEuS2a1SkwVQ7mRtrzS/wv44sDVS
	 pmQ1XiHuopOGzAVwhW6g1JWvDrbhQHPqo8rBDtOvJZi9LT8iVK+Ee7/q2b83gKIbLw
	 BzGzFn8lm05/31D/jwodF6Ef5ZCFD7Uh/w69XLF87atZ5JprmfKRcKE+Q/F/NgZ5jn
	 veTzZBnvvOkLdoDYuWyX50x1UlJOhTGXQ/t9IQv5vXuKCHsuVl0mXLCtUs8Le1Lkq8
	 KRehITOdW5YEw==
From: "GUO Ren (XuanTie)" <guoren@kernel.org>
Date: Fri, 11 Sep 2026 03:27:11 +0000
Subject: [PATCH v2 3/6] clocksource: clint: Use IPI_MAX for IPI muxing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ipi_max-v2-3-a77826ff189e@kernel.org>
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

Replace the hard-coded BITS_PER_BYTE with IPI_MAX now that the
constant is exported from riscv asm/smp.h.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 drivers/clocksource/timer-clint.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 0bdd9d7ec545..e56eee7e3781 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -243,7 +243,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
 	}
 
 #ifdef CONFIG_SMP
-	rc = ipi_mux_create(BITS_PER_BYTE, clint_send_ipi);
+	rc = ipi_mux_create(IPI_MAX, clint_send_ipi);
 	if (rc <= 0) {
 		pr_err("unable to create muxed IPIs\n");
 		rc = (rc < 0) ? rc : -ENODEV;
@@ -251,7 +251,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
 	}
 
 	irq_set_chained_handler(clint_ipi_irq, clint_ipi_interrupt);
-	riscv_ipi_set_virq_range(rc, BITS_PER_BYTE);
+	riscv_ipi_set_virq_range(rc, IPI_MAX);
 	clint_clear_ipi();
 #endif
 

-- 
2.43.0


