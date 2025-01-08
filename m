Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605EAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrYofVOoKvKwnZPsYWd13Rqdme4LuIQHlAMqCcS50NY=; b=izKLOaeBElCcZaPGtvTilnBJul
	fzs39etIin9KQr+t8WrctIvDLPs1Sj6DwvrgDS9KhW2I6aO0MyhNR80oW1AU2RcoBCsl5JfGGGlXw
	QwVEPmyMRvaniOLJWGh/QUTUV3wLDG/yAAh322rOHPdQUw+1hMsSQKx3jAvjawk3zVamF7iRaUbAe
	xaBnD8NIjhh+4RaUkC0EJOE1H51Yo7iSDMUy8bWVsVuOSnmlyekuDfEat/9Lm0DJAB6an9kzWqtnV
	W8sJfboRD6feZokgW2Viejapwq1feuYZ2P9eFQpyIOsw/picpSCtdaIB3/M2KSTP5OFMXEMFnDrev
	LHfGIySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVf3-00000008WcQ-1Ef4;
	Wed, 08 Jan 2025 12:59:49 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUwH-00000008NNa-1D96
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 12:13:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43621d2dd4cso46785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 04:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736338412; x=1736943212; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RrYofVOoKvKwnZPsYWd13Rqdme4LuIQHlAMqCcS50NY=;
        b=bLgFpd673rlrjYySDfYKJAuiFisRQoxIhK34tPhNS/3pSvr+ZqhGrhx17q7phDkin0
         WLpepH0k0mEp1WXv5WPVVlDbKCz7tKJfK/42xPSFRoTOR8Xg0OgJhTW32C/w/dLkrrGH
         44N1jTyVVNcuZr5XqPZouIJqolRyJleG38lOPTBjp3+yMR9xapkkJOpzhvZXUTJ7u7Ev
         tzW4SkYblFAS1rk3zeQJ/WglxaC0gOfACDJYLVC0hPCz6WUUcT/wQEF6+V1Adid9/D0W
         yjHl4ObOPn3510lJupQQsYjMFOgdmse8q6KfyJl9dj7A0MV49rqu3afD2CC2dKCGJZq/
         wQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736338412; x=1736943212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrYofVOoKvKwnZPsYWd13Rqdme4LuIQHlAMqCcS50NY=;
        b=bf+M6flOJbcc68jG1N5qzog+jzqNxSl6jZBbJqgau6Q2TRT2UOI1fcSz+u+gtmi7s2
         1Dj4p57SMBdMUQ4fO5o0dBZe9jNkUVRwbonj89ijTcjxnX4fuZdAevqyi1AJsZvvgItz
         Uyz4l1OijchaMZXKC17EEpP4quE8ooxLsTDDIyBz9GzelqHo1rVfnJGClT+GtoHhBquO
         oCtG6WNfn/4oPaZlxQoGthG3b9dUDxUyFNSl8f9HQU1B36qZL04YVLj16OjuJEXedrHt
         vBlRYM6K4G6mTVGcknc14A7KXFEaMlCT7J2T3MKX2EkEY2D18IbktVkcS+xnR0QOudU5
         +0Rg==
X-Forwarded-Encrypted: i=1; AJvYcCU5SQpz00MAvQNufxdc7LLO/a3Cxovmrjqi74eWx0Ulk4bU0zhol13iW+QrOZr8zjQ+NN+s8BMoj7XYkJG9wQH5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/Gm0P6EOmYSXWsP5qsedxVfKHEcVscukYhY1IYUQ6R1SloMvU
	nbowK1MWsE0QFG7++z4Rd/04cjt2H9PbxsIcxQDxEAkucaCJ7SKstkmDUIvxUA==
X-Gm-Gg: ASbGncvfWN3zWG/lyCcTwIjJaLdgHqPmXmKHauVHioXK8FWjNoJbNgp5weemRgzvGZ/
	vOw/pUr+XS+CkbJ3IyBfUVttp93vd9HkGTCTqRnxwTFMz/gh0mWTfkeLAsR3yoM6FkwsffO3oxY
	bT8MRSdpjsJuFtzz9qWisRhyBKzwCEdG7ACrbR4n4NAClSHqUyKBO16uBfIUNtrd0Gj98XgG8ob
	E+9xAyC6jXhgrzTzsfL7F4eWzGQxQey8vVjk4jwm6VhQ8pw4xC2pzqdxxdpx5dL5WRgLU8c7qNA
	9m6pIs4R8Ee3y3EH5o0=
X-Google-Smtp-Source: AGHT+IFSxU9Nih+nRcbTdqUehEVnjBOqg3Pc7JvHWVRd2oCHQ3onm9/9x+7dn/+oiTY0W8mf2rq1iQ==
X-Received: by 2002:a05:600c:4818:b0:42c:9e35:cde6 with SMTP id 5b1f17b1804b1-436e1f879cdmr1023645e9.2.1736338411667;
        Wed, 08 Jan 2025 04:13:31 -0800 (PST)
Received: from google.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89ca5sm18817135e9.29.2025.01.08.04.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:13:31 -0800 (PST)
Date: Wed, 8 Jan 2025 12:13:27 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	robdclark@gmail.com, joro@8bytes.org, jean-philippe@linaro.org,
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com,
	tabba@google.com, danielmentz@google.com, tzukui@google.com
Subject: Re: [RFC PATCH v2 55/58] drivers/iommu: Add deferred map_sg
 operations
Message-ID: <Z35r54_zgpmO6FQ-@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212180423.1578358-56-smostafa@google.com>
 <ce4c8db4-4895-426b-8d9d-97dc5d74fbc4@arm.com>
 <Z2Qshft8lQjI-x7c@google.com>
 <20250102201831.GB26854@ziepe.ca>
 <Z3gDuPe5C1Uj7y4m@google.com>
 <20250103154757.GG26854@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103154757.GG26854@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_041333_323258_CE3C6367 
X-CRM114-Status: GOOD (  20.29  )
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

On Fri, Jan 03, 2025 at 11:47:57AM -0400, Jason Gunthorpe wrote:
> On Fri, Jan 03, 2025 at 03:35:20PM +0000, Mostafa Saleh wrote:
> 
> > An alternative approach as Robin suggested, is to treat all iommu_map as sg map,
> > and when the driver gets the iotlb_sync_map() call it can just issue the hypercall,
> > however this call only provides the IOVA range, which requires extra work or locking
> > as mentioned in the thread, and as Robin mentioned s390 doing something similar,
> > I was highlighting that in their driver, this call only notifies the hypervisor
> > about an IOVA and not an actual pv map as pKVM, so it much simpler in their case.
> 
> Oh, that is much clearer, maybe incorporate some of that into the
> commit message.

Sure.

> 
> We are going in a general direction of trying to make the fast dma
> mapping path not require sg, so adding sg specific optimizations to
> the low level driver is not good.
> 
> Batching the hypercalls in the gather and then flushing to execute the
> batch seems more reasonable.
> 
> You could probably work on advancing this infrastructure separately
> via virtio-iommu..

That was my impression also, I mentioned it in the commit message,
but for virtio-iommu we need a change in the standard to define this
operation, I can look into that.

Thanks,
Mostafa
> 
> Jason

