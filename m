Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF3CC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGsPUd4c4/jiwAM0z4uKJZVSAM5wKncJVyzSk3d45QY=; b=w/Nu9qjC0o2bCCheWDp5TUd7ox
	qh8wZMT7xA+DjWBIchF1efhM8Yy918yDdwjP4qaNxmtRhWz4sDAeGmT6nO0AzlmzR99OsctlqSGsF
	hBLyXCSNBqz+tXEEHX8L8TAhkNuqM5ozTJUcJqyznKPoCz/Rxwn/7ta0LWZ7k/NB2vrEeCv2wXqQt
	DhFYp56V0TKAsWDeKSozwIQzn+cSxa2KDMnbuzMZ0TwjJZVOLTWLM2Uv3JNo4QFNmlgAyRcFxYBCs
	nw8XxcCOyRfXQGR4po85AIbX2fambFG0FgfLyxC28z9B0Rwb1JOCp0TbdjBVfM4OvGsJbZjk0+nkw
	BUnY3m/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6khO-00000008gkb-3U7n;
	Wed, 16 Sep 2026 08:08:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6khM-00000008gkO-2UvO;
	Wed, 16 Sep 2026 08:08:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A31E360234;
	Wed, 16 Sep 2026 08:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A701F000FF;
	Wed, 16 Sep 2026 08:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789546135;
	bh=NGsPUd4c4/jiwAM0z4uKJZVSAM5wKncJVyzSk3d45QY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ca4k+47D8o+zL7G76OczRVJ7a2qkrBHqI1/Od4RNEPo8JwVuyHFH1drWChaxTzMVx
	 rzivByJWrrPNPjNcwUROqglLsqdxSI0Pwmt1OseLUucgoLpZ6SRxGJAcuiyqTiQHgH
	 YhCxZ8D0YfcysSM37Do7LNFweJjSI3JpPOJxaljmY9aJVkzqysWBGY7KK4f3zefMZG
	 snx5LEIMjOywY6TRK+DA37/AmXX6lVZ3X1YMjyTYXQsOX5FB995aGl+U0goeoEuPbF
	 9Rxdbw2kP1zJ5MLILiUJoPaSOnDceCxHNZQWqEYkj12JmbNv67cRA7nTXw0pl6pDsD
	 UOROGyIchJRQw==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1x6khI-00000005w7O-3XCS;
	Wed, 16 Sep 2026 10:08:52 +0200
Date: Wed, 16 Sep 2026 10:08:52 +0200
From: Johan Hovold <johan@kernel.org>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/6] usb: core: add missing
 pm_runtime_dont_use_autosuspend() call
Message-ID: <aqpOlKtxeROh-G_s@hovoldconsulting.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
 <20260915090223.1346-2-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915090223.1346-2-joshua.crofts1@gmail.com>
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

On Tue, Sep 15, 2026 at 09:02:18AM +0000, Joshua Crofts wrote:
> The fail label in usb_new_device() disables pm_runtime on failure, but
> doesn't call pm_runtime_dont_use_autosuspend(), causing resource leaks.

No it does not, as the device itself is about to be freed. Sure we could
disable autosuspend again here, but it does not really matter.

You could consider balancing the runtime pm count as well, as I guess
both of these could trip up static checkers (cf. [1]).

> Add the missing pm_runtime_dont_use_autosuspend() call.
> 
> Found using Coccinelle.
> 
> Fixes: fcc4a01eb866 ("USB: use the runtime-PM autosuspend implementation")
> Cc: <stable@vger.kernel.org>

But this one should not have a Fixes tag and does not need to be
backported.

> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
>  drivers/usb/core/hub.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 3345b3298daf..dec6d5c49759 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2745,6 +2745,7 @@ int usb_new_device(struct usb_device *udev)
>  fail:
>  	usb_set_device_state(udev, USB_STATE_NOTATTACHED);
>  	pm_runtime_disable(&udev->dev);
> +	pm_runtime_dont_use_autosuspend(&udev->dev);
>  	pm_runtime_set_suspended(&udev->dev);
>  	return err;
>  }

Johan

[1] https://lore.kernel.org/all/aivMnTkZ-jTRH2Jy@hovoldconsulting.com/

