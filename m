Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DB9C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZohOB1gCnTc1vPJoVBm7i72a//JfhBzZDhVHtHxtA0=; b=ZvRFfbIC9XPXTNyp8xP24QAB98
	yLhLnmChN+b6yznhTXk0JYlAee2e2m9nnpMW1FJ5CfMm2nPfuYsjdC+/pezXiUJ+dttx2PqTZiM1X
	5bCMiUaiXkrGWQcx+sGXhfAgJK0vGOvRI1YJx3hyLYCPNzEOeRdqcaG8JlN+CX/P+gCx7Z1pUITPu
	9RQ2fkaMOhFA1ihjS/XzH5aLGHK+4VkqMNCBsIcuNHQ1UukwA380sBu224NpzskgvZKzbJ3GZapHO
	yMgk+6FCHs00XLyYkgiOSq89WKFpQpNJiolELbWqPgwJmAk3KeyMK6QNYR/ltcYjQMLqxyB72qbeS
	zV7ig9gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7IV-00000006VWT-2pnJ;
	Tue, 25 Mar 2025 16:38:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5N3-00000006CxJ-0dZ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 14:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742913311;
	bh=f4rDpzIaw27cWLZTFhTB7eMPv/RlYGMu7kxHgkuzwY8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YkIqrPLQ1klvRPSV9f8DLqhBy2jPEssKQmd5GPS3Tw/hO8uBTNaMR/orBwoIniP5A
	 duYdAabrGodLUP4r2drlbwy7RSOMdnJslkGLvqdJFYEdqhO4Q9oley6QaJ76oYl1U5
	 /J8spi9maOAb8Tax274gcg7qNBUmx6ivBu7wIwdsaUrI9Y9U41oJCbYuH7nVMNZN6U
	 sXEl+ngwYGuePZm0OWZU67mHsFuynWjO+pyJXwjPJ6AmhJTOAS2p119ZtOuvQ3K1AP
	 vw1oEYvVvVaN6I0hhzbaxWArieEYjVqROVujzpxOHHv6T95ifdzURcCsTomAqvnTf7
	 WpSzxnud1j1GQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5828517E0A80;
	Tue, 25 Mar 2025 15:35:10 +0100 (CET)
Date: Tue, 25 Mar 2025 15:35:07 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley
 <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, Steven Price
 <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
Message-ID: <20250325153507.61d82e39@collabora.com>
In-Reply-To: <7aadf355-edf0-46fc-b969-65c3789375ca@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
	<20250321200625.132494-5-marex@denx.de>
	<20250324094333.7afb17a1@collabora.com>
	<c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
	<20250325084349.344a0f11@collabora.com>
	<7aadf355-edf0-46fc-b969-65c3789375ca@denx.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_073513_380861_95D4F60F 
X-CRM114-Status: GOOD (  19.45  )
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

On Tue, 25 Mar 2025 14:50:32 +0100
Marek Vasut <marex@denx.de> wrote:

> On 3/25/25 8:43 AM, Boris Brezillon wrote:
> > On Tue, 25 Mar 2025 00:37:59 +0100
> > Marek Vasut <marex@denx.de> wrote:
> >   
> >> On 3/24/25 9:43 AM, Boris Brezillon wrote:
> >>
> >> [...]
> >>  
> >>>> @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
> >>>>    
> >>>>    	panthor_devfreq_suspend(ptdev);
> >>>>    
> >>>> +	reset_control_assert(ptdev->resets);  
> >>>
> >>> Hm, that might be the cause of the fast reset issue (which is a fast
> >>> resume more than a fast reset BTW): if you re-assert the reset line on
> >>> runtime suspend, I guess this causes a full GPU reset, and the MCU ends
> >>> up in a state where it needs a slow reset (all data sections reset to
> >>> their initial state). Can you try to move the reset_control_[de]assert
> >>> to the unplug/init functions?  
> >> Is it correct to assume , that if I remove all reset_control_assert()
> >> calls (and keep only the _deassert() calls), the slow resume problem
> >> should go away too ?  
> > 
> > Yeah, dropping the _assert()s should do the trick.  
> Hmmm, no, that does not help. I was hoping maybe NXP can chime in and 
> suggest something too ?

Can you try keep all the clks/regulators/power-domains/... on after
init, and see if the fast resume works with that. If it does,
re-introduce one resource at a time to find out which one causes the
MCU to lose its state.

