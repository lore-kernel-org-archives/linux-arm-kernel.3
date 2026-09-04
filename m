Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43428C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4UqD37F/+LGYdguYZm7WUWkNiEkiZsn2JXNXp9ga54=; b=hdmENeYWMn5N9zDkbNteh5L6SL
	PtXm17/eDQY39KwToXJ/Q8X0D8O4bHcyqLKbfsQAQdgo/YO1W7DZufAWCMUC1613K4qkqjCpD/TiH
	1HUGFFx+6LWXYQJHh7GkfIHbFzYsbZgkEhGzoNow1bueZzyN0aSUqchbrTu4XgbTjkGP0hTJ/peor
	AR1CS9g4hccd8mCfujjCCVJWQGNCiWLcpedhoFoYWw/OFpv0VwZSwF87V/bL4l6VnwGJOqdKpzdhO
	lQDsgnhIiffpFeieekWJ6WEOUIVPiBjYgBEugwRJ2RexCqmJXQvn2Ro65/A/uGROMDiMy62IffMxj
	XJ1tECew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UtD-00000002NYy-14m5;
	Fri, 04 Sep 2026 14:27:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UtB-00000002NYj-1vxY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:27:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A3115600C8;
	Fri,  4 Sep 2026 14:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4671F00A3D;
	Fri,  4 Sep 2026 14:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788532052;
	bh=c4UqD37F/+LGYdguYZm7WUWkNiEkiZsn2JXNXp9ga54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CdflBeY1jJv/qUAGrU3S7KwA+iVY1KKJ4hPP9T7O0mj390x2owhqKHvofCMBh+wS+
	 aRUTUpORPhCXOtmyYOgxG+ARPwIudHVDH3mSE5GkhkcbctaqBPoJ45gM8M9ThDsb4M
	 nD6v4FTfJAmAFRfOosBgo5HWScHSAWmiG7q0b7SPApol1HHA8563YoCWShUMvgFK9F
	 XTYue0ff0ZTWhutCfIjGg4LmT3t4w+1E/OUGx6vxNCengvE1lC4QzlQwYRXNWjh2R4
	 2KVRko+H11GpKXXod5t+d3M0jjSx6tHaJaEC+UO1ax6bK8c5Dxx5JkShgGmre6KwyF
	 WNWJM09mtsEJQ==
Date: Fri, 4 Sep 2026 15:27:27 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org,
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
Message-ID: <20260904-imperial-partridge-of-atheism-bafcb3@sudeepholla>
References: <20260805063255.1638614-2-aneesh.kumar@kernel.org>
 <178794567779.4159892.8785590655735217125.b4-review@b4>
 <yq5ay0diyavw.fsf@kernel.org>
 <20260903125718.GI4157646@nvidia.com>
 <yq5av78mxv0j.fsf@kernel.org>
 <20260903154626.GL4157646@nvidia.com>
 <20260903-nonchalant-capable-parrot-539c8b@sudeepholla>
 <20260903182152.GN4157646@nvidia.com>
 <20260904-keen-fiery-fulmar-702fb3@sudeepholla>
 <20260904135353.GQ4157646@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904135353.GQ4157646@nvidia.com>
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

On Fri, Sep 04, 2026 at 10:53:53AM -0300, Jason Gunthorpe wrote:
> On Fri, Sep 04, 2026 at 11:02:56AM +0100, Sudeep Holla wrote:
> > > It means you can never publish a version 2 that is ABI breaking
> > > because linux doesn't check for that. Was that ARM's intention with
> > > the version API? It's basically a completely pointless check that
> > > doesn't effectively do anything.
> > 
> > I didn't get that. The example above checks for minimum TRNG version,
> > so it won't break in any way for v2. What am I missing ?
> 
> If ARM sticks to what they have done in other specs, a V2 could define
> ABI that is not compatible with V1 at all. (semantic versioning and all)
>

Ah got it. I agree with you on their pattern of breaking compatibility
but things are improving, I won't say we are there yet.

> So the kernel check above will happily pass a v2 interface and then
> send garbage into the incompatible ABI.
> 

Ah that is possible, yes I can't disagree.

But I must say it is improving as the firmware teams implementing newer
versions run the existing kernel and spot the issues quickly if anything
is incompatible if the spec hadn't broken it intentionally.

> The ecosystem couldn't accept this. An ABI breaking V2 can never
> exist, so the versioning is much less useful that a normal semver
> scheme.
> 

Completely understood.

> If it was MAJOR(version) == 1 then it might make a little more sense.
> 
> I'm saying that broadly none of this version stuff seems to be doing
> much useful work. Even the more complicated RSI lower/uppper stuff was
> not good enough and they are going to follow a new scheme.
> 

Really, that's news to me.

> I think the bus is a nice idea! If you keep going down that logical
> path the next stop is to have a SMCCC that discovers the FW ABIs
> available. That would be a good moment to take a pause and try to set
> a versioning system standard that actually works consistently for the
> entire ecosystem.
> 

Yes agreed. The only argument I had is for the existing users whom we are
fitting into the SMCCC bus like TRNG. But we need some agreement on the
spec consistency if we need to do anything more smart in the core SMCCC
bus code.

> IMHO to lean into the bus design I would have a discovery SMCCC that
> returns a list of supported ABIs, something like (spec, spec version,
> ABI, FID, feature supported bitmap).  There could be overlaps if the
> FW supports several ABI incompatible versions, like RSI v1 and RSI v2.
> 

But then we will have to wait for that discovery SMCCC ABI first and that
mean how will it work on existing deployed systems ? But I like the idea.

> Then you do a driver search and the strongest match sees the bus code
> issue a "set SMCCC" that says 'I picked index #3 behave like that
> please' and then the actual SMCC driver would use a features scheme to
> further fine tune things.
> 

I don't know if I got the details right but I get the overall idea here.

> Instead of versions you have ABI's and feature bits describing what is
> supported. This is far closer to how the HW interfaces ARM designs
> tend to work, and is much more aligned to how I understand RMM is
> going.
> 

Indeed, I prefer this and get mad if new features are added without
feature bits. Version for me is just for rough indication that ideally
these features must be 0 on a version X but it shouldn't matter for
the software that purely relies on feature bits. So a big yes for that
idea and I think some specs and in some form are doing it. I can't
recall specific but I have seen it. We just need push only for that
in future specs.

> It could be consistent and layer on top of what you have now without
> ABI breaking anything.
> 

Completely agreed!

-- 
Regards,
Sudeep

