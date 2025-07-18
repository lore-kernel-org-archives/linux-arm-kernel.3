Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D667BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MzOMyIV68qHQ0Kt7SHQ+0I+blgrtc5hfOPRGbkCaOXw=; b=MfSYureMip3HtsvohVfkp87+mU
	O4LZRO4o9hloDtSOyEk9pu1YYrFM98fC8HsB13LMD5E6DPoFxp/+FFUP2CVYi5PI65HRFBgiCxcse
	v5fRSg4cPYi9akbdfCoeYHpN7yoa3sbYWZvjJPsMLK/DRBH2Vr0dNnG4aomks21P268VvVbPLCwQd
	4TTnF5SUyt8k+mw6sbsHVzkovIP5m88b7T1mpiISho+4DcITX9w7RpxWvrWSyiUnazTjz51Ev3rpU
	aKEaeuPMV21wQ1OboFSR90mWlIXLxUDe57YNg3M0ABAD3iCOi8gtBSlxVb6KV8iC/FfHWRjcHIXXn
	xIaVSZ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclH8-0000000Chy7-1Gcj;
	Fri, 18 Jul 2025 13:37:22 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uclEe-0000000Chk0-0n1r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 13:34:50 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id DB6B01FBBB;
	Fri, 18 Jul 2025 15:34:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1752845682;
	bh=MzOMyIV68qHQ0Kt7SHQ+0I+blgrtc5hfOPRGbkCaOXw=; h=From:To:Subject;
	b=u+5twy+GcjC/2I6RtkO5b91F9NkV42c6eu1+N4v8XBtVuWd2u44uSNSfeEpTlzqol
	 P2krDTV4T4ozRlh0UxoHkIS8o0E9SaGlGtB7U18vh8nTDdBCbhSSFWC5Hu6/sG0R6+
	 x/PVztIBIzhWcj4tPx4AOSpNngR3RlY1bhdQRQWI4ocr0x/RN/KJeZoW3Di4E7ZI0R
	 bn8ph+yymT5vJr2p+vtks3c3qWPqRePFLcuJHvMCFYvulIarz4Kay7P2jF4nFOOSN2
	 /cWCtnQ4pCwYIk0RFzrpq0lARzB8V4acIaUmyzV2+9DddvdhTXv3Xd37hfCDcu8e3S
	 imOGSNF4fAIlQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] i2c: lpi2c: implement master_xfer_atomic callback
Date: Fri, 18 Jul 2025 15:34:27 +0200
Message-Id: <20250718133429.67219-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_063449_135196_A9ED896D 
X-CRM114-Status: UNSURE (   6.77  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This series adds atomic operations support to the imx-lpi2c driver and split
the previous v3 patch into two separate patches.

The first patch replaces the open-coded polling loops with readl_poll_timeout.
This improves readability and consistency, and prepares the code for
integration of the second patch, while maintaining the same functionality.

The second patch implements the .master_xfer_atomic() callback, enabling
support for atomic I2C transfers.

Emanuele Ghidoli (2):
  i2c: lpi2c: use readl_poll_timeout() for register polling
  i2c: lpi2c: implement xfer_atomic callback

 drivers/i2c/busses/i2c-imx-lpi2c.c | 254 +++++++++++++++++++----------
 1 file changed, 172 insertions(+), 82 deletions(-)

-- 
2.39.5


