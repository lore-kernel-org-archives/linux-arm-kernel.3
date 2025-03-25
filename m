Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADDBC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 07:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ij1AlJEWCC0AmrKna7fpLxTKGNpIfgZpKPAFXKqilnk=; b=hf8/+WJrzPD5AIoGBIDZ8WrSWe
	xHnRl7vxwIP12RgX6IWARAQDPMk/2iT0XQcfe70lZdhZyWQhGTDproZwcMXKHtOxWtdaxuhC5OHYq
	lC5cnni2oEdnbD6hSckAgyRjBNvBQInyxQC2EhyQpM1FmS3vJU1zxt1dVcbNcKVg8Zq73lfKhs445
	nm4+dG4F8ZLBOsiwSC1OJl1Rby3o/AEVYBEjz8aFV/e+he2ho9dKac7Qxkqge6bthg8x+p5GtO9j/
	JRQQZBbf9oda3+Q9xSosELydk9VZM0NwHiPCCUTPZdZBzSVn5O1O6U66u3lYXcn4ga9OLax1aW+qw
	Nzr50QmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twyyn-000000057bQ-0ikE;
	Tue, 25 Mar 2025 07:45:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twyx4-000000057Pd-3dJd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 07:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742888636;
	bh=rowfx31ag+FaIVlyMn1GbT430uSDmMWtfpOE8qhrvfk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HoIP+bg+keOvp01Bky9kTZx9UKTUDt4bl0iYEs7svMOQ0E/g7SyDZRQ1q4CyWvQVb
	 win4N7WVucOV4qgu11ypeOV8vJlwLlupKp91w8Kxww0ChBrItaLdX42OL/ca3lU3nc
	 bYuNVjgvPbQIk30ZeLOQHb4HRP6Yzr+ZRD9d83V/o3fMvduKNvKdzvLObOZu8VPQmU
	 4EawrT94E2AL64mpmVfUsR+AM/QFL8/3boRXQlzHow2XzAMjnOWGyYeILutxoD0jRX
	 RmCGNiRmaGrJos1XmuMDvbmYl9zs5jQeLSwzXQvYbgIcTLRkI60aQM4QmPDm4olHgX
	 rmk6hBT63kCcA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB06417E0CAB;
	Tue, 25 Mar 2025 08:43:55 +0100 (CET)
Date: Tue, 25 Mar 2025 08:43:49 +0100
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
Message-ID: <20250325084349.344a0f11@collabora.com>
In-Reply-To: <c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
	<20250321200625.132494-5-marex@denx.de>
	<20250324094333.7afb17a1@collabora.com>
	<c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_004359_093202_7781F448 
X-CRM114-Status: GOOD (  17.38  )
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

On Tue, 25 Mar 2025 00:37:59 +0100
Marek Vasut <marex@denx.de> wrote:

> On 3/24/25 9:43 AM, Boris Brezillon wrote:
> 
> [...]
> 
> >> @@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
> >>   
> >>   	panthor_devfreq_suspend(ptdev);
> >>   
> >> +	reset_control_assert(ptdev->resets);  
> > 
> > Hm, that might be the cause of the fast reset issue (which is a fast
> > resume more than a fast reset BTW): if you re-assert the reset line on
> > runtime suspend, I guess this causes a full GPU reset, and the MCU ends
> > up in a state where it needs a slow reset (all data sections reset to
> > their initial state). Can you try to move the reset_control_[de]assert
> > to the unplug/init functions?  
> Is it correct to assume , that if I remove all reset_control_assert() 
> calls (and keep only the _deassert() calls), the slow resume problem 
> should go away too ?

Yeah, dropping the _assert()s should do the trick.


