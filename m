Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC71C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 13:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gu+E2JdVa1JRknmwyrW0o138XPVwsj6HNCm/db6x0Ac=; b=WUPtBNMnoFboDYEtrnWu4eDT+L
	C4qbkkGXCDg7EhnVMoJW7+plQ2EODorOSnpdztQHx6D61Vl/oew0AZruxD0+iR8W+74IJIks5lkEs
	rJBYGDZlKGfDI+Y7W0lw743Hy44nVvabISCi+1tYzzeOlyNUWhevz0Hr9KVhlCJhPADOAuke6DRR6
	aQBU+Xqa2zELSpeEDaI3MBhBjUyeRpe5jBURfA40eqiQvhLe9QlhGfw2QJTrwxUR8tsscH+gCvcAY
	FQuFbBRMVs3Lx98F4wuqZHmu2t/zt1zIzPtv5jxQAvd4lQb9QgXe9+A8wHueThPsZ9EQAmR07bDsQ
	GIP7yJrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weud8-000000026yf-3qWb;
	Wed, 01 Jul 2026 13:05:30 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weud7-000000026y3-0AIR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 13:05:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493b8d99342so41845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 06:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782911125; x=1783515925; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gu+E2JdVa1JRknmwyrW0o138XPVwsj6HNCm/db6x0Ac=;
        b=wfS3fIiZnamQs5xW8HtX4jbJA5pEp64sShN+mdK+fHNi2c9vv5+JCNUKKre/c5cosd
         MsZ1Uth1vB8HZ/cymQG4XqFw1wQ/D23dHilYdaFJ4OljnZne8HR5P1Hzm78gb7jj7Ftu
         lhcPU7yQHE5m7sq9UPUcLU85odcjHDwWfF2159K7rCwCgT/DI7MjJDusyEIsDtJyB/Ar
         n36XT92Os8Hi4RiDbhh1vOCkF2GuLvgmnzLX3GqfwdvZNli7PgANIye1Z8R75DvPtICb
         9geTO+LoB/QjYKpqnVKb8ckZ7SSy2A/bU8nGqxEs4YEW7KTu9kGIZArly6lkR66e7JxJ
         YDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782911125; x=1783515925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gu+E2JdVa1JRknmwyrW0o138XPVwsj6HNCm/db6x0Ac=;
        b=LhSQ1es5PcTOXyrDIYKspnaQCMNFoTxvaOU17SZo/IlGNeBFtqfcyl4/yrzxsBCa7e
         dXGg+idrAREkYjlW86gXn0l8GLyto0xQ2ySA80eAqbalko06zfuqWVjQsEmADB9VhuDN
         1flE/hbWEhDNaAL7l+gssSIBJiVUPEUSBghpa0amU68zNOLLhPCP0jY4GSX0FVCHUCog
         v/rIkUkdH5T86ivCSeNI9cm45ItrUFUbmzFHqlPZA5+Clze7YpftPZKuGJOroMSKiBYE
         qWmkCjP5rlkE+3xqFkQoOO6nAp6lYu9Uqerr/zxEJ6NM7du9LPMo9DWsNysKnmvGIqYB
         EF9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+A97iski59iAt1RhHbKM/eZ0LHrtEjyfAO7IYjnM3sCSkOi/yocAbrkTZVmsHenzuzaGybu3fkFMu6vSyJsATx@lists.infradead.org
X-Gm-Message-State: AOJu0YzEmuFuaX7ge5pDMuYJ9nCBrmYEqwm+fS+qLopFAKVIEhTqVFl4
	vgeBmUJTjkmImj/gKEsU6ASbmfL1llAMP51n8lBu7it/7QHm4MTfzzHIRWVA4V1cRA==
X-Gm-Gg: AfdE7cleVxkx0WJI+x/eVhfujKFS1U4ixTEAIO5YR+zP1FW8b4XppDh9CHA2iw50WKa
	RWh1I0/UKq9gfafUenXKxVNqS7XrTgRMnWTW0pgfBxpK3BSILcP4hjGMwxv7OVU514X2Ck8C5yU
	/LVqj3MOcgFz+uQPVUZyK9oO5P2waysAHyggACGYFPmairk6+Htg2VPQeY5kqcmdQK9njIRyfZd
	81AdiCf4uJH6Q6zjjlNXwlTz5F8VbE5h7X5EVA6j0I79L514/I7U0qgyWiqFw8lHWd2+7r0VO9z
	gsNfbilg6gHfKCy/GpvDUt/Ec76Vu7I9vRkXT31PRezA37qRTajyOJ0hHCIvVAD5P9jbgutrTNc
	f777bJ6WWtMg+n5LILdN2ASjPPgoU0sDiaHAsQhl+CaRe5wHaZM6hSmqT+Z2t+LeYEj+mG3xH/E
	VVNq1XHEKLkJYP7zquGhnHfBHSm0DxTAgkTnkbVm33si41krQjMow=
X-Received: by 2002:a05:600c:4b9a:b0:492:203f:a378 with SMTP id 5b1f17b1804b1-493c0bca5e0mr702615e9.8.1782911124942;
        Wed, 01 Jul 2026 06:05:24 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47566743895sm18099701f8f.25.2026.07.01.06.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:05:24 -0700 (PDT)
Date: Wed, 1 Jul 2026 13:05:19 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Pranjal Shrivastava <praan@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, kees@kernel.org,
	baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, jamien@nvidia.com
Subject: Re: [PATCH rc v7 0/7] iommu/arm-smmu-v3: Fix device crash on kdump
 kernel
Message-ID: <akUQj2pa1W-MekgF@google.com>
References: <cover.1782799827.git.nicolinc@nvidia.com>
 <akPB6l-fuJUcg4a2@google.com>
 <akPX_N0P2EcI_jbV@google.com>
 <akPhuF9pAWaBXzpi@google.com>
 <20260630185942.GF7481@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630185942.GF7481@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_060529_137074_D22B3F88 
X-CRM114-Status: GOOD (  26.61  )
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

On Tue, Jun 30, 2026 at 03:59:42PM -0300, Jason Gunthorpe wrote:
> On Tue, Jun 30, 2026 at 03:33:12PM +0000, Mostafa Saleh wrote:
> 
> > For example patch#1 verifies log2size and split and both are read
> > from HW registers. Same for the base address or other addresses as
> > the page tables, they  might be corrupted due to a buggy driver.
> > My point is that, it is really hard to assume that the previous state
> > of registers/STE/page-tables were valid or even consistent, when the
> > kernel crashed and did not transition the state gracefully.
> 
> Sure, and this mechanism is probably not very useful for debugging
> these kinds of errors in the SMMU driver. Oh well, that isn't a common
> source of kernel crashes :)

I hope not! Although memory corruption can happen due to many other
reasons :/

I am not trying to bikeshed, but I wondering if there is a more
reliable way rather than doing archaeology from a panicked kernel
SMMUv3 configuration, as I am worried that will be even harder to
debug if it goes wrong.

>  
> > Similarly for TLBs, the kernel might have panicked in the middle of an
> > unmap or free domain. (not to mention what that means for RPM where
> > a device reset with unknown TLBs)
> 
> TLB is fine. kdump works by carving out a chunk of memory for the
> future crash kernel. When the kernel boots it ignores all the memory
> used by the prior kernel. So DMA can keep running into the old kernels
> memory with no issue. It doesn't matter if the TLBs are inconsistent or
> not.

Ideally if a TLB is to be missed (because of the panic), it should not
point to kdump memory as it is carved-out. However, it is still a leap to
assume that the TLBs are in a good shape as I mentioned with RPM (or
even if the device resets transiently for some reason) it can end up
with garbage in its TLBs.

Thanks,
Mostafa

> 
> Jason

