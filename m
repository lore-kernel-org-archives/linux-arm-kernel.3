Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC02D1061B18
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 22:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NAYiKbb+oVuecjBpnF7iY6F2gNVeoA4/QujM51sNFtE=; b=dLZ7KWcyPN/7Bu31XQzetcITd/
	fQQlDfv0rV5m8mFSBzcjCJOO9PdrzYfBfsxh1iGcFBaZFa7Yy76ZTXRTrdW077Sm8ABQ4XpjR4TJe
	6iWm1i58j/bvjtiesa5qMqwGy3cZXYBM32RT9vM4wwSRrqhzt68GnUaQrKISDn26WUcsBwZVss/DG
	GqtcBdX32gKY9RBVMljQUnkrp3hW3RoqVCSki1p9KbfM/t1HQW79a+sNEv7rxxzN02MyyNR6l+fFh
	aMUepJZeuvNbb04tBKrOnhvssvtiJYFVp03k+BBsP4MNoP5yTFBcHm5TpUOI3DaT1lgvnGUjZtkD6
	glR3dLOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7LNv-0000000BzV8-0SGR;
	Mon, 30 Mar 2026 22:47:03 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7LNs-0000000BzUm-1D8W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 22:47:01 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id EED7B1F8004D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 22:46:57 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 33BDEB2EBC9; Mon, 30 Mar 2026 22:46:57 +0000 (UTC)
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id F354FB2EBBF;
	Mon, 30 Mar 2026 22:46:29 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	=?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 0/3] drm: lcdif: FIFO underrun/solid color bug fix
Date: Tue, 31 Mar 2026 00:46:16 +0200
Message-ID: <20260330224619.2620782-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_154700_498762_494536F0 
X-CRM114-Status: GOOD (  10.18  )
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

This series brings a fix for the FIFO underrun/solid color bug (in the
last commit) and two other changes that may help with reliability.

Paul Kocialkowski (3):
  drm: lcdif: Set undocumented bit to clear FIFO at vsync
  drm: lcdif: Use dedicated set/clr registers for polarity/edge
  drm: lcdif: Wait for vblank before disabling DMA

 drivers/gpu/drm/mxsfb/lcdif_kms.c  | 42 ++++++++++++++++++++++++------
 drivers/gpu/drm/mxsfb/lcdif_regs.h |  1 +
 2 files changed, 35 insertions(+), 8 deletions(-)

-- 
2.53.0


