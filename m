Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF578C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 18:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQjNcvHYakrNgjIQGLE/wyS2yfZF4798fujbYGUPWpc=; b=sP+qnQtT9Vhot8kT8kVYf05TYx
	MF2p5yGmjQ1By9k8js1ku7fBp4WTVticmHY5yeRXL83U8+ZUoCx+GxtvG+TBLkWtFq61qnK9d0KQR
	+YWT9iFOULT+oSC1xAtTcWe/CJQKAKJVDyTNRMORpMfGDivEWB0SSl4/gyeZ2f/yWedk55sdRvfXD
	UeMleE1HD5+C1lVM/DWMNnAmoIw9zFsFCZ4fXPyQWZpvUi87nCbSyy7PIQjzsL477Jxb1I6LZpa3Y
	cP36v6iqtvpWTtdnow0NnSfmSNhaJgyBm0sr9S56fiYCwWYy3BJyyxZsiOjoiYLVeEH0Clu9xC30u
	B5/uIkSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTmAP-00000003jO3-2WHO;
	Mon, 23 Jun 2025 18:45:17 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTis1-00000003BQT-1Cz2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 15:14:07 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2357c61cda7so223485ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 08:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750691644; x=1751296444; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQjNcvHYakrNgjIQGLE/wyS2yfZF4798fujbYGUPWpc=;
        b=nTt/03fYNTqM9aOD9kP53/LCSJbJMB/PQN3LU/Xkh4eh4eK85Hn39ItGLioT9cZmT+
         kDbjBcu0SlIfXseNxO3UR/oIoTBEH0wVMFY8/zdeXjUQZTUgdA7u+LwATTfWqEz/BQAK
         B3RIcjAm/IYeItdTvc2oBtFgd6nii5XCaGh1uR1CbvhX5yDCh/YGIXfQQ44WWr3XzzMS
         qp/tt3bxWb0pRri3pbShlUXEud+K5MIQyPsIdxI9Aq71yJjKVfBGsOKrlBJ0YbLonAmB
         D5aYFUjf/SzUkW8AJMdJsdHXmhrvqkhHWOBi0bYWejv1u80jFIOWHPT5MF+7ToKf0SfM
         kNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691644; x=1751296444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQjNcvHYakrNgjIQGLE/wyS2yfZF4798fujbYGUPWpc=;
        b=QSjALiPt4BJDq6Pc6i6eSLu9K068eP2/YJbf+26FVE2AipeY8Lepn+rdtE6nOaLHtj
         M4LPOqNMRi8kFYnY5MhLzgEg4aJ6VUdf8OVtAR6uAz9L1uc2AgyzQDE1ZMlnmBYJNj9o
         jNkuo50wdC7f04FLKNbvuzTcFIUDdlYL9euRjXGwF0hEnVsrvk4I8i+xH6aHt/5Jj/lI
         9mRYKPicyDVC6Vxr807FxTLl3R3lCg7EcrtVGc5F4xIzPPk/6P9fidmUy3/pLr25cJsR
         EFE6qoPZGWYEbwjEvIfxJAmuXW3sR6PMPTEFfUeN45l+VO9wgoF8nILP0D5g5Y8L2Tl9
         yWtA==
X-Forwarded-Encrypted: i=1; AJvYcCVd7scrg7hkZb8LaOoibGWiJehnLolEZoRL2yL0kGF9BeIMxUSBCalIny79chHYIJvDmxvwYrNZbi8aCuCZ3Hfp@lists.infradead.org
X-Gm-Message-State: AOJu0YwftWdtpKuVUoJaAXvn1BkAaOMZ5jWWBOJiezf3Y3RJzwlLh0Yq
	rXXdAIrS/6Zgq/JBk9zGup1jrDs25N/OGm3TbfGjAxfzGROI7Za37ac0jIPwJ/7TlQ==
X-Gm-Gg: ASbGncutyz6dW1Eu5iYDYUXc04njB3gjDsXa4NcaauoBMZXrVowlNI4B+htIiAvYemE
	oBKP4F7BSdxWwJSBpLqqNvGEHraRweV9iY6VbigbomB644w4rAiTpPFudN2vhIIaC8aoYPu4VV+
	AmxdfP04btAhRLc0So2WF2CfE6jd/f4E0jhrQrdnSmV9oWoKCafYYsj2pdsbUCZrzZuVFzvGqPX
	LW9xsU3QFNG+omJToBk18RKyWkK3Tth7fojO8LtrNiffe/2N5YwskYa5H6mBkbSOGRUSwFO4feV
	RARH8Mcpu2J1mJq074Yr7RCyTiG945LBHP8zpSl1Zzp37P2fkAjZZZA89JxL8H6i4FCtXKjwmEn
	d3tv1zxG8SXAnzNKvKUxUFcZEsp4CMvQ=
X-Google-Smtp-Source: AGHT+IFjZuHSmjWz3mlyiiORGjulfaekm2TrngIFHZiE0ZqJkNGQDEFi3n1LBmgMIlW05C9z3Da4aQ==
X-Received: by 2002:a17:902:e951:b0:224:6c8:8d84 with SMTP id d9443c01a7336-237e478a96fmr4808555ad.4.1750691643222;
        Mon, 23 Jun 2025 08:14:03 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23e6fbsm11004566a91.14.2025.06.23.08.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:14:02 -0700 (PDT)
Date: Mon, 23 Jun 2025 15:13:51 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kevin.tian@intel.com, corbet@lwn.net,
	will@kernel.org, bagasdotme@gmail.com, robin.murphy@arm.com,
	joro@8bytes.org, thierry.reding@gmail.com, vdumpa@nvidia.com,
	jonathanh@nvidia.com, shuah@kernel.org, jsnitsel@redhat.com,
	nathan@kernel.org, peterz@infradead.org, yi.l.liu@intel.com,
	mshavit@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 20/25] iommu/arm-smmu-v3-iommufd: Add hw_info to
 impl_ops
Message-ID: <aFlvLw0SHgYiA614@google.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <f36b5e42bac83d0cdf5773cad1c3a44c3eaed396.1749884998.git.nicolinc@nvidia.com>
 <aFP4zHIVT6epJeLb@google.com>
 <20250619185325.GB17127@nvidia.com>
 <aFTWQ4v6aZABpzeV@google.com>
 <aFZE+MhTOCvbkKbH@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFZE+MhTOCvbkKbH@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_081405_351174_5DADAA99 
X-CRM114-Status: GOOD (  17.93  )
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

On Fri, Jun 20, 2025 at 10:36:56PM -0700, Nicolin Chen wrote:
> On Fri, Jun 20, 2025 at 03:32:19AM +0000, Pranjal Shrivastava wrote:
> > My point is that in-case someone passed INTEL_VTD type, we would end up
> > calling impl_ops->hw_info and then the impl_ops->hw_info shall check for
> > the type to return -EOPNOTSUPP. Either we should clearly mention that
> > each impl_op implementing hw_info *must* add another type and check for
> > it
> 
> Let's add this:
> 
> @@ -721,6 +721,11 @@ struct arm_smmu_impl_ops {
>         int (*init_structures)(struct arm_smmu_device *smmu);
>         struct arm_smmu_cmdq *(*get_secondary_cmdq)(
>                 struct arm_smmu_device *smmu, struct arm_smmu_cmdq_ent *ent);
> +       /*
> +        * An implementation should define its own type other than the default
> +        * IOMMU_HW_INFO_TYPE_ARM_SMMUV3. And it must validate the input @type
> +        * to return its own structure.
> +        */
>         void *(*hw_info)(struct arm_smmu_device *smmu, u32 *length, u32 *type);
>         const size_t vsmmu_size;
>         const enum iommu_viommu_type vsmmu_type;
> 
> And I found that we could have another patch changing "u32 *type"
> to "enum iommufd_hw_info_flags *type" to avoid some duplications
> in the kdocs.
> 

Yea, that sounds good. Thanks!

> Thanks
> Nicolin

