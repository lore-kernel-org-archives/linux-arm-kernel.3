Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7EDCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 07:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u7DpE+oTDsmY9vOfVzLTFJGa7kcYvBVKQHh8iIY9BgE=; b=2yrXHaVK9sENtnwdz/yM8/7BiX
	KdU5Mh129kZxiIaIrzCS1QqwhwWKCCUHqm1v5jpXvThkichscYgTBEHCBckWKaT2Hm1iJ5/YGF6+u
	WgTemqJkZJQpi3048CSNLda1ZYZTWQKmH+3hFRRjClbvZpIZQegMfw4nLlsn+DgfrCvTJ53bn+/Rr
	gQWC32uMXEMoaWrq9UvsgSldplC1wM8pBO4yu+xNSVIbMDlWgs3HkGf+ye+mr8nab97JpvrJ9NThO
	paiJXnt8fAZ5W1L3lckxpRt6nleciY//lsfCOGU+hpR46vOM5gkXl5/ivnSGzOXdKe3XykspTx68r
	FHat0LNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBtn-00000008Q3h-35Xp;
	Fri, 24 Oct 2025 07:07:43 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBtk-00000008Q2a-2w99
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 07:07:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 81B2FC0C41B;
	Fri, 24 Oct 2025 07:07:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47E5160703;
	Fri, 24 Oct 2025 07:07:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04012102F247E;
	Fri, 24 Oct 2025 09:07:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761289657; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=u7DpE+oTDsmY9vOfVzLTFJGa7kcYvBVKQHh8iIY9BgE=;
	b=Y6h9b4sgm0ErZAY1zT16Ddploj6AH9IjTzMSk1AmziZtMqj5HUH0GMq/IYTmjFZc1ZmRSY
	ja31HDlO4852i38mcagx27mP/GEFv/0Yk8d1MXR8lk703cMWR4Gscwngc39zroGx/l2gQs
	Jsi5FcL5hosjtr8sF9yOU4UR/loVx4y+Ln4Clj3wwktxdVDPABEVuao2e/Hyy3yiJF8Oz8
	7YxQNSmbjK7uD6J2WHdjeX0jxsH9JG3HVUNfPWdE7XmBwB6rrJf+O3BmVLgHOiYnwwaF1q
	WMqQmNDla5fBXh0KoUfo0Eilb49R41MtqzzIVKpI24kxXPrp2jGJ29HNVsDmbw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] net: stmmac: Add support for coarse timestamping
Date: Fri, 24 Oct 2025 09:07:16 +0200
Message-ID: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_000740_914202_0A407965 
X-CRM114-Status: UNSURE (   7.84  )
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

Hello everyone,

This is V2 for coarse timetamping support in stmmac. This version uses a
dedicated devlink param "ts_coarse" to control this mode.

This doesn't conflict with Russell's cleanup of hwif.

Maxime

[1] : https://lore.kernel.org/netdev/20200514102808.31163-1-olivier.dautricourt@orolia.com/

Changes in V2:
 - Use devlink intead of tsconfig
 - Rebase on top of Russell's rework of has_xxx flags

V1: https://lore.kernel.org/netdev/20251015102725.1297985-1-maxime.chevallier@bootlin.com/

Maxime Chevallier (2):
  net: stmmac: Move subsecond increment configuration in dedicated
    helper
  net: stmmac: Add a devlink attribute to control timestamping mode

 Documentation/networking/devlink/index.rst    |   1 +
 Documentation/networking/devlink/stmmac.rst   |  31 ++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   3 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 163 +++++++++++++++---
 5 files changed, 176 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/networking/devlink/stmmac.rst

-- 
2.49.0


