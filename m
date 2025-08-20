Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BA3CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 18:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2pnpv/x6HgDwwvGelhYgFMGW5o9ZkV6MCT+TQ/21fY0=; b=i3OjlBczzSaSqU
	Rkg4sjSfygTYxJKQ8nAhnhPxPqH2RtWavmYOXThjhyFhhpqxh++i1Lm/MDNktscDn3m9g/qAsZ3LT
	G4N7Zzz0pFRhu2BIm6RozBgucPLQN5PWn7LH0Uihim88o5STWOSOMUE8t6W65TbOgDpTWB+hcGMQO
	XdYtNElbJ12qLZv+pII8q6l/+5Ffu31+8QHMdenHKwUZl0O0VS22/0c3X4HXqnUBXmjB74JfjAsKJ
	N64UBuOvYNvReoIgDHFA7K/IOHA8eXt1XnLvBh44uDvAjd3o7GIpuUBaxCuXnugYlCouDQGAUEWwG
	xO+yFwdqkpAucasW3BgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonvG-0000000EiNM-0TB3;
	Wed, 20 Aug 2025 18:52:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokZA-0000000EDyl-2qIH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:17:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 12F6D5C3646;
	Wed, 20 Aug 2025 15:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314CBC4CEE7;
	Wed, 20 Aug 2025 15:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755703040;
	bh=3xBUF+BWwJM7qSsKwpiul03BoYr/LpWrwpzsBn6ACwA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VH1PwNQGT00FXG2CXvfg2tHTLwPZXUcMLOvrJZ235B2QpffjjZCe14A/xHRMZP2eQ
	 BlwCBH4RbBCnPPlSJHkE5hlIB+sEYnJWPZaNnqptlC4KaGgvu3Pe1rd0vwX3oH2wbf
	 E3KqOtxcCspCqh/k18uMbkQa9JHyqSa8I00UQFgCZ+qoNllYA4pmC3LLwtv46cdLZH
	 UoNiESFusfexcC18UrOUYeplng2tnbkhJ7peQNu0bcw8hNY8qSS+oW/4Ckmt/1BUXx
	 WkYJXRDZ8erBsmxrwGTOGSfQPW8ClaoliCH883+r1ibbChjMfD/9rxbuKM+8yaa3mf
	 cjzYlLvglvz8w==
Date: Wed, 20 Aug 2025 08:17:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v13 4/5] net: ti: prueth: Adds link detection,
 RX and TX support.
Message-ID: <20250820081713.2d243c55@kernel.org>
In-Reply-To: <1714979234.207867.1755695297667.JavaMail.zimbra@couthit.local>
References: <20250812110723.4116929-1-parvathi@couthit.com>
	<20250812133534.4119053-5-parvathi@couthit.com>
	<20250815115956.0f36ae06@kernel.org>
	<1969814282.190581.1755522577590.JavaMail.zimbra@couthit.local>
	<20250818084020.378678a7@kernel.org>
	<1714979234.207867.1755695297667.JavaMail.zimbra@couthit.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_081732_763252_FEFD29BD 
X-CRM114-Status: GOOD (  12.86  )
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
Cc: pratheesh <pratheesh@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, Bastien Curutchet <bastien.curutchet@bootlin.com>, mohan <mohan@couthit.com>, jacob e keller <jacob.e.keller@intel.com>, pabeni <pabeni@redhat.com>, s hauer <s.hauer@pengutronix.de>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, ALOK TIWARI <alok.a.tiwari@oracle.com>, richardcochran <richardcochran@gmail.com>, johan <johan@kernel.org>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, kory maincent <kory.maincent@bootlin.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, 20 Aug 2025 18:38:17 +0530 (IST) Parvathi Pudi wrote:
> > On Mon, 18 Aug 2025 18:39:37 +0530 (IST) Parvathi Pudi wrote:  
> >> +       if (num_rx_packets < budget && napi_complete_done(napi, num_rx_packets))
> >>                 enable_irq(emac->rx_irq);
> >> -       }
> >>  
> >>         return num_rx_packets;
> >>  }
> >> 
> >> We will address this in the next version.  
> > 
> > Ideally:
> > 
> >	if (num_rx < budget && napi_complete_done()) {
> >		enable_irq();
> >		return num_rx;
> >	}
> > 
> > 	return budget;  
> 
> However, if num_rx < budget and if napi_complete_done() is false, then
> instead of returning the num_rx the above code will return budget.
> 
> So, unless I am missing something, the previous logic seems correct to me.
> Please let me know otherwise.

IIRC either way is fine, as long as num_rx doesn't go over budget.

