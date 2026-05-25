Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9B4CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 11:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oE3KoR6ujNXPNGR9hHV+/+BmWrdpuRe9MSLzWGgAqFg=; b=B5K7s+BxiM1VBZ
	1SPoA11MYlKlRd7Rzk4ntQruwEa5BSD8e5toqH5NPC9JGCEw9f4OBuvPP0xOHo9nz8gkwyIcanBAa
	z5vYMPTK+T/8Md5ooRGJtmi0Gt8ql8lJUAR4iy87wwYTlu4SG8GzqfcbDBBqSnF6g8pGuQev7zYd7
	4YvXTuS0+Ed1M+7ng0aLoxq7JN9v6J1t7GkVHVdc5Wfu5lEQk5UQSsCfZ0rMeCzEalhqEjSl13tHV
	Llep6axCC5oCGqfME4lMWh9Hs8GNigmZjHFhicEevvKbM+AYkpnIZfPUySJ4vHqC/Cdo4eSP/V3gI
	Ks0P+uR4b7qPpQNezoqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTQE-0000000H5Gn-0m4I;
	Mon, 25 May 2026 11:24:38 +0000
Received: from smtp1-g21.free.fr ([212.27.42.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTQB-0000000H5EV-0RCG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 11:24:37 +0000
Received: from [127.0.1.1] (unknown [91.160.0.144])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 148BBB0051E;
	Mon, 25 May 2026 13:24:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1779708269;
	bh=uxLP8IbyUY1c4syNBTYNja87B/Fv7UleF8C+qDT8zMU=;
	h=From:Subject:Date:To:Cc:From;
	b=jhqCRc/PehNw3nqF2B2O4/2bqBpdPkGXQP35+CUsg0a5EMGjXcVS4aNUkDmWMoip3
	 SzX5bDpg8g5aHmBCAnAf8dnoTyi0C6xrFnNoKAjerNZJCSRjoQJnd5+jDRMUnzHSMl
	 UH9Qcijk4KsVswkLjpxe11PfaQK2nJF2YC4x8pu7MxMNv1utSQwg6Fs0YGSUcfh46F
	 bF/CW2Tce/lhGkCpLxOE9kUaOQj2xGu9BVXHxAy1Fy24rwcPFB2GKxT+RJQywoClKi
	 yZeA1khX9in+kArfr89M6ejVhttRETJE2T3H1Z2rvXNeMd8Iw3ktx2JqxxfwjEAOHP
	 AF/iXEaLdxedQ==
From: Vincent Jardin <vjardin@free.fr>
Subject: [PATCH 0/2] i2c: imx: fix SMBus block-read of 0 locking the bus
Date: Mon, 25 May 2026 13:24:01 +0200
Message-Id: <20260525-for-upstream-i2c-lx2160-fix-v1-v1-0-f30ab53dd97c@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFExFGoC/x2NywqEMAwAf0VyNpBGKuiviIfajbsBX6Qqgvjvl
 j0OAzM3JDGVBG1xg8mpSdclgysLiL+wfAX1kxmYuCbPHsfV8NjSbhJmVI44XexqwlEvPB1SHAI
 FoqYSDzmymWTzH3T987wKnwFBcAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779708249; l=982;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=uxLP8IbyUY1c4syNBTYNja87B/Fv7UleF8C+qDT8zMU=;
 b=hkA59lEEOgeOFJ62bM+X3GOA+PH/x5di7iGQBCaVOjxVxUp+FZp9cFCnIJDDQxlkgi9lopr6U
 iwT9zSFoOLtB2OVKP/wOMpRkBZp/8xxLcR0qu4nvFHYWOHzy3ctSyy9
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_042435_564636_CFC7040C 
X-CRM114-Status: UNSURE (   5.74  )
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

i2c-imx rejects a SMBus Block Read byte count of 0 (valid per SMBus 3.1
6.5.7) and it returns without a NACK+STOP, leaving the target
holding SDA so the bus is stuck until a power cycle occur.

The same bug is occuring with two independently introduced spots, so the
fix is two patches with their respective Fixes: tags and backport ranges:

  1/2  atomic/polling path       Fixes: 8e8782c71595   v3.16+
  2/2  IRQ-driven state machine  Fixes: 5f5c2d4579ca   v6.13+

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Vincent Jardin (2):
      i2c: imx: fix locked bus on SMBus block-read of 0 (atomic)
      i2c: imx: fix locked bus on SMBus block-read of 0 (IRQ)

 drivers/i2c/busses/i2c-imx.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)
---
base-commit: 6916d5703ddf9a38f1f6c2cc793381a24ee914c6
change-id: 20260525-for-upstream-i2c-lx2160-fix-v1-0cba0a0093e5

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


