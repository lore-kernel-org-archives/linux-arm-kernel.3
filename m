Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6096CC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TXPG1g3tHBq7F0JV2QmBmMxnoyZNN73F2qMEQ/D5jc=; b=CXYgoaOMnAqCBw0rJBKYC8zgfD
	fkXy81im/Vc9fuO4jTTkxmnG822W+PG2iM3fEqaRGiFvylKTlTqcGLf4FbG8XA/BWLOVZ88KFhm+7
	9mm8dvflRBvVpMPAo3KUJG/tfNrXvJe6UmVYtYDqyghSh3gDghOsWQnbKb2Mv46fPMMYD7heHewrO
	cT80xHG415pbBS5gJEa9pSNhfDfE8H2gNkG2d9bAQi9o3xuSsSBtqzIxe5fDNl+foZVKnKf2N3Qi2
	qWxMV44ZC4G37+v5OGBDYBTG+qSxgm4yQePy4gHgUzhrFX+OgO+Em+RUVVwk7GD5Dke/8+80zqV11
	fuvo/j9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyJl-00000000Vle-2mef;
	Tue, 25 Feb 2025 17:02:01 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy6B-00000000Rvo-16rp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:48:00 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-221ac1f849fso161165ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 08:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740502078; x=1741106878; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6TXPG1g3tHBq7F0JV2QmBmMxnoyZNN73F2qMEQ/D5jc=;
        b=OMoMq3KeocgZ9oN6BNz2E15OK32BQZhJGnv0htY0lsgXxZ868yEbU5hDJHc4xkk6Jl
         x1h9wdXgNoggHulAK1pTWgWtMRcSMDuZCgRmRIN8zaq2AJ/IEbPXP98Ffy7hbDk8aCiX
         G8B15DwJ5Iwx5BgnofQt+Hk91agHOVZmksaS2BAt9Rrpi3W7YZjcgPtQBUpZ0TQ1e9gC
         6SIddzdcM7j3F+nBZg8Du/zrFfKQRYCnwTfp2zbpoY3q55081hjF2Oy84KoMgNtP7Lzj
         grtQnpL0cwmgVae910rJf9T/eLQSWJy4h4crpm7JpySXwfPsTnjK6a9feTcO02EaMifu
         AI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740502078; x=1741106878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TXPG1g3tHBq7F0JV2QmBmMxnoyZNN73F2qMEQ/D5jc=;
        b=tjANFh1T5Ho4XkSZj1Cd4k5HX93wyNVLnClLoS5eolQXY/jS8kGm3Han2zD2kOnlWJ
         IB97xcEbnw5K5sziI93r+Jn+EYZbOp3GdiZISsaqte/5vmacP2VP173GjGawTqmPvPBl
         +FtVQPCWSFUZXHOALuj9g00rL4EwlBUbE5bfM8RdhnkJhLi8IUoCy2huaf6fnecwYyKB
         s9OfvKIh20XTmua3i5Z5TXtcQri2WfEp2WluD8wXNyo2QdfnIzRtje/cHXWBjetvEfKU
         tSGGv573l5p7PApcoeT6w0xUxJ5Aj/taYxilxYbA61ATP64hpwnhexxknGi59F+wA70o
         Z5dg==
X-Forwarded-Encrypted: i=1; AJvYcCWbUYZ34wnxwlr6SXU6u9lpPq76Pyxj4RVQtv1x0L5aKB8cqGDy5OcaYAWwLHW91r9ycnLHpW33PfQknPI3bENj@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi9ecRQPyXEJPh5ZI0D9Fvnurpw4DMk5qQbaCa1ghh0g2t8+d4
	aKVGgzrZ6XZBR75TRdxl24hW5Jw3Ttomm1DueQBAmbnv5wGq05wj6oVqzsLmTg==
X-Gm-Gg: ASbGncsk3msYwL8kh1EM5U/2Ea1id3BRHKv66M/oopu6VUBjE/eGElwysMNVY2Afgbs
	blJiL3SGwhfaz+xM2H+21caBGKmRFVs+iy7A5kzUonjPTN1Cgkivct0M+Tyh4ZazjIi++VBJpGR
	dl614l98xYBwhTy9aEhf/oBQpiMRv4bSTzGPo0KOvI6RMd/6Kl+AvSgdehxSYfMSHp1DByPCo4R
	mBgmq+oQAk8s+P6rNAAcsmToJpA/VCaCIsIxXLhupcJ0EDzI4jFXP5OuLtrVVcv91hi15p6fwlP
	L5KkGrmLiYge6bwpCoyO0Y293tGLjXuiskP6XCeLDcVNC5OY/KF0vIrJ7LOcNLI=
X-Google-Smtp-Source: AGHT+IFvXw+OvC4N/IKxwnR5Ayk0dG/Aagp8HSvp5fGkA6z7Brsy0CGy7v+QNECgYTSPzGrZqtSVWw==
X-Received: by 2002:a17:902:ce91:b0:21f:465d:c588 with SMTP id d9443c01a7336-22307a60c47mr3818095ad.14.1740502078043;
        Tue, 25 Feb 2025 08:47:58 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a095f02sm16558235ad.152.2025.02.25.08.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:47:57 -0800 (PST)
Date: Tue, 25 Feb 2025 16:47:47 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	joro@8bytes.org, suravee.suthikulpanit@amd.com,
	robin.murphy@arm.com, dwmw2@infradead.org, baolu.lu@linux.intel.com,
	shuah@kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v7 13/14] iommu/arm-smmu-v3: Report events that belong to
 devices attached to vIOMMU
Message-ID: <Z730M3XptvDRObBp@google.com>
References: <cover.1740238876.git.nicolinc@nvidia.com>
 <b1930038cf828dc13c080e2b46b3003a8c98ef24.1740238876.git.nicolinc@nvidia.com>
 <Z7zmErar4YvQSSxw@google.com>
 <Z7zrHn3tPBD5chv1@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7zrHn3tPBD5chv1@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_084759_320095_13982A23 
X-CRM114-Status: GOOD (  30.04  )
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

On Mon, Feb 24, 2025 at 01:56:46PM -0800, Nicolin Chen wrote:
> On Mon, Feb 24, 2025 at 09:35:14PM +0000, Pranjal Shrivastava wrote:
> > On Sat, Feb 22, 2025 at 07:54:10AM -0800, Nicolin Chen wrote:
> > > +int arm_vmaster_report_event(struct arm_smmu_vmaster *vmaster, u64 *evt)
> > > +{
> > > +	struct iommu_vevent_arm_smmuv3 vevt;
> > > +	int i;
> > > +
> > > +	lockdep_assert_held(&vmaster->vsmmu->smmu->streams_mutex);
> > > +
> > > +	vevt.evt[0] = cpu_to_le64((evt[0] & ~EVTQ_0_SID) |
> > > +				  FIELD_PREP(EVTQ_0_SID, vmaster->vsid));
> > > +	for (i = 1; i < EVTQ_ENT_DWORDS; i++)
> > > +		vevt.evt[i] = cpu_to_le64(evt[i]);
> > 
> > Just thinking out loud here:
> > I understand the goal here is to "emulate" an IOMMU. But I'm just
> > wondering if we could report struct events instead of the raw event?
> > 
> > For example, can't we have something like arm_smmu_event here with the
> > sid changed to vsid? 
> > 
> > Are we taking the raw event since we want to keep the `u64 event_data[]`
> > field within `struct iommufd_vevent` generic to all architectures?
> 
> The ABIs for vSMMU are defined in the HW languange, e.g. cmd, ste.
> Thus, here evt in raw too.
> 

Ack. Makes sense.

> > > -	ret = iommu_report_device_fault(master->dev, &fault_evt);
> > > +	if (event->stall) {
> > > +		ret = iommu_report_device_fault(master->dev, &fault_evt);
> > > +	} else {
> > > +		if (master->vmaster && !event->s2)
> > > +			ret = arm_vmaster_report_event(master->vmaster, evt);
> > > +		else
> > > +			ret = -EFAULT; /* Unhandled events should be pinned */
> > > +	}
> > 
> > Nit:
> > I don't see the `arm_smmu_handle_event` being called elsewhere, is there
> > a reason to return -EFAULT instead of -EOPNOTSUPP here?
> > 
> > I think the current behavior here is to return -EOPNOTSUPP if (!event->stall).
> > Whereas, what we're doing here is:
> > 	if (event->stall) {
> > 	...
> > 	/* do legacy stuff */
> > 	...
> > 	}
> > 
> > 	else {
> > 		if (master->vmaster && !event->s2)
> > 			arm_vmaster_report_event(vmaster, evt);
> > 		else
> > 			ret = -EFAULT
> > 	}
> > 
> > 	mutex_unlock(&smmu->streams_mutex);
> > 	return ret;
> > 
> > Thus, we end up returning -EFAULT instead of -EOPNOTSUPP in case
> > event->stall == false. I agree that we aren't really checking the return
> > value in the evtq_thread handler, but I'm wondering if we should ensure
> > that we end up retaining the same behaviour as we have right now?
> 
> Oh, it looks like -EOPNOTSUPP should be returned here. Will fix.
> 

With the fix to return `-EOPNOTSUPP`:

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

