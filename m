Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF34D2F032
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 13:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujAXmtqN0m7PU5m13pPDd63FbkkfhcJq7ZyTMA6IvDE=; b=IYtQ0Lmo2EV9a17vgACJV13Y8J
	sPBuLtXs1sTgwVHzzp4mNWpk2/6wHq5sFFL8Fr0ZcdA1aUx8tRxyWRPGSm6SCXbGZF9L+MO1k5RvJ
	40ouaZX0iGWJFtalCPKK3OcvdBFaTd1JBmgKCu5AucHg0A0429m63Rulaw5cQ4X/jWaJeJi6biVS7
	xWMdhIvuKELpdTu1Ki/FD4/oAzy13El+sWTkKx0mDAZ8+Q+A5WAmT3EOgUNIUCeLVzlVWiIn/aInN
	IjMmsv+E5do8C2nPdvV1N8pwp1sKjVmFd4iL34zygeHvVsVT4JIaW7rf4yKQnFb1iD+iL53wGjnja
	+TeM9+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjTD-0000000EKsr-2Osd;
	Tue, 27 Jan 2026 13:51:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjTB-0000000EKs7-2TZp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 13:51:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A67F660097;
	Tue, 27 Jan 2026 13:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1E6C116C6;
	Tue, 27 Jan 2026 13:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769521860;
	bh=4xeMw3s+FAHTnao/LEHtNrxOifo5Sbu94YXUMTENOZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aroGooUaY+mOkwVNVfX7UarBOlPO4sSop88Kjyz4a0n3cyKJsbmX+rvzrEyn4QXju
	 GmkciJZ0+OtM0gl6aasRfglFdedw26hWKvYJLzwA143WnD0oicD3nKnPENTWhL0ONP
	 PRl4qF916KvUzFdbH24/nE+RJSb1YOUJSScbqbJI6jVOnL5H8ikntYch8YnRfAXOu0
	 WVh8UHvli4khLSPX9UWNJ0+s/Fc1dJZYyuBZoCQJHinPP/RbC0uBh44DKKkDcuSsMA
	 SNiBlP/eAKxUH5o8MJ/r69k6rN9M7o6/cGtygPf2qafVtX9QqsHirxHojeLk4RzVUw
	 uzUd3JcGd2RSA==
Date: Tue, 27 Jan 2026 13:50:54 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>,
	bhelgaas@google.com, joro@8bytes.org, praan@google.com,
	baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH RFCv1 3/3] iommu/arm-smmu-v3: Allow ATS to be always on
Message-ID: <aXjCvuBFCDBi7jUD@willie-the-truck>
References: <cover.1768624180.git.nicolinc@nvidia.com>
 <09cb6be1f8f7472a2f1ccab72154cc6e22cf570b.1768624181.git.nicolinc@nvidia.com>
 <aXdgljWHHPVMTmya@willie-the-truck>
 <20260126172020.GP1134360@nvidia.com>
 <0a60797a-fbb9-4a83-adc6-ad62baf5915b@arm.com>
 <20260126190935.GV1134360@nvidia.com>
 <aXi5W-7b2odQQtqy@willie-the-truck>
 <f08595ff-f36e-45cc-8ea2-dc678f59c7d9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f08595ff-f36e-45cc-8ea2-dc678f59c7d9@arm.com>
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

On Tue, Jan 27, 2026 at 01:26:02PM +0000, Robin Murphy wrote:
> On 2026-01-27 1:10 pm, Will Deacon wrote:
> > On Mon, Jan 26, 2026 at 03:09:35PM -0400, Jason Gunthorpe wrote:
> > > On Mon, Jan 26, 2026 at 06:49:07PM +0000, Robin Murphy wrote:
> > > > (assuming SSIDSIZE > 0 and it does anything at all - note that strictly we
> > > > cannot assume this bypass trick is *always* possible, since an SMMU is
> > > > permitted to support ATS without supporting SubStreams).
> > > 
> > > Yes, I think Nicolin has captured those conditions in computing
> > > it... We don't have a logic to disable bypass in that case though.
> > > 
> > > > > So, I think a CD table pointer to a fully invalid L1 table of at least
> > > > > size 1 should be OK?
> > > > > 
> > > > > Or stated another way, why would ie be OK to have a 1 level table with
> > > > > an non-valid CD table entry for SSID0 but not OK to have a 2 level
> > > > > table that returns non-valid at the first walk?
> > > > 
> > > > S1ContextPtr itself is reachable since S1 is enabled, so it cannot point to
> > > > nonsense. But the S1DSS==Bypass behaviour does state:
> > > 
> > > > "Note: Such a transaction does not fetch a CD, and therefore does not report
> > > > F_CD_FETCH, C_BAD_CD or a stage 2 Translation-related fault with CLASS ==
> > > > CD."
> > > 
> > > Yes
> > > 
> > > However, taken together:
> > >   * S1CDMax is set to substream 0 only
> > >   * S1DSS is set such that "does not fetch a CD" for SSID = 0
> > >   * SSID >0 doesn't fetch CDs because of S1CDMax
> > > 
> > > Then it seems to be saying that it will never use S1ContextPtr? ie it
> > > is IGNORED?
> > 
> > Right, I think the critical question is whether that setting of S1DSS
> > (0b01) means that STE.S1ContextPtr is considered "invalid". The spec
> > doesn't call this out explicitly but the "translation procedure charts"
> > seem to indicate that it doesn't use the CD for anything...
> > 
> > It would be good to get some clarification from Arm about this
> > particular case.
> 
> No, STE.S1ContextPtr itself is "valid" since S1 is enabled. No CD fetch will
> occur for no-SubStreamID transactions that are bypassed by S1DSS, but the
> SMMU is permitted to attempt to speculatively fetch CDs for the enabled
> SubStreamID(s). Those fetches do not have to reach a valid CD if the
> SubStream is not actually in use, much like we don't have to fully populate
> a 2-level Stream table for StreamID ranges we don't care about either.
> 
> Don't confuse S1DSS==1 (bypass) with the S1DSS==2 behaviour we use in other
> cases - the latter is "Use CD 0 for no-SubstreamID traffic" which makes
> SubStreamID 0 invalid to use. However in the bypass case (and also S1DSS==0
> where no-SubstreamID traffic is blocked entirely), SubStreamID 0 remains
> perfectly valid and usable (we just still won't ever use it in Linux due to
> the middle case).

Argh, I had conflated a transaction using SSID 0 vs a transaction
without a substream at all. So I think this makes sense now...

Thanks,

Will

