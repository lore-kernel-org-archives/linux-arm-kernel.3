Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112F2CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQbQe2gHs+3CDAyt3dtTz+9Qv5WQ9txPmDK/APQjSYM=; b=UTAdMCuYNF7OipZ8O9Xy4WodC7
	Iy/hGRd38UW/B8vTSG3c8rK84U2hSzEwks2IebfOes1OCr4sr2voAkf4l4rYz1S0ln9qUDb92ElcL
	xbwwjqddUiyrIkH0Htg8EqsfOfn0OUDFOGW/UairqmySHgQ0hL2BUast3WJQDV7z4Zd/XySU/VTEr
	h3zXDAvw2jDP8rYMWVBGZFHkH7Ilb+pC+arsYayWRElf3toBc070icaVs2aW9l+4ZhYr8/n6MOoc/
	CSbfnyKY4wLH8OpVWujLgljY+3x0CjVquuiVBC1sBD2nPIBYHXAOr5/crNlRVII5h3/Mk4LYraL7C
	i75eRM4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCc8-00000008I7r-3i10;
	Thu, 01 Oct 2026 08:58:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCc7-00000008I72-1MNG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:58:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A4B7E412F0;
	Thu,  1 Oct 2026 08:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7021F000FF;
	Thu,  1 Oct 2026 08:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790845082;
	bh=RQbQe2gHs+3CDAyt3dtTz+9Qv5WQ9txPmDK/APQjSYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VvHm2OKG7JNS2euP8edOAlfQSSi8d8RW4aTObqH6n4iGVRNmjkpKODwYJjoKATdMd
	 U2V874xaNaeEFttu0TRF4IAxLpKpSIh6frDq7EP26ION3fsoR4bkYB62Dn0yqsqg85
	 O6blGVh9RHIY0eS//Ieuk7SvoaIrjfmxPsSye+5k=
Date: Thu, 1 Oct 2026 10:57:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Fan Wu <12321260@zju.edu.cn>
Cc: Jiri Slaby <jirislaby@kernel.org>, Fan Wu <fanwu01@zju.edu.cn>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] serial: imx: cancel RS485 trigger hrtimers in shutdown
 and remove
Message-ID: <2026100149-constrict-frail-4f4e@gregkh>
References: <20260819021916.442827-1-fanwu01@zju.edu.cn>
 <46936686-3bdd-4d36-9124-e8d3376ad5ea@kernel.org>
 <C6A3233A-A352-45AC-A498-0DED1EC57147@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C6A3233A-A352-45AC-A498-0DED1EC57147@zju.edu.cn>
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

On Wed, Aug 19, 2026 at 02:39:45PM +0800, Fan Wu wrote:
> 
> > On Aug 19, 2026, at 12:26, Jiri Slaby <jirislaby@kernel.org> wrote:
> > 
> >> serial core does not call the
> >> driver shutdown on every path that reaches remove().
> > 
> > Could you be more specific on what path it does not?
> > 
> > thanks,
> > -- 
> > js
> > suse labs
> 
> Hi Jiri
> 
> Yes. The relevant path is a console port whose last TTY user closes it
> before the device is unbound.
> 
> tty_port_shutdown() skips port->ops->shutdown() for console ports. The
> last close then clears the active state and dissociates the TTY, so the
> later tty_port_tty_vhangup() in the remove path has no TTY to hang up
> and cannot invoke the driver shutdown.  That is the path the cancel in
> imx_uart_remove() covers.
> 
> trigger_stop_tx can already be pending at that point: after TXDC,
> imx_uart_stop_tx() starts it for delay_rts_after_send, whereas the close
> path only waits for TXDC.
> 
> I can add this to the changelog if you would prefer the rationale to be
> spelled out there.

Yes, please do so.

thanks,

greg k-h

