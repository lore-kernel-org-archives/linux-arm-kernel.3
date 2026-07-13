Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB22AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 18:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dd8hR5d8GsGZG72ttvE/ZKL3S4uHHf5qXkJUdHz6Uk8=; b=fSeJt00nvxz/Y5
	XVQETOG+ATTImXN8HMr5gZn02PtwKvJYrD96gF+h+f/Z2GSAvtixkV4zz8ibjscJQLLzAjrJRYsUT
	3unhlZrukR2iKwWFSGQ0FcnwEYsf5seEd+uKmEq4oFODBobOqctwrtt2j3sKbkuDUG/Or3Xtgo0Qp
	dFuw4ZbOEch0QOOKApZP/yXZ6dPLAPf43VAN5mtPQ1y9PL0WTRPa9yc/Ori9ES+TbI9M/yV/g9K2r
	giSYwbOhvL1jjI4zT53974Xj3044vPKNblxknnv0AJsPQZJ1g2vfV39Iqbz9MNFkwLCW/ibz4gcJk
	q4Fyt4XlBCHxE+HBSGlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjL8r-0000000ABEQ-3Lke;
	Mon, 13 Jul 2026 18:12:33 +0000
Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjL8o-0000000ABD5-1wkF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 18:12:32 +0000
Received: from [127.0.1.1] (unknown [91.160.0.144])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 009BAB0055A;
	Mon, 13 Jul 2026 20:12:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1783966345;
	bh=MW0fHm4TEwvAk5mUjhZ7QSZSJF8LLYeJTbTRWroVGJI=;
	h=From:Subject:Date:To:Cc:From;
	b=HP9/4s5GL7nJJXLSYkAF+NqAQsUFE9JtmkJnD8cU4E0lmuJT2TZTQiygCb+inNRRZ
	 Z2WTVMEI2JpxTwiI2gTOo3k8Z+mkGkLH9ZNwIZOzbqXm8xdh/RVktt9ZH5GTBNKH3k
	 NBehoNisOosZP2h0hHq4oLvPWFbpMTM+gq2pO3mtYi4Thz8Juvgh3dn3D6wzpV79z/
	 Uc4YzUjDsztG80b5lgGRL2g6M51MwmwcVjgSmK/gaEnPEt/gUqDnQwUqxDnyt+OUrd
	 EVn7K/rpxEpFr7YRTWomdJnsP9EE2ItGY4Kp+vkX4GCF5pUTGq1f4C8K9BIGwyrvbh
	 pUvnksAgC3i3w==
From: Vincent Jardin <vjardin@free.fr>
Subject: [PATCH v3 0/2] i2c: imx: fix SMBus block-read of 0 locking the bus
Date: Mon, 13 Jul 2026 20:11:58 +0200
Message-Id: <20260713-for-upstream-i2c-lx2160-fix-v1-v3-0-073ac9e103a5@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG4qVWoC/5XNwQ6CMAzG8VchO1tTugzFk+9hPIzRyRIV0uGCI
 by7g4tXPf7b5PfNKrIEjupUzEo4hRj6Zw69K5Tr7PPGENrcipAqNGTA9wKvIY7C9gGBHNwnKis
 EHyZIJaBrLFrEWrNRGRmE82cbuFxzdyGOvby3vVSu15/pVQev0TZGt219cGcvzHsvaoUT/YdRx
 qiy2rmja9GYL7YsyweAWWSWFwEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783966324; l=1860;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=MW0fHm4TEwvAk5mUjhZ7QSZSJF8LLYeJTbTRWroVGJI=;
 b=HB4/D489cBV9RGeIlXnJ5L0Cx4Oci/dGh9tVchNtz7Ut6n2ixBh23Cwbk1Xta51rz/iUbqwun
 XJ6O0CjdUAgD9GB9UUz9/kcWL1vmAwrDWZ2G2qkSXTeEdIDKXhaN4Oo
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_111230_923933_0270E12A 
X-CRM114-Status: UNSURE (   8.80  )
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

i2c-imx rejects an SMBus Block Read byte count of 0 (valid per SMBus 3.1
6.5.7) as -EPROTO and returns without emitting a NACK + STOP, leaving the
target holding SDA so the bus stays stuck until a power cycle.

It was triggered by an MPQ8785 PMBus regulator on a LX2160A i2c
bus: when the kernel binds it using the pmbus/hwmon framework, the bus
locks up and it does never recovers. It was confirmed with a scope, with
and without the fix.

The same bug is occuring with two independently introduced spots, so the
fix is two patches with their respective Fixes: tags and backport ranges

  1/2  atomic/polling path       Fixes: 8e8782c71595   v3.16+
  2/2  IRQ-driven state machine  Fixes: 5f5c2d4579ca   v6.13+

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Changes in v3:
- no functional change; collected the review tags received on v2:
  Acked-by Oleksij Rempel, Acked-by Carlos Song, Reviewed-by Stefan
  Eichenberger (both patches)
- cover letter: add the real-world trigger (MPQ8785 PMBus regulator
  on the LX2160A) and how the fix was validated, asked by Carlos Song
- resend as a new thread, per Andi Shyti's request
- Link to v2: https://lore.kernel.org/r/20260525-for-upstream-i2c-lx2160-fix-v1-v2-0-26a3cc8cd055@free.fr

Changes in v2:
- Handle when count > I2C_SMBUS_BLOCK_MAX the same way as count == 0
  Reported by the Sashiko AI review on v1.

---
Vincent Jardin (2):
      i2c: imx: fix locked bus on SMBus block-read of 0 (atomic)
      i2c: imx: fix locked bus on SMBus block-read of 0 (IRQ)

 drivers/i2c/busses/i2c-imx.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260525-for-upstream-i2c-lx2160-fix-v1-0cba0a0093e5

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


