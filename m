Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16622C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 12:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owuoEKLJ8GyqS05+WPOOz/9ttskeFhIAhs7NlVT92ic=; b=f2Z1eK5vLqyLZ30/yyRxINeFCi
	wzz4XTuwcDf850ByONYVK6tR05JhlQfHSDcxTA1zsow7SWzRmJWHosiXbm4yzMFluskrBPLG9nQwb
	IwPR7kWridIe/Rram9AiJnnXKxuqrC48Pwiqag6unbgZ8O7g7m39cRQa87QFPWkn0XhrKnddnCaSY
	jG/J9wRlr04mev4MNvisFyNhI3ObF96YPmFAhaar+DgtnrsaT44u/Qv230HVl6K9yi74ndbpH+pGL
	yUygSd58jCtBGpwDMyxKX6+hmm8kzkxIYNVze6g+7HXo0ApVL+rrQm54JX3E9t9gvGqgxaIgGqquF
	f3sMk3ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvF26-0000000C7RO-2QKT;
	Thu, 20 Mar 2025 12:29:58 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEza-0000000C7By-3H5K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 12:27:24 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c592764e24so63084885a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 05:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1742473641; x=1743078441; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=owuoEKLJ8GyqS05+WPOOz/9ttskeFhIAhs7NlVT92ic=;
        b=IihepOdaOjfYe1wQiRUl9S6kQQHWpBc1hsgRooJ6cDxAoduW5LGsMe1w0KU50vTpOf
         OfrKTe+AiNg/zZybS1JqJuc4ujSM1krzMFTun8YyAIf9sQDDgIy9SSfTBnidWHvF1TOd
         wTPz3oPG/vrgYz7NL26JUjGrVHA3lFLLyd/fAiQwwGzW9SaTXRi9Kzh7lOrvoKTthiLj
         xV5uTT+60ENWy3GYDTMYvYcbk4mldYbNJhTrMHYiZpodX1KFWd/7RsR0v9PNqEqAOxc/
         ioirieyAcpZGdmVImRGVaxRFei+nwy8/5oIY+Ts4AOaK6uNF4m+M1RMfz8TGoeiW8mY8
         XlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742473641; x=1743078441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owuoEKLJ8GyqS05+WPOOz/9ttskeFhIAhs7NlVT92ic=;
        b=ljGqzeVm30p7gp+Jw5HSN9GBbsL0mFwKE/ZaZRLsc33ushl654TyOLWi4pViCp05Dx
         f/1K7GZm5X730v3QKctszxaJDZolzUVp/nFUjtZWMa908yl3RR/FbO1Nvn66pz9IlAfg
         fCV0DDK8QmiV8LZoqzsmUcmZDVHUNBByoY5DkOSN3aV4dNeq2pWVT+D34u8hBz4fD9fp
         YuKsoXnjW/ZiTV3TwL0WojdnIZzCnVD63Kx/+jXlh4hQFjg160A4SpXUu6aQ5AlM2ZcK
         fkSXIjK8vRGaiqY5lZYB04eIB20jYeIsJrrOssygj8xnaFrIRi6t+Nya9QxJm5Zat3jT
         p2tg==
X-Forwarded-Encrypted: i=1; AJvYcCWn2+5fZe6astZVpuRaQJr6p8HeN5XxgotGRcXc1YFTW2opInCbMtcUjgTWIgh6gBD5tyN4YqTzduI5fEd4J64v@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1hWTrfgaG3MtHiLFTwdv6wYpFP1mm+SIEWPw0Y/W6AE796j6o
	wAGBDIlvusTBtYaHJVOiUYj53pq6VCdYYCTQkcqFs6xs0gPBzSF1dv6jIfVwhP4=
X-Gm-Gg: ASbGncs/YKM3GW1Eu4+IWWrS6zdWkYEuM9iKbZKDNe5h8FFtN3jtpFiuTDvjsnPUoec
	7ivO164hvx+TXjSzpwYI4xKpw+RmewtiCvXFdW0IvZ2z2JBPkBpHuXJsMKjeXC7Qls5rZ+cNfwY
	SYqc1WL9U07tOxJJ2zyRyHtuxQeKSLkrjshLWCmSqKAH0lYieroM+tqZ8Pktay+mQyyS4G3nBFF
	a80TENPFQ1sFP5dUSGZjkQPtnwlFLkI2a+j6ZPVT+rBBbjL7V8zcLS/8/R77vwVyzY7Ng6hoBK8
	Gv8VdE9OARYyz/qAityaix28lRTQjfyn/NmfIxeLnBc54Ktfe3EJPZk73SfkpGzIkyHJ2+NXHUa
	kSHSVNaaSH4AyTwBakg==
X-Google-Smtp-Source: AGHT+IHBPIN78tejYWs7VfIlk4YaIqTbv/OkaggJ7vH5SMoIZQdAyhpfUCC8gDblTwanJpuz9ATgQQ==
X-Received: by 2002:a05:620a:f02:b0:7c0:ad47:db3d with SMTP id af79cd13be357-7c5b0550e7bmr538847685a.21.1742473641194;
        Thu, 20 Mar 2025 05:27:21 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c7859bsm999375685a.34.2025.03.20.05.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 05:27:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tvEzX-00000000hOS-1nJZ;
	Thu, 20 Mar 2025 09:27:19 -0300
Date: Thu, 20 Mar 2025 09:27:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Linuxarm <linuxarm@huawei.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [RFC PATCH v3 4/5] iommu/arm-smmu-v3-iommufd: Use KVM VMID for
 s2 stage
Message-ID: <20250320122719.GI126678@ziepe.ca>
References: <20250319173202.78988-1-shameerali.kolothum.thodi@huawei.com>
 <20250319173202.78988-5-shameerali.kolothum.thodi@huawei.com>
 <20250319233946.GF126678@ziepe.ca>
 <f654ae10e55e4142acb83eb926bb80b2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f654ae10e55e4142acb83eb926bb80b2@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_052722_911185_880AC88D 
X-CRM114-Status: GOOD (  14.41  )
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

On Thu, Mar 20, 2025 at 09:30:45AM +0000, Shameerali Kolothum Thodi wrote:
> > Isn't kvm_get_kvm_safe() in modular KVM code most of the time? You can't
> > call it like this right?
> 
> I think it is safe since KVM is not modular for ARM64. And that is one of the
> reasons I thought I will hold the KVM reference here as we don't have to go
> through the symbol_get/put calls here. Also IOMMUFD is not using the kvm
> pointer at the moment. Probably I should add some comments in IOMMUFD
> to make it clear.

Oh I didn't know that.. Interesting simplification

> > That more closely matches how this will eventually work when the VMID
> > allocation is properly made to be local to the viommu.
> 
> Ok. Will update.

You should also block creating a VIOMMU without a KVM for the same
reason.. Really isolate the S2 to only being usable with the KVM
shared VMID.

Jason

