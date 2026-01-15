Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1542DD46600
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 17:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pE3qWF6YTcPK9VGq+bunUsxcfC0Ou8ODrwNufKWfak=; b=g8u4UcjYoXbb2+ysc56bkFiVYa
	OwhnbWtmqrdzCcTD2JQvU4lVOzMHloYhMKex9x0ragnUNZzNtMo/xjr0JcfQJHf7upDR4G8ekmaFE
	tjFftoQejQrdhSMqYkp+0W/MYTcBa28EXW72RWvuMSGuwCP6Ogt+4/QBR/gKWHrGtCLkl52mCE/Zu
	uYur7a69I3+MXvQcPRC378k02Bc+1J1+Wv8UbSHg9BzLJA4rwqlcfYLhHtppc0/ydoAgPEPXti9od
	Z4xaBA8LZ85KSGrnc/7l5u6VNLEGab/klSyLRQaVdZCcXMfNDcKdGMewYSeE0oGsuhmtudvt43c8Y
	OXG4ai/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRJz-0000000Creg-24H6;
	Thu, 15 Jan 2026 17:39:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRJy-0000000Crea-3lkG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 17:39:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E3E06015E;
	Thu, 15 Jan 2026 17:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F44AC16AAE;
	Thu, 15 Jan 2026 17:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768498785;
	bh=a6/X1t8L0qNQd5yg44gvVji3t1zPDsjlgcQE1oWRzPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=insltMEpWD6PLV8h8pViaGhH1c14y2bvOlACnYGLmDNzxsVGB9oPiTg3wd1c9zveL
	 ClmFMJlW2V7hUF0Ci3DV22lK+ndP60Bk9/Uv6u3ucj1PSrPZVyY2+vnnI6PIJwBTHj
	 VJ/EahRk84rF2jr0bFP2YUFJzBnX9LUv/HfisDZIVlcppoEbUHl/FI/zpAQcZjpa+u
	 JHjGdCDLAamVp3jF0AKiaWYPVadUK2oAjbJF7uWd24t0PiRLy99c623fZkLxUDEkz4
	 aPhnH12YLAHczc0tdG57myQCmLl9UZt6ms2m/DQkw30GDOa7jXqTXLCfl1zz3IATov
	 YlVGESyPjRs+Q==
Date: Thu, 15 Jan 2026 17:39:40 +0000
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	praan@google.com, xueshuai@linux.alibaba.com, smostafa@google.com
Subject: Re: [PATCH rc v5 1/4] iommu/arm-smmu-v3: Add update_safe bits to fix
 STE update sequence
Message-ID: <aWkmXO2GBj00AVwy@willie-the-truck>
References: <20260112161010.GC812923@nvidia.com>
 <aWVETpwlx9Rhs8Kw@Asurada-Nvidia>
 <aWZfUNXEka3GBf9s@willie-the-truck>
 <20260113161253.GG812923@nvidia.com>
 <aWarF90zBqxD0Gef@Asurada-Nvidia>
 <20260113205112.GJ812923@nvidia.com>
 <20260115131151.GA1081267@nvidia.com>
 <aWkU4a1wj5jsWFev@Asurada-Nvidia>
 <20260115162919.GG961588@nvidia.com>
 <aWkXIyvmPiJoyRtf@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWkXIyvmPiJoyRtf@Asurada-Nvidia>
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

On Thu, Jan 15, 2026 at 08:34:43AM -0800, Nicolin Chen wrote:
> On Thu, Jan 15, 2026 at 12:29:19PM -0400, Jason Gunthorpe wrote:
> > On Thu, Jan 15, 2026 at 08:25:05AM -0800, Nicolin Chen wrote:
> > > On Thu, Jan 15, 2026 at 09:11:51AM -0400, Jason Gunthorpe wrote:
> > > > On Tue, Jan 13, 2026 at 04:51:12PM -0400, Jason Gunthorpe wrote:
> > > > > > -       safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_EATS);
> > > > > > +       if (!((cur[2] | target[2]) & cpu_to_le64(STRTAB_STE_2_S2S)))
> > > > > > +               safe_bits[1] |= cpu_to_le64(
> > > > > > +                       FIELD_PREP(STRTAB_STE_1_EATS, STRTAB_STE_1_EATS_TRANS));
> > > > > > --------------------------------------------------------------------------
> > > > > > 
> > > > > > @will, does this look good to you? I can send a v7 with this.
> > > > > 
> > > > > That is an easy way to address Will's observation, makes sense to me.
> > > > 
> > > > Ah, but it looks like it can generate an errant view of a EATS that is
> > > > neither old or new. Ie value 3, reserved.
> > > > 
> > > > I think you should just check if old or new has EATS bit 1 set:
> > > > 
> > > > if (!((cur[2] | target[2]) & cpu_to_le64(STRTAB_STE_2_S2S)) &&
> > > >     !((cur[1] | target[1]) & cpu_to_le64(FIELD_PREP(STRTAB_STE_1_EATS, 2))))
> > > > 
> > > > Which the current driver never does..
> > > 
> > > The EATS field is completely controlled by the driver. So, we are
> > > safe for now, right?
> > > 
> > > Should we add this when the driver has the actual support for the
> > > split stage thing?
> > 
> > If we have figured it out now I would add it because it would be a big
> > leap to think the next person will remember about this detail..
> > 
> > But yes, this and the S2S thing don't effect the driver as it is now,
> > it is just doing work to help future people.
> 
> OK. Let's add that.
> 
> I will send the v7 by the end of the day. Hopefully, Will is okay
> with all of these..

Sounds about right but I'll wait and see what you post.

Will

