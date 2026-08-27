Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3250FC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 06:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5hwNQZbr35E51JRvfCspS2gfC+TaA8bCUWMUgPLAd9I=; b=Mt08iFmhD9wHKSMkQ1koaK5UAa
	f7IbFfzAeiBDf6ogsZpqC4BF4N+nibj0YAiAYzJOW18f1hVc822mpZHndibldV8sP4XJEpHE77jZm
	YG68tz35A4bWMa8jw7lsaf8eqFylpiPkUh4g68NkkGnrcSYImdbXHoG000TIN1kOxgFhv9+t3NU2j
	9yZujlI1MlwKicfxrrH3Uph4l5BXKN4cUuHTiNDsoXapxEr8qJ7Z5w+dsSnR22ZeTLd7NGxEv65+e
	eFo1eUhMdMax1J6E1naW3AfuNKOywD28DYbICrLcR2/IxQ9y2u2jU6vu5TvxfkT2fGfX2PXHiKfHz
	PyL9Hgng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzU5R-00000003Vm1-0Hyq;
	Thu, 27 Aug 2026 06:59:45 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzU5O-00000003VlQ-4A09;
	Thu, 27 Aug 2026 06:59:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67DD01EFEDE;
	Thu, 27 Aug 2026 08:59:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1787813979; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=5hwNQZbr35E51JRvfCspS2gfC+TaA8bCUWMUgPLAd9I=;
	b=t+WEZruYobiAY3S7wUFZHxdzgajpWmyyQVN75SxIPJqlnPDIwGU/MTOhGGlqkAqLWiZTXx
	Z1ggF8scMlV/znyEmVz4UD/bqABqQuNJEcBj1dA3z/gZXMM0iTrRQQeH5Cw1meuXn+BZ4b
	PjEC5XdYRZaAENS0Huji6JrTaNFpkW3mO8DdnVXL9++ALikQmDthaP69OV+8XwJbQgMtjY
	nFevjgIhI/JVq/fOmyQOaEvQrQGJA06TeOIlHucte1HsC3JZNwga7gKQQ7JuFEIqXooqpE
	kj1nVlhEEVlT5RBju2h5GQAvypzqDrembpICiwHvJHcnNTsPdi0ablHuJwmbEA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	daniel@makrotopia.org,
	naseefkm@gmail.com,
	joey@tinyisr.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v2 net-next 0/2] net: phy: mediatek: add driver for EcoNet Fast Ethernet SoC PHYs
Date: Thu, 27 Aug 2026 06:59:28 +0000
Message-Id: <20260827065930.2618729-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_235943_269252_905141EF 
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

Add support for 10/100 builtin SoC PHYs identified as 03a2.9414 or
03a2.9412.

Changes since v1:
* Include 03a2.9412 and differentiate from MTK_GPHY_ID_MT7530 by checking
gigabit support.
* Switch to for loops that are easier to read
* Add ECONET_RETRIES and explanation of calibration re-tries
* Better explain the "master" PHY which is needed for calibration
* Fix incorrect reverse christmas trees
* v1: https://lore.kernel.org/netdev/20260825180421.1804729-1-cjd@cjdns.fr/

Caleb James DeLisle (2):
  net: phy: mediatek: differentiate MT7530 GE PHY from EcoNet FE PHY
  net: phy: mediatek: add driver for EcoNet Fast Ethernet SoC PHYs

 MAINTAINERS                              |   6 +
 drivers/net/phy/mediatek/Kconfig         |  18 +
 drivers/net/phy/mediatek/Makefile        |   1 +
 drivers/net/phy/mediatek/econet-fe-soc.c | 672 +++++++++++++++++++++++
 drivers/net/phy/mediatek/mtk-ge.c        |  14 +
 5 files changed, 711 insertions(+)
 create mode 100644 drivers/net/phy/mediatek/econet-fe-soc.c

-- 
2.39.5


