Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0AAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8auU58LgAXdY4hWCl6wHaE8gXHNNTt7g9BcuB3xl/A=; b=JbEscPZOyrlokQWDqC1uemgCXg
	iJ3xyunoY6TQs6ipCrrYLwhJAJITddO2+mV0NRWrEMySIxzbwBw4uoWeq40LXiFOvd/etj8T83WlC
	QWCDtqLtouZT5CzZx+T0yr7pNw4d4Akj0cKzKk/JbgQcc3HfnBngsk7hh15wagdeB9DcE5uZsuL6m
	urAM0FbKfBzwvsAnjhlzYwZ8hbh76IJQLAd1VoW7f9TH64YicGrw14jlJM0Fmsm1DeFwpqa16quop
	fvZn88SbsP9r2nZlU06hzmmq10HxBRVtCgO/nkIHypCKQivrkJ8TYZUF6pr1OuGIfgZYwQrBd2Q7m
	5GoDcXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYuA-0000000HDSw-0vJe;
	Tue, 30 Jun 2026 13:53:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYu9-0000000HDSm-2E22
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:53:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F1F6841092;
	Tue, 30 Jun 2026 13:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12051F000E9;
	Tue, 30 Jun 2026 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782827616;
	bh=L8auU58LgAXdY4hWCl6wHaE8gXHNNTt7g9BcuB3xl/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OB3f2+qOmRlqlAGoNAuNbUTF/wGc94sX4j0dhQaK0hp4KClwPMcoDtyij1m4QI+uw
	 7UIMIErKIwNYqmN/5ZFXwBHFquX/hrqbfTO0wriPqz0XN3WMC9syVtKDWc5PD93URW
	 hON1xtFS5ALZ8eo0xAUfiEDad5rGxYTsiHIqfykre4fvR4ZN8N4m4u3hYvyAG1x/S2
	 ttGmquaYzMsPbQr5aIP7Xr/ab3feOSwb6L0EF9HWA+JpTQeMy3qjy4zFwuWG5Y4+yT
	 dt07mdNe0B/F8Ec6PqL/wvDdCLLqe+balCtUx+FBmjNUn4AAc6hH1Xdeqnv4YMyMC7
	 Uwlc2bAjlkqzg==
Date: Tue, 30 Jun 2026 14:53:31 +0100
From: Will Deacon <will@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>
Subject: Re: [PATCH v4 0/2] arm64: errata: NVIDIA Olympus device store/load
 ordering
Message-ID: <akPKWxYxDvLGVfQx@willie-the-truck>
References: <20260625182425.3194066-1-sdonthineni@nvidia.com>
 <381fb71c-0a2c-4dec-98a3-56ad88e190c6@arm.com>
 <ba15e106-9066-4e55-be2f-6767a32e123d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba15e106-9066-4e55-be2f-6767a32e123d@nvidia.com>
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

On Mon, Jun 29, 2026 at 06:08:37PM -0500, Shanker Donthineni wrote:
> On 6/29/2026 5:45 AM, Vladimir Murzin wrote:
> > That's interesting. With the way the patch set is structured, it
> > now looks like:
> > 
> > 1. Fix the erratum, but cause a performance regression.
> > 2. Restore the performance regression and (re)apply the erratum
> >     workaround.
> > 
> > Would it make sense to avoid introducing the performance
> > regression in the first place by structuring the patch set
> > slightly differently?
> > 
> > 1. (Re)introduce arm64 memset_io()/memcpy_toio().
> > 2. Fix the erratum once for all
> > 
> > What do you reckon?
> 
> Yes, that ordering makes sense.
> 
> I can restructure v5 so that patch 1 introduces the arm64 memset_{to}io()
> implementations while preserving the existing behavior. Patch 2 will
> then add the complete erratum workaround, including the conditional
> trailing DMB for those block-write helpers. This avoids introducing
> the intermediate performance regression and keeps each commit
> independently usable.
> 
> Will and Catalin, could you please share your thoughts on this approach?

tbh, I think I'm ok with the current ordering. The second patch is purely
a performance thing for affected CPUs, so doesn't strictly need to be
applied or backported for functional correctness afaict.

Will

