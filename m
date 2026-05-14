Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D264CCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 13:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DX5b1CsjcgHXIXtt3Qhe9sQ6MCkR09t/5i6hqSQr34k=; b=E/2tQ2pv9pWL1dpmy84YFZ2THZ
	hXU9eS+t6GjnFozkLCEqgFAocV9Yb2djNFH2Sb0wgt2SSjZ3hucYxB2Q4067X2gMw7RflIvBkE/JU
	hi85FY1mC1f4TVfI1Lbekq3rwFIEBqvgS0My0L5tZa9sx8F168L1NtnsiZPifYrl60WQOvGsw55yd
	nK/YWf38vjsJD3h9HIWNdhBoPWojIvN+oPjw9204gbsg4yncUql+8xv+w7rvAdhl335/HUV40KYNh
	X4VRHyBPPW4T6u+A87uAnHIfi/YVjJxOhmsY1XMGXOqCjhhoqM9WRc4UcAf4W/ImYuQ645thggUQK
	YBkJx26A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNW4B-00000005b4F-2uzn;
	Thu, 14 May 2026 13:25:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNW4A-00000005b3w-3Bzu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 13:25:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB2C060008;
	Thu, 14 May 2026 13:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5C9C2BCB3;
	Thu, 14 May 2026 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778765129;
	bh=ulvgFg4I9zSaMwz7wledEYXjpK13Lp8Du0yVblLwaFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sUDZdsT49F3H4o4qXneQukxv8TbyR0l2UU/Q12k2y3GXhcoX/xAy2MFgs0+wzmGaR
	 mwlITCJKMQFiuYiD7iq0yxCP7FyB40/uOHZnVQnBmEQi4CGDl8btVLja6XtI1zF/4j
	 fwEnt/y7j7cTfQth12a7q3sK6vK0tHDwLFGLNhfk=
Date: Thu, 14 May 2026 15:25:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
Message-ID: <2026051445-magician-coffee-962f@gregkh>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
 <2026051420-amusement-drove-73e6@gregkh>
 <agXL12bNh4gGyK1K@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agXL12bNh4gGyK1K@arm.com>
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

On Thu, May 14, 2026 at 02:19:19PM +0100, Catalin Marinas wrote:
> On Thu, May 14, 2026 at 02:55:48PM +0200, Greg Kroah-Hartman wrote:
> > On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
> > > On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
> > > > Make the SMCCC driver responsible for registering the arm-smccc platform
> > > > device and after confirming the relevant SMCCC function IDs, create
> > > > the arm_cca_guest auxiliary device.
> > > > 
> > > 
> > > There are a few changes squashed in to this patch. Please could we
> > > split the patch in the following order ?
> > > 
> > > 1. Add platform device for arm-smccc
> > 
> > Do not make any more "fake" platform devices please.
> > 
> > > 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
> > > it before the RSI changes)
> > 
> > No, move it to the faux api please.
> 
> So should we end up with:
> 
>   /sys/devices/faux/arm-smccc/
>     smccc_trng/
>     arm-rsi-dev/

What types are these child devices?  Also faux ones?

If so, great.

thanks,

greg k-h

