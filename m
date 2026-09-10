Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2439AC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 03:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lps2PcX6rctm/ghGucB1Y2c/dEcXRtrtImT6mc9AsLM=; b=wRw7Heo6Js9Eb33qwYT6lWT49e
	dS58+QHuRMLJgzs0yi1I/bDd9gXhNTe8TxYjUdfbgEhKjJXNvfKZ5BOcFb5neYCf1ReGg+FghztKe
	73/fnTp8QIT4gqpNYYHfFJ4m6bJyGooe/O0OmwZIPYjuv8z6Mx3dj5gs0NP2sr4AgunRsQ2TPfYWY
	eMxSiKM2ituqqvIf7mQBxnhpzdEilTyQ+F95AgamwcIV1UOwcGLOpEBXHX6kSstFWbbeF/TmjhvUc
	cSuMWXKBQ0bNsVP8p018Jv+rMvyLWvCitr/UVco8bAaV0JbEDwTvjbzpeb3BqpUb3qB3nhx5K31QB
	eirXoCYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Vdz-0000000DJYC-0CFG;
	Thu, 10 Sep 2026 03:40:11 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Vdw-0000000DJWh-3cXI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 03:40:09 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-398c066106cso786074a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 20:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1789011608; x=1789616408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lps2PcX6rctm/ghGucB1Y2c/dEcXRtrtImT6mc9AsLM=;
        b=jxifPFQfSdoA8pXEVsHTQpthZ9tfWaTD4JCz/SA3OtdvowKOh/bS84GFLfqykcY8QJ
         genzBjPUMDpjKOWqS0w51/RLKkqpKVvm/S7Fh/LlVjSKc7tzkIZbok6wxA1rR7jJ4yTt
         GYey8APXQuU8tpFBQhfwE9En/kql+9fIabJUsDzwyhBschumelyoYtb1uct0F0T7nvl9
         xegBUIl/eqMDpkEiv+64K+/CTYRMVEcKHu7B51h4kmKZeYWzxc9tokC1v2p6Ni+uDfI4
         Cxke3pylJX7Rzi9J8hzMUjwD1LbbUrKqy5+YVtnYLWWUzzMLfAPVFgRTqjtcU9ATNZdS
         xGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011608; x=1789616408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lps2PcX6rctm/ghGucB1Y2c/dEcXRtrtImT6mc9AsLM=;
        b=XwPh4x73zm+y+z87VXWjl+idyiQpYXb8I18TE0XtkBYpf2XZd19JW8Bh6j/3/+UDNf
         FVEJY+lCxRMBZ3A+UhaHFpRUv8f9Vlb2Ve09EjI4wBLCb2RMuvabfomSqoOmvsN38ilG
         BM6brLa0NehMpE22P3XbYpGr48HMa+juS3dy4E/6WCVeav66RTDhnCrEZWDbI22KQNVu
         Zt+ZNa2cGyBC8dMmEcEg7VjWe7k8qkG5EYEoWRzugf1Q3XDHR8L4I7d7hzBnVdGzh8L0
         CC/K1X1iVQXbVJ00phLLBJeraKU1J64Aa+arDJy1IJpCYaQB+rIvTEw4d+UH/OiP8Scj
         cGWQ==
X-Forwarded-Encrypted: i=1; AKwUvByWcjWiwhD76wXs8OKgvSvrXd7UJ8I5rVc8muJ7dGyEASRry/lKYniM08p8aqzCBX6803idhDuYqwEpXFcKLesX@lists.infradead.org
X-Gm-Message-State: AFuF++mBKUi/FkCxzflO1YwwICYxJafX7Kvi7rGYzRbIdOn6tZ2N5I4+
	LchNn0M30mBL/g7jaiT4oRCn5nFEoP4LqwVGNjpmH98MBhxazX68gv1WUpJMzGGkD38=
X-Gm-Gg: AYBFou2A79lXvSp+K/rsyNSX8tEa0zq9paVp1eqYktFDkBm5G1/Yc+mVUP+o3eKxD15
	ASGKEY+9nWUjNxX5zLxJ+N+l2P7Exg/upmqYIk4NtLByxW2wc0ktfBfvZigjPqfbdpsn1spva9D
	JSrQctmvV/1Sd5Rk1QuCYsUQHdG7yhnkHrv8B/4nMz049ZxSbtspzBgZRSexqbugl7P3oWqD7De
	ElpR3MxIOkS+Qo66fkNbFlJgzE5KEfi9YdUU9ec+cZCLtcPg+p5Ibykj/OYFc6vMnPCfzWeviw+
	crxePRsbGeDEnT+WGy+TiOTSSkiU9eYDX9dY8ARK6aXwT4aiyhynIkvOmxOnub7jm2zr0jqkqP4
	EfHaxj8Q/qQqG2kYvhEArYsYMjlkOaQFtnkwzvidV7cMShQily5WzCU7c50xUYnEBsQkUgTaaMh
	DnLpGNfH1Wqw53yHt/cxIU2ep1ECrDNDRNDEZh7kFNsuYE0QOsSzOvDXcwxG83PmCq1nZgsCJnF
	w==
X-Received: by 2002:a17:90b:498b:b0:398:ba56:b926 with SMTP id 98e67ed59e1d1-39d70c55164mr7843926a91.25.1789011607677;
        Wed, 09 Sep 2026 20:40:07 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58294850c88.5.2026.09.09.20.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 20:40:07 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 09 Sep 2026 20:40:03 -0700
Subject: [PATCH v4 1/3] i2c: xiic: preserve PEC byte length in SMBus block
 read setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-i2c-xiic-v4-1-218df31e9d3b@nexthop.ai>
References: <20260909-i2c-xiic-v4-0-218df31e9d3b@nexthop.ai>
In-Reply-To: <20260909-i2c-xiic-v4-0-218df31e9d3b@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789011605; l=5641;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=MYC3xNfD+YSfcsRaI0KtZmCIgrfUNCSXFcjulNKq+b0=;
 b=rh42/85Gl/frBlCHHRWSu4X0kI6vDh01a6lIPJBKwfpO30JarflveioDF49oQXSr4iN6Bkcc6
 wd50t3nYZ8UAHZYY8ycBwZtoq94QJSd53r6YivZsvBkB3Dnr0k+Pqss
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_204008_928327_46234E6A 
X-CRM114-Status: GOOD (  25.65  )
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

Acked-by: Michal Simek <michal.simek@amd.com>
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
2.54.0


