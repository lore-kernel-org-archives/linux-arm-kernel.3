Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3C3C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 07:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyHkTy+uItTnTq/uOBBEXSp08Q/IiHn0VP1wcMeZFag=; b=gIeEG4LxBMQIFQu3opKcxq6ZPI
	KIrojVrSMqOPLYcJyGgvFcMYJe/94WGLfXk7krB6dtRudo3c8689mL2IJivXHnbbfKTGap/QuaTOp
	oWLuFh7DhiWqkN8PmHlZb9mEFihM8RrdiAZ2Ii613QSRg/mVwPcGAHO0G2dpBKNJ0PC4OL2HxsZcs
	i7JwZypdFcsuWTmO7sxPYyaLK9KfLp9r4zbagVhOuseJsQ3xR2ALBl2cHbbtebfWdesu/873O0+3M
	AHM5kQRuorbWHHBPkClm5IHaWf/9Ihztk/LjalwmoIXecYNMVuHoqC/QEGM+JH8hqO895D2d/ZTiN
	tdt1/p7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbUx-00000001r4n-2sL3;
	Mon, 23 Jun 2025 07:21:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbSa-00000001qhl-3ft4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 07:19:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 113DD4A86E;
	Mon, 23 Jun 2025 07:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957F3C4CEED;
	Mon, 23 Jun 2025 07:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750663159;
	bh=avq5GSOpmlAjDpFvdLk3ekAvTWbX29Z9+MPrZVT0QmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L3CB5ov49BFO3mcFgc1jfxdnpFJ8pU813wFSa11t6BFh8aj/LDIhjwUKpcO03X+dx
	 Mngjod4kQru3gGTO4OuTcKx4TZDiBHEPa1WnaA+M1E44RnyrIs8U6XA0LXVmO4SGoI
	 EQbdlbm95hIQ7WCMdqd3HkRdHOqnqbg3fYySh7NQ=
Date: Mon, 23 Jun 2025 09:19:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Steffen =?iso-8859-1?Q?B=E4tz?= <steffen@innosonix.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmem: imx-ocotp: fix MAC address byte length
Message-ID: <2025062357-pulp-unlaced-cdd9@gregkh>
References: <20250623070901.1733755-1-steffen@innosonix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250623070901.1733755-1-steffen@innosonix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_001920_966031_E2D46436 
X-CRM114-Status: GOOD (  26.33  )
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

On Mon, Jun 23, 2025 at 09:08:49AM +0200, Steffen Bätz wrote:
> The commit "13bcd440f2ff nvmem: core: verify cell's raw_len" caused an
> extension of the "mac-address" cell from 6 to 8 bytes due to word_size
> of 4 bytes.
> 
> Thus, the required byte swap for the mac-address of the full buffer length,
> caused an trucation of the read mac-address.
> >From the original address 70:B3:D5:14:E9:0E to 00:00:70:B3:D5:14
> 
> After swapping only the first 6 bytes, the mac-address is correctly passed
> to the upper layers.
> 
> Fixes: 13bcd440f2ff ("nvmem: core: verify cell's raw_len")
> Signed-off-by: Steffen Bätz <steffen@innosonix.de>
> ---
>  drivers/nvmem/imx-ocotp-ele.c | 2 ++
>  drivers/nvmem/imx-ocotp.c     | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
> index ca6dd71d8a2e..3af7968f5a34 100644
> --- a/drivers/nvmem/imx-ocotp-ele.c
> +++ b/drivers/nvmem/imx-ocotp-ele.c
> @@ -119,6 +119,8 @@ static int imx_ocotp_cell_pp(void *context, const char *id, int index,
>  
>  	/* Deal with some post processing of nvmem cell data */
>  	if (id && !strcmp(id, "mac-address"))
> +		if (bytes > 6)
> +			bytes = 6;
>  		for (i = 0; i < bytes / 2; i++)
>  			swap(buf[i], buf[bytes - i - 1]);
>  
> diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
> index 79dd4fda0329..63e9974d9618 100644
> --- a/drivers/nvmem/imx-ocotp.c
> +++ b/drivers/nvmem/imx-ocotp.c
> @@ -228,6 +228,8 @@ static int imx_ocotp_cell_pp(void *context, const char *id, int index,
>  
>  	/* Deal with some post processing of nvmem cell data */
>  	if (id && !strcmp(id, "mac-address"))
> +		if (bytes > 6)
> +			bytes = 6;
>  		for (i = 0; i < bytes / 2; i++)
>  			swap(buf[i], buf[bytes - i - 1]);
>  
> -- 
> 2.43.0
> 
> 
> -- 

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

