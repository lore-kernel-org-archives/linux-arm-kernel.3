Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F89606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 13:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AxsWgkKZ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=CxrBhuig
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2ojm36jDUBb6pXJrubCoB6gVau8R+P1ZTa/JMKRiThE=; b=AxsWgkKZtP/qMgoui9BuNn8Gzg
	flm0zEPGendGOJ5zMFE0YkDgUU+RDBdNtyur1WVhQAJYd19Wdvlff8pwU5qBzcmAP2f5tzmKe5bu+
	ARcFWqY8swmzA5LPftnWzXLFaLuzJPEt7NqVCuwiMkhJvsneO1PgyW7sNHbZiThgkqw9/1Yc1qwk5
	OAiUr1AcIsOOTpbsSR+6RpWqS9dOYeslVCpp2xWzA5XNamQP0Va9TLlFPFGXIRMdIATIAByD5ZQON
	iV4JghUAU0pF2tsa8So8ewyzhnH4CmToxZ0GeoCziEOUmy0a9IiL4yQLuVS1ATNXPdbnOvYuKtpnx
	ygvCHaQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtGG-0000000EFAU-2W2J;
	Thu, 22 Oct 2026 13:55:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtGC-0000000EF99-1xul
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 13:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2ojm36jDUBb6pXJrubCoB6gVau8R+P1ZTa/JMKRiThE=; b=CxrBhuigoakpWN5Is0+/mnuMlH
	7kvWlQaUZz3J10DLYIY62uAy0UDsgHoBxPmyVdeiQfOB69wozYtoATCzfGr+fXCjXhDDZdMBcXeBK
	TnRlktYSQY0q6QnulyWq8f1vtaS9fInAIMV2u5lngm9VwdpTSQlsXSt13abfxEFN8ios=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xJtFu-00CGU8-KE; Thu, 22 Oct 2026 15:54:54 +0200
Date: Thu, 22 Oct 2026 15:54:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: Disable checksum insertion for XDP frame TX
Message-ID: <741319db-17fb-4768-8606-9105df6bf905@lunn.ch>
References: <20260929121025.20821-1-jszhang@kernel.org>
 <f0d8c25f-96e1-4da8-af6c-3286610338ba@lunn.ch>
 <atn0mF-dukVTK6Lh@xhacker>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atn0mF-dukVTK6Lh@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_065512_697364_9004ABC9 
X-CRM114-Status: GOOD (  21.78  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 07:33:44PM +0800, Jisheng Zhang wrote:
> On Tue, Sep 29, 2026 at 10:29:14PM +0200, Andrew Lunn wrote:
> > On Tue, Sep 29, 2026 at 08:10:25PM +0800, Jisheng Zhang wrote:
> > > stmmac enables TX checksum insertion for XDP frames whenever the queue
> > > supports it. XDP frames carry no TX checksum offload request, so this
> > > can overwrite a checksum already present in the packet.
> > > 
> > > Pass false to stmmac_prepare_tx_desc() when transmitting an XDP frame
> > > so that the packet is sent with its checksum fields unchanged.
> > 
> > This seems odd to me.
> > 
> > If the frame contains a checksum, it is either correct, and the
> > hardware calculated one will come out the same, not an issue.  Or the
> > checksum in the frame is actually wrong, because the frame has got
> > mangled by eBPF before sending it out, and you want the hardware to
> > calculate the correct value.
> > 
> > What an i missing?
> > 
> Hi Andrew and all,
> 
> some discussions happened in below thread
> https://lore.kernel.org/netdev/athAoWfW-xesPhFP@xhacker/
> 
> Since it has been merged. Let's move the discussion back to my patch.
> 
> AIUI, dwmac can only do HW checksum for normal particular packets
> layouts, such as TCP, UDP etc. The stmmac_has_ip_ethertype() has
> well demostrated this limitation.
> Different with normal tx where the common stack supplies the skb->ip_summed
> metadata, XDP path doesn't have the necessary metadata. So to make
> the XDP always work properly when transmiting tranmist arbitrary Eth
> frames, dwmac HW csum needs to be disabled by default currently.

I don't know the XDP code. But...

Zoom out, look at the big picture:

What do other MAC drivers does? Do they also disable hardware checksum
when XDP is enabled on a queue?

Should XDP actually have the needed meta data? Can it be added in a
low overhead way? Does the overhead of having it cost less than
forcing software check sums?

	Andrew

