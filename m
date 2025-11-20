Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BEECF8549
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 07:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUVxtnDp0wBZw7gMGe0WzIL+BrSI1zZNHhXG5nhPpAA=; b=AARpbrLsnpLmIR2ZVWgFNYrKYU
	Gkpxxwp7sS0Aqdij1P5KkSYqz8Fbv2WW0h1oUAwhxBwo82ZVt5bvTDtsntExcq+p8huLk5CFHiDH7
	+IHXVelo7NXSmaWUZG525seeEcdXzM0HglXxIT78ieOxCyB+A2sWdxR3fyJn2mO87MvdM6U8+twVB
	jiZeOXU/VTRmDgUFB7bPrI1hp8vfY36jndCKWS7QwhgUypoigHg1vV0Mi4gHjcyxuSIMbuc/L4eLv
	Y6VfhsEZgMkKaulU5AQ6Xc7hKzQedMNH9MbuVSJug/IFpEU0tgLsohbbonK6oaLrGSdNcqP3Jr6Py
	s3hkETBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyqE-00000006HLc-2jNg;
	Thu, 20 Nov 2025 07:12:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLyqC-00000006HKg-11CV;
	Thu, 20 Nov 2025 07:12:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BEF8140677;
	Thu, 20 Nov 2025 07:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124A5C4CEF1;
	Thu, 20 Nov 2025 07:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763622745;
	bh=EQAgnumsg/0/HohGZhlQ7lZ5l81gXXG25tXu/zMDTTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=btUsB5fhDPjSTktDnq3DzzZZd54B9/cGdxkWXeQFdks6o228NwGaJUnKsLivooWZo
	 nznEHs9HKpv1QPdi7ap+eFfheA8tsBbn/BHOFILYDEz4wUcr/K4QajByN3GAUF8EUv
	 Z0ca5yNesER+GfsIOyEUp6DVcSTQKsPIV1ObkKmM=
Date: Thu, 20 Nov 2025 02:12:19 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	incogcyberpunk@proton.me, johan.hedberg@gmail.com,
	regressions@lists.linux.dev, sean.wang@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Bluetooth: btusb: mediatek: Avoid
 btusb_mtk_claim_iso_intf() NULL deref
Message-ID: <2025112007-quit-enable-3fa1@gregkh>
References: <20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_231228_334070_5ED85EF2 
X-CRM114-Status: GOOD (  25.58  )
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

On Wed, Nov 19, 2025 at 08:53:55AM -0800, Douglas Anderson wrote:
> In btusb_mtk_setup(), we set `btmtk_data->isopkt_intf` to:
>   usb_ifnum_to_if(data->udev, MTK_ISO_IFNUM)
> 
> That function can return NULL in some cases. Even when it returns
> NULL, though, we still go on to call btusb_mtk_claim_iso_intf().
> 
> As of commit e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for
> usb_driver_claim_interface()"), calling btusb_mtk_claim_iso_intf()
> when `btmtk_data->isopkt_intf` is NULL will cause a crash because
> we'll end up passing a bad pointer to device_lock(). Prior to that
> commit we'd pass the NULL pointer directly to
> usb_driver_claim_interface() which would detect it and return an
> error, which was handled.
> 
> Resolve the crash in btusb_mtk_claim_iso_intf() by adding a NULL check
> at the start of the function. This makes the code handle a NULL
> `btmtk_data->isopkt_intf` the same way it did before the problematic
> commit (just with a slight change to the error message printed).
> 
> Reported-by: IncogCyberpunk <incogcyberpunk@proton.me>
> Closes: http://lore.kernel.org/r/a380d061-479e-4713-bddd-1d6571ca7e86@leemhuis.info
> Fixes: e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for usb_driver_claim_interface()")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I have no way to test this commit myself other than to compile it. It
> looks fairly straightforward, though, so I'm hopeful it will fix the
> problem.

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

