Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD68DD3943C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 15:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SM6i6MA8OJw9GIG0x4N0vnw12U84U5ofreZbneDGJv4=; b=m9HTjlBRggHqSR4cHe5IAoTgF/
	hMcwEwtBM3ntvl1vmfJrirPM1ISyzlSrt2HCtQYFqkkAvDXLtEffj61IMOLUkeDA5A76sy2tiY7A/
	CRZDRhAksgbA26ThLWYsa2jQw/hGyHotmi0A9zosCHxHLiO2rVZ/bMED1FAWnGiLArvnHcIjucJCQ
	LGlJEbDm1VSLaNA0IiKlFRgILwQVNRQ8PcoehGtX3U/Iujf2ygoQgKtqzePYtbCUSN3DDOt44Fl9O
	CmXepdmpsDnpJEXLj+W0jf3OQklufTtWwCNPrforhc9dZprAgqeM0ugIvZ+A3d0l+XvPRDphY1bor
	iB4VuQsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JcA-00000000PwM-0wQV;
	Thu, 02 Apr 2026 15:05:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Jc8-00000000PwF-2oI9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 15:05:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D4FD260123;
	Thu,  2 Apr 2026 15:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72B7C116C6;
	Thu,  2 Apr 2026 15:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775142343;
	bh=gSAFR9rC7dy9fnHI/k/dHS0uzYk21DTMOi/OJa0SAnU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iPImZ54Np0bS3G8wDxGhad2s4/ykqZoX6fAi6qmNvH4eRBoEt/4AN2UyP8xSHmQut
	 5ACGxgOLi+2lwM01AOttcXv8gq3jBjprR8VVnOIalKrtUpCFaDXzNkwluqZq0Hkmb6
	 iUBBQdD0Nfpjfs/GdmUP7h+otB67qjNBEDo7O1OtD6HJFmB4RXuYIMolktMdAOwl2S
	 BoZwzR5+I2kcfF4PMVNGxpPktP8N9rh8gPSqj3U1fS9tth9r4pzsD1x5F9cnUx//yi
	 M0ymtfIDJtTEI/3Z1BydqxqGkwneoWXQjbx4V4wMJrptvhi1tQWdeklfVNrzeq+t/C
	 RCGCvCr4CiLsg==
Date: Thu, 2 Apr 2026 08:05:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Ovidiu Panait
 <ovidiu.panait.rb@renesas.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Baruch Siach <baruch@tkos.co.il>, Serge Semin <fancer.lancer@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4 0/2] stmmac crash/stall fixes when under memory
 pressure
Message-ID: <20260402080542.293e8729@kernel.org>
In-Reply-To: <20260401041929.12392-1-CFSworks@gmail.com>
References: <20260401041929.12392-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 31 Mar 2026 21:19:27 -0700 Sam Edwards wrote:
> - Changed patch 2 to tolerate dirty stragglers up to a critical threshold (the
>   same threshold tolerated by the zero-copy path), to avoid nuisance looping
>   during OOM conditions (thanks Jakub)

I meant we need both a threshold, and a delay :(

