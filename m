Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8E9D3EE60
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 13:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnFAk7g/m7NTHo0WShHwxF9UDg2vS4hjkgx+k4Md7KA=; b=Lzkj6k4d4/sGvsUD/cHf2K1Tl/
	j3k+FG6l5yVuqlfWJpPuuHVDYQfVkFmuiw69zexodwMsj6HpWNntKwOkRzfKjNbpwbR1C5LVtpfXW
	8PYLog7q3NE4krEUdZO3CzAum+UkvJo9yNFquQsHvx65Ukb9x3HXKV2lb5g+AmN38XyPjgh2UNyif
	Eio+sICbQPX43Q+p1vrJS3wkWMhYtOKJAk/HuE5Shu9X+qRWtKr8+EzFslkb1BA4BRiL4Pe0G231y
	zRyezIoODDYhjf34QxskDrWHbmjVBRWrD7XWwCOohAEkDNdNynjDP/2l7szOpfM2UOPQNTHctE6iz
	I/bsi1TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuQo-000000076tG-0eTr;
	Thu, 22 Jan 2026 13:09:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuQm-000000076ss-1w2b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 13:09:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KnFAk7g/m7NTHo0WShHwxF9UDg2vS4hjkgx+k4Md7KA=; b=sxNERvfwImwq2hpz8UEHmzuuSA
	WyWsZgwK6IaUlaLtYMLsWGPSskeKeJRGVPjW2hWlhwJAS2ik5MOL7AjxVCVxOJsFCAYTgmgCSYmcn
	FEQoVCgOOqpyVR0ai1ZWVyWvecrcxwA9ZZ224mK+ImvY28wM0zYoQ1TH383oZ4mWCkDM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1viuQS-003yEj-RC; Thu, 22 Jan 2026 14:08:40 +0100
Date: Thu, 22 Jan 2026 14:08:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	hkallweit1@gmail.com, linux@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	maxime.chevallier@bootlin.com, francesco.dolcini@toradex.com,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH net-next v3 1/3] net: phy: add a new phy_device flag to
 keep preamble before sfd
Message-ID: <6e75eb92-e1b9-4d5c-8662-5674cc01f102@lunn.ch>
References: <20260120203905.23805-1-eichest@gmail.com>
 <20260120203905.23805-2-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120203905.23805-2-eichest@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_050900_516588_081FE4FD 
X-CRM114-Status: UNSURE (   9.15  )
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

On Tue, Jan 20, 2026 at 09:30:02PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Add a new flag, PHY_F_KEEP_PREAMBLE_BEFORE_SFD, to indicate that the PHY
> shall not remove the preamble before the SFD if it supports it. MACs
> that do not support receiving frames without a preamble can set this
> flag.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

