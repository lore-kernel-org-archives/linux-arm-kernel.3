Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E376ECA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 14:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pDbDDRw5NqCQFjKs4W4BF9IGnUoJVxd/s6rpPe+Ky2M=; b=aUt6CckIjmyvHcUcd0fzbkWn8U
	dMn8hKXZA6rPr0qzqmjkTxuO2sm06kzBjyGX5GfsG66zTM+hrqUGN98u0f1op49YFEc/sZyMCJMvY
	h9r0yVg4poFP16SFHp/hE+LjI+yTbVJ6U0C68iPRYSSQ6hL2UHrQNKvC0mth135/6M/0JuY7+3mLW
	UFiEcZ9jMRDQlpJey9Jt5x85jeyEJ2irw9o6lUkAmmVRHYCWZO51AWSCE4X/HuHkS5zX0WKsqHuP1
	dSqte7QbVSxbnwP18W8Skgnb2zYMxw6kvZLfDZUnxO8y5hFxrM7M85jeqydk4sV6um/yU8obSRMyu
	UTN6RsLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGGeB-0000000AdPS-1JgX;
	Mon, 12 Oct 2026 14:04:59 +0000
Received: from mail-ed2-x06.google.com ([2a00:1450:4864:33::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGGe8-0000000AdOs-14pe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 14:04:57 +0000
Received: by mail-ed2-x06.google.com with SMTP id 4fb4d7f45d1cf-6b1c084289cso519295a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 07:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791813894; x=1792418694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pDbDDRw5NqCQFjKs4W4BF9IGnUoJVxd/s6rpPe+Ky2M=;
        b=qKAEibn2hncrq0pmLYbFvxEKhOQgiQNb72CLd70vwSro8hSeJKMa/aMg7kDsdSXC0F
         ZUZXOIQbSL2dacrw4nxWn5Nx9Sdue9cjgovyRWUu+H1bdvC/VhuCIQk99CLgV4Cxy0qX
         wxhJueVh43yNMPDfH6aH16RQ2O9Ym7IVmTLAs6FCJfN3NJjYVXwFrIE2AawioTKPDIWN
         YcDv67wMzBbMOcqlkE0GUCQVBamPwcf/AXZFdwMGYM0AA/eiiDBKerKGH5Sg+4JiwQV0
         BHsiZ+6qc+nkogwhCHYW62ORiyW8FPVRH2E10ImDo6r1cX2qa7gqDE2SmpQrErAA8xd3
         Pt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813894; x=1792418694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pDbDDRw5NqCQFjKs4W4BF9IGnUoJVxd/s6rpPe+Ky2M=;
        b=Ws5MrwEDg3NM45lC0vfAws2LdPBtNu873xyUNgpyAuvbmMf6HumVBnRmPgFtSy9sb4
         2UZ80NR1RnKcrMvz2jXOaMcqhH5zEeWAcR8NJNlQXpCguSb60KKGr3I31UiGS+QM5arf
         Uul2nXRt93bYpaO/y0IuvG+H4T2zzWYy8CdZFTbudo/mZlZ2fFyJZqfAz19vJT9PACz/
         ku4+nvW0dZVzGWKw3yTdXFVXgzb+W1mCpAWly0mEFQDeB7Zzy2LaXCmKwmk2L3T/9kzu
         DmBkNf78h/9p/F/vUsfPVy8efnWVyLQthfKGhxzAr/M87mAqKMApb0eRD3/tkPRU1p3L
         zmsQ==
X-Gm-Message-State: AFq9FYIn23vaLWjooN0I8YdpCPntMmydad20a2EKPZ0sBiMyottvLaJL
	yTgVjLsasrXDTeDpD+BK0cuOT7IEXzjmNJTklRTj6uACNpQN558z78KX
X-Gm-Gg: AYBFou2AAe9HtwuLk2Em3jX4fvEbe1O4Es0znWVwvaxYZMbC3+Djv+1maRwMZN1eTMQ
	RaAcomL5g93oBwxXFYYkQyjLBNheq0u/VKaaKS3g32cGBIbk2Ut71TiL8xkS9jV+YgYb3u5kymH
	vRQj5RyxiwNBwVXEBJUWPZLSh7BvZtbV/72rCxGhG0WvyFNOL0mkkqrtWsxX85N7WYPBXPOikRw
	V5DVh4zlX3KAHPHPInbulopPtT/1PuViSRSzs+Vclc5jVKOtcZyzBVI9fLqFcKOsnF3hG+PzzSX
	2SiSBYp4XPqL4mlgaLya0tgV0GyJtitpOFhZuVycAXLuv2RCRzgl5kV3Q2lZHR7+aPAxCrbMOXe
	n9fZAuWRTCPgfyoTDYFFebxGi2cHVIOjPJXVg28ZpTEu6/GlW5osDn5CWa1ejTiWjQZjPkupoHq
	8mllz81iA88l7eo5wv755EDeW0OcwNZatOV6lS8bm6ZCkV1j0uzHVnOXMxjER2AiSI2xPoPERce
	FCzsEpxXHhXnpUhrYbhNyapa3SLU7ENgQaI0jGRnD+4dzA7P8kaHIFxPf2RNCiKj1X7sK/mXkdh
	Ie0e1F/j2u+1fCpE5F9EUXK9VQ==
X-Received: by 2002:a05:6402:2347:b0:6b1:b75e:e0ba with SMTP id 4fb4d7f45d1cf-6b1b75ee465mr3517228a12.28.1791813892505;
        Mon, 12 Oct 2026 07:04:52 -0700 (PDT)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1c1d9fc0esm1477287a12.4.2026.10.12.07.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:04:51 -0700 (PDT)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH 1/1] i2c: i2c-xiic: fix clearing of bnb irq
Date: Mon, 12 Oct 2026 16:04:44 +0200
Message-ID: <20261012140444.1195207-1-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_070456_345515_76D0DF9E 
X-CRM114-Status: GOOD (  29.95  )
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

This commit fixes the clearing routine for the bus not busy (bnb) irq.

The bnb is used to indicate that the current transfer is done.

A high level view of the software flow for tx:

* init i2c controller
* prepare all registers ( fill fifo, enable irqs, ... )
* start i2c txfer
* clear and enable bnb
* wait for completion
* ( serve interrupts )
* ( bnb interrupt ): complete completion

The datasheet ( pg090-axi-iic, Interrupt-Status-Register ISR)
states that the bnb bit can only be cleared if
the bus busy bit in the status register is set.

So the iic controller must have recognized that their is some activity
on the bus. ( Start condition )

Currently the bnb bit is cleared without checking or waiting for this
condition. This can lead to spurious bnb interrupts.

This commit introduces a function for clearing the bnb bit,
which waits for all preconditions and clears the bnb bit or times out.

Tested on Zynqmp dev board with some custom logic.

Tested-by: Thilo Zirnstein <thi.zirnstein@gmail.com>

Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c | 103 ++++++++++++++++------------------
 1 file changed, 48 insertions(+), 55 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 5e397a7e63f6..de463d356bff 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -73,9 +73,6 @@ enum i2c_scl_freq {
  * @prev_msg_tx: Previous message is Tx
  * @quirks: To hold platform specific bug info
  * @smbus_block_read: Flag to handle block read
- * @smbus_actual_len: Valid byte count (length + payload + optional PEC) of a
- *	padded SMBus block read. msg->len is trimmed to this on completion.
- *	Zero when no trimming is needed.
  * @input_clk: Input clock to I2C controller
  * @i2c_clk: I2C SCL frequency
  * @atomic: Mode of transfer
@@ -101,7 +98,6 @@ struct xiic_i2c {
 	bool prev_msg_tx;
 	u32 quirks;
 	bool smbus_block_read;
-	unsigned int smbus_actual_len;
 	unsigned long input_clk;
 	unsigned int i2c_clk;
 	bool atomic;
@@ -230,7 +226,9 @@ static const struct timing_regs timing_reg_values[] = {
 
 #define XIIC_RESET_MASK             0xAUL
 
-#define XIIC_PM_TIMEOUT		1000	/* ms */
+#define XIIC_PM_TIMEOUT 1000 /* ms */
+/* timeout waiting for bus busy */
+#define XIIC_BB_TIMEOUT		(msecs_to_jiffies(1))
 /* timeout waiting for the controller to respond */
 #define XIIC_I2C_TIMEOUT	(msecs_to_jiffies(1000))
 /* timeout waiting for the controller finish transfers */
@@ -392,6 +390,30 @@ static int xiic_wait_tx_empty(struct xiic_i2c *i2c)
 	return 0;
 }
 
+static int xiic_clear_en_bnb(struct xiic_i2c *i2c)
+{
+	u8 sr = 0, isr = 0;
+	unsigned long timeout;
+
+	timeout = jiffies + XIIC_BB_TIMEOUT;
+	for (isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET);
+		(isr & XIIC_INTR_BNB_MASK);
+		isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET)) {
+
+		sr = xiic_getreg8(i2c, XIIC_SR_REG_OFFSET);
+		if (sr & XIIC_SR_BUS_BUSY_MASK)
+			xiic_setreg8(i2c, XIIC_IISR_OFFSET, XIIC_INTR_BNB_MASK);
+
+		if (time_after(jiffies, timeout)) {
+			dev_err(i2c->dev, "Failed to clear bnb\n");
+			return -ETIMEDOUT;
+		}
+	}
+
+	xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
+	return 0;
+}
+
 /**
  * xiic_setclk - Sets the configured clock rate
  * @i2c: Pointer to the xiic device structure
@@ -543,38 +565,30 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 
 	/* Check if received length is valid */
 	if (rxmsg_len <= I2C_SMBUS_BLOCK_MAX) {
-		unsigned int pec_len = i2c->rx_msg->len - 1;
-
 		/* Set Receive fifo depth */
-		if (rxmsg_len + pec_len > IIC_RX_FIFO_DEPTH) {
+		if (rxmsg_len > IIC_RX_FIFO_DEPTH) {
 			/*
-			 * Trailing bytes (payload plus any PEC) exceed Rx FIFO
-			 * capacity, so drain in chunks. This also keeps the
-			 * else branch below from pushing rfd_set past the
-			 * 4-bit XIIC_RFD_REG_OFFSET field.
+			 * When Rx msg len greater than or equal to Rx fifo capacity
+			 * Receive fifo depth should set to Rx fifo capacity minus 1
 			 */
 			rfd_set = IIC_RX_FIFO_DEPTH - 1;
-			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
-		} else if (1 + rxmsg_len + pec_len < SMBUS_BLOCK_READ_MIN_LEN) {
+			i2c->rx_msg->len = rxmsg_len + 1;
+		} else if ((rxmsg_len == 1) ||
+			(rxmsg_len == 0)) {
 			/*
-			 * The HW needs SMBUS_BLOCK_READ_MIN_LEN bytes on the
-			 * bus to exit cleanly: by the time the ISR reads the
-			 * length byte the second byte is already being clocked
-			 * in, too late to NACK. Pad the drain target and record
-			 * the real length, trimmed back on completion so the
-			 * PEC check sees the right byte.
+			 * Minimum of 3 bytes required to exit cleanly. 1 byte
+			 * already received, Second byte is being received. Have
+			 * to set NACK in read_rx before receiving the last byte
 			 */
 			rfd_set = 0;
 			i2c->rx_msg->len = SMBUS_BLOCK_READ_MIN_LEN;
-			i2c->smbus_actual_len = 1 + rxmsg_len + pec_len;
 		} else {
 			/*
-			 * All trailing bytes fit in the Rx FIFO. Defer RX_FULL
-			 * until every one of them is buffered, so the drain
-			 * takes xiic_read_rx()'s bytes_rem == 0 path.
+			 * When Rx msg len less than Rx fifo capacity
+			 * Receive fifo depth should set to Rx msg len minus 2
 			 */
-			rfd_set = rxmsg_len + pec_len - 1;
-			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
+			rfd_set = rxmsg_len - 2;
+			i2c->rx_msg->len = rxmsg_len + 1;
 		}
 		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);
 
@@ -587,16 +601,6 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 	dev_err(i2c->adap.dev.parent, "smbus_block_read Invalid msg length\n");
 }
 
-/*
- * Undo the setup-time padding of a short SMBus block read before rx_msg is
- * cleared, so the PEC check sees the right byte.
- */
-static void xiic_smbus_trim_len(struct xiic_i2c *i2c)
-{
-	if (i2c->rx_msg && i2c->smbus_actual_len)
-		i2c->rx_msg->len = i2c->smbus_actual_len;
-}
-
 static void xiic_read_rx(struct xiic_i2c *i2c)
 {
 	u8 bytes_in_fifo, cr = 0, bytes_to_read = 0;
@@ -819,8 +823,6 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 
 		xiic_read_rx(i2c);
 		if (xiic_rx_space(i2c) == 0) {
-			xiic_smbus_trim_len(i2c);
-
 			/* this is the last part of the message */
 			i2c->rx_msg = NULL;
 
@@ -881,19 +883,13 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	}
 
 	if (pend & XIIC_INTR_BNB_MASK) {
-		/* IIC bus has transitioned to not busy */
-		clr |= XIIC_INTR_BNB_MASK;
-
 		/* The bus is not busy, disable BusNotBusy interrupt */
 		xiic_irq_dis(i2c, XIIC_INTR_BNB_MASK);
 
 		if (i2c->tx_msg && i2c->smbus_block_read) {
 			i2c->smbus_block_read = false;
-			/*
-			 * Drive xiic_tx_space() to 0 to signal STATE_DONE
-			 * without truncating the rx_msg length.
-			 */
-			i2c->tx_pos = i2c->tx_msg->len;
+			/* Set requested message len=1 to indicate STATE_DONE */
+			i2c->tx_msg->len = 1;
 		}
 
 		if (!i2c->tx_msg)
@@ -965,7 +961,6 @@ static void xiic_recv_atomic(struct xiic_i2c *i2c)
 			return;
 	}
 
-	xiic_smbus_trim_len(i2c);
 	i2c->rx_msg = NULL;
 	xiic_irq_clr_en(i2c, XIIC_INTR_TX_ERROR_MASK);
 
@@ -983,9 +978,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 	u8 cr = 0, rfd_set = 0;
 	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
 
-	/* A stale value from an aborted block read would truncate this msg. */
-	i2c->smbus_actual_len = 0;
-
 	if (!i2c->atomic)
 		dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
 			__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
@@ -1028,7 +1020,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);
 
-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_clear_en_bnb(i2c);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
@@ -1095,7 +1087,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 	if (i2c->nmsgs == 1)
 		/* very last, enable bus not busy as well */
-		xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
+		xiic_clear_en_bnb(i2c);
 
 	/* the message is tx:ed */
 	i2c->tx_pos = msg->len;
@@ -1179,11 +1171,11 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 		/* Clear any pending Tx empty, Tx Error and then enable them */
 		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
 				XIIC_INTR_TX_ERROR_MASK |
-				XIIC_INTR_BNB_MASK |
 				((i2c->nmsgs > 1 || xiic_tx_space(i2c)) ?
 				XIIC_INTR_TX_HALF_MASK : 0));
 
 		xiic_fill_tx_fifo(i2c);
+		xiic_clear_en_bnb(i2c);
 	} else {
 		/*
 		 * If previous message is Tx, make sure that Tx FIFO is empty
@@ -1225,8 +1217,9 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 
 		/* Clear any pending Tx empty, Tx Error and then enable them */
 		xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK |
-				XIIC_INTR_TX_ERROR_MASK |
-				XIIC_INTR_BNB_MASK);
+						XIIC_INTR_TX_ERROR_MASK);
+
+		xiic_clear_en_bnb(i2c);
 	}
 
 	i2c->prev_msg_tx = true;
-- 
2.43.0


