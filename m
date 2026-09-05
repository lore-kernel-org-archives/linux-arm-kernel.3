Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E0DC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 07:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h4+27NX6f71aIYWGk8AUx1jZFXcAPxn0Psebvis+0mM=; b=Dz10+gBp5aoUoowY2q8N0TM91X
	jKyRIUWHrOdl8FTyS1rckkprJXZIWxalvlSwB1AuBEA4xejsfIpnmk0BrKfnbbSf1y5egiT+tjUdh
	m927qW/oRSbUKGIWjY6uP93VERBZqTSJpmo3jtPbjifRL7mGJYt/5nU147VtXEOkKugoQEdLp5Ltb
	SlXFMlTuyGZSC+4T1lnVwnHNI02poaGUz0OZgckJ0aZ/4/Ij4fRaVc/Yk68GNL/bGBMNam4iWMayC
	k2Ee9dombdFnB266dAf5E28DGSCC/n62Z9IzRcQiMgcpQERtvstNmXnfn796IoKY+nlckDrlD7i7a
	kTitJKZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kpV-00000003nHT-0yso;
	Sat, 05 Sep 2026 07:28:49 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kpR-00000003nFZ-0lTP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 07:28:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 379B44E41530;
	Sat,  5 Sep 2026 07:28:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA37160580;
	Sat,  5 Sep 2026 07:28:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94E6C11C787BD;
	Sat,  5 Sep 2026 09:28:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788593317; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=h4+27NX6f71aIYWGk8AUx1jZFXcAPxn0Psebvis+0mM=;
	b=EQxouB3pWOxWOJ1psr9a5YYC1X5PEYiJY/vlRQfgQND+bsUa8I3TeOTXoEIellRY7/lm9r
	arK8X9p3I9x0L32NiSChigzVJ1LxY9l7KuG7Z4QRQSznnji+nlHSMDg/65BLk5zDyKP2KY
	vuK1Pj8yGu4UT5EAqc02DvZAQVUGPK2mcl83cz7Yg+Ut/6PG4Wzf+q8Sq8PA21ldrqEUgu
	yR6vbxLVup82N2X+1zPvPl9T6h3RoFAQYR2h+LjXtLYIc7q1BSDuTXmKTvxmoCjlFM21PM
	mY5QbIjA4pXaTgMIS4sv1wfxYl/tBBzmMfXWAatoVSDYAPfwkI6dpv9AEvtFRQ==
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
Subject: [PATCH net-next v2 0/3] net: phy: motorcomm: Enable analog frontend DAC on yt8531S
Date: Sat,  5 Sep 2026 09:28:25 +0200
Message-ID: <20260905072830.28986-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_002845_359255_49CDB1DF 
X-CRM114-Status: UNSURE (   7.26  )
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

Hi,

This is V2 of TY8531S fixes for the YT6801 PCIe card.

It enables the analog frontend DAC at config_init() similar to what the
most recent vendor driver does.

Sashiko thought this would break after suspend/resume, this has been
tested and it's actually fine. This V2 just rewords a bit patch 3's
commit log, no other changes.

V2: No functional changes, updatede the commit log of patch 3 after more
    testing.

V1: https://lore.kernel.org/r/20260831073747.361482-1-maxime.chevallier@bootlin.com

Maxime Chevallier (3):
  net: phy: motorcomm: Split yt8521_config_init() page management
  net: phy: motorcomm: Add a dedicated .config_init for YT8531S
  net: phy: motorcomm: Enable analog frontend on YT8531S

 drivers/net/phy/motorcomm.c | 76 ++++++++++++++++++++++++++-----------
 1 file changed, 54 insertions(+), 22 deletions(-)

-- 
2.55.0


