Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46B2C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1m1NFZV8Q6RkXAfcNO6sJC9PIZku3p2KtNeqepoHJ0=; b=TsiMBeAZ7yk1NdY+NL7NA0ph15
	PJFnZcp7IFlJ7FfgPp8siHKNEwTwuM4VP+iY/vfC0/YCa8/9ueRCjp0HxlcK/QxLGNfoXYqugmlQm
	N21T4Ur0b2TY9UK8UvbuBxcRM2vn2AbbkqvpJfHSQ2WMx+pf7qwBdh/kAIEff88MfAlYNYM6uY+sF
	gERd1ocV1MZmoc8vLci/TOOKrPHCXCbZHgFRG0gGDxIYleEem9UXsEPfdzsG3CxOs4Pf2BOtBUcKd
	rBfEPD4IFnV9qby14rh0UXMxz+aatrm2NmlFtTvven9rj71pYuFXPuHVkzZ7t4oVeVyZ8uS/+vfXE
	43umhyOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IpT-00000007dfC-22uc;
	Wed, 23 Sep 2026 08:59:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IpR-00000007deh-3Fjl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:59:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8533043508;
	Wed, 23 Sep 2026 08:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D081F000FF;
	Wed, 23 Sep 2026 08:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790153989;
	bh=w1m1NFZV8Q6RkXAfcNO6sJC9PIZku3p2KtNeqepoHJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OjFIRYRKDDlKIr3AK+V41zIsPpmYTNPmtHkLw/tBWf1NXG0cvID6+8RkgQU+X+NHR
	 Kk3LXoX6iD9VLpTczeOhh42F/BWpwOjYR6pRPahxLp5tGut+zmIZKTbqS6x/Riy3N5
	 4w+D/FQorat3zPOgh75Fzt34GXaCbsuweLUyo3gbtp3gbvcV5YbAH1dQO1hngPCqXD
	 /rCSfwuuAs6uvnzVFaGgFjsfom0RuFnSBAYbTQ7AIs0jDaFfZxkNSTl45Rxth/WnuY
	 LsZxKGzTESvKffs2s12VssCMN/IuNvlMjOQD2s7j50MbW2R9oEPDeuVv/XTBq874Ay
	 mk72nb2qFGnmg==
Date: Wed, 23 Sep 2026 09:59:43 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	UNGLinuxDriver@microchip.com, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Herve Codina <herve.codina@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v7 06/14] net: lan966x: use a dedicated device
 for DMA operations
Message-ID: <20260923085807.GO13925@horms.kernel.org>
References: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
 <20260918-lan966x-pci-fdma-v7-6-0ecc179c8a2c@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-lan966x-pci-fdma-v7-6-0ecc179c8a2c@microchip.com>
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

On Fri, Sep 18, 2026 at 01:33:58PM +0200, Daniel Machon wrote:
> In preparation for the PCIe FDMA implementation, add lan966x->dma_dev,
> resolved once at probe time, and use it for every DMA operation the
> FDMA path performs: coherent allocations, streaming mappings and the RX
> page pool. Natively, dma_dev is lan966x->dev, so there is no functional
> change.
> 
> Since dma_dev differs from dev only on the PCIe path, add
> lan966x_is_pci() on top of it, for the later PCIe patches to key off.
> 
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Simon Horman <horms@kernel.org>


