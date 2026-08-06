Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7283BC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 13:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mW/OuZ6mDAqPwiWKjJo6a74gpl79w+/96YfJnOrsAnE=; b=WeNs3Ert/ndN8pk3YrN8YEOG2o
	ThJA/6SnKVCEFvm9YHrcZtkCVO6esIEPkv5Gs0/7S84/biDUCiTos/1Otnmbbx3P3ouTWFCKdihBE
	W2S8L95oqzY4SEbRe6pRhza3XIINb1mbqizQRaXKnE9czG1NYLf6ojbgdEi/i6iDx0mw0XAB3k39B
	gnd9C3AXRMiDIdkzR0Nc2/9tC/YnkvYqCieYRFxBMFdFVbuQIDTsP8TpyyYHydWyRt+dHQdgSON08
	OCcSNilz14dUbbNdfEqGcv/As3SNGvj82UpO3ouzn3RembN/vrHKoI7er7H7nJIHurGjhhF8aUbte
	otVrCvWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxi9-00000005q20-1BI8;
	Thu, 06 Aug 2026 13:00:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxi8-00000005q1t-03sh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 13:00:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F325B60A96;
	Thu,  6 Aug 2026 13:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E551F000E9;
	Thu,  6 Aug 2026 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786021234;
	bh=mW/OuZ6mDAqPwiWKjJo6a74gpl79w+/96YfJnOrsAnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a86oeqp4RR3VHaJpTt4R9aiSI/uw/jdngWhLSd2xywYg+BiVfBYpQynxbLq654MRU
	 O0eRadyZulK73laweC/FpAtNgiIJQgHJdJFnaHTBjNnrblMOj60N2M91wUg+g7OVJC
	 B4v0KVk4P2V+RwWdSjexPi1bzKlWMRWkXQW82wlZvdWz78EIedX7kjxAroGNoiUiXc
	 8UURMYbrxTSFLK0DK7TKkezyaLdUnMTb3RgxoF0XMEi71Vf5TPw1FXBvR0dTbh/aq6
	 jBlYPIfOnCUn+I37wjoXKkbxkUDieYBRJQdFx3yC3uPNcmDt8xci5B52/40FIT3qM0
	 JoNnwfn81OOKQ==
Date: Thu, 6 Aug 2026 14:00:28 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Kiryl Shutsemau <kas@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Pranjal Shrivastava <praan@google.com>,
	Breno Leitao <leitao@debian.org>, Kyle McMartin <jkkm@meta.com>,
	Usama Arif <usama.arif@linux.dev>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iommu/arm-smmu-v3: Shrink command/event/PRI queues in
 kdump kernel
Message-ID: <anSFbIHnigVt_3bJ@willie-the-truck>
References: <20260706084708.8072-1-kas@kernel.org>
 <amiBagGKn-Aym1DK@willie-the-truck>
 <amiz6GQZ-XGlH706@thinkstation>
 <anHxBh-xGW9JXsa4@willie-the-truck>
 <20260804141704.GB27883@nvidia.com>
 <anINkO1l9Kz8lTVh@nvidia.com>
 <20260804161918.GG27883@nvidia.com>
 <anIXDd839UC/M2n/@nvidia.com>
 <20260804165905.GH27883@nvidia.com>
 <anIjwUVvfWOb9xa4@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anIjwUVvfWOb9xa4@Asurada-Nvidia>
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

On Tue, Aug 04, 2026 at 10:39:13AM -0700, Nicolin Chen wrote:
> On Tue, Aug 04, 2026 at 01:59:05PM -0300, Jason Gunthorpe wrote:
> > On Tue, Aug 04, 2026 at 09:45:01AM -0700, Nicolin Chen wrote:
> > > On Tue, Aug 04, 2026 at 01:19:18PM -0300, Jason Gunthorpe wrote:
> > > > On Tue, Aug 04, 2026 at 09:04:32AM -0700, Nicolin Chen wrote:
> > > > > On Tue, Aug 04, 2026 at 11:17:04AM -0300, Jason Gunthorpe wrote:
> > > > > > On Tue, Aug 04, 2026 at 03:02:46PM +0100, Will Deacon wrote:
> > > > > > > > Would skipping their allocation when is_kdump_kernel() be acceptable on
> > > > > > > > its own, or would you rather see it done differently?
> > > > > > > 
> > > > > > > With Nicolin's patch, we can just avoid allocating the priq and the evtq
> > > > > > > entirely in the kdump case. We can then add a cmdline option to control
> > > > > > > the maximum size of the cmdq, which is useful regardless of kdump.
> > > > > > 
> > > > > > I would still prefer kdump do this re-sizing automatically, even if we
> > > > > > do add a commandline. It makes it easire to deploy than having to know
> > > > > > secret command lines :\
> > > > > > 
> > > > > > So functionally I still think this patch is fine, though yes it points
> > > > > > out more things in Nicolin's work too.
> > > > > 
> > > > > I will send a v10 of mine, to skip the EVTQ/PRIQ allocations.
> > > > 
> > > > I think Robin's point is to structure the v10 so you introduce a bunch
> > > > of tunables, including something like 0 size to disable a feature.
> > > >
> > > > Then have kdump default those tunables to the right thing
> > > 
> > > But in kdump, EVTQ/PRIQ are disabled, so my series should have
> > > skipped their allocations regardless of the tunables.
> > > 
> > > So, I think the tunables can be done in a separate series. And
> > > its use case might not be confined to kdump?
> > 
> > I think the ask is to do the tunables first and change your series to
> > default the tunables instead of doing direct kdump overrides.
> 
> You mean the driver can override the tunables to 0 in kdump mode,
> right?
> 
> Well, we are skipping a lot of things in kdump mode already; it's
> a very small change to skip EVTQ/PRIQ even without the tunables.
> 
> If Will prefers this merging sequence, I wouldn't mind changing my
> series to overriding the tunables.

I was thinking that the tunable would only apply to the cmdq. We can extend
it later if necessary, but since we're not going to enable the evtq/priq
in kdump mode at all, I don't think we need tunables for those atm.

I probably wouldn't make a size of 0 disable the queue, either. Have a
minimum size of a page or something like that.

Will

