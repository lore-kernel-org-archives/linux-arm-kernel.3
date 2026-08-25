Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39ADC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 19:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3kUsWigyCxlVGhk9F264e3SUeGKkjTppBYBtED+IPmo=; b=CMi47tTGZ6hO4IorI1zUkFW4EH
	ijmrEHF4VKleiqEkElJNS+A0Csmlo+tcwiCRSwu6SOLTYgfrjTI8EO6om55zEYRD8CeE33jxpA6Fu
	Sykf9MKWCuTibRcVrKJ/8XTu3obzHux/QWJ98lFj53/+MLzxE4dQ7QkUQWaHzGnyQRl/41jC3GF3T
	T4dd7RsUTVyR7OXjDSYZKIsnhrH0n5oIwzGK5iGoklhGk4nYbDjFrbxDfXSjAv22iVhaUnOqBSU5U
	xMR89pczUyIBn/Vh+b9oqBZAdGN5IOg1yQH6mIEwcnR6QgA4wK3/6NGtpGZORxTZOO9mIuEEZHB/B
	jtNGktBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywvV-00000001OUK-2oM8;
	Tue, 25 Aug 2026 19:35:17 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywvS-00000001OTe-2aBH;
	Tue, 25 Aug 2026 19:35:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B21E1BEEFB;
	Tue, 25 Aug 2026 21:35:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1787686509; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=3kUsWigyCxlVGhk9F264e3SUeGKkjTppBYBtED+IPmo=;
	b=XWq1gi/F1tNldGLcCgF7FSNwjsuSxPNwaCX1oVWR6SjlQ4XTL/8CEnI9ZAVJqhOuTuOW52
	SCzt70A8w9cAx55f9xmTgJmXqvjNl9r9EC8gZ/bz0uateg0BG4KXOVTraRoCascVPm/flq
	nA/HjNPbtuKT6dUupQLdKXma6VJ5WTMAqq9MrcIW2hWcKdxfYHmJM9GQY0DSstXsuyk6oi
	ZkihEI1ehOyGsqO4paNd53IPdx67EvsO7cEy1kvZZip3Kh00rsw0V8swkQwwcDSElL+OmK
	xgjv235fgb6ANjTlejoFsD6Ra4X4SMa0vHw7Jo46K3BJU5n6EvYm7SPpIF0m3A==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: netdev@vger.kernel.org,
	ansuelsmth@gmail.com
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	daniel@makrotopia.org,
	dqfext@gmail.com,
	SkyLake.Huang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	cjd@cjdns.fr,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 0/3] net: phy: mediatek: support EcoNet EN751221 gbit SoC PHY
Date: Tue, 25 Aug 2026 19:34:53 +0000
Message-Id: <20260825193456.1823985-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_123515_025150_6916B3BC 
X-CRM114-Status: UNSURE (   5.01  )
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

NOTE: This patchset bases on https://lore.kernel.org/netdev/20260708102341.53919-1-ansuelsmth@gmail.com/

Add support for the EcoNet EN751221 SoC gigabit PHY, as identified by
product IDs 9451, and 9471.

Caleb James DeLisle (3):
  net: phy: mediatek: move mtk_cal_cycle_wait to mtk-phy-lib
  net: phy: mediatek: bug fixes to airoha-ge-soc.c
  net: phy: mediatek: support EcoNet EN751221 gbit SoC PHY

 drivers/net/phy/mediatek/Kconfig         |   9 +-
 drivers/net/phy/mediatek/airoha-ge-soc.c | 215 ++++++++++++++++++++++-
 drivers/net/phy/mediatek/mtk-ge-soc.c    |  27 ---
 drivers/net/phy/mediatek/mtk-ge-soc.h    |   5 +-
 drivers/net/phy/mediatek/mtk-phy-lib.c   |  29 +++
 drivers/net/phy/mediatek/mtk.h           |   2 +
 6 files changed, 250 insertions(+), 37 deletions(-)

-- 
2.39.5


