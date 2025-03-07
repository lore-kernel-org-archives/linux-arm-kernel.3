Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8BFC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 13:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jkx3f0giLdjTBdslQHfz5NRis+vzSJwwRoYIVdv9lsw=; b=HJVgEZRHiMRw1PTauYRuZMWusJ
	S/eF/ujb5dxLOidCjFweMKwxAaVd/mUZ7zrQchkRxLA8uZ1usw0CmLum715M3Gce5JQiqCsjcSgOT
	tv9L69oRCrEb3JNwb47XkZtb9uW0tbVqfHOqZGn/3HSKcxwi+03edwI2fGj8njVH4jlMWPfVz8Aai
	EoyFHeSpIYWkYS3XGKcy1PsE6BOIYnbnaW44ZlaNQqWYiBajQLVDXCJAo8ftHwvDx2OmBeYr8JtMu
	nV/zh4LSeh8/ezTg2oADVNXeC2p7i35Kdtr3IPSyMQPfYaOnahgcdYQW0eqGBMqd4YEVspJHA3LZR
	RzPnztCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqY9P-0000000ENpW-0NlW;
	Fri, 07 Mar 2025 13:54:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqY7l-0000000ENX5-3Lzx;
	Fri, 07 Mar 2025 13:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Jkx3f0giLdjTBdslQHfz5NRis+vzSJwwRoYIVdv9lsw=; b=e8cnS3UN7dYibdwZ10jktHczPl
	15tNwuQTBmqZxPOFXUGY3q8Duy5ddpk38Qib02oSsht9MK2oX5AptZAgwEA9B1jg+uY+ba3jmmfRV
	Iwy2s/rrSlUreWt0RCJ3OIDtvrPV2LbkSoO8BkpiBBk6Qx5P8pFRE/JF7Ku1h9vodFnI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tqY7Z-0039Yt-LO; Fri, 07 Mar 2025 14:52:13 +0100
Date: Fri, 7 Mar 2025 14:52:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Wadim Egorov <w.egorov@phytec.de>, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/3] net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for
 RK3328
Message-ID: <f5f397bb-476a-429a-9d1e-1c1a9beb8f89@lunn.ch>
References: <20250306203858.1677595-1-jonas@kwiboo.se>
 <20250306203858.1677595-2-jonas@kwiboo.se>
 <d6b15dc2-f6b2-4703-a4da-07618eaed4db@lunn.ch>
 <624f2474-9a39-46a3-a6e5-f9966471bf3d@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <624f2474-9a39-46a3-a6e5-f9966471bf3d@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_055225_834734_4355F42F 
X-CRM114-Status: GOOD (  25.25  )
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

On Fri, Mar 07, 2025 at 12:28:42AM +0100, Jonas Karlman wrote:
> Hi Andrew,
> 
> On 2025-03-06 23:25, Andrew Lunn wrote:
> > On Thu, Mar 06, 2025 at 08:38:52PM +0000, Jonas Karlman wrote:
> >> Support for Rockchip RK3328 GMAC and addition of the DELAY_ENABLE macro
> >> was merged in the same merge window. This resulted in RK3328 not being
> >> converted to use the new DELAY_ENABLE macro.
> >>
> >> Change to use the DELAY_ENABLE macro to help disable MAC delay when
> >> RGMII_ID/RXID/TXID is used.
> >>
> >> Fixes: eaf70ad14cbb ("net: stmmac: dwmac-rk: Add handling for RGMII_ID/RXID/TXID")
> > 
> > Please add a description of the broken behaviour. How would i know i
> > need this fix? What would i see?
> 
> Based on my layman testing I have not seen any real broken behaviour
> with current enablement of a zero rx/tx MAC delay for RGMII_ID/RXID/TXID.
> 
> The driver ops is called with a rx/tx_delay=0 for RGMII_ID/RXID/TXID
> modes, what the MAC does with enable=true and rx/tx_delay=0 is unclear
> to me.
> 
> > 
> > We also need to be careful with backwards compatibility. Is there the
> > potential for double bugs cancelling each other out? A board which has
> > the wrong phy-mode in DT, but because of this bug, the wrong register
> > is written and it actually works because of reset defaults?
> 
> To my knowledge this should have very limited effect, however I am no
> network expert and after doing very basic testing on several different
> rk3328/rk3566/rk3568/rk3588 I could not see any real affect with/without
> this change.
> 
> The use of Fixes-tag was more to have a reference to the commit that
> first should have used the DELAY_ENABLE macro.

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

  It must either fix a real bug that bothers people or just add a device ID.

It does not sound like this meets the stable requirements. Plus there
is the potential for breakage. So i suggest you drop the Fixes: tag
and we merge this via net-next.

Please take a look at:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

    Andrew

---
pw-bot: cr

