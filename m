Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD66FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 18:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJ6izCMLH2qOw8D06yogEIxTzBSnqO/vgKP10Pm0yEU=; b=ooLuH7Bo/firsPRd44tm3U2jZ3
	VpU8ZuX5HQvPYm8MMB/lH+UuBsGTZm6p1RujOfnLffyBgstXYiEadSwQ/q4fZoAq54z7SqxTD0FUU
	BrqmfuVlBrWM7fzDTVOCeuehCrkzekllhjg88hRvarAvJO5uJ8/OTM4POJH2fy8Q+nzeXaBkq6C9o
	QQ5Qi5nrGbr1q0lEdMb+cTTohrMYtb4jcluTrN//VMVzxySw795ugnwWViFS1ZmzvJZ7QrM0d0jr7
	KxXMgXWVYjfXe3HldcwOLEjz+OKvNjoy8614+DWCLKJmKAnYNdqUqRUr8tO+IKruylCbq8A1JFEtA
	45SWkHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjL98-0000000ABJI-48P4;
	Mon, 13 Jul 2026 18:12:51 +0000
Received: from smtp1-g21.free.fr ([212.27.42.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjL96-0000000ABHT-1N4w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 18:12:49 +0000
Received: from [127.0.1.1] (unknown [91.160.0.144])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 67DAFB005AC;
	Mon, 13 Jul 2026 20:12:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1783966366;
	bh=MB93t3nfvRdSDolU+OMtP3YuXMmW9lVD3yUEkEyoz4E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OMZSLA/+hz/KDAZ/BHUjwQDa+chahuXZN/6mgR4ZOBZ7SMCIMuJNb/wx0E7axbUlF
	 Cx+XhNxgMvLAI7v9txj6L89fCcNcphBC91+OUXhw5jMmBOnIHegDVe/q3nBmU15WCg
	 C+NhvZAYQpL6BKLSFfBSCzcMX+CSew9bZYxW7udK7/0XY66iL1qnZyM71D58K/7cx1
	 65v/XY8Qyz5rKjQ27aC7c3qmewIgue8IPnLWXzgoVBDQZVn05ds6G+yse9uWVtGRd2
	 SfWW1xVgZs8PgX6X94mntoTjBMccXLCtjnU02cxUAe3ErGYC7IMB32XR+R5n6rw46v
	 t5FD12NGs2NnQ==
From: Vincent Jardin <vjardin@free.fr>
Date: Mon, 13 Jul 2026 20:11:59 +0200
Subject: [PATCH v3 1/2] i2c: imx: fix locked bus on SMBus block-read of 0
 (atomic)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-for-upstream-i2c-lx2160-fix-v1-v3-1-073ac9e103a5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783966324; l=2882;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=MB93t3nfvRdSDolU+OMtP3YuXMmW9lVD3yUEkEyoz4E=;
 b=EAfrG/l4yjYiRBr25rzQTMFXUHFvyfy+O1ND7nv0EOzDLBLyPO6dtiIZ9uQ03Tp6SxZiheqBz
 JrUTvnQi4hKBqZxQEdPdvJE7v9jDM9LJ990XiZtdDvVT/z/tWccsFmi
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_111248_511866_072CDF49 
X-CRM114-Status: GOOD (  13.77  )
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

SMBus 3.1 6.5.7 allows a Block Read byte count of 0, but the atomic
(polling) path rejects it as -EPROTO. Worse, it returns without a
NACK+STOP: the next receive cycle has already started, so the target
keeps holding SDA and the bus stays stuck until a power cycle for
this i2c controller.

Reading I2DR to obtain the count likewise arms the next byte on the
count > I2C_SMBUS_BLOCK_MAX path, which also returned -EPROTO directly
and left the bus held.

Handle both: NACK the in-flight dummy byte (TXAK) and extend msgs->len so
the existing last-byte handling emits STOP; the dummy byte is discarded.
A count of 0 is a valid empty block read; a count above
I2C_SMBUS_BLOCK_MAX is still reported as -EPROTO, but only after the bus
has been released.

The interrupt-driven path has the same flaw from a later commit and is
fixed separately, as it carries a different Fixes: tag and stable range.

Fixes: 8e8782c71595 ("i2c: imx: add SMBus block read support")
Cc: stable@vger.kernel.org # v3.16+
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Acked-by: Carlos Song <carlos.song@nxp.com>
Reviewed-by: Stefan Eichenberger <eichest@gmail.com>
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 drivers/i2c/busses/i2c-imx.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 28313d0fad37..cfd1e63359e7 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1415,6 +1415,7 @@ static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx,
 	int i, result;
 	unsigned int temp;
 	int block_data = msgs->flags & I2C_M_RECV_LEN;
+	int block_err = 0;
 
 	result = i2c_imx_prepare_read(i2c_imx, msgs, false);
 	if (result)
@@ -1436,8 +1437,20 @@ static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx,
 		 */
 		if ((!i) && block_data) {
 			len = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
-			if ((len == 0) || (len > I2C_SMBUS_BLOCK_MAX))
-				return -EPROTO;
+			if ((len == 0) || (len > I2C_SMBUS_BLOCK_MAX)) {
+				/*
+				 * SMBus 3.1 6.5.7: support count byte of 0.
+				 * I2C_SMBUS_BLOCK_MAX case should not hold the SDA either.
+				 */
+				if (len > I2C_SMBUS_BLOCK_MAX)
+					block_err = -EPROTO;
+				temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+				temp |= I2CR_TXAK;
+				imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+				msgs->buf[0] = 0;
+				msgs->len = 2;
+				continue;
+			}
 			dev_dbg(&i2c_imx->adapter.dev,
 				"<%s> read length: 0x%X\n",
 				__func__, len);
@@ -1485,7 +1498,7 @@ static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx,
 			"<%s> read byte: B%d=0x%X\n",
 			__func__, i, msgs->buf[i]);
 	}
-	return 0;
+	return block_err;
 }
 
 static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,

-- 
2.43.0


