Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32085CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WdxaWCj2Vri+tTYAAdR4W5RVn4P6dQP1GQHjDxuQQ4=; b=PbpmP7tFHBZFZ4ygOG2NVxwQ3q
	L7wCy7lAG76FlI8E6gSgHkQW+9SY7CWNtT7DeJlBdbQLHc2nfcxn8YCpm0sBvaokQqe/sGQVgil0f
	tZLXDgCa3de/far5BgJalddogSGGoP2zZiIimJM1Pyi69Z5F5cIgPSL5hqcdjPWI0BqjX7wAlDX15
	+N6RUVy6V++LmAZgltJ7NCjMDcs7WUJm9sDDruAixZBP851/75PwVHtPkaAlPIafjR1648E2oRr+V
	m60niFsl+T/95AooORFQ+LVEM2orvhtPTjxPax+DfYduw45AYNEOiuMYU9SXV4T3PBe5XbboxJVbp
	pnTAiLZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDFK-00000003Kpd-42jq;
	Wed, 13 May 2026 17:19:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDFJ-00000003KpF-2g8H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:19:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1B2960121;
	Wed, 13 May 2026 17:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12FCC19425;
	Wed, 13 May 2026 17:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778692784;
	bh=wdwmWQvVhbMJShU+Cq/ZBzAiBrqBEgIBK4QCLxQP7nE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XG8b+yZprlhiDyP4N8PEd0JhlPNIBpirJzna7WY6Flqur6vQsjA/gU5DwKN4W2sF+
	 E3RKHEG5BKTuj9Phwr7hHxW5wdXGmSDxDu09uNWCqBapj7pFqNzrbj1x0w4zLSDXMD
	 dp/C9RR2HwsB9ouhXUUfcXqEBSxfupSTjbUBcIGCrm+9BYkEoT4ImaQC5cdHXsRnWz
	 DOoTHmZrKaGfHNS/pptGvO0Dnb36Zw3IMhn5NEWaFTGlDETppUHAxiV/oCiPjL8TkW
	 jrbWZT3nJjjwPxotDoTBUhqB86256m43zBEP7un3o7Cd/PlzAi3w649OaY9MjHI6P5
	 p6VZmOG6n0DZg==
Date: Wed, 13 May 2026 18:19:39 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: Sebastian Ene <sebastianene@google.com>, catalin.marinas@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>, maz@kernel.org,
	oupton@kernel.org, will@kernel.org, joey.gouly@arm.com,
	korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH v3 1/2] firmware: arm_ffa: Fix Endpoint Memory Access
 Descriptor offset calculation
Message-ID: <20260513-prodigious-cobra-of-cleaning-094a72@sudeepholla>
References: <20260512124442.1899107-1-sebastianene@google.com>
 <20260512124442.1899107-2-sebastianene@google.com>
 <agR98uWCHQBHuGNg@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agR98uWCHQBHuGNg@google.com>
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

On Wed, May 13, 2026 at 01:34:42PM +0000, Mostafa Saleh wrote:
> On Tue, May 12, 2026 at 12:44:41PM +0000, Sebastian Ene wrote:
> > Use the descriptor's `ep_mem_offset` to calculate the start of the endpoint
> > memory access array and to comply with the FF-A spec instead of defaulting
> > to `sizeof(struct ffa_mem_region)`.
> > This requires moving `ffa_mem_region_additional_setup()` earlier in the setup
> > flow.
> > Also, add sanity checks to ensure the calculated descriptor offsets do not
> > exceed `max_fragsize`.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  drivers/firmware/arm_ffa/driver.c | 14 ++++++++++----
> >  include/linux/arm_ffa.h           |  2 +-
> >  2 files changed, 11 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> > index eb2782848283..56b166290b24 100644
> > --- a/drivers/firmware/arm_ffa/driver.c
> > +++ b/drivers/firmware/arm_ffa/driver.c
> > @@ -685,18 +685,25 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
> >  	struct ffa_composite_mem_region *composite;
> >  	struct ffa_mem_region_addr_range *constituents;
> >  	struct ffa_mem_region_attributes *ep_mem_access;
> > -	u32 idx, frag_len, length, buf_sz = 0, num_entries = sg_nents(args->sg);
> > +	u32 idx, frag_len, length, buf_sz = 0, num_entries = sg_nents(args->sg), ep_offset;
> >  
> >  	mem_region->tag = args->tag;
> >  	mem_region->flags = args->flags;
> >  	mem_region->sender_id = drv_info->vm_id;
> >  	mem_region->attributes = ffa_memory_attributes_get(func_id);
> > +
> > +	ffa_mem_region_additional_setup(drv_info->version, mem_region);
> >  	composite_offset = ffa_mem_desc_offset(buffer, args->nattrs,
> >  					       drv_info->version);
> > +	if (composite_offset > max_fragsize - sizeof(struct ffa_composite_mem_region))
> > +		return -ENXIO;
> 
> nit: This driver seems to use sizeof() with variable name rather than
> type (except for one place) so it may be good to keep that.
> 

Agreed, +1.

> >  
> >  	for (idx = 0; idx < args->nattrs; idx++) {
> > -		ep_mem_access = buffer +
> > -			ffa_mem_desc_offset(buffer, idx, drv_info->version);
> > +		ep_offset = ffa_mem_desc_offset(buffer, idx, drv_info->version);
> > +		if (ep_offset > max_fragsize - sizeof(struct ffa_mem_region_attributes))
> > +			return -ENXIO;
> > +
> > +		ep_mem_access = buffer + ep_offset;
> >  		ep_mem_access->receiver = args->attrs[idx].receiver;
> >  		ep_mem_access->attrs = args->attrs[idx].attrs;
> >  		ep_mem_access->composite_off = composite_offset;
> > @@ -708,7 +715,6 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
> >  	}
> >  	mem_region->handle = 0;
> >  	mem_region->ep_count = args->nattrs;
> > -	ffa_mem_region_additional_setup(drv_info->version, mem_region);
> >  
> >  	composite = buffer + composite_offset;
> >  	composite->total_pg_cnt = ffa_get_num_pages_sg(args->sg);
> > diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
> > index 81e603839c4a..62d67dae8b70 100644
> > --- a/include/linux/arm_ffa.h
> > +++ b/include/linux/arm_ffa.h
> > @@ -445,7 +445,7 @@ ffa_mem_desc_offset(struct ffa_mem_region *buf, int count, u32 ffa_version)
> >  	if (!FFA_MEM_REGION_HAS_EP_MEM_OFFSET(ffa_version))
> >  		offset += offsetof(struct ffa_mem_region, ep_mem_offset);
> >  	else
> > -		offset += sizeof(struct ffa_mem_region);
> > +		offset += buf->ep_mem_offset;
> 
> Does it make sense to also set buf->ep_mem_offset for the other
> case in ffa_mem_region_additional_setup() and then add this
> unconditionally here?
> 

I need to cross-check the spec, but if I vaguely recall as the name
FFA_MEM_REGION_HAS_EP_MEM_OFFSET suggests, older versions don't have that
field to use it.

-- 
Regards,
Sudeep

