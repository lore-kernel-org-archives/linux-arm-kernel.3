Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA13C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pq7C0R4E2XSkWcjWutsZp1ZBQTicxPhIkd8OpkWTuhk=; b=LYIpimlLte6tyTXEK0sROgY/So
	sz06/zrR5VUfcfgmkh+lX2aPz0Mi1xzsbOVFnrE7BXaeI1Tt13GUcX3EkVEkFU6rHSiCwNPSrd8mh
	70CYUY30zX15Wr3hn26bFDFAAdnxfzcuUCYbcMeBUlUHxv27nrzxTsT/Bg/QA6HpulfEEf+cyiSKN
	QFfpGnxUL7/9fnqNIlrlFfFS+JWkZ2Qx+e/XDPOyabcsCi9A2E5W0+bDrqBzA2eDRv9eUDd+vJuzE
	H8fQcCUnIn11xw+70mfTVo+1Qdb+8ygAVx1pNhREtmub/eML3fm48bg7U22/GhF86qs2CkWqGTD6K
	NzaWq3Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnrm-0000000EKp6-34gg;
	Thu, 12 Jun 2025 19:45:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkAO-0000000Dr7l-2roR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Pq7C0R4E2XSkWcjWutsZp1ZBQTicxPhIkd8OpkWTuhk=; b=SO3ihB7jHnaSOG7iS49kyxLkGP
	BHymFTZSA5Inmq4qoxmPtj+UrTlvFco0FbIzAi10gEf3EpkvdT5GFbJKLz/vTTvSHRVnKcp8Mnpi7
	stkunfMdoTle+dJnHxo657gbXHreNGgH6Riddev5pW8D7V/Fa0qy68LJFxcIxenMzbB0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uPkAJ-00FZAe-Ns; Thu, 12 Jun 2025 17:48:31 +0200
Date: Thu, 12 Jun 2025 17:48:31 +0200
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
Subject: Re: [PATCH net-next 3/9] net: stmmac: rk: add struct for programming
 register based speeds
Message-ID: <92cfb2d8-03db-404d-96d6-c9782ce22bf8@lunn.ch>
References: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
 <E1uPk2t-004CFN-Td@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uPk2t-004CFN-Td@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_084836_717782_39CBB6E7 
X-CRM114-Status: GOOD (  10.21  )
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

On Thu, Jun 12, 2025 at 04:40:51PM +0100, Russell King (Oracle) wrote:
> There is a common pattern in the driver where many SoCs need to write a
> single register with a value dependent on the interface mode and speed.
> Rather than having a lot of repeated code, add some common functions
> and a struct to contain the values to be written to a register to
> select the RGMII and RMII speeds.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

