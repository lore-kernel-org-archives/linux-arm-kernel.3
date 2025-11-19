Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051A3CF31AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 11:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uEewVsMLAv2aDxqt0r1sf+yLOlZnw0JDZFJF1n58Zro=; b=h/Y44dhBzSTLmaoj87liEmYep9
	EN4fGBIDHdgxzr3ONdCTHpePBqyN/xgsMtx9IvVd68aZEtx2KwcHGoi6LtLYDWKU9NI6vtjtOEvLe
	QCjUUSLvr1xzlj0wmEDoOLpIU1KPIc34e6yJJvyI+RyYESGKqZNrmZeDbZblDlV+3A1Q3r+8VfUt7
	PXH3ok2j6tEctR2IkADtuH58Pt176bg0nBBcaJlgzoIIvgN45rHQy2kMejU7W0c65XVmLJN+6+Rqd
	7jdri3j5SsWvx1P+5gQds7tVJbC1CY9pvHVTprrqEzgpd3KUR+Yqq/7eEKScasnbHLG7XBfBCG1Ii
	I7Z7clVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgSB-000000032BN-1kbG;
	Wed, 19 Nov 2025 11:34:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgS9-000000032At-0Mh4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 11:34:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uEewVsMLAv2aDxqt0r1sf+yLOlZnw0JDZFJF1n58Zro=; b=pOSTqqYzG2omR7F+wWJF0cCRo+
	+VUDDo73jyRh/xEVBPRhdQQ6T9zGEhqtu67BbdJzQt9+x+Tm5vz70rsV0Q8SAuOy/qOGC0XGJyt9V
	yeEJV3XEgrvnb794NKTTMqgwEks9JO3cAKZfuEmzMgdON1v6C8yuMDU7Mrgn5pkwLrjEIl7yv2963
	sb/Jpwso5IKLEk9cYwUgbcDJOjs7b52fwlY71z3recyM2MxH2sr8w9JcHXtytdh5fcFo9sO1FkXNj
	9hUmy3TMGncEFkI6+bqK7veiMvUCWByE7BlxmGlGxOjd65F749xBkBq7nxg3SnWAR9aWu/02ThhFT
	x+nb8vgg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36316)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vLgS3-000000004an-22ey;
	Wed, 19 Nov 2025 11:34:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vLgS0-000000003NK-0l0S;
	Wed, 19 Nov 2025 11:34:16 +0000
Date: Wed, 19 Nov 2025 11:34:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 0/3] net: stmmac: qcon-ethqos: "rgmii" accessor
 cleanups
Message-ID: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_033425_134241_8D5043F2 
X-CRM114-Status: UNSURE (   8.47  )
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

This series cleans up the "rgmii" accessors in qcom-ethqos.

readl() and writel() return and take a u32 for the value. Rather than
implicitly casting this to an int, keep it as a u32.

Add set/clear functions to reduce the code and make it easier to read.

Finally, convert the open-coded poll loops to use the iopoll helpers.

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 245 +++++++++------------
 1 file changed, 110 insertions(+), 135 deletions(-)
-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

