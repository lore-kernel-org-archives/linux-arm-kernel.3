Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253AACD3447
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 10:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DTS0qUVxwfbisiyGTh7vOJzKa4BtZMrsDae9RELKmk=; b=w9BQIi9NWzx6J/uNHnwQMY1joT
	cLZ4Hk0u9JgrCk7XJ3A48jYnIYbTrQEw0t/eDyZsypRUmmaIWwZXLzChzwk+GESoNT9UOjJLwR0X/
	OMNKuliQaCWKc69p6DmUDXp9t04Ecw6hhE0Exg9mWt/hdszzp5RNluq/tCb/b1G/GLZ+9KbYL/Fhq
	2t8UKhfZ3o9TwlJz6HQr9bOHG9L/eQ79G3jAOP9+yt8fAzWuMeajYmeGJo26fVulVjKvDTK81WNpI
	OaVytc0FJsPF+ts5e1GVJbpDWWvS8N2gjM5qDJXX0aowE4ZUzUreAQ/PLnltCc0npHc5eFoxoxs0g
	rBVZqOng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvjP-00000003SLT-4Bh6;
	Thu, 07 May 2026 10:13:24 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvjN-00000003SKp-1XhZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 10:13:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so69905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 03:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778148799; x=1778753599; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4DTS0qUVxwfbisiyGTh7vOJzKa4BtZMrsDae9RELKmk=;
        b=LqWA9sdL4GtE8AMzztywQgmvHZg45Aoqac29QQh9x6eX5Z0KMhzYPb/FLaltpKnjfe
         3V/Vlpih6wT0V/0RXJSYc87eSrvkMF9JEMvJ5ibLBGmo3xaNzsWk//CzDujktdv2+x7M
         GdDN+abp19QUufqqg7RywGd00MDou/SjacvkvNUpYyOAhAIRRLp8a3kRPagoQX8X1CdI
         uQjUYn5y9nUwn1zZgTyY+bIWz4YauJN1hcPHBA+7XixIRMa6rJO1DRz0ZJpH495xtM1p
         wgquXCYhnfbnDm8Q5A3OgioVdfK/Yc7Hp8+uXZa55TmdBIz4xATURxkzkRhn0wGQZonv
         HPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148799; x=1778753599;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4DTS0qUVxwfbisiyGTh7vOJzKa4BtZMrsDae9RELKmk=;
        b=OqTsoRofoDfVRDMsINnFJ1X68VNHKP+27o5+IDb/fEaU41xaOraoRnS/8unznMo4QJ
         ++VfMR5BZ+AuQmBJt3zg6ehu9v9A7z/4e8n1uMNFTuXyySLtV8DgVyZoMYipbByOHTKN
         Ho+m8kza2PtHiD+tSMIjZ8sT9vEvaaUmZS7H9hOz45RPzZ4gMx/kkehnqU/8ueWz29bF
         LSvDnHTjaWPdVLMIQ6rtAx/uHFwFtSoMKKK1Km7phkG8t83R5DeaIyhj2RQxpUGVLeOA
         dU+gHmvZapLFYzL51FAXreKdZxIDaMjMMxy3RTzp9p9etW+moDgRDZ6UoXst84brmMnX
         +aVw==
X-Gm-Message-State: AOJu0YyH9X/gdyh9Q98jwGUb66qAXJcriDKP1nZyuzhD09xZ7eUtUAus
	wpPM28YIccguLbeNBMTeLHCBCm3L2Nr+cDsu3lzbhz50U7YKL711IdpdUZpVJ/oVgg==
X-Gm-Gg: AeBDies3i0dPoCzMzuSR4S8d9aW0JyhCfWHoP2a55QQhkwo9HysT5G77YajHMXmblLK
	huftuzYPTY0jyirnmcG4zn2J641G92DCdhDMVasB/3CIFT/O74eAkqeyv/hiPIqXUv/1jrnel2n
	0K/QjUjan6Eb/hV/1lgVbBkHzmbbgx9xOM+nD16iFaXLQnTxr0peJh4zWuRz6hd7D0hnfq6cIoN
	hUc33GTVhJ4yHRVNw0gxRH43ITNhRsD89ICMS81+BH0HPhA2Z0xo0gnYIKSJSiNjCD9dXNE1JiU
	zRslR/UvlCQGCSVb7r2Gjl1nbcbxH0UKFlUltZwMG9qkX5ka3nwiNf1hT6Nr0f8vtE6SLOSlDNj
	2uJ5IdnlORlCsQ+anJq65RJqmyNnpoqf2/NueHnUqc4EfHjS8JYzw5fyFrKj2R0p6xPZiRZYegV
	2s5aHxcL/uvR6sEftPiHQo1YjcPBGQBljSmsTxcqxdoUEf86QdCSemJguTk+cCj1mjEfYEUMLKe
	YiH6w==
X-Received: by 2002:a05:600c:8886:b0:483:6a76:11a6 with SMTP id 5b1f17b1804b1-48e52d0a2cemr1856915e9.5.1778148798935;
        Thu, 07 May 2026 03:13:18 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530fdc50sm57573975e9.5.2026.05.07.03.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:13:18 -0700 (PDT)
Date: Thu, 7 May 2026 10:13:13 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 05/25] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <afxlufh3t3hRe4-G@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-6-smostafa@google.com>
 <20260501124716.GD6912@ziepe.ca>
 <afiODW2sVMeOj3Ag@google.com>
 <afoagb/wVBJD1IX+@ziepe.ca>
 <afofSPQbepd_fpom@google.com>
 <afsQTwO3eW+Ks2fe@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afsQTwO3eW+Ks2fe@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_031321_428641_9DFE18E6 
X-CRM114-Status: GOOD (  39.15  )
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

On Wed, May 06, 2026 at 06:56:31AM -0300, Jason Gunthorpe wrote:
> On Tue, May 05, 2026 at 04:48:08PM +0000, Mostafa Saleh wrote:
> > On Tue, May 05, 2026 at 01:27:45PM -0300, Jason Gunthorpe wrote:
> > > On Mon, May 04, 2026 at 12:16:13PM +0000, Mostafa Saleh wrote:
> > > > On Fri, May 01, 2026 at 09:47:16AM -0300, Jason Gunthorpe wrote:
> > > > > On Fri, May 01, 2026 at 11:19:07AM +0000, Mostafa Saleh wrote:
> > > > > > Move parsing of IDRs to functions so that it can be re-used
> > > > > > +unsigned long smmu_idr5_to_pgsize(u32 reg)
> > > > > > +{
> > > > > > +	unsigned long pgsize_bitmap = 0;
> > > > > > +
> > > > > > +	if (reg & IDR5_GRAN64K)
> > > > > > +		pgsize_bitmap |= SZ_64K | SZ_512M;
> > > > > > +	if (reg & IDR5_GRAN16K)
> > > > > > +		pgsize_bitmap |= SZ_16K | SZ_32M;
> > > > > > +	if (reg & IDR5_GRAN4K)
> > > > > > +		pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
> > > > > > +	return pgsize_bitmap;
> > > > > > +}
> > > > > 
> > > > > I think this should include:
> > > > > 
> > > > > > +	smmu->oas = smmu_idr5_to_oas(reg);
> > > > > > +	if (smmu->oas == 52)
> > > > > >  		smmu->pgsize_bitmap |= 1ULL << 42; /* 4TB */
> > > > > > -		break;
> > > > > 
> > > > > ie it should return the supported page sizes by inspecting all the
> > > > > idrs and don't leave this tricky bit to be open coded..
> > > > 
> > > > This way was easier as each function only returns one thing, otherwise
> > > > we have to pass stuff by address as we can’t pass the smmu struct as it
> > > > is not shared between the drivers.
> > > > But no strong opinion, I can change that.
> > > 
> > > Could you share the struct? With multi-compilation you do get two
> > > structs with the same name and different layout, it is OK?
> > > 
> > > That would give a cleaner setup too because you can just shove all
> > > this into a function and have it setup the same struct which is more a
> > > copy and paste than break up into little functions?
> > 
> > Yes, that’s possible, but I didn't want to contaminate the main struct,
> > also we can’t compile the main one for KVM because of things such as
> > “struct device, struct mutex...”
> > May we can do:
> > - struct arm_smmu_device_common: Basic stuff (ioaddress, features,
> >   oas...)
> > - arm_smmu_device: For the main driver which inherits arm_smmu_device_common
> > - arm_smmu_nested_device for KVM which also inherits arm_smmu_device_common
> 
> Less keen on this, it would need more usages to justify it
>  
> > What do you think?
> 
> I was thinking more like
> 
> #define arm_smmu arm_pkvm_smmu
> 
> Before the pkvm compile of the shared code. 

Oh, so we rely on arm_pkvm_smmu and arm_smmu having the same field
names and types?

I don’t think that’s better for maintainability, I can look into it
if Robin and Will are OK with that.

> 
> How does pkvm compilation work anyhow? Is it all rolled into a unique
> link, or do you have to worry about symbol conflicts with the main
> kernel?

All pkvm symbols are prefixed with __kvm_nvhe_ in the main kernel.

Thanks,
Mostafa

> 
> Jason

