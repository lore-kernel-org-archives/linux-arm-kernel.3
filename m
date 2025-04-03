Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1F4C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 06:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwmjY7yh6LQsjbd3Qi5xxZ4CxyRSpo/F5EWX8xQ1CEg=; b=EdrjgarsVgtO2YCQJNnoxF4E29
	EglqdC38D6PiEIg9oKOrCIFrb6/41wcldxZRVQPDmNSKAoKi/N9dfNo19nXzy2tWQOwkseYw+p5/+
	9abbooTw/rg3QfuHqkufvBZZZHzGT4zF90uQpkWQyaUYnwZYb3sgjN4Ao7BxLExQ/4FqVpXxut1AS
	NPsjGK71Nh9gcBDpY18y05ruFmj+10mGnEIwwtKe/B3/gauyRVM8uc7EsM2u1r+Rx91jqZhQ/qwNJ
	0F530Y3YKg21H59BopTfHVAnS2QIRhbqCvBq42geD08lpGt9xj+2ekOdrQBHNkboKV6YyPa2WiWmf
	Vtikf1Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ET1-00000007zQG-3Bhu;
	Thu, 03 Apr 2025 06:54:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EPR-00000007ynq-33we
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 06:50:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B8EBAA44271;
	Thu,  3 Apr 2025 06:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66E5C4CEE8;
	Thu,  3 Apr 2025 06:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743663040;
	bh=Jh/rY+EfIjSo98Z/ve5BziCFk7Rx6+VKfxCcaVbDtEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fCYukXs5RtwOJrW0aHvACYhB+w3VtDovh0h0XSAhtrAwlJkHFzQeCCHaQraayIh3I
	 dHdEbfeqNFPw1YeIa6iNSkmi8yws9CsIqRuoBjddeX78VdjQpufEHWDCXbxm0J1WD3
	 2h82qoGnao1EdRCrUrGeUG54x30CxU0kNJqj5Dxo=
Date: Thu, 3 Apr 2025 07:49:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: jirislaby@kernel.org, sugaya.taichi@socionext.com,
	orito.takao@socionext.com, u.kleine-koenig@baylibre.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] serial: Fix null-ptr-deref in mlb_usio_probe()
Message-ID: <2025040301-unmanned-lapdog-5446@gregkh>
References: <20250403062808.63428-1-bsdhenrymartin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403062808.63428-1-bsdhenrymartin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_235042_182714_362B0685 
X-CRM114-Status: GOOD (  26.26  )
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

On Thu, Apr 03, 2025 at 02:28:08PM +0800, Henry Martin wrote:
> devm_ioremap() returns NULL on error. Currently, mlb_usio_probe() does
> not check for this case, which results in a NULL pointer dereference.
> 
> Add NULL check after devm_ioremap() to prevent this issue.
> 
> Fixes: ba44dc043004 ("serial: Add Milbeaut serial control")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
>  drivers/tty/serial/milbeaut_usio.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/milbeaut_usio.c b/drivers/tty/serial/milbeaut_usio.c
> index 059bea18dbab..4e47dca2c4ed 100644
> --- a/drivers/tty/serial/milbeaut_usio.c
> +++ b/drivers/tty/serial/milbeaut_usio.c
> @@ -523,7 +523,10 @@ static int mlb_usio_probe(struct platform_device *pdev)
>  	}
>  	port->membase = devm_ioremap(&pdev->dev, res->start,
>  				resource_size(res));
> -
> +	if (!port->membase) {
> +		ret = -ENOMEM;
> +		goto failed;
> +	}
>  	ret = platform_get_irq_byname(pdev, "rx");
>  	mlb_usio_irq[index][RX] = ret;
>  
> -- 
> 2.34.1
> 
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

