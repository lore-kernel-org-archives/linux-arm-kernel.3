Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F728CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 11:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySSczih2oIxRE/mCuJE87rsnZpN4MGD71PRCDCNKi2s=; b=s/vgCdSl/Y/nTPRIutw4PXdOic
	uPkHPxWKVMs//X7Cl+KuSVemgEFeRBwYECM84uPvPuy0r5UWIVGa8ZNOybSByTqmgtYN6L1XcSZEr
	iLCDBfoD7ARFtHA0NarGEqaO0wn8qw8HByIctZzb8RZ0JmM/f0NnEqGfozhV9tBnjPvHgbIw2ublY
	NP3ZiiQyw0lyNjYh0tgHA6j7pZ65nuD0lztLgbSZshaTCgYO8XHD6XEeuhVujSTVjdeCnrdpjumwn
	U67gR1azGS0IA2Xv8RNmv4e5ttnRR6avXWN5t4wG155scC3R31F5e21ZGp4N9tKr7eDkX6LeQRIBa
	zEla9Hgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyUJ1-00000007iDK-3MQY;
	Tue, 16 Sep 2025 11:57:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyUIz-00000007iCr-0MBF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 11:57:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45f30011eceso46255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 04:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758023822; x=1758628622; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ySSczih2oIxRE/mCuJE87rsnZpN4MGD71PRCDCNKi2s=;
        b=3M4h3VVaZxDjPt46xILXCa1e3J0roalDDQ+Qjla2kUsaHkK84CWKwZCzAeCdBKjFzz
         zZpW185xdagTeuD7mlMhhkUENBtXDd3xJ2fRdxsjL4orMgij1Fr7AnJ9viQwhnnPM91h
         ES5oDjtzMQ8GKwSS7DXGCczt3HI3hgNlln3z+4LU3BNZ71AM3F/bgOpFQvnEU7yaaJjH
         IQvXAcXbpZ4GeNuFRyStXmS/e3/pO/WQaCyOBTsFdeYd1od54WXo2UsBEVz7gstBXqY2
         jGbxXCuqLtmPNydh/us7MKxeNKLNFP+DEFpuccrnwBMHV4YmKUYEkO425gm2fW/lUfbV
         zj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758023822; x=1758628622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySSczih2oIxRE/mCuJE87rsnZpN4MGD71PRCDCNKi2s=;
        b=l1/gFdL47E9+cBT7npYtZxzVpB6UTQ4dRQJViqifmgJb5F8lEiGIu+QrySK+QspfUo
         hd5VmCz+TAhiIcTkS3/yCCzgM8dGbV1ybM5TGArIyD5G59VJrfn8HeuJv+sgp7Alv0zg
         rGY/0AIDbhc+rBGdnZnHB+4nUrbKsbf/lToc5cfgxMftCcgeurO+gkEsNiQebe/9KZ3+
         Ts1XzA/vsYcd+HWWP/l3qWPyCMo3bUyOoAHZyUisvsahhW+DAdEjKZgwwJQIpoKuADjE
         V5gICVxMjfWJmIY9svsOfoi90eRdnQlBgLJ2XGXJZdj6m2d/uDRh890UCAsn49swIFXF
         7UFA==
X-Forwarded-Encrypted: i=1; AJvYcCVt5A3S7e/b57lRkaYpvJm3zKob1pHnnHjcWlAWIdrZ1BOzSQFVJM58v5GCcDnf3XoLUsJrMapHbGGcqWmOW4/r@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/RVJYHW88nqYO5kEMc4PTzvSGyUQQbU/e17LBboliSRa+u7dP
	kyeidDoCXC5jFfkhWriZm2M558L497MVgzSRbw9h+nCmOdgTHuH3vqmIjWtMTTIXfg==
X-Gm-Gg: ASbGncto7iIrttGJQeRK0ShQiLQarueFXwBI9gF05K3xzVsdUkQNUbKigd6arSv/RGV
	MSb5ob0g8foN6IZm2/7qykKdWaAgWUHpb00atTqLw9R6+Nk3eNatxNtx6XcevYwQf6daoxGRbVC
	wozPXEFiL/IrVvS7oh/b2WZQzJIViiSSbaIbEegdbaOGH+ujvptbOY3eeS4shtWs8e4cxQKKsc9
	EmG8XAWiU5uNAA8JdYrqF6UTlZsrnup1Kd/OoaVVdyPhXev+8UAE/OYrSLOGoRhsx+GdoosTXPP
	NNuDPRX4iY9JV2rRBBzK49vzSY/6s0giibO4CCWW59IGavGvwxrFxuEqaiRKoyQ+ah4Dl/2vZ9r
	wjTObebWSBTwi/reB74yx0UaMNPBzPRuvkzkG5ymj12hHqZHdMA0aiTM5Es6PGdV3vU/cNQ==
X-Google-Smtp-Source: AGHT+IHVAA1mnayi87cRkdBzWdXwnComM1Vq5NxdtVwd631wdxx6byWBLXjdkxRQfsfT6Te7gJR0sQ==
X-Received: by 2002:a05:600c:4689:b0:43d:409c:6142 with SMTP id 5b1f17b1804b1-45f320079e2mr1709505e9.0.1758023822383;
        Tue, 16 Sep 2025 04:57:02 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f3260a1ddsm15806845e9.5.2025.09.16.04.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 04:57:01 -0700 (PDT)
Date: Tue, 16 Sep 2025 11:56:58 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 01/28] KVM: arm64: Add a new function to donate memory
 with prot
Message-ID: <aMlQivFvqf1FGK_T@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-2-smostafa@google.com>
 <aMAvwlMQ-Jf2MWzd@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMAvwlMQ-Jf2MWzd@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_045705_158826_AABB79C2 
X-CRM114-Status: GOOD (  25.32  )
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

On Tue, Sep 09, 2025 at 02:46:42PM +0100, Will Deacon wrote:
> On Tue, Aug 19, 2025 at 09:51:29PM +0000, Mostafa Saleh wrote:
> > Soon, IOMMU drivers running in the hypervisor might interact with
> > non-coherent devices, so it needs a mechanism to map memory as
> > non cacheable.
> > Add ___pkvm_host_donate_hyp() which accepts a new argument for prot,
> > so the driver can add KVM_PGTABLE_PROT_NORMAL_NC.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 11 +++++++++--
> >  2 files changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > index 5f9d56754e39..52d7ee91e18c 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > @@ -36,6 +36,7 @@ int __pkvm_prot_finalize(void);
> >  int __pkvm_host_share_hyp(u64 pfn);
> >  int __pkvm_host_unshare_hyp(u64 pfn);
> >  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
> > +int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot);
> >  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
> >  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
> >  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 8957734d6183..861e448183fd 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -769,13 +769,15 @@ int __pkvm_host_unshare_hyp(u64 pfn)
> >  	return ret;
> >  }
> >  
> > -int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
> > +int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot)
> >  {
> >  	u64 phys = hyp_pfn_to_phys(pfn);
> >  	u64 size = PAGE_SIZE * nr_pages;
> >  	void *virt = __hyp_va(phys);
> >  	int ret;
> >  
> > +	WARN_ON(prot & KVM_PGTABLE_PROT_X);
> 
> Should this actually just enforce that the permissions are
> KVM_PGTABLE_PROT_RW:
> 
> 	WARN_ON((prot & KVM_PGTABLE_PROT_RWX) != KVM_PGTABLE_PROT_RW);
> 
> ?
> 
> Since the motivation is about the memory type rather than the
> permissions, it would be best to preserve the current behaviour.

Yes, this series doesn't do any permisson changes, I was not sure if
that would be needed in the future or not (some RO mappings), but I will
update the check as suggested to be more strict.

Thanks,
Mostafa

> 
> Will

