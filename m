Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890B6C624CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 00:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWzcDxcK5KHl/AoklH17Lv+StaJJHsmm0a/OqQGdPUY=; b=EBnvkFM7xFM8jekZLNRCrb3jZL
	rba0oeo5RqoyeZg4gBN/J6OX0e1MgglATz9q6knqZx3Nnyi7TtnEkb9YbsB1ap7ABTQ6432treG3v
	aZRjIstqbmXZK14ffkVDozCyJ1Q8eMqhXjmgXCPYc2lnooNUUk1Ia2SVkU5zcpBfdPy+HfMY0n+X2
	ADCpugkBQQv4N7G7auIVVFBp2j186c0ozkaEE+Stjzrl/iIDxxLCQwXUzqhOHaqkQ1Grmbo3mfMHE
	lzakESaXHAusfU4kYvyYNKwOW2ez61k5Q8WMhahXyfguAUL1e+QiPoYQtc6qvDYX8+bT2RapnOuUR
	wDEf9aZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1CKq-0000000AisL-1Fye;
	Tue, 01 Sep 2026 00:26:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1CKm-0000000Air2-1uIz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 00:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=sWzcDxcK5KHl/AoklH17Lv+StaJJHsmm0a/OqQGdPUY=; b=d1x5Uc3VR4Yn9rjdeQJ21p1Jg1
	SPogErl/w5tumNkDDhGyYmcDUMTe882WPRTkK3hIMoT0ZQy28FRpsfzNJcWyI6QyZi5d+BlnkmZ2V
	S09btPQQjLmxqQPADojha0SaNYzIbrhospnJOIhvOKtQaE9fkhRZdPA3IrXfojx6ngOw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x1CKY-002HFd-O9; Tue, 01 Sep 2026 02:26:26 +0200
Date: Tue, 1 Sep 2026 02:26:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Nicolai Buchwitz <nb@tipi-net.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, thomas.petazzoni@bootlin.com,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 1/2] net: stmmac: dwmac4: Read the UC filter
 size from hardware capabilities
Message-ID: <b2fbcec7-90ee-4a6f-bd15-32e4e1ff1a47@lunn.ch>
References: <20260831070121.349778-1-maxime.chevallier@bootlin.com>
 <20260831070121.349778-2-maxime.chevallier@bootlin.com>
 <2631c832d5aebc56e152628132494545@tipi-net.de>
 <480f15e2-e045-46b7-89af-1fbcefd3c4eb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <480f15e2-e045-46b7-89af-1fbcefd3c4eb@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_172640_500832_C85A106A 
X-CRM114-Status: GOOD (  13.15  )
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

> Yeah but dwmac4 has a hash filter, but same as the UC filter it's just not plumbed
> in :/
> 
> Let's leave this flag here, hash filter addition for MC filtering is coming-up, so let's not
> drop it now only to re-enable it after, one of the other wonderful discoveries found by
> running the selftests...

I assume you can put a MC address in a perfect match filter? You can
perfectly match a multicast address just as well as a unicast address.

The hash filter is less accurate, but again can be used to match a
unicast or multicast address, and then you need additional filtering
in software, which Linux will do.

So it seems to me, you should use a perfect match filters if you have
one available, independent of unicast or multicast, and only use a
hash filter if you have run out of perfect match filters.

A IPv6 interface will be listening on a multicast address for
Neighbour discovery. It would be good to do a perfect match on it...

	  Andrew


