Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C99AE9E2E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 11:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzsYiKjSUi+04/5xJrU03etv+ypzEOVDjiJ3fGcWCOY=; b=MeuZpEmGltG3ep7TS1Xu6iDH0T
	16KV6QNRAiyVK2AQCu1GO0+BGc0fayl5SyxR8GK3mGET+vYsb6r3ZygoNy1jdSGHlteS5QE5BW4l/
	JXCscgKXK2YPBxDeQBf8XkbwX32ulF3EAG/PWcsNU5AUhDpI2DAfqRCFHk2S3kh0XvrgewIcBQVI4
	AtluzJvH4uK7orSrog9oDIUMOyfzsq2vTpQ2Vjfk1+KhDXUNuJdBsZnpElCE7a0n1PFWgq4uai06h
	xioraSQAtvyhS97CJ44Y27J1xMKQU4m5BgzIO729HVQapazTDUcTCRVqcEQUsNELCjBpvGanSbgnu
	HWCym6RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq82O-00000000YM0-3WMj;
	Wed, 11 Feb 2026 11:05:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq82M-00000000YL9-2qM8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 11:05:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EF62339;
	Wed, 11 Feb 2026 03:05:31 -0800 (PST)
Received: from e134344.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D7573F740;
	Wed, 11 Feb 2026 03:05:32 -0800 (PST)
Date: Wed, 11 Feb 2026 11:05:29 +0000
From: Ben Horgan <ben.horgan@arm.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
	dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
	fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
	jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	peternewman@google.com, punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com, rohit.mathew@arm.com,
	scott@os.amperecomputing.com, sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com,
	catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
	zengheng4@huawei.com, linux-doc@vger.kernel.org,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: Re: [PATCH v4 15/41] arm_mpam: resctrl: Pick the caches we will use
 as resctrl resources
Message-ID: <aYxieS3Pycm5UthH@e134344.arm.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
 <20260203214342.584712-16-ben.horgan@arm.com>
 <c8d53e59-5661-4ac2-bc8f-0661cde59967@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8d53e59-5661-4ac2-bc8f-0661cde59967@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_030538_836938_B9DB04DF 
X-CRM114-Status: GOOD (  25.91  )
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

Hi Reinette,

On Tue, Feb 10, 2026 at 03:39:51PM -0800, Reinette Chatre wrote:
> Hi Ben,
> 
> On 2/3/26 1:43 PM, Ben Horgan wrote:
> ...
> > +
> >  static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
> >  {
> > -	/* TODO: initialise the resctrl resources */
> > +	struct mpam_class *class = res->class;
> > +	struct rdt_resource *r = &res->resctrl_res;
> > +
> > +	switch (r->rid) {
> > +	case RDT_RESOURCE_L2:
> > +	case RDT_RESOURCE_L3:
> > +		r->alloc_capable = true;
> > +		r->schema_fmt = RESCTRL_SCHEMA_BITMAP;
> > +		r->cache.arch_has_sparse_bitmasks = true;
> > +
> > +		r->cache.cbm_len = class->props.cpbm_wd;
> > +		/* mpam_devices will reject empty bitmaps */
> > +		r->cache.min_cbm_bits = 1;
> > +
> > +		if (r->rid == RDT_RESOURCE_L2) {
> > +			r->name = "L2";
> 
> This code is fine but highlights that resctrl fs should not let the
> arch need to do this since this name is used as part of user interface.

Yes, not ideal but I don't think it's urgent to tidy this up.

> 
> > +			r->ctrl_scope = RESCTRL_L2_CACHE;
> > +		} else {
> > +			r->name = "L3";
> > +			r->ctrl_scope = RESCTRL_L3_CACHE;
> > +		}
> > +
> > +		/*
> > +		 * Which bits are shared with other ...things...
> > +		 * Unknown devices use partid-0 which uses all the bitmap
> > +		 * fields. Until we configured the SMMU and GIC not to do this
> > +		 * 'all the bits' is the correct answer here.
> > +		 */
> > +		r->cache.shareable_bits = resctrl_get_default_ctrl(r);
> 
> I would like to recommend one style change to set r->alloc_capable as the final
> setting. This is the setting that informs resctrl fs that this resource needs
> attention. The reason I recommend this to be done last is if/when a future
> change adds some configuration here that may fail then it should not fail with
> r->alloc_capable as true while partially initialized.

Makes sense. This will make the code more robust.

> 
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> >  
> >  	return 0;
> >  }
> > @@ -324,7 +409,8 @@ int mpam_resctrl_setup(void)
> >  		res->resctrl_res.rid = rid;
> >  	}
> >  
> > -	/* TODO: pick MPAM classes to map to resctrl resources */
> > +	/* Find some classes to use for controls */
> > +	mpam_resctrl_pick_caches();
> >  
> >  	/* Initialise the resctrl structures from the classes */
> >  	for_each_mpam_resctrl_control(res, rid) {
> 
> Reinette

Thanks,

Ben

