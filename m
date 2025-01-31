Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5C7C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KGuy4EAuLHG4r0AND1uGQsHYqV6ULruAexpzmPJXj0=; b=aHeDwMO0vUe8f94f0EnjqIKteg
	anG6eUuBazUF0jABwgSgYoxOAmduPE0TFhUg7CStx/KBkj1MrjQQc/h6YEwTt+JamvvPl6vTbt1Nd
	3TGV5VGJu2u51xhJsWHX1HmaS3DSiKYtmQ59JCk3DW9aGbKAkMLF02wcK8Jc25LyaIqQYuZz6v1yB
	L79TEXCxHqXQn6j2HS1YuldsrZpVdysb7O15k2WsNMMyjfgacqyUsdkNtAofk2i1/6wetFsjkZgde
	QK3+i0qYHxOKQim9ehMQmnqmNt+nkFub65sJiQYH7WftrePKy/8kZ7WJY2o2BZEeYxcijJ1LNlBTc
	agelz5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrpf-0000000AksW-19Ct;
	Fri, 31 Jan 2025 14:17:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdroL-0000000Akl3-1ap3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 14:15:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6KGuy4EAuLHG4r0AND1uGQsHYqV6ULruAexpzmPJXj0=; b=cs/OOv4teDCakZI2PNJHMNZY5F
	CSThPpDFV0qXz+D/8t74/eKu7sLH3JHb0lWt9GptCZKYkRblomsN3tBxQ2ezCc7QZ8ITuLvBv2ELB
	Rl39HYkp2SOoBPdTfUr2haWDYhJDyPZfL0rzyIh88Kt3Jxl4qc24UOTI6XJ+lkFB5moQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tdrnz-009iDb-1e; Fri, 31 Jan 2025 15:15:35 +0100
Date: Fri, 31 Jan 2025 15:15:35 +0100
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
Message-ID: <fc08926d-b9af-428f-8811-4bfe08acc5b7@lunn.ch>
References: <20250127013820.2941044-1-hayashi.kunihiko@socionext.com>
 <20250127013820.2941044-4-hayashi.kunihiko@socionext.com>
 <07af1102-0fa7-45ad-bcbc-aef0295ceb63@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07af1102-0fa7-45ad-bcbc-aef0295ceb63@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_061557_421399_2504D59C 
X-CRM114-Status: GOOD (  23.27  )
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

On Fri, Jan 31, 2025 at 09:46:41AM +0000, Steven Price wrote:
> On 27/01/2025 01:38, Kunihiko Hayashi wrote:
> > When Tx/Rx FIFO size is not specified in advance, the driver checks if
> > the value is zero and sets the hardware capability value in functions
> > where that value is used.
> > 
> > Consolidate the check and settings into function stmmac_hw_init() and
> > remove redundant other statements.
> > 
> > If FIFO size is zero and the hardware capability also doesn't have upper
> > limit values, return with an error message.
> 
> This patch breaks my Firefly RK3288 board. It appears that all of the 
> following are true:
> 
>  * priv->plat->rx_fifo_size == 0
>  * priv->dma_cap.rx_fifo_size == 0
>  * priv->plat->tx_fifo_size == 0
>  * priv->dma_cap.tx_fifo_size == 0
> 
> Simply removing the "return -ENODEV" lines gets this platform working 
> again (and AFAICT matches the behaviour before this patch was applied).
> I'm not sure whether this points to another bug causing these to 
> all be zero or if this is just an oversight. The below patch gets my 
> board working:

Thanks for the quick report of the problem.

Your 'fix' basically just reverts the patch. Let first try to
understand what is going on, and fix the patch. We can do a revert
later if we cannot find a better solution.

I'm guessing, but in your setup, i assume the value is never written
to a register, hence 0 is O.K. e.g. dwmac1000_dma_operation_mode_rx(),
the fifosz value is used to determine if flow control can be used, but
is otherwise ignored.

We should determine which versions of stmmac actually need values, and
limit the test to those versions.

	Andrew

