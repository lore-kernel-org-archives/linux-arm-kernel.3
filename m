Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4AFC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 18:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ftw/IjMpgU7GPfLzcouQoWIfms9GOb854vnlNb5+taU=; b=d9TU9mXoDiH1+aTcBaHfMWeRdQ
	U9JVyLlyMd8GDMBfHZiF4sBXmVoe9k/DDMQtxgYp095FwfruG+DmHdyGvATIopeAqvbbX2p1rVKtX
	k2uj9KzGbXZR85CwvFmj3sZbonYAnukEsBUhQZ9xlDcw+CJBBmGc98MYehWcTQNiVOjRltG938fgc
	DPYie1KqZ5dlQvSwV4Xo0qFOAXmnFtvWTZGam8nAVZl/10I54Emk/e7aTcSR5OBZ/C353oPXPYt9F
	QxK0PPe1WwkYy+uMqwV5dd7sHI+fSZjVsHRzB8dqJ0FHdjCZMlMdkSFv0/2glsQz8ExMl7j4Xi9Mp
	jl1nRxpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pT1-0000000AUvY-2Jxt;
	Tue, 29 Apr 2025 18:14:03 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pPn-0000000AUXQ-36yE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 18:10:44 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2242ac37caeso43305ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 11:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745950243; x=1746555043; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ftw/IjMpgU7GPfLzcouQoWIfms9GOb854vnlNb5+taU=;
        b=Bz3hHQzR7oSKyZGfHzenrKELD2RXjLXvV1/tmdYYFljlXIhtVcMjPugo8wDDEKMieG
         fzgDVCOi9zDu3RT/gKkVbGcSSIlcUubareV60yeDrC9hpqXxP0lcg+geTRc4BimoYDQc
         3jOCyDrEDm83kJK3W2DJo1aiYmm1SW75+R2djAWDqktWGavbaAPFdyq2CCnCAAdUZ+Y3
         0mTrTKRsPlsHw42t2xxt5e37KWLmPmxAVKhVFntkxQT/n0QA4wRj4NaUVIwtt5o4BoJ4
         PFaMv8grmnylxAUpFAtUOzAOzbTWJMZDPNeNkzuwjjCzgxRMZMhemFTbcAWXv9Qpv5d+
         7xDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745950243; x=1746555043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ftw/IjMpgU7GPfLzcouQoWIfms9GOb854vnlNb5+taU=;
        b=PHajAU1elIlIruDNlv0C6oJmSwm1Yvjz94B9zRwl6ZgqrmAtrx0Rj2ov1C6eQkyyJc
         6LiXZEj8XyMJ9wZEFxbzM9tLKwtMQ2t6lI4a4iOTKZRIg2ckkHDnuBghmGAuFnJJdKtj
         lB+ZlMe061J4EeSbJ2Mzrur4jGx6JtHi7us6/+hrNiFIrEyNe/3JMy/n1TK8ycSIDQoM
         +8QOsEG5ONU8UpyNwM1q3qi62XRJNPZ0JncI4JF9sA9keYZVdQahWIN2L1SJGvprmMYz
         8zrFBlHnUJq7hm27lJaOnE868oVyzN7/U05J+iFU5C5vR8lcFgcpdSUTXb/fMnwbEHND
         nzBg==
X-Forwarded-Encrypted: i=1; AJvYcCVDEx5RMesN8C19o87LxEsUikCTvWQhnXUlX87o5Gh2DQehAq34BLRG4DUnyr9EdWozXZpk8xn4AMoA42nwAG0Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc7iPFqEahOozoxFEvWZHvDS7XoQc/+3dZpr9YRY+JY+t2nrHW
	H5BKyYwS2xMMRQ0QA9pH3anca3vRbyq356YPmTdQaYOAZL34+WYEGYIeYWwUYA==
X-Gm-Gg: ASbGncsv484x18CJAhvbMjzmPwu3IbHkaV8nC58FPPd2Tu6pPtjEDEXzuh0SHtNtD+k
	uK1Y48tCXiuMBphwUSy6cEbjMbQ+C+VwJXi1g0ClusL/Zhaf9xzHtUjcIXhjN8S7t/z3SiDZC76
	o/zZc96TeZ80DUc5Fqj1Eg411O9o4djmL8tYP2/RWeeBMalWOtwAF/P9aATh4ojbzXM77oCCSD+
	xgPFWJPNuNsdtTWljt9uQ+8p5xO0Rmvg9TOj/hhgXyhVm2OYbH62LJlQPCBoNthlv6JJ15C223D
	KwR006LOfuyaAROm/2e8Ist2dwKw6eEQtG3Xezdti0NUGRtPQpOudOY9ekUbt8Sb8P9RO6QR
X-Google-Smtp-Source: AGHT+IEGtuGPnrFdA7EnAS7AeHO3rAMJ1bXf2n0ATFrXiwa1CPLZUhde5Z8nusKLhSnrBiMW3CwVgA==
X-Received: by 2002:a17:902:d486:b0:224:38a:bd39 with SMTP id d9443c01a7336-22df406ab2dmr130415ad.20.1745950242565;
        Tue, 29 Apr 2025 11:10:42 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912efbsm10222670b3a.23.2025.04.29.11.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:10:42 -0700 (PDT)
Date: Tue, 29 Apr 2025 18:10:31 +0000
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
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 10/22] iommufd/viommmu: Add IOMMUFD_CMD_VCMDQ_ALLOC
 ioctl
Message-ID: <aBEWFw2wq40SHjTn@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <094992b874190ffdcf6012104b419c8649b5e4b4.1745646960.git.nicolinc@nvidia.com>
 <aA_0TV0RkVOHk7Qj@google.com>
 <aBAEuP9962XweHPc@Asurada-Nvidia>
 <aBCNkcLp6XZpjYYT@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBCNkcLp6XZpjYYT@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_111043_786235_3C052601 
X-CRM114-Status: GOOD (  18.32  )
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

On Tue, Apr 29, 2025 at 08:28:01AM +0000, Pranjal Shrivastava wrote:
> On Mon, Apr 28, 2025 at 03:44:08PM -0700, Nicolin Chen wrote:
> > On Mon, Apr 28, 2025 at 09:34:05PM +0000, Pranjal Shrivastava wrote:
> > > On Fri, Apr 25, 2025 at 10:58:05PM -0700, Nicolin Chen wrote:
> [...] 
> > > IIUC, one vintf can have multiple lvcmdqs and looking at the series
> > > it looks like the vcmdq_alloc allocates a single lvcmdq. Is the plan to
> > > dedicate one lvcmdq to per VM? Which means VMs can share a vintf?
> > 
> > VINTF is a vSMMU instance per SMMU. Each VINTF can have multiple
> > LVCMDQs. Each vCMDQ is allocated per IOMMUFD_CMD_VCMDQ_ALLOC. In
> > other word, VM can issue multiple IOMMUFD_CMD_VCMDQ_ALLOC calls
> > for each VTINF/vSMMU.
> > 
> 
> Ack. I'm just wondering why would a single VM want more than one vCMDQ
> per vSMMU?
> [...]

I guess the only thing on this patch from me was to understand why
would a single VM want more than one vCMDQ per vSMMU? (Just curious to
know :) )

Apart from that,
Reviewed-by: Pranjal Shrivastava <praan@google.com>

> 
> > Thanks
> > Nicolin
> 

Thanks,
Praan

