Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860FEC98304
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 01:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sciGWXbPKjaBz8QOgB5kzziZxkd6jBEVBtn6uKIW3/M=; b=wCj69VFjwH1mWaLNO3ApCFXncb
	lXb571SMGVMso2PUW1GDHON07+GpMJg7XUNUh8GBEDES7UQxp+0eZotvT9kvF0ZZOZJxSmrTDiW0x
	DMkdnHY+EA5OHGq9+C4aMeMnjsMHTvCvBj8yNiYmW7AziAYs/tv8ZvZBTc7IDMQXmznaiXQaUgTHu
	PIsspbVqJ2oK0AYrPXe45Ejttg71JphozeO+K9czp+DNJ7Mv/NmZiYq6C+w4L6Q4h3+on1LIOlTJP
	FynDeZjuNDMMgMbYtcWkXeuwp1xpuohaLxHsbuckrVxwct8CJ/EMCczTrzpaEmo6CPkFEsIhn91o0
	5L/LM2kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9YWv-00000009ovZ-3Khc;
	Thu, 24 Sep 2026 01:45:45 +0000
Received: from mail-dl2-x0e.google.com ([2607:f8b0:4864:38::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9YWt-00000009oup-0zOo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 01:45:44 +0000
Received: by mail-dl2-x0e.google.com with SMTP id a92af1059eb24-144df39b6cfso1141399c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 18:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790214343; x=1790819143; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sciGWXbPKjaBz8QOgB5kzziZxkd6jBEVBtn6uKIW3/M=;
        b=N7GQ1jqs1esou0egqwl1LbGqOA/2LkjHmpM90lGIyFEAA078UpBEXSZ+ARWEcSESrj
         4s9fpvpMp1dCipF7jEu6QnkralcHfQLKh3MCcSX9zk8qKFn3Inglkzm8LstYDmeoVPz3
         ARH3b+jwat6KJCLnRUutGjZVNea7C3joLLRdBDXii4CRtt1T/LbR39RPoOKe9t2rs/Hn
         ngTgpqRCfhf1vpW6YGKMMbv9pZp589XXcOM4Y3igoGRWWNtVmDWMO+7YKB+zreXdIPia
         CuyEHVD/SYUStFtdNu7GZUr6cM4tJmGQVka2+pzOf2eWOLjfBtdxF16GwjET1ITyyRmg
         DiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790214343; x=1790819143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sciGWXbPKjaBz8QOgB5kzziZxkd6jBEVBtn6uKIW3/M=;
        b=PwiFGw+rTZVKVmlg3DcrnoHD+pZmSy6g5wSV5pn/HW0EuQ0wpi8Ax2snXciFTouiQU
         HURBFHXH99R4K8q7JWiuOHsxhIb9e8BeOUUogRnengvvMXEYsP3jjQ3PQhZeYSdf3/zl
         3C4W7FSsMYcmZGRL/saPpI0Pej7eoDupmEhVXoCOgrCbGCzgb1YJzpuC/CULU0SJ/Lky
         Wqbuljj42J+/YmttMD5oEiJChMlx3E2UkbJr1vo1P1Mn5Tbd+YhcHnqLNhPsphl//xS5
         RCzGwCnb54XHpTlPs7n0EE4b/o3Z+/A1U1NnCWG/sFuZSsaUHUpJmDhCXavvlTCLFOpK
         R2pQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9cA69TXFPt7sz6gRAuIR9LsySlRd2/ITqt9Brv+pwN0wrh3MyV1xYoohQkMKUp2ihdyInMe0Hq0Zj3ZTvsFtU@lists.infradead.org
X-Gm-Message-State: AFuF++kz882CXgy9lKvRHPsyL8ITI3MPdm6vcQfS3Yj/MgNAXxOLgTac
	OXYE5RmnUbFSS30dUTX7QU87bI/vRYuV49Pmz7CIW0xx+PZxzSsTrFv2nas/2FZnQhA=
X-Gm-Gg: AYBFou1vWd6/dpPxR7da0zwZg141Jv8Ri6gzRmty5X+SabZ9EnkGLna/S8rEbkPpbf3
	jwrZgVg9I2yfoMPbnZIRse0Qsl5ZKB6btMiegNKHlGsYFuZ/SKhpRReL4j/AD90SuMFVjJLFJr5
	rANJ0AFrYueslG1anqNGANMQhKV/EdM5FnnxEGZ/CB8QgBtAT95jB7UZmQt9oAQ8DQoarcNmN8q
	cqF01AMOlMZo16fU54tnv47FYWNIUY42kYlHwuqK4hXpOSuX1rb9TFB6/uWLgwVizz0opMpS/0i
	LXbhJfM66D5gjHTTEpGSZZvLCvqaS9Q9hEHY+mlUfTZKxXnotkBwEmvARMaUwAORCCPkzwX5z/O
	TNYbQbBGHO8QC3LxEmiKr1B4xdM23WgqThe15zbNlswUzPAkWPkNPC3xQF0zQjh1YDB+P/edBvk
	fca0QtRShpsI5BU+L6EI7kciOzxPa4XacW7C0fKfrTMF5fxncljiykMINCYwWBWIs0xR7yqNotX
	A==
X-Received: by 2002:a05:7022:294:20b0:13b:3bee:1e2e with SMTP id a92af1059eb24-14503fa45acmr668581c88.18.1790214342262;
        Wed, 23 Sep 2026 18:45:42 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14501794269sm2927598c88.8.2026.09.23.18.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:45:41 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 23 Sep 2026 18:45:36 -0700
Subject: [PATCH v6 1/3] i2c: xiic: preserve PEC byte length in SMBus block
 read setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-i2c-xiic-v6-1-3a15b6397f5a@nexthop.ai>
References: <20260923-i2c-xiic-v6-0-3a15b6397f5a@nexthop.ai>
In-Reply-To: <20260923-i2c-xiic-v6-0-3a15b6397f5a@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790214340; l=6559;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=k/4jwuXnA12hp9k1BEvLCcEgKt2ybI+KTJlDgEkJj5E=;
 b=r4M8X37QqLw4CWgFFpJYX3JMWOwMDO9jjlOqzPXK17vlYuyqjFULgyEWCva/UHc8Gkz+yryO/
 fl0w4ey4h3cDBcV2DQqK5o7h+KzKVw7U/K42OZjAGtoOqkRRzVJgZdg
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_184543_286889_FF25B99E 
X-CRM114-Status: GOOD (  28.27  )
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
    i2c->smbus_actual_len and trim rx_msg->len down to it in
    xiic_smbus_trim_len(), called from both completion sites that
    clear rx_msg: xiic_process()'s RX_FULL branch and
    xiic_recv_atomic(), which drains the FIFO with interrupts off.

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
 drivers/i2c/busses/i2c-xiic.c | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 3e7735e1dae0..6cb264cbc366 100644
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
 
@@ -575,6 +584,16 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
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
@@ -797,6 +816,8 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 
 		xiic_read_rx(i2c);
 		if (xiic_rx_space(i2c) == 0) {
+			xiic_smbus_trim_len(i2c);
+
 			/* this is the last part of the message */
 			i2c->rx_msg = NULL;
 
@@ -938,6 +959,7 @@ static void xiic_recv_atomic(struct xiic_i2c *i2c)
 			return;
 	}
 
+	xiic_smbus_trim_len(i2c);
 	i2c->rx_msg = NULL;
 	xiic_irq_clr_en(i2c, XIIC_INTR_TX_ERROR_MASK);
 
@@ -955,6 +977,9 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
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


