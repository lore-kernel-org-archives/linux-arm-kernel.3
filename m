Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04257FB44A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 04:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=ezwULpVXKI7UpRux8FFZ/tn1IkPl44RHaVig5fAbpdE=; b=gMjGPXMq4WYtoLXRhQfKRkVIth
	IN4GP2XYqmphcJIreIQszDHhABrX+Zw9KdRtWJrJX9pkrH7vNRWc6fZiwxruT9d4NbJgg4Jq33ggD
	c2PIS9x0rLr/g3KsnDO1SjjGTXkak+CH6/TLh2JufOaMWIQjuX8g1Oo1VOqP9/oJ6yC57OpIPzCGq
	7VYZFuzuYdtbwO3zQ+TE8yT1dU4n/1c/pNraHK+0QCaiF4TR4mwfMxwsz0HIoDhyRx+zAlzrOduIq
	6TpRhSV0Z4CYFvb89LsvGn1EfTbw2ru1ZGkNDHAQZ2lqS3Qekiw9l2LmY90VOwTHgdC+oQhDIC80D
	q29BvSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG8CW-0000000Cdej-0ocq;
	Fri, 24 Apr 2026 04:31:36 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG8CS-0000000CdeG-2pLz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 04:31:34 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260424043122epoutp0410a17283e29c4ac54b9668f70a9cf7de~pMLUlGwYW3274432744epoutp04Z
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 04:31:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260424043122epoutp0410a17283e29c4ac54b9668f70a9cf7de~pMLUlGwYW3274432744epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1777005082;
	bh=ezwULpVXKI7UpRux8FFZ/tn1IkPl44RHaVig5fAbpdE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=UhGefVQtunXtAftT13G6aAngu2q/YdIpkDjoUt+jh9iodeGAKNZc//3QOzweQbSi5
	 ioAj9ut7baFyLSzVV++6s/1KRrxNB6h8JkhPsxkPH0QFDI9ovkNrueVhpSSBP7aOz/
	 UNTNHsFk2EwL6wkXhLVcwVDfpMSr2PKOsw5Nok7M=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260424043122epcas5p1f182d6bf212ff66b2a1cd71263c3a58e~pMLUVIPtq0524705247epcas5p12;
	Fri, 24 Apr 2026 04:31:22 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4g20Qf1tlbz2SSKX; Fri, 24 Apr
	2026 04:31:22 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260424043122epcas5p17e2f88653e398c5a53c0ffa4c1e01bc1~pMLUIM5AI0462504625epcas5p17;
	Fri, 24 Apr 2026 04:31:22 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.97.243.203]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260424043120epsmtip23e5ac62db5a0bd942d1358d193cfacff~pMLS6u1-82166821668epsmtip2m;
	Fri, 24 Apr 2026 04:31:20 +0000 (GMT)
From: Maninder Singh <maninder1.s@samsung.com>
To: linux@armlinux.org.uk, linus.walleij@linaro.org, ardb@kernel.org,
	ndesaulniers@google.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Maninder Singh <maninder1.s@samsung.com>
Subject: [PATCH 1/1] arm: traps: remove fp underflow checking
Date: Fri, 24 Apr 2026 10:00:29 +0530
Message-Id: <20260424043029.4101133-1-maninder1.s@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260424043122epcas5p17e2f88653e398c5a53c0ffa4c1e01bc1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260424043122epcas5p17e2f88653e398c5a53c0ffa4c1e01bc1
References: <CGME20260424043122epcas5p17e2f88653e398c5a53c0ffa4c1e01bc1@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_213133_235750_2920DAD4 
X-CRM114-Status: GOOD (  14.36  )
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

with IRQSTACKS fp can point outside of thread's stack.
And when there is crash reported from IRQ side, it always report
"frame pointer underflow", which is not real underflow.

Unhandled fault: page domain fault (0x81b) at 0x00000000
..
PC is at handle_irq_desc+0x68/0xa4
LR is at generic_handle_domain_irq+0x18/0x1c
..

Call trace: frame pointer underflow
 handle_irq_desc from generic_handle_domain_irq+0x18/0x1c
 generic_handle_domain_irq from gic_handle_irq+0x78/0x8c
 gic_handle_irq from generic_handle_arch_irq+0x3c/0x4c
..

It is just warning print and there is no decision based on this
to stop backtrack or etc. So it can be removed.

Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
---
 arch/arm/kernel/traps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index afbd2ebe5c39..47f8c0738399 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -243,8 +243,8 @@ void dump_backtrace(struct pt_regs *regs, struct task_struct *tsk,
 	} else if (verify_stack(fp)) {
 		pr_cont("invalid frame pointer 0x%08x", fp);
 		ok = 0;
-	} else if (fp < (unsigned long)end_of_stack(tsk))
-		pr_cont("frame pointer underflow");
+	}
+
 	pr_cont("\n");
 
 	if (ok)
-- 
2.34.1


