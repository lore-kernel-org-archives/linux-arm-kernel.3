Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAD5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 15:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yo1xDq+wfYbwrBDeLDsa/4C2gZAi/9pUb8nmVm9HOpQ=; b=ofaMdnxCOuC0GP+1PvXQwMqwzh
	v4eInDHNcvydavbY5xYV/WGefxSeN52Drq8fsbiPhmM59r9sJDp9t8Vd6pJMzInz1ps+gEAYXKMIW
	obMqnwKdMHjXugJojHHmde3iAUQpt/hQI+SCjPg2cRRyQwsmAodz/BhOltYY/ESVP0ruFaZnUB1Ot
	Ba9+0qhy7Y28nAUz9fssx+vKlAmGq1jptjMp2JhER9ePneNJTdqPSnYApWGf9qOwESNVIs4b3dzEz
	Y3dox35Clh4vn5eo+mPNgp7kcQQBrjYfAvCrKpdeuLGqNQHEReEFC3EzY9bEaXNsm3SN1LvTMwBuv
	reJayUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUorZ-00000001jDR-1lcp;
	Mon, 06 Jan 2025 15:17:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoqM-00000001in2-423D;
	Mon, 06 Jan 2025 15:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yo1xDq+wfYbwrBDeLDsa/4C2gZAi/9pUb8nmVm9HOpQ=; b=a7PD+k4QqqdNYRLJ6VIfaGwZuL
	eRmzcFxYXk2BrWrUQTsAZDlsqmxRShnCOu5yqHG4sqMUlgBDDvSD0oM/d/nigVu6UHhAbq92U/kKr
	NvkV/dnNcl8LGKtaRWYiovBz1aw/UT++5SxIBxxFCfGnR5eb3kr53E0Q/In5R5laVKt5Ne+LwcyUm
	9ofWVe6Z5irMwRYSKr8JGNBzmuzRHiKeAjYREBfOaSCzex/DFac7rxY12OgTC8f2XKOTzukgPVw+6
	TmvFTbmZx90YNn8TeJa05G6bT/hrMXb9DOF3tsdtgjPVimtk9U5dRHRgdMzQ+/AytzyY/zHNE78xk
	BZyfAYtA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60118)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tUoo9-0006AM-1y;
	Mon, 06 Jan 2025 15:14:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tUoo2-0004Nh-0J;
	Mon, 06 Jan 2025 15:14:14 +0000
Date: Mon, 6 Jan 2025 15:14:13 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
Subject: Re: [PATCH net-next 6/9] net: dsa: mt753x: remove ksz_get_mac_eee()
Message-ID: <Z3vzRWimau916tDY@shell.armlinux.org.uk>
References: <Z3vDwwsHSxH5D6Pm@shell.armlinux.org.uk>
 <E1tUllF-007Uz3-95@rmk-PC.armlinux.org.uk>
 <c133c8bf-d28f-437d-b5e1-f575959651ca@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c133c8bf-d28f-437d-b5e1-f575959651ca@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_071638_999634_A82FDDFA 
X-CRM114-Status: UNSURE (   8.80  )
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

On Mon, Jan 06, 2025 at 01:03:46PM +0000, Chester A. Unal wrote:
> The patch subject mentions ksz_get_mac_eee() instead of
> mt753x_get_mac_eee(). Keep that in mind if you happen to submit a new
> version of this series; this is not enough as the sole reason to submit a
> new version, in my opinion.

Thanks for spotting that, I've fixed it for the next posting!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

