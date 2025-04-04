Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C227C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 17:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwDqXCtOct8DsFXT3x26lNRUVVnIjXvE/cNDH38nXmY=; b=F51/ASyhR0vFjNDhpTSBMDVA9T
	3mtg0xeWZdneggE+ZfkV5ZE5Xur8cPvoSCOdUl8GvD5h4DT50hUZfGp6cdWg1v1BVyse/vC4YfvN7
	ey8A83b2rqE6eLg6JFO5rkqi9G16hD3noWmGwNghSEIgacm2g35CtvKxU0qzPUBsdOkcerfXu1PES
	MpaQoLAawLeyC3yG9JkHkz+5ZAn6SEHRBRTk9qS45+Vk0U+Dj0tBxaHFCd7r6uanSFth2UB+MLGwb
	oO0hZjuOite6VkKLF+584v/aCUpDI5+gquytdQ52u6bWZ+HErd+BS1WenxZRcdxDrZ07eFTp9n31W
	UuxvS8AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0kVn-0000000CNNQ-3B4c;
	Fri, 04 Apr 2025 17:07:23 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0kU2-0000000CN4v-3NY8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 17:05:35 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso57949366b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 10:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743786333; x=1744391133; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AwDqXCtOct8DsFXT3x26lNRUVVnIjXvE/cNDH38nXmY=;
        b=Sfo/+RMY6pytGeUegqLzMJhu2pmzDm80Ecvz91W95cXcEObrnxCTgETJVS1UXwHCve
         2Rx+dgQZLnzY+5+/Ep2k0xpJ8HB8gSuIv7YMfrerRZ+3XT/Ra53Wiy1Usmsw6jJCJeOj
         HRyKroaBl2OX7aNeT64Bcq7cpHTRMYdqzkn6aUgHy+4JRlclUTKBjSdO1J1ixrKINnKn
         S+vlWMIZOVLKwBtB855/2oMJvAqPfmcszi2pRlgkIOzxGjUBI8xM9zQDGJedxZizH50r
         U5hsbJ7ZrdR2uRyXP8TcION86hLNQ0hcvcDZIrFPWPM0vFBAT0U2jKCc/tC5zI16UQLO
         PZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743786333; x=1744391133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwDqXCtOct8DsFXT3x26lNRUVVnIjXvE/cNDH38nXmY=;
        b=hq+Ixq5YcvrSpoCPnRhtFiWpxMpcOudJqVoG/8fhek6PcDwDbe+ds6CuokWvnSG8MG
         bYigPH8FWsCoVGzqGY5Pmifzr9uumtktHdLGgqImTKnCJBuTKeiQZwosVNgv/jesp+BV
         k9N+f8/jwbTRY1TNz+GW9Rb9lZHHuKwhv/N3p32+awoCddvqxX4Y02tu07Smn/3OXoWz
         K8m7ombSIW+6v4fMgo9aa+wz680egNgAhLNv0M9LwxHDJeaCY9yTfcJrVapFR02px6+Y
         qkQkJDhMB6QXIB6aXrkxbdqgPhf0jOrsE6e2Jf+E6NFfGylOBbPef45pUbZ5oHE9q3ts
         MZZw==
X-Forwarded-Encrypted: i=1; AJvYcCUPU5I5Oz02qmfwp8eqVtxOP4mQqpo3An6xIIUs8MCrCOx/EAUyB4uM4t7XXAaI33fIEgJS671wWGoRebzhDCQd@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3Ocf+gYiD7+Hq+yU7tSj8tJI5psgV3Qw5cqpAi81TVDQyknga
	A/A614PIOluQE8rb+Itp3qaGU8cuFWhT59PYnH1xq6wae37wBNRilRrQx0n7GA==
X-Gm-Gg: ASbGncsW4hJzSq426cH/4dr+NYnhfvTT2M6Wthf7Z1safU8/2yaqPWc58Pm77RAj8jw
	3/euXQFONBwdHf7KKaxdNnOAoInR186nuYRPZG6wvDoiC6F1B4KPU1e+thkpLj4NjwnwhAGQU6p
	vqut8a/7ZEPpK2vdtzVJE7SrkRaDt24V20DorjcmLevjJG5OTvuFVN25DuPZjZi1Tot8T7nwKV5
	MrijvZEA9Z9Zc/bfJPePCQ9fEIyOIcTPZHQSpYYtM9M4FTlNzkXjKpvtkxnQivVAvMq4/AFAxcC
	PwvtwdR1zizYIU23YeIQHwd9wq6OrPNFmPoF84ZBBCQwLDh+GC64LRUzOnhRCUcM7Agup1jUdFf
	cPkNxnI0=
X-Google-Smtp-Source: AGHT+IHNmd6B42CvAAoOrmSaCgMaRG/rblZajqIa3A/ogW1Y5oG4oBfPNhJiyFRf09FleJPZU3ziJA==
X-Received: by 2002:a17:907:9693:b0:ac3:3e43:3b2b with SMTP id a640c23a62f3a-ac7d1878c0amr443601366b.18.1743786332804;
        Fri, 04 Apr 2025 10:05:32 -0700 (PDT)
Received: from google.com (35.157.34.34.bc.googleusercontent.com. [34.34.157.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c0184d0dsm280758066b.130.2025.04.04.10.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 10:05:32 -0700 (PDT)
Date: Fri, 4 Apr 2025 18:05:28 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Quentin Perret <qperret@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2 3/9] KVM: arm64: Add a range to
 __pkvm_host_unshare_guest()
Message-ID: <Z_ARWDH60WayM0MP@google.com>
References: <20250306110038.3733649-1-vdonnefort@google.com>
 <20250306110038.3733649-4-vdonnefort@google.com>
 <Z-6p49EcsZKid7L1@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-6p49EcsZKid7L1@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_100534_840657_71A86A89 
X-CRM114-Status: GOOD (  16.53  )
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

On Thu, Apr 03, 2025 at 03:31:47PM +0000, Quentin Perret wrote:
> On Thursday 06 Mar 2025 at 11:00:32 (+0000), Vincent Donnefort wrote:
> > @@ -1012,51 +1011,52 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
> >  		return ret;
> >  	if (!kvm_pte_valid(pte))
> >  		return -ENOENT;
> > -	if (level != KVM_PGTABLE_LAST_LEVEL)
> > +	if (kvm_granule_size(level) != size)
> >  		return -E2BIG;
> >  
> > -	state = guest_get_page_state(pte, ipa);
> > -	if (state != PKVM_PAGE_SHARED_BORROWED)
> > -		return -EPERM;
> > +	ret = __guest_check_page_state_range(vm, ipa, size, PKVM_PAGE_SHARED_BORROWED);
> > +	if (ret)
> > +		return ret;
> 
> Given that hard rely on kvm_granule_size(level) == size above, we should
> be guaranteed that the PTE covers the entire range we're interested in.
> So is there a point in starting a new page-table walk here? Could we
> just keep guest_get_page_state() directly?

Ha yes, the walk wouldn't do anything more than what we can with that PTE!

> 
> >  
> >  	phys = kvm_pte_to_phys(pte);
> > -	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
> > +	ret = check_range_allowed_memory(phys, phys + size);
> >  	if (WARN_ON(ret))
> >  		return ret;
> >  
> > -	page = hyp_phys_to_page(phys);
> > -	if (page->host_state != PKVM_PAGE_SHARED_OWNED)
> > -		return -EPERM;
> > -	if (WARN_ON(!page->host_share_guest_count))
> > -		return -EINVAL;
> > +	for_each_hyp_page(phys, size, page) {
> > +		if (page->host_state != PKVM_PAGE_SHARED_OWNED)
> > +			return -EPERM;
> > +		if (WARN_ON(!page->host_share_guest_count))
> > +			return -EINVAL;
> > +	}
> >  
> >  	*__phys = phys;
> >  
> >  	return 0;
> >  }

