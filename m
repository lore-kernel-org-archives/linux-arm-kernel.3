Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844A2C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQvn7ex8+Xo9OmwGYCCxeEQfct5inHbYnKAoZ9KQGng=; b=hMQO2sz4rGtR4oqOhJm1hic2jw
	usyepMaXsc5Mo0Ie5chGDhFGApAAJAQ6La1fe21qeVKLqbMqBqRmssYu6uICk5TYep/mjZmuqnmQ+
	6RI9hpfv6cFmh8Ccy0em4XHBrrbks9TDdo7QH8QRAXXyXtWimclwAp20IEQcdc52iTFoDIikHAQ84
	LwtmdMuOREhToBaCdxDGH9ACKJC18yDPf3D85qtMG/PboNGYBnYJukXv3Ua5FR10A/Q0PJJig8/r3
	O5zDxbLAE1LC+95WR1fM6tIp8+OyaFFAlzde2olUlqqZPXxqrVCdOVDmdLWw9U0K+C4pvAfSEP192
	hOxS0geQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5EI-00000000o92-1xRn;
	Mon, 03 Mar 2025 12:49:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp58Y-00000000mdy-0Xjg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 12:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741005788;
	bh=5DB2ZcOVGHwI4J8v2gCTWUV2ckRQt9S1/RWpTcTMSOw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KXP7EmDEebfnJrrc9OfrBEX1TYqzm8Utc5ehBeHSb6pgdHx6yE6HkbZCvwNhd8ZD0
	 bc8Kbix8zkTRGHVPz/0SyW0ELJtU0cZR5p36PD2rAd/q5l/hFM+RI8ZFMA7cAaNqkX
	 9jNB6fcZfFEKeZBCTgfHFB/YhXWzn6sOPkH7RU0uPO4XuapDjBTYP+oW9Yq/Se/oBb
	 hVDXJ6FUKRK8xnDClRkggkV/yIzyY7LPnta0KOIoiyq3aTT+RkpIR3m3GiLtXbmWJX
	 eXzrLBD+fpKDgilqJ9wWvdwaJDa/2iYfm9SFw5ArNE8nKageNUuRYdEYNWf4DTp1R/
	 iuR9YZOBorHbw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7D57917E09B5;
	Mon,  3 Mar 2025 13:43:07 +0100 (CET)
Date: Mon, 3 Mar 2025 13:42:50 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org, Conor
 Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, Steven
 Price <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev
Subject: Re: [PATCH 6/9] drm/panthor: Reset GPU after L2 cache power off
Message-ID: <20250303134250.5ba726fc@collabora.com>
In-Reply-To: <20250303133523.2c5153ed@collabora.com>
References: <20250227170012.124768-1-marex@denx.de>
	<20250227170012.124768-7-marex@denx.de>
	<Z8GY0nWXOxCKF-XL@e110455-lin.cambridge.arm.com>
	<fa88c1c1-89ba-4a10-bd57-0819d7740c0a@denx.de>
	<Z8Wb05rmGW0ORnJB@e110455-lin.cambridge.arm.com>
	<20250303133523.2c5153ed@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_044310_345296_8ADBA7AE 
X-CRM114-Status: GOOD (  31.32  )
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

On Mon, 3 Mar 2025 13:35:23 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Mon, 3 Mar 2025 12:08:51 +0000
> Liviu Dudau <liviu.dudau@arm.com> wrote:
> 
> > On Fri, Feb 28, 2025 at 06:05:36PM +0100, Marek Vasut wrote:  
> > > On 2/28/25 12:06 PM, Liviu Dudau wrote:    
> > > > Hi Marek,    
> > > 
> > > Hi,
> > >     
> > > > On Thu, Feb 27, 2025 at 05:58:06PM +0100, Marek Vasut wrote:    
> > > > > This seems necessary on Freescale i.MX95 Mali G310 to reliably resume
> > > > > from runtime PM suspend. Without this, if only the L2 is powered down
> > > > > on RPM entry, the GPU gets stuck and does not indicate the firmware is
> > > > > booted after RPM resume.    
> > > > 
> > > > That doesn't sound right. Can you tell me what GPU firmware are you running
> > > > (we are now printing the git sha of the image at boot time).    
> > > Please see below. It could be some sort of NXP firmware fork ?
> > > 
> > > It comes from the NXP firmware repo , mali-imx-r50.2-710cfb6 .
> > > 
> > > panthor 4d900000.gpu: [drm] clock rate = 1000000000
> > > panthor 4d900000.gpu: EM: created perf domain
> > > panthor 4d900000.gpu: [drm] mali-unknown id 0xac74 major 0x0 minor 0x0
> > > status 0x1
> > > panthor 4d900000.gpu: [drm] Features: L2:0x7110306 Tiler:0x809 Mem:0x1
> > > MMU:0x2830 AS:0xff
> > > panthor 4d900000.gpu: [drm] shader_present=0x1 l2_present=0x1
> > > tiler_present=0x1
> > > panthor 4d900000.gpu: [drm] Firmware protected mode entry not be supported,
> > > ignoring
> > > panthor 4d900000.gpu: [drm] Firmware git sha:
> > > 8e5cfcfec20cc8aff8509d37e72babc935d34a3b    
> > 
> > This looks like it has been part of a R50 release of the DDK, which is recent
> > enough to consider it up-to-date. The issues you're seeing with fast resume are
> > probably due to some integration issues or other quirks.
> > 
> > Boris has the most recent experience with playing with fast resume, maybe
> > he can share some tips on where to add messages in Panthor to try to debug
> > your problem.  
> 
> If you end up with fast_reset=true, that means the FW claims it entered
> a suspend state from which is can resume quickly (fast-reset), and in
> that case, we're only supposed to power on the L2 block at resume time
> AFAIK.

Can you try deasserting the reset lines at probe time and keeping them
deasserted until the device is removed instead of re-asserting at
suspend time? If that doesn't work, try doing the same with power
domains.

> If there's a component that can tell us more, it's probably the
> FW, unfortunately, it doesn't tell us much through the FW interface,
> especially if it's not booting properly. Do you hit this error [1]
> without this patch, and if you do, what's the status reported there?
> 
> [1]https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/gpu/drm/panthor/panthor_fw.c#L1051


