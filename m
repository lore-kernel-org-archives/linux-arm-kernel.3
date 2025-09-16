Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489BCCAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 14:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CT4KnFMC9K253+uFB3sGHZvOxPtog/sC9euCmcEFSfI=; b=qatFKr3h9JNza2m+e064G/0CqE
	x1cvJ/jq1VKLY3GpRfYdknQne0epQVcXgnRyTviM3KLv8/n2y2BFL61PyOkVZmoAGuqKnQhW1uSnr
	7fnUudocwufj6UmL+e6BnT/CPJ/A8AOLJUbsoSHRc+3EbIYCB3k4tST/PtGGMZ0dLb3X2SGB1kEqy
	y2PaRvqWLl/4IpBy8FHt3cVoAFzqrA5STyXWZr6QReKoYEXpmJ1wbzybQOvaCHFOpiSJp4/CCDYD0
	Ux+38+rt1Sa77ZQUBM26n3fC5OFohYh9VK58vs70LuCJ/LVsvYl0W3wHY1YG/+9n9ci9TWR4voOpV
	AGT8364A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWlw-000000088yW-0542;
	Tue, 16 Sep 2025 14:35:08 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWlu-000000088xC-1LnY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 14:35:07 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45f2f894632so57345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 07:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758033304; x=1758638104; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CT4KnFMC9K253+uFB3sGHZvOxPtog/sC9euCmcEFSfI=;
        b=vys1l9B9lE7dAfG3EPY+dcxJjEYRS+Fj0TzvZTKcPgBMAjYIwb3UN3X9PlX434Y79c
         gTLC5yotz5myCoB18/cKv/c2URIk8njcYhvHCPJLgZRIZKynCRomWpnQFNrVLEqJfCI/
         L3eUyQwWN8+ORbTj4+y9h7j/NdSeJ2noLXRbUZZ0KegNkH/9nUzkuWroqIqc8EANg03f
         8y3TYOjQbbkIrOYl0ZjDeLJO+c0vXi/9hCcfEPDKcY6VJuQh2UCHCzuJN6xtJROCkRKE
         tK/WLiqneM3iqhIx+9aoKC2jJIMNKgOETqJstfBcFenbALKbyrnvgsK0lW/IOm2/HKYl
         gN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758033304; x=1758638104;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CT4KnFMC9K253+uFB3sGHZvOxPtog/sC9euCmcEFSfI=;
        b=RqPuhgMzU4a5bibRAlv83YniVcNo2GIfMYmmtl9T7dhsqJMq+AcqdL1ekEUcOQFHsP
         oU0xAe0A960t4343+tzsBDdqj/K7DTLV1OM1WokSobDAr0wsZNw2Ys99r/P0liU66ppr
         ljtzM4F5SmNB61M/ztwdP/TwyzwEaW9XD+B4twcj9LgAuC70wWq8+G7+vNThFf/Qhhek
         d7+QRtOeO0qPT5kv73WwXNbAaeRRkWCI0pFy9X4rB4iQUBRjxOdRyt3LoYT8zYJZ/0tP
         gNkj9+10y+YrQM8mVKPIdeOCGZ86Rhyy3g9ZRi+D2DjjmHKKSA29sXBINQD7IzHgAqR3
         59Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVhdy26XxruYO1SRiykbfalImZBzFlrWq2O9nNA2+UNZCHGiL5e0Iw55D90CeliaNpWUsnHJxnJzT0vzzgwh06J@lists.infradead.org
X-Gm-Message-State: AOJu0YxSP67J7jGTYQIZ/NHCqqb4zfbDU1gK7Nq253xTqIvPepBzogcy
	pbMSwr5zbmuMZgKPRu+E6MbtEqFUwwOUrUZGpZfmcxRcfI6Df3o/0wHvRccdR9CTwg==
X-Gm-Gg: ASbGnctcKA6beFZOfNGHrX4SkQdchE8wrlUVhdP6OhQ60DEfxx/oI3T55mqd3uMVj5M
	Wf8iWxc9/Z4K+LE3Lg8iWgTyZwlJRnpk4oyGjVYREwm66kLUxyZaYrLVHK4x+aOjmRSqVyKgWlq
	VtKPMfD/IyuMRwvHVGQWIMPsdpbO/fF7R9G02RoF6vPXDFL/ZSFXHSnR0skVp45BmYh4vHaYo0i
	Zq7UBf7MjtNmcKx+wEtPRErouavXopq+HmnUIEMzBF19BBKY8bybcBrEUdXiCukOiI+tZN+Wel+
	WXWZVAvTIEvwybeCj990ldVXNmjzpaRi3bXJgp5RUm3Gxc2HnnDXMieVNQWGEyhmEYna8mLiOAz
	j0zc2kBHSK0K8FbWDj0qznyVf/1FtQNjguvjDgvQmRyuUfMRmqbDazQvbEHnRJbxgbGI16A==
X-Google-Smtp-Source: AGHT+IECpwDExsg0Dr7B4qD1+CeVxxyJjTc2PPzhq2qhSmxiB4I92vX7At74X9XKcTLJsKMwvH5o1A==
X-Received: by 2002:a05:600c:8b35:b0:45a:2861:3625 with SMTP id 5b1f17b1804b1-45f320ea2dfmr1951735e9.4.1758033304305;
        Tue, 16 Sep 2025 07:35:04 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9cf04db65sm10884027f8f.3.2025.09.16.07.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:35:03 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:35:00 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Daniel Mentz <danielmentz@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 16/28] iommu/arm-smmu-v3-kvm: Create array for hyp
 SMMUv3
Message-ID: <aMl1lCvuKQFfOhNb@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-17-smostafa@google.com>
 <CAE2F3rDc-4SirDDrQeZJQDqjdv67-QFfQhHfwyd+O6f5OsBSpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rDc-4SirDDrQeZJQDqjdv67-QFfQhHfwyd+O6f5OsBSpw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_073506_366799_A25793F1 
X-CRM114-Status: GOOD (  14.35  )
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

On Tue, Sep 09, 2025 at 11:30:48AM -0700, Daniel Mentz wrote:
> On Tue, Aug 19, 2025 at 2:55 PM Mostafa Saleh <smostafa@google.com> wrote:
> >
> > +               if (kvm_arm_smmu_array[i].mmio_size < SZ_128K) {
> > +                       pr_err("SMMUv3(%s) has unsupported size(0x%lx)\n", np->name,
> > +                              kvm_arm_smmu_array[i].mmio_size);
> 
> Use format specifier %pOF to print device tree node.
> If mmio_size is a size_t type, use format specifier %zx.
> Align language of error message with kernel driver which prints "MMIO
> region too small (%pr)\n".

Thanks for catching that, I will fix it in v5.

> I'm wondering if we should use kvm_err instead of pr_err.

I am not sure, kvm_err seems to be used from core arch code only, but
I don't see why not.

Thanks,
Mostafa


