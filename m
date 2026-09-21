Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A977C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnxM12bjAU6l32+T085J4xBzZcACDHL6vkRV2pEi6lg=; b=tD94oH3te8M2/aXQ/8ZW7leANA
	RjvGT/EO0h5Bd6dx8yDZKaIMBP2nzUIhBpAC0LDm7uiP1gmAolt5GlxHoTf+byZwJ6kabkyNaSi3p
	T/avMnEG2Lv7Dz/Fe+cCjaWY7arcH/TNxv1WTG/bx8tYN0oW79g7MRXlaOSDDnnZTI544QNifYvm9
	I+YDf8lUzKoFB8Y9FPWCEDmnOzJpK1TQt/BOR9Eon20S2gHUiE2Czf3vVfy7JSh6zFsMLMAskcYY4
	Yq5O5ZyeYN0mrb4mxkCjUpAYE2c+tbDtmj7FKmn18qLFvnggyduNpIneqElGXg/sYeYbcHqqxrSxs
	zpGrB+ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ii2-000000036ie-2a8C;
	Mon, 21 Sep 2026 18:25:46 +0000
Received: from mail-pz2-f42.google.com ([74.125.228.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ihy-000000036hT-0FQh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:25:43 +0000
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so2795370a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 11:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790015141; x=1790619941; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnxM12bjAU6l32+T085J4xBzZcACDHL6vkRV2pEi6lg=;
        b=G2PaAIXQ8SN7EpR2TjZtJZx2nAYM/F/uHXZhuSjzKDwRJldsPWRW1IHxE6k8+FJ2dF
         +rIWK1aGdIx0jPMKAx7xqxwJ7ZQK/pbtHx6j5cXo14hWh/2n9M7nFD8s2C6Ssw1tcH4l
         jsjckifRHIQ+CA6GUB8YrUq8gN5awxcyW3GNxXHkspBmcTk9kp5tykzXCZKA1nlx4uvO
         ieNKitSOgA1L3uJfHQwWFHcUnAuWw7D4a3D+v6IKeGfWDdlBaYq5EodaheYS3A7RNSqv
         2DvrhzRLRHXelUxdLxdBQuq4MP7FNS8wsgRm+Vg7j8XWSsfH6cFdjQwFE2hzFZrfNDQn
         pzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015141; x=1790619941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnxM12bjAU6l32+T085J4xBzZcACDHL6vkRV2pEi6lg=;
        b=sQEkdJZJ0++gQQ9xD/tMbARKc/sn6eU29U5Pr8QV9m+Pg1iS83a0ySGP9JtsGiHHOI
         oxMfOOiVx6MYQzV5xM2mCBmiaJGGyIHN6lZapO8AtxhwgqYqXolYQcU/ZJnWrVCGT/B6
         /fU+tvSs6L4WzRlcDvLErP/X5OHZcObo0e4qrSAsZhuroJOwvxmE5Vbv6pucAkQMZCbi
         jHcdVJnMPBUcPMgyabicixoAFyF8rkH7VZBXO3UewAa2t/YyAfaOk1croas79X3O/etj
         dnj30XE5IUNyqNbkYqw6BS3DtASH6UgMSCAHq7YhbCprOWoZiNi4lMDkUmbp6Ad8xBbc
         NDjA==
X-Forwarded-Encrypted: i=1; AKwUvByO24/jLLsNP1QjLpJmRPC7T0oEKhRg12lnIpMusVUoVV6tIjvt8p0IAargZnxvBSiKrF1TLO0nfWywIYAo2rU9@lists.infradead.org
X-Gm-Message-State: AFuF++kPbAs3PFtImbo74d3SmHsdlAON5fcGyHyt+yJaBCuR/a1XxA10
	Sys3f28uPPWFs4bxiAv01XQRlhb41i4/BhcvSfMeKzpIg+OoiYzSQwRVi+heKqEXU/Q=
X-Gm-Gg: AYBFou2vimaDXcs71SkCsAaLVlWuqkUc0it9/v6rUk/V/nJ8Pae7joYRRoGdL7fd9EC
	qc426jTkXlwJ7p/xWC5Q8LYWnuQTk7dgPb5as+eQDbgwdqC6e55hTeINAFHIV5Gmz4JnlMvPG/e
	JkGQexfOEvbKQzSUdrIFlMkSLhVW/1MaWDNkfi+9U8p+GIj/sfoXGE2kdrpjGTfNEQwGgi1in3z
	rm+IdWJxH4X91l8mupSQcS62+cGrRKSkuapmkFeXPv+wYDgB4002YKNOAsMAP1hO6oV4onLrEdL
	km5YcanI0zat2JwtQBrcpP0oF/fQxmqxbg7Nuj4ujMQnnbuTl818SQB9Gtwz1g73ebrUXirIWD+
	GYcLCt888g3Gkily/2EvAlZVY4glFLvuiitQDj7Aj/mrBufaT8qNYtrOOcFytR759pLTyT0AoPe
	jNd45Xe/+uX9hgdh+14f6B4QUa6GCX/Cp/wVcB4xG7yhHgQS0c6KdN8kqhXCbl+1tE5i4JUVZ0C
	g==
X-Received: by 2002:a05:6a21:4c81:b0:3dd:a196:906c with SMTP id adf61e73a8af0-3dda196a65dmr12713643637.54.1790015140904;
        Mon, 21 Sep 2026 11:25:40 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144df9ad683sm12408974c88.6.2026.09.21.11.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:25:40 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 21 Sep 2026 11:25:36 -0700
Subject: [PATCH v5 1/3] i2c: xiic: preserve PEC byte length in SMBus block
 read setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-i2c-xiic-v5-1-2fca81e810ea@nexthop.ai>
References: <20260921-i2c-xiic-v5-0-2fca81e810ea@nexthop.ai>
In-Reply-To: <20260921-i2c-xiic-v5-0-2fca81e810ea@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Raviteja Narayanam <raviteja.narayanam@xilinx.com>, 
 Wolfram Sang <wsa@kernel.org>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790015138; l=5861;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=Zw7I68dk/dfQhHon05xSczDRBjRS89SCdhc9Ul/iA8c=;
 b=hWgnVzhwB+BfXuq7pCDIDcjklKC5IdWFIUMjL8pPfjX0kmLkMe4PrklykCUOBH/adfk1HVV5R
 EgV2AvU1Y+QDLMH4+f1sMsEQwD0FWzQQyzkIBoIi1+4AskvkK1f4AEi
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_112542_107360_5767FB77 
X-CRM114-Status: GOOD (  27.83  )
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

    smbus_actual_len is per-receive state, so xiic_start_recv() clears
    it before every receive. Only the padded branch ever sets it, and
    a block read aborted by arbitration loss or a TX error never
    reaches the completion site, so without that clear a stale value
    would trim the length of an unrelated later read.

    Widen the branch condition from the old "(rxmsg_len == 1) ||
    (rxmsg_len == 0)" to "(1 + rxmsg_len + pec_len) < MIN_LEN" so that
    user requests with multi-byte trailing bytes (e.g. pec_len == 2 on
    a zero-length block) flow through the deferred branch instead of
    getting truncated to MIN_LEN here.

Fixes: e4c1ff772e1a ("i2c: xiic: Add smbus_block_read functionality")
Cc: stable@vger.kernel.org
Acked-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 3e7735e1dae0..22367a069ded 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -73,6 +73,9 @@ enum i2c_scl_freq {
  * @prev_msg_tx: Previous message is Tx
  * @quirks: To hold platform specific bug info
  * @smbus_block_read: Flag to handle block read
+ * @smbus_actual_len: Valid byte count (length + payload + optional PEC) of a
+ *	padded SMBus block read. msg->len is trimmed to this on completion.
+ *	Zero when no trimming is needed.
  * @input_clk: Input clock to I2C controller
  * @i2c_clk: I2C SCL frequency
  * @atomic: Mode of transfer
@@ -98,6 +101,7 @@ struct xiic_i2c {
 	bool prev_msg_tx;
 	u32 quirks;
 	bool smbus_block_read;
+	unsigned int smbus_actual_len;
 	unsigned long input_clk;
 	unsigned int i2c_clk;
 	bool atomic;
@@ -539,6 +543,8 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 
 	/* Check if received length is valid */
 	if (rxmsg_len <= I2C_SMBUS_BLOCK_MAX) {
+		unsigned int pec_len = i2c->rx_msg->len - 1;
+
 		/* Set Receive fifo depth */
 		if (rxmsg_len > IIC_RX_FIFO_DEPTH) {
 			/*
@@ -546,23 +552,26 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
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
+			 * The HW needs SMBUS_BLOCK_READ_MIN_LEN bytes on the
+			 * bus to exit cleanly: by the time the ISR reads the
+			 * length byte the second byte is already being clocked
+			 * in, too late to NACK. Pad the drain target and record
+			 * the real length, trimmed back on completion so the
+			 * PEC check sees the right byte.
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
 
@@ -797,6 +806,13 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 
 		xiic_read_rx(i2c);
 		if (xiic_rx_space(i2c) == 0) {
+			/*
+			 * Undo the setup-time padding before rx_msg is cleared,
+			 * so the PEC check sees the right byte.
+			 */
+			if (i2c->rx_msg && i2c->smbus_actual_len)
+				i2c->rx_msg->len = i2c->smbus_actual_len;
+
 			/* this is the last part of the message */
 			i2c->rx_msg = NULL;
 
@@ -955,6 +971,9 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 	u8 cr = 0, rfd_set = 0;
 	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
 
+	/* A stale value from an aborted block read would truncate this msg. */
+	i2c->smbus_actual_len = 0;
+
 	if (!i2c->atomic)
 		dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
 			__func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),

-- 
2.54.0


