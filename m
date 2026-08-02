Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FDDC55175
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 15:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdjigNFHWB3jQTq+4XuaBomV5UiBENOmHkaoKMGdJLU=; b=XWAfH+q8uWEWZMRtB2Sb8vEx7e
	H17CgHtO2QHWmW8smmV8wgi2gXGMJxrKsqPeyrgSzQ/VGkpgz/qxT4v8fhQaz5ThvC88VRRB7NIUX
	+1xRDZHl14WNGJgAERK/8FtwwjFBpsE9WBXlgwuV8ADMd5tHma4S68u9IpKEFoFVoMKiigAWjlDxg
	kkuOArwlyre31BxdtXBvnHaRAXWSeXSCUgK0cl9d4SW7W8rRmrr8vKqYv3J2oaSW38aFk2hUJoz0J
	K2dn2bwtYMF1+vbEXq6wwc4niaYkvUfsFXzf5xj+ERHiFrdxHImx69rigZqG6BiycRAmrluG46Psg
	a0ng3mSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXkc-0000000FmFE-044K;
	Sun, 02 Aug 2026 15:05:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXka-0000000FmEu-2AGB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 15:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tdjigNFHWB3jQTq+4XuaBomV5UiBENOmHkaoKMGdJLU=; b=BZf6BNRerzS5jRiKTVPr3hhSK1
	VKG760xjgNgyshECm1hKtq/DwNSUbmKYvPm2OCfmMujhz1HokK3HrErRBjC3HPuVR0D983gWdfb/i
	/4/xU8Culb0mXM4Gtlk/c4Cakbp5/ge6JyjQBAnDDYsfYytu5owyXwXAZtffSDY8fmso=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wqXkP-00FaM3-E2; Sun, 02 Aug 2026 17:05:05 +0200
Date: Sun, 2 Aug 2026 17:05:05 +0200
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
Subject: Re: [PATCH net-next 2/2] net: stmmac: ethtool: Address off-by-one
 when reading the coal rx-usecs
Message-ID: <4e76d7c1-0052-4689-be7c-9c31dc24516a@lunn.ch>
References: <20260802114015.214212-1-maxime.chevallier@bootlin.com>
 <20260802114015.214212-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802114015.214212-3-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_080516_574066_62EF9D20 
X-CRM114-Status: UNSURE (   7.66  )
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

> This does change the boundaries of accepted rx-usecs parameters, as the
> previously accepted values were in the 16-246 us range, and now fall
> into the 15-245 range on imx8mp.

With this change in place, what happens when trying to set 246?
EINVAL?

	Andrew

