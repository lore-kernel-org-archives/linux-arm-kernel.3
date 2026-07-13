Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33E7C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 18:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HC7Zjc8JDwRT+jcp3xPfx/bw+IyahjHlaD57ST7D2Y=; b=3kavs2khT26q0BENJeUEPyJp+J
	hjh9P8ZOTolP/ywEzZL7/TSR5tnpY8iwbwWvyacGgMRf17S8f3wCZJd7FL1UKEp1vUEQWmNxf9bwn
	idFYuwqvQALP3Bxs1VFNc7XuKT6rDhrheqgwZYmvFSLY+WJqcCmjPW74lujb2qBEGSwFqNiGatPwb
	dpmuwoj9HRcUorc1mWG9rEAtrEer2n3GzLAdc4XGa9Y4oDtiCQJwlOVaZxY1rfX1y1r/Ft13pKebM
	TqPN2ERPDNIQ4tcE1ovr54jvkniHXjVJ4EBk+Mhdib2Xg+aXU3kUh03eQIhu6W7pFZ4Suo/3HJd2q
	9C9kESUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjL9U-0000000ABQm-0YEd;
	Mon, 13 Jul 2026 18:13:12 +0000
Received: from smtp1-g21.free.fr ([212.27.42.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjL9Q-0000000ABPG-3pmk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 18:13:11 +0000
Received: from [127.0.1.1] (unknown [91.160.0.144])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 83B48B00596;
	Mon, 13 Jul 2026 20:12:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1783966387;
	bh=BMZ+vhPgtobVdgpPIoXknWdQobjjKPrllbsApgAJxt8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E5yKJLVh9tKNhLFqKhxaXAvuWAxma4CgXU+Rpvs6vvIs7GkJxxteENOoFtMjGhwO6
	 96L1Nu6530u+0+FlHwKAKTEzhY8FKJpaLzYWs2tejM6WXMnRVyfI5rJl4kqb1feIBQ
	 OQiWdsGGoqKsFkVo0K1L+tHiFstkypuDVg/WMKyYOtuXlv4trcKQT6JojhBmGC/MkN
	 ewcW2VpjldHLxmP95HoM8jX4b75huEh81j/BPSCdy/pgSlJ5xVWVNCFq3UNMtRvmZ4
	 O5jP1uf9CQguoaMN5VbJvNpAOAZ9B0jTcIU6d8EWjQ4MVGs2FnnicUd10YLPUF8k4S
	 d+vNpo7doj0tg==
From: Vincent Jardin <vjardin@free.fr>
Date: Mon, 13 Jul 2026 20:12:00 +0200
Subject: [PATCH v3 2/2] i2c: imx: fix locked bus on SMBus block-read of 0
 (IRQ)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-for-upstream-i2c-lx2160-fix-v1-v3-2-073ac9e103a5@free.fr>
References: <20260713-for-upstream-i2c-lx2160-fix-v1-v3-0-073ac9e103a5@free.fr>
In-Reply-To: <20260713-for-upstream-i2c-lx2160-fix-v1-v3-0-073ac9e103a5@free.fr>
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
 Vincent Jardin <vjardin@free.fr>, stable@vger.kernel.org, 
 Carlos Song <carlos.song@nxp.com>, Stefan Eichenberger <eichest@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783966324; l=2467;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=BMZ+vhPgtobVdgpPIoXknWdQobjjKPrllbsApgAJxt8=;
 b=tEpcNDy/WD7oBzxzurloMnb3Lz2JSE6vr6RkEyKGNTRld015ZiA3WQ6JcS0g17nwym3gt91lo
 uJocDEgoS7MBe8+BoRQyDzjOd5g5FO5MKNZL1xrGeCY8TYNCkt9uaji
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_111309_098893_02E3C5AC 
X-CRM114-Status: GOOD (  11.83  )
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

Reading I2DR has likewise already armed the next byte on the
count > I2C_SMBUS_BLOCK_MAX error path, so NACK it (TXAK) before aborting
with -EPROTO; otherwise the failing transfer's STOP cannot complete and
the bus stays held.

The atomic path regressed earlier (v3.16) and is fixed separately; this
patch covers only the v6.13 state-machine rework.

Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
Cc: stable@vger.kernel.org # v6.13+
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Acked-by: Carlos Song <carlos.song@nxp.com>
Reviewed-by: Stefan Eichenberger <eichest@gmail.com>
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 drivers/i2c/busses/i2c-imx.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index cfd1e63359e7..d5e6e2eca3b3 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1061,11 +1061,28 @@ static inline enum imx_i2c_state i2c_imx_isr_read_continue(struct imx_i2c_struct
 static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_imx)
 {
 	u8 len = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+	unsigned int temp;
 
 	if (len == 0 || len > I2C_SMBUS_BLOCK_MAX) {
+		/*
+		 * SMBus 3.1 6.5.7: support count byte of 0.
+		 * I2C_SMBUS_BLOCK_MAX case should not hold the SDA either.
+		 * So NACK it (TXAK) to not hold the bus.
+		 */
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		temp |= I2CR_TXAK;
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+
+		if (len == 0) {
+			i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = 0;
+			i2c_imx->msg->len = 2;
+			return;
+		}
+
 		i2c_imx->isr_result = -EPROTO;
 		i2c_imx->state = IMX_I2C_STATE_FAILED;
 		wake_up(&i2c_imx->queue);
+		return;
 	}
 	i2c_imx->msg->len += len;
 	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;

-- 
2.43.0


