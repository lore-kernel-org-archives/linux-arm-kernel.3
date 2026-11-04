Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02FC606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 03:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lhUEd7Ms
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SO36a9ub9Qx/UKW73LBbXZKVdS501hGyizN5TKPiU5o=; b=lhUEd7Ms0LTssc
	iBmK9HihxO4PUD/9J7YnATNbAWmw72o0ZlVIPJF9VkDdPKBiYNHuL3A2zHED+Yo04jTNucHbzUn0I
	YSgn+LGzdtrukPyVC3kP78j7GfrE0yZ4MMOIrI5sK9ErVLEdDS0vs6d8yWLmlj4jQPcrE8JzTldHV
	lpdFmFR7ZHtHRNnXB/77AOov3pQZ5WpPXL4TqGM6HZDpeUGV+XrdQjqdWULJsj+jzKRdXMK7Td8Pm
	/96GRt5HlVs3hAIUIahUu5/hJBDdcbD3B0SfZiNrFfVcg1834WD2bqcYQ7WTRlwT9BqeL6q7yryr0
	qs1lv9wkUdZy/lSt/K6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOS9S-00000004Hhb-0XB0;
	Wed, 04 Nov 2026 03:59:06 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOS9N-00000004Hf9-4AL8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 03:59:03 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 4 Nov
 2026 11:58:47 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 4 Nov 2026 11:58:47 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Wed, 4 Nov 2026 11:58:36 +0800
Subject: [PATCH 2/2] gpio: aspeed: Preserve the pending G7 interrupt status
 on control writes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261104-gpio-aspeed-irq-status-v1-2-9805645f856d@aspeedtech.com>
References: <20261104-gpio-aspeed-irq-status-v1-0-9805645f856d@aspeedtech.com>
In-Reply-To: <20261104-gpio-aspeed-irq-status-v1-0-9805645f856d@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793764727; l=1628;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=Fnj2zvHZ9ECX/p3mEpqFA6hScNcf6xsh2LB1gDUZzP0=;
 b=nImNT7EHh4sK2dh50Xr8PxvYhqt+V8ubRfexjyIzDbgkEfG4NiobJ4sjZ3lCDSEWYoMlbtNTs
 f/8oBGptk7fBi7v2A+6wjh+ZNQGytcEIKQAVLPCnybfMuwWaKKhGMO/
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_195902_216213_393061DC 
X-CRM114-Status: GOOD (  13.89  )
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

On G7 each line has its own control register, and its interrupt status
bit (bit 12) is write-1-to-clear. aspeed_g7_reg_bit_set() updates a
field by reading the control register, replacing that field and writing
the value back. When the line's interrupt is pending, the status bit
reads as 1 and is written back as 1, so updating an unrelated field
such as the interrupt enable, trigger type, direction or debounce
selection also clears the pending interrupt.

Mask out the status bit when composing the value to write, so it is
written as 1 only when the status field itself is being set to ack the
interrupt.

Fixes: b2e861bd1eaf ("gpio: aspeed: Support G7 Aspeed gpio controller")
Cc: stable@vger.kernel.org
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 2482f2ff735d..6e834e83915b 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1168,7 +1168,13 @@ static void aspeed_g7_reg_bit_set(struct aspeed_gpio *gpio, unsigned int offset,
 	u32 write_val;
 
 	if (mask) {
-		write_val = (ioread32(addr) & ~(mask)) | field_prep(mask, val);
+		/*
+		 * The interrupt status bit is write-1-to-clear. Keep it zero
+		 * unless it is the field being written, so that updating any
+		 * other field leaves a pending interrupt latched.
+		 */
+		write_val = ioread32(addr) & ~(mask | GPIO_G7_CTRL_IRQ_STS);
+		write_val |= field_prep(mask, val);
 		iowrite32(write_val, addr);
 	}
 }

-- 
2.34.1


