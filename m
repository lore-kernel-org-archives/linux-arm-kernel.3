Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D109CCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 11:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhzV/I0Z5o5pyEaEJmp3LbHFfxp5D6RV6T2zjI9RQL8=; b=o/X1pUOpjIDxXNNlt5woht//Gk
	OicY/efhC/rAGG3uTw44OAR6eafMfm8FcPCh/vpVbTLcKXmEOvULULo5gWNnuO3d3uXjzPXDx7Uyr
	dT2gkE0Mj1biLP0ogTYX/UhuGVMdiam3yln38azQJqxyaAJzvVKXVWMVYUmRtFjqrC8ZpyAS2cLW7
	kkhBfDqdP3kw3rp5uEV9ptyn6BncpQPznSLxbGmp4tDMTLgITTtPhyDgt+zEMrcL4DztAMNQURfLm
	OZLDS1koVGGO9STgDfuFfU7NbTDkAHPHbyzf97z0ZMV7KBYWpr/oLT9VfIdxyJN0z5Qidq0y/ILln
	6EzjuieQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTQl-0000000H5RD-1hvI;
	Mon, 25 May 2026 11:25:11 +0000
Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTQi-0000000H5Pi-3ifJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 11:25:10 +0000
Received: from [127.0.1.1] (unknown [91.160.0.144])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id EA1F2B00596;
	Mon, 25 May 2026 13:24:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1779708306;
	bh=QI+F4s3l2reRW12v8sYKUXXffhbNq76K46I/ps3EMWw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CTA6+bZGOui1FpWIZFA65ZS55voHN9neOqzEHsRBiY7XIxXX1DCQyfMMzmf/r4mxL
	 8F++ywor5VLGprwzyvNPqWF2iPfshkp8yWP2NJ8z6JSgTsF8uOuJ+rSEpjrecy1Hfb
	 or7A5qUlMfWcS50GJDZu9zzIfnsmGpa0Hr7ttA+yNbAi7bdAbm5okoTGw/6gmZlvkq
	 vSKnpj7dB63KfCQj3aTtkmWQiVYedDEfv/sSFsIUTLutNiftSguMfvEgX8/kdiEKRr
	 YCdQ1sbXmesIk+eEpkydm2HXOX/lGOpeeuf7Ega6Aw+zwu8W7tQcgk58JWKJ9hfatm
	 a63mBfLJ8WNQg==
From: Vincent Jardin <vjardin@free.fr>
Date: Mon, 25 May 2026 13:24:03 +0200
Subject: [PATCH 2/2] i2c: imx: fix locked bus on SMBus block-read of 0
 (IRQ)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-for-upstream-i2c-lx2160-fix-v1-v1-2-f30ab53dd97c@free.fr>
References: <20260525-for-upstream-i2c-lx2160-fix-v1-v1-0-f30ab53dd97c@free.fr>
In-Reply-To: <20260525-for-upstream-i2c-lx2160-fix-v1-v1-0-f30ab53dd97c@free.fr>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Wolfram Sang <wsa@kernel.org>, 
 Kaushal Butala <kaushalkernelmailinglist@gmail.com>, 
 Shawn Guo <shawn.guo@freescale.com>, 
 Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779708249; l=2194;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=QI+F4s3l2reRW12v8sYKUXXffhbNq76K46I/ps3EMWw=;
 b=9E/1geMmLSMLu7ab1ocRO4B32jedOSXKFDbwcYcO46aNg3xmG0FMf6lFwxLHOenQrI+Jz+xBj
 VMUF8FUJxH6CSBh0QyCKGT3mTdU5RCcIIUUL4dx/H61no6SjC3A/29V
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_042509_071821_0310DF7D 
X-CRM114-Status: GOOD (  12.29  )
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

SMBus 3.1 6.5.7 allows a Block Read byte count of 0, but the
interrupt-driven block-read state machine rejects it as -EPROTO. Worse,
it returns without a NACK+STOP: the next receive cycle has already
started, so the target keeps holding SDA and the bus stays stuck until a
power cycle of this i2c controller.

Accept count=0: NACK the in-flight dummy byte (TXAK) and set msg->len to
2 so i2c_imx_isr_read_continue() emits STOP via its normal last-byte
path. The dummy byte is discarded; block-read callers only consume
buf[0..count-1].

While here, return early on the I2C_SMBUS_BLOCK_MAX error path instead
of falling through and overwriting msg->len/msg->buf with the rejected
count byte.

The atomic path regressed earlier (v3.16) and is fixed separately; this
patch covers only the v6.13 state-machine rework.

Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
Cc: <stable@vger.kernel.org> # v6.13+
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 drivers/i2c/busses/i2c-imx.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 0cd4f5892591..8792cb5cb9a8 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1061,11 +1061,26 @@ static inline enum imx_i2c_state i2c_imx_isr_read_continue(struct imx_i2c_struct
 static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_imx)
 {
 	u8 len = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+	unsigned int temp;
 
-	if (len == 0 || len > I2C_SMBUS_BLOCK_MAX) {
+	if (len > I2C_SMBUS_BLOCK_MAX) {
 		i2c_imx->isr_result = -EPROTO;
 		i2c_imx->state = IMX_I2C_STATE_FAILED;
 		wake_up(&i2c_imx->queue);
+		return;
+	}
+
+	if (len == 0) {
+		/*
+		 * SMBus 3.1 6.5.7 "Block Write/Read": byte count can be 0
+		 */
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		temp |= I2CR_TXAK;
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+
+		i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = 0;
+		i2c_imx->msg->len = 2;
+		return;
 	}
 	i2c_imx->msg->len += len;
 	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;

-- 
2.43.0


