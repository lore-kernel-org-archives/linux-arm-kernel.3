Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE959D63939
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwDPiYIBxwEmAaxai1DgMFwF8LB6iOUHjsbt/QR1yko=; b=e8N47nv/u3yKRnzpzCkwC6iNNY
	SVCOo5vb88oYiTa1af6glrtlEl4zprjYMNsf505snVRLkTAoYfui9aU3yLhj3aJ3YchXZb486D1uE
	35wm2pweUYspc2fun81GHzxNFxi2H3CyLAKHFAWGPFEai6Q/buqoRvuUPIwsWnGGtkseEPA5qMYmj
	vgFlBN2lmx0xiLYKI7RnLW2FTHkrZGY/4okgxFKPJDz3kjfCYuqtPMZl6ps3cCGEqNli3dAC6Su/k
	VoRCdjfee8CyFLf/515pUk77/nBBGjuZO8HcXekZaXiyRlTgajj8sHd5ekQ89fH26GxbqdcVFu/gZ
	6HCEOW4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDl1L-0000000FQlj-1UfS;
	Wed, 20 Nov 2024 13:45:27 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDl0P-0000000FQeZ-0czF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 13:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vwDPiYIBxwEmAaxai1DgMFwF8LB6iOUHjsbt/QR1yko=; b=dwQ/7DzWt63C6SmfRoK5OrKV1l
	jRvx7JKVfjETzd8RbU+63a98l6A5iM/YrQfGnE+V3inVGUYSkESBNpTPj2Ig8sYuN1yDBXsL9ck6L
	8ILcrrEBhA5M3tzqu6J9pbDVSrda9UiViBg6CDjvGe5SID+sFJDX2PtAzet4YPzlLJNw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tDkzw-00DxOS-NA; Wed, 20 Nov 2024 14:44:00 +0100
Date: Wed, 20 Nov 2024 14:44:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Jacky Chou <jacky_chou@aspeedtech.com>, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, joel@jms.id.au,
	f.fainelli@gmail.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: mdio: aspeed: Add dummy read for fire control
Message-ID: <b6155c5f-3012-42d1-90dc-8ef39d1eef2d@lunn.ch>
References: <20241119095141.1236414-1-jacky_chou@aspeedtech.com>
 <d28177c9152408d77840992f2b76efe3cb675b7a.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d28177c9152408d77840992f2b76efe3cb675b7a.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_054429_188328_3BC4227A 
X-CRM114-Status: GOOD (  18.92  )
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

On Wed, Nov 20, 2024 at 03:13:11PM +1030, Andrew Jeffery wrote:
> On Tue, 2024-11-19 at 17:51 +0800, Jacky Chou wrote:
> > When the command bus is sometimes busy, it may cause the command is
> > not
> > arrived to MDIO controller immediately. On software, the driver
> > issues a
> > write command to the command bus does not wait for command complete
> > and
> > it returned back to code immediately. But a read command will wait
> > for
> > the data back, once a read command was back indicates the previous
> > write
> > command had arrived to controller.
> > Add a dummy read to ensure triggering mdio controller before starting
> > polling the status of mdio controller to avoid polling unexpected
> > timeout.
> 
> Why use the explicit dummy read rather than adjust the poll interval or
> duration? I still don't think that's been adequately explained given
> the hardware-clear of the fire bit on completion, which is what we're
> polling for.

I'm guessing here, but if the hardware has not received the write, the
read could return an indication that the hardware is idle, and so the
poll exits immediately. The returned value of the first read need to
be ignored. It is simpler and more reliable to do that with an
explicit read, rather than try to play with the poll timing.

AS i said, a guess. We need a good commit message explaining the
reality of what is happening here.

	Andrew

