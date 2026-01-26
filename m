Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8D4D13C27
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 14:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5M/hT6X+BUCUAPQ+ZbPqAUayJXQsryR7mlogTvxklBU=; b=VcRW/n28Qh0fveN9Fp3b9fHr1m
	eKrxE6TgKzrKZv6OEaxrZsoq6GpCIWm6OKGk+PMiIve4UaMNGMYVkKYnfMCCrZ4iYxl5YFfLu6cqC
	t18zp740V1HdZezNyigyKsTq8Ys4IFPKy9/Oy6ZgrF8mYMr5tBMSgA5yK79gCSs2/HEBhV7YRp27+
	IV+mnkNcrqB1joEIfhZfQHdSU9GILzMhtsKPG1XEXsEMqMy++XTUU6r3cxrvRObKns9FN0zyiLTnF
	5bAgpTps/eT1MUf3oBWOqKbVVj0hzfZA46MQmseMvwDgYxiHEWXhNs5v0u3DY960nTUmE9eB0kGhk
	HqP0UaCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkNzM-0000000Cj9H-2w76;
	Mon, 26 Jan 2026 14:54:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkNzJ-0000000Cj8S-1u2P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 14:54:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B03C0437DF;
	Mon, 26 Jan 2026 14:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD1FC116C6;
	Mon, 26 Jan 2026 14:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769439284;
	bh=7sRyq9vC8/ABpNkwM+B6b4cRdcvsa50dvpc8Ewv/ufM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XDxdNLEyhAhLPM9W+w9yGtoYMuvdFpDU4if2F/p6P197GRjupD8TsigOvI5CaZv9k
	 sK96+NZp97x4X6xVF08Gt62nGXGKg3lcFhLEjf36+JboinAsU3PZfmM7T8ZsINaLeS
	 LO2NdtIbU0pWRchVnOzJsmTyj2hWkXSpccD5ITTgly0UZPkQ2yZMbZSu4DENeGl/A9
	 rjtZuX1lrnPDjAF9SVU8i2taw7CACtOPdl4mvuhG9kIljzP9dKZ25uNmU/vC0iQWKS
	 5qaf3qk718m0LvQuNYb3rhQqVaqgbK9s8em5hZ+V+J3Klspfh0ZOdGlIykPOeoM17E
	 11QP0vbpVYqhA==
Date: Mon, 26 Jan 2026 14:54:38 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, balbirs@nvidia.com,
	miko.lenczewski@arm.com, peterz@infradead.org, kevin.tian@intel.com,
	praan@google.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/7] iommu/arm-smmu-v3: Introduce a per-domain
 arm_smmu_invs array
Message-ID: <aXeALpV1wcQk9tah@willie-the-truck>
References: <cover.1766174731.git.nicolinc@nvidia.com>
 <8c94c5194871ee1a0f3a6b49e18818b88f51226d.1766174731.git.nicolinc@nvidia.com>
 <aXOpzjkAgODnh2HU@willie-the-truck>
 <aXOxfi8ZQAkr4zHU@Asurada-Nvidia>
 <aXO1OLrOsCkep3V8@willie-the-truck>
 <aXO2MY6gzs/lxT7S@Asurada-Nvidia>
 <20260123191654.GD1134360@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123191654.GD1134360@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_065445_533074_826D9CB4 
X-CRM114-Status: GOOD (  24.68  )
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

On Fri, Jan 23, 2026 at 03:16:54PM -0400, Jason Gunthorpe wrote:
> On Fri, Jan 23, 2026 at 09:56:01AM -0800, Nicolin Chen wrote:
> > On Fri, Jan 23, 2026 at 05:51:52PM +0000, Will Deacon wrote:
> > > On Fri, Jan 23, 2026 at 09:35:58AM -0800, Nicolin Chen wrote:
> > > > On Fri, Jan 23, 2026 at 05:03:10PM +0000, Will Deacon wrote:
> > > > > On Fri, Dec 19, 2025 at 12:11:25PM -0800, Nicolin Chen wrote:
> > > > > > +struct arm_smmu_inv {
> > > > > > +	struct arm_smmu_device *smmu;
> > > > > > +	u8 type;
> > > > > > +	u8 size_opcode;
> > > > > > +	u8 nsize_opcode;
> > > > > > +	u32 id; /* ASID or VMID or SID */
> > > > > > +	union {
> > > > > > +		size_t pgsize; /* ARM_SMMU_FEAT_RANGE_INV */
> > > > > > +		u32 ssid; /* INV_TYPE_ATS */
> > > > > > +	};
> > > > > > +
> > > > > > +	refcount_t users; /* users=0 to mark as a trash to be purged */
> > > > > 
> > > > > The refcount_t API uses atomics with barrier semantics. Do we actually
> > > > > need those properties when updating the refcounts here? The ASID lock
> > > > > gives us pretty strong serialisation even after this patch series and
> > > > > we rely heavily on that.
> > > > 
> > > > But we can't use that mutex in the invalidation function that
> > > > might be an IRQ context?
> > > 
> > > My question, really, is why do you need the atomic properties in this patch
> > > series? It just looks like overhead at the moment.
> > 
> > Hmm, shouldn't it be atomic, since..
> > 
> > (might be IRQ, no mutex) __arm_smmu_domain_inv_range() reads it.
> > (mutex protected) arm_smmu_attach_dev() writes it.
> > 
> > ..?
> 
> It doesn't need to be a full atomic, you can use WRITE_ONCE/READ_ONCE
> instead for this case.
> 
> The general argument of this scheme is it doesn't matter if the
> invalidation side is doing extra invalidation, that is supposed to
> always be safe except for ATS. For ATS we hold locks and then it
> doesn't to be atomic because of the lock.
> 
> So I think Will has it right, just use READ_ONCE/WRITE_ONCE on a naked
> unsigned int.

There's the usual scary ordering worries with this stuff, but they exist
with refcount_read() too. We're ok because cur->users is address dependent
on the read of the invalidation array pointer, which is RCU protected.

(I think!)

Will

