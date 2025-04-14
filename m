Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEA6C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 17:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/8uOAtbVmCZvjhsurXrFVLt9CpRfBq4iQIyumUIFdM=; b=wamvYPeGwX91ArlhjI8ECCOjy1
	paF54Spho+DV9PzBzNhznMbmvfD3z3yOa8GoE8iDcaxUA5+x1uPyirWz1nndMTW+lC7Kvr85WzF/X
	Sqg2g1hQ1ncFngnrKjgOOQy012ioywHgGhSqbiABUM/sS94zXAEamp9pvfzs9zoWhk8+1Xu5Bu3SP
	ak/m/wLahk63AQbU8Abl6pYdI3x9+InxI83ZBBnYtGVuLUzyKRuBDhD+HLbZLoaym6mvxEqvTolZz
	st2nSkuBGb0NVcknUCnJgdjWfSk5wj99jw9dmLguyavDMd8KJB8MxYlcizg6HEe28wtSAZg35rCj9
	APsafNmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Nyx-000000030lD-483S;
	Mon, 14 Apr 2025 17:52:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Nx5-000000030XP-1Acf;
	Mon, 14 Apr 2025 17:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B8D161148;
	Mon, 14 Apr 2025 17:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B68C4CEE2;
	Mon, 14 Apr 2025 17:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744653033;
	bh=u0lppupJ28hlw5WA6282KGjOBJl0lejCj3CJJJ9QQ5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Peo7dLMNP7L+GnBEqhqRYXDCeB4nrkjvXC0pwxhnC03PwR9MwW0L0YhmXOwUnrEz6
	 wF8qQp+GCxtQhVgmiWhU8XgQLjnpeQdhNLZdAH5g/+4F2KsWE+DJWIH0tY3Y7OLvx1
	 nCuZdaqahi5+h9p8+iBz0rZlRv3EtZtv+pPGiVAA=
Date: Mon, 14 Apr 2025 19:50:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: bcm2835-camera: Initialise dev in v4l2_dev
Message-ID: <2025041421-fancied-thursday-97d8@gregkh>
References: <20250414-staging-bcm2835-v4l2-fix-v1-1-2b2db9a8f293@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414-staging-bcm2835-v4l2-fix-v1-1-2b2db9a8f293@raspberrypi.com>
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

On Mon, Apr 14, 2025 at 06:41:47PM +0100, Dave Stevenson wrote:
> Commit 42a2f6664e18 ("staging: vc04_services: Move global g_state to
> vchiq_state") changed mmal_init to pass dev->v4l2_dev.dev to
> vchiq_mmal_init, however nothing iniitialised dev->v4l2_dev, so we got
> a NULL pointer dereference.
> 
> Set dev->v4l2_dev.dev during bcm2835_mmal_probe. The device pointer
> could be passed into v4l2_device_register to set it, however that also
> has other effects that would need additional changes.
> 
> Fixes: 42a2f6664e18 ("staging: vc04_services: Move global g_state to vchiq_state")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> Noted as we switched to 6.12 that the driver would fail during probe
> with an invalid dereference if a camera module was actually configured
> for the legacy camera stack.
> https://github.com/raspberrypi/linux/issues/6753
> ---
>  drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> index b839b50ac26a..fa7ea4ca4c36 100644
> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> @@ -1900,6 +1900,7 @@ static int bcm2835_mmal_probe(struct vchiq_device *device)
>  				__func__, ret);
>  			goto free_dev;
>  		}
> +		dev->v4l2_dev.dev = &device->dev;
>  
>  		/* setup v4l controls */
>  		ret = bcm2835_mmal_init_controls(dev, &dev->ctrl_handler);
> 
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250410-staging-bcm2835-v4l2-fix-b8dbd933c23b
> 
> Best regards,
> -- 
> Dave Stevenson <dave.stevenson@raspberrypi.com>
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

