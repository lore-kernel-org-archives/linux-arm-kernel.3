Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61537E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 11:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ukh1qgZ0Pyc6AEGHQTNHG7mtyRNJrHvmAWhwQAtmx+I=; b=1XvBsS41864+fhmW7QUaIILEur
	L9IkmwctETPV8bSRzemAVVVIb9byyQ3+ghjSKmNUT5ne0jSJk9Bt9YAZON5Zb9a6ApCtD44rBiJcU
	skSqyivcqUa2arlV33SsqabNLKEwPNziRuDGLSpae+9AxosuYOzOmsc+KZnDIz09ydR0TxqclYf5d
	RP1UwcQ/nt8CwUq5yqnR9tOwRWyemTUcGldZmlsm7YZsyadLLC+ym/Y25L5fhAo/yir2NLNefALaN
	C/OI+dWpdbvX7qSLs0sanaE/qFVXyY+Q+W/qYenzrXg7I28ajoNsBChlP0dyk43xAwDZEe5M2fNTz
	egX+SXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlfP-000000016SM-0Ve5;
	Mon, 06 Jan 2025 11:53:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUleC-000000016JT-3jqk;
	Mon, 06 Jan 2025 11:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ukh1qgZ0Pyc6AEGHQTNHG7mtyRNJrHvmAWhwQAtmx+I=; b=BZTwCfG3bkIuyi+CJHakP1R3ns
	hTOmH653YysrU0BwA2ihN6FdnGy9C88m67hLbo0EOuvbP8Kp88Zv2CTfAJdcBkJnGyXGFGMvkh+bk
	+cOJvlNNwQQM8kpvtGTrA0jYHsC2y/yT3TfAcKqGRrKzNSYLqkmytQMW4OkyQ7irrWMA9Qa0JR4t7
	cgyjMQcXdoYqbK8tZ9q2y4nt4/mgoECoFqIYzYJnWtS71NjP/B09cQOpx2Spwq1wZU54xV4p8wrXV
	HkOrYgMN3vcXMb47pb6aUCc/ymUE28abFG3LuyXmobO9y7tYFKkplj+92baoYb4r7uJQZWKvnyH1J
	7rYZpjDw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35088)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tUldx-0005jL-2L;
	Mon, 06 Jan 2025 11:51:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tUldr-0004FT-16;
	Mon, 06 Jan 2025 11:51:31 +0000
Date: Mon, 6 Jan 2025 11:51:31 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>, UNGLinuxDriver@microchip.com,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: [PATCH net-next 0/9] net: dsa: cleanup EEE (part 2)
Message-ID: <Z3vDwwsHSxH5D6Pm@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_035152_929264_AAFE2097 
X-CRM114-Status: UNSURE (   9.33  )
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

This is part 2 of the DSA EEE cleanups, removing what has become dead
code as a result of the EEE management phylib now does.

Patch 1 removes the useless setting of tx_lpi parameters in the
ksz driver.

Patch 2 does the same for mt753x.

Patch 3 removes the DSA core code that calls the get_mac_eee() operation.
This needs to be done before removing the implementations because doing
otherwise would cause dsa_user_get_eee() to return -EOPNOTSUPP.

Patches 4..8 remove the trivial get_mac_eee() implementations from DSA
drivers.

Patch 9 finally removes the get_mac_eee() method from struct
dsa_switch_ops.

 drivers/net/dsa/b53/b53_common.c       |  7 -------
 drivers/net/dsa/b53/b53_priv.h         |  1 -
 drivers/net/dsa/bcm_sf2.c              |  1 -
 drivers/net/dsa/microchip/ksz_common.c | 15 ---------------
 drivers/net/dsa/mt7530.c               | 13 -------------
 drivers/net/dsa/mv88e6xxx/chip.c       |  8 --------
 drivers/net/dsa/qca/qca8k-8xxx.c       |  1 -
 drivers/net/dsa/qca/qca8k-common.c     |  7 -------
 drivers/net/dsa/qca/qca8k.h            |  1 -
 include/net/dsa.h                      |  2 --
 net/dsa/user.c                         |  8 --------
 11 files changed, 64 deletions(-)

Changes since RFC:
- Removed removal of phydev check in net/dsa/user.c
- Addition of mt753x changes

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

