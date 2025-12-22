Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F582D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 06:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DGa0h22svvOFG0Dmzt8jnQVi7nw4WV6ektVItckcbQ=; b=tNKP2E6KnDfaMVLXeLp43bS2dI
	eXdVy1mUuUfBnWLZHqYHtpIbQAINN/6tkovn0uxCKwl2DD77y31DBzsSp4ryiEJOGmX603KSE8YXh
	wRByJEirb9NuwDeJVSwH3aeLAkYkbWNzxErtAzfylS6ODsPFr94p2KfrhILWdJeILJzGsgobCM1lZ
	+nObTf9d5niEbkRZaTEual8FN3Eoi7l+pOlK8aE7u7vwiSC7+SBDapDEGS2HBDhloCGHjOpZuhvF6
	Dzi8Z2u4el7XBWzUEoMhh/jv4HpxRc9rIrYwvjd59yLFA4b+4WkRjOe+soJb1dHzFf+N1DO3EkEYp
	2df2NfXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZJF-0000000DHxg-2CBy;
	Mon, 22 Dec 2025 06:22:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZJD-0000000DHx0-0IDD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 06:22:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5E9F437FE;
	Mon, 22 Dec 2025 06:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E27C4CEF1;
	Mon, 22 Dec 2025 06:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766384537;
	bh=tcPJ9xF3IDrVxvtAxhyKUbQpSiO2G2lCeKR+IxIsgfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VwRavLEXhiWipBRxzCkRLRPj6eT4dJTEs+4jsH5NxWwVa6EHAvWWnVgnu0CU+SGIv
	 rxcZp8NOfGhfx36CVjLCA+MJJ6cLQW0BVGqDPY3SDTGrcW1Nfa0ZbZ5CvEjwUEasN1
	 1VnDcgtdunSMeuDfueoHR/VokNFnu+zsypsqXelM=
Date: Mon, 22 Dec 2025 07:22:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Junrui Luo <moonafterrain@outlook.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, Baruch Siach <baruch@tkos.co.il>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Yuhao Jiang <danisjiang@gmail.com>
Subject: Re: [PATCH] serial: digicolor: fix use-after-free on driver unbind
Message-ID: <2025122232-grass-stoppage-6645@gregkh>
References: <SYBPR01MB7881327BF7F679E76A7315DEAFB4A@SYBPR01MB7881.ausprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SYBPR01MB7881327BF7F679E76A7315DEAFB4A@SYBPR01MB7881.ausprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_222219_216398_7CFF9BBA 
X-CRM114-Status: GOOD (  17.27  )
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

On Mon, Dec 22, 2025 at 12:55:02PM +0800, Junrui Luo wrote:
> The digicolor_uart_console_write() function accesses the global
> digicolor_ports[] array to retrieve the uart port pointer, which
> can lead to a use-after-free if the console write occurs after
> the port has been removed via unbind.
> 
> digicolor_uart_remove() leaves a dangling pointer in the array.
> 
> Fix by clearing the array entry in digicolor_uart_remove() and
> adding a NULL check in digicolor_uart_console_write().
> 
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Reported-by: Junrui Luo <moonafterrain@outlook.com>
> Fixes: 5930cb3511df ("serial: driver for Conexant Digicolor USART")
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> ---
>  drivers/tty/serial/digicolor-usart.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/tty/serial/digicolor-usart.c b/drivers/tty/serial/digicolor-usart.c
> index d2482df5cb9b..5861be2072c4 100644
> --- a/drivers/tty/serial/digicolor-usart.c
> +++ b/drivers/tty/serial/digicolor-usart.c
> @@ -397,6 +397,9 @@ static void digicolor_uart_console_write(struct console *co, const char *c,
>  	unsigned long flags;
>  	int locked = 1;
>  
> +	if (!port)
> +		return;
> +

What prevents port from changing right after you tested this?

And who is calling unbind on a port?  Why?  That's a debuggging thing
that a developer could do, it should not be part of any normal system
operation.

thanks,

greg k-h

