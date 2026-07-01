Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD0DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 13:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qS13cSENFGcBB0bnz6k1QAxOjQr0kz2UqGp/5+eDOd8=; b=WfHsQHcnprDIXaXkQQqK3eYB5w
	R0BcC+nM0bi6m4QhECWM9CTRsMbFU4IWvxqFH+lG+T81lgka8a9SNlK0hGPwVKueJHm+D6yu/5c5p
	5c4e+dBJwTV2Dp+RibWj5Q6hbpM/J72/v7Usx2wEXKQaTNIXPmlreaYRN2ku5mtO2nh/e9/W6zTCv
	8NGvuAD8EZSooSNNAHIRiGBIucj/NBFijdbda56hhViiwnTBT8hVoNVVuvgwngeDgvajz3tETJeKe
	iAUAG34K/pnEMDTaNa1URRYwoJYp2HwAaXDGopFXVyiTnCk6jb7+OU97fgy/lY+HgvOFJYoDDk01F
	fD3T4HLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wev7K-00000002C7N-3gHi;
	Wed, 01 Jul 2026 13:36:42 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wev7J-00000002C6k-1B7w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 13:36:42 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c9b2ac97cdso39525ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 06:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782912999; x=1783517799; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qS13cSENFGcBB0bnz6k1QAxOjQr0kz2UqGp/5+eDOd8=;
        b=bSjsoUxz+8GMD0F6sIzmDqawm4mwBnpXVbUF8jId+gGZuNC3Z+2Y6uDZVo3BkkWK4I
         tI8OBJbzAvfpBl+XM5PCmRxl9/3jOSUT2Nt+HG+4sByJsBl8zXmntwSy1Q6kBSAnz2ee
         YZij3S+zQfzC0YNJq5hKJen7PxInQIoUo0TjMD0+ENo6E0tSqMOj4KHaGUL9fGpYku42
         4qwaWklRuV00XW2Sm4TtZl92dJvLJnFAezG2eB1OEPev87wSOPZ/7CXfC9sl/QFZ/rb3
         8R98LX2uZ5v05QeYJyeQRJQ6muguCkL/1Yfw3jQsgdWqTQdKi5EtRJqpkHshhNbU5YcE
         /2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912999; x=1783517799;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qS13cSENFGcBB0bnz6k1QAxOjQr0kz2UqGp/5+eDOd8=;
        b=FDavnKUieyMD4LtG9xsZeRtXkob1M9FK8NrrURefElxZG5rBmvgQDG61ISI9v7YUJf
         PihZ+lqc+043UrA64zEBMnS/cozSp7xxyLfdtLhtW+0IYyUwV1iFcUPT6yBAEjypqu+E
         alPpcVRfbMwk3vpzYuEzAqMDw6B7apZV40DnUY9EOFA3oEr898mc+KSCXDdjZUJf0bA8
         Tg4UBt+2pRBZlIjn03R+57v5qUVkr1vuSZYVZbOFl3okqgChEsUXo23AV4AA4u9AoKUa
         YJn1/OdNQADuOqXoKWQf2F1rCzi9MG6MMryQuvbSTfsBcowoyTpnKodaFsrGK1PGdjmi
         vysQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqV7sC6O+ewDNOm72P8rWVsONI5dAiK/c2xHE843aV6hD9+3NZNXGPIQ0N5m6wBpzV+RL3lT9OozohfpA2nYh3@lists.infradead.org
X-Gm-Message-State: AOJu0YxA2/lHN8ORvJ/Ql1z+Fk5+UQWmYrhQzAxl4A0P9jfPxuuTkGMs
	rTOdyZYdR9eTpzMYGCMMQc/dr5Gzm73TxIQwjhbII3mx4RXXzojivM++ggjEYz3moA==
X-Gm-Gg: AfdE7clUe0UM2nmMB0JEOy5oU7isZ0AMs59cZ9WBtC1njgSGltrgQwNRinmeCTvoiNw
	2VPAWWsNHE5aTJxVbkClXK36J+sO8AEviavMz5hl6WL3LBdgwi9tLPBctT+4004g9jw4jgl+7sv
	LsX22DelF2BMYS7jTdKeVzYGOszzsiXI4jE6DtL//pYtNZKROF1ZUCPbZ1RwKe0piaFVQcegpW4
	zwaoxLeEKhRrsKgWRHFnIVnAr7Jmwd5Xqi2ZURbNkLJhhQwEg3jqT9/DNfcQ1RE4Ei/x/ClD4tx
	Biuv/wVdjW/WjYhwoy2pfWx6dpkahZTt52lC3QNswhxJnLgdsI809jDHPmRirBZyWeXG2oCOi2x
	Mo+vTshw1nKkNXRhjnGjtcoHUoq9vaDiQNcSJegrVpr972RoWj8ay7qdeV/RT3kjkGmmW2TpBTP
	5toaIHd/t7HYWTsSEBwsNxJj6MmPVe4G8YhLGD1c7gaYj+AT4=
X-Received: by 2002:a17:903:283:b0:2ca:1bbe:c3e0 with SMTP id d9443c01a7336-2ca8f1bb537mr296825ad.0.1782912998682;
        Wed, 01 Jul 2026 06:36:38 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fffa65bsm4111750b3a.21.2026.07.01.06.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:36:36 -0700 (PDT)
Date: Wed, 1 Jul 2026 13:36:29 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	kees@kernel.org, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, jamien@nvidia.com
Subject: Re: [PATCH rc v7 0/7] iommu/arm-smmu-v3: Fix device crash on kdump
 kernel
Message-ID: <akUX3T3fIoN42sdM@google.com>
References: <cover.1782799827.git.nicolinc@nvidia.com>
 <akPB6l-fuJUcg4a2@google.com>
 <akPX_N0P2EcI_jbV@google.com>
 <akPhuF9pAWaBXzpi@google.com>
 <20260630185942.GF7481@nvidia.com>
 <akUQj2pa1W-MekgF@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akUQj2pa1W-MekgF@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_063641_324658_DD328321 
X-CRM114-Status: GOOD (  36.49  )
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

On Wed, Jul 01, 2026 at 01:05:19PM +0000, Mostafa Saleh wrote:
> On Tue, Jun 30, 2026 at 03:59:42PM -0300, Jason Gunthorpe wrote:
> > On Tue, Jun 30, 2026 at 03:33:12PM +0000, Mostafa Saleh wrote:
> > 
> > > For example patch#1 verifies log2size and split and both are read
> > > from HW registers. Same for the base address or other addresses as
> > > the page tables, they  might be corrupted due to a buggy driver.
> > > My point is that, it is really hard to assume that the previous state
> > > of registers/STE/page-tables were valid or even consistent, when the
> > > kernel crashed and did not transition the state gracefully.
> > 
> > Sure, and this mechanism is probably not very useful for debugging
> > these kinds of errors in the SMMU driver. Oh well, that isn't a common
> > source of kernel crashes :)
> 
> I hope not! Although memory corruption can happen due to many other
> reasons :/
> 
> I am not trying to bikeshed, but I wondering if there is a more
> reliable way rather than doing archaeology from a panicked kernel
> SMMUv3 configuration, as I am worried that will be even harder to
> debug if it goes wrong.
> 
> >  
> > > Similarly for TLBs, the kernel might have panicked in the middle of an
> > > unmap or free domain. (not to mention what that means for RPM where
> > > a device reset with unknown TLBs)
> > 
> > TLB is fine. kdump works by carving out a chunk of memory for the
> > future crash kernel. When the kernel boots it ignores all the memory
> > used by the prior kernel. So DMA can keep running into the old kernels
> > memory with no issue. It doesn't matter if the TLBs are inconsistent or
> > not.
> 
> Ideally if a TLB is to be missed (because of the panic), it should not
> point to kdump memory as it is carved-out. However, it is still a leap to
> assume that the TLBs are in a good shape as I mentioned with RPM (or
> even if the device resets transiently for some reason) it can end up
> with garbage in its TLBs.

Regarding RPM, I can say that even if we panicked while SMMU was off in
the previous kernel, when we call device_reset() in the new kernel we
still issue the TLBI_ALL with the reset.

However, I agree with the overall problem, i.e. IF an active device
unmaps the DMA addr after the transaction in the previous kernel, 
(with the SMMU powered ON) but the TLBI was missed due to a crash/panic,
Any new DMA in the new kernel may alias onto a memory in the previous 
(crashed) kernel, not the kdump kernel.

That way, I agree that continuing DMA could be problematic as we may
corrupt the very memory we'd wanna analyze for a crash.

Thanks,
Praan


