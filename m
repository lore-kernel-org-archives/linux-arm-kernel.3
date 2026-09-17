Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79004C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJ1YBU1o9gYgwxqrw/AyHHgH2Affehx//QdayYEDSAU=; b=DICkFZlmZ7guoyp9Cf+6MfwUeU
	+IQkErfi6LUbNjS42y9UMESFQNhS8Dt4l6zhb9sSX/KAqt/JI8nb5UkXFa/DC5bkeZ1yfIKV5l/v6
	/DXN8n3e+JfWVbdgysds0NFj+2PJfYuMeWxqg7cK3KO+/KkeEyxPAmVIt6lNxzoxk5J4uJXVXeySA
	LDWzNSVgIiP4QsQhTvnru4sqgWbxgcyxuK3FiHRb6bV8l1g1BRdL3yseoP54vHr9ZU8o1AcSQ8k76
	7gNOjjduyCa9Oks8qct3aERcJoJf4pXpUMwmzjYgJ4sR4UuYk5M61UntEg21Ij/jHHIDMQNDxzxpx
	RtjKh/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CQ0-0000000BQXQ-2nM0;
	Thu, 17 Sep 2026 13:44:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CPz-0000000BQX7-1GB8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 13:44:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BA7D660211;
	Thu, 17 Sep 2026 13:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADDD1F000FF;
	Thu, 17 Sep 2026 13:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789652690;
	bh=OJ1YBU1o9gYgwxqrw/AyHHgH2Affehx//QdayYEDSAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c5wqlYrt78pFIu7OzZO4uJUZxsJJ+Gg0omy58hfcWQdqzHj3S7oVy9IBzbenqV+7R
	 p0dcDHEUewbBrt9Mc6zZL5Y0NSDYM3kNYN0CRbGhwcz+dbeMjCm6KHQpaghsNhIiJ3
	 XGJIqyMuWH8m0DH44QdqWsKwSiIJRrCVHmEfA/wxE9RaZ3HGxYIcJjpJDMWUBQb+OT
	 pl+p0++veWsSpbdBZvoO4wzBw5RLsE688yBuczmvc6x5MxIANNLUipN3OyzkeTIaB/
	 PdX+9SNHF4NPrusyykWBmPvqwKFeg1MWFWupE+KrPdvBy14VExIqmX1mmjGn64D4SM
	 eaAPV+WUvYgJA==
Date: Thu, 17 Sep 2026 14:44:42 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Matlack <dmatlack@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>, stable@vger.kernel.org,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/9] iommu/arm-smmu-v3: Handle ARM erratum for CONT
 under invalidation with SVA
Message-ID: <aqvuyse0hmNCGJqt@willie-the-truck>
References: <0-v6-9cd17417d355+281836-smmu_tlbi_jgg@nvidia.com>
 <1-v6-9cd17417d355+281836-smmu_tlbi_jgg@nvidia.com>
 <aquxuBnh6pdxu4-8@J2N7QTR9R3>
 <20260917131601.GY3968357@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917131601.GY3968357@nvidia.com>
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

On Thu, Sep 17, 2026 at 10:16:01AM -0300, Jason Gunthorpe wrote:
> On Thu, Sep 17, 2026 at 10:24:08AM +0100, Mark Rutland wrote:
> > On Wed, Sep 16, 2026 at 09:27:42PM -0300, Jason Gunthorpe wrote:
> > > The erratum (MMU-700: #3777127, S3: #3673557) deals with under
> > > invalidation of a CONT PTE grouping in the SMMU. The recommended work
> > > around is to use a Range Invalidate (RIL) that spans the entire CONT. The
> > > only user of CONT in the kernel right now is through SVA sharing a CPU
> > > page table that contains a CONT created by the mm.
> > 
> > As someone familiar with VMSA, I've never seen "RIL" used to describe a
> > range invalidate and I think using that in the code below is confusing.
> > I *think* "RIL" has come from "SMMUv3.2-RIL", which is the SMMU feature
> > for Range Invalidate *and* Level hint, where "RI" is Range Invalidate,
> > and "L" is Level.
> 
> Yes,
> 
> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:#define IDR3_RIL                    (1 << 10)
> 
> Unfortunately I've noticed a couple of places like this where the SMMU
> terminology and VMSA differ a little bit. In these cases we've
> historically choosen the SMMU naming in the SMMU driver to be
> consistent with its spec.. I've definately seen this gets confusing
> when talking to people familiar with the CPU spec and IP.
> 
> I had guessed it ment "Rang InvaLidate", but you are right:
> 
>   RIL, bit [10]
>        Range-based Invalidations and Level hint support for TLBI.
>        The value of this field is an IMPLEMENTATION DEFINED choice of:
> 
> The driver also calls it ARM_SMMU_FEAT_RANGE_INV, but I thought
> range_inv everwhere made some very long names.
> 
> > Can we please spell that out as "range invalidate" or "range op"
> > (matching the arm64 architecture code) rather than "RIL"?
>  
> > That'll be easier to follow, especially as nothing in the code mentions
> > what "RIL" means -- that's only mentioned in this commit message.
> 
> The whole series uses ril as a shorthand for IDR3_RIL, and the spec
> often does the same:
> 
> [25:20] SCALE Range invalidation scale.
> 		  * See below for use of this field in range invalidation.
> 		  * When TG == 0b00 this field is RES0.
> 		  * If SMMU_IDR3.RIL == 0, this field is RES0.
>                          ^^^^^^^^^^^
> 
> So I'm certainly sympathetic, but I don't know we should diverge the
> driver from the language in it's own spec.
> 
> Do you have a recommendation for a suitable short name? It is
> meaningful work to rename everything in this series.. Will?

I think that using RANGE_INV / range_inv would be more consistent with
the existing code, but IDR3_RIL should remain as-is because it maps
directly to the spec.

If we can do that without churning the driver (looks like we can), then
it's probably worth it, but I wouldn't be keen on churning existing code
for things like this.

Will

