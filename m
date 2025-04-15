Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509CEC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 12:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+wFGXyrj9LUB+jbNenNh9uv+nrfuQyXsxG1vPz8UJg=; b=U/oys5lS+6szf8kYIH781PV+z/
	1AP4XuYHl2hH5ttDwNEVURbJEgiJ4iqCEDu4daiTr7A8r1I/YfbVPIgSTi5w2zNFZPW1b9u7jy0Wa
	WUKw3hYg42ZX5Dozfvh99zvxHmQSBGJjs4nM/HtdWANm2B4XjVR7txMwe9OHAnzKm2Srvh+gB1aRN
	uu2RHsX27wB76Pzu/wvyUCBuBsLn6XB3/rFZutmdsAiLzzR/O4+5NrxLHPOOpLDg1e1WOKck+xJF6
	7Ls15KkniL1wgjg58LWWi4DGXYo0QZMbDSVrPCw5VR5PXNCs+NJ4qIqlqc+QQzBdXu4hO7IzGy8Ku
	hb3JUHGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fbT-00000005n40-1PUY;
	Tue, 15 Apr 2025 12:41:27 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fWX-00000005lxl-0r7P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 12:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=g+wFGXyrj9LUB+jbNenNh9uv+nrfuQyXsxG1vPz8UJg=; b=BXjaLMCYDOlU4Sruz2awQYW7u8
	6op6wAFOd02+kwH08V74+MmiFGnRQeLtZUaaL6xjBxDrumw427il/zrJSUNmCxavHzKw3QKaeaI/U
	57SFRaKdXErRjCYcDV80ER4o+v7SdB2rLvUU+mtbtLKZoCGPewIMo/aku0cb+O/iKo5I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u4fWL-009RAR-46; Tue, 15 Apr 2025 14:36:09 +0200
Date: Tue, 15 Apr 2025 14:36:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
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
Subject: Re: [PATCH net-next] net: stmmac: intel: remove unnecessary setting
 max_speed
Message-ID: <bd0eeaa3-9500-41e6-967d-0d7a8fd64201@lunn.ch>
References: <E1u4dIh-000dT5-Kt@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u4dIh-000dT5-Kt@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_053621_250767_395AD0C5 
X-CRM114-Status: UNSURE (   8.74  )
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

On Tue, Apr 15, 2025 at 11:13:55AM +0100, Russell King (Oracle) wrote:
> Phylink will already limit the MAC speed according to the interface,
> so if 2500BASE-X is selected, the maximum speed will be 2.5G.
> Similarly, if SGMII is selected, the maximum speed will be 1G.
> It is, therefore, not necessary to set a speed limit. Remove setting
> plat_dat->max_speed from this glue driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

