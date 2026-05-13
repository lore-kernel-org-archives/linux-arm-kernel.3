Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26747CD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7geQ29k+vP3kqRpnkR89osFPesRjCTgee3KdQw1Yk8=; b=r9N9fUC8WXh8y6iene6gvt3VxA
	ol1M1y2Ruk+vFpSfIYHDnGmvkbN7ceFsXUnhieQSWrdbZpkruYKY8vxcuJtpjWEB717wH3Y7XutE+
	XW+As71mexsKGH/LkbQmauYyjBTmgB2KP+XrBNQ6yC2JExWoP72cCj6mEhiggTetB/uiT1rr//46M
	fduXqtOex0qXqNyogA9tamyCC/3areug6xvElONNz9dPpBoq2eCZAxiWOn/EKhsXNJ2aKwOAxtq47
	D3E0bpit3CFFz5dJw75uFxXqC46fCWOLVhv83t54Y8sJijPVOiPCag7+itPCVUu1ksqsNHWYedfh0
	DNlSQJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6Wx-0000000275x-0vUO;
	Wed, 13 May 2026 10:09:31 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6Ws-0000000273W-3yTr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:09:29 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-13354eb66baso2430889c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 03:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778666966; x=1779271766; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7geQ29k+vP3kqRpnkR89osFPesRjCTgee3KdQw1Yk8=;
        b=CBKA2WNK0f94Sdn4un4O8oqJkHGoaKfbbCzquihi7GUSJ6UF6iPvJ2GAfym5KBAb0N
         nEQdMdepAOdiCxfisOPSRPokBMKmDMMAr7pYrNpfvhszBKdR/BOWCujIVAdWQWDPYEGh
         7fw5xcGsdIhIY+hlba/WEDAAsMArdq7hpAIS7JjMg7sKUTgkcxOHFYI4X0RIyEMf6W0t
         Sq4xIm7BR6CFs3oqmUlY3iKMFOKbEfc5J19YEq9wlKMOgpJzaCUxaDsy0hSDg5tZjZ71
         twkiyOPhWQnxJLlL0JQhNURnfa5oklwKcIPgAPkXNr+2mdG8edTXol/FOoelasAzf9+n
         CECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778666966; x=1779271766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g7geQ29k+vP3kqRpnkR89osFPesRjCTgee3KdQw1Yk8=;
        b=SsHS4vYicldsqs+hHnELJfzLFRb9qG2aDELFlKhSIxwgwNkpScfA8WTq2USuwnaaRz
         P4cNM3/pxad5P+bNteMGvTlKDYRK53VvV/D+8d9PaM6VDQoipv1CODRi1Y8ZvhHMRBom
         ChR+TsogHaqv2kTxlTcGrmNRewYOOVQ16rzfiRD1Q/F1RsxN2lhios8HIA1yEAVGoqIA
         MnnOOIE8Ci0/3/f7v7dkQTtKxAP0YIIl9ZMEYvU7uGcDv8SFO4yHG93DtgbAZE02NC2t
         WAuuTzHC6dxq/P4tOtTWjcYC9a+VBLZO8Xq8HEWgMq4H7ulJqkC5TgzarmmLOVZVjVSs
         LtLg==
X-Gm-Message-State: AOJu0YwSy4ijYK8BJqbxq3F6Rjn4iGaW3/52LVDBDdBhxgR445nRe4Ce
	9RViqNiGFC3iId5KGSNqMMFI/YFoDSpKm1R0SyKgO0Ci39wTRP74Qt2t9iRwoBuyQuU=
X-Gm-Gg: Acq92OGysz1HsSNrLoEX0yM4cBBLTu5l+ARMMj+G02OycqOWy+8OejJ63NecSz/FrjU
	ofMRzWfKk5ijiOnqujjd/68FcpWyr/1zR8fZN7QXVJdq/DEaekiZCVDlwDkTZODzWb6VV9vQWpb
	PospVMNSsSEzkqiiQ5pPkV94OVWZ2qMOpq//S1pxfJBfMXjegeFPVvBLyt6lbQght0g+i9rPgvW
	L1BBJgsiA1yLqrlQMhZEVooQtPO8+xuXI4kNMNRVF+ViMhoUwKQPWQtil6BMcMO2ed9v2esQwsQ
	4TQZnB3G9OERJcTuHRniZPnwAqV9yY/fQgJmBQo83z7FoszGqSLrishko9N/PK+UdsLoqDYQe+g
	k7NZ2blGca7/ozmvCg+bYG7CS4gWwXNm+6mJT/5D1BkuXVux3lW1uR7iwuWdlPOKML+V4NCZWMV
	9ywRIZfLpQMDPRq5MVpJDkotzS6b6nG3fmYg9l
X-Received: by 2002:a05:7022:608b:b0:132:5d42:55ba with SMTP id a92af1059eb24-1343677c602mr1602360c88.16.1778666965951;
        Wed, 13 May 2026 03:09:25 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-132787673ffsm29430265c88.15.2026.05.13.03.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:09:25 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 13 May 2026 03:09:22 -0700
Subject: [PATCH v3 1/3] i2c: xiic: preserve PEC byte length in SMBus block
 read setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-i2c-xiic-v3-1-ccb3cf70ba03@nexthop.ai>
References: <20260513-i2c-xiic-v3-0-ccb3cf70ba03@nexthop.ai>
In-Reply-To: <20260513-i2c-xiic-v3-0-ccb3cf70ba03@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778666964; l=5594;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=vYE0xt5ladoi1dJg8uPeJA+CI0rDe1yUCtJxngY5Y/M=;
 b=InRJ8GC47z6CGZfH6AUaiklz7fCO/eo9JoqVc/9hW/iT/SqSQac4WrJ16eBgP9B7Gq7DtEIT6
 FVP2FJkUSV8DCTcrfX2MkSjTwNbTA9FOQxwRQ9xmYcaa16VTtjzz9fg
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_030927_000196_E794CCCB 
X-CRM114-Status: GOOD (  25.44  )
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

xiic_smbus_block_read_setup() recalculates i2c->rx_msg->len based on the
length byte returned by the device, but historically clobbered the PEC
byte expectation the SMBus core had baked into msg->len. That dropped
the PEC byte from the caller's buffer on the normal and chunked
receive-fifo branches.

Compute pec_len up-front as (i2c->rx_msg->len - 1) and add it to the
new length in every branch:

  - chunked (rxmsg_len + pec_len > IIC_RX_FIFO_DEPTH): set the drain
    target to rxmsg_len + 1 + pec_len.

  - deferred (small enough to drain in one fill but >= MIN_LEN total):
    same.

  - padded (1 + rxmsg_len + pec_len < SMBUS_BLOCK_READ_MIN_LEN): the
    hardware needs at least 3 bytes on the bus to exit the read
    cleanly (the second byte is already being clocked in by the time
    the ISR reads the length byte and is too late to NACK), so we
    still pad rx_msg->len up to SMBUS_BLOCK_READ_MIN_LEN. The dummy
    trailing byte that gets drained must then be trimmed off before
    handing the message back to the SMBus core; otherwise
    i2c_smbus_check_pec() reads buf[len-1] (= dummy) instead of the
    real PEC byte at buf[1] and rejects every clean zero-length block
    read with -EBADMSG.

    Record the true valid byte count in a new field
    i2c->smbus_actual_len and have xiic_process()'s RX_FULL completion
    site trim rx_msg->len down to it before clearing rx_msg.

    Widen the branch condition from the old "(rxmsg_len == 1) ||
    (rxmsg_len == 0)" to "(1 + rxmsg_len + pec_len) < MIN_LEN" so that
    user requests with multi-byte trailing bytes (e.g. pec_len == 2 on
    a zero-length block) flow through the deferred branch instead of
    getting truncated to MIN_LEN here.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 40 +++++++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 3e7735e1dae0..d4308716d461 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -73,6 +73,11 @@ enum i2c_scl_freq {
  * @prev_msg_tx: Previous message is Tx
  * @quirks: To hold platform specific bug info
  * @smbus_block_read: Flag to handle block read
+ * @smbus_actual_len: For SMBus block reads padded to SMBUS_BLOCK_READ_MIN_LEN,
+ *	the number of bytes that are actually valid (length byte + payload +
+ *	optional PEC). msg->len gets trimmed to this on transfer completion so
+ *	the SMBus core sees the real PEC byte and not the trailing dummy.
+ *	Zero when no trimming is needed.
  * @input_clk: Input clock to I2C controller
  * @i2c_clk: I2C SCL frequency
  * @atomic: Mode of transfer
@@ -98,6 +103,7 @@ struct xiic_i2c {
 	bool prev_msg_tx;
 	u32 quirks;
 	bool smbus_block_read;
+	unsigned int smbus_actual_len;
 	unsigned long input_clk;
 	unsigned int i2c_clk;
 	bool atomic;
@@ -539,6 +545,8 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 
 	/* Check if received length is valid */
 	if (rxmsg_len <= I2C_SMBUS_BLOCK_MAX) {
+		unsigned int pec_len = i2c->rx_msg->len - 1;
+
 		/* Set Receive fifo depth */
 		if (rxmsg_len > IIC_RX_FIFO_DEPTH) {
 			/*
@@ -546,23 +554,30 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 			 * Receive fifo depth should set to Rx fifo capacity minus 1
 			 */
 			rfd_set = IIC_RX_FIFO_DEPTH - 1;
-			i2c->rx_msg->len = rxmsg_len + 1;
-		} else if ((rxmsg_len == 1) ||
-			(rxmsg_len == 0)) {
+			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
+		} else if (1 + rxmsg_len + pec_len < SMBUS_BLOCK_READ_MIN_LEN) {
 			/*
-			 * Minimum of 3 bytes required to exit cleanly. 1 byte
-			 * already received, Second byte is being received. Have
-			 * to set NACK in read_rx before receiving the last byte
+			 * Hardware requires at least SMBUS_BLOCK_READ_MIN_LEN
+			 * bytes on the bus to exit the read cleanly: by the
+			 * time the ISR pulls the length byte from the FIFO,
+			 * the second byte is already being clocked in and
+			 * cannot be NACKed in time. Pad the drain target so
+			 * the HW reaches the minimum, but remember the true
+			 * valid byte count and trim msg->len back on transfer
+			 * completion -- otherwise the SMBus core's PEC check
+			 * reads the trailing dummy byte instead of the real
+			 * PEC byte and rejects clean transfers with -EBADMSG.
 			 */
 			rfd_set = 0;
 			i2c->rx_msg->len = SMBUS_BLOCK_READ_MIN_LEN;
+			i2c->smbus_actual_len = 1 + rxmsg_len + pec_len;
 		} else {
 			/*
 			 * When Rx msg len less than Rx fifo capacity
 			 * Receive fifo depth should set to Rx msg len minus 2
 			 */
 			rfd_set = rxmsg_len - 2;
-			i2c->rx_msg->len = rxmsg_len + 1;
+			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
 		}
 		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);
 
@@ -797,6 +812,17 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 
 		xiic_read_rx(i2c);
 		if (xiic_rx_space(i2c) == 0) {
+			/*
+			 * If the setup path padded a short SMBus block read up
+			 * to SMBUS_BLOCK_READ_MIN_LEN for the HW exit
+			 * workaround, trim rx_msg->len back to the number of
+			 * bytes that are actually valid so the SMBus core's
+			 * PEC check reads the right index. Must happen before
+			 * the rx_msg = NULL below.
+			 */
+			if (i2c->rx_msg && i2c->smbus_actual_len)
+				i2c->rx_msg->len = i2c->smbus_actual_len;
+
 			/* this is the last part of the message */
 			i2c->rx_msg = NULL;
 

-- 
2.53.0


