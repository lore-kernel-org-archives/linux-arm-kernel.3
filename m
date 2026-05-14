Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC09CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 17:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ft32a4Kp9YrDJUfDEEwkI/KlqZmYKhxCdaDhK6Fihmo=; b=GgLFh3UWs8OnKObWpz3KCDdemC
	Vc68aNmWE3+zsL+RSBjToopMqEraVdiaqWQDUMKNOW2SvWtyYNzE7zkBzWDMwP5iyPd7uDwDhT9Ep
	LoPIvVrQPm5Af0b0KBXH4xPpUWmMvC5F7QUA4wmxxdm232CH/SL+ravsBvjcP0DfnwtV7eWgfTKPN
	vV8j6rMAuPysGnkT5/Q6xYQJLhxx2y3Iv91GIzCqBQjG0rsCR5DUJGHD5uAjGF+jVnx+0Pk6akf+f
	D/bn/FT7aGIaz90pBi/LTjTjEuuUME5cvk5zOtkS6NviX5BIgJ033IQ8bjMAB6P5KU0dX061q577t
	J8t5rRFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZct-00000006Amq-23D0;
	Thu, 14 May 2026 17:13:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZcr-00000006AmC-0OBw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 17:13:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5538F40B3A;
	Thu, 14 May 2026 17:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC5AC2BCB3;
	Thu, 14 May 2026 17:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778778812;
	bh=4SFmX1YtXXz3aM4O+Q9tESg2mKpFKq2RahfzT5+gf2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oobo6iv9Xu3KUSPx5b1Hkkv9VFCWQhhlbx5n5ds2xPSXtJje7up252429U3YA8LN3
	 y1d02qRlasFusBlh/pwsLX84YNv31VxQFJW56TPOLHa60KsL0zI94uU1pok/CUUyvf
	 3qe5gtvX/D65+uQ2xScgXOHA+xjzYk/E8aCYnRzY=
Date: Thu, 14 May 2026 19:13:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
Message-ID: <2026051451-comfort-museum-4d2a@gregkh>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
 <2026051420-amusement-drove-73e6@gregkh>
 <agXL12bNh4gGyK1K@arm.com>
 <yq5ajyt65a5y.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ajyt65a5y.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_101333_151180_04BCAA9E 
X-CRM114-Status: GOOD (  20.54  )
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

On Thu, May 14, 2026 at 08:08:01PM +0530, Aneesh Kumar K.V wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> 
> > On Thu, May 14, 2026 at 02:55:48PM +0200, Greg Kroah-Hartman wrote:
> >> On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
> >> > On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
> >> > > Make the SMCCC driver responsible for registering the arm-smccc platform
> >> > > device and after confirming the relevant SMCCC function IDs, create
> >> > > the arm_cca_guest auxiliary device.
> >> > > 
> >> > 
> >> > There are a few changes squashed in to this patch. Please could we
> >> > split the patch in the following order ?
> >> > 
> >> > 1. Add platform device for arm-smccc
> >> 
> >> Do not make any more "fake" platform devices please.
> >> 
> >> > 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
> >> > it before the RSI changes)
> >> 
> >> No, move it to the faux api please.
> >
> > So should we end up with:
> >
> >   /sys/devices/faux/arm-smccc/
> >     smccc_trng/
> >     arm-rsi-dev/
> >       tsm/tsm0
> >
> >   /sys/class/tsm/tsm0
> >     -> ../../devices/faux/arm-smccc/arm-rsi-dev/tsm/tsm0
> >
> >   /sys/firmware/cca/
> >     realm_guest
> 
> But we need the ability to autoload different TSM backend drivers based
> on the support/availability of these SMCCC function-id ranges. faux
> device don't support that.

If you really need to "autoload" things, then do it like any other
normal bus or class does this, and send the proper uevents as needed.
Don't abuse the auxbus code for this please!

thanks,

greg k-h

