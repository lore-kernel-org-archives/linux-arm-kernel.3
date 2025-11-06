Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A67DCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2o51kKX3Zg0nj9Zi/x6rawFH6AzzpVCUPueof5Bfs3c=; b=xiXrpIH8k6ZMtMkO5oNMJEhMWi
	X5C8+g5CWuoQxkUKKsF6Lr1KtXmUvsqMnPs4RdpUUq1m1HFu41hi/gW3EBV5n4a8NCrrvJhQ5gnpd
	lwTmtZqA1oa3vrQeiJyFGhecKQWFkArXQAiqosyKTzhPnnPE25s8CcjixH+ND/V16C4eKJKL2gaHY
	K2juE4QNGjp4gBYQ9UecpnzbR28Jd/hOoiz5CwTiywPI75Prktna/3ahvWuABwOpxRFmvcicpXqAU
	rg2QH1uaz7jKnz/MW6Vv+Z9Qt8v+e0n+F7CvCNvvs9Sofl3FsLwziftni4UHc+LDVUuZY+/7FaELg
	FHI+6tAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGy3a-0000000FNGe-31vp;
	Thu, 06 Nov 2025 11:21:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGy3Y-0000000FNGA-08I3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 11:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2o51kKX3Zg0nj9Zi/x6rawFH6AzzpVCUPueof5Bfs3c=; b=A844+6e05ltMFBKMZI5HRVZVGa
	RMTLYIKVezGUWrP5bWudLcWi1Oe/YJEdZLNMflmUErBhkHMYybl8bXe27+mtpG9Em+KR3L23Oos0x
	Xa1+sUuQBri1FRwT63V5GJZl4Yl9MjXdTV03OK/LElezBwg+XIPDNg8onVHCWzhvzRZaImavCsh8q
	xVi3q7zTcNT6Lxgn0XJ7k67HGIoLgg78l/vgf7O1mnw9GkuQkh5W2PwfhD7Xw1RZyd19PY0LigthL
	IfCQOwiySNT1a5jxO+g5kxv6UptagpJJV5KOmS+FTlT2M0EPfIRvjdYavP9ipkZhkdLGht75H8yaZ
	6M/5p+0Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43456)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vGy3R-000000004ts-3ykw;
	Thu, 06 Nov 2025 11:21:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vGy3P-000000006bb-2NHW;
	Thu, 06 Nov 2025 11:21:23 +0000
Date: Thu, 6 Nov 2025 11:21:23 +0000
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
	Paolo Abeni <pabeni@redhat.com>, Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH net-next 0/9] net: stmmac: lpc18xx and sti: convert to
 set_phy_intf_sel()
Message-ID: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_032132_075397_51283B43 
X-CRM114-Status: UNSURE (   6.59  )
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

This series converts lpc18xx and sti to use the new .set_phy_intf_sel()
method.

 .../net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c    | 42 ++++++++++--------
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    | 50 ++++++++--------------
 2 files changed, 42 insertions(+), 50 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

