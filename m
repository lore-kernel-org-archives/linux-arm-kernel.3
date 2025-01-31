Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF007C02190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 14:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNcchyzdUcu2AsYFFJOvHUFw3QqnezpZp7xNZQD6k90=; b=PKEOf5JGQa+eCfpXk7birbF1Bo
	nKRzuFzge1rZiKiBnUGhZPUw54bmMjUxT27N5nkFVW6rsxJobY/jCDHvWumfl5yovayBIY41ga6Id
	oBkOeng0pJ7TpQaRJtcYER4qqLyzMwNfxI/DcgP5H2/J+acbC6u6NwTyiFmqKKjWJg8bIbFM2WJuz
	HZDOKV0UnhxCMIXQWwOJA4o+CXZjgLzInhjr1kR9ZTtJS8l6k9GK1lQLtTdtY3gRQtdn6ExpuDuSY
	OOcASo681mkyRTW7lG2FwgU7edw9XrkYV39igFcyaXmVXlLYaFDff9So2VWTHQ8R0fHTkc+3/z48F
	PAky2pNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdsKl-0000000AnPd-1caD;
	Fri, 31 Jan 2025 14:49:27 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdsJR-0000000AnHJ-0hrN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 14:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=dNcchyzdUcu2AsYFFJOvHUFw3QqnezpZp7xNZQD6k90=; b=pcSCMT6zB7lvMPhHEpxqdc+cDu
	BeLdDoxtJ+n2KGZxTAZ/bm3dXrrYPDKT8hUV4j2kZ/7+Pz8N/aOL4i2OMTDDQ/Iep6arMz7bgYU+y
	OFlJxDxxd75mqk/6ZBdCMGrO4OItN6B3cWKt8n7wpux+zOj0RUZg5eflKBnBLXMn3IBg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tdsJ7-009ida-W3; Fri, 31 Jan 2025 15:47:45 +0100
Date: Fri, 31 Jan 2025 15:47:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Steven Price <steven.price@arm.com>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Yanteng Si <si.yanteng@linux.dev>, Furong Xu <0x1207@gmail.com>,
	Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4 3/3] net: stmmac: Specify hardware capability
 value when FIFO size isn't specified
Message-ID: <a4e31542-3534-4856-a90f-e47960ed0907@lunn.ch>
References: <20250127013820.2941044-1-hayashi.kunihiko@socionext.com>
 <20250127013820.2941044-4-hayashi.kunihiko@socionext.com>
 <07af1102-0fa7-45ad-bcbc-aef0295ceb63@arm.com>
 <fc08926d-b9af-428f-8811-4bfe08acc5b7@lunn.ch>
 <f343c126-fed9-4209-a18d-61a4e604db2f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f343c126-fed9-4209-a18d-61a4e604db2f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_064805_205890_73D15144 
X-CRM114-Status: GOOD (  12.51  )
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

> > I'm guessing, but in your setup, i assume the value is never written
> > to a register, hence 0 is O.K. e.g. dwmac1000_dma_operation_mode_rx(),
> > the fifosz value is used to determine if flow control can be used, but
> > is otherwise ignored.
> 
> I haven't traced the code, but that fits my assumptions too.

I could probably figure it out using code review, but do you know
which set of DMA operations your hardware uses? A quick look at
dwmac-rk.c i see:

        /* If the stmmac is not already selected as gmac4,
         * then make sure we fallback to gmac.
         */
        if (!plat_dat->has_gmac4)
                plat_dat->has_gmac = true;

Which suggests there are two variants of the RockChip MAC.

	Andrew

