Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3B6CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 10:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyXPxIc5vrvC+cHsH1MFxEItdsFpPZ5QBC/k0LeC0BU=; b=fSRwo1f7xW+vQm/yfQvuLRnDYF
	88k/qAI58/rALpaabgna7eySyseFOpak9Fr57sp1vDEqaTtC0ZxUw+srRGPnDYCxm4B9MliREHXb2
	5eYpWbasLrrhfjXnTH6J14Nbv2hiwtve0q8XW16S8+g/Xd0Vdp8X4cb4q1HTfqqXVX5GxsJslwuNa
	NamEWvGI2X9nRuVfMdtq0wObVsVDUgzYXNy3WQXpBN9WfX3zN7FAfLADrui7KH7QH7F6mq3b2jT9N
	4FXg7GT6sCdeC4+UB5rsTe2S+A5fFgeG2WYegpSsHGfBbs9q9alRC9+mdIYYWoMoB04GQJMj6kUQn
	jtoQaGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZy4-00000001B3d-1l18;
	Thu, 28 Aug 2025 10:34:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYw7-00000000y1u-3v01;
	Thu, 28 Aug 2025 09:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C754C443AE;
	Thu, 28 Aug 2025 09:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECBFC4CEEB;
	Thu, 28 Aug 2025 09:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756373329;
	bh=y8YnwcnSxBOTmOyoA65L96B1RKvSEtcKZ0A6OCYbckQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=itR4/JIfDU7uqrAWwxeNh0s9mmdmkznvYT3uyvfBV2KPNdM5qTCqjObIv4dnUZHac
	 ZskNQxAdVWivgltri9cqI6IEyqXIpIkELFktXg78wPFx8NGA3kZvImaLzRvKzqvIKY
	 zSOkrreyzUtIt5zvnHkmae0jVUd8BvQbwn1JJaV4=
Date: Thu, 28 Aug 2025 11:28:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: ethernet: ti: Prevent divide-by-zero in
 cpts_calc_mult_shift()
Message-ID: <2025082830-bobbing-confusing-14fc@gregkh>
References: <20250828092224.46761-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828092224.46761-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_022852_113043_EB66D35E 
X-CRM114-Status: GOOD (  25.52  )
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

On Thu, Aug 28, 2025 at 05:22:23PM +0800, Miaoqian Lin wrote:
> cpts_calc_mult_shift() has a potential divide-by-zero in this line:
> 
>         do_div(maxsec, freq);
> 
> due to the fact that clk_get_rate() can return zero in certain error
> conditions.
> Add an explicit check to fix this.
> 
> Fixes: 88f0f0b0bebf ("net: ethernet: ti: cpts: calc mult and shift from refclk freq")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> This follows the same pattern as the fix in commit 7ca59947b5fc
> ("pwm: mediatek: Prevent divide-by-zero in pwm_mediatek_config()").
> ---
>  drivers/net/ethernet/ti/cpts.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/ti/cpts.c b/drivers/net/ethernet/ti/cpts.c
> index 2ba4c8795d60..e4e3409e7648 100644
> --- a/drivers/net/ethernet/ti/cpts.c
> +++ b/drivers/net/ethernet/ti/cpts.c
> @@ -607,6 +607,8 @@ static void cpts_calc_mult_shift(struct cpts *cpts)
>  	u32 freq;
>  
>  	freq = clk_get_rate(cpts->refclk);
> +	if (!freq)
> +		return;
>  
>  	/* Calc the maximum number of seconds which we can run before
>  	 * wrapping around.
> -- 
> 2.39.5 (Apple Git-154)
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

