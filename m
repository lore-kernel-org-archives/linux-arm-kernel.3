Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1048FF8809D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 07:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0Lv6CGDJSBz1cuTrY23RgjglOY2hcg2VCDnBlsT9mQ=; b=SP4tRLR8e4Jz0WA0vE4aCnIIHB
	BPh2uMTVO9HAxatG4dVO2bLOgt6EnX6Wh2+eeYxRtMz2FknuhxDbstMoWdmlYy4S6Y2e1vppqrmjS
	uPsIABptbX1f9o6XQ2rMwA7S0F0qLQGFoEWZ2uwFC6z/rLcC7TcCtciH0j8yLIhZGGrISOS/8HX1X
	cMASKfnOEN/tR/GndpqhYOEin3Hx5jbZZhmTjHcr233l8cPLcFAIHNtL8cFj++9JW9ogxP0BKBMPv
	T/Byo1jykAMgjthNIo35fdGbiwDXf84Js3OVC3stuo+bFGZolkkqITRAFPQJKPHDHUW5yEwSk/RMK
	TBS0aFQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDH4d-00000002754-0EEV;
	Thu, 16 Apr 2026 07:23:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDH4a-0000000274W-3Rov
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 07:23:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BBD72432C1;
	Thu, 16 Apr 2026 07:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A07C2BCAF;
	Thu, 16 Apr 2026 07:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776324215;
	bh=P+FuZfShs9iMgOTaMD//Wnw5a/RJh3BxiGbmdFf8F2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hnax644uwJyOxuWtqck9KnuRFgfIoxCSKmn1nw0fMp9pMA5zLajeWDZKvIhtbr3pd
	 CABfIrBIpEdvUKdnAfwjX/v8IYioe1XfBUQgAxtsqEb1GnNVdYM57Z4KBy5t1fkb2X
	 a4h6FvgRy7X/Zvt10dq6xwbuboN1siTqdKllss2K5wHn7Zf/Op5WYrBg6gvMdgU6zP
	 d2AphfduoHpFM45XrrHAsF4F4dLA/NuhfpsvSs10TM7CUbZoijJW8KtuEIevSRgdRH
	 We9+Sv/2S/zmbjixHgztR3SvjFu8/HEq1lHklAtsN5VErbmb+LlJwX8Vp/qNnik5sG
	 ysiMaVGQXujCA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wDH4X-00000004VI7-0XUG;
	Thu, 16 Apr 2026 09:23:33 +0200
Date: Thu, 16 Apr 2026 09:23:33 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm_pmu: acpi: fix reference leak on failed device
 registration
Message-ID: <aeCOdWLaVpH-5w8s@hovoldconsulting.com>
References: <20260415174159.3625777-1-lgs201920130244@gmail.com>
 <ad_WmuauLJ3xDKqh@J2N7QTR9R3>
 <2026041603-guts-crested-ef76@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026041603-guts-crested-ef76@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_002336_901044_71256554 
X-CRM114-Status: GOOD (  36.17  )
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

On Thu, Apr 16, 2026 at 06:40:55AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Apr 15, 2026 at 07:19:06PM +0100, Mark Rutland wrote:

> > AFAICT you're saying that the reference was taken *within*
> > platform_device_register(), and then platform_device_register() itself
> > has failed. I think it's surprising that platform_device_register()
> > doesn't clean that up itself in the case of an error.
> > 
> > There are *tonnes* of calls to platform_device_register() throughout the
> > kernel that don't even bother to check the return value, and many that
> > just pass the return onto a caller that can't possibly know to call
> > platform_device_put().
> > 
> > Code in the same file as platform_device_register() expects it to clean up
> > after itself, e.g.
> > 
> > | int platform_add_devices(struct platform_device **devs, int num) 
> > | {
> > |         int i, ret = 0; 
> > | 
> > |         for (i = 0; i < num; i++) {
> > |                 ret = platform_device_register(devs[i]);
> > |                 if (ret) {
> > |                         while (--i >= 0)
> > |                                 platform_device_unregister(devs[i]);
> > |                         break;
> > |                 }    
> > |         }    
> > | 
> > |         return ret; 
> > | }
> > 
> > That's been there since the initial git commit, and back then,
> > platform_device_register() didn't mention that callers needed to perform
> > any cleanup.
> > 
> > I see a comment was added to platform_device_register() in commit:
> > 
> >   67e532a42cf4 ("driver core: platform: document registration-failure requirement")
> > 
> > ... and that copied the commend added for device_register() in commit:
> > 
> >   5739411acbaa ("Driver core: Clarify device cleanup.")
> > 
> > ... but the potential brokenness is so widespread, and the behaviour is
> > so surprising, that I'd argue the real but is that device_register()
> > doesn't clean up in case of error. I don't think it's worth changing
> > this single instance given the prevalance and churn fixing all of that
> > would involve.
> > 
> > I think it would be far better to fix the core driver API such that when
> > those functions return an error, they've already cleaned up for
> > themselves.
> > 
> > Greg, am I missing some functional reason why we can't rework
> > device_register() and friends to handle cleanup themselves? I appreciate
> > that'll involve churn for some callers, but AFAICT the majority of
> > callers don't have the required cleanup.
> 
> Yes, we should fix the platform core code here, this should not be
> required to do everywhere as obviously we all got it wrong.

It's not just the platform code as this directly reflects the behaviour
of device_register() as Mark pointed out.

It is indeed an unfortunate quirk of the driver model, but one can argue
that having a registration function that frees its argument on errors
would be even worse. And even more so when many (or most) users get this
right.

So if we want to change this, I think we would need to deprecate
device_register() in favour of explicit device_initialize() and
device_add().

That said, most users of platform_device_register() appear to operate
on static platform devices which don't even have a release function and
would trigger a WARN() if we ever drop the reference (which is arguably
worse than leaking a tiny bit of memory).

So leaving things as-is is also an option.

Johan

