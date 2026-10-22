Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2D2606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L4JCyo5P;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=NFz4ABAQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=unVAESJai7F1UmJzEHO+wzlvQnnF/1GINQlY378qHu4=; b=L4JCyo5P38uCL2mf2yfYAdBlc9
	1WKWRay1i+ck7Q7fh3Au5q+2Ep/7MpZSt6tmiOfQAdhrqzSkMG7xPxxngFO6xCuBbnDlAKrEa1/fg
	WFhu787Lmo4UaTIV6zg3y+ffK1quketryNWmObpNq+F0s3aK8BiKpSPInzFXhSJMlOmDSpC6PakIJ
	hvtkPacgiNNgMxpniZ6H7negE5gsp3JSO00yy/2ZXZrNnk2Mllae9nyGr6NrvZ7sUdU/dU6kVK2Tw
	Q3KZ5oSbSRviOGPbRmxJ43XaYmjz9w/UawTpvA2xqjvgMzGOBeSNq6C4Okd+ziCN4tHqtTjmQ6Jla
	veM2RnIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJstc-0000000ED11-0khY;
	Thu, 22 Oct 2026 13:31:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJstb-0000000ED0e-1Qd0;
	Thu, 22 Oct 2026 13:31:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B0DCD416DE;
	Thu, 22 Oct 2026 13:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1498E1F000C1;
	Thu, 22 Oct 2026 13:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792675910;
	bh=unVAESJai7F1UmJzEHO+wzlvQnnF/1GINQlY378qHu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NFz4ABAQp2vbr4lZ5nTkFb80iPDOMnAyr1zQfTCQfpZitXEgi8Vo/Wue0YC80WX6F
	 63nxqfyOgmF+WB5jPDHiFnMhPWWI8HpGfjlwZCdgPB5LnBbZmYXq86Co7tqfKIKeQw
	 FUv8/eV6PIYj+kLeeTNUNo9uxO0HQIVY9Wf8a3b8=
Date: Thu, 22 Oct 2026 15:31:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Wetterwald <martin@wetterwald.eu>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
Message-ID: <2026102218-vowel-plutonium-629e@gregkh>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022082927.59030-1-martin@wetterwald.eu>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 10:29:24AM +0200, Martin Wetterwald wrote:
> Since 6.19-rc1, with CONFIG_BCM2835_VCHIQ=y and CONFIG_SND_BCM2835=y
> (both builtin), the sound cards bcm2835_headphones and bcm2835_hdmi are
> not detected anymore (vc4-hdmi is not affected).
> 
> dmesg shows:
> 
>   Driver 'bcm2835-audio' was unable to register with bus_type
>   'vchiq-bus' because the bus was not initialized.
> 
> Since the VCHIQ interface was moved out of staging, its bus is no longer
> guaranteed to be registered before its client drivers. bcm2835-audio,
> still in drivers/staging, registers at device_initcall level and now
> runs first.
> 
> Register the bus and the platform driver at subsys_initcall so the bus
> exists before any client driver, independently of link order. The
> platform driver probe already returns -EPROBE_DEFER while the firmware
> is not ready, so probing earlier is safe. When built as modules, this is
> equivalent to module_init() and nothing changes.
> 
> Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
> bcm2835-audio both builtin and both as modules.
> 
> Cc: stable@vger.kernel.org
> Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
> Reported-by: Martin Wetterwald <martin@wetterwald.eu>
> Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com/
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Tested-by: Gaston Gonzalez <gascoar@gmail.com> # Raspberry Pi Zero
> Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
> ---
> Hi Greg,
> this is a regression introduced by aa125180c673 (via your tree) in
> 6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
> 7.4-rc1 has not been sent yet, could you take it there? Otherwise,
> staging-linus would be great. Thanks!

This is not a staging driver anymore, please route it through the proper
tree after -rc1 is out.

thanks,

greg k-h

