Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4654AC624CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 00:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drnZj9ls+Re3u3xWFMdJ9ITFaJJVUQr1ILP70Ur9h/g=; b=CRE6Y+rHmBYI0hFkms25bDBPZI
	FlWkjQcXuY/3nXzBSGSgHrFEZojr+BA7wva9jKeL9i+1/oinPjJMJUWMEBUZDW7J3wQhLTz356Pc9
	MwtXWunHt43rcdDXUD5L7isHessVnRPonBeRP7VoLyW7VVJU4Mmf8U4eV4320trgvGRZIYi7nhEC2
	atFa9RNCZ2Jt7WXUvc3uCFfqAhfHv3Qij8iZMv3M6Dw/op4e4WgB48hxDLCi22N+HTnDe6GNeCN/i
	xPASj+CUx/AXGFRV/G+7Qtex0tJ4NOrdqflft9Qr10An9B8c8nGN/HRRIezxXgaDhVDMR4hO+5xte
	IhWZPP8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1C6z-0000000AhhI-3ztq;
	Tue, 01 Sep 2026 00:12:25 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1C6x-0000000Ahgx-1Eqw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 00:12:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=drnZj9ls+Re3u3xWFMdJ9ITFaJJVUQr1ILP70Ur9h/g=; b=n5Lop7Hs9qzLRTh6aTMexZHCFM
	59wIXe05Amg7DeRdLCJpXJyIS2O+ud5/qQ60GugK50PpLZIDOWHXpazK0xx8Xo++m9JhzY02KEeDt
	xu3g9vlUwiH29QQ8JiTqsBfJUi5K56kVYs/RLCxS2m65LxMK5Sd1LcV1b43UTh9qU4OM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x1C6k-002H9w-SC; Tue, 01 Sep 2026 02:12:10 +0200
Date: Tue, 1 Sep 2026 02:12:10 +0200
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
Message-ID: <285c8969-2f0d-46de-b098-60ff10f30cf6@lunn.ch>
References: <20260831070121.349778-1-maxime.chevallier@bootlin.com>
 <20260831070121.349778-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831070121.349778-3-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_171223_331518_09E77480 
X-CRM114-Status: UNSURE (   8.35  )
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

On Mon, Aug 31, 2026 at 09:01:20AM +0200, Maxime Chevallier wrote:
> Contrary to dwmac1000 that gets its number of perfect filter entries
> through the 'snps,perfect-filter-entries' property, dwmac4 allows
> reading the filter size from the HW features registers.

Does dwmac4 take any notice of "snps,perfect-filter-entries"? Should
it be marked deprecated?

   Andrew

