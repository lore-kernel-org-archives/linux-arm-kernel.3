Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CBBC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 19:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNvaOf3GnEWey6NNYiKVhERhG3tq4Xl9EwpQofN1geU=; b=EgjkwdqYAVCo56zN5cT6pI1Ng9
	2myqglBqkX64lak7J3m4YxL6vTDAHptHk/sc8+z+LLXbHyuzkSqpG1QLalDYIR2VxrP3/qk5RbO1Q
	miyoahoybD4Hb3EMbPoRV9BFZdINAGPHQxTXQ1ToTZTQN0ZP5jCIIH50IGRB2V26KIM/kCK/75hZu
	FyijV3626urHwsI1pv8MTnqyQSYtfZpl9dM4DuKJ8MrCP3LXawvo7XThKEdy7QfNBdouA0pRzoYZ9
	0j6LUTGL8fz4E5aFphjnXxsNV3o5zl2TrrXr2PaNsef5xUX/RpIfITsHeCyLw+O6O12o6r6J64dzq
	eXHRAcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEsw-0000000GuzN-169b;
	Wed, 12 Aug 2026 19:45:10 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEst-0000000Guyj-2ClP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 19:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LNvaOf3GnEWey6NNYiKVhERhG3tq4Xl9EwpQofN1geU=; b=q7yHOjSLk6J/WZapVZjhwOZCcd
	Y7iqZLJ8hGSKcge2z9zvaTh/J9Y1fcAAHD/UUBLkAmOfHho5QpJ5hAhj5dOdxURtIkTyjX2UBq03P
	uPGTlJ6wUp1DA2A7h2cr5/oKNcB0v1LQ837Rc9qFMppjEMLYPXamqqzTEfOL7r/i1aG4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wuEsh-00HJte-CQ; Wed, 12 Aug 2026 21:44:55 +0200
Date: Wed, 12 Aug 2026 21:44:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: xilinx: axienet: Propagate errors from optional IRQ
 lookup
Message-ID: <017b2a0a-0092-4958-b554-45139db50cfd@lunn.ch>
References: <20260811034715.6034-1-phucduc.bui@gmail.com>
 <81a38486-d4d8-4ca2-8d22-d3d178c17665@lunn.ch>
 <CAABR9nF4q=eyUbzmo6-Co7NfVcg_bufHnffy8Ho4ZehHFZpqJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABR9nF4q=eyUbzmo6-Co7NfVcg_bufHnffy8Ho4ZehHFZpqJg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_124507_572892_20F8F079 
X-CRM114-Status: GOOD (  18.82  )
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

On Wed, Aug 12, 2026 at 01:14:38PM +0700, Bui Duc Phuc wrote:
> Hi Andrew,
> 
> Thank you for your review.
> 
> > > platform_get_irq_optional() returns a positive IRQ number on success or
> > > a negative error code on failure.
> ........
> > >       /* Check for Ethernet core IRQ (optional) */
> > > -     if (lp->eth_irq <= 0)
> > > +     if (lp->eth_irq < 0)
> > >               dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
> >
> > What has this change got to do with what is described in the commit
> > message? If you think this is a needed change, please put it in a
> > commit of its own, with a good commit message.
> >
> 
> lp->eth_irq is assigned from platform_get_irq_optional(), which returns a
> positive IRQ number on success or a negative error code on failure.
> Therefore, a value of 0 is not possible here, so changing <= 0  to  < 0
> is directly related to the error handling described in the commit message.

I think this is a separate change. You can then reference the
documentation, and its example:

https://elixir.bootlin.com/linux/v7.1.8/source/drivers/base/platform.c#L270

	Andrew

