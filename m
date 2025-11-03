Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E4ACCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DyJ9tqsoh38Bn05Ar1FcUNEL8tbSjuGx45/Aag3loLI=; b=sVzlWJeoomqUuyQ/9/vB7itawx
	KYdZfSmfbpdOh97f7MvOFQKwpLiPUeAD0EWYgy+BR8LDjcn9PGnxamOeBrZg82LUiJfiT/YAEtkhI
	cvtEIAUKbYyu4lTcTt4o+zmmIluZInqwHUCiTfGgBBRAl/opGeV8GXf7eNB0Ul8EZaIBvJI6KgGMj
	vou/OqVoTx/5xmvxzvu8eSy/7tw0w0tXCITQnV39xROTS2Kthh4vnMuBO2HDmLpNSYa2UH+64srOY
	QAuQrhCKmVfvNUch2MXqHQv4iGg74S7OnSNqhsikoJJ5Ouy5lkGVPRkau+nBWoLM8yqSmPNyu0pK7
	sC0OUCZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs84-00000009f8l-4Brt;
	Mon, 03 Nov 2025 10:49:41 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs81-00000009f7c-2UyA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:49:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 74EA11A183D;
	Mon,  3 Nov 2025 10:49:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 49EE360628;
	Mon,  3 Nov 2025 10:49:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36E2410B50057;
	Mon,  3 Nov 2025 11:49:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762166973; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=DyJ9tqsoh38Bn05Ar1FcUNEL8tbSjuGx45/Aag3loLI=;
	b=jNN+kD56Yue4K7UymDl+K+B78uA5KpqztHgAgZiAGhFnLRUvgeTUkWa4ea1dqgdVCI2iYD
	W+3r2o/KhCqdGi+b09OM1mBO6qJUNWwKZsfDC0hEGpWHq0P5rseOYK6JeLcZsJeno9YjZI
	D1M4UDaPLgMdmF8rvVcIr4maDpKBHz3cKEvqaiclsodvb0xuzO9pX+R02TytkAVjcqvcQe
	zSL+EylbzBtKv9pCVER0/v4vH9ElL6eMPV3YaCK1cExzMMgeoiTegL8iHbiosLOiLXqQqJ
	yP95wCumOAKKOEkkyjquqzHxL6ooHjgceKvmehay2aq+i2XrvtmyV5kavIexWQ==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Simon Horman <horms@kernel.org>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/4] net: altera-tse: Cleanup init sequence
Date: Mon,  3 Nov 2025 11:49:23 +0100
Message-ID: <20251103104928.58461-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_024937_789526_BEB4B58C 
X-CRM114-Status: GOOD (  10.61  )
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

Hi, this is a V2 for Altera TSE cleanup to make sure everything is
properly intialized before registering the netdev.

When Altera TSE was converted to phylink, the PCS and phylink creation
were added after register_netdev(), which is wrong as this may race
with .ndo_open() once the netdev is registered.

This series makes so that we register the netdev once all resources are
cleanly initialised, that includes PCS and phylink creation as well as a
few other operations such as reading the IP version.

No errors were found in the wild, so this series doesn't target net, but
given that we fix some racy-ness, a point could be made to send that to
net.

This series doesn't introduce functional changes, however the internal
mii_bus for PCS configuration is renamed.

V2:
 - Add Andrew's review tags
 - Change patch 2, to get rid of priv->revision and print the core
   revision at probe time instead of doing it in .ndo_open()

V1: https://lore.kernel.org/netdev/20251030102418.114518-1-maxime.chevallier@bootlin.com/

Maxime Chevallier (4):
  net: altera-tse: Set platform drvdata before registering netdev
  net: altera-tse: Warn on bad revision at probe time
  net: altera-tse: Don't use netdev name for the PCS mdio bus
  net: altera-tse: Init PCS and phylink before registering netdev

 drivers/net/ethernet/altera/altera_tse.h      |  3 --
 drivers/net/ethernet/altera/altera_tse_main.c | 47 +++++++++----------
 2 files changed, 23 insertions(+), 27 deletions(-)

-- 
2.49.0


