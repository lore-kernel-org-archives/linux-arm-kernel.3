Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A630E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 11:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MnVRvutz+MB81qIbBeoAPpk5qPXvFK/vt+kslQ5zHcQ=; b=Wn12Cq0yrNFvUP7qxY/MPjECoY
	lm4mYvFuzCcsrRUKLo60u6X41SBj9v86GOdBKlVwPzZYl1SkT94pwojBGjmgkxsQWL/V1U4yQjRhM
	584xsdGiopX6w08OCFclcWVwQBmT/H7VmDukWOt+x+2AP76brnGgC9DNePaBhmAgVpY3GCeMFXOvD
	ZhieAXu20CE/Myg6fRcKCdGzD5bq2Ql3alYMj+TXPEfXQOxJ/3xKkkXfxQOK3rUF2Ju46iJDPKYug
	ld1bMJ9Rrgzykd3I+zOhvNOJp2AVbl4ujszCjl6BBSOrGfK8odF9tyYzo1QI45RnokJyI2SISisZf
	6evTb9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbih-00000007SCv-3FYM;
	Mon, 09 Dec 2024 11:14:31 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbhe-00000007Rzt-1mZH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 11:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733742802; x=1734347602; i=wahrenst@gmx.net;
	bh=MnVRvutz+MB81qIbBeoAPpk5qPXvFK/vt+kslQ5zHcQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=op+Wk2Ump/EGK6A1hdCYJAbYRkIIrcWyKdZeSQ5x0rmamzRuQrIpTq/MkE2/u7pT
	 2KbcMnCdYn0Up8Izb51hxcb4wr0HDs5i1Nn4ssKtpEh0rl2j9kc9xnNPWV6ofPc9V
	 Mi76//VDBMjioaIXCXYS3ggWQw30PqOvXobkyevme430w+OaE3uot9qB2viY6+Zhj
	 1Yv4FTj4bul6AquNPM0VLW83rqCdrgZgo/TtbHWd9ov1eBo7n5q0cTSmPS4LrsRNz
	 dinI+gjd7ir1OXPeSPfEETXbtK24g2L9z6mZaYAcrLbKTsvGw52COZoHuLDBmwJDm
	 /i3bDJVivKRt3vNwyA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCKBm-1tStRQ0DC6-003nDs; Mon, 09
 Dec 2024 12:13:22 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Mark Brown <broonie@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] spi: mxs: support effective_speed_hz
Date: Mon,  9 Dec 2024 12:13:16 +0100
Message-Id: <20241209111316.4767-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Bj8yJBzEI0MpblqK6MWrpe0cW6O2NZ2heU9xB9UmFvuzqmoQQRL
 vAdXApwIuc8M7mF8iGZX29kVTdLXZujZjQBpl0Awunr0wIf5yTzBCMnCYZB+zxbwY569dxc
 fovlb2P8RjeeqP/6SlnGLUylOU9ncu2d62jsgjakElVTdAZsvgLeEXsxBiVHV/Zezk4oxK0
 lUUY9uyLYKj7OV5V/zyeQ==
UI-OutboundReport: notjunk:1;M01:P0:enR62G6NnoA=;QejLnRU9XM4TSRSqTKMm20mgIod
 Xy+aVx626vtgNxajveMAVuUA/psRLHq7XIlqf4SBur/DJ0hE8igkW1QAtTrT+Fc7BrLJJ5tY0
 GEipAShUCBrtIeLyNDU5vuj/u+EyljD0mL3VPTIcfoO0ibT7i7ULCgdlRbg9Rdrfh5Sc2dcwP
 vyIw3cEjwgx8b/FILYY1bsyN+ZVlltPOrxnISf6aVD+FjBA/P66DBucrWD2FF8PgD+/wkrRWd
 oegNy3v0oLwuIdkTfe04w1TobkxnCBZ0n9YlaJw7aNABWyusF1l0QwpksFaAZgXYp33jI99EM
 DN98NzxjlivGAnkocCzFXSI+/U4nmWAgvy7UVU0yHaNrNf7OdORyyQ3JpOFMFt/XyeW03lCgZ
 OP+ygXYkzVm22TsiNE0BTT95EYBIP1pgAUBK5bkY+fHFxjYCUcsD15ZOdQTy/dL1VKtnWZqSO
 289MQNaIQqX7JPj0rR+w2LAAk7ENC6OKmJb+yCqpd0pzS+Q/gyzz9PzNsRXDY/DY6qBu780EZ
 O4DiyOb6jpL+2Qu/EQGnv2xyBpPoGUwdsbVtoPm6yowcLfEbPaaJsz0tLO7ljnp6Mc2NTjcgT
 C4AxP66nmlKezrQ6eF8NYSdNgQtZRARfaOGWy8sJIXllJiCiFsLJy+Ps+sureu9V91Bsh1iWl
 6aEhuVPdqxgLL26juL+S2uJjQcE8qYr4ULcwmikp5J1Zv8WBXFmhi7BQUmXXua+UFkZfnGI20
 bg003Qq8V7wnrOtwcZ8vve0s0zJhQvh/RQYdSiXki6JaAzHJfw49i4llEu+bqrh2kNd1NWuG5
 yRnlxa/853AeNgTQSuVq6Ay3LnMqn6H2816zP7Q+FLF3JHZaUBDgofsNEd4iv9uQreiJews2W
 fBJybYs4hfUVQ4WZ56UH8DUqn6DGJndE5vNNoMhoPDy2om6qWwNaaVgeFmRTWhKyXSvGLNJES
 mbi8O6UUPvaUtJfc/sgY8GHIZ4VwjxHFm0F9N2LzH8pGFxOCEGPGzwUnWnXznDzBzwvoj2HAp
 a1zuI0FR/f9jm4j15WdIm3Vx5V/6o4BjTw5E3zMFljvDgwjwk091yoGAi7dMg4xwtXazVTwlR
 PwaZOckV6yRqN4zAgvrI6rSGGHH+Ks
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_031326_751496_94776C74 
X-CRM114-Status: UNSURE (   8.48  )
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

Setting spi_transfer->effective_speed_hz in transfer_one_message so that
SPI client driver can use it.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/spi/spi-mxs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-mxs.c b/drivers/spi/spi-mxs.c
index e6d955d964f4..43455305fdf4 100644
=2D-- a/drivers/spi/spi-mxs.c
+++ b/drivers/spi/spi-mxs.c
@@ -381,6 +381,8 @@ static int mxs_spi_transfer_one(struct spi_controller =
*host,
 		if (status)
 			break;

+		t->effective_speed_hz =3D ssp->clk_rate;
+
 		/* De-assert on last transfer, inverted by cs_change flag */
 		flag =3D (&t->transfer_list =3D=3D m->transfers.prev) ^ t->cs_change ?
 		       TXRX_DEASSERT_CS : 0;
=2D-
2.34.1


