Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE9BC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 15:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w2VjUmcUhwo45yKsnIYQyEKNRQ2c98rmF9aT5Omixdg=; b=CxHvMSH8LAfwstND3WtnwpfHUK
	HuwGmhPxY8YbgofdDk1p72rPgW1BJsOSSbh/8qZq99kaID9mZ8mgfH78LBannZXFZB7jybPv1lTwg
	zvzS2AHOEJRkkzosOQ9sP+c+wvdur0qEPvzMT8RKU1MqcxGIkg+b4AAtVpGpJ0678r+8k1EBMTLaA
	yVYZknG3/gag/42IWeit8hvVqv80/jW8f9eJeIKP13UlxkAmcgVG1vaKbHS3ol1aURPsWAS6CMEkI
	VC5vf6jxI8neM8bLbARPb0RzFRD2uNslTK8d9LZr9wr/08ynbnUUcdZIAbaN0Lef2U873fvS8Mm9i
	1UmFnZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tma66-0000000EEU2-3PIj;
	Mon, 24 Feb 2025 15:10:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZjx-0000000EAE7-3sma
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 14:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=w2VjUmcUhwo45yKsnIYQyEKNRQ2c98rmF9aT5Omixdg=; b=WSlwxJPCmcu4xnkbsWzbiG3zY8
	tpIG3DO/dieoFK3cV1Ezwd1BJzFNXU/QeefmhPr49N0cBr39Lz4tS7d7318pOjagRGZcPXKUqzsRh
	zkhvuYecu6EVNhPDBbDyd+ThG2zoFW9dluANMurm7yi2tq5stBJegn1KqMPWdl/UFA+tBL6u773Rl
	quUupuZLXIoK3GKSK4XqiEcARcQ50fp379TJSf0zrUD7IVaUB6LjTpLzTmkxLagsx2EaQta59Dd9e
	QketBhXljhkl3AP0rubZ6EmuYKBZvHAxMhdEXJ5+I2vOPN1/6LJSXvuy8obXirPQIe1clAsh8zthE
	ecoLa1tg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47930)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tmZjr-0006fT-39;
	Mon, 24 Feb 2025 14:47:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tmZjo-00055d-35;
	Mon, 24 Feb 2025 14:47:16 +0000
Date: Mon, 24 Feb 2025 14:47:16 +0000
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 0/2] net: stmmac: dwc-qos: clean up clock
 initialisation
Message-ID: <Z7yGdNuX2mYph8X8@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_064725_960698_0F5E6F92 
X-CRM114-Status: UNSURE (   9.20  )
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

My single v1 patch has become two patches as a result of the build
error, as it appears this code uses "data" differently from others.

The first patch brings some consistency with other drivers, naming
local variables that refer to struct plat_stmmacenet_data as
"plat_dat", as is used elsewhere in this driver.

The second patch is the v1 patch updated for this with the build error
fixed.

 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 52 ++++++++++++----------
 1 file changed, 28 insertions(+), 24 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

