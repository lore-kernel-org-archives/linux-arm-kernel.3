Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A590FC71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 21:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EFMIuX82Zyu0j5AT6fptyrLq5xQV9BOFFIAyu6ii4C4=; b=gP4W3IcYQsaiw1v2t5hsMtl720
	uu4/RYm4pvxxPhNxLJH2t9PZZDWAwBH5z13irB949p2Gu/AYr4Bv+eP8r8myXFc7dBpZpLWWoUM/T
	AO8ks4TizyV8u/qSjtpx4kHJrafX/AFiJMijHR0FYOBl29RKnr5UtnR8rqDfC5akOD8Df0fQYewaT
	Mc/Uom4E+QbOqQ534UCbzkjwGqzy0+pQv8dAX1NlLsAOjhe+ImaYfzklzNTW9waNKbXr2Z3lqHNxY
	tHMFFHqZoux6MT6zTpVyTcbKMa4JakQsLAUGZnZ+KC97A/UXbSpjl0TEAOClbS9qRN84PZHMc2lRS
	cvQ3ZNAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRH3t-00000005X98-1xe3;
	Mon, 16 Jun 2025 21:08:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRH1f-00000005WzY-1tQP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 21:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EFMIuX82Zyu0j5AT6fptyrLq5xQV9BOFFIAyu6ii4C4=; b=sseSvX+kEeHUp6/ITIrfE5ZP1r
	xRxBO+p5YGkgGEoF+uthmOEm0FtwC0Qa79a49S3aAlL/p8iQJeWTrXQV6fVzP1ERp+P6igak/VBa4
	vaefgvtD9lAir9Av0CYtvhHmvKGLqaT6uf5XMmW8zLG5PxWbxfI9sLyU1zQK1/INrRTKKUmiu5cgH
	4vJ7KCyWU7NIK8lisM1hjtjgk0hBFHiU6ybT02EuzRE1jaPlU1WqilSzoDUpuQ5+Txhyjis/YPeUJ
	D3XfDwkPgNYR2dn6f+BLbGbcJvIdftTdbuluER8rqxB0knpmk/XCt3ZlvVkiDk8eMCXMcP4GEgKMv
	PBggaxNg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45550)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uRH1W-0004GN-1h;
	Mon, 16 Jun 2025 22:05:46 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uRH1R-00058Y-1g;
	Mon, 16 Jun 2025 22:05:41 +0100
Date: Mon, 16 Jun 2025 22:05:41 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/4] nte: stmmac: visconti: cleanups
Message-ID: <aFCHJWXSLbUoogi6@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_140555_487850_AD50AD59 
X-CRM114-Status: UNSURE (   5.79  )
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

A short series of cleanups to the visconti dwmac glue.

 .../net/ethernet/stmicro/stmmac/dwmac-visconti.c   | 129 ++++++++++++---------
 1 file changed, 74 insertions(+), 55 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

