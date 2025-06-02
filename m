Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1B4C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 15:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsmBZUh+vyXv4ku+fzDdFGhVlt45TaS4taDV3PYjBJs=; b=E5YgATpsUL98io/BP3kArqopSr
	p24hAkgKiY60uCggA4UoPqP7btBYWhNWh41XY51DBUN3IamZqf172JbkXCK/TH0LZK2rlH6A9EJes
	3Df1wymHdGTdKyGDSLKDVnx2GVw4rn3uIVg1zYcUN49sCA2t/K2njoOu3QT0duMBC+DYfWuR1l9f9
	1cM+1L9pjjEarxnmOOJiVaCYYge107GkEfIPh+UVpfhhZ5Ne4ueVdX3WXyVp4r+m4f82nGooXUyQN
	irssG2aqkIE5Q6aX6DUhbMTuC+fEe9GWk17LMZ+Pkr2cpOA7SpHs/5+8sLojBPNAPKPlsBBMM0NEw
	9Y8pUGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM7KU-00000007nuj-0Xfq;
	Mon, 02 Jun 2025 15:44:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM73I-00000007l2S-0t8l;
	Mon, 02 Jun 2025 15:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VsmBZUh+vyXv4ku+fzDdFGhVlt45TaS4taDV3PYjBJs=; b=nocTW5lJMQ/TMaA8qaPK4x9xGY
	YHoLB6m1pNtMbB+bEbBT3ru7jVtGgwGZvuPuGgBT253G23p3UJ5WHYUwS26S9UmPa9E+uG8S65Lxp
	GFCvWfH4t88+KK4RUBPL48KvgCAUHuXHoI6rfN4XYyHIAu63tdKU7phtVc8bOvBOsWMkJGxoRXWCs
	jbqQ2DqHn9IRa8f2y8hTgjiqY3qQrA03xW/9y1g8BT5x+suXlKEihGY1Wec0H4D5q2afAdyT+XUuv
	AYUOV3yQbBY+yxWNOC9lbQ8zTiB40WZ5nP2ReoIqYXljqYIhBiID+mpg1B3ma/Pe1QEpaghq6GeNh
	ql3M45uA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55524)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uM72q-00051K-2g;
	Mon, 02 Jun 2025 16:25:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uM72h-0007i6-0r;
	Mon, 02 Jun 2025 16:25:39 +0100
Date: Mon, 2 Jun 2025 16:25:39 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ilya K <me@0upti.me>
Cc: Eric Woudstra <ericwouds@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC net-next] net: phylink: always config mac for
 (delayed) phy
Message-ID: <aD3Cc7gmB2Tev_ul@shell.armlinux.org.uk>
References: <20250107123615.161095-1-ericwouds@gmail.com>
 <Z30iUj6DE9-fRp0n@shell.armlinux.org.uk>
 <4b9b2a9a-061b-43ad-b402-a49aee317f41@gmail.com>
 <Z31CJS1YUvPGiEXs@shell.armlinux.org.uk>
 <98234080-946e-4b36-832f-113b185e7bca@gmail.com>
 <Z3-Tz5WdLCat91vm@shell.armlinux.org.uk>
 <9cc913d7-7e5b-4b6c-886c-ca9778c3f970@0upti.me>
 <aD1lRha-enQ9Pw0g@shell.armlinux.org.uk>
 <2894a781-4d4b-4e3c-9f4e-7c1f04122f8a@0upti.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2894a781-4d4b-4e3c-9f4e-7c1f04122f8a@0upti.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_082616_250895_ECE4BCB2 
X-CRM114-Status: UNSURE (   9.08  )
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

On Mon, Jun 02, 2025 at 04:00:14PM +0300, Ilya K wrote:
> That's weird, because I do have all the patches applied. I think this may have been broken by the pcs_inband_caps changes, because without the patch I'm just getting "autoneg setting not compatible with PCS", after which it bails, when it should really reconfigure the MAC instead.

Please enable phylink and sfp debug (adding #define DEBUG to the top of
phylink.c and sfp.c, and then send the kernel messages after reproducing
the issue.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

