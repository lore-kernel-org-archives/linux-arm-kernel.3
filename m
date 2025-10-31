Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D73CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 16:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZ1we4raHwUnUtjU8hy3mle/N+CwqLuNQ45wdAbVLNk=; b=R7y1ifOdrpcOwGp9NU5l069EIp
	jzUYBctJVfGtK06m8iXaHh+b5q6MtauV/wcE4VVHPJgyBHvlRam55C6eiByAP/511DrPf7Sod6wvY
	0AZRMcHYmSSOZjNH4ySbw/cVXb/uQcgzOszcDI56bqF+muE508OIWJOtnoebQMi6w1ogUqkdCaDjt
	s6AS0l+uv+CdcX15OyM8G2rFxlG0LHIkXeIgJGVg13JR/m8KOzzmfEyzBpMkea6ZDxEG6fdWfeA3m
	zRHUxCuSib/IWYnUL7jRQxy1LSW+n/93+wf/+Yr82GU/kroCCrxTAtLH5j72HrWx0aMU8O/QlBJ28
	iBDvvTqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErnF-00000006ONb-2Naz;
	Fri, 31 Oct 2025 16:16:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErnC-00000006ONH-3Kyz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 16:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GZ1we4raHwUnUtjU8hy3mle/N+CwqLuNQ45wdAbVLNk=; b=TsoSUOoIsv2yrwHS7xiSEVNSNT
	t+XUvWmL0xM1TiQOM68kY9+J9+/wLYoM0yNKlGLkH4f1weu2Ab8t6SRmiGPOuGynt1dyumSuApiJy
	YsU3OctViL4sKkcM8DiJ+HkifHPSOW54uCpi35RnxH7Tb0P3IRkP3/r/dlHjP2K4uBsE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vErn4-00Cc4o-CP; Fri, 31 Oct 2025 17:15:50 +0100
Date: Fri, 31 Oct 2025 17:15:50 +0100
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
Subject: Re: [PATCH net-next 2/4] net: altera-tse: Read core revision before
 registering netdev
Message-ID: <b72e0572-6000-478a-b125-93f079944ace@lunn.ch>
References: <20251030102418.114518-1-maxime.chevallier@bootlin.com>
 <20251030102418.114518-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030102418.114518-3-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_091558_837348_9650698E 
X-CRM114-Status: UNSURE (   9.71  )
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

On Thu, Oct 30, 2025 at 11:24:15AM +0100, Maxime Chevallier wrote:
> The core revision is used in .ndo_open(), so we have to populate it
> before regstering the netdev.

All that open does is:

	if ((priv->revision < 0xd00) || (priv->revision > 0xe00))
		netdev_warn(dev, "TSE revision %x\n", priv->revision);

So i agree this does not need a Fixes: tag.

But i do wounder why this is in open. The revision has already been
printed once in probe. Are values < 0xd00 or > 0xe00 significant? Is
this left over code and some actions that were previously here are now
gone?

Maybe a better fix is to remove this, and make revision local in
probe?

      Andrew

