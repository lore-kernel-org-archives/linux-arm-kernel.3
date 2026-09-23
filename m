Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C017AC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRi3C+epsIdutFBlhwS+gFpit1TLgJroCohgwHrl8Ns=; b=k90mm+S8ijWE2buHBYaZX4zyj6
	+JBK2PEgId8urKxg1ARodmqMTiVy7/796v5fzJBCOMGK9ug2OMx+qMIVxltUNFBAZY0PIIKuaFO5c
	BGTRiXxjui6R+fjBjHf4WTXy36stBEREm9cdg4wb38yUnK1YbVtUpgvSadqOS+KfZof8R03CEXEp1
	nkderno9U7tB6x6tBzGXwcaooDhnS0mMfCKbaC/Ox9vczxjfGvDswcU8topO+9pzI4AsSnX5itJEE
	QsjH2ykGuiZgfp2sR3BgGMbEocRCr4bEe+o09FWRmqaO7XkgYp18PaGde0kYnam2/akLFAvaIIQMa
	h2Kjt1lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MVF-00000008JQ6-1nIu;
	Wed, 23 Sep 2026 12:55:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MVE-00000008JPt-1vhl;
	Wed, 23 Sep 2026 12:55:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 41F1F6020A;
	Wed, 23 Sep 2026 12:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2801F000FF;
	Wed, 23 Sep 2026 12:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790168110;
	bh=FRi3C+epsIdutFBlhwS+gFpit1TLgJroCohgwHrl8Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZYcrNT7P0hjDlcFWhTnT6+Mxr6YY6Iiktuhuedn/b37B8n+/jnAQd7UEma7I6Gkz/
	 hgCoughMEp760bK5dumjUrd8WmsOyZaShg4e4uSPR1v18S6XRaCA1wF4LW+XcQ/ar/
	 jRVTbV5/bnhbKBwk61V2FmWW2pvfHaEU6V9Psd74=
Date: Wed, 23 Sep 2026 14:55:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Cc: jirislaby@kernel.org, florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, phil@raspberrypi.com, stefan@agner.ch,
	bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] serial: 8250_bcm2835aux: Add support for RTS/CTS
 auto flow control
Message-ID: <2026092346-snap-kosher-b487@gregkh>
References: <cover.1786030659.git.sairon@sairon.cz>
 <7e5ed3fb37ee4e113706c258d792121b868861a9.1786030659.git.sairon@sairon.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e5ed3fb37ee4e113706c258d792121b868861a9.1786030659.git.sairon@sairon.cz>
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

On Thu, Aug 06, 2026 at 05:42:04PM +0200, Jan Čermák wrote:
> The bcm2835aux mini UART can automatically de-assert RTS based on the RX
> FIFO fill level and gate the transmitter on CTS, but the driver never
> made use of it. Wire it up:
> 
> - Enable AUTORTS/AUTOCTS (with the RTS4 threshold and inverted, i.e.
>   conventional active-low, polarity) whenever CRTSCTS is set on ports
>   declaring the "uart-has-rtscts" property, advertised via
>   UPF_HARD_FLOW.
> 
> - Gate the AUTORTS function on TIOCM_RTS in set_mctrl() so that
>   clearing RTS (port close, TIOCMBIC, B0) actually de-asserts the pin
>   while auto flow control is active.
> 
> - Implement throttle()/unthrottle() by disabling the RX interrupts and
>   letting the FIFO fill up, making the hardware de-assert RTS - the
>   same approach as in 8250_omap. Re-sync this state on termios and
>   rs485 changes, as those paths may re-enable the RX interrupts (or
>   leave them disabled) behind the throttle's back.
> 
> - Never enable auto flow control together with rs485, which uses RTS
>   as the transceiver direction control. As the software CTS fallback
>   of the serial core cannot work without a modem status interrupt,
>   strip CRTSCTS whenever it cannot be handled in hardware.
> 
> - Restore RXEN when rs485 is disabled, as the emulation may be torn
>   down without the rs485_stop_tx() callback ever being called, which
>   would leave the receiver disabled.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Jan Čermák <sairon@sairon.cz>
> ---
>  drivers/tty/serial/8250/8250_bcm2835aux.c | 160 +++++++++++++++++++++-
>  1 file changed, 156 insertions(+), 4 deletions(-)

There are some bot review comments on this:
	https://sashiko.dev/#/patchset/7e5ed3fb37ee4e113706c258d792121b868861a9.1786030659.git.sairon@sairon.cz

Can you address them and submit a new version?

thanks,

greg k-h

