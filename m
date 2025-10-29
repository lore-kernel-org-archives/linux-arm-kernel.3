Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42A2CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yP32wH/LDBdPxF18Y46pmgWFLayvHMgFshzzfGmlBlo=; b=KH1Txv7J2ZctKSvQbvh69mGYNe
	8hYMa6+PXx8cRbPeUTxpBGpUxX1+SWwWFkdCj35LXlC4dQu7r+U6GXPbM92iLngfKT2gk10orTjvn
	AHorUSqR7IMsXFiG8aFBXO89VsSUPjp4OUZFPjQ4rUu2ywEk6lIAJY8xC7N7rtQg+Mf3M6zlyD3O9
	nElYHoSBldNtL2yBrF9oGAv42UTJX/eJWlBOplESTNNIp0dGZ7ALhuCQkUHAIeWIy+crPln7buSUG
	tNemGdAMhxqTxgLWUcUsuUM6ur68UuB9OhhzGmecOwZp7qPvO0GCi6s01RPpr9hO35RLw89EEpp+m
	BNkACeYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3F3-00000000gbd-38M7;
	Wed, 29 Oct 2025 10:17:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3F2-00000000gar-0ONZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:17:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A049E40A73;
	Wed, 29 Oct 2025 10:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A04C4CEF7;
	Wed, 29 Oct 2025 10:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761733038;
	bh=LByAXLZ9ll/ixgdmWs87gLszdmGDNLHhwbBIKEopj/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OYPOHMqt0YYSrDAC6pql5TZ/fDIPxKboiqxD8+fvq7qR8xl9H1ajp2WN75nJH+WKC
	 bMc+naCctmVuFB9JimG8t3J/kDEBBl8EBraXFGj6UWAN5XXNe+cqurF8rCl1mFzKJ2
	 kNQ2NQPVpklaimtMv0SdP1P0ZStyxwQtbeUnZd7E=
Date: Wed, 29 Oct 2025 11:17:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: jirislaby@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] serial: ma35d1: Fix resource leaks on driver removal
Message-ID: <2025102900-rebound-semicolon-0d98@gregkh>
References: <20251029080039.1010-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029080039.1010-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_031720_150864_403655F4 
X-CRM114-Status: GOOD (  20.46  )
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

On Wed, Oct 29, 2025 at 04:00:39PM +0800, Haotian Zhang wrote:
> The driver fails to release resources acquired during probe. It calls
> of_clk_get() to obtain the clock reference but never calls clk_put()
> in the remove path, leaking the clock reference count. Similarly, it
> calls ioremap() to map UART registers but never calls iounmap() during
> removal, leaking the I/O memory mapping.
> 
> Switch to devm_clk_get() for automatic clock resource management and
> add iounmap() call in ma35d1serial_remove() to properly release the
> memory mapping.
> 
> Fixes: 930cbf92db01 ("tty: serial: Add Nuvoton ma35d1 serial driver support")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/tty/serial/ma35d1_serial.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

