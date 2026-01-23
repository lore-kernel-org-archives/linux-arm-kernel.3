Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFA1D7789E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 17:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/GIgI3H6N7By0zmQzJ1ShQOzer3L8f1EVXd7hbBqLg=; b=3Wf3ZJ1IyqXVq2QnOIpgW6zNRY
	q0TQ4T8fwy+Xjd5qvMxqHk8RFTPSg95DvB36ij7Ww50wry/sdTbpWOw6eQyDwoVSkzz0f2zAkDmrm
	SKI2VTvSnnyP4yOQacj0er/GeypOM5tHK8Q93PN7LogptPK7X7DO6ylgz0Z9/IEPxaAhG/V8eoXtR
	H5PLh8GeOk7l+MwN3mFRU3fQ1dVHRs5Iz6ccB2uFPMw5bgpar5YT+BPDtrFUJ4DvBlVINNYl2f/mJ
	cnkkkCRCJfT7rJSnuhEVWAm5y5zXT/0Xe9Gyh9x9NwE5tXqHk9reEGJPiVtavspFAB8CVxYGTGYTU
	624B/OAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLKC-00000009Jm3-20hP;
	Fri, 23 Jan 2026 17:52:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLKB-00000009Jlw-0mOX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 17:51:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A45C601DC;
	Fri, 23 Jan 2026 17:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB979C4CEF1;
	Fri, 23 Jan 2026 17:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769190718;
	bh=hvF0TEDnYwT7/9fDIPj1Uln1puS77Z3p/8YlfCj6ZKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1O3Tr00NjhkWBu2cym1RRPv0vh+e8ksJSG1tfk30d9wnpWW2NL6H1TU0sXlYeXPD
	 zIYT0vKx88QYOw2XOmY9pdrxdJTkaPCHFkrpJQwD5DTXytUDKY/xkYjilu6NlHpNbv
	 ybh0YF7ZovMl8TU0tfqC9Ms0y/4CR53jkvgiQkLlNvLGfPw2HzP945qYoSooRk+fM3
	 AN6B1bC8dSuyl+skcUOQRp/BAy6lnEeYlpysrRWKVzN6k+zOSrK+ElZJxm4QlBSqeC
	 kkTl1zkifyMZDUOnNWVwL8vsA5O5jyCjD1rNCoace0QnHHMdbGv6JowIJDE0CNpw98
	 PBDDw3INvJ7zw==
Date: Fri, 23 Jan 2026 17:51:52 +0000
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jean-philippe@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
	jgg@nvidia.com, balbirs@nvidia.com, miko.lenczewski@arm.com,
	peterz@infradead.org, kevin.tian@intel.com, praan@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/7] iommu/arm-smmu-v3: Introduce a per-domain
 arm_smmu_invs array
Message-ID: <aXO1OLrOsCkep3V8@willie-the-truck>
References: <cover.1766174731.git.nicolinc@nvidia.com>
 <8c94c5194871ee1a0f3a6b49e18818b88f51226d.1766174731.git.nicolinc@nvidia.com>
 <aXOpzjkAgODnh2HU@willie-the-truck>
 <aXOxfi8ZQAkr4zHU@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXOxfi8ZQAkr4zHU@Asurada-Nvidia>
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

On Fri, Jan 23, 2026 at 09:35:58AM -0800, Nicolin Chen wrote:
> On Fri, Jan 23, 2026 at 05:03:10PM +0000, Will Deacon wrote:
> > On Fri, Dec 19, 2025 at 12:11:25PM -0800, Nicolin Chen wrote:
> > > +struct arm_smmu_inv {
> > > +	struct arm_smmu_device *smmu;
> > > +	u8 type;
> > > +	u8 size_opcode;
> > > +	u8 nsize_opcode;
> > > +	u32 id; /* ASID or VMID or SID */
> > > +	union {
> > > +		size_t pgsize; /* ARM_SMMU_FEAT_RANGE_INV */
> > > +		u32 ssid; /* INV_TYPE_ATS */
> > > +	};
> > > +
> > > +	refcount_t users; /* users=0 to mark as a trash to be purged */
> > 
> > The refcount_t API uses atomics with barrier semantics. Do we actually
> > need those properties when updating the refcounts here? The ASID lock
> > gives us pretty strong serialisation even after this patch series and
> > we rely heavily on that.
> 
> But we can't use that mutex in the invalidation function that
> might be an IRQ context?

My question, really, is why do you need the atomic properties in this patch
series? It just looks like overhead at the moment.

Will

