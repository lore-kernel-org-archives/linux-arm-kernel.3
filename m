Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37ACCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 17:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPj9J1X7eyw53jt5WZspLXe//R8OFWHajtSNq/gOv4o=; b=RlBK0m8livFVM6uTBBEYGt0rlB
	pDdw2h/J45TKr7YlOarnEXk+YajgwtCKYjAwU8brdDnAnfmG59cblDk9FqHnWKPL6ohAxBd8rAiGY
	+c7LayRi9MmozDTX6vevkd4Sf9ObCTzF+BYaNZXtcJ4No9m39g/HWLNl6czEZF0gLLIZD8u54J34H
	JxPDG+jf380uxk46bxx7KMcBrZiIlfGLahpn2DqcZ+Ws5hUbRV/iTMGiBc/puOUkYJM2Ck1QuX5L7
	1HQijMC08DT9NE7U62MarRo1G3/ndPcoMbYRRcLlyG3nYe41OlPyLgeOjzpQwasS2dXOJfD4MKY6/
	dECl8RPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZe6-00000006AyJ-2qak;
	Thu, 14 May 2026 17:14:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZe5-00000006Axt-2HRt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 17:14:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ECCA560132;
	Thu, 14 May 2026 17:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3129EC2BCB3;
	Thu, 14 May 2026 17:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778778888;
	bh=lnMo7v72zKFu0y5mB8UTk6zkeqM8ivoNe5mhWgmpWJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T0VQQMoSq4qeiV+RKPVYcmqx/kdov6X/u7Zmn4OdaEJ+/hDjgWMZoieDA3RFytw9F
	 irelPH8A3CnpAnl3ZdvzhJo9klRwnWxvyq64BIBbJbzJd/YDYBo9FSjEsORKOMgXDj
	 gre+RlIDYWD5+RT7+NcLJuNxFpqBEbL+P8doJAvs=
Date: Thu, 14 May 2026 19:14:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
Message-ID: <2026051404-headboard-cabbage-e09a@gregkh>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
 <2026051420-amusement-drove-73e6@gregkh>
 <yq5alddm5a6w.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5alddm5a6w.fsf@kernel.org>
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

On Thu, May 14, 2026 at 08:07:27PM +0530, Aneesh Kumar K.V wrote:
> Greg KH <gregkh@linuxfoundation.org> writes:
> 
> > On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
> >> Hi Aneesh
> >> 
> >> On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
> >> > Make the SMCCC driver responsible for registering the arm-smccc platform
> >> > device and after confirming the relevant SMCCC function IDs, create
> >> > the arm_cca_guest auxiliary device.
> >> > 
> >> 
> >> There are a few changes squashed in to this patch. Please could we
> >> split the patch in the following order ?
> >> 
> >> 1. Add platform device for arm-smccc
> >
> > Do not make any more "fake" platform devices please.
> >
> >> 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
> >> it before the RSI changes)
> >
> > No, move it to the faux api please.
> >
> 
> 
> Maybe I was not complete in my previous reply. I did not want to repeat
> the entire thread, so I quoted the lore link for more details.
> 
> 1. We have platform firmware-provided SMCCC interfaces. Based on the
> support/availability of these function IDs, we want to load multiple
> drivers.
> 2. This patch series adds a platform device to represent the
> firmware-provided SMCCC resource.
> 3. Different SMCCC ranges are now represented as auxiliary devices.
> 4. Different subsystems, such as TSM, can autoload their backend drivers
> based on the availability of these SMCCC ranges, which are now
> represented as auxiliary devices.
> 
> You had agreed to all of this in the previous discussion here:
> https://lore.kernel.org/all/2025101516-handbook-hyphen-62ec@gregkh

Then why did someone say "this is a fake platform device with no actual
resources"?  That's what I was triggering off of.

Again, if you have actual platform resources, GREAT, use a platform
device and aux.  If you do not, then do NOT use a platform device.

totally confused,

greg k-h

