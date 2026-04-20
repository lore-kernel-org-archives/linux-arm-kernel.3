Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE78F36C39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 07:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Jof05OCloCJ0pVGzF5VRISgmzviVQlNiPD9CHnY4MM=; b=iUNTdsLHfjdbKbUVJOJzZRP3PI
	jJl/ApNDMKyU2cPcUQ/dlUuPZbqN3h49P+Q6JPIcxEdONWBbUX2q9+oXralVwVgQQhJ+boFOQLSeK
	jAtw19a6/TOTKtA3pCotc9q1PreU91zVgUgkknT7jKpnboNLHoD+eLcQjNpuYDUOf0oYEhq6l37uO
	sDhpIqYlXlRR1zwH/EOz0xOyV4D2XbsYBEO8fTL6yelJlZg4lYovTkxYVOfFzJg2UH9IDFrG85gat
	EqF2clEKZoCR5nwmOlIQ+9IXq//MwLQELV4GQgK1WblSjTY6fxEg0H6fTJQqxV9YV3m2+iAhY766H
	jKdxXluw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEj3u-00000006YHX-3DWX;
	Mon, 20 Apr 2026 07:28:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEj3r-00000006YH0-4B3x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 07:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B453143F93;
	Mon, 20 Apr 2026 07:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C91EC19425;
	Mon, 20 Apr 2026 07:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776670130;
	bh=7ChK6EQOifVBDW8+zChThUU7L0yGoWl0XYx6PRCHSwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lwIj29lTn8M+8gOloHELG4EU+JtrPnmGw6Ek35JzLIC2pilkTvLC97UMLnppqBZga
	 aQ8QvoB1Nu5G8V04WJiLNc4PTBrpkyF0rPu89ZIvpw7471Kf3VHq23Dyx0diWYIWOf
	 kfqz+TQsCc60I+9bbxpuQ+Wz/84oDLZNx6clt4L+V2uHQB/1d2UN0nnGWMCIX9HZaE
	 SjMOuBAAoi2bR27Pikvj4BkY2vkoaimPjouHV1OCQ5PaS5a92VPVmlB2HK6bo5118D
	 807qKMAS3spfdLQYgCanfLyKQS/+qQxPJGuaEFPWTTNTCKK3EmTObulQXZy6Ss2WRc
	 KEOoiOxISoOwg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wEj3n-00000005umO-44a0;
	Mon, 20 Apr 2026 09:28:47 +0200
Date: Mon, 20 Apr 2026 09:28:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm_pmu: acpi: fix reference leak on failed device
 registration
Message-ID: <aeXVr5enpjb3rfq7@hovoldconsulting.com>
References: <20260415174159.3625777-1-lgs201920130244@gmail.com>
 <ad_WmuauLJ3xDKqh@J2N7QTR9R3>
 <2026041603-guts-crested-ef76@gregkh>
 <aeCOdWLaVpH-5w8s@hovoldconsulting.com>
 <aeCsLy-45QyeCwGA@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeCsLy-45QyeCwGA@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_002852_176827_055D5E92 
X-CRM114-Status: GOOD (  27.81  )
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

On Thu, Apr 16, 2026 at 10:30:23AM +0100, Mark Rutland wrote:
> On Thu, Apr 16, 2026 at 09:23:33AM +0200, Johan Hovold wrote:

> > It's not just the platform code as this directly reflects the behaviour
> > of device_register() as Mark pointed out.
> > 
> > It is indeed an unfortunate quirk of the driver model, but one can argue
> > that having a registration function that frees its argument on errors
> > would be even worse. And even more so when many (or most) users get this
> > right.
> 
> Ah, sorry; I had missed that the _put() step would actually free the
> object (and as you explain below, how that won't work for many callers).
> 
> > So if we want to change this, I think we would need to deprecate
> > device_register() in favour of explicit device_initialize() and
> > device_add().
> 
> Is is possible to have {platfom_,}device_uninitialize() functions that
> does everything except the ->release() call? If we had that, then we'd
> be able to have a flow along the lines of:
> 
> 	int some_init_function(void)
> 	{
> 		int err;
> 	
> 		platform_device_init(&static_pdev);
> 	
> 		err = platform_device_add(&static_pdev))
> 		if (err)
> 			goto out_uninit;
> 	
> 		return 0;
> 	
> 	out_uninit:
> 		platform_device_uninit(&static_pdev);
> 		return err;
> 	}
> 
> ... which I think would align with what people generally expect to have
> to do.

The issue here is that platform_device_add() allocates a device name and
such resources are not released until the last reference is dropped.

It's been this way since 2008, but some of the static platform devices
predates that and they both lack a release callback (explicitly required
since 2003) and are not cleaned up on registration failure.

Since registration would essentially only fail during development (e.g.
due to name collision or fault injection), this is hardly something to
worry about, but we could consider moving towards dynamic objects to
address both issues.

We have a few functions for allocating *and* registering platform
devices that could be used in many of these cases (and they already
clean up after themselves on errors):

	platform_device_register_simple()
	platform_device_register_data()
	platform_device_register_resndata()
	platform_device_register_full()

and where those do not fit (and cannot be extended) we have the
underlying:

	platform_device_alloc()
	platform_device_add_resources()
	platform_device_add_data()
	plaform_device_add()

But there are some 800 static platform devices left, mostly in legacy
platform code and board files that I assume few people care about.

Johan

