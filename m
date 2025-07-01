Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB60C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 20:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bktMfbMPWDOoqz4tBJCnWTjUNN8jSJQyh7h6qa9T1Cs=; b=HLyQCem0DPyGacwBNxxDTLtANi
	55IQMv0FsOv8R+hN2PErrSV7mawvH8oFQPR2Ccl/GQf753J1eJFNB4LfYANkvFCKWrZdHy4/Mmbub
	o4u3/3gr+kwNfr8Xeg8SauHtJwMjiPASE+WAV7p11LsSaCSWAXVkH9TXamEbf6bilL4Lk1IbYpy/H
	d5ETjUSKkHodcdRFdQRXbwveTq8qOV9haDDUC98i6yf9QOZEwzmsGamZBmZMr+fkJB+lVbNa2qhSa
	JLSeU+SK3uX4SUbdKA8ml6xK/fwravtMQa5xWxo9FYKfYvXSUo4PqyU1BzdtUsDoQU+t1csLyCsix
	NRhxDhXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhFA-00000006Wqs-11cv;
	Tue, 01 Jul 2025 20:06:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhCp-00000006WgW-18Vn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 20:03:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bktMfbMPWDOoqz4tBJCnWTjUNN8jSJQyh7h6qa9T1Cs=; b=qmZ43AB0ZoflxsLVmfU5wUO/Xh
	XukZoZe2TW6Xp98XhINyDz31sfMFfw8VRdpM5jLX3Z05D60oFergw7uxYOUP6xIBJQVSWh4sj0gOi
	XuVkUSO3r6hQwzvaVvnQcNiLoNGnrZ3sIEJLvHejOBEGX+0jZwM2GoQvtr2KmQ5enOu0L9qz+Ong3
	60M12QXPPLYLv9yWKWojlr2mefrHKreJk4hE1VgWCXCCu8ueYkwHQ/NsjbQodRkzgGuD7hLAI9fck
	maC1S510lTK2TV1jghONmpvHq0Qrl7j/6VKdLKAX/0mEF7vsnlWTcXmH54u+vccWG/4BYHkVzthhC
	OENwMT6Q==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhCl-00000007BWY-40OY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 20:03:49 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2357c61cda7so202065ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 13:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751400226; x=1752005026; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bktMfbMPWDOoqz4tBJCnWTjUNN8jSJQyh7h6qa9T1Cs=;
        b=IopPqn/C80d3p+SbbDUzxqDC9v75Njw3oSgcyo3j2c4UmPLHly5b9FNZc8krPsbi6f
         2bGvRfYM3twglBq98WIP2aul9rpASGBI6uDSubSflyVWxn5y+F6FvTI2xqJl49ivCNKg
         YpqI5vXuuU3ZrBDjXdjdEjEh3B5RSCgjnmxmQJwXy2b6H4xpP+g0fjFPCf9HHDRdveWV
         JfOFN3OhvOyY6Yi37f5fALv1sPlgOATnI5IwxxqE0IaIQCulEwH599hwkvUoiKEKL47f
         prGQfMzv2Rct2qq0+m2T/lv8TuviiTogLVCwXG7pZll7nPxs0baqQoJPBFwPxgoCR1u4
         NTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751400226; x=1752005026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bktMfbMPWDOoqz4tBJCnWTjUNN8jSJQyh7h6qa9T1Cs=;
        b=si1h64e/zzvR8S56/1YxcSfC7SwtHT2eDH+W80uXaQz5ELdnP/3NHTLOjPi+m3wCSt
         GUY5ino0bY37g/vorG3nzs59BWzpmVZ12tB7KbVBMoAxZJ7whXQPQxYprBSUOomH04a5
         yq4MKuXdkqE1fSxr4PA3LJ+gVDWs/fvX/hWLk30zZNujgxrVyw5uCdpjbOWYdfpeZ28q
         MTfA3WX76LoTGgl0XpvFyhclONkwyxzlb2WGQinE0gyoaT3R37R717ru8iezkzyD/4jd
         +EVWecSzFKjTMqfd57KhDq+Smw13W+yM0D7eVtE6ywSeuSm5LMu5pTx9kS4LTVZU1qgI
         jGxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEhTeNfH7qHXUmj8Ro6bsgYuNtkb79TT0tYykI7MmVYFW86/uvXs+NGtSFwF+wotdzIBbkJ6TPJ/wpQ4XfBLXE@lists.infradead.org
X-Gm-Message-State: AOJu0YzihGPlQd8zihvQyHGn8Vp2YwNC6Grhdc047yLZIJ8J570JdgVI
	3iyTD8lKFitCW7CkxMT/LoepKWoMsYKRwxCuIHBHJEsp2poicDcYxpG/mNy/B1h6mA==
X-Gm-Gg: ASbGnctYVJ/Oft6HWcJbOY1GXvLdGuLfCZtRM29N/Qcca9wD/zZJyba9YyaAtwrd3FS
	kCNfWow4ztvm4cmDEfp9/iLJhmcSoK3Ag+7MGw8sNfdJq9FbMA5nY8itIfJ+lU5f9GC4apIW6QW
	kXrA7rS1+4CuRrkTmDC3BeI6nI9JuIEGbzOXifIZxBvW7rJCpr7EYYwUxB/8sF/Br09sPhqMeZy
	TJEqhjN49lp6B6PV5sim6Ky4mzevYEnuU88aU1qxEUQLnxL1PMJc1LLzv3kdeq1E/YjRiRooQ2M
	FnxXa/nWsmdh05nod2hZ3VNYVKAqwmx17pdtktmha1MVb7KHSEydseGw8QhiJuihm7v96MXnwsq
	9GTatCR7+zh6FaEvILtO8
X-Google-Smtp-Source: AGHT+IH8wLGT2ZcmFXbUpUVEBUVQ8i42Tf/vT9/rYGPbC+3uemlbkYYLsI4PH85g9JH5U3HDbnRtDg==
X-Received: by 2002:a17:903:46cf:b0:234:afcf:d9e2 with SMTP id d9443c01a7336-23c6010bde4mr3665345ad.17.1751400225511;
        Tue, 01 Jul 2025 13:03:45 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bb7dsm112415425ad.90.2025.07.01.13.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 13:03:44 -0700 (PDT)
Date: Tue, 1 Jul 2025 20:03:35 +0000
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
Message-ID: <aGQ_F7Qx3scbbA-J@google.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <539ee2ec112162abdba511574e2205a77b425059.1750966133.git.nicolinc@nvidia.com>
 <aGQGm1-i4M75b9Qp@google.com>
 <aGQ6KCI9OZEwHdxS@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGQ6KCI9OZEwHdxS@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_210348_237228_5038E4CB 
X-CRM114-Status: GOOD (  56.86  )
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

On Tue, Jul 01, 2025 at 12:42:32PM -0700, Nicolin Chen wrote:
> On Tue, Jul 01, 2025 at 04:02:35PM +0000, Pranjal Shrivastava wrote:
> > On Thu, Jun 26, 2025 at 12:34:58PM -0700, Nicolin Chen wrote:
> > >  /**
> > >   * enum iommu_hw_info_type - IOMMU Hardware Info Types
> > >   * @IOMMU_HW_INFO_TYPE_NONE: Output by the drivers that do not report hardware
> > > @@ -598,12 +619,15 @@ struct iommu_hw_info_arm_smmuv3 {
> > >   * @IOMMU_HW_INFO_TYPE_DEFAULT: Input to request for a default type
> > >   * @IOMMU_HW_INFO_TYPE_INTEL_VTD: Intel VT-d iommu info type
> > >   * @IOMMU_HW_INFO_TYPE_ARM_SMMUV3: ARM SMMUv3 iommu info type
> > > + * @IOMMU_HW_INFO_TYPE_TEGRA241_CMDQV: NVIDIA Tegra241 CMDQV (extension for ARM
> > > + *                                     SMMUv3) info type
> > 
> > I know that the goal here is to mention that Tegra241 CMDQV is an
> > extension for Arm SMMUv3, but this comment could be misunderstood as the
> > "type" being an extension to IOMMU_HW_INFO_TYPE_ARM_SMMUV3. How about we
> 
> IOMMU_HW_INFO_TYPE_TEGRA241_CMDQV only reports CMDQV structure.
> VMM still needs to poll the IOMMU_HW_INFO_TYPE_ARM_SMMUV3. It's
> basically working as "type being an extension".
> 

Ohh okay, I see.. I thought we were describing the HW.

> > Sorry to be nit-picky here, I know that the code is clear, but I've seen
> > people don't care to read more than the uapi descriptions. Maybe we
> > could re-write this comment, here and everywhere else?
> 
> I can change this thought:
> 
> + * @IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV: NVIDIA Tegra241 CMDQV (extension for ARM
> + *                                    SMMUv3) enabled ARM SMMUv3 type
> 

Yes, that helps, thanks!

> > > +/**
> > > + * struct tegra241_vintf_sid - Virtual Interface Stream ID Replacement
> > > + * @core: Embedded iommufd_vdevice structure, holding virtual Stream ID
> > > + * @vintf: Parent VINTF pointer
> > > + * @sid: Physical Stream ID
> > > + * @idx: Replacement index in the VINTF
> > > + */
> > > +struct tegra241_vintf_sid {
> > > +	struct iommufd_vdevice core;
> > > +	struct tegra241_vintf *vintf;
> > > +	u32 sid;
> > > +	u8 idx;
> > >  };
> > 
> > AFAIU, This seems to be a handle for sid -> vintf mapping.. it yes, then
> > I'm not sure if "Virtual Interface Stream ID Replacement" clarifies that?
> 
> No. It's for vSID to pSID mappings. I had it explained in commit log:
> 

I get that, it's for vSID -> pSID mapping which also "happens to" point
to the vintf.. all I wanted to say was that the description is unclear..
We could've described it as "Vintf SID map" or something, but I guess
it's fine the way it is too.. your call.

> For ATC invalidation commands that hold an SID, it requires all devices to
> register their virtual SIDs to the SID_MATCH registers and their physical
> SIDs to the pairing SID_REPLACE registers, so that HW can use those as a
> lookup table to replace those virtual SIDs with the correct physical SIDs.
> Thus, implement the driver-allocated vDEVICE op with a tegra241_vintf_sid
> structure to allocate SID_REPLACE and to program the SIDs accordingly.
> 
> > > @@ -351,6 +394,29 @@ tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu,
> > >  
> > >  /* HW Reset Functions */
> > >  
> > > +/*
> > > + * When a guest-owned VCMDQ is disabled, if the guest did not enqueue a CMD_SYNC
> > > + * following an ATC_INV command at the end of the guest queue while this ATC_INV
> > > + * is timed out, the TIMEOUT will not be reported until this VCMDQ gets assigned
> > > + * to the next VM, which will be a false alarm potentially causing some unwanted
> > > + * behavior in the new VM. Thus, a guest-owned VCMDQ must flush the TIMEOUT when
> > > + * it gets disabled. This can be done by just issuing a CMD_SYNC to SMMU CMDQ.
> > > + */
> > > +static void tegra241_vcmdq_hw_flush_timeout(struct tegra241_vcmdq *vcmdq)
> > > +{
> > > +	struct arm_smmu_device *smmu = &vcmdq->cmdqv->smmu;
> > > +	u64 cmd_sync[CMDQ_ENT_DWORDS] = {};
> > > +
> > > +	cmd_sync[0] = FIELD_PREP(CMDQ_0_OP, CMDQ_OP_CMD_SYNC) |
> > > +		      FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_NONE);
> > > +
> > > +	/*
> > > +	 * It does not hurt to insert another CMD_SYNC, taking advantage of the
> > > +	 * arm_smmu_cmdq_issue_cmdlist() that waits for the CMD_SYNC completion.
> > > +	 */
> > > +	arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, cmd_sync, 1, true);
> > > +}
> > 
> > If I'm getting this right, it issues a CMD_SYNC to the Host's CMDQ i.e.
> > the non-CMDQV CMDQ, the main CMDQ of the SMMUv3? (i.e. the CMDQ present
> > without the Tegra241 CMDQV extension?)
> >
> > so.. basically on every VM switch, there would be an additional CMD_SYNC
> > issued to the non-CMDQV CMDQ to flush the TIMEOUT and we'll poll for
> > it's completion?
> 
> The main CMDQ exists regardless whether CMDQV extension is there or
> not. The CMD_SYNC can be issued to any (v)CMDQ. The smmu->cmdq is
> just the easiest one to use here.
> 

I see. Thanks!

> > > @@ -380,6 +448,12 @@ static void tegra241_vcmdq_hw_deinit(struct tegra241_vcmdq *vcmdq)
> > >  	dev_dbg(vcmdq->cmdqv->dev, "%sdeinited\n", h);
> > >  }
> > >  
> > > +/* This function is for LVCMDQ, so @vcmdq must be mapped prior */
> > > +static void _tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
> > > +{
> > > +	writeq_relaxed(vcmdq->cmdq.q.q_base, REG_VCMDQ_PAGE1(vcmdq, BASE));
> > > +}
> > > +
> > 
> > Not sure why we broke this off to a function, will there be more stuff
> > here or is this just to use it in tegra241_vcmdq_hw_init_user as well?
> 
> I can take it off.
> 

Nah, that's okay, I was just curious.

> > > @@ -429,6 +504,10 @@ static void tegra241_vintf_hw_deinit(struct tegra241_vintf *vintf)
> > >  		}
> > >  	}
> > >  	vintf_write_config(vintf, 0);
> > > +	for (sidx = 0; sidx < vintf->cmdqv->num_sids_per_vintf; sidx++) {
> > > +		writel(0, REG_VINTF(vintf, SID_MATCH(sidx)));
> > > +		writel(0, REG_VINTF(vintf, SID_REPLACE(sidx)));
> > > +	}
> > >  }
> > 
> > I'm assuming we call the de-init while switching VMs and hence we need
> > to clear these to avoid spurious SID replacements in the new VM? Or do
> > they not reset to 0 when the HW is reset?
> 
> The driver does not reset HW when tearing down a VM, but only sets
> VINTF's enable bit to 0. So, it should just set other configuration
> bits to 0 as well.
> 
> > > +static struct iommufd_viommu_ops tegra241_cmdqv_viommu_ops = {
> > > +	.destroy = tegra241_cmdqv_destroy_vintf_user,
> > > +	.alloc_domain_nested = arm_vsmmu_alloc_domain_nested,
> > > +	.cache_invalidate = arm_vsmmu_cache_invalidate,
> > 
> > I see that we currently use the main cmdq to issue these cache
> > invalidations (there's a FIXME in arm_vsmmu_cache_invalidate). I was
> > hoping for this series to change that but I'm assuming there's another
> > series coming for that?
> > 
> > Meanwhile, I guess it'd be good to call that out for folks who have
> > Grace and start trying out this feature.. I'm assuming they won't see
> > as much perf improvement with this series alone since we're still using
> > the main CMDQ in the upstream code?
> 
> VCMDQ only accelerates invalidation commands.
> 

I get that.. but I see we're using `arm_vsmmu_cache_invalidate` here
from arm-smmu-v3-iommufd.c which seems to issue all commands to
smmu->cmdq as of now (the code has a FIXME as well), per the code:

	/* FIXME always uses the main cmdq rather than trying to group by type */
        ret = arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq, last->cmd,
					  cur - last, true);

I was hoping this FIXME to be addressed in this series..

> That is for non-invalidation commands that VCMDQ doesn't support,
> so they still have to go in the standard nesting pathway.
> 
> Let's add a line:
> 	/* for non-invalidation commands use */

Umm.. I was talking about the cache_invalidate op? I think there's some
misunderstanding here? What am I missing?

> 
> Nicolin

Thanks
Praan

