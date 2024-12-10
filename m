Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB8BE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E1k1NKAG0VAHn8y+herauQKsleTkHdP588nI/DUPH50=; b=QtGb5YYjv+5GMsVz7dd1bX8UMs
	8urSe60Y/YzpZgBLWZ0/ijtChUAUu7VK3i+hqAQuddC00a6/z69G/ZlR5fqR2YmDyOX8IQzsi59w7
	V7CR0f4Cl4znP4PiE0T7iRD1OI7SAn0GZlDT4BcG0NpoUAueosGJ5AA5ru+6xYRKkX3kNw+2VPap3
	Mg1fdF+g4fLZ9GYMZVofXoO1wTjS5SVbDEM/Q0Qa48zrOGG1ILPVo1JNMA5INYyeLqFIsshDeAyho
	EHXb7FNC3wNNKCYAjEnQLHdDI7OG4Zw4harByWAYqb2KjIXfi9fzAMtWPCgyU7RrocZsV6apUfBPo
	gQuEts/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Ff-0000000BlZI-3W9w;
	Tue, 10 Dec 2024 14:30:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL13z-0000000Bigc-2FoD;
	Tue, 10 Dec 2024 14:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=E1k1NKAG0VAHn8y+herauQKsleTkHdP588nI/DUPH50=; b=nd+65dSkyWy+Hb9E/SJk7+8tXl
	E1WpfAUxa077/fD+yAFuIYs+J8Uqy0tXl1tvktTwvOghB/xgZMht3SH6XTx5BeaVp6XAZ9J3i9RR8
	xuDRfcUJ1yV7igrOxM6swWEoyet/VP4OGdyRl8Vab0s/zx/pMcf4w+eaiS7+9rwe1hQjMudZvZV1G
	3yqNLrJphwPaQyQ63t92mhzDBDNkB4lzTEX/QR1VsJBFOkaER3xj5/r0xBUUbn9eF4ss8J3KHs2xz
	l59TafXWPoiFG0X2Zsf7Gtp8LD+Dkpg5AedIz/rd285jcX1xHwAIffrpdkWOsm3pwtml8bBksFvA6
	pQsMwcPw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40906)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tL13l-0002SM-2n;
	Tue, 10 Dec 2024 14:17:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tL13g-00031q-2T;
	Tue, 10 Dec 2024 14:17:52 +0000
Date: Tue, 10 Dec 2024 14:17:52 +0000
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
Subject: [PATCH net-next 0/9] net: dsa: cleanup EEE (part 1)
Message-ID: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_061811_573794_993F1C26 
X-CRM114-Status: GOOD (  12.03  )
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

First part of DSA EEE cleanups.

Patch 1 removes a useless test that is always false. dp->pl will always
be set for user ports, so !dp->pl in the EEE methods will always be
false.

Patch 2 adds support for a new DSA support_eee() method, which tells
DSA whether the DSA driver supports EEE, and thus whether the ethtool
set_eee() and get_eee() methods should return -EOPNOTSUPP.

Patch 3 adds a trivial implementation for this new method which
indicates that EEE is supported.

Patches 4..8 adds implementations for .supports_eee() to all drivers
that support EEE in some form.

Patch 9 switches the core DSA code to require a .supports_eee()
implementation if DSA is supported. Any DSA driver that doesn't
implement this method after this patch will not support the ethtool
EEE methods.

Part 2 will remove the (now) useless .get_mac_eee() DSA operation.

 drivers/net/dsa/b53/b53_common.c       | 13 +++++++------
 drivers/net/dsa/b53/b53_priv.h         |  1 +
 drivers/net/dsa/bcm_sf2.c              |  1 +
 drivers/net/dsa/microchip/ksz_common.c | 20 +++++---------------
 drivers/net/dsa/mt7530.c               |  1 +
 drivers/net/dsa/mv88e6xxx/chip.c       |  1 +
 drivers/net/dsa/qca/qca8k-8xxx.c       |  1 +
 include/net/dsa.h                      |  2 ++
 net/dsa/port.c                         | 16 ++++++++++++++++
 net/dsa/user.c                         | 12 ++++++++++--
 10 files changed, 45 insertions(+), 23 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

