Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF8AC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 23:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0dnmrlpBGeFmqcu0Pq2phWVQb3k+1PXSaVmeXw2bjGQ=; b=HeUj90f9J56uLHTBnbQXHvH4fc
	Hf3ZkzuJYqkYiLfTZhDM1p1xlL0GyX0eR+B7m9M4WBDRqaw9kflRSBFaXJOyMx4RZwGaae6+IpB9v
	HB71dno/AHIZL26uilVuC/ahfggcGGJqORfR+il9lYjDyM59awGzCe7G9SzwaAO5VBBYOgnnqb45/
	7hSGX6D3sBbnKzvoYVvEyrMFWUZAJZXbVg3YSB/GOWKJULIMz9FEVZgLAF4g3t+LXW9DQLXOPajHy
	rrpTZ1EdKDAaUYfxFx2ERTKTj/vUqrrxV9GMjK1+yceqBHZYFMFR4CucsbGkRKae7RujnS+z94DfG
	IgbEdHOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Tyo-0000000AK3I-068C;
	Thu, 03 Apr 2025 23:28:14 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Tx0-0000000AJxn-0OoG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 23:26:23 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-476ae781d21so13775221cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 16:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1743722780; x=1744327580; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0dnmrlpBGeFmqcu0Pq2phWVQb3k+1PXSaVmeXw2bjGQ=;
        b=mDINpTPyvADh0YKJh6jfwNI8rAr6y69Q33BK/JOyaye5+DxOqu+DOA/77j+xhtzm8q
         7IJuY+jnU6UvN51KXDVHOhGyYjgMH3m8pvU0YFLQR51DjHWQG5mf8MIKj7/f08ik79o4
         pxoiXKmhqMik0SrvN7LAimHZrC+np3rFka9DIY7KCEKoWhi4PG4PyQCm7x+QOV9JKaJK
         TSvwp+qmS4kHpEdI9JrlzpHFtu/mDKeb3+ifZH2RARLTl9bJwiUlPNuoLFBjcdE91Fc1
         hnHcqQSG3bQn/NOrtmwjM3BBvHMipB5upROEbADQFGxmWd/Z8xXNJ6GOSUjN87GBXOaD
         IQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743722780; x=1744327580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dnmrlpBGeFmqcu0Pq2phWVQb3k+1PXSaVmeXw2bjGQ=;
        b=e3qFLbq+VfgnOSCtFPXAKy+az+zQDobQHp+25ymIUxQbFKK7lCkoCgFIkckJVsOV7A
         dUbuF/sxd7oEI4/5nMZAcfPbcpWhNrMLlW95Q7nb8q/x6Bz0Simoh63WhGPh7SmNNIMh
         N0h/VvWNboJ94qhcIx4ilBn7RV3RS9B8gQQM1RP1Hx8zMNS0E+tssm7Yso915+/wv24c
         9LAdMWa349uh79lFcVdJlVXSRJAoCAyhzpBW9bPpE5KlIP2vfpqXitzZnrXOnDon3est
         U3e7zvhOMA6lZQYxVp2n44fSdzF8qqk2CFP8vaCjKpkP3XxCnS9dEq4jWTnuLQ8QmxNq
         SI8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkdULqv8EHSA6MdXBNsXM2xn8cOgetSgLJSvRU4/SP6MYjeTka9CaQi1luWuu47tClY7XULNjUbJwSyGHk/4cm@lists.infradead.org
X-Gm-Message-State: AOJu0YygTg38uOc638X011MBOda5/BxnyijyEA5Mm0OTFotPceTltKbM
	fBwJL2NHY/sNghgVD9yXDXenqEs3eWfbC0xbHEyH7XK/5LLbld+xKaxDHnY406Y=
X-Gm-Gg: ASbGncuVvIZ+7Z5vU1nAliFqeia0g3/2Chzs1SXl0YPCE08H8/se6YRFkL6bis091PX
	71Pow5VbhDKcHSb1dQCx5/FlGwloCa5JVANICHGJuT5md/J0KkhCdcDkMbtzxeZL/G85J1xG578
	9g1FdnN1NuqyfZVNc0XhvW7cQ6KYiBhRoBZxbJzCOWJ8ybP2pAef3aHWnE4MrtYMEPY/04h8hLr
	qwPMZsKfQpLLK5MrpUrb9b8zeG/4OyXgJB6naCpR9r1nKzyG3hDveuDO9lQZSF7sM/SDMqxOfL9
	7ZhImTwP4QMF2YbfYu737CEWII2PZXtdN4B0ZbIeeAYsE8tMAJPQ120aGBG3Daf3iX8D6IgWkpr
	72P9SBtqxNU6WpCCcaem3UYo=
X-Google-Smtp-Source: AGHT+IFibU2LV4UUp0WQxSSCxFeutQYAvG/Wra81FTOp1ufuIAX96AWEwxKC9ZZdCWczg5MiXC+AeA==
X-Received: by 2002:ad4:5e87:0:b0:6e4:2872:45f5 with SMTP id 6a1803df08f44-6f01e76f04fmr21453616d6.25.1743722780451;
        Thu, 03 Apr 2025 16:26:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f1652a3sm13173396d6.119.2025.04.03.16.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 16:26:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u0Twx-00000005TkW-0sfD;
	Thu, 03 Apr 2025 20:26:19 -0300
Date: Thu, 3 Apr 2025 20:26:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: code@tyhicks.com, devicetree@vger.kernel.org,
	eahariha@linux.microsoft.com, eric.auger@redhat.com,
	iommu@lists.linux.dev, jacob.pan@linux.microsoft.com,
	linux-arm-kernel@lists.infradead.org, vijayb@linux.microsoft.com,
	virtualization@lists.linux.dev, will@kernel.org
Subject: Re: [PATCH 0/3] make MSI IOVA base address and its length
 configurable
Message-ID: <20250403232619.GA681099@ziepe.ca>
References: <20250131003618.GB2296753@ziepe.ca>
 <20250403193458.158085-1-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403193458.158085-1-shyamsaini@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_162622_254099_78634B0E 
X-CRM114-Status: GOOD (  22.33  )
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

On Thu, Apr 03, 2025 at 12:34:58PM -0700, Shyam Saini wrote:
> Hi Jason,
> 
> > On Thu, Jan 30, 2025 at 03:21:37PM -0800, Shyam Saini wrote:
> > 
> > > Unfortunately, it is an HW issue.
> > 
> > Well, that's pretty bad to have built HW that can't DMA to low
> > addresses at all.. But OK.
> >  
> > > Are you okay with this passing custom MSI_IOVA via DTS approach ?
> > 
> > It isn't up to me, but I've understood the DT maintainers would reject
> > this as it isn't is describing HW but just a random Linux software
> > knob.
> > 
> 
> If i understood correctly MSI window IOVA is hw property, if yes
> then it should be accepted by DTS folks, did i misundertstand that?

It is not a HW property. The MSI window in the SMMU is entirely up to
software.

Yuor HW proprerty is the regions of IOVA that do not function in the
SMMU.

> > I think you should make selecting the sw_msi dynamic in Linux.
> 
> My understanding is that if we have to make it dynamic, we have to
> use iova allocator that would need iova_domain as a member of struct
> arm_smmu_domain, and allocate iova for MSI window dynamically using
> alloc_iova() in arm_smmu_get_resv_regions() is that what you meant
> when you mentioned selecting the sw_msi dynamically?

I would not structure it like that..

The simplest thing would be to have the SMMU driver have a list of
potential addresses and select the first one that does not intersect
with the non-working IOVA ranges.

Jason

