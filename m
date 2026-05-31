Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8971CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 07:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVME6BMLZrouDuwpKNXy6uU2e3Q/0FIm0B1uSihMQ94=; b=tFKgXYmyfEv6uwYCFfSYYGiOfs
	I3fMvn6/i70i0X+XauBb3jqzD8iRhF/aSDa03L2I4DYeCsKMZTkleiRGQb69RxU7nNqnmnq3mjawv
	BbvowzFr0MG4JYokjF6jV1buvSHdelvl32wO4B9Ux64juEnBZdTfXgrZYlW+8WXQnn3A62XAqxnOu
	htF2YzqIWOcT3IsoDfW66Zryyy7iUoH9oZk0+99D5gqmi2oqgTvNhocstY7MZ9KA3A6VD2x9EuEw1
	TpvGzVvulGlCuQgK0uVZM2P2azFgphtkqrwtG/QUZeoJMHM2MrP7iLdTsvcAthUyYRk2I6Q7paoOn
	ygJAlhRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTayd-00000009Lly-0zZo;
	Sun, 31 May 2026 07:52:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTaya-00000009LlH-3JE5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 07:52:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D5DE40A56;
	Sun, 31 May 2026 07:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853FB1F00893;
	Sun, 31 May 2026 07:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780213972;
	bh=lVME6BMLZrouDuwpKNXy6uU2e3Q/0FIm0B1uSihMQ94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kGPHrxtSgLsNxGZ7FHVnrPNQTEYvVXZwKKIT2DOpCf0AmPTi94rgHbW1Dt94ix43I
	 mSFIXcmXGSbNdnmc3HD1/+7zK4ONnG5dFXbQ7Flz29WsH2t+EaRPmvYzmAvTEMy40O
	 PYeDqdC+9AGewVd36lBOX/NvddNEgV6D2ufrg2RU=
Date: Sun, 31 May 2026 09:51:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCHv2] serial: mxs-auart: fix probe error paths and clock
 handling
Message-ID: <2026053127-nastily-fool-88eb@gregkh>
References: <20260530195525.5059-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530195525.5059-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_005252_842329_DCB9AD25 
X-CRM114-Status: GOOD (  10.11  )
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

On Sat, May 30, 2026 at 12:55:03PM -0700, Rosen Penev wrote:
> Sashiko reported three pre-existing bugs in the mxs-auart driver:
> 
> - For non-ASM9260 variants, mxs_get_clks() obtained the clock but never
>   prepared/enabled it, leaving register accesses in probe at risk of
>   faulting if the bootloader had gated the clock.
> - The error path and remove function used pdev->id instead of
>   s->port.line to clear the auart_port[] slot.  For DT-probed devices
>   pdev->id is -1, causing an out-of-bounds write and leaving a dangling
>   pointer in the array.
> - The probe error path called iounmap() while the IRQ was still
>   registered. An interrupt during that window would dereference the
>   unmapped membase.

This should still be broken up into smaller pieces, don't you think?

Whenever you have to list the different things you do in a patch, that's
a huge hint to do so.

thanks,

greg k-h

