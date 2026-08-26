Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A743C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 20:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=toXwB0eW1pt+JnqYWTN4MSM2M7LRyf7NLGCct1UemPk=; b=vmK9DN1y49PCenXtoX4S860g+0
	xItVYqdA+ETlIAjcn1ncI5NrVpcoJGWPmzXt3wvlfUF5Xpi5X7rR/HpjOmsj9whnf0g2cFT1ILf1T
	MTarUdlMbxWpFBiam9GeV4lIVL/kKd27U23BeP+NS/R/H/F82LUNo8GTj0KcXYL8fXH4I0HsYkTJX
	xRPX7SRo0F2VRjhrC8szh0APRVobGnrUCV6atLgXbgfTuXXHHb9Dcvp2tTPupgrOVEuoMiGgAmt5h
	JGo+Z676ZJbZap2KaVmkdTzTSKf0yZLaJHT5PjkddPdX71HVWsrssKkEZR5F2G/DFSwvvFu4Y4uDO
	fsWF3DOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzK7p-00000002zAW-1QoL;
	Wed, 26 Aug 2026 20:21:33 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzK7l-00000002z6f-1YMd;
	Wed, 26 Aug 2026 20:21:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A2CF1E1D7F;
	Wed, 26 Aug 2026 22:21:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1787775683; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=toXwB0eW1pt+JnqYWTN4MSM2M7LRyf7NLGCct1UemPk=;
	b=LjtkvY82U8kiio0xI6s+Qh1TRTyuAicf+3kCqQLtu4UOgmYBU+mYtZ+26Nvd1ADfin6kIP
	HCHzLmZvCL/8Si3jxhjA/KktIByG/pAqCd/3CP8v/ZE+DiGSJJ8Csem6Zvkn74AvpTURyl
	aVNoe//W/BFGJpDo7y0EQHHO0v4HZ103qCWKen6F/Hn2z6SLar5fm3dxZkJiWbPWPFHM4z
	FL7amKUB31BWKItZM7vHqp+/W9ey41Sfnpkq7Du+8pUVvDvPX4eBqmFuzQsVVJrgOvl3YS
	+8tqYNyosFZiSoGl9oPVHeb51va9A/EC8q1VToPTIqwzzlhLJT4VzCpCvsJuZg==
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
Subject: [PATCH v2 net-next 0/3] net: phy: mediatek: support EcoNet EN751221 gbit SoC PHY
Date: Wed, 26 Aug 2026 20:21:00 +0000
Message-Id: <20260826202103.2280645-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_132129_669206_CC986244 
X-CRM114-Status: UNSURE (   5.55  )
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

Changes since v1:
* Make calibration tables const
* Stop disabling EEE as it does not show problems in testing
* Stop setting MII_BMCR before calibration as testing shows it unnecessary
* Add comment: master/slave resolution is unreliable and is therefore disabled.
* Fix typo in phy_restore_page()
* v1: https://lore.kernel.org/netdev/20260825193456.1823985-1-cjd@cjdns.fr/

Caleb James DeLisle (3):
  net: phy: mediatek: move mtk_cal_cycle_wait to mtk-phy-lib
  net: phy: mediatek: bug fixes to airoha-ge-soc.c
  net: phy: mediatek: support EcoNet EN751221 gbit SoC PHY

 drivers/net/phy/mediatek/Kconfig         |   9 +-
 drivers/net/phy/mediatek/airoha-ge-soc.c | 231 ++++++++++++++++++++++-
 drivers/net/phy/mediatek/mtk-ge-soc.c    |  27 ---
 drivers/net/phy/mediatek/mtk-ge-soc.h    |   5 +-
 drivers/net/phy/mediatek/mtk-phy-lib.c   |  29 +++
 drivers/net/phy/mediatek/mtk.h           |   2 +
 6 files changed, 258 insertions(+), 45 deletions(-)

-- 
2.39.5


