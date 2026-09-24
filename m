Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6274C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJsB05AjJ/cKcal0omGmz6Mh1wn0N/L2T5+QooWmyb0=; b=bBxARlizPXevUcN+FXOXEjCu/N
	ZKn43epx9q9xaeMEYB2bi3dfXFiUucOi7F0X35ySg/I12uWApkWoAfMviInkPAUnO1ySCDWbSEMNX
	MmTe4Cc9JKYUh/cG0HCpU+iXlDfGHq5ICjTxzYS8elsFOGntFXOoUgfdZ/pa+kXzHYVWsy7DfWJLb
	1du0dFxtc/uxIAE92yVcgh9yvArh0kUGHdlelkVIivKYegw2+bZPEduVzfHhLjDnbzYNi5ERFJzwR
	87VWaEqTfiQORDgJgpuEwSfcjtc3Rg4j4BxE2SIceCTLHMVjNQD+TLTx3lcM3MkP+EHk+LHOG1l0g
	JWwaFeyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lQH-0000000BR6p-010h;
	Thu, 24 Sep 2026 15:31:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lQG-0000000BR6U-0Bdt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 15:31:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A270642434;
	Thu, 24 Sep 2026 15:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7EDD1F000FF;
	Thu, 24 Sep 2026 15:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790263903;
	bh=PJsB05AjJ/cKcal0omGmz6Mh1wn0N/L2T5+QooWmyb0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZUdAey/4b08tNkuWELhF4djU3Q1gl2NJ9Pk605r1+X3SP3UzgUuFUTljQJO6CEzU5
	 yf7/ZDeCQlr7f73tv75PoXb+6Oobp5DHq/ImoI9jQld86L8uluSygbDYNbafFbG5bW
	 y6buKYc+UYNyiGGKMF4easgOkNBD06aon1x39CLu0MRfOxLD4cQBq9quICXHptWIWd
	 wdUfdDVzbo3LZsgToPtaJd7ek1udGry7+xdyOjkI+AaUfC32/3NXZvW32VIs8ieo4c
	 cfGPqsfBphjnP1/yJHZqh3h1QExX8R+DmbHKtxXi4bnaDI6/eMRI8Q7PoJUMxI6HHU
	 FCmPHzliQ80pw==
Date: Thu, 24 Sep 2026 08:31:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Daniel Machon <daniel.machon@microchip.com>,
 netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horatiu.vultur@microchip.com,
 steen.hegelund@microchip.com, UNGLinuxDriver@microchip.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, herve.codina@bootlin.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, mohsin.bashr@gmail.com,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v7 10/14] net: lan966x: add PCIe FDMA support
Message-ID: <20260924083141.67eecb6e@kernel.org>
In-Reply-To: <20260924064617.GY13925@horms.kernel.org>
References: <20260918-lan966x-pci-fdma-v7-10-0ecc179c8a2c@microchip.com>
	<179008205148.2160803.12818321368571406375@kernel.org>
	<20260923084538.wgkw2nt5ergoxcot@DEN-DL-M70577>
	<20260923180730.GV13925@horms.kernel.org>
	<20260923201155.lbbbtx22adz2ilhg@DEN-DL-M70577.microsemi.net>
	<20260924064617.GY13925@horms.kernel.org>
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

On Thu, 24 Sep 2026 07:46:17 +0100 Simon Horman wrote:
> > I am a little reluctant, when I cant really test it properly. Sashiko gives
> > another solution - adding a LE dependency to the Kconfig of the misc PCI driver,
> > maybe that'll do?  
> 
> I think that should be a last resort. I won't hold out on this,
> but I would prefer the approach I suggested.

+1

