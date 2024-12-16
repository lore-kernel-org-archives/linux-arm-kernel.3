Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DFDE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHWWI0N4FAwPdreCkMtEatB5/hoqz+skgWUjm2JwRUI=; b=j5rJw8YWK3YVfcPd2VMmIHgcqE
	l5w4P00LFB0RIpqhTEn7S2+G82dKFRl9kBxlFixjxjvvFKhAlNeYezYblgkOlF5iu4xdHXgp684jG
	KzzHMLgwjkmAmbo97fLkN87+4wqP3GzahrYw7H8OBPfZSBpDNZd1VWyRLbC/Y5s9Kja7q8xJ/ColT
	rbQURCq/fgQLgZwTrz6vUd4R9ZtCgMsxhfAx1Dd7O1Noq2IoW4ekVdmrc+wRWr4UkmPma7gkk4mG9
	W3Qmqo4gDjmUlb+sADtaBwHOwKqS6bWpXaY66Oj4qHZHHG/WD6QNCFvK3anjcFgPh98sG1Q8CARC/
	XSUCYavQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCj2-0000000AMGF-1Zuu;
	Mon, 16 Dec 2024 15:09:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNChs-0000000ALzr-2cdT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:08:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7C24A4177E;
	Mon, 16 Dec 2024 15:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA63C4CED0;
	Mon, 16 Dec 2024 15:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734361703;
	bh=awxiBTcZhMpWYm6oAg7E3oNZlYA7iWuuZpH4Aj7m4Ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZsECHSVwD9hZ4gBTWa5f7mSd27oFcngZLAZ6z5ioMZ5sfC0EG6R7Gk9nYK1i4Jn1
	 Vv9TxVr2/c5udikOt2dvrFYHuJmHJzzY7L+yE2H/svsVIVZkuDMNYFMgItDSnRwEcp
	 I+/8VWvqsr/mw73n/QSXsh0/lsgRvX57lnUw8N40=
Date: Mon, 16 Dec 2024 16:07:43 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH] serial: stm32: use port lock wrappers for break control
Message-ID: <2024121632-railing-battle-07c7@gregkh>
References: <20241216145323.111612-1-ben.wolsieffer@hefring.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216145323.111612-1-ben.wolsieffer@hefring.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_070824_724196_8E6DA648 
X-CRM114-Status: GOOD (  20.32  )
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

On Mon, Dec 16, 2024 at 09:53:23AM -0500, Ben Wolsieffer wrote:
> Commit 30e945861f3b ("serial: stm32: add support for break control")
> added another usage of the port lock, but was merged on the same day as
> c5d06662551c ("serial: stm32: Use port lock wrappers"), therefore the
> latter did not update this usage to use the port lock wrappers.
> 
> Fixes: c5d06662551c ("serial: stm32: Use port lock wrappers")
> Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
> ---
>  drivers/tty/serial/stm32-usart.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

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

