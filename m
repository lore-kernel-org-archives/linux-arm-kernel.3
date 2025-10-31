Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF5ACCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 16:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8x00BdGOX6ejpZ5GnXP3pUZyObW3nrJsk+6UQ17jcY=; b=1lvcOxrbml99DlB0EVO8vqNvjj
	lie5ZbkDSqhreonDYL+UiTZy/SPmjtt84ZR4QqPWsyVEw9kI7Ffby3KyMKbiZFunXvbmqfeLYkTIz
	jeVbzEbAURM6ln/auib8pE74Lhvy2Ounq6a22JOn1gLi+iKtm8D7Ba5j2biVOjz+z9kqu8vqd878k
	EPk+15akVp/t6DPWEos+Tq6K3JdfHucazErISIAO+XnKXBE048E1yp0Xu71U7WVmm4P4DkHxEHCxd
	ihw1nDKkqqneZ5Cz0cYKtmFY2EI5LehVzhJSuu53uLv0uHwiqpo3Empbyd65U6AOayYkplHDTPxNI
	otSP3oEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErqg-00000006Oma-1Udu;
	Fri, 31 Oct 2025 16:19:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErqd-00000006Oln-2w7w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 16:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=h8x00BdGOX6ejpZ5GnXP3pUZyObW3nrJsk+6UQ17jcY=; b=Sh2uVxHllkyCKnq3Vo3xPtsgQn
	pBE2/nBCVgPoZmVueMYMD54kiE7r4o/JXGvhClZkerKo39qO9REi1EeDtIyVRFr8R65zzN5TvzDZ2
	20vajedRanVt/fe6/uCsAQppnw6YAPuktdu6y6wUNvEMUDm/NDX1AjrRVrnjFprPxngs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vErqS-00Cc8U-Gi; Fri, 31 Oct 2025 17:19:20 +0100
Date: Fri, 31 Oct 2025 17:19:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 4/4] net: altera-tse: Init PCS and phylink
 before registering netdev
Message-ID: <c4e3dc1c-e730-4240-860b-426da10840c4@lunn.ch>
References: <20251030102418.114518-1-maxime.chevallier@bootlin.com>
 <20251030102418.114518-5-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030102418.114518-5-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_091931_739164_668B6CCE 
X-CRM114-Status: UNSURE (   9.28  )
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

On Thu, Oct 30, 2025 at 11:24:17AM +0100, Maxime Chevallier wrote:
> register_netdev() must be done only once all resources are ready, as
> they may be used in .ndo_open() immediately upon registration.
> 
> Move the lynx PCS and phylink initialisation before registerng the
> netdevice. We also remove the call to netif_carrier_off(), as phylink
> takes care of that.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

