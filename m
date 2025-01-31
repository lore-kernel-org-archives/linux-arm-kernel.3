Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C626C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IuPlZa6y6J6gXS+P+dgZflnpDfa3pb9jp5g4ifalhAs=; b=JpUPmBFad4WpxWhIwkxaz0M9nz
	j9j6jkWUfD9DYYNcZVOWBditlKzmt1hbaHsisDDRpjua5tIWfX7vkDopljtRR6KvA6tlPw1ZgloiS
	jVuMn1A94ZOp6H0kJZMOuTCQt6INZR/ip4vHRRXLhX7T1cYGql29D1Wy0Z67zI9yulYxpMcGB0Ikj
	B+Emr4Nl47yvyOlLxRrMorYNximQMazCVgbIRin3H9GB7tjmhD8AYzbYaWit7IiIkSdZx6WgEKW9k
	DO7I6eCdEVzuctSJo2Ey3Ui59Vhem3ijAbWdhEu0KZNHwQ46r/oMtq8QEkh/4wq57VF2wL8zy1JSz
	Km7qLxgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtbY-0000000AvvC-1Cnk;
	Fri, 31 Jan 2025 16:10:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtY7-0000000AvNM-3IeG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 16:07:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IuPlZa6y6J6gXS+P+dgZflnpDfa3pb9jp5g4ifalhAs=; b=s3gWnpoKWyIy/LAY9j0YXccsrB
	nJop06eJ56UHTRDBbXnSKI9+n25Dc/THTlUb4KuDvFCAxRJc+GOCIkT3qNj3EGkZDi3vrgFS6taIw
	Iau7Spx5Sd3qnzRpzRTYl0rptVhktWP66qxNzP3ncc4awdmIM3QoKzilfZmkZ6m6KpWw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tdtXp-009jaZ-NK; Fri, 31 Jan 2025 17:07:01 +0100
Date: Fri, 31 Jan 2025 17:07:01 +0100
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
Message-ID: <80cc9950-9f62-4369-be87-c022d55a2b6f@lunn.ch>
References: <20250127013820.2941044-1-hayashi.kunihiko@socionext.com>
 <20250127013820.2941044-4-hayashi.kunihiko@socionext.com>
 <07af1102-0fa7-45ad-bcbc-aef0295ceb63@arm.com>
 <fc08926d-b9af-428f-8811-4bfe08acc5b7@lunn.ch>
 <f343c126-fed9-4209-a18d-61a4e604db2f@arm.com>
 <a4e31542-3534-4856-a90f-e47960ed0907@lunn.ch>
 <d6265f8e-51bc-4556-9ecb-bfb73f86260d@arm.com>
 <2ed9e7c7-e760-409e-a431-823bc3f21cb7@lunn.ch>
 <915713e1-b67f-4eae-82c6-8dceae8f97a7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <915713e1-b67f-4eae-82c6-8dceae8f97a7@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_080719_824492_304E000C 
X-CRM114-Status: GOOD (  26.25  )
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

On Fri, Jan 31, 2025 at 03:54:16PM +0000, Steven Price wrote:
> On 31/01/2025 15:29, Andrew Lunn wrote:
> > On Fri, Jan 31, 2025 at 03:03:11PM +0000, Steven Price wrote:
> >> On 31/01/2025 14:47, Andrew Lunn wrote:
> >>>>> I'm guessing, but in your setup, i assume the value is never written
> >>>>> to a register, hence 0 is O.K. e.g. dwmac1000_dma_operation_mode_rx(),
> >>>>> the fifosz value is used to determine if flow control can be used, but
> >>>>> is otherwise ignored.
> >>>>
> >>>> I haven't traced the code, but that fits my assumptions too.
> >>>
> >>> I could probably figure it out using code review, but do you know
> >>> which set of DMA operations your hardware uses? A quick look at
> >>> dwmac-rk.c i see:
> >>>
> >>>         /* If the stmmac is not already selected as gmac4,
> >>>          * then make sure we fallback to gmac.
> >>>          */
> >>>         if (!plat_dat->has_gmac4)
> >>>                 plat_dat->has_gmac = true;
> >>
> >> has_gmac4 is false on this board, so has_gmac will be set to true here.
> > 
> > Thanks. Looking in hwif.c, that means dwmac1000_dma_ops are used.
> > 
> > dwmac1000_dma_operation_mode_rx() just does a check:
> > 
> > 	if (rxfifosz < 4096) {
> > 		csr6 &= ~DMA_CONTROL_EFC;
> > 
> > but otherwise does not use the value.
> > 
> > dwmac1000_dma_operation_mode_tx() appears to completely ignore fifosz.
> > 
> > So i would say all zero is valid for has_gmac == true, but you might
> > gain flow control if a value was passed.
> > 
> > A quick look at dwmac100_dma_operation_mode_tx() suggests fifosz is
> > also ignored, and dwmac100_dma_operation_mode_rx() does not exist. So
> > all 0 is also valid for gmac == false, gmac4 == false, and xgmac ==
> > false.
> > 
> > dwmac4_dma_rx_chan_op_mode() does use the value to determine mtl_rx_op
> > which gets written to a register. So gmac4 == true looks to need
> > values. dwxgmac2_dma_rx_mode() is the same, so xgmac = true also need
> > valid values.
> > 
> > Could you cook up a fix based on this?
> 
> The below works for me, I haven't got the hardware to actually test the 
> gmac4/xgmac paths:

This looks sensible. Hopefully Kunihiko can test on more platforms.

	Andrew

