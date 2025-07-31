Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7A3C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 17:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kfkGzJlve/WLoyPW+HY4jJ87yR9ziLhY0paEWgfM94=; b=No2PnJ1G2uA3J9y9XlP3Ij0+5b
	Mfbej+zTAevHAMdrRnM0ocnPRNSYeVm8neBfbsupEQDkhJdh9ZOZTEb+G/0WfLnY8qOzR7DORCPc2
	JbzJqoOLY3KJgvXH9VsSDoNUSLMzbu1InH0N4MlVRTo1QfqhVgsOB/ppBMTEDtjPDkeblDkSMy3Bo
	toT6u+bdhh9rTW6fTX3WPrZ2iN0RVZ8UQfs3rRuAHnogu0aSt2z/+M/2HWirk1RQggInZ4GiZ+3TV
	qi9UxcFibgrOABSbNk5YJoHaOGMltCE8o3DiK3MJPru4Kxj+KTYPoV85gPvdQQcOuXRO3FSYHKdgi
	l/nKjmlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhXNV-00000004CBj-36ez;
	Thu, 31 Jul 2025 17:47:41 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhXKw-00000004C5E-0Qgm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 17:45:03 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-456007cfcd7so6615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 10:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753983900; x=1754588700; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+kfkGzJlve/WLoyPW+HY4jJ87yR9ziLhY0paEWgfM94=;
        b=lNucgEw6SK89GvjsU800P3+SCziRJsr2SaoJ/jcnTA2lSO1g8tiRC2GEaQa6odSVDP
         BM01YpbI4ucsuAyDN5XK5HZqgRd6bkeSz2rK4545NmFw2ijyuPvvPSR8NGhjBOqSnVZq
         FMi5N9Z8/yUgBYwsy3R0wt+CplhJ4vcnXs5VZDSjb2/tOEc4n3VKpRTYK7yPul+zv3An
         kpT70IHC8JgleGUHNdnKoaoi7ep1KKpo5B7gpsQ8mb68K2JARVKXLdq93yu0pPu4MwZg
         bKhuHHi4RudRqI70jFL5e0l5UuxiHWLU7pK1c/lwGit0ZcjHx34Muq/XU5orBK+vAC1o
         F1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753983900; x=1754588700;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+kfkGzJlve/WLoyPW+HY4jJ87yR9ziLhY0paEWgfM94=;
        b=DDKZPjiL8Zi7coPbfG/Ilgrz+pXK+FWOrWdN+9ZI6LTpnl/7fNWJvKjwnU1CpX2HeA
         rdJX6sQNFN7idt6yvsVXd6bICtMyRC8gOgtvW8BPoCeKFjhQbbY9F3Oh/F/ukn/cT1Gv
         WI9GdogW5CPjRlBCS0YEoAHLMeXZ/6ScbLWso+P73ffOPhcokpqHdCd2nE7K1ZPEBtHW
         v39T1Qdyh9w4BebktdGswkCXyNZm/47cnQ1dQcqZSGfdSnSzOfgUpoAjSW3rryd2YZGh
         sxiz/c5ZAhK3dal5MHO9PfTeHIdTftJ5nqVfIfSt2wkPrHE5kckCHB7m5HWvEyj1iHLh
         XKpw==
X-Forwarded-Encrypted: i=1; AJvYcCUlRJ3UnEskzuvrceQrbX7WCHatxyQSoSBrH3tfLN0lE7X6td7Q4uSw7sh0EcGdWCZr88yfPpLH4Dx/22hKPjgd@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1QNHkHAE1s04utYv5fdCnG/Bba7RZqB0CWrs1Ba7lWH2t4aJy
	ptzU/oCHrxtOFCqRoS9bZDwod14SqYvZIqpE/1AWjYOezEMH635GAfW6Q6m9QqahJA==
X-Gm-Gg: ASbGncsmMRGJ+PR4Jy9ZldkqutwJqJPyvMtbiTo8XXgWcbqhLnQNWMJLDm6h3qE6TnK
	/bz2seUH4mCxn9YtNBZGqdSmi+ibrOFaflYwC5rTKv2cWoUQz6f3Qisjj0ACCNJfUsBp5cWfDiR
	wkEgoWDwzFcRNu/dMvS+5Wq72DesRAU6BT3p3uohOPP4vz9MzQc09h3d4FG6QZ/Esv0/5hHpARS
	xezR1DNnbBOTrSFRyS2i97BpkRNinhr6fYBANsXxyly/K/NUAnx4F+RCRq+wBhH2gjWmzqtXGPX
	BjFxM0j1x7aEie0E33kgIASJ0F8F6NjMWLnh3gkwW5X6ZHlWTdEFDqHhtLfhLWFLhySwEi2pJew
	Ev7MretsmO8+qaCdIvSWc0v+xMCqm46ZEg1wIbDUxAyCFIN3eunXFg+QShKYIL+HyqpLkbBCOkC
	3O
X-Google-Smtp-Source: AGHT+IG0cqauf8/W+uT6V17ni4XHUoScwT7roD06o9nChNvdBz0aFFnqL9Kizfjs0f2g6AbozeOGQw==
X-Received: by 2002:a05:600d:1a:b0:455:fd3e:4e12 with SMTP id 5b1f17b1804b1-458a8fc9acfmr19755e9.4.1753983899719;
        Thu, 31 Jul 2025 10:44:59 -0700 (PDT)
Received: from google.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458981d0b06sm76559425e9.5.2025.07.31.10.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 10:44:59 -0700 (PDT)
Date: Thu, 31 Jul 2025 17:44:55 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v3 29/29] iommu/arm-smmu-v3-kvm: Add IOMMU ops
Message-ID: <aIurlx5QzEtjpFLd@google.com>
References: <20250728175316.3706196-1-smostafa@google.com>
 <20250728175316.3706196-30-smostafa@google.com>
 <20250730144253.GM26511@ziepe.ca>
 <aIo1ImP7R7VhRpVE@google.com>
 <20250730164752.GO26511@ziepe.ca>
 <aIt67bOzp6XS_yO-@google.com>
 <20250731165757.GZ26511@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250731165757.GZ26511@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_104502_148447_BBCB965B 
X-CRM114-Status: GOOD (  47.05  )
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

On Thu, Jul 31, 2025 at 01:57:57PM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 31, 2025 at 02:17:17PM +0000, Mostafa Saleh wrote:
> > On Wed, Jul 30, 2025 at 01:47:52PM -0300, Jason Gunthorpe wrote:
> > > On Wed, Jul 30, 2025 at 03:07:14PM +0000, Mostafa Saleh wrote:
> > > > On Wed, Jul 30, 2025 at 11:42:53AM -0300, Jason Gunthorpe wrote:
> > > > > On Mon, Jul 28, 2025 at 05:53:16PM +0000, Mostafa Saleh wrote:
> > > > > > Register the SMMUv3 through IOMMU ops, that only support identity
> > > > > > domains. This allows the driver to know which device are currently used
> > > > > > to properly enable/disable then.
> > > > > > 
> > > > > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > > > > ---
> > > > > >  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 92 ++++++++++++++++++-
> > > > > >  1 file changed, 91 insertions(+), 1 deletion(-)
> > > > > 
> > > > > Can you split the new iommu subysstem driver out please? I think I
> > > > > asked this before.
> > > > 
> > > > Sorry, maybe I misunderstood, do you mean split this patch into multiple
> > > > patches or split all KVM SMMUv3 driver out of this series?
> > > 
> > > Yes the latter, the iommu driver introduction is best as its own
> > > series
> > 
> > I thought about that but I was worried the maintainers wouldn't like
> > introducing the infrastructure first in the hypervisor without a user.
> > I am open to split this, but let’s see what they think.
> 
> You can merge both series at the same time

Ok, I can split the last 12 patches which are the SMMUv3 driver, if the
maintainers are ok with that.

> 
> > Makes sense, from the kernel point of view it will be attached to
> > identity/blocking domains, but the hypervisor api is just enable/disable HVC
> > as it doesn’t know what is a domain. If terminology is really a problem,
> > I can make it one hypercall as “set_state” with on/off or identity/blocking
> 
> I would call it set_state with states IDENTITY/BLOCKING. That is
> clear. enable/disable is ambiguous.

Ok, will do that.

> 
> > TBH, I am not sure what hardware does that. So, another option is to fail
> > gracefully if RMR exists (which falls back to the current driver) and then
> > pKVM would run with DMA isolation, which is the status quo.
> 
> iGPUs either access the DRAM through the iommu or they use some OS
> invisible side band channel.
> 
> The ones that use the iommu have this quirk.

I see, I think that can be added later, and these devices can keep using the
current SMMU_V3 driver as it, I can add a check to elide this
registeration this driver if the platform have this quirk so the other
driver can probe the SMMUs after.

> 
> > They are not random, as part of this series the SMMUv3 driver is split
> > where some of the code goes to “arm-smmu-v3-common.c” which is used by
> > both drivers, this reduces a lot of duplication.
> 
> I find it very confusing.
> 
> It made sense to factor some of the code out so that pKVM can have
> it's own smmv3 HW driver, sure.
> 
> But I don't understand why a paravirtualized iommu driver for pKVM has
> any relation to smmuv3. Shouldn't it just be calling some hypercalls
> to set IDENTITY/BLOCKING?

Well it’s not really “paravirtualized” as virtio-iommu, this is an SMMUv3
driver (it uses the same binding a the smmu-v3)
It re-use the same probe code, fw/hw parsing and so on (inside the kernel),
also re-use the same structs to make that possible. The only difference is
that the page tables and STEs are managed by the hypervisor.
In part-2[1] I add event q parsing, which reuses 90% of the irq/evtq,
insert/remove_master logic, otherwise we have to duplicate all of that logic.

So, I think it makes sense to re-use as much logic as possible, as both drivers
are smmu-v3 drivers with one caveat about HW table management

As mentioned in the cover letter, we can also still build nesting on top of
this driver, and I plan to post an RFC for that, once this one is sorted.

[1] https://android-kvm.googlesource.com/linux/+log/refs/heads/for-upstream/pkvm-smmu-v3-part-2


> 
> > I am not sure if we need get_resv_regions, maybe it's useful for sysfs
> > "/sys/kernel/iommu_groups/reserved_regions"? I will double check.
> 
> It is important to get this info from the FW..
>
Yes, I think that should remain.

Thanks,
Mostafa
> Jason

