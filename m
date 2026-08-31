Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88431C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 07:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lroqDS7c7e/0FELjm//w6v7eePo37TDmc7OaHklp5WE=; b=sPFaSA9kt9wkVH5f0++teg6ha8
	MtQp33zYPNLGDmyZ8Q4MNA01EdT8QU/Ui69arFgp41iIOwS0S6R5zBtSk7T4yqxdYaQl6Pr1ng7Ef
	fSC/wYlw6o6Rz4u7/yl2heLpZkaraRDfE+5rIlwe08D6m2Tuhwk1MNkkXoU1Eko6XAAqScKCRr2IT
	fNyMjeT0e8pTSzt9rkkEqWp0j8mhlyZkiLs2tSv+5vvgnc6gsWfQu8QNREHW4id87+Z+KBX1T9k4w
	HgFwuOHcEjJo2iYeUFkqHkAeH9juzH66jGUBnQ/vka4PBdCUw3/H7fitMBXpJ0e5esI8W38EUjwEz
	FxxSpx+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wak-00000008k9s-0sWU;
	Mon, 31 Aug 2026 07:38:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0wah-00000008k8Y-0gja
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 07:38:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 67D7B4E41465;
	Mon, 31 Aug 2026 07:38:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 388C7601E1;
	Mon, 31 Aug 2026 07:38:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95F2E11C783B9;
	Mon, 31 Aug 2026 09:37:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788161879; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=lroqDS7c7e/0FELjm//w6v7eePo37TDmc7OaHklp5WE=;
	b=Wg5ZvIGShM3L2YujurYgehbqzzT5lBci4/33AHw4PD2rrYmCRrXUbcQUc7fWGWyWVxn+Yn
	BmAjByh8eFFwPs3Uwp5ClciWyGTCQe3Qv+RyG3m5eHpYOOCr4xfHIBx1pgCI3zIYCWAdur
	vfCHKmwIOWhPVRfClHhz+JYKc3dFgvLpYm5d/rXS4spbIm1lFyhgIpSXvXxjG5LzZuTxtl
	IkgtTd4AEIZ+3xsrOer5auiJdDhSPk7aEVnQSyPCq/VpJIbVxEApLN4U97ZSrV1cyz05pg
	AOiv+F9kD7YFvml7JTSS8mVIlNG7TKrVRBui+PMRcVlvJmmYSB1oN4vq58obVA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Yao Zi <me@ziyao.cc>,
	Frank <Frank.Sae@motor-comm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 0/3] net: phy: motorcomm: Enable analog frontend DAC on yt8531S
Date: Mon, 31 Aug 2026 09:37:42 +0200
Message-ID: <20260831073747.361482-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_003803_365480_137D79F6 
X-CRM114-Status: UNSURE (   9.75  )
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

In the process of getting more stmmac boards to run tests on, I've
acquired a nice and inexpensive YT6801 PCIe card, that can do
10/100/1000BaseT. It uses stmmac's PCI variant dwmac-motorcomm, as well
as an integrated Motorcomm PHY (the YT8531S).

However while testing the card, I had link-up maybe once every 10
reboots, and no traffic whatsoever. Comparing with the out-of-tree
driver provided by Motorcomm, it was found that some Analog Frontend DAC
needs a clock to be enabled, and indeed it fixed the issue.

As I don't know much about this device, this series implements the DAC
CLK configuration in the YT8531S driver only for the integrated version,
that uses the GMII interface.

I split that into 3 commits, the first 2 are splitting-out the YT8521
and YT8531S config_init(). The third commit adds the DAC configuration.

This was tested on YT6801, which now reliably reports link up.

Maxime Chevallier (3):
  net: phy: motorcomm: Split yt8521_config_init() page management
  net: phy: motorcomm: Add a dedicated .config_init for YT8531S
  net: phy: motorcomm: Enable analog frontend on YT8531S

 drivers/net/phy/motorcomm.c | 76 ++++++++++++++++++++++++++-----------
 1 file changed, 54 insertions(+), 22 deletions(-)

-- 
2.55.0


