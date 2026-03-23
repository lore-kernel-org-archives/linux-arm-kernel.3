Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAD2EC01B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uyQYdiej4kg7+A6cNHspaCFDdCIQkqIk1oKjjwfohi4=; b=iICUOOwzln6jCCWmpwAksU/joF
	pKrJOne2BVXd6/Vof0lKLqFquXHsy3lieDeKM506EPSOnmhv5Fh2in5nb3xtOv+P4MUdoXSSZ6KF9
	jeWka2yGgfz/7XhcJQKJu3DYT7Zw5DRujUiFhL6W8QPQ566cc+ppIKShYBycyRaGpCo39JOlfAeSI
	4gCAgmxbaAd9k+Advn3sZR1wKz2d8X3adDO0/h/9zJ7os3fdprct4w2IRx62yuyFC0EbWKKRnLkAo
	dM+T9+lBTrOGEna7Q3BiT+nCoyYlNO7VRV7OhwyqMrus2Mo1QOK8bvMtpgt5wovWoi6uSDynBC/KX
	VsXfd1JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4blA-0000000GOOw-0zUF;
	Mon, 23 Mar 2026 09:39:44 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bl7-0000000GONy-25hC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:39:43 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7F5E5874;
	Mon, 23 Mar 2026 10:38:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774258699;
	bh=CtREjtYUErNei1WWtCpEy/9MeVxaYUz32mC5eZ7Fh2U=;
	h=From:To:Cc:Subject:Date:From;
	b=VVJL01JEFv5cnLs7xSwqok45AzRLo0XwBFW9rfJxMdud/+WHEMN1TcKFD/TzP7Zdr
	 Sf5Sap6PLQBQ7SvHng1gkA+h7r4OAAAQRjNPJs3sAgn1SHaUGa2z01ZY1cZ7JGw/K1
	 SdAqXUmR/6DBlvcQo++Xza5qdeyUKtKIeWgwP5N4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: netdev@vger.kernel.org,
	imx@lists.linux.dev
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Joy Zou <joy.zou@nxp.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/2] net: stmmac: Disable EEE on i.MX
Date: Mon, 23 Mar 2026 11:39:31 +0200
Message-ID: <20260323093933.1785583-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_023942_032512_641E6803 
X-CRM114-Status: UNSURE (   8.59  )
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

Hello,

This small patch series fixes a long-standing interrupt storm issue with
stmmac on NXP i.MX platforms.

The initial attempt to fix^Wwork around the problem in DT ([1]) was
painfully but rightfully rejected by Russell, who helped me investigate
the issue in depth. It turned out that the root cause is a mistake in
how interrupts are wired in the SoC, a hardware bug that has been
replicated in all i.MX SoCs that integrate an stmmac. The only viable
solution is to disable EEE on those devices.

Individual patches explain the issue in more details. Patch 1/2,
authored by Russell, adds a new STMMAC_FLAG to disable EEE, and patch
2/2 sets the flag for i.MX platforms.

[1] https://lore.kernel.org/r/20251026122905.29028-1-laurent.pinchart@ideasonboard.com

Laurent Pinchart (1):
  net: stmmac: imx: Disable EEE

Russell King (Oracle) (1):
  net: stmmac: provide flag to disable EEE

 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   |  9 +++------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  7 ++++++-
 include/linux/stmmac.h                            | 11 ++++++-----
 3 files changed, 15 insertions(+), 12 deletions(-)


base-commit: fb78a629b4f0eb399b413f6c093a3da177b3a4eb
-- 
Regards,

Laurent Pinchart


