Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FAFD65C7E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 11:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wutmjbunPazncW+7ACgp5eT9w4BJnbyk7q/fyDFLZ9g=; b=jXFkaB3jKZRLs/Vb03MImO8J3U
	vCWnMHyFBVlHA26DZjNr9rFlNnMlRN+UUTmKjtKQRHGbKAlC1ffaEbi7K2mXd2DHMv9HvZhMcY84l
	kRaROpj8ypd+t/Uzj2MWILM06BHe54S5yuvmdv7y0sHtOPrR4od8/hWZdQ76UP46Wc/Nl9WTrEhY6
	O5PRSeqjrxPnCA6V9ySKQvMvhmJLISOXTB+bdK0oGMeF3O9pbhz8HMBl0G2ClgizOGKJt3heWiI7b
	bSH/4vX37H7i4bAnhgvbSZ1n2v18qFN8j97XHmlLJZmldgRZIrIr+RgPBVbd/KbvH2cDre/8G7XaW
	gKOnmO+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCdMt-00000007EO3-1HOu;
	Sun, 17 Nov 2024 11:23:03 +0000
Received: from smtp-29.smtpout.orange.fr ([80.12.242.29] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCdLx-00000007EJW-2iC6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Nov 2024 11:22:07 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id CdLltujfVkz9DCdLltiABX; Sun, 17 Nov 2024 12:21:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731842518;
	bh=wutmjbunPazncW+7ACgp5eT9w4BJnbyk7q/fyDFLZ9g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=g3uU7i02kt7I5UMCR2YSd0Jh7XdjTBkf1sV5I1IvB/dWjRSWhguCsUDnUcPk9SjIQ
	 xDbA/sY5wzXGp8+lUTDjx2fYMIK+VM/BprxDh/mzNzDLzaFTigAq1Hoc/IMPxrGRgY
	 yqA2uh+d8/VzX1GnsqNb4qS5v8Iar4rlm+iGqNfcHgGXZGryfmrV7xDXJMq7kAN91Y
	 JyYvVYr2+ybGGGY+e7EVDLVvyXFZCP6CqVg1QbNvsA7+wIQU+PEWXsGIqQSmnZ+BLd
	 JF7rqbpM7vRTqz1nBMLz3TAqN9PhVDxzsu0uCkF/T2TkPAYdSfR9bSUBG7OXrejMFw
	 x+wqWFVIao+EQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 17 Nov 2024 12:21:58 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Thomas Gleixner <tglx@linutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Aisheng Dong <aisheng.dong@nxp.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] irqchip/imx-irqsteer: Fix irq handling if an error occurs in imx_irqsteer_irq_handler()
Date: Sun, 17 Nov 2024 12:21:43 +0100
Message-ID: <ad6514c771fef0ac2d1b3c050c6db5d5e0fd034d.1731842478.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_032206_092895_FA00A9A2 
X-CRM114-Status: GOOD (  11.13  )
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

chained_irq_enter(() should be paired with a corresponding
chained_irq_exit().

Here, if (hwirq < 0), a early return occurs and chained_irq_exit() is not
called.

Add a new label and a goto for fix it.

Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

Review with care, irq handling is sometimes tricky...
---
 drivers/irqchip/irq-imx-irqsteer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 75a0e980ff35..59abe5a8beb8 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -135,7 +135,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc *desc)
 	if (hwirq < 0) {
 		pr_warn("%s: unable to get hwirq base for irq %d\n",
 			__func__, irq);
-		return;
+		goto out;
 	}
 
 	for (i = 0; i < 2; i++, hwirq += 32) {
@@ -153,6 +153,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc *desc)
 			generic_handle_domain_irq(data->domain, pos + hwirq);
 	}
 
+out:
 	chained_irq_exit(irq_desc_get_chip(desc), desc);
 }
 
-- 
2.47.0


