Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C29CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 18:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Imtfjv6ozCla3tj9/fUxCprWInsmyrRWdm7p+iTQCJM=; b=LJJjVTCsEbcc6GS+9S2e180BFO
	UidUImwOCt21gV48a07ZsJ4dlGBchyY2rdST9tjXVqfcgcyEaRP7mM+HBzm7HU1NbUmdcbbTM1q+A
	MtOB9HdFaHp5rbPh7J/10Te6X7q/NzjCbMP8KT3pejSVPE3gqlz6WsKP9YMTwC0Umvuu+pIPoBW+I
	PxmA37hSI7oSWqFqyYjrW1RIgI3He7MdgvdxQ07UZ1o1Y9zVGqAEI53ABzm9vcRqVC2p6S+dTpSHr
	b2UT3s+GZuFfMZ77RtcN/bWIWhcYsC02xcHcOXN3Ke0AWJ0nCMF0Vqh83gkxEFObzVLsl50SbUiMl
	vgd0QV0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0PD-00000007Hw1-0LgS;
	Thu, 23 Oct 2025 18:51:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0PB-00000007HvY-1UEH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 18:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Imtfjv6ozCla3tj9/fUxCprWInsmyrRWdm7p+iTQCJM=; b=Rkgdo2VDnLOjAM2bDoHEHWB9tE
	HV8sUUkJWdRtqbfCVppMU+Qd54DAvpYVvruENW50iU//X1ta+VLO1m0tEnVd4PktHg5CjrkRW7ajA
	I1tzmecJ8P+PSPO12J3U1rCksafXzsYwQaBfo8z+UDdByPdjxUM4lrme4VttNurlykRJPPf9QieN0
	Ir2jS4RdZbD6i6nbXzz6OBYWXXSBcrYZED1aNniLjEAQnD/D34BFNBCY9zxV6uo2vqftE6cvDlEVR
	GbXmUoU0d4nsaBhZQ1OhtYNlFNVmpg0aw/c6uGspBEa9EXu/xvTjCLGr1rNKxKWZc9khZ8XVOtFQK
	bCt4tE3g==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzXT-00000001d2n-2hHB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 17:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Imtfjv6ozCla3tj9/fUxCprWInsmyrRWdm7p+iTQCJM=; b=288TDzpZCmhUsvHKFbzcxMQzHi
	21uxLNDcy74IOZKNdBIeNEUAyu+w5x6c+BbenRa5FxjwzbKkOapZtKd8NHXYnPuArSgyc9dWG3bpu
	+StLVPnRipEpM7m1R+8Xs4DjcQkGssoTivGPI5AqVT/Ac+ZePW6yvxbdSyJbCkKZJpFQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vC0P3-00Bud4-6k; Thu, 23 Oct 2025 20:51:13 +0200
Date: Thu, 23 Oct 2025 20:51:13 +0200
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
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next 6/8] net: stmmac: provide function to lookup hwif
Message-ID: <13c82898-eaee-4210-998c-e73efadcd31a@lunn.ch>
References: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
 <E1vBrlV-0000000BMQG-3WuD@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vBrlV-0000000BMQG-3WuD@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_185551_836126_36F5ED9B 
X-CRM114-Status: UNSURE (   6.32  )
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

On Thu, Oct 23, 2025 at 10:37:49AM +0100, Russell King (Oracle) wrote:
> Provide a function to lookup the hwif entry given the core type,
> Synopsys version, and device ID (used for XGMAC cores).
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

