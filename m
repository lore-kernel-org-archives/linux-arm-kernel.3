Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E31CCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 11:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snWXsaG/CzWlGz2bUInqrMsskb1gGjaPTx5KRCIhSk4=; b=iqZvqOtgMezmAKQbYnWswJr1ZY
	7GQTunv9FKMIIzz1nqDVIoAEXpAVmDNdXrB4DfQVdV/hI8LenMwUW+1JFWCLP5iHjVePPD/gF4/Cu
	Q7OMgi8QP7mhbW3UbSVBvspzXT9+Z4tYb9PzBIOUPcLyVATgiekX8M6fGXCZ9DyaanDfQvZ/+sIw6
	yPSas5VytvLU/FK0NXOP6gMsAJVp22PkHqB2lXHzI6lUvcsG53ls8rIjc2memXWFYJdsJbTidyubC
	nljb9bQrkX/Se/uA7RZM8oLhnafRZlZQ1li2DGgohk5F7URGFlLALGjrz+8ZJr2DvC2ws6GPmw2J9
	TAOWaFxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTQR-0000000H5Jr-1AuF;
	Mon, 25 May 2026 11:24:51 +0000
Received: from smtp1-g21.free.fr ([212.27.42.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTQP-0000000H5Iz-0fxu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 11:24:50 +0000
Received: from [127.0.1.1] (unknown [91.160.0.144])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 49895B0059C;
	Mon, 25 May 2026 13:24:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1779708287;
	bh=47xlOO5JbId46R5ZNpfziDDo8V+XnFuCW1yJNrzdW3U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GC5+QXQyrM/L8pDABN5U+N6oqFJw1qGBvBh+sJt0SXW5J5YrETyGLTwx85gQMFt6T
	 iy1OB9KAi2KRROBi+oK/e/B3BvgLkZtW/hFfu2C5tgmuTAgYPdnrXCnD9Fe8iXl1v9
	 ANTofiUA/NPvDoCIqm2pkmF/HiCgDKwNkjqsJWzVr4aWWqACdPmX2BmhS9nhTpkqBt
	 LCLz60n/v1SBqL0RHAqu3SCaPZ4cHKcL330woF7cM/vPj/AUIUSg64q8+0RpIK9rKf
	 kgV1lf113lcdHlHG32ylLkr4h+CznbAh5LOBWzxMusVghpAOoxJ+nuPefdNIDBxLig
	 qlS+9dk9gYQJQ==
From: Vincent Jardin <vjardin@free.fr>
Date: Mon, 25 May 2026 13:24:02 +0200
Subject: [PATCH 1/2] i2c: imx: fix locked bus on SMBus block-read of 0
 (atomic)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-for-upstream-i2c-lx2160-fix-v1-v1-1-f30ab53dd97c@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779708249; l=1759;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=47xlOO5JbId46R5ZNpfziDDo8V+XnFuCW1yJNrzdW3U=;
 b=2eo7uMa1GLjy9XOUrlVsSrBMoV+sMK2Dc9T5c68PVvADPOD6V2VISAuCyCV/8lho3kg5+hk1L
 Iaf5oB8SqXjAK8k9smeYquWY1LfjradUGe0gBniikkvzvBBskr96KOu
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_042449_344875_11395727 
X-CRM114-Status: GOOD (  11.74  )
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

Accept count=0: NACK the in-flight dummy byte (TXAK) and extend msgs->len
so the existing last-byte handling emits STOP. The dummy byte is
discarded; block-read callers only consume buf[0..count-1].

The interrupt-driven path has the same flaw from a later commit and is
fixed separately, as it carries a different Fixes:

Fixes: 8e8782c71595 ("i2c: imx: add SMBus block read support")
Cc: <stable@vger.kernel.org> # v3.16+
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 drivers/i2c/busses/i2c-imx.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index a208fefd3c3b..0cd4f5892591 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1436,8 +1436,19 @@ static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx,
 		 */
 		if ((!i) && block_data) {
 			len = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
-			if ((len == 0) || (len > I2C_SMBUS_BLOCK_MAX))
+			if (len > I2C_SMBUS_BLOCK_MAX)
 				return -EPROTO;
+			if (len == 0) {
+				/*
+				 * SMBus 3.1 6.5.7: support count byte of 0.
+				 */
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

-- 
2.43.0


