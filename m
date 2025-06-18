Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9647DC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 12:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GjmzlSMJGThF/X6xEUPvfYdLDsdkYToZuOGOEJIFwyo=; b=Yg2tZ8qOK4aTUiHATUvZbQber7
	XOHPOx4ztvnjEGikSDkPqNNGtczabdVJBEVyTgxj0Na1KrXlh0Bs018GYJBzl5BMPtKDCeDhS0GG0
	RdbSR/Vb5dLf+gcJ9O8YUsUbWZW2fOYMlyDK+fm6Nt87mo3mNTDQ1g21oPYM5UNrBaP2jF1Y6ysnF
	6W7xMxMtQU/AHfexgb/LDXHeM17xd+dnMFpSCeTwsLrbuVzjp1gvWgjrdiQBivCHxWLGc6L6NsOJY
	Af0N6iaerEoWhFQ3ZlAMb5etY6kKUtXkCGzyqXBeFCIZC9gc3pncfq/fJER+QGuQsJBPjxT+fhCqt
	Zwcv+AiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrU6-0000000A2vq-3W9s;
	Wed, 18 Jun 2025 12:01:43 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpvZ-00000009l8y-0cEv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:21:58 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-235f9e87f78so70700905ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 03:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750242112; x=1750846912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GjmzlSMJGThF/X6xEUPvfYdLDsdkYToZuOGOEJIFwyo=;
        b=HbjZPFF5x2QRnR+PePjqo5tr63NptwRtvY7j0w6vTE/Q1zIeXEf1YjO6T4T8OoEN/W
         SOqCE44r3/8WDmE6a/heyCBj4FUBTYPnz9sV6l1os2kqSLZZp7Ha6MIt3mAwToHAajxl
         G4vycD1HZB1HimvSe7biDQrRnMfbEr0SQg/2askQEIprQgM7dkRmhZOWbDUfgVNsDBen
         PoQzogCUWoLeg0se/QyA0ruNBIKQyic8d5Q32nnz2OYqqd6xlidX+gVr6UO9R8xmG6nz
         038BFqOxH9wNxKG8+kcv24V82l9rgYOXQuAoqM8xFdINI8XWI50bH9iDsPfth0X2Jmi0
         M9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750242112; x=1750846912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GjmzlSMJGThF/X6xEUPvfYdLDsdkYToZuOGOEJIFwyo=;
        b=KOtn2JgkNwhiKTZfZfZ3YDsTWdSDsH4hhZ06UicR0GD4vhuqpZ8fxZLRnkDtVlKZAI
         8s3EKYYMrI9Z/OrzqtNVnIf8mfD/c+WWX69xxRaSabb77OiZVXAdLIDHmaLtOONZRXA+
         evr/f3l+Wy/uyvkQ3qDya9ZXkFO4BQK5aXyhY4zB8YPWbG4hL9nf3LL6H2kKGsElQLAj
         AhzGwB391IMj54Bbhk+FzqbibEZuN4r36jdHcDiIWFC45x6geEyf2UlEf+J08MSonTaN
         k7hHKP5IjuEzOEz7T6v4avCcSPVJltIpsiR23vWgZwIZtfCqBO1HGajgN4BJCR/i01ft
         w+xw==
X-Forwarded-Encrypted: i=1; AJvYcCXRLN/q50kKKW+BR/13iEpeWnJDfd6tH1ZnqG0MCBbHj70Y2qRDBwkhoNDabSDKtwmTx7hKA8ELErwGuiGjQjy7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0Kw5R5z/QvaimMTvQnkQF/0a3WOCtccmI0a/DBgpdms6VynFQ
	mqJ+lOmt8ePb9PMEK4MuipJKmq1dFYPYKCTYvwBuG3u5M8Id/8ktVle7NTQmTn2F1GI=
X-Gm-Gg: ASbGncudEcS+YS/5TtpILRCABT0WfZH2yKjTDseCkRiYdyjKLrLRr7jdhj2S22mIdSy
	nz2vxsfbheHGTflznMT2PmSmFWMJK5BoY2YNY8mulErUlqMd+4tXIO50xjccqyyaQ97vZOmltz7
	v6C4ACI72m/4sMdO3AFyn2e9bFviXPwAabTMu39c6CkYCo1ZQOAXPnfMGzubHyTtu0AOAg6LAjs
	yerRoQ+WKBuQSrIbpWCkr9tkRALRXuMx3VVza7IoM/pxg0ZqGNUiWGMdtqzs8TJEVUshvisppBY
	jYWld+dO0IuvLxI2gBsYlttIqbx+/nWjxcatuv8XWg3mTyEnYzKCbHxCz1LbbG+u8rmVVwSvPb2
	x4NVkpRo=
X-Google-Smtp-Source: AGHT+IFazvSPNlbUxR4VYiAlmcTE9A4W+7BMiVTRCRXWqUGSyQF3kdAvM4//0ZOLw44KbimyVMMUYw==
X-Received: by 2002:a17:902:c946:b0:234:d292:be95 with SMTP id d9443c01a7336-2366b149f20mr223382045ad.42.1750242112586;
        Wed, 18 Jun 2025 03:21:52 -0700 (PDT)
Received: from localhost ([106.38.221.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781dfsm96547735ad.131.2025.06.18.03.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 03:21:52 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: aspeed: change debug level in irq handler
Date: Wed, 18 Jun 2025 18:21:48 +0800
Message-ID: <20250618102148.3085214-1-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_032157_504527_E3E8F517 
X-CRM114-Status: GOOD (  14.31  )
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

In interrupt context, using dev_err() can potentially cause latency
or affect system responsiveness due to printing to console.

In our scenario, under certain conditions, i2c1 repeatedly printed
"irq handled != irq. expected ..." around 20 times within 1 second.
Each dev_err() log introduced approximately 10ms of blocking time,
which delayed the handling of other interrupts — for example, i2c2.

At the time, i2c2 was performing a PMBus firmware upgrade. The
target device on i2c2 was time-sensitive, and the upgrade protocol
was non-retryable. As a result, the delay caused by frequent error
logging led to a timeout and ultimately a failed firmware upgrade.

Frequent error printing in interrupt context can be dangerous,
as it introduces latency and interferes with time-critical tasks.
This patch changes the log level from dev_err() to dev_dbg() to
reduce potential impact.

Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 1550d3d552ae..38e23c826f39 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -317,7 +317,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 	switch (bus->slave_state) {
 	case ASPEED_I2C_SLAVE_READ_REQUESTED:
 		if (unlikely(irq_status & ASPEED_I2CD_INTR_TX_ACK))
-			dev_err(bus->dev, "Unexpected ACK on read request.\n");
+			dev_dbg(bus->dev, "Unexpected ACK on read request.\n");
 		bus->slave_state = ASPEED_I2C_SLAVE_READ_PROCESSED;
 		i2c_slave_event(slave, I2C_SLAVE_READ_REQUESTED, &value);
 		writel(value, bus->base + ASPEED_I2C_BYTE_BUF_REG);
@@ -325,7 +325,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		break;
 	case ASPEED_I2C_SLAVE_READ_PROCESSED:
 		if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
-			dev_err(bus->dev,
+			dev_dbg(bus->dev,
 				"Expected ACK after processed read.\n");
 			break;
 		}
@@ -354,7 +354,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		/* Slave was just started. Waiting for the next event. */;
 		break;
 	default:
-		dev_err(bus->dev, "unknown slave_state: %d\n",
+		dev_dbg(bus->dev, "unknown slave_state: %d\n",
 			bus->slave_state);
 		bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
 		break;
@@ -459,7 +459,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 
 	/* We are in an invalid state; reset bus to a known state. */
 	if (!bus->msgs) {
-		dev_err(bus->dev, "bus in unknown state. irq_status: 0x%x\n",
+		dev_dbg(bus->dev, "bus in unknown state. irq_status: 0x%x\n",
 			irq_status);
 		bus->cmd_err = -EIO;
 		if (bus->master_state != ASPEED_I2C_MASTER_STOP &&
@@ -523,7 +523,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 			irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
 			goto error_and_stop;
 		} else if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
-			dev_err(bus->dev, "slave failed to ACK TX\n");
+			dev_dbg(bus->dev, "slave failed to ACK TX\n");
 			goto error_and_stop;
 		}
 		irq_handled |= ASPEED_I2CD_INTR_TX_ACK;
@@ -546,7 +546,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		fallthrough;
 	case ASPEED_I2C_MASTER_RX:
 		if (unlikely(!(irq_status & ASPEED_I2CD_INTR_RX_DONE))) {
-			dev_err(bus->dev, "master failed to RX\n");
+			dev_dbg(bus->dev, "master failed to RX\n");
 			goto error_and_stop;
 		}
 		irq_handled |= ASPEED_I2CD_INTR_RX_DONE;
@@ -577,7 +577,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		goto out_no_complete;
 	case ASPEED_I2C_MASTER_STOP:
 		if (unlikely(!(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP))) {
-			dev_err(bus->dev,
+			dev_dbg(bus->dev,
 				"master failed to STOP. irq_status:0x%x\n",
 				irq_status);
 			bus->cmd_err = -EIO;
@@ -589,7 +589,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
 		goto out_complete;
 	case ASPEED_I2C_MASTER_INACTIVE:
-		dev_err(bus->dev,
+		dev_dbg(bus->dev,
 			"master received interrupt 0x%08x, but is inactive\n",
 			irq_status);
 		bus->cmd_err = -EIO;
@@ -665,7 +665,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
 
 	irq_remaining &= ~irq_handled;
 	if (irq_remaining)
-		dev_err(bus->dev,
+		dev_dbg(bus->dev,
 			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
 			irq_received, irq_handled);
 
-- 
2.47.0


