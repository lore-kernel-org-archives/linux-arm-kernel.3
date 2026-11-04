Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79B9606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 03:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ObgWm542
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uBHr36LK49YQkkFNPU7jgzWwlJeQFqDRMsaYzjRg1WI=; b=ObgWm542931UmM
	jAht49h8023GB6rGI/QC4mjeVzpU+crtqwTExK38rIlzAiReV4C+iMRpROOjRJtiB+go5mt6IrMQb
	XUqOg+Hhq4aFeuTb/ekTGaxZQnXPp22pQ2/107kcT3aCqIeOLz3OLcjCCzVAJuywe1sP/VEIGHxbe
	DdBqeKjgBUv+FilqkaGInmJ1jCIK4BOpgvQJXz7Al61u7Q7jXNhn8IpbYYy+1HNgfCRedxVauJa04
	IPna7C8qqQ+eIJMA4H09DX0lx7goLrzz/bs2bR2auQgKP3ZA1hFrjkcYfKZaKNgUuDzuTl7/nyxtV
	8ajYXW59Kzg77fRFdsvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOS9Q-00000004Hgj-04cR;
	Wed, 04 Nov 2026 03:59:04 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOS9M-00000004Hf9-11Rl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 03:59:01 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 4 Nov
 2026 11:58:47 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 4 Nov 2026 11:58:47 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Wed, 4 Nov 2026 11:58:35 +0800
Subject: [PATCH 1/2] gpio: aspeed: Clear only the acked line's G4 interrupt
 status
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261104-gpio-aspeed-irq-status-v1-1-9805645f856d@aspeedtech.com>
References: <20261104-gpio-aspeed-irq-status-v1-0-9805645f856d@aspeedtech.com>
In-Reply-To: <20261104-gpio-aspeed-irq-status-v1-0-9805645f856d@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>, <stable@vger.kernel.org>, Aaron Antone
	<aae@amazon.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793764727; l=1851;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=TEOj7oqwxfBFK2B1FS9iy35fS31jC1PHn9rs7TGEd8Q=;
 b=A6uNk7/EeJuMSlFXFHIIuh48EZqHYrN2yYSRc2hFsh4mWw8YtVum+F4B801WohKC80pkwuaT2
 vpUwXOtKplwAr5NofnGBl7YfHRbziZzCYP0uP8WZB7Q9wLfy8wNUP6W
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_195900_309391_6492C25C 
X-CRM114-Status: GOOD (  14.12  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The G4 interrupt status registers are write-1-to-clear: writing 0 to a
bit has no effect and writing 1 clears that line's status flag.
aspeed_gpio_irq_ack() clears a line's status through
aspeed_g4_reg_bit_set(), which reads the bank's status register, sets
the line's bit and writes the whole value back. That write clears every
interrupt pending in the 32-line bank, not just the acked one.

aspeed_gpio_irq_handler() reads each bank's status register once and
dispatches the lines that were set. If another line in the same bank
latches an edge after that read and before an ack in the bank, the ack
clears its status and the handler is never called for it, so the edge
is lost.

Write only the line's own bit when clearing the interrupt status on G4.

Fixes: 79fc9a2fcc45 ("gpio: aspeed: Create llops to handle hardware access")
Cc: stable@vger.kernel.org
Reported-by: Aaron Antone <aae@amazon.com>
Suggested-by: Aaron Antone <aae@amazon.com>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index dc53b2decb66..2482f2ff735d 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1041,6 +1041,17 @@ static void aspeed_g4_reg_bit_set(struct aspeed_gpio *gpio, unsigned int offset,
 	void __iomem *addr = aspeed_gpio_g4_bank_reg(gpio, bank, reg);
 	u32 temp;
 
+	/*
+	 * The interrupt status register is write-1-to-clear. Write only this
+	 * line's bit so that interrupts pending on the other lines of the bank
+	 * stay latched.
+	 */
+	if (reg == reg_irq_status) {
+		if (val)
+			iowrite32(GPIO_BIT(offset), addr);
+		return;
+	}
+
 	if (reg == reg_val)
 		temp = gpio->dcache[GPIO_BANK(offset)];
 	else

-- 
2.34.1


