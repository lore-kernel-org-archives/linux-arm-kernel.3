Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17140C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 11:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0iEnhsMyyhLqVb+t9d6JK42KoDeD/BDXMFXX8vR1gm8=; b=eCWHPoy+ZgV9ZTiICz02VE66Pk
	7ROLSlqRy/4xu573AxPtJkW/BU6X1jP7krP+S2kr9hSmqairSAIC8KNVA3D1fa9jtcmC4WDzsBz1f
	DgYIrdEQ6wzfkHtqqOfr9unHX3VVXB4gl7bHTeFoP8d5ZMuBGXUAR2meDBFZWwQ/dEY4bmoPACQDY
	ZrmIL89XzZGYSu1k/z/8O9L0Lpo3QVDTNdxa9fQI9NDUia3fflDkk5DtQdmpXocVd1BABtC4DHdKn
	zrqBqy6JfIwkAIrZPAExHPNTWn0ZLbLLZvJaQOn4JqZJoFg0VxaR++BVqI6fkmKEr+lC9LxIeHTG4
	i7/ylj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWJc-00000008jRf-1m8k;
	Mon, 26 May 2025 11:48:24 +0000
Received: from mout-y-111.mailbox.org ([91.198.250.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWHR-00000008j6w-2t72;
	Mon, 26 May 2025 11:46:13 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4b5Yql2Kshz9xn8;
	Mon, 26 May 2025 13:45:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748259955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0iEnhsMyyhLqVb+t9d6JK42KoDeD/BDXMFXX8vR1gm8=;
	b=vNauEA0NxP92F1Au9esFhltpHvXYYxuNADdZkqOwq190xijq8sUJeedWgjFV++/D2nPqWo
	2wKvs0ebgRzCxSwbUatxTa59OJuLpxGTBj3tyD+L0cA8XVOhv5WUC+VoQCj6zUsRuS6ny+
	fzgd3fdsAv5Zln8oQMaDKDAp2zVQEfaH4btyj58iXEMIbocpe35DzPZJtGmYh0hLA/EBcQ
	MH7pnSRBvuekHXsSh6TPEPjPb1UXxv4YLUA16qAMR/PEOHw673PdOajkdyfJzqyyzJIQOZ
	SFdFF8AEVXgXwiXG1efukjs8s+muR1EyCMzeIK5pnwcGDhRttamqqVvah0AJmQ==
From: George Stark <george.stark@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748259953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0iEnhsMyyhLqVb+t9d6JK42KoDeD/BDXMFXX8vR1gm8=;
	b=h1uYi9+zl/rZ0lNwjhkRUL/tTmVRKunr5taucBku1n8wKTMNXzp2fZvVCXUPTcEJAm/XLj
	AZWVxxgski972QfvxEHhWTt/dzVTflx+t7Jrakov4FmHXPElAsb7/FbGqQy8KbSkcKim3l
	k5H5vf4UW0Q+xLjOpSsCSlEMpx0+M7knLpbLe1ohTuZ/qeg29aNJIneGLC1R+VYZ1TaldP
	Z78IdPF4uPhcXljRmMVxunYX5AvK7JLGxBdvIUIQA6zOlUN+CrENrApQDc8pZseZIsDc3Q
	V3lH0i0i787ghx6NVDaDfQHB5XAPr+bajA21B5SbHCHKAFaN4ndfkOKkChHBFA==
To: andi.shyti@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	george.stark@mailbox.org,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] i2c: meson: support smbus block read function
Date: Mon, 26 May 2025 14:45:33 +0300
Message-ID: <20250526114533.3287944-1-george.stark@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ydmzzk1c465fug6ojipqhh39tsnq41gs
X-MBO-RS-ID: 4ee51b3cee18d95dcd0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_044609_865592_9B8ECB3C 
X-CRM114-Status: GOOD (  12.47  )
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

In order to implement reading I2C_SMBUS_BLOCK_DATA call i2c bus driver
has to support I2C_M_RECV_LEN flag meaning that total block size to read
will be received in the first byte of the message. So add support for
I2C_M_RECV_LEN flag.

Signed-off-by: George Stark <george.stark@mailbox.org>
---
 drivers/i2c/busses/i2c-meson.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index c7b203cc4434..6d8fe151325a 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -95,6 +95,7 @@ struct meson_i2c {
 	int			count;
 	int			pos;
 	int			error;
+	bool			recv_len;
 
 	spinlock_t		lock;
 	struct completion	done;
@@ -259,7 +260,7 @@ static void meson_i2c_prepare_xfer(struct meson_i2c *i2c)
 		meson_i2c_add_token(i2c, TOKEN_DATA);
 
 	if (i2c->count) {
-		if (write || i2c->pos + i2c->count < i2c->msg->len)
+		if (write || i2c->pos + i2c->count < i2c->msg->len || i2c->recv_len)
 			meson_i2c_add_token(i2c, TOKEN_DATA);
 		else
 			meson_i2c_add_token(i2c, TOKEN_DATA_LAST);
@@ -268,7 +269,7 @@ static void meson_i2c_prepare_xfer(struct meson_i2c *i2c)
 	if (write)
 		meson_i2c_put_data(i2c, i2c->msg->buf + i2c->pos, i2c->count);
 
-	if (i2c->last && i2c->pos + i2c->count >= i2c->msg->len)
+	if (i2c->last && i2c->pos + i2c->count >= i2c->msg->len && !i2c->recv_len)
 		meson_i2c_add_token(i2c, TOKEN_STOP);
 
 	writel(i2c->tokens[0], i2c->regs + REG_TOK_LIST0);
@@ -288,9 +289,26 @@ static void meson_i2c_transfer_complete(struct meson_i2c *i2c, u32 ctrl)
 		i2c->error = -ENXIO;
 		i2c->state = STATE_IDLE;
 	} else {
-		if (i2c->state == STATE_READ && i2c->count)
+		if (i2c->state == STATE_READ && i2c->count) {
 			meson_i2c_get_data(i2c, i2c->msg->buf + i2c->pos,
 					   i2c->count);
+			if (i2c->recv_len) {
+				unsigned int len = i2c->msg->buf[0];
+
+				if (unlikely(len > I2C_SMBUS_BLOCK_MAX)) {
+					dev_dbg(i2c->dev,
+						"smbus block size %d is too big\n",
+						len);
+
+					i2c->error = -EPROTO;
+					i2c->state = STATE_IDLE;
+					return;
+				}
+
+				i2c->recv_len = false;
+				i2c->msg->len += len;
+			}
+		}
 
 		i2c->pos += i2c->count;
 
@@ -371,6 +389,7 @@ static int meson_i2c_xfer_msg(struct meson_i2c *i2c, struct i2c_msg *msg,
 		meson_i2c_do_start(i2c, msg);
 
 	i2c->state = (msg->flags & I2C_M_RD) ? STATE_READ : STATE_WRITE;
+	i2c->recv_len = (msg->flags & I2C_M_RD) && (i2c->msg->flags & I2C_M_RECV_LEN);
 	meson_i2c_prepare_xfer(i2c);
 
 	if (!atomic)
@@ -444,7 +463,7 @@ static int meson_i2c_xfer_atomic(struct i2c_adapter *adap,
 
 static u32 meson_i2c_func(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_READ_BLOCK_DATA;
 }
 
 static const struct i2c_algorithm meson_i2c_algorithm = {
-- 
2.25.1


