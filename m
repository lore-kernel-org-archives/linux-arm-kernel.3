Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780DEC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 21:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gp4ARI8yx8eK5+ZYKJ4V0qAwq8T5VmfMZEWG24JsVtU=; b=VfvTfehn7sYcVADQCoZgfWn+uV
	TjJvqPNSlZmtJzEWOEGsXPbgVtMhee2WzPULguqYJrS4I+r9zc7tOrjLHYI60szumq7ZWGGFvuKeb
	SisriM5H+6nDI9/6J7dSORV7XFJVKhXT/9o1fo5SHV9XYLqcfxGPb6TNGKBCIJEsp64aeWIiDgWle
	Xay4ieR1r1EaRTTZB9z1ZATqp6dG+GOARnXS2VnTc5czM7JNCGmG7nryMXZooyLW4gnhAjfxLcHKv
	AFdXA0m/qPg9sCWC1otScTHpSDnkIJpvE4XAP9lckWaFuj9d5Co8lAEy/B7X7+OQVmJ5MS1owcTRp
	Uxz+4pZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWiCV-00000006eEL-1fZX;
	Tue, 01 Jul 2025 21:07:35 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhpM-00000006baR-167c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 20:43:41 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-235e389599fso325995ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 13:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751402619; x=1752007419; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gp4ARI8yx8eK5+ZYKJ4V0qAwq8T5VmfMZEWG24JsVtU=;
        b=zkYhDytxehpx0lXETgimjKCuuzu2iJOAZEmPtB1cX3T9mjghmFP8gCAwWqu+SBTzcF
         4v0S/UF0GdKMCs8ejGZxnP+tcaErlMOaZ/uJwmAa9xzJhB82h3CniMLDt5r8GBGZGD/K
         B2UPkXOSdr4aHCKUn/mhcPFGPJprM0GoAZIcMjS9rkro6kx0FKCr3ByF7bEB+tam9Soh
         yUtjpJX/FeMwMBDPAM7HxIbBzoz1S6e4rxuzWffEc96tsBpLE7aPbH7qg+rWHg9fB1c8
         cwRCz4Y09Lbx1s8pO2uiuEAP9tWa8XN1a/zGuSpJ9nDdWYHdZ0hgQcjr42zwp3Rmep2l
         /Wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751402619; x=1752007419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gp4ARI8yx8eK5+ZYKJ4V0qAwq8T5VmfMZEWG24JsVtU=;
        b=xEK6kRJTLTjBhzuMDa4QDZsozC/vsB+kH73BlXzvP9LtbhffdcIJzJQyAn6w9vArpr
         Bgfe2muhsPuxhl1xNIuVXDt9gJmsdHIINEPEzbQInubQZRELWdunS0iNW0VJZ4f+FwQB
         8i2mLERXKE8K1YEFXXSJMesnjk0doGf+ypKAsq7vmqj5jehXLyJG8GV3Vw3sPpcPeSGS
         MAH35tTblt2w/Mghx0ldg26fRFpDhjkjRMTCiB/PpzT4sVXWtCtIBtTBqYCnnZmHM6RD
         0G+UwRZyLgowxTJ3MY5mgOq4+otWjIaXJPRQedN0+R08dewQHigtBz/ya9QNt64Q1mHJ
         gEnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSNr5QSMBu4obvqTR+Y8U6DgtO2mqb/qhBWoiSthEV/0QvIKsw6sPf0F+ltGbmOV7O4rBQPoz+CNJLasvMx1Wi@lists.infradead.org
X-Gm-Message-State: AOJu0YxzdJsEY8gnDjtuWNmV2iOB3jPJanyGfkFHY9UKcTMWTQBcC0Ck
	2Ks4YYERF4WHg2oD8eBFM1r13HbQNEVeXECtqcaX9QIxiawfxnmQmUBPm9xUPpg3BQ==
X-Gm-Gg: ASbGnctHSECfncsHO3AcCk57eqKi6cMRbVwXLLGeh/mTPr7U5zHZ/evLjifsGARtW4c
	f8ms/5/an8nJTE9StTaINlnmMj53uCIGwuNB/I47tbyMGWIhTM98YzXMddDxrPmlrT2JGSrGu10
	GHxoW5xjpkTTbSRBKcxp0JXkCHnLz/CRCWv3zFOvPM5kB75bHgC4toHzQ97RTwpbLmQ45Jm72Kb
	pIfj3QLgOBqAcSoJ6UbuZW/KgrKtjz3QYZJTe/rrpCOb5tUutS28TOQ9LKrbRDH/gWWRtEuPn6l
	bqq5sB3roxRICBD1VYujbgLiq75v/FUv9OB2nfOvjTb/DbjgKrL6h2XdlbhWXku979QR4ZQtYtK
	DbC/hRMmFjQTLeZko3u5b
X-Google-Smtp-Source: AGHT+IEgQNF03gTMPFMuZ5i4oqeFgT9l/mftJxCXd5iV8tzIDEl3pR9lFMVTJeBzdy2r/6gfVZ+O7w==
X-Received: by 2002:a17:902:e54e:b0:231:d0ef:e8ff with SMTP id d9443c01a7336-23c5ff29f9dmr4133295ad.8.1751402619181;
        Tue, 01 Jul 2025 13:43:39 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541bdeasm12778586b3a.53.2025.07.01.13.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 13:43:38 -0700 (PDT)
Date: Tue, 1 Jul 2025 20:43:30 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 27/28] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aGRIctg4T6cQECx4@google.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <539ee2ec112162abdba511574e2205a77b425059.1750966133.git.nicolinc@nvidia.com>
 <aGQGm1-i4M75b9Qp@google.com>
 <aGQ6KCI9OZEwHdxS@Asurada-Nvidia>
 <aGQ_F7Qx3scbbA-J@google.com>
 <aGRDtYRXFLoT+PrI@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGRDtYRXFLoT+PrI@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_134340_326611_2C14A144 
X-CRM114-Status: GOOD (  44.30  )
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

On Tue, Jul 01, 2025 at 01:23:17PM -0700, Nicolin Chen wrote:
> On Tue, Jul 01, 2025 at 08:03:35PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Jul 01, 2025 at 12:42:32PM -0700, Nicolin Chen wrote:
> > > On Tue, Jul 01, 2025 at 04:02:35PM +0000, Pranjal Shrivastava wrote:
> > > > On Thu, Jun 26, 2025 at 12:34:58PM -0700, Nicolin Chen wrote:
> > > > > +/**
> > > > > + * struct tegra241_vintf_sid - Virtual Interface Stream ID Replacement
> > > > > + * @core: Embedded iommufd_vdevice structure, holding virtual Stream ID
> > > > > + * @vintf: Parent VINTF pointer
> > > > > + * @sid: Physical Stream ID
> > > > > + * @idx: Replacement index in the VINTF
> > > > > + */
> > > > > +struct tegra241_vintf_sid {
> > > > > +	struct iommufd_vdevice core;
> > > > > +	struct tegra241_vintf *vintf;
> > > > > +	u32 sid;
> > > > > +	u8 idx;
> > > > >  };
> > > > 
> > > > AFAIU, This seems to be a handle for sid -> vintf mapping.. it yes, then
> > > > I'm not sure if "Virtual Interface Stream ID Replacement" clarifies that?
> > > 
> > > No. It's for vSID to pSID mappings. I had it explained in commit log:
> > > 
> > 
> > I get that, it's for vSID -> pSID mapping which also "happens to" point
> > to the vintf.. all I wanted to say was that the description is unclear..
> > We could've described it as "Vintf SID map" or something, but I guess
> > it's fine the way it is too.. your call.
> 
> The "replace" word is borrowed from the "SID_REPLACE" HW register.
> 
> But I think it's okay to call it just "mapping", if that makes it
> clearer.
> 

Anything works. Maybe let it be as is.

> > > > > +static struct iommufd_viommu_ops tegra241_cmdqv_viommu_ops = {
> > > > > +	.destroy = tegra241_cmdqv_destroy_vintf_user,
> > > > > +	.alloc_domain_nested = arm_vsmmu_alloc_domain_nested,
> > > > > +	.cache_invalidate = arm_vsmmu_cache_invalidate,
> > > > 
> > > > I see that we currently use the main cmdq to issue these cache
> > > > invalidations (there's a FIXME in arm_vsmmu_cache_invalidate). I was
> > > > hoping for this series to change that but I'm assuming there's another
> > > > series coming for that?
> > > > 
> > > > Meanwhile, I guess it'd be good to call that out for folks who have
> > > > Grace and start trying out this feature.. I'm assuming they won't see
> > > > as much perf improvement with this series alone since we're still using
> > > > the main CMDQ in the upstream code?
> > > 
> > > VCMDQ only accelerates invalidation commands.
> > > 
> > 
> > I get that.. but I see we're using `arm_vsmmu_cache_invalidate` here
> > from arm-smmu-v3-iommufd.c which seems to issue all commands to
> > smmu->cmdq as of now (the code has a FIXME as well), per the code:
> > 
> > 	/* FIXME always uses the main cmdq rather than trying to group by type */
> >         ret = arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, last->cmd,
> > 					  cur - last, true);
> > 
> > I was hoping this FIXME to be addressed in this series..
> 
> Oh, that's not related.
> 
> The main goal of this series is to route all invalidation commands
> to the VCMDQ HW. And this is where Grace users can see perf gains
> mentioned in the cover letter or commit log, from eliminating the
> VM Exits at those most frequently used commands.
> 
> Any non-invalidation commands will just reuse what we have with the
> standard SMMU nesting. And even if we did something to that FIXME,
> there is no significant perf gain as it's going down the trapping
> pathway, i.e. the VM Exits are always there.
> 
> > > That is for non-invalidation commands that VCMDQ doesn't support,
> > > so they still have to go in the standard nesting pathway.
> > > 
> > > Let's add a line:
> > > 	/* for non-invalidation commands use */
> > 
> > Umm.. I was talking about the cache_invalidate op? I think there's some
> > misunderstanding here? What am I missing?
> 
> That line is exactly for cache_invalidate. All the non-invalidation
> commands will be sent to he arm_vsmmu_cache_invalidate() by VMM, as
> it means.
> 
> Or perhaps calling them "non-accelerated commands" would be nicer.

Uhh okay, so there'll be a separate driver in the VM issuing invalidation
commands directly to the CMDQV thus we don't see any of it's part here?

AND for non-invalidation commands, we trap out and the VMM ends up
calling the `cache_invalidate` op of the viommu?

Is that understanding correct?

> 
> Thanks
> Nicolin

Thanks
Praan

