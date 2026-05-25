Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AF2CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 16:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3dfW+PhJnoYruvH6S/iRoGqN5uUQAqIi+8dlyofQIU=; b=UcvIvwzZ6f77emLObKp79oIRZE
	tCrjtZRQ0qtxvbv4OpBUh6KcIrgzRLjo/Z+VKnoylnfa88S4acxRGJ4ryFj8nqEqHjELzAjmaRV7G
	IitPOgA8VcNwUdYBpA33aFcSC996u/e51KGO7dpuNM06ec8ywl+ieWh1/OHuhPc19ziH0CQN+2X+S
	N+tunpDycj+k5+FtXeWdzqBuRHIBTRyqWhDq76IGOxNxi2SJMuM9Qm2tzrhYFxBNdmp4mHokol69W
	WiuY2VUO3zsOrxk4U5h6tCv/SHjJ6BpHBwlFydQ+ADdHIvX8Gp8g+8kXeDODSYFPsnhKngRQXf1ri
	yfZETaDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRYPi-0000000036o-1Y8Y;
	Mon, 25 May 2026 16:44:27 +0000
Received: from smtp1-g21.free.fr ([212.27.42.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRYPf-0000000035C-1vRD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 16:44:24 +0000
Received: from [127.0.1.1] (unknown [91.160.0.144])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7ED5DB00583;
	Mon, 25 May 2026 18:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1779727462;
	bh=TCAfUvjhaCsJQTrEtvumpIoh8l6kyRt90adoFjnNFWM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I9CarSYqcmzd2yYyH7i0zq6pF9GGeyuQwRNYOhd/xQob2TF69kwI+ImCUNTskjvhq
	 iLpdbcbFRCZ1nuIGX1rPkBgk4Y5gp7cnapKaoabO6Te/JsvD57o+Ym7XZxg7W0fUQY
	 Gsg4YZAR72eI1uqqoW5MBJsq9W4mInSHgqbNfMVor1iSHPbMQ54BVx3qLZb7ey4FzQ
	 poewztBNQxkIb4Yl1FD+rV/DKEY5uEWNnjqsO5SJqqdSff32efcwsF22CwFJ+quFfg
	 UIoflOsiIqlZ5b9YDIEme68/lbFqTJOZnOYlAy6SlaD49OeP4xwcqFGSJkAWG/OEwK
	 6nQG0hXzoNvBw==
From: Vincent Jardin <vjardin@free.fr>
Date: Mon, 25 May 2026 18:43:16 +0200
Subject: [PATCH v2 2/2] i2c: imx: fix locked bus on SMBus block-read of 0
 (IRQ)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-2-26a3cc8cd055@free.fr>
References: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-0-26a3cc8cd055@free.fr>
In-Reply-To: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-0-26a3cc8cd055@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779727406; l=2318;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=TCAfUvjhaCsJQTrEtvumpIoh8l6kyRt90adoFjnNFWM=;
 b=MUBeVu7lKe21R2tFAurHFC1df7bUtHKMOZ6EGsW6DipVT90oy1nihPhSo2orpgGz8ubZBeVPE
 pbaPh6u7oVvCUMpuW9iszwfnGvUEMEyeYQsW0rLAjTW8cE6J4IDiTVk
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_094423_638857_B040B546 
X-CRM114-Status: GOOD (  12.57  )
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
Cc: <stable@vger.kernel.org> # v6.13+
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 drivers/i2c/busses/i2c-imx.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 14107e1ad413..8db8d2e10f5c 100644
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


