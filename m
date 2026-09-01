Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7F9C624D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 12:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdWnpN5iGKqOjiVIG1o47AbqSjEI69XYYtz2Z3ole4A=; b=35Hz5Z9ttYEOJLRVqZJ6FoLba+
	bcWn/AzT2a99MBy6zJYmyGr1fBw4QGuM/aRFcIqFhmoXMQQwFPUrxQIqvn5fDlTGZyHF6dxbMfdpS
	WBfnZMgWYoO0BdHh0pVqCyIlBJAVbLB0IJ8dtQKvCcuLU2430sD0XnGYPE65sa1+VczIHhK3rHQ0j
	qnJdkEE08oasVmZ1rtcwARApVHqdSgeG+7Bn6c/SXw6U4yEyAZxMqlnE6OKRtmX4qrdGhVIWirNY8
	1vkreQBlNDTZ2n0QTT5MZ8FszM2gyft2Uc6kG3wmAc/Cy0a8k7SvJ9VtFwpLR4qD5eLJ7x3W7ZcCx
	T8cW/+Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NV7-0000000C6DG-2kSB;
	Tue, 01 Sep 2026 12:22:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NV5-0000000C6Cg-1Ygn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 12:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HdWnpN5iGKqOjiVIG1o47AbqSjEI69XYYtz2Z3ole4A=; b=wIYwJysDRjxZNe5mlKoAshLsC2
	PGC67MswfnqliG2iCZ95UIO8R4sNNbOsVYb46auguwyTiUI0Da3FoVY+EyrkoWI1XybrcrkBovnn0
	9DD6ZjySSPtjJpRsFLjXVEOFyD2MbWsA58IFoADS8g+uup2dUBBEHh6frpxKs2hss8h8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x1NUu-002Lya-1S; Tue, 01 Sep 2026 14:21:52 +0200
Date: Tue, 1 Sep 2026 14:21:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, thomas.petazzoni@bootlin.com,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac4: Use the full perfect
 filter ability for UC filter
Message-ID: <c7819431-d33d-4e9c-ab36-be55b94d29f4@lunn.ch>
References: <20260831070121.349778-1-maxime.chevallier@bootlin.com>
 <20260831070121.349778-3-maxime.chevallier@bootlin.com>
 <285c8969-2f0d-46de-b098-60ff10f30cf6@lunn.ch>
 <493afde2-8603-41e8-b6ce-f8e399c53275@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <493afde2-8603-41e8-b6ce-f8e399c53275@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_052203_410162_72748F60 
X-CRM114-Status: GOOD (  17.38  )
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

On Tue, Sep 01, 2026 at 08:37:20AM +0200, Maxime Chevallier wrote:
> Hi,
> 
> On 9/1/26 02:12, Andrew Lunn wrote:
> > On Mon, Aug 31, 2026 at 09:01:20AM +0200, Maxime Chevallier wrote:
> >> Contrary to dwmac1000 that gets its number of perfect filter entries
> >> through the 'snps,perfect-filter-entries' property, dwmac4 allows
> >> reading the filter size from the HW features registers.
> > 
> > Does dwmac4 take any notice of "snps,perfect-filter-entries"? Should
> > it be marked deprecated?
> 
> It's only used on :
> 
>   "st,spear600-gmac"
>   "snps,dwmac-3.50a"
>   "snps,dwmac-3.70a"
>   "snps,dwmac-3.72a"
>   "snps,dwmac"
> 
> So, dwmac1000.
> 
> I'd say, we can definitely deprecate on IPs that don't match these.
> 
> Interestingly, there are _some_ dwmac4 devicetrees out there that use
> this property. It achieves nothing, and even worse, doesn't match what
> the HW reports :
> 
> In arch/riscv/boot/dts/starfive/jh7110.dtsi for example :
> 
> gmac1: ethernet@16040000 {                                            
> 	compatible = "starfive,jh7110-dwmac", "snps,dwmac-5.20";
> 	[...]
> 	snps,perfect-filter-entries = <256>;
> }

So another thing for the TODO list, extend the YAML description to
make properties conditional on the IP core version, so the validator
tools will pick this up.

	Andrew

