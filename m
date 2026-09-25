Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E5AC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 00:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwla+qYJcPM+0e9z6oZqkKd9MiKwlDQWnaoxKLv8300=; b=SHDy4SH5nFEgwFngT/sglmPvxI
	PWp+byuIIN9IVPXg2bfJ8KsxZSULHeE4S2YoelICngT9nCC0eTEOMA2jFQ7AJmTh/47qSjAI1fMTM
	I9yvCov71nkedJ4vuGTempnS7V+Ygv9XsLhgSXmA47fe3EJPanVPmeL5AOcDy1PrZaWOig4SuUSJ/
	78tP3qAnCNKiJO5LIUuxzYcSgnxex1LRdvz4Nhba5C+8nTcvgT1iq3TYJapZNBWTLpo+pgyMpY/X+
	bDaKfrOhVukLoppwJtPkCS1cXge018vFnITxWtoypcYSupTBCvAjc3+JWQGGXWM2YPc9WM+z/E859
	1OotItYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tWc-0000000CRLC-1Iel;
	Fri, 25 Sep 2026 00:10:50 +0000
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tWT-0000000CRIS-08s4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 00:10:42 +0000
Received: by mail-dy2-x0e.google.com with SMTP id 5a478bee46e88-3413069aa25so170012eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 17:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790295040; x=1790899840; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwla+qYJcPM+0e9z6oZqkKd9MiKwlDQWnaoxKLv8300=;
        b=jnNDC6PWn51owhj01Ue+q9lCwEy7GWwOneg87BsXH+2nu2butaIuCtaO6mL0FfqEAe
         fchEdoCpu6Vj3lL2XGRZJlI3o0VJQHC9L7eDsbfGEXWYPyrgytmg5X0F3COS4HImVVs6
         AQAjdWPmM7zvwpNwVSdz3URAkqhbkYXaZdQk/3QuJjbAsxAZPeLolfp+L3hhxGtBllFS
         O3pJklcx9wAvkZD0qZJy7s1vvYjC0Wcc/xhu6L/SecbAXVLtU9qX4qG4y9FvtQ4kRaNX
         5pHL83QsLD53Zu1g4N6SIX0JJqNXAKaLAXRLoU8OOxCwJcacoLfSyLf8tS8dnZpAqkg6
         m+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790295040; x=1790899840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwla+qYJcPM+0e9z6oZqkKd9MiKwlDQWnaoxKLv8300=;
        b=LFOxvbo0VOQKnCLRHr4lanQkS4cHIzkUzxnrJBqvxnE34KHladK2BmtzkNFaUxrZK8
         ROshYnuUly0eFvAsOWDoWyEkD6+swFSnGlwb1EuR1wgGMmfTDhju8hUXsy68sIt2g52D
         wWiiUyJVA+DZbnljxw7CHu4ITqLWFZ/dElPDE/NBVXWQDuHxYWWImRPqcWHOuwt01cJe
         SeYgvX9Pzu5AxavQIXYcVEX7yDUkluOxsDV8tJg/3DPIhwWhc7f+QHf/sOO1oPTm8qkm
         5nCJN8YtWHyH+Aou/+n8iEEM5v0K6LNbEEbKR3Fh/js751ipG3W5O5Y0SYI8R46x9qAZ
         0r9g==
X-Forwarded-Encrypted: i=1; AKwUvByCrlES7qkRHwtPLsGjzjRQYvu3g+tpdrb8nhDLJev/H9DKVAhSan5N3KU+9RdFZJayV4DHzYHGCorL+0GGTlqI@lists.infradead.org
X-Gm-Message-State: AFuF++mIVh1nOav6f3WXVK6F43dPtGR4btMRrzg6iKvDbheIzc6yAzet
	N3S7VCjtxniS1G3agUFfPKkdIaVjjxth5XCNvai95GSmgWKfVOAIiiuJgCW/Ix0n4Io=
X-Gm-Gg: AYBFou3WhUASHq0ybu5bQGobFlVz9dTr9pdT/RyV+fZJUAEq59s+MvT3KcdYlBGvtVb
	/Ek1boRRo151ybh/2QBbmNexcL3WVE6FXwLSezU1Zm8wjl5BqFlOlRxcowYDLp66Aaox5xpkhhd
	DIRmk8VHMKOGMe3FniHLbNna2XvnTNe+fMudZ6GWrKgBU5kU6wsqBxXNnxMxyt+xjJ9i2wrwXfX
	ZeYJS7d946plzgmAfHtRKPGttmrzWplm0fswu1nMlHNvuodbgrzSYWi2nb3nXfZqG0Kl36C/9mG
	VrF2eFpFf9NkUuZ2kHydYk/AMcN+Xv3cGHxV+gWv2V0tlcEMe0Y0VhUaaQ7H2FAoGr/0iSLCxNu
	Vz1SguflGVOtp4gQ4ZiXXs5Ks3cYaEM2KcsoMokBb9Ta5pt3F6jrsSd9HSu2asT2QezzzLfsiTT
	eGfuNliL0Q7G7/OPmVJL3Wn5PqZfnV4RKnSbU5GjPXBM4BMi+Cjn0qJ1S5ncvqKKqMonPjnYXlZ
	Q==
X-Received: by 2002:a05:7300:ea06:b0:33b:ef1f:14b9 with SMTP id 5a478bee46e88-34004b8b691mr2871986eec.15.1790295040193;
        Thu, 24 Sep 2026 17:10:40 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145632298sm1787647eec.22.2026.09.24.17.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:10:39 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 24 Sep 2026 17:10:35 -0700
Subject: [PATCH v7 1/3] i2c: xiic: preserve PEC byte length in SMBus block
 read setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-i2c-xiic-v7-1-df7e752332ef@nexthop.ai>
References: <20260924-i2c-xiic-v7-0-df7e752332ef@nexthop.ai>
In-Reply-To: <20260924-i2c-xiic-v7-0-df7e752332ef@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790295038; l=7659;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=eTX02wyE5ouxkmqtS51Q5M+dSBWGkFgKNZs9s5Tgfw8=;
 b=Q5/svQRlhuGQRMYEZeJJuOrRs5jygK4L1lcoVPD2tvjABzzrUIY8/KC5yrUKakTQcQjaI2VID
 ClMbLuhatI9BVSbA9jhvfZ7FQg6QAb+f9LCoK7/U+te4iDr5kg7J4dO
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_171041_085316_9AF89BCA 
X-CRM114-Status: GOOD (  32.14  )
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

Compute pec_len up-front as (i2c->rx_msg->len - 1) -- the trailing bytes
the caller has already accounted for beyond the length byte, 1 when the
SMBus core enabled PEC, and possibly more for an I2C_M_RECV_LEN request
coming from i2c-dev -- and add it to the new length in every branch:

  - chunked: the trailing bytes do not fit in the Rx FIFO, so drain in
    chunks. The guard becomes (rxmsg_len + pec_len > IIC_RX_FIFO_DEPTH)
    rather than rxmsg_len alone, both because pec_len bytes also have to
    fit and because it is what bounds rfd_set in the else branch below
    to the 4 bits of XIIC_RFD_REG_OFFSET.

  - padded (1 + rxmsg_len + pec_len < SMBUS_BLOCK_READ_MIN_LEN): the
    hardware needs at least 3 bytes on the bus to exit the read cleanly
    (the second byte is already being clocked in by the time the ISR
    reads the length byte and is too late to NACK), so we still pad
    rx_msg->len up to SMBUS_BLOCK_READ_MIN_LEN. The dummy trailing byte
    that gets drained must then be trimmed off before handing the
    message back to the SMBus core; otherwise i2c_smbus_check_pec()
    reads buf[len-1] (= dummy) instead of the real PEC byte at buf[1]
    and rejects every clean zero-length block read with -EBADMSG.

    Record the true valid byte count in a new field
    i2c->smbus_actual_len and trim rx_msg->len down to it in
    xiic_smbus_trim_len(), called from both completion sites that clear
    rx_msg: xiic_process()'s RX_FULL branch and xiic_recv_atomic(),
    which drains the FIFO with interrupts off.

    smbus_actual_len is per-receive state, so xiic_start_recv() clears
    it before every receive. Only the padded branch ever sets it, and a
    block read aborted by arbitration loss or a TX error never reaches
    the completion site, so without that clear a stale value would trim
    the length of an unrelated later read.

    The condition is expressed in total bytes rather than the old
    "(rxmsg_len == 1) || (rxmsg_len == 0)" so that a request carrying
    more than one trailing byte does not get padded: padding records a
    length the drain never reaches, which would hand the caller a byte
    that was never received.

  - normal: all trailing bytes fit in one FIFO fill. rfd_set gains
    pec_len for the same reason the length does. Because the padded
    branch above has already taken every case with fewer than
    SMBUS_BLOCK_READ_MIN_LEN total bytes, rxmsg_len + pec_len is at
    least 2 here and the subtraction cannot underflow the u8.

Fixes: e4c1ff772e1a ("i2c: xiic: Add smbus_block_read functionality")
Cc: stable@vger.kernel.org
Acked-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 54 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 3e7735e1dae0..0777de45bdf4 100644
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
@@ -539,30 +543,38 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 
 	/* Check if received length is valid */
 	if (rxmsg_len <= I2C_SMBUS_BLOCK_MAX) {
+		unsigned int pec_len = i2c->rx_msg->len - 1;
+
 		/* Set Receive fifo depth */
-		if (rxmsg_len > IIC_RX_FIFO_DEPTH) {
+		if (rxmsg_len + pec_len > IIC_RX_FIFO_DEPTH) {
 			/*
-			 * When Rx msg len greater than or equal to Rx fifo capacity
-			 * Receive fifo depth should set to Rx fifo capacity minus 1
+			 * Trailing bytes (payload plus any PEC) exceed Rx FIFO
+			 * capacity, so drain in chunks. This also keeps the
+			 * else branch below from pushing rfd_set past the
+			 * 4-bit XIIC_RFD_REG_OFFSET field.
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
-			 * When Rx msg len less than Rx fifo capacity
-			 * Receive fifo depth should set to Rx msg len minus 2
+			 * All trailing bytes fit in the Rx FIFO. The widened
+			 * condition above guarantees rxmsg_len + pec_len >= 2,
+			 * so this cannot underflow.
 			 */
-			rfd_set = rxmsg_len - 2;
-			i2c->rx_msg->len = rxmsg_len + 1;
+			rfd_set = rxmsg_len + pec_len - 2;
+			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
 		}
 		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);
 
@@ -575,6 +587,16 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 	dev_err(i2c->adap.dev.parent, "smbus_block_read Invalid msg length\n");
 }
 
+/*
+ * Undo the setup-time padding of a short SMBus block read before rx_msg is
+ * cleared, so the PEC check sees the right byte.
+ */
+static void xiic_smbus_trim_len(struct xiic_i2c *i2c)
+{
+	if (i2c->rx_msg && i2c->smbus_actual_len)
+		i2c->rx_msg->len = i2c->smbus_actual_len;
+}
+
 static void xiic_read_rx(struct xiic_i2c *i2c)
 {
 	u8 bytes_in_fifo, cr = 0, bytes_to_read = 0;
@@ -797,6 +819,8 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 
 		xiic_read_rx(i2c);
 		if (xiic_rx_space(i2c) == 0) {
+			xiic_smbus_trim_len(i2c);
+
 			/* this is the last part of the message */
 			i2c->rx_msg = NULL;
 
@@ -938,6 +962,7 @@ static void xiic_recv_atomic(struct xiic_i2c *i2c)
 			return;
 	}
 
+	xiic_smbus_trim_len(i2c);
 	i2c->rx_msg = NULL;
 	xiic_irq_clr_en(i2c, XIIC_INTR_TX_ERROR_MASK);
 
@@ -955,6 +980,9 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
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


