Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504F3C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 22:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZKPPgLOnaA6LtXNLTqGU/0863A2eFjmUO8YRdkWJA4=; b=XV4/EtnC5BJxTLgr8dKrfHRvby
	zFLFysEwzg9dQP0nDzGTbDaD8ANNTXqdvM4qhXRxoBt0RJc7pSfx5894IvpuNQe3MFlafDBPju8St
	GRGcFYya4DYZ1rbjjQzylZoeVHwC1vHyMRFge+718XCBgR5T3vTQZagFHp5khOObZZHi1PMWTNxTV
	tEbYhDpOYD+kHM1GWAkZnrdT7I7yzCWluFRdysRcSGbu9qzcXuiEgWe0V2pyuzVfO4l0O4wPWYCYw
	T/cMhsXLhUlTecxtvEAOennhpIRUeEVGQtLfzg+6VCvRPCpgkTEAvt0wTIwzRjCiJA6UGBaJkhFCY
	v/R690fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u462L-00000000HTI-30w9;
	Sun, 13 Apr 2025 22:42:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u460U-00000000HMZ-2sHm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 22:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yZKPPgLOnaA6LtXNLTqGU/0863A2eFjmUO8YRdkWJA4=; b=MIKCdwdTxzfm3nfeLK8y3tQrPx
	GMWv72wuecKr72/MAFovpO4qbGD8I8Cg87KO745HF+Dl2ZGdoRMUpfuvoSf6yXBRRTe2iQkYFgt5N
	gTgOojG7ShUf0rqNK0xgzGqV98HMv0Wt5sUzlFYynzlhBnuxaPq71cYgyT1uzoplz+w3uIh01v9l4
	Hf2qzDPOtxo34Of4kFQtbMgRdoq3O3qk5twXCMkm/hToxF3aPri/nuuO9fb0Jj1t/0F2VYhb9hTVd
	Hb/QX10GHmk4NCgEVTuuwwgMFo4aVF5HPtRgGMvY1wZFwnOZFqbArFnPzIXNymN4kx2OdP1MDtbnB
	RlZiSjtA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42456)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u460K-0005hA-0X;
	Sun, 13 Apr 2025 23:40:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u460G-00072n-0w;
	Sun, 13 Apr 2025 23:40:40 +0100
Date: Sun, 13 Apr 2025 23:40:40 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 4/4] net: stmmac: anarion: use
 devm_stmmac_pltfr_probe()
Message-ID: <Z_w9aE62dqOdr4w9@shell.armlinux.org.uk>
References: <Z_p16taXJ1sOo4Ws@shell.armlinux.org.uk>
 <E1u3bfU-000Em3-Mh@rmk-PC.armlinux.org.uk>
 <acd537c9-51f2-4d5c-a07d-032ea628d241@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acd537c9-51f2-4d5c-a07d-032ea628d241@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_154054_853724_B1DEA7C9 
X-CRM114-Status: GOOD (  11.02  )
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

On Sun, Apr 13, 2025 at 11:10:24PM +0200, Andrew Lunn wrote:
> On Sat, Apr 12, 2025 at 03:17:12PM +0100, Russell King (Oracle) wrote:
> > Convert anarion to use devm_stmmac_pltfr_probe() which allows the
> > removal of an explicit call to stmmac_pltfr_remove().
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Thanks - but nipa found an error in the patch - s/&pdev->dev/pdev/
with the new call. Ditto for "net: stmmac: anarion: use
stmmac_pltfr_probe()" so I'll be sending a v2 for both. Do you
want me to keep your r-b with that change for both patches?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

