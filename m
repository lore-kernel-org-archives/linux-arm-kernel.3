Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B65C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wS7Gfn04Eu1i3oPxCjH/RuwxmV/hxIJiYf+5nVpOmkQ=; b=psAP2zllAxct+hFe0gIk73atii
	eilJYh5Zs5b6ayocyWfiolaOrRMriziGJmJWY4rWBuCM2281OfKhPAxHsoR3bM295OkKUx1bqxWa0
	n48/Gm8+r5JSWb2Stz7cWW8bOa5R5scNuO1Or4EP7629CnB0/mC1AJbtbpISRblwMY9j1Ub1cKqlL
	cd7pQhLtlTKdfEarixMdgrecZqk3uCAXASVJSTUk19yrpUKxNQ865WR52kcpTUVBlaWZ543FtUSP8
	p+eNn5qMHcONyWP7HX5MAXbuWDn8kThVZgcACxOlGKQRwCNElrx9oKvMEd4biTuslFMFq77FZJx0s
	ktCVyVnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2A8t-000000008tX-0WqG;
	Thu, 03 Sep 2026 16:18:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2A8s-000000008tR-0nuQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:18:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DDB04090A;
	Thu,  3 Sep 2026 16:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C657C1F000E9;
	Thu,  3 Sep 2026 16:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788452301;
	bh=wS7Gfn04Eu1i3oPxCjH/RuwxmV/hxIJiYf+5nVpOmkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hapvbcE5miOohbPIaPHvti3o0SLfqrEn9kxtZccj3wcWKS1kvKmc6oQwLpiLCqXz3
	 ParsSYzjftg5iTJdFDi2+5VQ2tGstV8pP1ZfszpbY27+LJ1PI+Za0MQ5zFi/94eDFK
	 ZsFh6v0p4hRyU6SPNr2d8V+cbvJ3fLo97rbe8NL2FXIIqoR1JdkSSPfCr1+4S4nZWc
	 4Q69Zf1lPYbK1WftJZhLOALG0C280aEAojQrB6wR2dLKzbEcCaY0qPvx6CQy4ww3ks
	 x3RaSgQRBwsSmjYdnBDzthX473BkWwKzCkcclT1s/Xo7JgWuD791VCNosLoRDO8wX4
	 24bXiF+otOWPw==
Date: Thu, 3 Sep 2026 17:18:16 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260903-nonchalant-capable-parrot-539c8b@sudeepholla>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-2-aneesh.kumar@kernel.org>
 <178794567779.4159892.8785590655735217125.b4-review@b4>
 <yq5ay0diyavw.fsf@kernel.org>
 <20260903125718.GI4157646@nvidia.com>
 <yq5av78mxv0j.fsf@kernel.org>
 <20260903154626.GL4157646@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903154626.GL4157646@nvidia.com>
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

On Thu, Sep 03, 2026 at 12:46:26PM -0300, Jason Gunthorpe wrote:
> On Thu, Sep 03, 2026 at 08:05:40PM +0530, Aneesh Kumar K.V wrote:
> > Jason Gunthorpe <jgg@nvidia.com> writes:
> > 
> > > On Thu, Sep 03, 2026 at 02:22:51PM +0530, Aneesh Kumar K.V wrote:
> > >
> > >> I have updated the bus to match devices using func_id.
> > >
> > > Did you have any thoughts on how to handle ARM's versioning scheme
> > > too?
> > >
> > > I'm not sure what the rules are but it seems like if the major changes
> > > then the API is incompatible? So shouldn't every driver advertise a
> > > supported major, and the major be in the modalias and checked by match
> > > too?
> > 
> > I expect a single driver to handle the RSI features and determine the
> > version range it supports. I don't think we want multiple drivers, each
> > handling a different major version of the RMM release. 
> 
> I thought the plan was we are only going to support RMM V2 and there
> will, never, ever be a V3. :) So RMM is maybe a bit different..
> 
> > Given that, wouldn't it be sufficient for the driver's probe routine
> > to check the supported version range and return -ENODEV if it is
> > unsupported?
> 
> It is sufficient, but is that what you want? Every driver needs to
> manually check these version things, do they? Do we want this
> duplication? 

Oh yes, we need this whatever you term as "duplication". I would argue
against terming it as duplications as if you look at the various SMCCC
based specification, we have zero consistency in how the VERSION command
is expected to work. The only consistency is returning
SMCCC_RET_NOT_SUPPORTED if not supported and that's the max a generic
SMCCC bus code can check. All other details need to be deferred to the
individual SMCCC drivers.

> Missing a check means FW upgrades might become Linux breaking.
> 

Are you referring to the SMCCC bus code or RSI in particular above. I don't
see any issue with SMCCC bus code check as that is the least we can do and
must not change with future versions of the firmware as well.


If it is specific to RSI and the driver supports v2.0 and the firmware
is upgraded to v3.0, it really depends on what the v3.0 firmware returns
in these 2 values:
Lower RsiInterfaceVersion : Lower supported interface revision
Higher RsiInterfaceVersion : Higher supported interface revision

If lower is also set at v3.0, then I would argue it is firmware upgrade
issue expecting old kernel with old RSI version supported to work. If
that returns v2.0, the driver must work IIUC. Aneesh, hopefully I got this
right ?

-- 
Regards,
Sudeep

