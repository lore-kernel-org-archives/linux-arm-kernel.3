Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBDAC36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 17:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4VZk22CpifkZMsuHmUpETTfaO5zrC57BXI1WJQdfNI=; b=NvO2N/8td9x2xZuFsngDpH5wfL
	zzq73BqShV2qeCh/AtykYeUnWUZHJDFFjOrcT0qsbHZnR/bhEHtJ5wWyKRCcdxys3heCh7qXXBbBw
	2499bqGky+KHtltgOJjvASMEZReEBLNVRuLEqfh9+4diYMxpfmrNZXgDMZ3t5+fEg8DoAr/bDMYYd
	o5jjuGg+OT3vh3zzs0BCuTAEEbEduYtYBGqpGuTuWfgoUiKXwm9PRsVxkTZvUWI/eQeRX1x0jUuwu
	NOKv0Cl5xmto1sjSinHRv1EwSBmWacZusft922NS4UPkJiiIrBhGSeh5z7AgT5NZJ2+VyFKpXmBbO
	C2nQWW2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7lX-00000006Zay-41gQ;
	Tue, 25 Mar 2025 17:08:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5dv-00000006FVA-1AWh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 14:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742914357;
	bh=ySLulsbTbBlrZdXsS2hTqluDneFtFypME/m8PNZsRFs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Pn99e2En0lKlFt3i+/VG8+v3A5HD/Cgd196KF5qo6W7Bjc3Ab3rYVSxmMSrVTad3t
	 /Yh3gMsDGhjY+Oq2WIbKZRvqCKsEgHW8y4FD0FRYUUbSJ1mZhJoROemNDx3nOm3MW/
	 Vsxvu7JKKAjikCLN/pj3rbKc+1piGj06x1spsmqOEaMs964gmjWVAJTgjLR1Ybv1AT
	 KdR1ZxM71NYJZ2aVy11nJOShHJdHMZziEzhmV45CBAeuI+vudinBifhO1N4uCVE9M5
	 NrpcH37/MrU46pYz5xjAYvfhtLdgHLZvIb30w6E4UVGPxcW+AW6jaFSe3KUK5Pc+4V
	 Ejf4t29puneoA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A5F6617E09BE;
	Tue, 25 Mar 2025 15:52:36 +0100 (CET)
Date: Tue, 25 Mar 2025 15:52:31 +0100
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
Message-ID: <20250325155231.0d1b1000@collabora.com>
In-Reply-To: <4c06aef3-a254-437c-aa15-8e3eb7bf5951@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
	<20250321200625.132494-5-marex@denx.de>
	<20250324094333.7afb17a1@collabora.com>
	<c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
	<20250325084349.344a0f11@collabora.com>
	<7aadf355-edf0-46fc-b969-65c3789375ca@denx.de>
	<20250325153507.61d82e39@collabora.com>
	<4c06aef3-a254-437c-aa15-8e3eb7bf5951@denx.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_075239_498270_37157037 
X-CRM114-Status: GOOD (  25.17  )
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

On Tue, 25 Mar 2025 15:37:01 +0100
Marek Vasut <marex@denx.de> wrote:

> On 3/25/25 3:35 PM, Boris Brezillon wrote:
> > On Tue, 25 Mar 2025 14:50:32 +0100
> > Marek Vasut <marex@denx.de> wrote:
> >   
> >> On 3/25/25 8:43 AM, Boris Brezillon wrote:  
> >>> On Tue, 25 Mar 2025 00:37:59 +0100
> >>> Marek Vasut <marex@denx.de> wrote:
> >>>      
> >>>> On 3/24/25 9:43 AM, Boris Brezillon wrote:
> >>>>
> >>>> [...]
> >>>>     
> >>>>>> @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
> >>>>>>     
> >>>>>>     	panthor_devfreq_suspend(ptdev);
> >>>>>>     
> >>>>>> +	reset_control_assert(ptdev->resets);  
> >>>>>
> >>>>> Hm, that might be the cause of the fast reset issue (which is a fast
> >>>>> resume more than a fast reset BTW): if you re-assert the reset line on
> >>>>> runtime suspend, I guess this causes a full GPU reset, and the MCU ends
> >>>>> up in a state where it needs a slow reset (all data sections reset to
> >>>>> their initial state). Can you try to move the reset_control_[de]assert
> >>>>> to the unplug/init functions?  
> >>>> Is it correct to assume , that if I remove all reset_control_assert()
> >>>> calls (and keep only the _deassert() calls), the slow resume problem
> >>>> should go away too ?  
> >>>
> >>> Yeah, dropping the _assert()s should do the trick.  
> >> Hmmm, no, that does not help. I was hoping maybe NXP can chime in and
> >> suggest something too ?  
> > 
> > Can you try keep all the clks/regulators/power-domains/... on after
> > init, and see if the fast resume works with that. If it does,
> > re-introduce one resource at a time to find out which one causes the
> > MCU to lose its state.  
> 
> I already tried that too . I spent quite a while until I reached that L2 
> workaround in fact.

So, with your RPM suspend/resume being NOPs, it still doesn't work?
Unless the FW is doing something behind our back, I don't really see
why this would fail on your platform, but not on the rk3588. Are you
sure the power domains are kept on at all times. I'm asking, because if
you linked all the PDs, the on/off sequence is automatically handled by
the RPM core at suspend/resume time.

