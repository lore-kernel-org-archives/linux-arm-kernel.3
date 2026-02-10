Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C510EB26E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 16:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sPP0Oz/1LcJ2dWkaUHEgPKlZBEdmg2TasEBz6nxriO8=; b=G14NVj52ZubSDX
	aiuxIvKqAUWqKs4rj5LZyJtsUO7e1RYQewzs9jHR28sja3sWqIWh7nBNTrcw6vI5HLOPpoTcbn1Lp
	AuXX7NXc1u8WrmFxcaL5rkP2LzOSEdxNWqCOedhwiQqRE/ZtPxtx16LZcW/1K0riylloVDBTtk9fX
	P4tGgu0z/tCz8SMAePDbIRxlSzFntkX3Qlv2faNu2Fq2Q7Xuheu0ioUs1mL61NChNgsy9cbx8AOOw
	wTxBR0KvuFWOoFqdVt0qWydp4GlRd2izb3ySXjXhSg9y0+49jQ4D/6Viuz1gdMZP1Z3nqoPQSsZbs
	wekxfuRfnca9Qe2FaN5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqbE-0000000HEfb-3kcT;
	Tue, 10 Feb 2026 16:28:28 +0000
Received: from mta-65-225.siemens.flowmailer.net ([185.136.65.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqbB-0000000HEd7-1ku1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 16:28:27 +0000
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260210162820c1d1d48a9c00020773
        for <linux-arm-kernel@lists.infradead.org>;
        Tue, 10 Feb 2026 17:28:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=sPP0Oz/1LcJ2dWkaUHEgPKlZBEdmg2TasEBz6nxriO8=;
 b=NONzSL45uoyKbwE6fE25ZyReRDaU14KXJOY0/YgjzHltwU+kTEw75HtLOvhtfKQHF+JDxE
 o4iKZ9ER7dzKg2yPhdfGobB4aYRd88UurZwlmBodLXI7bJYReECE7Yz/9vkrSXuBmgDVDrCh
 yThCKRqT4+x8YoDhMhgLwt0OHYEYh5LnkxtT6/skKomfcxJJ6moYYdNTGJ4Cp12yL36wqdUv
 wnhO0xcNykoR+2y6B7PxSJvRmBdD7dQ61dM/OU55DMj6ESEUzxpGxncTcQELq4E7knU+NMFs
 yVWjrbi24U+am/S6JySCuIpp1HSXEQaanO0JKjzehFZf0t+7HiNJWPxw==;
From: Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH net-next 0/2] net: stmmac: Fix MSI vector leak, make stmmac
 NUMA aware
Date: Tue, 10 Feb 2026 17:28:13 +0100
Message-Id: <20260210-flo-net-stmmac-default-affinity-core-v1-0-4e76612444e1@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ1ci2kC/x3NQQ6CQAyF4auQrm0CCCR6FeOizLTSZChmZiAYw
 t0dXf5v8b0DEkflBPfqgMibJl2sRHOpwE1kL0b1paGt26FumhtKWNA4Y8rzTA49C60hI4moaf6
 gWyKj6zuhrhcerh4KNVJiHCOZmwpmawhlfEcW3f/fD/iRxnuG53l+AQH/7CCVAAAA
X-Change-ID: 20260119-flo-net-stmmac-default-affinity-core-c54fa45fe63d
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Florian Bezdeka <florian.bezdeka@siemens.com>
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_082826_078071_2A0ED6BD 
X-CRM114-Status: UNSURE (   8.75  )
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

Hi all,

This are some fallouts of a quick stmmac "review", while trying to
understand some issues that we have around the IRQ spreading implemented
by stmmac.

The root cause turned out to be something more generic, so not limited
to stmmac. I will try to prepare a discussion starting point later. This
is more a RT specific problem, so I have to bring in more people.

Meanwhile I think it's worth to share some first findings.

---
Florian Bezdeka (2):
      net: stmmac: intel: Fix IRQ vector leak
      net: stmmac: Use cpumask_local_spread() for IRQ spreading

 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 41 +++++++++++++++++++----
 3 files changed, 39 insertions(+), 6 deletions(-)
---
base-commit: 6d2f142b1e4b203387a92519d9d2e34752a79dbb
change-id: 20260119-flo-net-stmmac-default-affinity-core-c54fa45fe63d

Best regards,
-- 
Florian Bezdeka <florian.bezdeka@siemens.com>


