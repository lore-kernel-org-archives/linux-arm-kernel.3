Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE0CCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 08:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJDyC8rUF/eWH5B/7UaO0tbND5FfuI3668kVV74lXeA=; b=ipNEBFkMtz50/z/9cFCULSMGjy
	lcB0jnCrVLgbe6QD+DNTQSy9D3emtLyERoX/ZzLMcOPgJiVr/t8EnGxheR/np8D5zRy6qhwCrvv9+
	O7EtnZjLfBLyWVH1DFdnZ6keSgR7ko0M+7nlM6R5feQjEH0MnNcOqFgJjFooSVm7qBbpULPicnTkM
	yDmT2db5Lg/LZ84/HbY2Y49a7KBQ8/m7h+RlMAuIf/sU1PotsIUwe2q5XDl7OY2XvJCUQqb66tOuI
	ZgRvWZbd4IPeAUjgJGHi1y+2UUQgD1Ja5yfHp3HcdJfR4Px6Rzmh3t/Li3zz+0Gacz8uJ6w49d6zq
	u8UBwc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1LGw-0000000Fwwq-0VRy;
	Wed, 24 Sep 2025 08:54:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1LGt-0000000FwwP-1jHb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 08:54:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E5E4106F;
	Wed, 24 Sep 2025 01:54:34 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD7EE3F5A1;
	Wed, 24 Sep 2025 01:54:41 -0700 (PDT)
Date: Wed, 24 Sep 2025 09:54:38 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Lixiang Mao <lixiang.mao@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lixiang Mao <liximao@qti.qualcomm.com>
Subject: Re: [PATCH v3] firmware: arm_ffa: Add support for IMPDEF value in
 the memory access descriptor
Message-ID: <20250924-amazing-unyielding-shark-1ac77e@sudeepholla>
References: <20250923150927.1218364-1-sudeep.holla@arm.com>
 <c88f5edd-492d-47c9-8188-c702cfa6301d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c88f5edd-492d-47c9-8188-c702cfa6301d@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_015443_529144_703414CF 
X-CRM114-Status: GOOD (  31.95  )
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

On Wed, Sep 24, 2025 at 09:50:21AM +0800, Lixiang Mao wrote:
> 
> On 9/23/2025 11:09 PM, Sudeep Holla wrote:
> > FF-A v1.2 introduced 16 byte IMPLEMENTATION DEFINED value in the endpoint
> > memory access descriptor to allow any sender could to specify an its any
> > custom value for each receiver. Also this value must be specified by the
> > receiver when retrieving the memory region. The sender must ensure it
> > informs the receiver of this value via an IMPLEMENTATION DEFINED mechanism
> > such as a partition message.
> > 
> > So the FF-A driver can use the message interfaces to communicate the value
> > and set the same in the ffa_mem_region_attributes structures when using
> > the memory interfaces.
> > 
> > The driver ensure that the size of the endpoint memory access descriptors
> > is set correctly based on the FF-A version.
> > 
> > Fixes: 9fac08d9d985 ("firmware: arm_ffa: Upgrade FF-A version to v1.2 in the driver")
> > Reported-by: Lixiang Mao <liximao@qti.qualcomm.com>
> > Tested-by: Lixiang Mao <liximao@qti.qualcomm.com>
> > Message-Id: <20250919155216.34074-1-sudeep.holla@arm.com>
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> >   drivers/firmware/arm_ffa/driver.c | 37 ++++++++++++++++++++++---------
> >   include/linux/arm_ffa.h           | 21 ++++++++++++++++--
> >   2 files changed, 46 insertions(+), 12 deletions(-)
> > 
> > v2[2]->v3:
> > 	- Moved FFA version checks into macros and tie them with features
> > 	  to improve readability and maintenance
> > 
> > v1[1]->v2[2]:
> > 	- Fix the size of EMAD in ffa_mem_desc_offset() and the loop
> > 	  increment in ffa_setup_and_transmit()
> > 
> > [1] https://lore.kernel.org/all/20250915150119.3106344-1-sudeep.holla@arm.com/
> > [2] https://lore.kernel.org/all/20250919155216.34074-1-sudeep.holla@arm.com/
> > 
> > diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> > index 65bf1685350a..c72ee4756585 100644
> > --- a/drivers/firmware/arm_ffa/driver.c
> > +++ b/drivers/firmware/arm_ffa/driver.c
> > @@ -649,6 +649,26 @@ static u16 ffa_memory_attributes_get(u32 func_id)
> >   	return FFA_MEM_NORMAL | FFA_MEM_WRITE_BACK | FFA_MEM_INNER_SHAREABLE;
> >   }
> > +static void ffa_emad_impdef_value_init(u32 version, void *dst, void *src)
> > +{
> > +	struct ffa_mem_region_attributes *ep_mem_access;
> > +
> > +	if (FFA_EMAD_HAS_IMPDEF_FIELD(version))
> > +		memcpy(dst, src, sizeof(ep_mem_access->impdef_val));
> > +}
> > +
> > +static void
> > +ffa_mem_region_additional_setup(u32 version, struct ffa_mem_region *mem_region)
> > +{
> > +	if (!FFA_MEM_REGION_HAS_EP_MEM_OFFSET(version)) {
> > +		mem_region->ep_mem_size = 0;
> > +	} else {
> > +		mem_region->ep_mem_size = ffa_emad_size_get(version);
> > +		mem_region->ep_mem_offset = sizeof(*mem_region);
> > +		memset(mem_region->reserved, 0, 12);
> > +	}
> > +}
> > +
> >   static int
> >   ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
> >   		       struct ffa_mem_ops_args *args)
> > @@ -667,27 +687,24 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
> >   	mem_region->flags = args->flags;
> >   	mem_region->sender_id = drv_info->vm_id;
> >   	mem_region->attributes = ffa_memory_attributes_get(func_id);
> > -	ep_mem_access = buffer +
> > -			ffa_mem_desc_offset(buffer, 0, drv_info->version);
> >   	composite_offset = ffa_mem_desc_offset(buffer, args->nattrs,
> >   					       drv_info->version);
> > -	for (idx = 0; idx < args->nattrs; idx++, ep_mem_access++) {
> > +	for (idx = 0; idx < args->nattrs; idx++) {
> > +		ep_mem_access = buffer +
> > +			ffa_mem_desc_offset(buffer, idx, drv_info->version);
> >   		ep_mem_access->receiver = args->attrs[idx].receiver;
> >   		ep_mem_access->attrs = args->attrs[idx].attrs;
> >   		ep_mem_access->composite_off = composite_offset;
> >   		ep_mem_access->flag = 0;
> >   		ep_mem_access->reserved = 0;
> > +		ffa_emad_impdef_value_init(drv_info->version,
> > +					   ep_mem_access->impdef_val,
> > +					   args->attrs[idx].impdef_val);
> >   	}
> >   	mem_region->handle = 0;
> >   	mem_region->ep_count = args->nattrs;
> > -	if (drv_info->version <= FFA_VERSION_1_0) {
> > -		mem_region->ep_mem_size = 0;
> > -	} else {
> > -		mem_region->ep_mem_size = sizeof(*ep_mem_access);
> > -		mem_region->ep_mem_offset = sizeof(*mem_region);
> > -		memset(mem_region->reserved, 0, 12);
> > -	}
> > +	ffa_mem_region_additional_setup(drv_info->version, mem_region);
> >   	composite = buffer + composite_offset;
> >   	composite->total_pg_cnt = ffa_get_num_pages_sg(args->sg);
> > diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
> > index e1634897e159..c2d1f743e44a 100644
> > --- a/include/linux/arm_ffa.h
> > +++ b/include/linux/arm_ffa.h
> > @@ -337,6 +337,7 @@ struct ffa_mem_region_attributes {
> >   	 * an `struct ffa_mem_region_addr_range`.
> >   	 */
> >   	u32 composite_off;
> > +	u8 impdef_val[16];
> >   	u64 reserved;
> >   };
> > @@ -416,15 +417,31 @@ struct ffa_mem_region {
> >   #define CONSTITUENTS_OFFSET(x)	\
> >   	(offsetof(struct ffa_composite_mem_region, constituents[x]))
> > +#define FFA_EMAD_HAS_IMPDEF_FIELD(version)	(version >= FFA_VERSION_1_2)
> > +#define FFA_MEM_REGION_HAS_EP_MEM_OFFSET(version) (version > FFA_VERSION_1_0)
> Minor: version -->> (version)

Good point, will fix it up when applying. Thanks!

-- 
Regards,
Sudeep

