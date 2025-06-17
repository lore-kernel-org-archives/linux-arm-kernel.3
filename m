Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFE7C71155
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 05:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqy+/M9QHJY6wwtqs4c/CeBC/StH/tZ5ncI+kmSkSV8=; b=T4s/dDJn1sxBPtqxeQsiFK7qQX
	SjHa9zqe/4FQDhJqBjmQaio+aiydBv+33n2YE4CRUp0wj7OSqXpHLRsmQ/ATzDj7wxwO2XpTnZZoG
	5AGCkJaWamZrS1a/ayPATAwL81/wHsZuSO7UN/jYSdKq5p1kr2IA2vAK5LXlsFfu6WuOUN2XSs9fu
	XbLQfPXBNje2LpEfDH+XjUHeVV+mHWo8iXX5jbtKAPW/pWVvBfN/jTJ8dWqg1UQnFa2QdPqEbLDZT
	qWvJDJjfEFDPn3G5FRiZrx3XzlBK/9i2J3ibPs3zzW1k5Csz1ejqJ0C32Wk5zlOvrahBlaQQGX/eE
	q+ngrUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPCn-00000006IXL-2rp8;
	Tue, 17 Jun 2025 05:49:58 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRP6O-00000006I2j-2rNk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 05:43:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2348ac8e0b4so83735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 22:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750139000; x=1750743800; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vqy+/M9QHJY6wwtqs4c/CeBC/StH/tZ5ncI+kmSkSV8=;
        b=bUNLA5iOK1TpnFTsJhbYQTziL8z6mqnxaYRW4EEAf1VesTjQJ4s+GPuPDR9Lwm8Dz6
         xJvXJu8Y9w0n3axpKh4FlpbceHUjfg01v0d1JNrqVgP+1whuPgJa98XBiUHfNRcagjmB
         jNrNHP0epZZyq6YsCG+Z/xlckpuj0RT4eWdgt+nL2PhHwTkRTF0S4I/B2f780uLj+nMp
         fV7amrqKwugW8FC28dZN/UA+IsHsCVskU3CnUJ1YWN6lVYMAUITk+0IozZwqt4qdA6Dy
         /LhE1U2xeX9VPQedZEh/vxLmpHvhbRKs/l6stA3RfLnuYAaIp8Qov8FB0EW1daqPnRb3
         fzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750139000; x=1750743800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqy+/M9QHJY6wwtqs4c/CeBC/StH/tZ5ncI+kmSkSV8=;
        b=G1CHdXdrpuRV9ZwzOTIV3KwGXNoqZC72gsUGv63MdoqkjFQ4RpL59lHf7dubOdxPYP
         O8hez0oArhf6xyiz8JfjFWHxwUSmgzohvt2T+8jM/8O0f0WbmUrP35kcclfgcLYJxI+F
         rqIdHxJd6V9/7T4p3USKMScVKyZBiyKIqmccBcdV55WdWbQAwdclxnSp/f634Nz4Uv2P
         fkZPmf2jGvROzK0gkfLTnm41CxyL/5zN/9qR1aRV9LmdhCENEfiMUCSQ9dPILijRXRbn
         weFGYfifZSJl5cp5THx6sm/2ZsCBCuZ8Y02yUIpbqI44RB1ANx+EIYoQ4QdFG+KwyDoa
         hAOw==
X-Forwarded-Encrypted: i=1; AJvYcCXE4ESazX9vJOmenzQ5S6tFXX6JKDKXpBLU9l5/K0M6t+Cb6GLNEO69szO1DgEdK0u1IAOqVQpV6U+NWMwPF6Qo@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5/6SV5Bo2+7UVdA73/k8cHe2m3/uQkheweBpVktMCrZYToRDW
	AJv/PMu3fLPPTov/as1YZzkMgw+2mqz4F83zAgwox6w1PXKrwCrINZBC56hzAYvt9A==
X-Gm-Gg: ASbGncs0mFs4I973rfPxwhN2sfvmi+ah+0hu01WIHxFdXrtAP5A2Oe3svavYb6rgQLC
	IkmTvnZ5YVfQWpCjhJcEnqvPR+ON4/0xfigxE3KJn7c/L7oU9iNSk843cS0pvXO07U7rV+508sk
	2OZNLj6jZWWNpAjlkbKlI4KuR+4K/SVaNS84JJYdFi16nyC2p87gptWLW1fSiZwCqADzNHq+EmK
	/JModY4hBhXaESnQGeAWzusEQUkbONpazNI18OPDqYD6R4lH2p5dTyWS2LzP8Y1RhQubBERB2JC
	TYHOrqhE9A8sFYmwzcog9yuUjuGTHFZGEmtgCq5cZEZbktxKILBRFAkt0B8UdHnVDwEa/btHr1Y
	s0R4SlIlLHRlrwOWC/r/t
X-Google-Smtp-Source: AGHT+IFZAGH5Q2HoxTbpqlW9at8Yr/ZmYieszNEdcG0xorIcE8VWLoKmbjyoc4gI81zSv/z5UnBfOQ==
X-Received: by 2002:a17:902:d48f:b0:234:c2e7:a0e7 with SMTP id d9443c01a7336-2366c5bf6d3mr7082695ad.4.1750138999607;
        Mon, 16 Jun 2025 22:43:19 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bcbb39sm9722410a91.8.2025.06.16.22.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 22:43:19 -0700 (PDT)
Date: Tue, 17 Jun 2025 05:43:09 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 10/14] iommu/arm-smmu-v3: Replace arm_vsmmu_alloc with
 arm_vsmmu_init
Message-ID: <aFEAbc5URD93out3@google.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <64e4b4c33acd26e1bd676e077be80e00fb63f17c.1749882255.git.nicolinc@nvidia.com>
 <aFCeCvKkm1MvT3xP@google.com>
 <aFDPtzY3EygoOpUx@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFDPtzY3EygoOpUx@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_224321_888229_31419C79 
X-CRM114-Status: GOOD (  25.31  )
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

On Mon, Jun 16, 2025 at 07:15:19PM -0700, Nicolin Chen wrote:
> On Mon, Jun 16, 2025 at 10:43:22PM +0000, Pranjal Shrivastava wrote:
> > On Fri, Jun 13, 2025 at 11:35:22PM -0700, Nicolin Chen wrote:
> > > To ease the for-driver iommufd APIs, get_viommu_size and viommu_init ops
> > > are introduced.
> > > 
> > > Sanitize the inputs and report the size of struct arm_vsmmu on success, in
> > > arm_smmu_get_viommu_size().
> > > 
> > > Place the type sanity at the last, becase there will be soon an impl level
> > > get_viommu_size op, which will require the same sanity tests prior. It can
> > > simply insert a piece of code in front of the IOMMU_VIOMMU_TYPE_ARM_SMMUV3
> > > sanity.
> > > 
> > 
> > That's what I was wondering, so we plan to replace the impl->vsmmu_alloc
> > op as well?
> 
> There is no such op in v6.16-rc1.
> 
> > > -	return &vsmmu->core;
> > > +	viommu->ops = &arm_vsmmu_ops;
> > > +	return 0;
> > >  }
> > 
> > Seems much better now that the driver doesn't need to callback to the
> > core for allocating viommu. One quick question though I see we've 
> > removed the following too:
> > 
> >         if (master->smmu->impl_ops &&master->smmu->impl_ops->vsmmu_alloc)
> > 	                vsmmu = master->smmu->impl_ops->vsmmu_alloc(
> > 			                        master->smmu, s2_parent,
> > 						ictx, viommu_type,
> > 						user_data);
> > 
> > Not sure why don't I see that in the diffs.. do we plan to split this
> > into an impl-specific size and init too?
> 
> Because there is no vsmmu_alloc in v6.16-rc1. I guess you are
> referring to older versions of HW queue (vCMDQ) series that
> was not merged?

That's right, my bad. I rebased the older series while pulling,
apologies for the confusion!

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> 
> Thanks
> Nicolin

Thanks!

