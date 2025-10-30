Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FAACCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zdVtCVfiDUJY2QRSa6ubd540pBgj+UbwTkasKdXjGc8=; b=WAyrsof8+cgAzqtUR5H/Yny80+
	hDYTYI+Dyp3yNLD0ngGASfAqAQjQPXaldo42NlCY0uxeDK4NxVNn+oFe9grDkUMkfz5y10KTENjkg
	7ZSmQKPKFy21qUrGfjodiMnRorWYdQJsqNyKz5taz9vu9oHOZvaVMLeAEe/KMXTzQQJ6FeSkZhaP/
	0lrqdj1Dzp1ciaYeo3B2X5wm7/efikY/BQr+nH7ns4xZPkEV/Pbex7GcBYjEdHvrnpCD3jGCQDi55
	nAiIkxCn/e5cLc4Bhyf1Np6h8bCdcxiRFvZ14mhfnQVO7j2tgpDe697bRVC/H4djc/I5YZDJKxjoL
	tN1SxGng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPpX-00000003yJu-0VwY;
	Thu, 30 Oct 2025 10:24:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPpT-00000003yID-3gkd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:24:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F1A6F1A1777;
	Thu, 30 Oct 2025 10:24:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6AB36068C;
	Thu, 30 Oct 2025 10:24:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 944B711808821;
	Thu, 30 Oct 2025 11:24:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761819864; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=zdVtCVfiDUJY2QRSa6ubd540pBgj+UbwTkasKdXjGc8=;
	b=S21umYqAgjNff5fVFSM/v0k2+VI/p7qqt8SqvBrP5KdXmvpQGUEwmAtuPBbsu5r+Sq0a1e
	3cxNaDteFBBQPzfDirBNcPSRuBZuZYv7CQ6EqAKkvN97YulSQqvBEnCS/JNH1eeY49Qm1h
	GNvP6azosIBNgJUi/IIUwwuBD248G9koy3EIJ9jp1ohGjVuZqDTZlNUvm8El+VL2la6I7n
	66wCdKhH5D7SS6oATjBhyWUeQf/QkYdFVld/tr4n82dCx+4TZe38i2X9UkMB4EuChDVm4I
	/Y+BnL3kfrnTY++CJQjAdDyVSq9thL1Uo+Jjzd5eYABIPe5ztSVjr9s6IX2G/A==
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
Subject: [PATCH net-next 0/4] net: altera-tse: Cleanup init sequence
Date: Thu, 30 Oct 2025 11:24:13 +0100
Message-ID: <20251030102418.114518-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_032428_048398_FB1CFA37 
X-CRM114-Status: UNSURE (   8.56  )
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

Maxime Chevallier (4):
  net: altera-tse: Set platform drvdata before registering netdev
  net: altera-tse: Read core revision before registering netdev
  net: altera-tse: Don't use netdev name for the PCS mdio bus
  net: altera-tse: Init PCS and phylink before registering netdev

 drivers/net/ethernet/altera/altera_tse_main.c | 37 +++++++++----------
 1 file changed, 18 insertions(+), 19 deletions(-)

-- 
2.49.0


