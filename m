Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDC7CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 10:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAZLPCCH0EgC7m1vhKAbHLebwwq6tBL7BsLJTj4U7Qk=; b=uwilSEXveZpAcySN9nhKrZisYL
	vJ5DTqI/A2xkOrYEAuqj6HrroIWIVV6TgGjyrg/asltOhEIqi6xEmNbaVjsVSOlxOF1Co+vfxoZmt
	HMSX5H4tiZbAo3+Tn0d+694vuNJYUPD/WWH7mEH0axd+RLkGxrUGplziHBMbJqLN0Z+aYajapMaWs
	ASTC60y3vsOF0JGOc49RWK3MXnF75LJWJPn9SUF1UK6IsK6RxKJOjQA9DEa7n19uGMOomCXdw3Zpv
	sVBpBqFPSrts4vESPExaLsASBoi/SKLinsLG/2Ngtn8hWN6KBQ0SJvUkH36c6nd0lO4nYbI9ux8tx
	hbJXLhXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzY0U-00000002V0m-0jRI;
	Fri, 19 Sep 2025 10:06:22 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzY0S-00000002V0C-0rn3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 10:06:21 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so18620155e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 03:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758276378; x=1758881178; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UAZLPCCH0EgC7m1vhKAbHLebwwq6tBL7BsLJTj4U7Qk=;
        b=veJcaTpy0vjCun8A72snY566mLW/YhnOsIIKt/N0iPxi9Zq1sk+gHyq14pESUbZUD3
         GBv/lmpkDCrTT5K7EYssPCvTN0ULhjDSIGpEHAdDkVpfyTX3Byxa+V/Q7/YcrJNIGhfA
         xSrRZkOaAwBUOdqUqSoZZGcQuliP9+af0BzUSxQuVhFrWvwqdIbEKZqQUsukrF3io0uw
         HEx7vfsyJP2A5jpTqH3+SCotaTw9teyjzioztQpMQa0AAVOtTfjV2x73AKl23b8haRO8
         KkaWfy0lbadPFdH7Rja6zMMvHrsFh7MDEBXJxZ5ool8eMRfBRxoDnCER59hVzdhOsxhP
         Isxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758276378; x=1758881178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAZLPCCH0EgC7m1vhKAbHLebwwq6tBL7BsLJTj4U7Qk=;
        b=nUjag3tOs07BoEFxjiUiXoFRCdTUt5AY8w8rPyqyFutIzAAP1F/adhZaVHHvmRGuup
         wrAJmRn8myc2vxEdJmCQM0q9T3794Lg4+vk7a8lgIdMA8IqnGDplgi2c621SiHDi775V
         dWfiRhpT/sa7P0JrqNPBhixVTyfw8we8B8YvfW+nRFiwByRG6JWH5TqydLps881+5DTF
         edxdT7D7lGdykN07OT4kHDJuMesW/L+YQkN+ozxHwah2A70hZNSqsrrw6uGnc5g7U2/i
         /YtzN5GO37Zt7rTTTlreGAbFwiUCbSS3Rp4vE+HfrBrv58wT6KvoRPpW/JWxhh7KR8kl
         poGw==
X-Forwarded-Encrypted: i=1; AJvYcCXBW7aeP+i5j8lyyB6xmL/1zzV+su6vuw43NOuVOqHjQC4LORUoBcLXyddgIrbFeJSUjHvLrMLaxe6hcNhgnQ7t@lists.infradead.org
X-Gm-Message-State: AOJu0YzWo9nXaqIkrAwEAvLeMwDUr0aNhsEp2Mp/+/VMtwnqBrkDTJhN
	uF8GKjMJ+GkZWWlBe1xkuQf57U0fJXO3ZzJW96wN6RBldascw71HhKN7fS0PV9muBg==
X-Gm-Gg: ASbGncuvuczg81lbV/s5CSpIyfSH5I/XPKisHVcch63dsvD/SaN68x3AeTpHj/wbzTi
	0RKfYlsoF3cEGLQnLgu+ol9UpZOVrBq5CMoGEllmW9yRU22rx4FN7qQybnxDvSIAe5q9enmw/BA
	TkACwQVDHwEEScbyfKfk3ITZpNtYOl7+s1XR314rkWh3Id5yQNkUo4onb9k+EhuRsTQ5fO1dio6
	rNZmT8zTe1XgpMtHFRegp0ZeK1uyOMLuaKuR/MBxSKZXWFaHRqi5W3elu1w7HumEXFicop/xG9g
	Ooy2+KapoSn4IGRCVZPvtpHJKOGMJYsn/RzRbPg65NxeomByLrxw8L153ied074Rbzw9H/HP3WM
	xua17JL3KEq4Kn1IIjU+ZARtJr0BtKSfIOgos4MTsJ4EPeU8yJxgVUVr60Qw8USfUFQ==
X-Google-Smtp-Source: AGHT+IH7j5nrNszhPGZwafEQxw3v7iML2APU56b+3QSFjy1ZCXsWbsqVwmzYYDNqTZhcotIDu8aX+Q==
X-Received: by 2002:a05:600c:468a:b0:45d:cfee:7058 with SMTP id 5b1f17b1804b1-467ea89da77mr24405135e9.22.1758276378163;
        Fri, 19 Sep 2025 03:06:18 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f6695a9dsm81189215e9.24.2025.09.19.03.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 03:06:17 -0700 (PDT)
Date: Fri, 19 Sep 2025 11:06:14 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Quentin Perret <qperret@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, sebastianene@google.com,
	keirf@google.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH] KVM: arm64: Validate input range for pKVM mem transitions
Message-ID: <aM0rFlaVKRkNxQPS@google.com>
References: <20250918180050.2000445-1-vdonnefort@google.com>
 <cf3v4dn233bf6y74ythiqulwfnshcdmddsdx3iqcenqjos5cct@zkcw7g5ieei7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf3v4dn233bf6y74ythiqulwfnshcdmddsdx3iqcenqjos5cct@zkcw7g5ieei7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_030620_259385_E4ED0C73 
X-CRM114-Status: GOOD (  23.13  )
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

On Fri, Sep 19, 2025 at 09:52:20AM +0000, Quentin Perret wrote:
> On Thursday 18 Sep 2025 at 19:00:49 (+0100), Vincent Donnefort wrote:
> > There's currently no verification for host issued ranges in most of the
> > pKVM memory transitions. The subsequent end boundary might therefore be
> > subject to overflow and could evade the later checks.
> > 
> > Close this loophole with an additional range_is_valid() check on a per
> > public function basis.
> > 
> > host_unshare_guest transition is already protected via
> > __check_host_shared_guest(), while assert_host_shared_guest() callers
> > are already ignoring host checks.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 8957734d6183..b156fb0bad0f 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -443,6 +443,11 @@ static bool range_is_memory(u64 start, u64 end)
> >  	return is_in_mem_range(end - 1, &r);
> >  }
> >  
> > +static bool range_is_valid(u64 start, u64 end)
> > +{
> > +	return start < end;
> > +}
> > +
> >  static inline int __host_stage2_idmap(u64 start, u64 end,
> >  				      enum kvm_pgtable_prot prot)
> >  {
> > @@ -776,6 +781,9 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
> >  	void *virt = __hyp_va(phys);
> >  	int ret;
> >  
> > +	if (!range_is_valid(phys, phys + size))
> > +		return -EINVAL;
> > +
> >  	host_lock_component();
> >  	hyp_lock_component();
> >  
> > @@ -804,6 +812,9 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
> >  	u64 virt = (u64)__hyp_va(phys);
> >  	int ret;
> >  
> > +	if (!range_is_valid(phys, phys + size))
> > +		return -EINVAL;
> > +
> >  	host_lock_component();
> >  	hyp_lock_component();
> >  
> > @@ -887,6 +898,9 @@ int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages)
> >  	u64 size = PAGE_SIZE * nr_pages;
> 
> It occurred to me that this can also overflow, so perhaps fold that
> calculation into your helper as well to be on the safe?

I believe this is currently fine everywhere because nr_pages is solely used for
size computation. But happy to use nr_pages as a range_is_valid() argument
(instead of end) to verify size as well. That'll surely be more future-proof.

Let me respin that.

> 
> Thanks,
> Quentin
> 
> >  	int ret;
> >  
> > +	if (!range_is_valid(phys, phys + size))
> > +		return -EINVAL;
> > +
> >  	host_lock_component();
> >  	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
> >  	if (!ret)
> > @@ -902,6 +916,9 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
> >  	u64 size = PAGE_SIZE * nr_pages;
> >  	int ret;
> >  
> > +	if (!range_is_valid(phys, phys + size))
> > +		return -EINVAL;
> > +
> >  	host_lock_component();
> >  	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED);
> >  	if (!ret)
> > @@ -949,6 +966,9 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
> >  	if (ret)
> >  		return ret;
> >  
> > +	if (!range_is_valid(phys, phys + size))
> > +		return -EINVAL;
> > +
> >  	ret = check_range_allowed_memory(phys, phys + size);
> >  	if (ret)
> >  		return ret;
> > 
> > base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
> > -- 
> > 2.51.0.470.ga7dc726c21-goog
> > 

