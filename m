Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758D9C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 11:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R0+chyl53vlDqcHYdyzW6KIs98Ekd5KZC2x9102XgXA=; b=RM8Neb2BeojlVeAZxs8H6s1GKi
	DmrAPsPq5MW2E3UGh6UT+UZosiGtr+x2FESzeBz1xYeS5YmLrCiNXrxZESLWlvspt3QCEunDMp4s9
	3YzAo+ohyN/vMDpG6cCElj51Sk+Ao1ExM2mQUNVDmN1bcX1HrSM7JzX9rhqDcb6JgBX06Y8dnE5EX
	heJs1GKDhiO6DoMAcYzXao15zGeJ+cP6PP0uxZcJOzkU2d3P1ygx8oPUFz6w1vEk9RL+LYKZTfJhB
	G/6TUSrSRbEMAE3aL+kzotnAcZ+JctpgRYLFIuXzvHGeBpTR92/jj86n5j7zhO2bow+Eyydm3LZyZ
	T8NmdI9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25G9-0000000HA7y-1FNj;
	Thu, 03 Sep 2026 11:05:33 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25G6-0000000HA7b-1fIl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 11:05:32 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 08234C3EEAD7;
	Thu,  3 Sep 2026 13:05:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 08234C3EEAD7
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Andi Shyti
 <andi.shyti@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Fix i.MX I2C driver zero byte read kernel panic
Date: Thu, 03 Sep 2026 13:05:22 +0200
Message-ID: <m37bl2d28d.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_040530_594683_E46F7FA5 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
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

Generally, zero-sized I2C read requests aren't valid. After START,
SDA line ownership is transferred to the slave device, and the master
cannot terminate transfer at this point.

Passing zero-sized read request to i.MX I2C driver causes a NULL pointer
dereference in i2c_imx_isr_read_continue() here:

i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] =3D imx_i2c_read_reg(i2c_imx, IMX=
_I2C_I2DR);

Fix it by rejecting zero-sized read transfers.

Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index c44452449a75..1f0f72386912 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1637,7 +1637,9 @@ static int i2c_imx_xfer_common(struct i2c_adapter *ad=
apter,
 		if (msgs[i].flags & I2C_M_RD) {
 			int block_data =3D msgs->flags & I2C_M_RECV_LEN;
=20
-			if (atomic)
+			if (!msgs[i].len) /* invalid, would panic */
+				result =3D -EINVAL;
+			else if (atomic)
 				result =3D i2c_imx_atomic_read(i2c_imx, &msgs[i], is_lastmsg);
 			else if (use_dma && !block_data)
 				result =3D i2c_imx_dma_read(i2c_imx, &msgs[i], is_lastmsg);

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

